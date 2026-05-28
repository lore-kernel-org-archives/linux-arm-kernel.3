Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BD2CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xF2OaZLydlq8fssyfbqW+m3pz8p9r7jLJNQQhoc0Wjc=; b=qgJJKptaB6Inv4hAMRuXi1w0Oo
	zTCgp5gvABxY+Dpo7TGpiK5w7Nb/GzSWoPUZF3qSOI8u5MhA/lHe7G32PUhMH4N6Pyv2rD+zOPhRV
	ITOGIS/B/kfMEQvBOJGJeKoAqjetRmm1xvyrl16ViPKm+WczqNm3JvZUOX8RAJvhZHECqv+wSdOYe
	uZYaE8n0ktC95JDRI+BGGSTrCUNzpjAk+xkOWe8XDoSpzodMBf1ZWf+gELW23k2ONHg8wmTxqvr33
	cVSoYpkYi/u/O4NE+e9QhqUHbfdN7M8C+97Qf3GbiBIJGoj7QCOHuLBf+VREAh1Sx3gzEeaPJOozR
	PTYN6Okg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShH7-00000006Kyk-1Gqr;
	Thu, 28 May 2026 20:24:17 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShGt-00000006KsS-32mt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:24:05 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2bf0607b5f5so15076905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 13:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779999842; x=1780604642; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xF2OaZLydlq8fssyfbqW+m3pz8p9r7jLJNQQhoc0Wjc=;
        b=RUfB+ZmDRZgEIkEMAjA8Hxp0AAzBlUXFuKPtovVt24eDn7kyq3V7kcj1TqpGbyLMdI
         TLnSnK1Li34+v11t8aFVpcfbaBEObs0ossbOUG31erV7KkTYp9xO4wi+jYWFbNzEc/R7
         cmJlbZdB2m/C9KE83vvpOC130NYbZ0BwFjs8VNtmGxWsHw/AHfg81f/s3fX/Cwhh4hjJ
         a/jDLKB6718RJP67wFKg2aoN5QHaGJpqvLhZ/GmsrVfvdv9HNvUSAtNHmnT2enM0+X8Q
         K5sPO442A3FB+/v5efBBZQZ7lBCVkZIV4cQqREBG3fewttr0JS5Q00YhhrcsAzNZqlgb
         HJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779999842; x=1780604642;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xF2OaZLydlq8fssyfbqW+m3pz8p9r7jLJNQQhoc0Wjc=;
        b=i2HCjFiMOmI2zmO76e9IOE4TvJ1pGjrKkzH1uwQsKORzV8Vd6vQT7GAAJ/ki9FZlFY
         HqCDZQHQKI+h1nec1vhjuO2fmOcFOCJdiyebzlhox41FOJqRh5KpFQljNCUzB9gLzwFi
         iH+ZcZJpEVsssiPneswWZ3XC/Xn8IjfgQMWEily1J4TdOYu73Yz0CFQnie82aMF09ZYB
         GQPTC6n98RaycmnftyTdKISyh1Ab2CLVW08UITZplvqMCbZNUHjw9NNoqbFC+rxHDe9b
         vyJqjUqWW2ZxE7xOtNNNPnEFJ9Y+uiWwp+nBR4fgJTK/TN4XfkN1skWVpH2S4FKqB2Ke
         W8Hw==
X-Forwarded-Encrypted: i=1; AFNElJ8wBkWH7LNbVYl0H6Ll6ui7mn0UMJscG6ZUTULlVEJIvTYJ3HT3Va/GJVk9pA8HKAg7BM45F5+CsjL6Krvodn7/@lists.infradead.org
X-Gm-Message-State: AOJu0YyoFe5xNuAeFP5vCLS6f6lTKu/2AqxbPWX1pk8Z1ggL9QkXt5t7
	HFBBCD2wkm8jnd6nOd0mgUuhLogvPpkNMui2GPqXElxO/3R0KbdGS7jYh+8WPzOdT3sKAfBHrom
	Q9g==
X-Received: from plhe2.prod.google.com ([2002:a17:903:1c2:b0:2ae:5d79:a153])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f601:b0:2b4:696b:7bb7
 with SMTP id d9443c01a7336-2bf1eb7c31cmr3931325ad.15.1779999841997; Thu, 28
 May 2026 13:24:01 -0700 (PDT)
Date: Thu, 28 May 2026 20:23:49 +0000
In-Reply-To: <20260528202353.3422206-1-praan@google.com>
Mime-Version: 1.0
References: <20260528202353.3422206-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260528202353.3422206-4-praan@google.com>
Subject: [PATCH v5 3/7] PCI/ATS: Decouple pci_ats_supported() from pci_prepare_ats()
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Nicolin Chen <nicolinc@nvidia.com>, David Matlack <dmatlack@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Mostafa Saleh <smostafa@google.com>, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_132403_767059_23ED8BC2 
X-CRM114-Status: GOOD (  14.43  )
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

Currently, pci_prepare_ats() internally calls pci_ats_supported() and
returns -EINVAL if the device does not support ATS. While this provides
a safety check, it conflates support detection with configuration.

Update pci_prepare_ats() to remove the internal support check. This
decouples support verification from the configuration phase, ensuring
that drivers can distinguish between a device that does not support ATS
and one that has a true configuration error (e.g. STU mismatch).

Update the function documentation to mandate that callers must verify
ATS support (via pci_ats_supported()) before calling pci_prepare_ats().

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/pci/ats.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index 8057c24b0469..92c2a6bc2dcc 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -56,7 +56,9 @@ EXPORT_SYMBOL_GPL(pci_ats_supported);
  * @ps: the IOMMU page shift
  *
  * This must be done by the IOMMU driver on the PF before any VFs are created to
- * ensure that the VF can have ATS enabled.
+ * ensure that the VF can have ATS enabled. Callers must verify that ATS is
+ * supported by the device (e.g. via pci_ats_supported()) before calling this
+ * function.
  *
  * Returns 0 on success, or negative on failure.
  */
@@ -64,9 +66,6 @@ int pci_prepare_ats(struct pci_dev *dev, int ps)
 {
 	u16 ctrl;
 
-	if (!pci_ats_supported(dev))
-		return -EINVAL;
-
 	if (WARN_ON(dev->ats_enabled))
 		return -EBUSY;
 
-- 
2.54.0.823.g6e5bcc1fc9-goog


