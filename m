Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1087DC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 15:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WRamQXpDUK+MxHYzTl3WtRIEBUdJqjnF0kXvecvEq4=; b=1ochwnc7Wj6dR9eJV5SEF1HLxD
	phVbmvqAbxtkY2fiEJ0M5W1u1wMxRV0cwAvB3YgqXTERhTdbPfaWF6rk8TeT1WfVJ815Xhkw2695v
	Qe/CpZOwKm6LE2zg6CCtoiljgYNdVyNP3Hto9EBtM64lYq0ZboACe+GR7msnfichF8Kc58UcoUBwJ
	+v32+qLa1Ms0VQbHDsP/KScBPrSAsLlOrG9NosSXZAlt5CPQx5ITu8qGQRnrZ/XFUyGuH744SV2iU
	cKDEnszaY6ArHXePxDKuT7uMcPfCBv+LkhSnYoS8EQiMVhxLnRW/28v+U+CYZTjr2J4sJIkPifXU4
	puErsK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxnKM-0000000EcW1-3yM1;
	Sat, 22 Aug 2026 15:08:10 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxnKK-0000000EcVO-3WG7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 15:08:09 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1404890a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 08:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787411288; x=1788016088; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WRamQXpDUK+MxHYzTl3WtRIEBUdJqjnF0kXvecvEq4=;
        b=AyhjPBIX9+1gEubqeUuOi6EDMJlfU3ZIepdCXdShWImkwyUeeVIsCZgK1ragy+skOV
         otYyn+mYPkTKVA1n2FDN4QltrlsEvFde+pbxQGxBIe7NeZHPhcKS/SfwH28AR7E7rwKL
         1yvejZDBtFz8cfo01UkOCBHQWm689xQ8TJZboEZ/mWK2g+LqyIC/c527e5mBChMG1WeZ
         1aLTnAD6gPMe714Kp7vCPW9P0TYEy/JYKcKj6knVzJN1tCenabo7inODWoULRXBbLFeN
         xwQAiloiQGIB8SJ50ogeG5P0OedPKaPkBoX5dv53HY+KvwlXomruKX92/F4Xw7Lpu7Uf
         FzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787411288; x=1788016088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WRamQXpDUK+MxHYzTl3WtRIEBUdJqjnF0kXvecvEq4=;
        b=AZJkAQSuKVpr2T2VLlihADVOQA/eI3wTbp1Uyrmmmq6p4TnYZASkw65IgIaApGKSkz
         dMGrneSKPH5DFuiQVUUKnxKZkooWonILN9Z5YvMyz2p9ZstakS9YzgeXEjyqHSwZeVyG
         0FRRwKXAuZeBcigxeKZ4B0vm9d5oGVaxGZSNno3s7L1ZTC5LP0mzUR+HavawcPQpxcdw
         aYwW0WbG5/WqyQp2dA6RZY2AveofG3VKTE8knQsjHx1XdlqYNUFxtW1WH/3z27G3BL/H
         3g496crlPGw9DFJneb0zguSioX4Qzgv0bSe/t04D6GOtV96gQd4em8VLDe0eG8slq1XY
         tldg==
X-Forwarded-Encrypted: i=1; AHgh+RqV6zb+82E6UdICcPYzLQJEwQj0JFA7B/3GtTIppYG7IXUFjT3Gn1b0NbZGeRAJbGJijye0FcLSZteL8wbON2AS@lists.infradead.org
X-Gm-Message-State: AFuF++kH7ZOeycR3NC+uKpUl7aWIAGIVoeGTBsL6C8GGwh4Y5EP+IY+s
	+G6ueMwuS43Jlz1hEYRRUlaAf2jpPDqab37y0K69tenzdJtMmV+4hYIq
X-Gm-Gg: AR+sD12LTKaUFKKuksuTkAJsWbnz1cwxi552xiZREdb8LFe2i3ULzbNgWA4g44DFxcH
	U8t4Y9zub20u4CmEMJnxnRgzOYQJJ39r3pXOj+RKfNG0J26MknRJyTviWimoQvMshq/Ochbazlb
	YHYOiIIrOyJPyMAlZZ82enQ1aP7/H79QZBKscl9Q4Rd77EsIQE7Isr7dPQA6rR3iL0/C7EqNsZE
	sKPCA1DBbPt3xNjIIcVQdlHQYMhoyspVfXp/oIygR2bp9ELe2/kE43wLMFYp0/3GXRf4vgt1Wkv
	ALJHIB2bL+gMdmawLEh0QV9Utsvam5kaSVRk3uEZedxkz86OhaJBP6lDv58m8U1tO7xXOFM3rXG
	/4n+UD0EuN0kCMskD9XR6nnQDw45DZhZ2hAFZ0pC0eZWCn5h9U3u7Q1wbarZtHDsmr5qWHBd4Yd
	YpbXv1Pud25+0WEt30VLYD5YGIGodWrDwjcV/ft1vtz7urqg4UiVxAY30aJSzTigMB7mYMILlIp
	VsnWw7JvmWNoR4QUAl0zJe386eD8sZJqA5A0F1a2BqaI4FWYmPqovRKWMp4LA==
X-Received: by 2002:aa7:88c4:0:b0:82f:2b0:2809 with SMTP id d2e1a72fcca58-8520b942d1fmr10233534b3a.1.1787411287768;
        Sat, 22 Aug 2026 08:08:07 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f03b1ebsm628242b3a.30.2026.08.22.08.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 08:08:07 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 22 Aug 2026 23:07:47 +0800
Subject: [PATCH 1/3] PCI: dra7xx: Fix clock enable leak on probe failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-dra7xx-v1-1-23e204d5548b@gmail.com>
References: <20260822-dra7xx-v1-0-23e204d5548b@gmail.com>
In-Reply-To: <20260822-dra7xx-v1-0-23e204d5548b@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sekhar Nori <nsekhar@ti.com>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787411275; l=1209;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=iqwaq39/Zpa0iH6/a6W3yQV4x79xW81LRfZe/TmtbhQ=;
 b=JQwJxBp9JSiXLkuvgP9DsAqIhnNVN95oebkqBf5QP+o8m9TooJuuD3/GmQ47Qgmh0RJ1HbYN/
 XhZFZF9+3GCASDzQMKX+JxGYZMzSbVHilzqclpMzDdh1CfPZODqjapy
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_080808_887185_2CCC963A 
X-CRM114-Status: GOOD (  12.74  )
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

dra7xx_pcie_probe() enables the optional clock but never disables it
when probing fails afterwards.

Switch to devm_clk_get_optional_enabled(), which disables the clock
automatically on failure.

Fixes: 5af9405397bf ("PCI: dra7xx: Get an optional clock")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pci/controller/dwc/pci-dra7xx.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 6ae5b27e27b3..d43253f7dea6 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -732,15 +732,11 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
 	if (!link)
 		return -ENOMEM;
 
-	dra7xx->clk = devm_clk_get_optional(dev, NULL);
+	dra7xx->clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(dra7xx->clk))
 		return dev_err_probe(dev, PTR_ERR(dra7xx->clk),
 				     "clock request failed");
 
-	ret = clk_prepare_enable(dra7xx->clk);
-	if (ret)
-		return ret;
-
 	for (i = 0; i < phy_count; i++) {
 		snprintf(name, sizeof(name), "pcie-phy%d", i);
 		phy[i] = devm_phy_get(dev, name);

-- 
2.43.0


