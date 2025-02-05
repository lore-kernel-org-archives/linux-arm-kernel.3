Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0B6C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rshGoTVKNv7yJ8UG0ncdA2L3Ez+eMRudoZQa+hQwzgo=; b=chWgwbUG4Gxf34SGLBgadmWU4E
	x0bpMhMQNRQKxOqTQNpcTe4MqmkxAE5BUgPQkWoqr18LbMNvXCELrh0htqvRhvtPTWWMRmNusRj5z
	Egi9y/xYMrBC2MfksR9wjTEfmwMha1TI9HSD9sHeb9LU6EMKsLDyHgUseUF2sjqDKoH265uEgj+BU
	4KAF2RaIw1QF/tj0gOwruL5pGlFxivza3x4u7XIIBOeZDAK8IfpKkxXsopsRLXwZZEa7rYLkfX5ap
	C7ONI4uw+LTZ40h7IO+dUShUvWqPU3Ja5sNCH/esAwekagv04HocqiW/Rq5OabcRDxE9m4wwP4Dvo
	BfG72Vew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkro-00000004NOC-0Sm3;
	Wed, 05 Feb 2025 19:15:20 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkp6-00000004MgK-0POp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 19:12:33 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21f20666e72so3474005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 11:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738782750; x=1739387550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rshGoTVKNv7yJ8UG0ncdA2L3Ez+eMRudoZQa+hQwzgo=;
        b=CVc1CDrU/pGufVL7vz01sUjaDeIrgcVTTEJAwLo9CT+7d6GL95QrwVTesONWBKnVHa
         3r607he1JK2I9/o30SbWhSoEVtNH8H/y5FXpdPZ/Mq1bF5YkK9QqSCbtvfIf+0wPHY34
         B0c+eVgrErR5bFvC4/s4hHtJBZYEZrDoedcVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782750; x=1739387550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rshGoTVKNv7yJ8UG0ncdA2L3Ez+eMRudoZQa+hQwzgo=;
        b=QfrDdxg5Bnok0HgGCanyv3xEA/dbxG6hITDwdHtg32lXg6jZaC6LqFmDNSsu8FRQ+g
         1Ctxm0KtzGyHM9qrp488u3QqV2ETPhOTiEZfgsOTY8UetCPItHoixFlEOz+KLMA3Lsqi
         MrxRCu9MkokKxtqaoeRyGPgY/BmAVUDjKrIsUAyQZs8EyuS8DplGFBHpNkN//37jAPi5
         LNmiPyoeoBpSA602GGDiC5tNGhuV48oMpb9FFKycj4QJjV05IUqLDC9M6LTHQMdvkT6/
         rnFAye0pDErOYHf1AxwRD8ki/RniUWBF6pZRMeXlwzJrcBxQynwPtj5tug8jKkTG3s+1
         CfDA==
X-Forwarded-Encrypted: i=1; AJvYcCUv/EfSxqibDmfX1V+ZXxKNKhSK3sCWKPSFztIeLrHy9HkmL9iqc468xV6PCJMuejMsO13GiiEZgLeRpKoWyGQ1@lists.infradead.org
X-Gm-Message-State: AOJu0YzO0mhGCjGAqkyDWKDZFTrgKFCAPBNjb93ds6e7bow8eIBxjagq
	kmrVh8SGMp03D3OatHNP8wRybY5A5m7+24oN+FedgFQ0YpGl8MHL5surLKh7rQ==
X-Gm-Gg: ASbGncu43ulWmHXa71/DlrcZHA6lYN42SuA+to6rK7E24MPjg6gyhwFXvwENFesu862
	C6JXWVGBt91lbRDxh9VHHyj9FVB8iyNJ7rWji6UHJ+Wlxd2xQy2xjsBEN1S8c4G07BEGdsmRpkR
	zvD+FHEW+jQQMrMENx+0kC9pS+4ZA9dTNNMNa4vO1yWVM7/+BbTxqMx1k0nQOx4xtXMFq7xsNbu
	pL58/ZTrhV2Xd8Rs5e2N/n8L+Vs00K9z4mI5hjfJnogU6+z7eMXuHQgZcmE6o8KIEp+y5Fjj0/E
	vffKNlVg0WUzx04mOxqi11xW29eE73MHKz7dFoq7K444apWhGmhQLnOh31vdwaHNpKbxjRQ=
X-Google-Smtp-Source: AGHT+IEvH1UsOv2Pdep53yziZn/D7SThmLNGW4jFaeetD7lQZsfU1M4mdvMGq8u34jzx7Ya85/+NnQ==
X-Received: by 2002:a05:6a20:2d0b:b0:1ea:ddd1:2fa7 with SMTP id adf61e73a8af0-1ede88b9994mr7396175637.28.1738782750080;
        Wed, 05 Feb 2025 11:12:30 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ceb1csm12670842b3a.151.2025.02.05.11.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:12:29 -0800 (PST)
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
Subject: [PATCH v1 2/6] PCI: brcmstb: Fix error path upon call of regulator_bulk_get()
Date: Wed,  5 Feb 2025 14:12:02 -0500
Message-ID: <20250205191213.29202-3-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205191213.29202-1-james.quinlan@broadcom.com>
References: <20250205191213.29202-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_111232_142553_A077D434 
X-CRM114-Status: GOOD (  12.00  )
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

If regulator_bulk_get() returns an error, no regulators are
created and we need to set their number to zero.  If we do
not do this and the PCIe link-up fails, regulator_bulk_free()
will be invoked and effect a panic.

Also print out the error value, as we cannot return an error
upwards as Linux will WARN on an error from add_bus().

Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index f8fc3d620ee2..bf919467cbcd 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1417,7 +1417,8 @@ static int brcm_pcie_add_bus(struct pci_bus *bus)
 
 		ret = regulator_bulk_get(dev, sr->num_supplies, sr->supplies);
 		if (ret) {
-			dev_info(dev, "No regulators for downstream device\n");
+			dev_info(dev, "Did not get regulators; err=%d\n", ret);
+			sr->num_supplies = 0;
 			goto no_regulators;
 		}
 
-- 
2.43.0


