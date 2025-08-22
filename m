Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273A7CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 07:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTOnYZFLkfdWX5mXxYaZWrKAd2btjaQEGUSqE21aWz0=; b=SPti/BLR2Q3yVW88ofmkX6LPcx
	ENR/R0n9wNRQ4v0VgmBIYzUUb3KW5co3mW7fwXc+kikdMsxhEmYCYPC+kl2bEuh7Z4gnH6TODHrhV
	P/jsATrwD6cieGAtgUy/pXPJupftPAQVjx4M8EVozPbNIdhITTpoZcOS/uoj89m6rTvieyjKAyQ5w
	sVP7A4Zx5QiHA1BqbkFCiEth2EXB27m7t8BrxxizNXA0ekyr6f/0RE8JVrS9ez9Vtb9bhu9Lpskpz
	uXdc8v49xAqWXn5rMnx6B1a6sdHvBcZWLIPnd7AGJix10HHpxOSQv6GB3QRUIIPS+teyMUvo1DFv5
	9gjHpH3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upMEq-00000001p3S-0NQR;
	Fri, 22 Aug 2025 07:31:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upH0f-00000001BsV-1VTO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 01:56:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AFAB4404E;
	Fri, 22 Aug 2025 01:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6900C4CEED;
	Fri, 22 Aug 2025 01:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755827765;
	bh=ApIjPu6tr41pN88JrHKurRe18MYIB0RS0vVGxBjI5iI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qwK4r9Py1WNdLXRolIsS2xDD8JZJhqzFwqK+ySVueAtJyHFnEQPFhxQfXvud2TzED
	 AYF1c7+e2p11M2YJHpEuisx5nOTdu2hxjXXLVmBSqYAdD2lS3WYP/oKCAA1QX++V1q
	 XVjl8YMs/q4b3awokyte6bcF5GeVev3zYfeQlVraKxZQuOFRobv0CWwxSddUljpBDh
	 m8wu3T/SfYqaCtXCwNljFPSugY4tG0M/0FJj1yxzeeOJNR/5f3nAkCS9mWbLb5OfHM
	 tWcyM4e5vZLk0/lrGq0g+hJmxHkjNDi2K4tkjymW4vzCLvgrK6TDntzNJie2XU/dxb
	 CgVMyZBlGmuWQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 Aug 2025 02:53:55 +0100
Subject: [PATCH v7 26/29] KVM: arm64: Expose SME to nested guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-kvm-arm64-sme-v7-26-7a65d82b8b10@kernel.org>
References: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
In-Reply-To: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ApIjPu6tr41pN88JrHKurRe18MYIB0RS0vVGxBjI5iI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBop83MctByn9lZGlMQrCOz++sZYZV3/BxfsPz/F
 KPOJwdzE3qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKfNzAAKCRAk1otyXVSH
 0F8yB/sFH7V+bkn2VfS0isUHveeJS62fiiB5c3YS3JAVQ41jZpkvIm2k6AAkqorbB6LxXiwdkrZ
 rx3xTr8Q3KUrjWok7+55CSTU8K/SNKwH2OYYXXYsFKjEPtA7KN+Aaw63IUzqgSmDrovAOUH6SI+
 5Yu0HHJ9CyKK/ghNSJD8QwerdqfyQXeZXucZ62++Yq/02G1e+wJTAyIC2tvqGYcoTEE5z0aKR9D
 VAdEUMAvWAo68qn1FSBneDg6JvJr+TB57KF1XNmpEvHVn5MCTCe8SF7laOSI+ekUFdbhhT1GS/b
 V2ByGttxzG+ZONQtxG4WC8NuL7b3NowIv5Z0Gmfe//B90HqX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_185605_421918_33516106 
X-CRM114-Status: GOOD (  11.37  )
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

With support for context switching SME state in place allow access to SME
in nested guests.

The SME floating point state is handled along with all the other floating
point state, SME specific floating point exceptions are directed into the
same handlers as other floating point exceptions with NV specific handling
for the vector lengths already in place.

TPIDR2_EL0 is context switched along with the other TPIDRs as part of the
main guest register context switch.

SME priority support is currently masked from all guests including nested
ones.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/nested.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 153b3e11b115..804694f2dc9a 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1458,9 +1458,10 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		break;
 
 	case SYS_ID_AA64PFR1_EL1:
-		/* Only support BTI, SSBS, CSV2_frac */
+		/* Only support BTI, SSBS, SME, CSV2_frac */
 		val &= (ID_AA64PFR1_EL1_BT	|
 			ID_AA64PFR1_EL1_SSBS	|
+			ID_AA64PFR1_EL1_SME	|
 			ID_AA64PFR1_EL1_CSV2_frac);
 		break;
 

-- 
2.39.5


