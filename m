Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF59BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TW9nWifCzwYZy8eQdCTo6EqgINRvFFYuVj87cGvTYVY=; b=a1bj/XgCurG29Tb4CFZVbB6N3j
	BpAfJYiPDzQZgQAIzjujUtx7yJdtdfmjajdLJf5WE/KxbMbF15ZCi4hW/dz7bsYF5qIIXKQl7R4VI
	8asrxAW10+99ZyiwIG0WBWKZL7yadO/Pq+OW1+Hl0g9X6aWdZ5Qe6UqqZdqTtehPB50iJMXesKsO/
	v7MsE+EtICjB7W/QvqB0xqW2VUNAk3E0sDW8cyPWSRUsmqTU0DdG4Fl8D0diMqYX9Nxu8y6CTJxEG
	JTQH/ePIMdWciljjnNuXLiA6Zw3IcnXVm8+Apa8n5HXQTKxUXZi9JuEt3n7gahftU5Qsk71hYPItR
	OSF6JzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1Z2-0000000G3ov-0NAK;
	Fri, 14 Feb 2025 19:41:28 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizfb-0000000FkYB-1mvL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:40:09 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5fcb8a9c1a6so782017eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 09:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1739554806; x=1740159606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TW9nWifCzwYZy8eQdCTo6EqgINRvFFYuVj87cGvTYVY=;
        b=FapJmCQ0X14iS9JhIy4DE/cTogq3rxjm6yQNw70EHfOZM/aFc6hXJhco4EgsJNVHJI
         23I6Gcv+o2ClIhcbsBGuUzJV8ponqRVP+BL7VklKjfRYw68mMXWTrWRG8QtdDxax8RDg
         TvqjGuyyWVSS7e0Hees39JLTdrdfaQ955B2pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739554806; x=1740159606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TW9nWifCzwYZy8eQdCTo6EqgINRvFFYuVj87cGvTYVY=;
        b=EnsbfBWOfmzAevWE60bUeaxldXYKfrdq8dtlD7tYJQ5FN0Mxpy/8SgUOIktqTl5oVh
         qftNafTocD4P3jTqzNfzI7MPT4V8imNhfBud/lNA8fKo+epLu5hpT5y6avnNU1vAN+yB
         K3Cb6c2MBcoV4ONoeBYeYHeXUbkYVgrH16iHhuupVTsL37EHJC8G70qkcor/3IcajP5t
         4tFZ0n6Vk1Bhz4pGVX3x/o0E+QH2QUeV9qlPTUb/4Aur2gtyc6sYjJ6HBePwb/g1XQK0
         afvWrrjer1Rx4r39ZkAPQ/ZRzWvO8KOyr5mXuKZq9x/aK+L0xxbznm866Lf1jTC8uCbC
         Cb3w==
X-Forwarded-Encrypted: i=1; AJvYcCUqWtGk+57DCjsfCtwojPAeGXQq28ckGyEnqjO2IcqYnohRMnx8A1kEKxr41A2X3x2tTljcDCMvbeXHRfEg6+Yp@lists.infradead.org
X-Gm-Message-State: AOJu0YyAdiNltX5MJryju+AieLT+Tmw/0ycs6zTg2fQDYF5JMYVzBG3q
	XgBSokolYQ0SWdio/9K2krBsNKMbSw9X/GUW9e4eAkHePsitX+35R646vbcSF0bfcUuBxHxy96z
	f8Q==
X-Gm-Gg: ASbGncvrjPs0XDNe9PE5ngPb9UmLwsbdqwVgdsh/ZWcE5TcjIzsT6JsUY6Hq4uPj9kL
	9Tdzf4gSHixE/lwcVurMvpkoV/GqYlly2ZNoyHKgwOMuqNNAib2t5cCBXnlcCQdAwQPLBHt5Vgw
	m8WvAxFa7B10OHKkhScu9iQWXh6jmRBwLXCirfoIlHYQynNg2wqbYCr1+ymZf0u2ExNKpK5KU27
	8pjJEiWTWY3mPQ4NfbDpLvQyC7qTSk5PPavy69ltNvjsR+irXUMj2OdDAVQrWZCtHDxXe+lsmzE
	w3wWXyI52vhFaGgZgTJNmDyIMp/dzoZo1OTL6CH25VL6hGXsTazbfYQNBOB4TzMXCbd6Slc=
X-Google-Smtp-Source: AGHT+IHsRBlmYmWP6ec6QvQPHeSSiuic4NDtKAA7m7DLRipohduC9tXO6eBUjYvMvWROPLOlA/zw6g==
X-Received: by 2002:a05:6820:c85:b0:5fc:b1d9:9b68 with SMTP id 006d021491bc7-5fcb1d99d08mr4047840eaf.5.1739554806336;
        Fri, 14 Feb 2025 09:40:06 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fcb17a4ca4sm1284073eaf.30.2025.02.14.09.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:40:04 -0800 (PST)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 4/8] PCI: brcmstb: Fix error path upon call of regulator_bulk_get()
Date: Fri, 14 Feb 2025 12:39:32 -0500
Message-ID: <20250214173944.47506-5-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214173944.47506-1-james.quinlan@broadcom.com>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_094007_467536_DC262039 
X-CRM114-Status: GOOD (  11.98  )
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

If regulator_bulk_get() returns an error, no regulators are created and we
need to set their number to zero.  If we do not do this and the PCIe
link-up fails, regulator_bulk_free() will be invoked and effect a panic.

Also print out the error value, as we cannot return an error upwards as
Linux will WARN on an error from add_bus().

Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index e0b20f58c604..56b49d3cae19 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1416,7 +1416,8 @@ static int brcm_pcie_add_bus(struct pci_bus *bus)
 
 		ret = regulator_bulk_get(dev, sr->num_supplies, sr->supplies);
 		if (ret) {
-			dev_info(dev, "No regulators for downstream device\n");
+			dev_info(dev, "Did not get regulators; err=%d\n", ret);
+			pcie->sr = NULL;
 			goto no_regulators;
 		}
 
-- 
2.43.0


