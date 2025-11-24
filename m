Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A6ECFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 16:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x8SFzpOuhO5EV5iKn74UZD68ssvHanb60bdCcaWpzCo=; b=W9vpFTC24JTBYlrkRraFif12oq
	eUarNReaUNg1J9jhsFygnCvzF1WNpkY98nAGkxAYdBXi73IMcI3xgQZxHf7Bo5Uceg0CvLmHyUtaJ
	n0GnfLxm/SRY3ro6/gyfCG6FOwBvQJhSDvbRIQ3RUCAcv7EsXQPnZMMbz2vBIpBrlIb7sIkVbctah
	hopD0Ii2crlxOiN54DZxt5WdjT0HoB0UKzeEMelObQjqsynRT55WofzlZ7xwblmhfCQRnT1Dxy6VK
	CRzCJR/f+0/8PfIejzxNW45Cghp7XcgzHYIA0lBe/54ZUJQBhqdIgWSotHpPIkUiPR8cOVrGSrRiz
	fAEVDFVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZRz-0000000BzpV-3Bng;
	Mon, 24 Nov 2025 16:30:03 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZRw-0000000Bzoj-3ybj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 16:30:02 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-37a33bd356fso3025091fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 08:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764001798; x=1764606598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8SFzpOuhO5EV5iKn74UZD68ssvHanb60bdCcaWpzCo=;
        b=w/S9rWvgeLycacjbERRzOHNoHZ8hor5MKS7iTyw4DMjjx2gOgOBoz8EipCM4kSMEnj
         r1kQnDYcxUUYCOKegwGm/koZvLAOF6fsHPMqiGCEATo3eEjauuF75S6EX3T2caDNvpIG
         PjaCXzlH5uOPQYMh+u3MfTy9jzEQ3HymFuvvlELFJfOUiA+a95PA3Gun36HRBJId/xJD
         HFYXfYlx2d9/tLxZxjbay1YjhEml0epu4sZ9NMiseYXdMjFeHRfH7I2cUa2XIzsf6ejL
         XykgZNU4WBv7uf9210Ae04Br+ElgGVaVhWVq+ap3oCF/igxp0SLeSRFNjc1KoqztjO78
         a6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764001798; x=1764606598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8SFzpOuhO5EV5iKn74UZD68ssvHanb60bdCcaWpzCo=;
        b=KPY6fVs7LLbsLN+UCRrjU3pnrxXwh7IuBd8K3hEcjIFEX2gkOmKZcdg+tBoJzPoypS
         ojj1zwNBci5uaaTBZCA/mt3jGKfhM1Lt/wlM7+JQ0KMd56q67L/5IDPXuopzl694CSg7
         FvS7HeCQ4SpeS+urizhufdRZKVF6t8qG3vf7ltscBXl190zHzq1EgoKW90XUQcieiV7Q
         iUij5aEzgBC/BenOIthCKcp7MJYW8uIFw1Gd+CyGy9DOm2C1cp9FzyzAJmGyakhe0IsZ
         dj6uNSlfjzSlnvvk0t2eXuGDtveaZOk3PpXBn09RJ8ttkZvWh/cDE7lyP2oirp/xqiYT
         vQAw==
X-Forwarded-Encrypted: i=1; AJvYcCWcYKBKiMl99C7hT7Lca5be9RXwePm0DIAQ4HNaUv+dMb4Dr+64caYJbbtBOwwTNpKhLJc0txv09VPQuwLLMnXS@lists.infradead.org
X-Gm-Message-State: AOJu0YyHqwaNIf4Gti1BlfmniYTbHdTFJjp8iQIKuMIssqzXr5940aYf
	tq5fXx/helUg3u+yFJ2TptjNJ38rfZ36Jz9JTkBIPUN1Ofqu0i3koYp5HoQHyDvRnpq0dxerkxG
	yswS5
X-Gm-Gg: ASbGncsfKf+3eQvdl9f0F8XxD+rT4tVnD7tojSiLwrQzed3RQPxVQIIT+KBUyIHLjeo
	9deyiFwYKLWCWWB9hbfO7lZiRI5OGDIxo+qVnzn27o9n2Cx80gYQe7sHbPGygalfiyId4m2vgNy
	0jdI3jdWv0P0DQFHN4Cf1NffYOXi/1NY3kzBOuERNWlllFhoKyCTUpqvftgYCH2dFbSDESeytMV
	BjvKW9Z54VBDBvVvX/yriAWi8A3stspYJKMrrZtv0PJB9zdc1ksQhSpYymhzSulObQNc9nia/JQ
	/r6xUucICZd3ateJPt7uqwONTWIbDUjk7X03lxHNjI5BfbjCW87+vspRNiZKh7HiFT2US9fCWpB
	q3O3EbP+Ww9tJzmn4+w6olxuR2P+6/LWOhVFP3fESwceIowkzierBVroKEy+zEQucUU/FIMM0qO
	/XgeB9S00a1d8xjnkJw6BAj7E16OxmeaVX74DCwKF7Y0OTohOYk2IEJA==
X-Google-Smtp-Source: AGHT+IGZmldA/dcXthKfsFSI/Byy+Zk4BBl9hUAYfTjD9FcbnSy7TF6y62wi1hHTVinHRFed17AYiA==
X-Received: by 2002:a05:651c:31cd:b0:37b:926c:26f7 with SMTP id 38308e7fff4ca-37cdc1a7ba9mr17520421fa.2.1764001798220;
        Mon, 24 Nov 2025 08:29:58 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b63acbsm28357671fa.21.2025.11.24.08.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 08:29:57 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: cpufeature: Unrestrict ID_AA64MMFR1_EL1 bit assignments
Date: Mon, 24 Nov 2025 18:29:55 +0200
Message-ID: <20251124162955.3616314-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_083001_096022_6F17F99F 
X-CRM114-Status: GOOD (  12.82  )
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

It appears that 4 out of 8 Qualcomm SM8450 SoC cores do not generate
an SError interrupt due to an External abort on a speculative read,
and it is reported as a failed sanity check on boot:

    CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR1_EL1. Boot CPU: 0x00000011212122, CPU4: 0x00000010212122
    CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR1_EL1. Boot CPU: 0x00000011212122, CPU5: 0x0000001021212
    CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR1_EL1. Boot CPU: 0x00000011212122, CPU6: 0x00000010212122
    CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR1_EL1. Boot CPU: 0x00000011212122, CPU7: 0x00000010212122

Due to the failed sanity check the kernel is marked as tainted in runtime:

    Tainted: [S]=CPU_OUT_OF_SPEC

Unrestrict the ID_AA64MMFR1_EL1 SpecSEI bits, since apparently it's
a supported option at least on this heterogeneous SoC.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 5ed401ff79e3..df562b0f42af 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -472,7 +472,7 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr1[] = {
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_EL1_ETS_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_EL1_TWED_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_EL1_XNX_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_HIGHER_SAFE, ID_AA64MMFR1_EL1_SpecSEI_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_HIGHER_SAFE, ID_AA64MMFR1_EL1_SpecSEI_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_EL1_PAN_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_EL1_LO_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_EL1_HPDS_SHIFT, 4, 0),
-- 
2.49.0


