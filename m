Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91241FCB632
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpHEtkKEt27qKYsCQNbRMY8Ov3A/NKjia9BhRR2Ljyc=; b=FLbmEl5EgOo67VkGJk2uOMAfC7
	xK7isRL37K/swnaFVhLU6Gyf/k0WLkW56FJl1Oqywkgl4E2gshm6PJenVD9OxMnnrOGvaZ/m2DnJa
	EdiETHEYokEzLO+eGpPGJRuD6o+lRm/1K8qFAP12Y8vpX+8PpYl3kdP23eJjOP/BRbY3TbwXwzM4e
	RcmJ2WkZNaBu8Gy6RaMsgZi5aSLZQhAN2MR46X5BGbV00ll8jNs+vH92G/qjLAGjdugf3M89uRY48
	PWtNePTY5UQKa6cdR72eA3CBFGAENPSyY33WTGheH26JYTqea6k8SMzBEb5SPBeg7xq13PfNePzsj
	9DueWN5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYg8-00000004CdU-3IU7;
	Fri, 06 Mar 2026 17:09:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYg6-00000004Cca-1vhW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:09:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9A4E41521;
	Fri,  6 Mar 2026 17:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D72C19425;
	Fri,  6 Mar 2026 17:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772816969;
	bh=iE8TJ62f6uMzW9uqVWzvpfHVO0KL3OXm+i7JJ3rnjXM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e9PmJ/P1wJNK7L7GtRPNZ5MY6bM3hiHOfjJ5HcCZarS5eSSXgVVN30Yn3mVVBhBZj
	 pLlsCfDPt8F8FKqPcBGoc+fUS2MZFFeqBOU7HQaZLInf3BwyJfT0Olf578QuaelbCw
	 fvvj4CWDApGkB9PbBtdfWdm3w38W0VYYq4gafaGzE86WA009wIgELwP92lXGWAmzSf
	 v+HAqo8Z5tAiqEn1CjQl1A7QTP8w2DEXdtPlBX/Vk3614c/8xJYXkiyXb/9rIgXM4t
	 4iREMm9wkR03VtDJcm70SgGtUUPYaJbQ2q1XH+oFDtPaTitjj5HdQCA/CO6SJ+JXQK
	 I11X4uIuyBkeg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Mar 2026 17:00:53 +0000
Subject: [PATCH v10 01/30] arm64/sysreg: Update SMIDR_EL1 to DDI0601
 2025-06
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-kvm-arm64-sme-v10-1-43f7683a0fb7@kernel.org>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
In-Reply-To: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-6ac23
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iE8TJ62f6uMzW9uqVWzvpfHVO0KL3OXm+i7JJ3rnjXM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpqwopL4waf4p9vIMTbtYH6LENXlVn+f/cqmjsa
 Gdyla7fQIqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaasKKQAKCRAk1otyXVSH
 0JxrB/9RFY+pwbrQCPGwKr6YbGcoYjU1PRHwuApHAbOf28EIZ5uMZf08eL9SqxsVkfel04R2+bs
 QTtPo1HP4dt4Hm8Tgz2+qKEbs+DiIKiEcHQfiBne1a0ifw5KcJmp2/IzpvACHBWdTB9EPAZUxTC
 wMqR6t9HXSR3brPy+4mukOQoQFG5ZiOV16acdUeulDxWngWFx89RJhXy83DLmdbca+2yllaMZWQ
 RonPJZnDaXxTX0uJdw3jdtzmZom3eeWsjTCDJH8AXZL3azOpPzrbsuMV5y3RoiUk3a1HKHqdGPF
 YghzNGPRQ0EvCxWOy7HpmaIstjomKnzaUF0tmmAKQa7Tx/BJ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_090930_527159_AD5AE55E 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

Update the definition of SMIDR_EL1 in the sysreg definition to reflect the
information in DD0601 2025-06. This includes somewhat more generic ways of
describing the sharing of SMCUs, more information on supported priorities
and provides additional resolution for describing affinity groups.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 9d1c21108057..b6586accf344 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3655,11 +3655,15 @@ Field	3:0	BS
 EndSysreg
 
 Sysreg	SMIDR_EL1	3	1	0	0	6
-Res0	63:32
+Res0	63:60
+Field	59:56	NSMC
+Field	55:52	HIP
+Field	51:32	AFFINITY2
 Field	31:24	IMPLEMENTER
 Field	23:16	REVISION
 Field	15	SMPS
-Res0	14:12
+Field	14:13	SH
+Res0	12
 Field	11:0	AFFINITY
 EndSysreg
 

-- 
2.47.3


