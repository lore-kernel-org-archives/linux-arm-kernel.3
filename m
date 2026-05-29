Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A867CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwPPE5/66gX8tYQEwBiFqJ6gT9Mjq1jN4WhTwmvmXVQ=; b=SC6cDhe+WY7ZZQfhaN3OnewRLL
	TyMrYZPHu4A4MYcf0OnlmO6jmmcRSWCNNAgRtyrgNvd++ew/B5nDPgLNoyaC6ofVuLZtzX1LuuDPw
	N/qSNuia9v4hS8La4zzizvnQUHLn9Dnp+Bm8cnljROjknzk16yFW48SeIOO1N4FgRL3UdgALiqeDn
	ZvCHlg2vAcqxX/vpUx94agMyTEeAd/rL9jORZbkjEUZVdPTcYI34WcbFigRTxLSD7vrq8M/1Cyca4
	NqwH7AGGwVxZZNiUoIVwov8WWrzXRoFLpzOgp2JjXXlVvQ2XANtg6gr/pnFKvbJWO9qkzhtNq98Vh
	qAvOKFMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv8Y-00000007Fcy-220y;
	Fri, 29 May 2026 11:12:22 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv8V-00000007Fbj-3bl1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:12:20 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso19586468b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 04:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780053139; x=1780657939; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KwPPE5/66gX8tYQEwBiFqJ6gT9Mjq1jN4WhTwmvmXVQ=;
        b=B9RfuDsUHLrx+tr5RTOs2LmjB4bVGu1uSMVuihk85SSImTSm+jg7jL02XN2oqqRYPI
         YHe9tKb/TBQIHiTVIR+1jec6xuHpJfPJR8iZ9QO3E4+tekSsuWRa3GQcv692kJBaXzvz
         M1Xx8meLc2DiwK9CesNZHze/9nKAshXuB5Cp9LSyoA8ajcJuFFLFwz09SXxpThIQdESO
         HI09ZIxADmlXjbEctsXWghmiCMNb0BS3zX1fVkxLGb8bUYcoNRzkKbM9QpbH4XH3SFiT
         EqVD2Yeudy7J2M8LtR1KMG1nJqoAA88WjNNxTPRk2tSFo+pR0JLkuXrWHptyU72MzikX
         DU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053139; x=1780657939;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KwPPE5/66gX8tYQEwBiFqJ6gT9Mjq1jN4WhTwmvmXVQ=;
        b=j99o54Ydqo9Au8euPyuZKklESkNk8Plg8bDrXp90CWuYWdja93m6UkwtNzdaNEzHOp
         AQTd0u4XggXi7KR0CMK1yJt+xVVXwNmH8eYDsCpuCIgi0D6fBaUDtpLnYnPw6rxK1/Co
         fytnAO4yWnVUp4WkvRbSHVWDpHiz54EKJDJI4mLWjk5I6TtLAwijPLnX0Yhrtieh3XS1
         RwfxNfJORkJcIvHirl3lGRqSws7DE9vbqMfq4jImqfpd/OaMPea3H3YrpOa1q7x59Rga
         +i3lwEwEU8R3lqMJoumAj7VcYWN4z/vOi0dWNQswX1Jn8FWhUl6yUfuhI8pXnOU/R2/K
         SdAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9pageZMtSZHme5MMlXgpJ91QT41GkTe+yK16IYEbx7c0MhuOjlgfIecQp0IxsYqcthTLiZirzm+cXRwg1VDIG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4/CGETrBD/eszsq7PF38K3iTal3B+to/vlby3cbVfyz7WcFii
	dF3hvsEnNQxeO/WoaLXTKjqAeRbISSPFjvXIQWoPPxUJhwemYFQa6aPeMg8DX4b75cU3qrO0H4F
	k0g==
X-Received: from pfbky33.prod.google.com ([2002:a05:6a00:6f61:b0:82f:b6a3:3dbc])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:14d3:b0:842:994:93a7
 with SMTP id d2e1a72fcca58-84212a7f6a0mr2674296b3a.5.1780053138377; Fri, 29
 May 2026 04:12:18 -0700 (PDT)
Date: Fri, 29 May 2026 11:12:05 +0000
In-Reply-To: <20260529111208.387412-1-praan@google.com>
Mime-Version: 1.0
References: <20260529111208.387412-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529111208.387412-4-praan@google.com>
Subject: [PATCH v6 3/6] PCI/ATS: Mandate checking pci_ats_supported() before pci_prepare_ats()
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
X-CRM114-CacheID: sfid-20260529_041219_902527_3DDFC793 
X-CRM114-Status: GOOD (  13.97  )
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
a silent safety check, it conflates support detection with configuration.

Update pci_prepare_ats() to wrap the internal pci_ats_supported check in
a WARN_ON(). This mandates all callers to call pci_prepare_ats() only if
the function supports ATS.

Update the function documentation to mention that callers must verify
ATS support (via pci_ats_supported()) before calling pci_prepare_ats().

Suggested-by: Baolu Lu <baolu.lu@linux.intel.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/pci/ats.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index 9cb23780093d..f1434f86ac40 100644
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
@@ -64,7 +66,7 @@ int pci_prepare_ats(struct pci_dev *dev, int ps)
 {
 	u16 ctrl;
 
-	if (!pci_ats_supported(dev))
+	if (WARN_ON(!pci_ats_supported(dev)))
 		return -EINVAL;
 
 	if (WARN_ON(dev->ats_enabled))
-- 
2.54.0.823.g6e5bcc1fc9-goog


