Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9341C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSW4cfeQPfDzJdrXVnX+xGV7pqYpNxrZbvVlU0rLzgU=; b=iHJsF/0tu7uFnZjjBmWMiym3zF
	3W9p9ACI5WCwwspQpxtuiIeuOx5BgGn9IDPItuzAKTrtPuHn+j8ccOP5j64OrMS4X6a1e1bSW+Ttx
	ZFDt8UbXuPMt25JboMmI01rAtllfWhONjNvEvgxpgLSNckhR8zpH8FXCAA03Co7i0tt52lqPYvibe
	y/zaFtk9FEJCkcX6adKVzxgzvqGc/rj9qcFdb6PvwhLQis6vj91lAUe9euRp4VBwUdpVYOyWngrOJ
	/UxmbOKWTAXNwUsOld/i5TCWkND7ymWVw0i4XslhmwxA3dZkXNrUE5U+lkG+WIHTxEWNkbOPF4RTo
	8c2dlZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0UO-0000000FtCi-1btO;
	Fri, 14 Feb 2025 18:32:36 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizfm-0000000Fkcr-2pZZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:40:19 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5fcb3ee41c5so590187eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 09:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1739554817; x=1740159617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSW4cfeQPfDzJdrXVnX+xGV7pqYpNxrZbvVlU0rLzgU=;
        b=MnKg3giMdYVro6MoxUjMBUOppRGd49IqCcDos5kCyJVt45HjTJB/M9W3wLArogYIqB
         x38Qkrm23oXJRxOJQf301xHXVS1hl9+0k/tHBGp4obiEYrO7qBDGv7lnvdfsfLziVCa8
         VuhsX4/QQPkhwbJMFUhe1Rf542fp4KsljiUoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739554817; x=1740159617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSW4cfeQPfDzJdrXVnX+xGV7pqYpNxrZbvVlU0rLzgU=;
        b=UJQUh38/CDrYiMU3Im0qeR6SbjY9k79pDX6biMSxNTcmOAp+WyqKACEKSOTWS0+1dT
         sV/wIjl+8c1HSic9eXPJQlI94wkd3vWcoS+fVncJzbnspLYDUB6kUJOF7cBEuaKyf7PV
         +cuj6DO54eVrnTmsKxOUdye2BIlydaBgS5e36/So6MP7TCTRDL1eMjdPHroltDfauQ/u
         SYDgoEsuKLdX8TtQQ7RViAs31mhyjtcsbWxInUqz4YVqU6W/YFB1LSyROmFMykMKuYZh
         8Y0TVZ6Q+p9ES8D7KH3AUBl2r1eUPRY5pxKHKQqnMCuvwQVkQsoWdp7cTWSaSlobt4qe
         oGHw==
X-Forwarded-Encrypted: i=1; AJvYcCVhBSxGyFvbEO3DoHcZ/0JzAc6t+DOb5vZRenmn0ngrjg+3Skh/RacaP5454S3OpZe7TfOPi/+tNCahNWT7q9Ar@lists.infradead.org
X-Gm-Message-State: AOJu0YzyquAxjPmz3Y2ZfO0Gb6CSECT1Zhs4DDvOnSCrtv2ltA5HmuX8
	TTDFBwhZuSf6/VIGtnFnuBhLj+7peRL0+IFAQFar7xGoZ3lGdwD3J+Xv/4eidQ==
X-Gm-Gg: ASbGnctvHJwwVgexNHNfmb47mpwYvtUiYAHpOlKIG1o4fD3rRScqF4wRj6sMxTWaQHZ
	sIhjc/hWpN1uL5c5PCgzaOh53jY1G7RDLp4Up84nMExLpAIyRGwkReNCJRQEiT7HYbUzRe+cE5U
	FhqvFSZRYRzmWE3B+IQ1Qt3JWq8YGGXxw3GCRsk9NJGCFq91ycJ4xy4Izgcy9MRd7h3roZvVe66
	eVYhj37K1dLJS0tQbf4szG3JR9ZHCWjst1+VRL3/txKhkuXdudbLVEvHYiqyP8mKyATjkPvNxCq
	QCF0CA6eOOc5kOz43TpmAODO4CaPzDzjDL79El82r8OAdDTvgvgbFrDnG7ZOaunFs1esD5g=
X-Google-Smtp-Source: AGHT+IGzGxY4gVdlR82gAdB7cjaGdcaL5kCbohfl9gRTT5OL6p6gaqIDXsIm/04V9i6hRIlQvRjbtQ==
X-Received: by 2002:a05:6820:1c8f:b0:5fc:98ab:2b27 with SMTP id 006d021491bc7-5fcaf54776dmr4801224eaf.6.1739554817648;
        Fri, 14 Feb 2025 09:40:17 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fcb17a4ca4sm1284073eaf.30.2025.02.14.09.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:40:16 -0800 (PST)
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
Subject: [PATCH v2 7/8] PCI: brcmstb: Make two changes in MDIO register fields
Date: Fri, 14 Feb 2025 12:39:35 -0500
Message-ID: <20250214173944.47506-8-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214173944.47506-1-james.quinlan@broadcom.com>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_094018_706429_E0CB238E 
X-CRM114-Status: GOOD (  13.62  )
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

The HW team has decided to "tighten" some field definitions in the MDIO
packet format.  Fortunately these two changes may be made in a backwards
compatible manner.

The CMD field used to be 12 bits and now is one.  This change is backwards
compatible because the field's starting bit position is unchanged and the
only commands we've used have values 0 and 1.

The PORT field's width has been changed from four to five bits.  When
written, the new bit is not contiguous with the other four.  Fortunately,
this change is backwards compatible because we have never used anything
other than 0 for the port field's value.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 923ac1a03f85..cb897d4b2579 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -175,8 +175,9 @@
 #define MDIO_PORT0			0x0
 #define MDIO_DATA_MASK			0x7fffffff
 #define MDIO_PORT_MASK			0xf0000
+#define MDIO_PORT_EXT_MASK		0x200000
 #define MDIO_REGAD_MASK			0xffff
-#define MDIO_CMD_MASK			0xfff00000
+#define MDIO_CMD_MASK			0x00100000
 #define MDIO_CMD_READ			0x1
 #define MDIO_CMD_WRITE			0x0
 #define MDIO_DATA_DONE_MASK		0x80000000
@@ -327,6 +328,7 @@ static u32 brcm_pcie_mdio_form_pkt(int port, int regad, int cmd)
 {
 	u32 pkt = 0;
 
+	pkt |= FIELD_PREP(MDIO_PORT_EXT_MASK, port >> 4);
 	pkt |= FIELD_PREP(MDIO_PORT_MASK, port);
 	pkt |= FIELD_PREP(MDIO_REGAD_MASK, regad);
 	pkt |= FIELD_PREP(MDIO_CMD_MASK, cmd);
-- 
2.43.0


