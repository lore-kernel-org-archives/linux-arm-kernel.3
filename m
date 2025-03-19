Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AED8C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 15:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9eSGRpGRsI7cZDtS5Yy4CgMDaMHl5lqU7SxcNwGqzg=; b=UAumdGoIplmMr2cI0GrqW+7jnY
	F3jLuw+brlJZM7rerXHqoT/QDNq6GiNoOMisXMgQN7RpFAgC/XWNhpQSKxc6n7IF/G6el+Xiz3nso
	WmmN2Byg/yOGxsQq5tggURN8Yj7bSjx0iPD8VzCoECJkdN8iWDqrNxgevKd63Qw+fahdsxJq+6ZGC
	iT4A8OmLf7DPJ0HuyFxI1nY+qd2koL1yTyg3jPb9Eev3CQXRoGJP6ZIvqx8yx1/Mt2BEjoTv0aAID
	bqHXi3CjdryQZQGrWEtMN+gR91e7dJAIxze1UciPX6VLpbvrrgnyGkP+/+YPq5n5C24N0U6OZAEne
	x0G/ydhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvXJ-00000009PyL-1sMV;
	Wed, 19 Mar 2025 15:40:53 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvNN-00000009O2C-33ix
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 15:30:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso22323655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742398236; x=1743003036; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9eSGRpGRsI7cZDtS5Yy4CgMDaMHl5lqU7SxcNwGqzg=;
        b=oWeOYW2XS6VNWipLi2guBzHw9E822xWdF31+E3VF3ibm7TeT9N/ZLfMQoLFyrEaBUJ
         vjRCpul8ZydFYNO6qNVoF2Dk29BuGlx2aFBa1mdVzOxZt6HRGWKLb3Oue/Z79ODDPYEU
         p86DMDy6PVFxzMON/sHEOlqBS3l6MS+/pIc7STMVnmWzhhf4FkrVcl0mQmmWBG47EU90
         Idk3e/2dtUfrNmPk8/CLDxtq0pctizp2feoQBH6BfpwZ9Oe0ZiqiZo8++tJGdRknHkyV
         gQ9tPOZzQ3EPwmW+gnOQGh18HYfLWYpWd9UEK2hrPjjF9FECUVAcOuC1qLmouOEhF5D/
         Sn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742398236; x=1743003036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9eSGRpGRsI7cZDtS5Yy4CgMDaMHl5lqU7SxcNwGqzg=;
        b=gkoqsfhbvZGN1npFhMMUWUw56AApOTipztzmHv9NtBA4qH/aAD4FNnpl5pZ4cXrZOK
         L8mj//zMPnh/aO6cobrGfcSo+G6Fn21ZAD5L27ZSXcliIyhsqaGRqoZV0OCbFOCpcAZs
         i2RrLCvQhN7XK/Icp1rahrrySB5wrMcnKw1E9ipNJ6md9QohIPkguGxT/6XDwGH6QEN9
         eT0UQmXbTQkBPpv49PhFsYMZRbKt7FkJXelZfJRwoVC3rVEVaYvTbGrp9mCnIkBHTYxJ
         Eqy36HY6PLOu33EucqjSexeOsz2VR8uu9oUdaGBOcAowheufI3whyQp2RNeOWsUF0P+2
         7F0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfNVlBqUWlMsgOu17pDKbKsmRQfHrEvKYbDDFf0/9bs7W/6i2mZ53vwExrqcusZpqp2p0+HWLuf+9daW+JUreK@lists.infradead.org
X-Gm-Message-State: AOJu0YzmYz7/hC/AwFNbiArlSMmzBFTmtJCKnibhucvLCNst0/mJm8nM
	TPurvWAZ7bNG+z7vq3nIivYh54GEghrQD5MGaO2b/227bNYQGym5KpyCmI0xw4A=
X-Gm-Gg: ASbGnctk/uf6IeTYPM56QvzlYbOTp0YafeV341EsUf3Uf535LmvSla2bIn1gUZkXRB6
	TGuctyR1EWIYePT7c9TVj+stT9/9AzqUEb5IZHG5mYumons0Wm6qrwmKI7jK60fmgmwr8DYMz+b
	9wE5bNL8r554zs1Ri1rZL3xO/2uqMZiAFwgAOiRXVy5KaVPhMocEjILYGsz7rzV+cAw+bUSQbR4
	QHJOs7zLcs5+hmo0KW59aoBQ3O0S99b+0bBvIApVlPM+5UpvV3t3TSLaFJFANvAY7T609JJVP31
	cifuStbVNjpDHoB6s0eztDxVZcgJkiGhfGReWT0obR641InjQnYKIO7AC8sCmUrspne5LAdiF6k
	siz+yVI+7b60=
