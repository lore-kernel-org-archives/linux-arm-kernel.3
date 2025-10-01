Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBEACCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 18:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKcTz2+WfcXi6NCeJhs4Aeeo3+yILKRVizIKcyvohdY=; b=LsBtGsHWQiMjaOJG8ejLyOEQJd
	gO7Y1wsEvQt0qmj3V+9xkhAfK3qQMLV6YafknRXWa/OhAKTsEOrD0mHYdI9qeRmCHc6vpwFOskfPI
	2OL9TALZFq7RSHtL+IOwQZ0KRw44ZaQ7aXve1wd6upHUJRCVJfxlGiVrRYsu9LeLkPr/m4AQszOEF
	1SQihYpKcvaKSalymgmCl9aA8goJz44fPJD6uBDACimnWo9jrSeozWQm5k/4tNN6qNTPLVGnlnIGr
	drG6u1X84s+bMdaBgfP0aj35SEq1xXybA7akhj7j+UKb3bi4m1m7QP6JeeQf83qfD74MK99GxEgPG
	Qv7bnw2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41OT-00000008jGP-3VUu;
	Wed, 01 Oct 2025 18:17:37 +0000
Received: from mail-pl1-x661.google.com ([2607:f8b0:4864:20::661])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41OR-00000008jEK-0vG7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 18:17:36 +0000
Received: by mail-pl1-x661.google.com with SMTP id d9443c01a7336-27c369f8986so750645ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 11:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759342654; x=1759947454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKcTz2+WfcXi6NCeJhs4Aeeo3+yILKRVizIKcyvohdY=;
        b=D8UR213VJetnkdO/FmQJEe/RGpvtY9KI7Io4RgMhQqXKm+6Ej9Jk1uRUIqaXeJE8Pi
         p2z+yBJw65CrX2758c5IzHFiu3AkH+UdntlsrSM5yVMMhWYzqGDEaofaCbIks8daaQwe
         GJsQyyv1w4qobgD607OJXA+12v2j576VixFI3/TyQn9hjaDsuPKA8Eu4eSCSZ27bVa0S
         cGzJ7v3ITIT02iZ3NwVMQIKk72ttygZyxTMBGdEg8zN/c/TFhsPQrS3o0Mxvawe2NrwL
         08eZiIz2dVu1cJpsHpIUht1iP0Moyr49GMGCH8fUc1ZUJP4LgYFW1UeJB0n38L8qFouo
         bk3w==
X-Forwarded-Encrypted: i=1; AJvYcCV5IUiUNbZupFSK6RwXuasENO7UMowkukpOj0eGJ1net9CR+LIyGDXppiThlgLB2SPexV3aW4IYxZSZ+Jrgg9Lo@lists.infradead.org
X-Gm-Message-State: AOJu0YxvatQBNL21AP3gd2P0nbtIySbQjeOgFLJYUtd0K/RQUUjfUFuW
	7N4wfhhS81UX1KPV9elbGSrJk1ZeXFrz9WbZ+213FFvAhJL8VQrjPMoo3OLwcqE/TE835bViMaa
	h9vB9hF/caN0dU8Joteam3XDtqidK/v2NEXldfNn4R+yCKMOSS8dQH18JMw1kv1iyc5LoSNuzWe
	SipBSh+fX2LzSJnBRGkiG8ZjOOxjflfmmz3qS5+opy89Elvhxg+vI9d+3qQsTuZ6pHAuU28yp/S
	oBK1DMsDnYd2d1z3W5ElI/N2fs=
X-Gm-Gg: ASbGncuZusp8irzdfRMAozpqPv/x3s0RyTu4U3bsQVIzX6JnRvSVzi1jkOxybQ97BWe
	xsPQFsq8aGp/IA3qlxH7ejjiQeOcIKsDvcgF9PvgRFZA6wgSmduaZ56crlJllTrKx27apUsUtR3
	J/iJ56YN3DXu4vl5WkTlf2hxVOovfBiIE5hlYKv3xqe+QB71pTANUm7sD3T796m8C4xp7DNaRbj
	zN+T9fNdUw2W4iXQPqnLqwyrGbHpXU51X2PGH7TjH18nfMotgi+oyjfBDjokz69JcL1wC7Qhsf6
	Rwt5mewl/gtXjuHpWuL1sDFfCYXOgGPaQ1zdPjjGDG6Tk9lvyOBIH1GZ+89GN4qnwVTfarObC4K
	XOeGI7T3vBEHnkvdXMhe08ZQoHqu0iOXDoVAPLci5YqlJcZ9GwDkYB8kMqv30Zfli2O1nUsvJOC
	/pdAYo
X-Google-Smtp-Source: AGHT+IHmVpQnUv8kVQ3l/0KfJhJl8u4mC/O6bM9CvXNf8VSwwFiIdEaYs3MKM1KDSh8ZYBRKOD5lFIF8odOQ
X-Received: by 2002:a17:902:e801:b0:26f:7db2:3e1e with SMTP id d9443c01a7336-28e7f32fa97mr65430715ad.47.1759342654333;
        Wed, 01 Oct 2025 11:17:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-28e8d117f4esm232565ad.18.2025.10.01.11.17.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Oct 2025 11:17:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e0e7caf22eso3826041cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 11:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759342653; x=1759947453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKcTz2+WfcXi6NCeJhs4Aeeo3+yILKRVizIKcyvohdY=;
        b=FX/9GraE+Lku+3VjhCiR4rTYaxKCkqK86ECt38gYjLIpJWP/AcHGO95AiSRHpxNxyV
         5jdETKkhl3Q4Kx897PgafspFFGMi/S3aLMK5YO5s1P9A6Jhzwxeb5EAeAGtCOtcgtJB6
         t+GQiuq52L3/byffdl1odR1IDqTplkJRP7684=
X-Forwarded-Encrypted: i=1; AJvYcCW8oQFaF6gEZO2OgANH3rCfNMrmOHt0CDGkSvNgJ0eMXw1xN9hrkLQYU2hTbqEdYQN2gLwvxSIGS7tmEsAKIc81@lists.infradead.org
X-Received: by 2002:a05:620a:4507:b0:815:dab2:1ea8 with SMTP id af79cd13be357-8737a8f483cmr563555285a.79.1759342653149;
        Wed, 01 Oct 2025 11:17:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4507:b0:815:dab2:1ea8 with SMTP id af79cd13be357-8737a8f483cmr563551285a.79.1759342652745;
        Wed, 01 Oct 2025 11:17:32 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55c9e78cfsm3847671cf.27.2025.10.01.11.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 11:17:32 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: peng.fan@oss.nxp.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v2 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
Date: Wed,  1 Oct 2025 14:16:41 -0400
Message-Id: <20251001181641.1561472-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
References: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_111735_264226_02592030 
X-CRM114-Status: GOOD (  11.04  )
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

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 97d958c945e4..21b78f468169 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4972,6 +4972,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
 F:	drivers/gpio/gpio-brcmstb.c
 
+BROADCOM BRCMSTB HWSPINLOCK DRIVER
+M:	Kamal Dasu <kamal.dasu@broadcom.com>
+R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
+L:	linux-remoteproc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
+F:	drivers/hwspinlock/brcmstb_hwspinlock.c
+
 BROADCOM BRCMSTB I2C DRIVER
 M:	Kamal Dasu <kamal.dasu@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
-- 
2.34.1


