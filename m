Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A7ED778AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 18:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PWeU1UwAO4pe3zvezy5Kiy+/X4gvo5C+nKCDnSN6RYs=; b=jFBKdIitYuNTC7LrA6qL49GJUL
	3TnKavuO0VHw534W8FyBOKa49KHVbx3mNz++sA1xtTrsb5+oZDq8YJQTV0nHXjZT/JdIS98gV/NEU
	7YtE4NACyfjDQYLlJwO2OYILh0fSLLXWJMyqcfC4IWx+J6RJB4QPFmBwhwcnKaQfhHgqPXps5+Swo
	9alsXAvVhvLIClcx4N+jw6rYfljRk2pHTDrHPkubLfjpyIk0jNPVx2RtlbAYMZW2xvT+bXBCZkcNl
	QjlAkpv3lpjNjG7ipJCXLU0ZibdJJu2YxwvjF2NjDHcni1ThZj4a7Y+D1h+55tZfO+nrrGt0ghLEq
	bpTNV7Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLkM-00000009Kw7-2akh;
	Fri, 23 Jan 2026 18:19:02 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLkJ-00000009KvY-2hNA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 18:19:01 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8230c33f477so1100364b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 10:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769192338; x=1769797138; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PWeU1UwAO4pe3zvezy5Kiy+/X4gvo5C+nKCDnSN6RYs=;
        b=DKfVmRRTh9B3ZbppkgHZpvR/BBHv5apzBYH9QJQH0vc1yJftzTFNTLQ6jn+lJ0YlxF
         eO1p333gFJniEKd5B++tbDEJmx5Xxb5j3pnu/SXQuuXizFGz9tLUR7V9kwqVasGaw2OB
         JPB3N5Qs2vV6roTMVFvIk2XuQhn7DtyGICXHGhroJSTRgZE09idiN6IKi8VNzHHs56Kz
         IK86y2AIE74/nlQdUruy6LK90/e4J4nCi4An4F5B95mBzvQyvhVzSm3PO8cbauXK+klQ
         VA/G/Tc1NKci3fcWtIq31RYlDdcuds5mMF5t3o2yuPn2nk3xO2lv2iL60cKg3aP9rsLL
         832A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192338; x=1769797138;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWeU1UwAO4pe3zvezy5Kiy+/X4gvo5C+nKCDnSN6RYs=;
        b=W2NFRuOBNwf+0yTivrV6PxXhoz5YzaaWE2nksp8sEXXEd3ljx3eEjE7WxijCAISSO8
         AKMd7gBiyvq0eOZyZkCT4eCOepV3HLeK9A1ukyVbuddGARiTeXFvpTXV3vOwIViPf1Rd
         iJtmvsH0scIcGUTDsjfP10IWXyz4XQsqsCnlmA1XC7XR25HAHZugeonDME5uwmKbjJl2
         ANUMK15tbqPMnS8ZnkT84Y5acCPwHwPl5vaJtWQdJpZGxTP5ft+ChR+My5Y+l994mTC6
         ZckWcx6R+FFKJtOI57YgyzoX8p9Zru+oXM2aVhmSSP0OgngtCG5ozmQlO22yBMZ1II+L
         F9+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsM0UGbG/gz2n0fyPftdwKbEmM/Y/mqi/PmsbOrdModGGmyl61MlLU2jFFN3dPmc1ln+9Fc1wfIxKBQiA9/gr1@lists.infradead.org
X-Gm-Message-State: AOJu0YxauHXgD0z0og3iJmcAJkGP6rE0YjXIEIRaUdJltzUu+4u9S9pm
	v69PLqQwzHjrJZpPCqrLKwKbutt2dDPQkPuXd8AdnGXOycn3OQIXkDJMDvLmIKnYBQo=
X-Gm-Gg: AZuq6aLeeW0R2XOzsqqGK5K2weqtxAE/7OTte1SEoGgEeXX40ZZheblTMaPfkbNsvkA
	AkwZnA3PClv7N/0+r8bkJEsWYU0F7Ky9TWm+5fCGPsNi23zd+m6qHGK4W2G1Dh2eTpbcwF0HvHy
	UDBbP9fcmWeSHxbV+Tg1hfbqldLoY7nuIPGcrr6PtkGOBTe9c1JalQBSZR8JKCRa3vZ/RESaJXb
	//5srCZQMFAY9CZWn9fXjB4IcbKV/1EkLq+D7LEC29CJljEicxC25WI6mrZqv0vbw+8+AxcDa9C
	LTGEeQscd5uCKj3x6Uye8txgdJP3C+ODobIvyUry8ohE0GU7g2UMIxfaKFtowu+s2srrPxYlgCv
	PrnRIjvCAz1TZ6WfQYB5SD+hanGR263QhlyDjWPpHeyRPdXZfI2oWRZIktLwm/Jbq1FqFlT92m/
	5PKeuHcZwg2rsOeyEbgyxo9BCK
X-Received: by 2002:a05:6a00:e0a:b0:81e:63b9:5830 with SMTP id d2e1a72fcca58-823215d894cmr1814046b3a.18.1769192337818;
        Fri, 23 Jan 2026 10:18:57 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873fa99sm2737765b3a.58.2026.01.23.10.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:18:57 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 02:18:49 +0800
Subject: [PATCH] PCI: imx6: Fix device node reference leak in
 imx_pcie_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-pci_imx6-v1-1-6f4379fc5160@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIi7c2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMT3YLkzPjM3Aoz3TRL8xRzAwsL85S0ZCWg8oKi1LTMCrBR0bG1tQD
 csCPOWgAAAA==
X-Change-ID: 20260124-pci_imx6-f97d70887dfc
To: Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Trent Piepho <tpiepho@impinj.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769192332; l=1059;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=5m2pAtLwQAG5n3tjRHX6phbB0BVWp/5Ljs87oOwdj8o=;
 b=c1kmFZYTjUboD6aDt5uIFJ4j1wdUwKwQCWHZWpd6SRlVQvVyjHEumpT4BDWjLBheMuh5h0/MJ
 gOEw7yXl6kNAAkxZ6ysWS9FtiCJsvPbL0qMBG7hJkMn20pzp7jVkVau
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_101859_712209_7BA45C6D 
X-CRM114-Status: GOOD (  10.15  )
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

In imx_pcie_probe, np is obtained by of_parse_phandle() and must
be released with of_node_put() when it is no longer needed.
Add the missing of_node_put() after of_address_to_resource() to fix the
leak.

Fixes: 1df82ec46600 ("PCI: imx: Add workaround for e10728, IMX7d PCIe PLL failure")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 1d8677d7de04..3ae02712d3f0 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1675,6 +1675,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 		struct resource res;
 
 		ret = of_address_to_resource(np, 0, &res);
+		of_node_put(np);
 		if (ret) {
 			dev_err(dev, "Unable to map PCIe PHY\n");
 			return ret;

---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20260124-pci_imx6-f97d70887dfc

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


