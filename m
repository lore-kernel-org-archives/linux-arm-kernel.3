Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A59C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10mgnfIVzR+iSJ+OJSuQ8EcOXoSsF+yM91bimaJiDRM=; b=oeDlzF55R29HnE99frVN34ApGe
	7/3JeLgnb5/1gPjEpSr6RF0GH95dGN397KHAKzM0wWhJlSRFkmLS6J9b6IYrJ/9rMOhoV8oVHmLfR
	iEiBppJYC1I5fDcBNSDm6BNBohtKZadn1vFhXIgMpK+vm+S4O7qUQJ9rItkHg/aQlzdjs+Sqk6/iU
	SlL5Xy39YR8DOCObDtMfqYGT8ImMZqAj1bzpGVCQjV0bmqhah3ueGrT5cyNr+oA7fsw3NTB+7AD8s
	Vk2tDJdxxo6rN7AXw5n/fKsYnsblOwKHvWtqDRavG8/bxmIMLuRdKWforzpyqQT2Z6BsnTxo31uxX
	N5zOIshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkuZ-00000004OBH-3Vxa;
	Wed, 05 Feb 2025 19:18:11 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkpE-00000004Mil-33F3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 19:12:42 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2f9d74037a7so77359a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 11:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738782760; x=1739387560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10mgnfIVzR+iSJ+OJSuQ8EcOXoSsF+yM91bimaJiDRM=;
        b=fh3ZBXxewVSNKZWWmL3DerjwxaoLfWiq0KO6bv9XVfB+GEzKK5eaby/4erpbj/N+mq
         uEOF/z6EAjpMwuMKKxEuajGzZE6BrC2XR/NRzWutJL/QUi8ZT19VRPjxN6/hu7bAZOFu
         xCm9nL3Za7S5tZBgZqtIC0Nj9SrPFWPDZfuuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782760; x=1739387560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10mgnfIVzR+iSJ+OJSuQ8EcOXoSsF+yM91bimaJiDRM=;
        b=S3Xxo+p5iGiEcPl8HgPlCivCE8R0G4ymr7KDpe5EHLH4R5oBL7LfvTMTeHOSNuBAOP
         X0IhbaNQ1JutWlA4XGCDpx1eDClvteZ3JXIg807U+N6DD3JdK+ef01JUUzjBD/kJVjjZ
         8g/JyrFxtNXD3OE/Y++wphteXYzL/Q/7hcNJRvG/o8tD7WbE3U8o3k/1st+Mm55NICAB
         V/0/F8N5dZQrHMQ9n/nkMN0jgxaQ9gqm5GDYum0V/FBJgek6ossEpA+5hAHX/e5/epAZ
         0ZYPbw862QM9H1aGpG3V/ZtrzHyURdPc+YSTDcUB20RqRuErUe0M2j2+W9tDYlKJU6Ft
         cnzA==
X-Forwarded-Encrypted: i=1; AJvYcCVTyaw+bIjHmNpMk0exMXhTkd53bp4d/UIrSGpw267oyMLJdg/sY8RLXJz8Sx61VLYDY3qEIOvuGtwb4nFlC6JD@lists.infradead.org
X-Gm-Message-State: AOJu0YxYUxZFXiCMzFCtp/L1Bm3KpBRzAGzEBvOEyhnQVoPCrCozzZxR
	uJ7Zbq6NX8O4eGsGcu0hvlNKKWFyHQj+oNf46/O56969T46nZ8eV0dSl6LJePg==
X-Gm-Gg: ASbGncs3i/cJbvGWVM2MKnNaUGIPoXbNiptBqyH+2dUJyUOYv0zLr3f9gxB1tyoTFuQ
	JIcq++mbi0ClfXMrCqnfUp7+wglJjgkhky7Je2KWOUNiv62WK2rdpryoyuArxGBW+k78KJNwIvh
	/1oZjYd5IeGPGSqA1qoqvjNufnDqMHfn2l8CFUXDKXASlRYMBDx17q+2GCO0XuglvLgM6/ia/vM
	cZ7fr0+LzFvA7Dl3yEYowQWL62fAUjyEXoYXOmOUNd8hoUog1h31UqM5NLr8A+dJvlVl2/eHZ7v
	hl+SnEOZxs6x3FNxUdXRcOM8jwXDqRnz86PM8hBAgLoWUqUrdYiI7HE0CD+WeZ2lPIudRsU=
X-Google-Smtp-Source: AGHT+IF/Wwlp9qYJd0K8y8zdsTfFgaW5Ghm0UX8Zc6UwKaMRKZ6CF/yzfZfIYoJNe7yUoNtnkLYNSA==
X-Received: by 2002:a05:6a00:3905:b0:725:4615:a778 with SMTP id d2e1a72fcca58-7303511d28fmr6538015b3a.7.1738782759745;
        Wed, 05 Feb 2025 11:12:39 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ceb1csm12670842b3a.151.2025.02.05.11.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:12:39 -0800 (PST)
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
Subject: [PATCH v1 5/6] PCI: brcmstb: Make two changes in MDIO register fields
Date: Wed,  5 Feb 2025 14:12:05 -0500
Message-ID: <20250205191213.29202-6-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205191213.29202-1-james.quinlan@broadcom.com>
References: <20250205191213.29202-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_111240_763628_1015BF57 
X-CRM114-Status: GOOD (  13.51  )
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

The HW team has decided to "tighten" some field definitions
in the MDIO packet format.  Fortunately these two changes may
be made in a backwards compatible manner.

The CMD field used to be 12 bits and now is one.  This change is
backwards compatible because the field's starting bit position is
unchanged and the only commands we've used have values 0 and 1.

The PORT field's width has been changed from four to five bits.  When
written, the new bit is not contiguous with the other four.
Fortunately, this change is backwards compatible because we have never
used anything other than 0 for the port field's value.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 2d1969d7fd30..da7b10036948 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -176,8 +176,9 @@
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
@@ -328,6 +329,7 @@ static u32 brcm_pcie_mdio_form_pkt(int port, int regad, int cmd)
 {
 	u32 pkt = 0;
 
+	pkt |= FIELD_PREP(MDIO_PORT_EXT_MASK, port >> 4);
 	pkt |= FIELD_PREP(MDIO_PORT_MASK, port);
 	pkt |= FIELD_PREP(MDIO_REGAD_MASK, regad);
 	pkt |= FIELD_PREP(MDIO_CMD_MASK, cmd);
-- 
2.43.0


