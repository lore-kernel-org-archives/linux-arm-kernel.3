Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78408C44521
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 23:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85yZYCsmLUumgp2Ut8btqefYFUysunePTPypRChJllc=; b=4eAI7MiRst76TS0lRe7Bf9ToqI
	pFyqnELVC8u43R64xLlQuyEZMXw4jJwbscJvjqC5QCyAh5A+DuIHIBsc/pt2HoJy6CEuaJ9+qFwEO
	n2uC+cNbzVbCsWfuS8CqYiYsIsXTFEdACQRQoMLiYHNOkkeaDhoOuhQVpjKPkCdqQC6iBCzbY86AZ
	sMc/me1esY/hLko1J8zbT7XTLX2SCbhNuDcGL+wcZJNwmqdc77tiioUzzGfxucu88Hwu58CGdIe7P
	gzr4bL/LuhtARlawHA+sPZOQTFnlAiqGmQzI0rKL2vQ0f4wabmHL4lB0KQ6nxcbouslA4PnFYp4Mf
	dpucOGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlaeR-00000005SQK-0iGS;
	Sun, 19 Jul 2026 23:10:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlaeO-00000005SOL-1pNG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 23:10:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DB9DC60A77;
	Sun, 19 Jul 2026 23:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD68A1F00A3D;
	Sun, 19 Jul 2026 23:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784502623;
	bh=85yZYCsmLUumgp2Ut8btqefYFUysunePTPypRChJllc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UxtE5rYSJV7kiDY13Ngck1Han+RSfZGFH1OYfi7uOYOm7cGjAhna7ozNYUvGJdHVN
	 rWaay2ePSw2wh33cEgMfdjLX2Owic3mlYQIUuufoACIfprxzOYW45BT2wjvVJ+gDAW
	 Sns5+GfEmISgG7qTo+VAeXzIjaoJxOiSjaQ9OsImv6r1QI33xOGegutJTT07+wQHmV
	 7TcPjAQHB5FlxGWZV0hgisVN4wKEb3RujRJAE+/azag+o4+QbxekEc3ipLyz3vI8S+
	 Eb3ZL8ew8tx1DMpbIwzXtNClGqQl9rcdTNKn9W+HVpVNbh8bNQgon1eCqrmUfjioKM
	 +qTFYl53FZvqQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 20 Jul 2026 00:07:33 +0100
Subject: [PATCH v13 06/32] arm64/fpsimd: Determine maximum virtualisable
 SME vector length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kvm-arm64-sme-v13-6-d9abd3ffa245@kernel.org>
References: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
In-Reply-To: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vCPRPRr90nIU5ipka6gLN1cgvgNbXJf93goO/9YP1u8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXVks/jmqhVMG8IO8nHz8qNNomFhkac2J8q7Ak
 s3NYvOuL8qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal1ZLAAKCRAk1otyXVSH
 0LQIB/4/MNP+lcZla/p9yTUwxLsmBOqBakpA6WR2OAQmiT84K7TTqUwb46t+8XDWAKGFRCJiPif
 DptEpOaM4959PUGj/Xub784vEnIcgQvoMd3svgwB9oRrmxsn4Q6QbzZt9+mciYmQXdmACNtmUWC
 6DESysGrpyfchvENqdPNXouDccvPc0I/A7t5zAumyumZni6ErlkiTM931eaqA2fI5YXxAtwG4l7
 FlYcZkgdOOu4CBQinmxRkaHxXt2aZHvipZeiJdRAXxGGdTNR/H38kwLM5OkpROJJFMJqUx8HUlx
 /Fny0364G1vIaHTu9IrUBPH0HE12KdQklQ0vslAIR3uEFnqs
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
index 314f5d61be11..7f2c44bd9fd5 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1281,6 +1281,7 @@ void __init sme_setup(void)
 	 * minimum available VL will be used.
 	 */
 	set_sme_default_vl(find_supported_vector_length(ARM64_VEC_SME, 32));
+	info->max_virtualisable_vl = vec_virtualisable_vl(info);
 
 	pr_info("SME: minimum available vector length %u bytes per vector\n",
 		info->min_vl);
@@ -1288,6 +1289,10 @@ void __init sme_setup(void)
 		info->max_vl);
 	pr_info("SME: default vector length %u bytes per vector\n",
 		get_sme_default_vl());
+
+	/* KVM decides whether to support mismatched systems. Just warn here: */
+	if (info->max_virtualisable_vl < info->max_vl)
+		pr_warn("SME: unvirtualisable vector lengths present\n");
 }
 
 #endif /* CONFIG_ARM64_SME */

-- 
2.47.3


