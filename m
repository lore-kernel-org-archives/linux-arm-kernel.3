Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7940FCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 14:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzHMYfimzskmCvhQZFOQq3Y8wAS1gFZFKB5XWvB1gEs=; b=Ox5wHo30mIVKRtqGcR9QTYszeb
	rBOrzsLR1Y3PilI6gB/UQazBkEE3ei6gQojkngSfWxp0nSB6B5HSlo79NfLvuEF4OxDoCOkFLA7cc
	331R9MDQUWh/day5X62pHojGu5URgjPTZSb0Yu1HuJ2BkVPQFPA1/XK8IgqJmKsNmNHWSfcxhFdvy
	vEQwy6zfP2Mm5MNmPKgWVbF1tWKMzGnHuHGLqFVMxeEwjDxZ+Wzz5f4SketnucZa77M3MFwuGHAVP
	+MMr8ugFo7PrEWnvyjm3xrbj2B0MVaTYw+6Fk2WRIGX9Vy86aSSJfv+zhp+66fxWBiJvfUazILOH6
	4+odH1eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68JL-00000002876-1izs;
	Tue, 07 Oct 2025 14:05:03 +0000
Received: from mail-yw1-f227.google.com ([209.85.128.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68JI-0000000284y-2qJ3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 14:05:01 +0000
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-71d5fe46572so87222577b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 07:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759845899; x=1760450699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzHMYfimzskmCvhQZFOQq3Y8wAS1gFZFKB5XWvB1gEs=;
        b=BsWqHMMXfBzFRzua3fzbWLDymDCJi7TN1MxULv6Xi0TuM/fn8BYu/Iaz5o0Ukrx/ip
         /L5Dilp2RuiqRZVEgZaclznb2cp3Mp/Ss1KBQndgUVJYXMMixsZMthjYcNTC2/Kgey0Y
         WckJzxH4sO07JE8jhOGTgOkL7sLlCLDP7LONx4SF7qOEmn+gisfROM8Am/PhTLJBAW80
         fSxw3drRhenBEDezbRrAq6RdTKkAlawsFVC4NlYViMPSuWJU9ooAup0vynZ6F+7cmlbn
         F3Pi+aacsE2rKX3enoZXEtX1oIBveXPI8XSs+Z91FrKHwdngBjFJ+A80uj8tRUbqw8jR
         bD9g==
X-Forwarded-Encrypted: i=1; AJvYcCVc006vA21dJ9qsxRu7duFhW/fnFO9XbG6xT5fjH9cqWijUsyYTjVfRnOfr4+tJTpio+puL7gRIb1K066Uwdh1/@lists.infradead.org
X-Gm-Message-State: AOJu0YwvPaNPpscp3nbrUAl8KwS5IATDtlfYT9k3YAZOxPJ+NuWecGme
	HiYc3piV7e5KW1lbFSQwlt3rI2qjcERmeGa+0j9vxY/dfX+nYT4Gd0MyGMnEzxLd8nbe7dQ552b
	AXaiGhoO/x4UMJAW8h4NYUNm5M+hCCrEuyY5vJJposic/o1IsyLU7kebX2uT8RWT0dcQHY8SCOn
	LehtJXxCfRLbZhpsGSzIjqoWz/6EFHQ+qiwoV94qNgELPh0tjFijOxxfHYoE3uYCJ28R82d5ut0
	guc+oF0Muh2pJMhoLoMQu6Jxl4=
X-Gm-Gg: ASbGnctTIgoSmxGqjSc/TFzGlcYkW9LFfAya6Gz5DLPsp9fwboJqqJkbn4u1VCj1bgZ
	ZNv8jc7V2XWfYjbGJ91QzwfQR1NmCJEIfMFJZaHZBNjM0MDQR/7X5PRt8ORSQmF19nG6CEpSr5K
	zPgzN3q94lA8QhXOlkytlilh8j2hNNjZMyhaNBPbhngRbQ/sFo+09lNR6YN0A25V/971n2ZrhOK
	vVe98+gPB/B20dfou2Wip2g4uSReIA0JRKhp9e664sw6xHprOt6zR2KePRv4K9QbtOW2Upl587z
	UmE/tq0Y9QkaSxQCTK7P1cS1Z3L4qXi+jvaQJb4hrcNjreybDFG/KD71IB5Qdd9Vzy7IWhnSk7B
	d6WeAnqtNFGgLKDXFJFMt8jlSW59nJtGemlZwJGPgdQdFIsn1qLRfdnoqow5sX4FWWSKgi9iM+7
	9nbdGa
X-Google-Smtp-Source: AGHT+IEHzcqiAOKENxcxe7WStsFWui8JIRoznf9Ex8tDBBYYVwzPraJi2qtrazjA0z7M/xAcQrE2wqOyK/89
X-Received: by 2002:a05:690c:fc7:b0:734:be90:3b11 with SMTP id 00721157ae682-780d222e98emr45805907b3.17.1759845898905;
        Tue, 07 Oct 2025 07:04:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-77f81d0265esm9483627b3.19.2025.10.07.07.04.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:04:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-79538b281cdso119153366d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 07:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759845897; x=1760450697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzHMYfimzskmCvhQZFOQq3Y8wAS1gFZFKB5XWvB1gEs=;
        b=bLEBeytp9vPg+tC+xBzuyuAPuq16OMJVnIFPBvOqhhTaM2Fyj/TEXPmb+6zN4LoVZz
         2Wao7ug41sWszSgtZnQ1dJj65mYQEyX27mf/IxdK6N8L6Eh7tQl5IlTF/9imfdo0zRdS
         mpY66qRSUbF4JHwDJAXp8sl4F/v2e9t/+bdrY=
X-Forwarded-Encrypted: i=1; AJvYcCWnFbvd30XhSgV2fwTFJ1Fxrwqj008x0ZhKmJNsRyQnrIqla1rh2Nf5mfnrUg/BYpWo4J/l2glgyM47VmcQhOFw@lists.infradead.org
X-Received: by 2002:ad4:5ca9:0:b0:78c:f62c:8eb1 with SMTP id 6a1803df08f44-87a052a7fc2mr39707646d6.26.1759845896986;
        Tue, 07 Oct 2025 07:04:56 -0700 (PDT)
X-Received: by 2002:ad4:5ca9:0:b0:78c:f62c:8eb1 with SMTP id 6a1803df08f44-87a052a7fc2mr39706726d6.26.1759845895821;
        Tue, 07 Oct 2025 07:04:55 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bae60b67sm142718956d6.9.2025.10.07.07.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 07:04:55 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v2 2/5] mmc: sdhci-brcmstb: move SDIO_CFG_CQ_CAPABILITY define
Date: Tue,  7 Oct 2025 10:04:30 -0400
Message-Id: <20251007140434.606051-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007140434.606051-1-kamal.dasu@broadcom.com>
References: <20251007140434.606051-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_070500_725737_BFB9EC64 
X-CRM114-Status: GOOD (  11.41  )
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

Moving SDIO_CFG_CQ_CAPABILITY register defines to be in sorted order for
better readability.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/host/sdhci-brcmstb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
index efc2f3bdc631..f81cc1889ac9 100644
--- a/drivers/mmc/host/sdhci-brcmstb.c
+++ b/drivers/mmc/host/sdhci-brcmstb.c
@@ -31,13 +31,11 @@
 
 #define SDHCI_ARASAN_CQE_BASE_ADDR		0x200
 
-#define SDIO_CFG_CQ_CAPABILITY			0x4c
-#define SDIO_CFG_CQ_CAPABILITY_FMUL		GENMASK(13, 12)
-
 #define SDIO_CFG_CTRL				0x0
 #define SDIO_CFG_CTRL_SDCD_N_TEST_EN		BIT(31)
 #define SDIO_CFG_CTRL_SDCD_N_TEST_LEV		BIT(30)
-
+#define SDIO_CFG_CQ_CAPABILITY			0x4c
+#define SDIO_CFG_CQ_CAPABILITY_FMUL		GENMASK(13, 12)
 #define SDIO_CFG_MAX_50MHZ_MODE			0x1ac
 #define SDIO_CFG_MAX_50MHZ_MODE_STRAP_OVERRIDE	BIT(31)
 #define SDIO_CFG_MAX_50MHZ_MODE_ENABLE		BIT(0)
-- 
2.34.1


