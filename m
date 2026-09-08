Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44881C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XsMPvOE3afXsZVMyFMwLpKgTSpBthouLl9Pg3MA9sM=; b=SO2WsOM/gvaFGRrfOFzsbxynic
	5o8JACVl92R61n5PsuDda7OB84Qz03n4X1Ycb7QP1vHa71lg9O2PWrPAd3rUKEmt2NDqhNTPZkiPa
	bKl3LrcrylwCN7Clteg1mi3d61U529o1DRXhv3ffjW3Yy+TbFy7tUG5riNahu4e6V4sfwOHTMHyBV
	vbwZSdowr2D9OJWH2wB7G9PoIqSCIEMyE2psKmwVFnhH7UTFYucO5VevLpJmS5grvrWG49XXuVaeI
	Ix7YQXIM16NL9MpDVW8pSwuj7brUvMlWQ47bGAs9iBIhdUWvx6PHPhxiwFlV/2dNE6riLbKgoO6J8
	g12i3wqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRz-00000009mWR-01h6;
	Tue, 08 Sep 2026 17:17:39 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRr-00000009mR0-17uH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:17:32 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-399311947f6so8228927a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887849; x=1789492649; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0XsMPvOE3afXsZVMyFMwLpKgTSpBthouLl9Pg3MA9sM=;
        b=ZdoqE0F/fgjEb7wso3QqMRnj+Df1nazJVMdeODTnI0JK41d6Ng2jwvRMCrgD7Lt80f
         mavLG/2M5UHCEu9gO0OT+conVa70IsPQ4jUftmBfGOW9Ip1fLA9AU43uIMsyhVYi1ymK
         fmIAqG3ytYoWjU8B5rl11mIrmgKDL+QjkdhPgNkDVhQZo2iqLLBRpscgrs7n2mEJMz9F
         BpFC9LC1Q6CpcazsDZUobJnB0oKlE5ARTPH04hpMSL0Yorq87RXbCPfkbU4H5QdaoOMT
         KC41rsNlRW1KYpgxJNkwZLz5gAycQCjlTVfsazwYe5lH/rYkbY4bBUFyvGU/fxoYfyyi
         BGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887849; x=1789492649;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0XsMPvOE3afXsZVMyFMwLpKgTSpBthouLl9Pg3MA9sM=;
        b=tRZe1N55o9pdBaYOObltIJfojdS+LYwMMEXSkGv1XgGoF63Kl+n4z9MOMeXYckkeN9
         fYrH4nZjzMNGSaBzjv3xKe5l2b5oNnumQbavSbbcBwNTiQMkb4XCQ5nW10hdyYM+gKKJ
         OD5R+QKnDADzH9ty9jxYUPytpI8U8DfcjkFdEb7WfPQCBMeAK7z28vAhclfSu0wf09Z7
         IGxKNxkDT+FY9ehY5fbxjOrYY3zwSKF0pTTiQWNnHfbAJwzMg5kEkLSNinwwwrfJS6VN
         VfagLjf8LU1gu3Sb8nybx9AwnUPgupQ6V8YjY9zKv37mk2Bl/Pc8HcIBi8E95NAsFqvU
         HfYA==
X-Forwarded-Encrypted: i=1; AKwUvBy0h84SkLGvjXcYPb+/IgPKtMax1e20FgZVyMlnRXrebUI/bcpHZBi9HOLnkWiN0gxyJ2GhyJhqwzqR+tLNgioH@lists.infradead.org
X-Gm-Message-State: AFuF++kVRVMOtsmd0WZC02vH0JJ6SRvpyu2YW1NhiTmCwnxDBEvniR7c
	Y5aM7YmJvTvLzVEh+Eun2VxM/ODlSglD524JMf9+NcUe62ZvrVJ6nKSLC6qb6mJW6fifx/KBrbG
	Dyg==
X-Received: from pjbmv24.prod.google.com ([2002:a17:90b:1998:b0:39b:4485:d746])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:528e:b0:38e:ad9d:1161
 with SMTP id 98e67ed59e1d1-39b25ee67f0mr45919989a91.0.1788887849350; Tue, 08
 Sep 2026 10:17:29 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:17:02 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-7-praan@google.com>
Subject: [PATCH v10 06/15] iommu/tegra241-cmdqv: Restore PROD and CONS after resume
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_101731_317116_948404EA 
X-CRM114-Status: GOOD (  11.97  )
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

From: Ashish Mhetre <amhetre@nvidia.com>

PROD and CONS indices for vcmdqs are getting set to 0 after resume.
Because of this the vcmdq is not consuming commands after resume.
Fix this by restoring PROD and CONS indices after resume from
saved pointers.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index a394bf0f487f..c7989fcd2c62 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -567,6 +567,16 @@ static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
 	/* Configure and enable VCMDQ */
 	writeq_relaxed(vcmdq->cmdq.q.q_base, REG_VCMDQ_PAGE1(vcmdq, BASE));
 
+	/*
+	 * HW Registers reset to 0 when power-cycled. Restore them from their
+	 * SW copies to prevent executing stale/ghost commands after resume.
+	 * Note on RPM: Power-cycles can never happen when VCMDQs are assigned
+	 * to the Guests since the relevant frameworks (IOMMUFD / VFIO) hold
+	 * active PM references preventing suspend while VMs are active.
+	 */
+	writel_relaxed(vcmdq->cmdq.q.llq.prod, REG_VCMDQ_PAGE0(vcmdq, PROD));
+	writel_relaxed(vcmdq->cmdq.q.llq.cons, REG_VCMDQ_PAGE0(vcmdq, CONS));
+
 	ret = vcmdq_write_config(vcmdq, VCMDQ_EN);
 	if (ret) {
 		dev_err(vcmdq->cmdqv->dev,
-- 
2.55.0.979.g7e5102b832-goog


