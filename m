Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCDFCA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNojz/m5/pZo5fqQWuhdwjNU5hLUXAkkyG3PUmd5nDE=; b=IOTTj8Aeg/gPt7GAg+9Ht4Ezt9
	QdamXm3yoaCho+RiCvWaqYSjG9AzIwxnCXv6z+K3Th4HG47EcCWbk1SETJAcxgl6YXG8p5A178txT
	SQ4aukyBONf2Mag/nxKH61XsoX90HCocU9UuMGYPbgxb/sF0/K70cxH0c/QyekaIS69Gduqz78PVA
	2muVZXKorLVtXdQejvHn7umeJb55zG8czRxQ4TCDzkvn0uzFdx2PYB60hEBQl2I6f/quyMfgZO4V+
	ReR6JAWXygSSwPZXPVhyPPcJ5S1K7s8dgG6++I50gmIm8JPIGHmhSZupo6lRwjN4OMGQ/mCMJCFzx
	g3WPecYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOms-00000002GJT-3DAV;
	Tue, 29 Sep 2026 03:45:50 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmd-00000002GBC-0lNT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:45:36 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-86a43fc3527so487857b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653534; x=1791258334; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mNojz/m5/pZo5fqQWuhdwjNU5hLUXAkkyG3PUmd5nDE=;
        b=L8MS/3PZ20hjmWq0CLdwCexuprDiLRlUb4hnTIY/P/T8qZ6XYPs+egdGi8avdgtDqr
         EhWKXlfA7NCOwAIpUyVG5HEzz3ehIsM/WT5LfhGvlV4vL5fbrVcEGUg/lSc7qK5sfabl
         1eb8MV+6KhgIbaCuRultv5UewCIrzZusNjmgza8uN4Wl5xAdfSS/nk6bbVoFywQ5RYLr
         BjHx3SJcgo7z6c47eDp/fz/0aEBQby9E+AsX29BSLKmOOhtzZ71CT2dOGLnORg/jIHm/
         2ikEy5/ogA0nBK9UAsuK6vPcXgMqKTI0UtWTztxXBs05C8wERDpj252jAKF7YlcNK0J2
         IdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653534; x=1791258334;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mNojz/m5/pZo5fqQWuhdwjNU5hLUXAkkyG3PUmd5nDE=;
        b=fImoPqmQCWZxODfSRrqBWhPhYKu3s2WF+2GDyn05t25/KiD3dnd1EcXvcxQsqreA/x
         ks3yQhHRy3EtEGYdNJhKRhmXYohpEQ1kSkXOsbTG6G7Pq6ONIHP+pjA/ZfHjuX/Xfypl
         jYDLvSSw+htYJoGLqB+s7qQ8y8PD3cqnDKWU3hD5C3p9GuL8XndUaSY0Ioxnva2aO2sQ
         mFUlOaNnVlMnyZVMasP0yTxSAPhGzNjHlRWHjNmO7gZprfZ6LbGSXDoHKAmSfUWJBeAJ
         Kl9T7mq91vv0vr4UrlVHbx1xnoI4Mi9QqD/iH2DbEip5XE+69XxghTfY5f7Oq7sm4AIK
         2y7g==
X-Forwarded-Encrypted: i=1; AKwUvBzBWukdbXABBmVUYRfoTwkXoLvfWx+APi9BQHlxT+E+3CoZkQ5YDwfeuNTbI2thJyw7rv7GthbcrybSttr7zXFR@lists.infradead.org
X-Gm-Message-State: AFuF++lqZk0tWgP92ZpZFOW0MdrzEfZCJIVmPlSpVKJPjPmNHGJ98bFl
	j6RPbxz4IWO0kEsozxahxnaGylfIEijHiayUzfydcJ2aFy+H1nz3Uem7v4AVD70sX5x6He1iibH
	X/w==
X-Received: from pflr18.prod.google.com ([2002:aa7:9892:0:b0:878:112:ded2])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1703:b0:878:3705:5724
 with SMTP id d2e1a72fcca58-8856314d6ffmr806898b3a.48.1790653532960; Mon, 28
 Sep 2026 20:45:32 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:45:00 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-7-praan@google.com>
Subject: [PATCH v11 06/16] iommu/tegra241-cmdqv: Restore PROD and CONS after resume
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_204535_238082_50A50389 
X-CRM114-Status: GOOD (  11.82  )
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
2.56.0.rc1.315.gc6ed9934b7-goog


