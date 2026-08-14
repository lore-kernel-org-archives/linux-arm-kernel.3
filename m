Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC0DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 21:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYuMpnr3KSC7nQvSYxrDe2V0WmDtuzggqBjS2om2eUA=; b=mdG8rpolFH/I+gq5gyXpJbc/9Y
	o3NYX0+5n74hN+QHiN1JXZMs2VHKq/7p4CYbCewR604eydNdfyzY2EYBphwb9/geBasglDcI2z2CQ
	mVagU6yMUraLRuCUTLSDYBZoX1d2g+sgWkmbhFRli2Fmqj2icynN1/0HFS6lmo3sr2eCdVKJI8o39
	ovyIEt8N6tR8t4nrzRGmxqOqUF21c54cO4qSZO2SBtOXgYzNBgv98Ntp8jMad5euoTXED29Ye5BpY
	MeTgXL9BagSoripqgXbSkIS3uzz18if/UjLSEQyw9+/2xe747KH3w1f+r1jWQgiR6KJ5h30ZpNP68
	8LB8+x+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuz1V-00000003BoR-2QwR;
	Fri, 14 Aug 2026 21:01:05 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuz1T-00000003Bmi-1UwX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 21:01:04 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c1f472eaafbso230900766b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 14:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786741261; x=1787346061; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYuMpnr3KSC7nQvSYxrDe2V0WmDtuzggqBjS2om2eUA=;
        b=sR5rqvZmKxzFReW0fvXwFweY4zyeekKTD5D4pgQdy9iABc8saqxmKnmOKYOCEwnmfv
         6qfjhtwD/GxERToBX0Cfj8V2G/v8IKi7ZSyMYUzVO81yDQ1S5LDhtazSWQlGH2lsUvUO
         2aJEf90i1iUUiUY8JA40yZubrPBCdo5gknM9Gqlv1j92gds39vvgLE5hPjvOPV+yS42z
         e07fNl832Iwr5RyDiEliANFVfD1veWm8/oVQTPuhkPDVb9jAmCTdIg68shwWLnWyP2ur
         KF0KShXQKm+We1+g7SOmosSZiJMx9L8koXS+ZGxtUnjp7LAG4AVvDAV7XQK/6Z/93r+4
         KIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786741261; x=1787346061;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DYuMpnr3KSC7nQvSYxrDe2V0WmDtuzggqBjS2om2eUA=;
        b=PXq1XRAVr999Sf1mOHNy10lfPTn1Se7VnIkFJIQpyV085AszSFkbQ7ESVoDJns1jmf
         AT2LClH1j0QoAoulev0kNsXxdFpG1xrxiqplhFeZ+X/bryOnsSgFqduTq5zjWOC8RvE9
         cxB7nisjCYp6q/SKdMuw2r77fDcVaTe3CedDkIsAs/bhKwo5c1h8xrGiMI6rslEMWRTW
         rkouAov3nL6I7tuOl6K3XfOrHjmQ5cVHFTbTX/UHhZShCiu8tGbSx9U6bb8dHommbGUN
         igCQfdf9zNSer6j4AHgX3QABBhlKwsPJUalkMb8X8c3gDZhCOggtXmAv2COAbwzWtZnD
         wzYA==
X-Gm-Message-State: AOJu0Yz6kVpYihbCamLU6rAeMEjwkDqw3vuKEPW3J8o4VV0Zgv3DBhtD
	0AdECt3Jy4XcikoVndvDJ1bmA2aPGl4uKF8QcAbqdFfPvhxJYt7eNFpBRSQQrn97N/6lWVkISPp
	rNNhTJsg6U04C2T92YQ==
X-Received: from edgd22-n1.prod.google.com ([2002:a05:6402:a516:10b0:6a0:d334:54e7])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:e15b:20b0:c21:3c4e:cb9d with SMTP id a640c23a62f3a-c213c4ecd42mr205334666b.14.1786741260571;
 Fri, 14 Aug 2026 14:01:00 -0700 (PDT)
Date: Fri, 14 Aug 2026 21:00:55 +0000
In-Reply-To: <20260814210057.4102768-1-tarunsahu@google.com>
Mime-Version: 1.0
References: <20260814210057.4102768-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260814210057.4102768-2-tarunsahu@google.com>
Subject: [PATCH v3 1/3] ARM: locomo: use put_device() on device_register() failure
From: Tarun Sahu <tarunsahu@google.com>
To: helgaas@kernel.org, dmatlack@google.com, 
	Nicholas Piggin <npiggin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	sourabhjain@linux.ibm.com, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Russell King <linux@armlinux.org.uk>, radheys@amd.com, 
	skhawaja@google.com, djeffery@redhat.com, Geoff Levand <geoff@infradead.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-arm-kernel@lists.infradead.org, souravsgl@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_140103_399385_514B603E 
X-CRM114-Status: GOOD (  13.01  )
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

As per device_register() function kernel documentation says "even
when device_register return error always use put_device() instead
of kfree()"

Fix such instance in locomo driver by replacing direct kfree(dev)
with put_device(&dev->dev) when device_register() returns an error.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/arm/common/locomo.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
index 55e360452828..0f6689d343b0 100644
--- a/arch/arm/common/locomo.c
+++ b/arch/arm/common/locomo.c
@@ -223,10 +223,8 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
 	int ret;
 
 	dev = kzalloc_obj(struct locomo_dev);
-	if (!dev) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!dev)
+		return -ENOMEM;
 
 	/*
 	 * If the parent device has a DMA mask associated with it,
@@ -255,10 +253,11 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
 
 	ret = device_register(&dev->dev);
 	if (ret) {
- out:
-		kfree(dev);
+		put_device(&dev->dev);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 #ifdef CONFIG_PM
-- 
2.55.0.691.gc56d675ccc-goog


