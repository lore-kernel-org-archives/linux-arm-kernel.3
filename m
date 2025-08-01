Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EE8C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 13:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JXrCxZaMMaRtHFaNQGeH/9TtujLuny+WCwC4B5wtCMc=; b=JU7/45Ok8hujuSJglSmueVesym
	YWvUmp+/QOrSfttV1ZciSznOi1HG1HIvkXU8Np6iniEnnfgdSq4TW4DRVr4GjP9mj9L1Vt8J4IdW1
	ZW0BdAuL7kYbfDWRwze9PetWXINlaTxd0d1VjuojpqlFIS51SvP1ZAh8xyTQtd0wjZR3TREyeAi1k
	xFivW7DxjyFtTRiodLVCTD4U9TDj/d8tRbt+GtDNQnhDLsOqDEzPQs0k2XDq/9OsF+FStJJkGl43B
	vcHse7pys1Nbm0olGAtg55Bsw44RBaiDEynW9K7YmUvsmXTBIfUwdHK+w7yBpT1AeetIZWToEVGjc
	iFSaHhjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpzH-000000067x6-2v6P;
	Fri, 01 Aug 2025 13:39:55 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpuE-000000067SA-1DUV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 13:34:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso12272515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 06:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754055281; x=1754660081; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JXrCxZaMMaRtHFaNQGeH/9TtujLuny+WCwC4B5wtCMc=;
        b=IkXPDOdhYpsSHJWMiY8AteLEkZk8rxhMId5507RN/C4KyTr1dLxviEFtbphJWNGLmt
         6cFw4TWiqLNSVh/8uZWOxYp1TIx574AKPxUSKaTf50R26zasmVgD5rgRGDSZwAbPmWM/
         xQsCRQzwGZOfmJEzu8sFCqWJgegs3EjOEyRW6WpYneNTzUXWzmmWv4Bj6lMu55AT3sLi
         AN3cAN1Dq9hVa3YZp+IRHfkpvB3H83FJn2mJCnO6BKo6fD+a4fBE3sFQk9GxUDFWqyDR
         5Kmz9ZfmOtd0TG6dmB4ai3C+J1qo6F/zYRMoo+RnEIhm1aNFgX45FaVW0Rvtb+UfR/wi
         nttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754055281; x=1754660081;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXrCxZaMMaRtHFaNQGeH/9TtujLuny+WCwC4B5wtCMc=;
        b=Yz8fK1P6Y46KZDkMLNZ2XKOrvEy1yNQaJ8xyHt4Tngntysmp0J9FkVHv9kzBoXvLq8
         lntAq6jzLriOlQH4UqaAZxcxR3SNeO/ktPaZk4nXyxkcwa1gmGJoVHPx5DiDv5yGAgd6
         WvdYvh5FWmOOu27GWFj8+tsAUSFVaKAx7jpvxPl8d9dOfs5AEpaAE9QYA22spr8MJVHP
         0rt618hK5XooY5ww78rQ5p5fvt8/fLat7USCYIMkbZAUWmXrwqYi+k1dB3mAjCCS/z0G
         7mpNMyEryQExpkFlOszFtIJXh2N1aeShmsIj/entJpoWkYmDuoPdDUSISlOAhN/87+UJ
         V4iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLgt5m1akCbSTdpFL5Gvx+qgJVzCqcsYqJx+t+uJ197wfuuB5H0RF7yvPXA5FV1dHF1RqTIBtC0pb/BRi6NG4N@lists.infradead.org
X-Gm-Message-State: AOJu0YybZjpGyc0oeSjjqmtejbFzRrasuk76I3Fsvpjjy8lIVbOoQQkD
	49TP7vOtmmfk+974Sn2Pb/GQnRWaDBKdZ4guKAA83xIm5SmZB90Mb0lS9ITwhfh7yQ4=
X-Gm-Gg: ASbGncvFZCegpWphUAmVkvhVic61f/VwXOOggC3IxlqANKeG7ftOIV/NPoFMSrbPqZM
	T0ItnUHKvC2HF5Edw0vM28gYPP5uw0uFuuNb7MH96z9cU6Mo5Es3uss7Fn81iPoxhBBc8gzekm2
	S0jBDZhZrHq2a5wFpw/7jTpmfMwlmJzTx0GKEtRK/wyXaFuTS/BjKw+p/hrKTU1XFAoqzgXgPRT
	1Rf2Aziamoq8sUGOidiW+ze8dPgxrQ8ooYsD3xRmjtCvaLzBGG37KpVVKKzj0eCYfxYo7UZyITV
	MCUA0Y2D385oqfiiWvw1zLPADlE9s8CLsA+lALYmrttUdaNru6va9h/DVf3xEzw5ZL+u12LRfYm
	DdQi/IyK5e3/Omp7plAuV57VjNPNaqdM9XiNalhbO4vQ=
X-Google-Smtp-Source: AGHT+IEY4PzKF931Cl4hXP2ucH16DnQzD1sduXwZybAumiUjCHWrT+naQgUR/VvPTU7PmaLeiSG4OA==
X-Received: by 2002:a05:600c:4445:b0:456:22f0:d9ca with SMTP id 5b1f17b1804b1-45892bd09b5mr98694275e9.26.1754055280691;
        Fri, 01 Aug 2025 06:34:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4589edf5683sm66413925e9.7.2025.08.01.06.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:34:40 -0700 (PDT)
Date: Fri, 1 Aug 2025 16:34:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] PCI: xgene-msi: Return negative -EINVAL in
 xgene_msi_handler_setup()
Message-ID: <aIzCbVd93ivPinne@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_063442_329765_825C2E06 
X-CRM114-Status: GOOD (  13.79  )
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

There is a typo so we accidentally return positive EINVAL instead of
negative -EINVAL.  Add the missing '-' character.

Fixes: 6aceb36f17ab ("PCI: xgene-msi: Restructure handler setup/teardown")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/controller/pci-xgene-msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
index 0a37a3f1809c..654639bccd10 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -311,7 +311,7 @@ static int xgene_msi_handler_setup(struct platform_device *pdev)
 		msi_val = xgene_msi_int_read(xgene_msi, i);
 		if (msi_val) {
 			dev_err(&pdev->dev, "Failed to clear spurious IRQ\n");
-			return EINVAL;
+			return -EINVAL;
 		}
 
 		irq = platform_get_irq(pdev, i);
-- 
2.47.2


