Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EE3C44508
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 22:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6N75Ip0e2UbcuvkSUVcoFLBJD3su3VCJTRAaxl2PPE=; b=C5DUBZPKDDBAZEO2sEZCbvrP+E
	lLXKfI1xSNSk40uLfHJW0saWvVL/eEqxgss5O2IXA2Uj9cyLV1UwtZ/OAQksxKytMfK93mcCTec4e
	VaR0wqvGsd9KTvKPv3Uk1NnvnO4caEUudCG3LHd7lQLfxZEkQW+YKjhx+oB5MIgBPMDqgNaD9bvly
	ipRM6ptklO43aAl8nVqPK0jkRl6Cj8ezaKeir9hCoHGF2OUmP7Q+6i93y8Ic5afRVt4ePZ9knwY0i
	Il0OdhrWusp60UhihLS8wmymDvKMHm/ICk8NQSLHRAlhl/cQ8URs2/6ualRfn0/su4KutZJdT/kne
	jZ5Twn5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxMw-00000003nzV-1EOE;
	Thu, 09 Jul 2026 22:37:22 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxMs-00000003nwN-0jHT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 22:37:19 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-487059fb570so484516b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 15:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783636635; x=1784241435; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r6N75Ip0e2UbcuvkSUVcoFLBJD3su3VCJTRAaxl2PPE=;
        b=cX5OHPUCvsQIR92Ryyi0vFd4r6zSQFKXmiMBAbAmNTTjP2Q+b/SJDcvySQl+mnZTZo
         lyRLqTNreXlVQC2aGVYYLPZth2h/5WAOwW3CG7tbmuFB/6RbQ51n/bCbpqZniXNRZ8cq
         /5LaOhKH8IBvbXTIfCvMNuoHaNa0ELc43s3Y5uujpohMTbSBe057CPPbavZheg+khaf1
         sI6XDP1qhXwpQLmhv6pKcBsC442ZW5rOkmP9TEZycK2p319e8gK+vSuLeBYNKquR6i3l
         lZqqagSy/JpXIvNEMmxesNfzdlQXS25/tI/vA5SYGQAyOIxcH98wnt2Nq28+A5RgmAH4
         eInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783636635; x=1784241435;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6N75Ip0e2UbcuvkSUVcoFLBJD3su3VCJTRAaxl2PPE=;
        b=gbzjSMKCFEeVIkXrAG9/OISvYazGcJJ2h2/IrOnXoOaVVcyGxrhJc1kg2AEgOe0Nvh
         sTH01MA7SKFAvA18NoRmhl50yFKbX6UpEl1dnsGtX28mXpVbHB96RYBwdlxkgcL+rhl0
         rdOh2bpyc6r5b3gxdOeZ3DBUObZ7bZqcZqEBPciFD2dTZbtA/fr39sp25xRgg73AeNe/
         n2uizYseKxHLfhyB/3wHFEeOIzyCGXSOMVAHrhDTVmLqvelv0tF3Z3bWEizOFH+7sJWS
         D/biIXrfQVaXWEQI/KtEmTv5K/tj2JYzitJSdMd7FVpUcUaiA6duPqqrKJ1HmLKCSlS2
         4eSQ==
X-Forwarded-Encrypted: i=1; AFNElJ91jOfDvxSJJvomBpo9jxvFb5gx/8W8+nub6wCcc5/DeqfHLoetivoeWZGKCjYCRkAj4r66ja/LwdS63P1hwygx@lists.infradead.org
X-Gm-Message-State: AOJu0YySINIAv+k785+L015b+F0A0kooXV+2bRbKOnckNTzJf9p9aAQW
	NEWEx7VkwGU6Ua0NA/j7/yePU+jPQdfmdz9J3zZc9vUM7LOAlaDPHx/i1b0MftFbS8ok/+S3NhM
	/AEbz4HJwd+XkhSFo2mp2lsvXwg==
X-Received: from jadk1.prod.google.com ([2002:a05:6638:1401:b0:5e7:1c51:6f8b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1206:b0:495:e997:528d with SMTP id 5614622812f47-4a201bf3c63mr5975498b6e.3.1783636634820;
 Thu, 09 Jul 2026 15:37:14 -0700 (PDT)
Date: Thu,  9 Jul 2026 22:35:58 +0000
In-Reply-To: <20260709223604.12934-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260709223604.12934-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260709223604.12934-2-coltonlewis@google.com>
Subject: [PATCH 6.6 v3 1/6] arm64: sysreg: Add layout for ID_AA64MMFR4_EL1
From: Colton Lewis <coltonlewis@google.com>
To: stable@vger.kernel.org
Cc: oliver.upton@linux.dev, sashal@kernel.org, gregkh@linuxfoundation.org, 
	mizhang@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, ahmed.genidi@arm.com, leo.yan@arm.com, 
	miguel.luis@oracle.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_153718_213361_68983208 
X-CRM114-Status: UNSURE (   9.13  )
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

From: Marc Zyngier <maz@kernel.org>

[ Upstream commit cfc680bb04c54e61faa51a34d8383a0aa25b583f ]

ARMv9.5 has infroduced ID_AA64MMFR4_EL1 with a bunch of new features.
Add the corresponding layout.

This is extracted from the public ARM SysReg_xml_A_profile-2023-09
delivery, timestamped d55f5af8e09052abe92a02adf820deea2eaed717.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Miguel Luis <miguel.luis@oracle.com>
Link: https://lore.kernel.org/r/20240122181344.258974-5-maz@kernel.org
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/tools/sysreg | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 76ce150e7347e..f7180d391f829 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1669,6 +1669,43 @@ UnsignedEnum	3:0	TCRX
 EndEnum
 EndSysreg
 
+Sysreg	ID_AA64MMFR4_EL1	3	0	0	7	4
+Res0	63:40
+UnsignedEnum	39:36	E3DSE
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+Res0	35:28
+SignedEnum	27:24	E2H0
+	0b0000	IMP
+	0b1110	NI_NV1
+	0b1111	NI
+EndEnum
+UnsignedEnum	23:20	NV_frac
+	0b0000	NV_NV2
+	0b0001	NV2_ONLY
+EndEnum
+UnsignedEnum	19:16	FGWTE3
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	15:12	HACDBS
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	11:8	ASID2
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+SignedEnum	7:4	EIESB
+	0b0000	NI
+	0b0001	ToEL3
+	0b0010	ToELx
+	0b1111	ANY
+EndEnum
+Res0	3:0
+EndSysreg
+
 Sysreg	SCTLR_EL1	3	0	1	0	0
 Field	63	TIDCP
 Field	62	SPINTMASK
-- 
2.55.0.795.g602f6c329a-goog


