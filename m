Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3814ECA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 17:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=31pvuPyzmxy7Nu/xNQn3+yYnNi6oTH3Hxdcf+kkmhtw=; b=A9cRcrer8diFx88P59/6NVQof/
	sWV3VBSVWBa3VTRTVjWU57TwfA6aklX2Sm1IDqjHz6R3/rKyqfH2kAZQiq/LdvjCrwjHhtBZtvKku
	v2KVLzWucoHlvm02UjklzSaaIO/gPibUMYr01IuF+MeWRHued0xig2DuaNKnDrqK/4I64cNwL+sLo
	xVTbzllzCxygMIyn/265yAfTHZuJFvjY3Qwak6HlEsHnqNc9X8NwKyUMHYsAtNxpfyawFL1JUeKhf
	9URbC/gWfFXN6+CKf/IzzZtzQ5vHvNvpYeGIgHaxGq1h0qnDC+IZuRVZcrqgbms1PvAoDQlQr2A+I
	DV0klWaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utret-00000007EqH-2kD3;
	Wed, 03 Sep 2025 17:52:35 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnu4-00000006eVd-3q4f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:52:02 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-248cb0b37dfso63084515ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 06:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756907520; x=1757512320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=31pvuPyzmxy7Nu/xNQn3+yYnNi6oTH3Hxdcf+kkmhtw=;
        b=PEv+L4Hv0yRDJYsndGLJ6hRXLO4G/T3i4pUNNz4c8Gs8yWLp4dyLcVuEYHAikCDxHC
         ZX8ld/wywXaEYoKKy2koEdBjY666y8sqsEPpyrs7Xv8J+J7bXJDI6EDZwN5tjsHdmyN3
         7D/b7hcQewovbPmQlosf0LRswSRrFE57YKZTAJFoB4wofDnCJI86QwbQhsITufwGsi12
         JuD6zwZv59uy5bqKmHCmhBdxyHrxWFD5AJr/SBZaAqNm72FsCaKzDSk2VOWlqMAe6e2I
         TmazFMwYDo+5P6J1bpysuVw73XdPLmQjndnx7NoHD+zGwRex5bXPy0r8SZJdh6gI4+9J
         sxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907520; x=1757512320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31pvuPyzmxy7Nu/xNQn3+yYnNi6oTH3Hxdcf+kkmhtw=;
        b=cKuBOAeVc7MhALEZtpsDM8afNhpYCdxsgqA9/4DOhcJ7GOF+ewp+cHaAgMz17Wy9Fb
         297xvFheA31moY2rqFkdkPoXfgRbHuIzlvk4QW0JIAab9ZfJIwG0OjY3v8ABxQBO2wby
         H2LXdEPecVyn/2om8u0odeHc5jLqDGbwT1z6IQl0Xbm5CT1kWNDLBkd1kqbSQirpFATK
         LVM0ZaBTRQH1Tu/DcTlluvVvHP94qGBa1yBbXEk6k5WZAXWwIMf5BXoo5yZshZ8QaCYB
         OAwilSBYDhZ03ZqnEdBMfQG7ivSo1cbe/smNyE3qaKnKIExf3+juMHxWwR64VC7U+qEr
         pTTA==
X-Forwarded-Encrypted: i=1; AJvYcCWicW38AkQ07bZWF9ftA64dhBmhTVDRl/qgJ9FXVgd/POn2bcLE6Q6XgVVIFjmzWyNJ20R8OYLzSscZWcgdGCA3@lists.infradead.org
X-Gm-Message-State: AOJu0YwnAQWH6vtnOGwm+UKPGF2uSIGnALUDlaanlsMFR56KKgGfGUZF
	TgU1iO3MbkMucdXf1oSbvkP41sVv42SbH6BCX+ZBYwvQUsKWNrF8OjZG
X-Gm-Gg: ASbGncv1HLmQT576kKAVqBpYbCUy08XIirl4GsRagkI3axxjEEq8Chw98lNjpfWYNnz
	2rsEeYx3f9h4ymlxofFdMnuOlIQD3NGNXeXV+kJMeNR8C/vzxMfLkTl9TN11Oe8zBlWOS+zFpMT
	Cd3JYvRjLvPB2x3izH5HW5mpXTbXjd9JXLHtqrWKvkQ+fEPlq39lMRAisSw3sne8BWBLzN+7WR7
	BrEorzH0SzxdiVboXypNG8KUrGQPvJctM6ZvWcrXps71NsSRVdsG0I1M37qe2Js6ErqoxSsgVH9
	47MEtrDKpUXLm2QhsJTUw1ckroHgZymWnqKhrWvSe10qy1izwfbmkK+f6CIozm404mEdBIWlKBI
	A9lmNv12NwFnNAbpjpohynmLsdeePPmMdLu7z7yNNrCYGC+YybxD0NkimUUSAVaFYpdSsY5Ve1S
	h8sV4exhj9sVqF6dJTDXooWyNBzdt4Dd4XUGiPNIOfmFoapk+XLqZEg8s=
X-Google-Smtp-Source: AGHT+IGPXxKq1vceqgwEfnjmmFK1BX/HaS7d7j+fXNMkyGVFiTc/r6Px77JsUZgpTvhRMqRYHCDxOg==
X-Received: by 2002:a17:903:350d:b0:24b:299a:a8c8 with SMTP id d9443c01a7336-24b299aab5fmr68322845ad.20.1756907519733;
        Wed, 03 Sep 2025 06:51:59 -0700 (PDT)
Received: from vickymqlin-1vvu545oca.codev-2.svc.cluster.local ([14.22.11.163])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24b2a5852a9sm40585005ad.150.2025.09.03.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:51:59 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Trent Piepho <tpiepho@impinj.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] PCI: imx: fix device node reference leak in imx_pcie_probe
Date: Wed,  3 Sep 2025 21:51:50 +0800
Message-Id: <20250903135150.2527259-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_065200_974927_FF98C77E 
X-CRM114-Status: GOOD (  11.62  )
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

As the doc of of_parse_phandle() states:
"The device_node pointer with refcount incremented.  Use
 * of_node_put() on it when done."
Add missing of_node_put() after of_parse_phandle() call to properly
release the device node reference.

Found via static analysis.

Fixes: 1df82ec46600 ("PCI: imx: Add workaround for e10728, IMX7d PCIe PLL failure")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 80e48746bbaf..618bc4b08a8b 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1636,6 +1636,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 		struct resource res;
 
 		ret = of_address_to_resource(np, 0, &res);
+		of_node_put(np);
 		if (ret) {
 			dev_err(dev, "Unable to map PCIe PHY\n");
 			return ret;
-- 
2.35.1