X-Google-Smtp-Source: AGHT+IG9lKVl9ggOk268CWWDmgKFxbPbR+Kt9zHqmVimmqFce/v8krfj/anJNbYuVt/uhkH4oSO4OA==
X-Received: by 2002:a05:600c:a00e:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-43d43815fb5mr29107145e9.20.1742398235982;
        Wed, 19 Mar 2025 08:30:35 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([212.105.145.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdaca8sm22590635e9.28.2025.03.19.08.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 08:30:35 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 19 Mar 2025 15:30:22 +0000
Subject: [PATCH v2 5/7] scsi: ufs: exynos: Enable PRDT pre-fetching with
 UFSHCD_CAP_CRYPTO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-exynos-ufs-stability-fixes-v2-5-96722cc2ba1b@linaro.org>
References: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
In-Reply-To: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Chanho Park <chanho61.park@samsung.com>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Biggers <ebiggers@kernel.org>, Bart Van Assche <bvanassche@acm.org>, 
 willmcvicker@google.com, kernel-team@android.com, tudor.ambarus@linaro.org, 
 andre.draszik@linaro.org, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1888;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=meJ2NRXYTrgH1O0PZsicJBELBIeyADpQnFr+0uBOXCw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn2uMRE20Q5ANasCRwuFnlZzMwCdJvDbk0vH/NI
 8dr9BquauWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9rjEQAKCRDO6LjWAjRy
 ui5vEACXBq0bqFMkUCLc92+siadp/QAjpVDOeVSbJHwT+Cmk7B9ZsJZTrROLNYvOfzD8gBNB5PN
 zzYuFEYIUSQchIQGiwl62xCh3YJ2vvxH+L2FuqiILWVx9aztYZ4vgv/xjQbJiwXMDYNfOKppURe
 T4hKRWySn2olNQ5K5tL+at0tIES0oYCOl1gMe3i5F6EdHDkauNsACg0x9cp49mwNTvaHXoKG1+K
 HdH9Y1VAmkF6xfCM+He7BlylF5t4hLDLhraMjf1avMM8+6JSZdEzvYWwbxW/htvWeS4ebKh9MsT
 sH6lwEDjT+XeErUt+BFGQdsxVTb0xxbuC3vEqsJtbCbH+RC6Qb28ksiN+zhSSGtldjO8Eid2dc8
 4P1y5ijkVlVQF+aOw+/AjmYq+DhbQfVAORWLzGiDSz/4xUVbceDx8J2DHEHBGO/Y8PxkPpwpOwp
 OSaxshVmG8YagyrVTpc2ZaSC5Ryso+cgXsNzObgLUS1Oj91x+q1EpG1p2OwLXsmpxJCpPjKq/Ak
 xWC3tqrFD1Qx7uoWwEXlLiSduuX3aRzE6uwScIig984D0O2VDipXBrx8t/CF78Mu8vZoJ2JcqtG
 gDF6rMO2dbXrlY7PxeeBA7cPioGiCPg3+RZm2GgQV6pTO9rNqSHlw7KcCFccM2etD+g4CNlOBmS
 w63Hm9SJISK8soQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_083037_770397_AD78225B 
X-CRM114-Status: GOOD (  13.23  )
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

PRDT_PREFETCH_ENABLE[31] bit should be set when desctype field of
fmpsecurity0 register is type2 (double file encryption) or type3
(support for file and disk encryption). Setting this bit enables
PRDT pre-fetching on both TXPRDT and RXPRDT.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v1:
* Update PRDT_PREFECT_EN to PRDT_PREFETCH_EN (Bart)
* Update commit description for desctype type 3 (Eric)
---
 drivers/ufs/host/ufs-exynos.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 34e16e198830d086cbdb6cb0b027ca92687b2ae6..f6980f05bd5555b351070fe33d0afda469fe498c 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -34,7 +34,7 @@
  * Exynos's Vendor specific registers for UFSHCI
  */
 #define HCI_TXPRDT_ENTRY_SIZE	0x00
-#define PRDT_PREFECT_EN		BIT(31)
+#define PRDT_PREFETCH_EN	BIT(31)
 #define HCI_RXPRDT_ENTRY_SIZE	0x04
 #define HCI_1US_TO_CNT_VAL	0x0C
 #define CNT_VAL_1US_MASK	0x3FF
@@ -1098,12 +1098,17 @@ static int exynos_ufs_post_link(struct ufs_hba *hba)
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 	struct phy *generic_phy = ufs->phy;
 	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
+	u32 val = ilog2(DATA_UNIT_SIZE);
 
 	exynos_ufs_establish_connt(ufs);
 	exynos_ufs_fit_aggr_timeout(ufs);
 
 	hci_writel(ufs, 0xa, HCI_DATA_REORDER);
-	hci_writel(ufs, ilog2(DATA_UNIT_SIZE), HCI_TXPRDT_ENTRY_SIZE);
+
+	if (hba->caps & UFSHCD_CAP_CRYPTO)
+		val |= PRDT_PREFETCH_EN;
+	hci_writel(ufs, val, HCI_TXPRDT_ENTRY_SIZE);
+
 	hci_writel(ufs, ilog2(DATA_UNIT_SIZE), HCI_RXPRDT_ENTRY_SIZE);
 	hci_writel(ufs, (1 << hba->nutrs) - 1, HCI_UTRL_NEXUS_TYPE);
 	hci_writel(ufs, (1 << hba->nutmrs) - 1, HCI_UTMRL_NEXUS_TYPE);

-- 
2.49.0.rc1.451.g8f38331e32-goog


