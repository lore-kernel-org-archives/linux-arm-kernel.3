Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3B2C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRzgkCokkYWeOPF3FDrRjraYcAbGSe4f3k3UbSQ8tck=; b=JFJZ1bZs6pSXgZmX7r8HfMElrf
	gudSIEm+m/QnnMk59GUBYb7gyIWEwSQbIt5MsCS2mJXdPT17icsujaNOf6ZC7QXuI8JytuzQGgQeo
	H4/UEap7Vax7bYEi1zyPIBRSKwmaq9Gvwoy+7SWnPNkbMb5dpE872uAJQhi6lHDIRb/Od3C9/I2UL
	Hw7nakq0NAynwakRdc/fAUXCKcaZHpa/EvW2CX7jRJNVsa23gU/QysxGaDjEz+lMwX1sfcqCt4NNf
	QY6PfjeL1+ukoDUbjTD/8l+KqBUuhNW1hsYjAAYYwDJq/B3q8ce2eE1LFHdgmiumpuYyRZdGLeKBu
	B6qEP6Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtfi-00000003F49-2UzB;
	Thu, 09 Jul 2026 18:40:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtfh-00000003F3I-22zd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:40:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FF9440B72;
	Thu,  9 Jul 2026 18:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1BC1F000E9;
	Thu,  9 Jul 2026 18:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783622428;
	bh=ZRzgkCokkYWeOPF3FDrRjraYcAbGSe4f3k3UbSQ8tck=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KQAX3neiOuz3j6XpyVScVIur7/tIYm48onAevH1WIPGExJHl5QKuPc1pG04LZ+YQ/
	 4dVedeC0oERGdMtJ4F/+AJ/P9RtRYSus3ckR600OryhzGZ1C+b7pPC+l7NPHCZQUGv
	 73QQPjCM5xdZVmk5h3wUmPsn1UIf/hq6blUJzSAMcPvKFRlbuaplmIAhBnyhSYwfDI
	 d7GMBo0AfcQXWJQwI423AYf7Jz1CAtmTX2lKrnEV/JGIz4iKhQm7GT8Ik1lVQD0gFp
	 wZ1cIVttxAbFqXQXNOvPJXlyp81+3jNTvhfBz+yEwzKpxfGbEJVLuP+3wfLnPsKwpA
	 M4GfUFY7AKV2Q==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 19:27:26 +0100
Subject: [PATCH v12 05/29] arm64/fpsimd: Determine maximum virtualisable
 SME vector length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v12-5-d0301d79ef58@kernel.org>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1382; i=broonie@kernel.org;
 h=from:subject:message-id; bh=++3RupEjJl/hieRBq4Zb2DcRHMWp0Yu3DKnrxPa5BCI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT+ruBTZpBesslyexlMPN7whcGBMEloy+b7SKJ
 a0kvNcpKqWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak/q7gAKCRAk1otyXVSH
 0P22B/9is+2aIzwfmXnfruqye5Q2jKLRQ694PLF/utH8NN9EBPjO7Tqz1AY6U4XIewi3lSOynAL
 jUGSASt11mw8AyZhP0ewUZOzBqD0VmkO7ELDd0Zt//yfYlJOGttyV5pGHLe4VH5hS4vS+XZQ2hH
 qIXS8UbT1SDpvwe4mmABAkBV0baO8woClIqVz0u6GKxoisC+sn++1HgDx3rrVGP1icwqrT3y72A
 202AnsT8jabvhvcWIL/0p/aA4YnUjpkgAekX7frH36/TMHCl8NgW34Hz5ntVg2gyOWpZ7sMcgra
 kL1O0OMETpymbfTdqRWhmvUtDQ4f3XaQF8ScMZyOOEWVW14t
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

As with SVE we can only virtualise SME vector lengths that are supported by
all CPUs in the system, implement similar checks to those for SVE. Since
unlike SVE there are no specific vector lengths that are architecturally
required the handling is subtly different, we report a system where this
happens with a maximum vector length of 0.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 5c156e2a47ea..7c4e69fd3922 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1277,6 +1277,7 @@ void __init sme_setup(void)
 	 * minimum available VL will be used.
 	 */
 	set_sme_default_vl(find_supported_vector_length(ARM64_VEC_SME, 32));
+	info->max_virtualisable_vl = vec_virtualisable_vl(info);
 
 	pr_info("SME: minimum available vector length %u bytes per vector\n",
 		info->min_vl);
@@ -1284,6 +1285,10 @@ void __init sme_setup(void)
 		info->max_vl);
 	pr_info("SME: default vector length %u bytes per vector\n",
 		get_sme_default_vl());
+
+	/* KVM decides whether to support mismatched systems. Just warn here: */
+	if (info->max_virtualisable_vl < info->max_vl)
+		pr_warn("SME: unvirtualisable vector lengths present\n");
 }
 
 void sme_suspend_exit(void)

-- 
2.47.3


