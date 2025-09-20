Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFC9CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 09:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pb3oQ4OLLQ4LwjywIbmgSN/BEASRwYQS+6IVWtGhrH0=; b=iX49NHUdG1WZRb8o+CtJN30D6V
	kc+GGBuqPXkDA6JcSVWnjeOC5mDnAjhwaup7EYTGB4IVSt0R4bVSktilqNUjrTjQfya0Eyf/ikykr
	PlrMhhGmuJir10N86VbherDkzhB2fcUTEhpohaqjSfKyvJmrhv9KNf7QmQ6tvGrcOspWP0ebumH1H
	Yo0P6bMQJCWv6XYmEwwMu4gaEI+do8o7Ql9xtJkDDEUrt38tgEA9bZdLaACAJRcS55ZiOmKq7uaUc
	WIJnPcb7skKIMTcRXauctGOv9Noh4HTnwuNzW8ARWswrpJQ2tc1VedsCDm2Io9afdos4dltCv1425
	EZanVGwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uztrV-0000000576u-48uA;
	Sat, 20 Sep 2025 09:26:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uztrP-0000000572V-2m2E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 09:26:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45f29dd8490so27634705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 02:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758360386; x=1758965186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pb3oQ4OLLQ4LwjywIbmgSN/BEASRwYQS+6IVWtGhrH0=;
        b=NrIJT5+BkGsgniG8A6vLiEfcJXgE6ExydKOnHFJOqmqRT0QU+6x+2Pkz+pCY3g/kcG
         VMi7hIgq6lO/5K+dudy4xueUmVexL3cGQScyx2Q4mAk8FqXWY2hr4EYcsgAuhWbA+rTY
         wHYXupqprFjLkkMZNAPa16MvlqKMX+JREayqjX0ql/VDOjCIWgHijkCCLH3TJLk5lkEC
         8MAU4ORYilyDVf5TM99KvL5OigESRzwSZ9hq2ON0vGDfEECSk0E3rgW0zX1kmiO9btmQ
         CAj6sLczRQ9rKWcdWyO66gnJchp8rRETjJmi20ofrwIBuqVTqNnz7m2Y4dVPyEhsmRk8
         CSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758360386; x=1758965186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pb3oQ4OLLQ4LwjywIbmgSN/BEASRwYQS+6IVWtGhrH0=;
        b=pzGS0TA+hgUsUDBKqZbMgBiWDsek36RWZjEKPmfahJY+VYx8O6DMkPwkw6E12gK9YC
         eqkKDnbaz0dhcES8MFgDvQ7kYgDo4MBdLBbWPGLvpZYZQoznyDSYNStcm3y627MU25L9
         a4Qd2LzE+SXGMDLkkXJg/CsgELehgfHAjnbgLOKqYDP+t3RZkJY/Zeq/BuncRbN0XaLU
         THeEbFSNOINIt5y6XPXEvl0Rvhl8nJgE+ptvb3AROnnvLu0RqvuKQaD3SpYHM3bujEPc
         qAfkeHnVhaaWWijyd9Ii5IOcHmUcujMlN+kZCvfy6wFMR0iPRq/qWkUOafKHd/Ezwozx
         Dmzg==
X-Forwarded-Encrypted: i=1; AJvYcCXu6MMFmIX6sl4Ppw8BnTRmrygoiPzWGz8AnaO7QL61cesFzQWHtpTV+cC8Wp6JTF/NbogosgRCUqdY3OoWeNyF@lists.infradead.org
X-Gm-Message-State: AOJu0YwiORfHZjZTTocv3oAI2XownIsPt5CYvCLXJZc/KIE5nj/JCikL
	XSCTl4+ytMyKjFrRBIP/vKun5UKVEpbnaQbR+Cth1bU/qaiJtJQC/BcI
X-Gm-Gg: ASbGncsuL6JM64MQxEP7FB6utnHqJz23tfx/GBWR1nYaglt8Eaonrj1vnWYu0IgUoar
	5mwgDXBiYIHgqLct6efJfObLdU+4pzf/IVDbN1IZ8qzry2Zgk0ALI/IUmhdOjLch9WVcqreu345
	uh7His/haAvRYdeMytfKTCfi63JuBaRROsxZnGjKO//CaISd0r8L4fypwv7MT7aV1MCkSuH6KCe
	0Hgn0mfhhS3ig2148f0cEvmo0Rx8TVYUC76BIivXpMKr19mgTsC57aGIVg7nW8+xa2pj3KljPIK
	kCoZHQTe4O+KgtIZBIj6XbZk6hh3jt2S6zDBAs7aa2080iybueRoC9FB5XvsaXXU4QRtFzsJ90O
	GPtsAzSjdViyHEX/lfraER7VLykdKGLXE1dTtzAph7PTsVYCr1vfwQl2mDa/e8p4N78Mu6lQ=
X-Google-Smtp-Source: AGHT+IGt8P3rEmePLNMaAwjTE9SxZVmwgeAbuDHf0WXIvJ1mTKDwPrysE7A1gCCOMrssz2H1L7Vmmg==
X-Received: by 2002:a05:600c:3555:b0:45f:2f0f:6649 with SMTP id 5b1f17b1804b1-467ec36a2camr71215025e9.8.1758360385528;
        Sat, 20 Sep 2025 02:26:25 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-467fc818e00sm73648535e9.0.2025.09.20.02.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 02:26:25 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] PCI: mediatek-gen3: add support for Airoha AN7583 SoC
Date: Sat, 20 Sep 2025 11:25:35 +0200
Message-ID: <20250920092612.21464-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920092612.21464-1-ansuelsmth@gmail.com>
References: <20250920092612.21464-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_022627_713373_6CB15AA3 
X-CRM114-Status: GOOD (  13.02  )
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

Add support for Airoha AN7583 SoC that implement the same logic of
Airoha EN7581 with the only difference that only 1 PCIe line is
supported (for GEN3).

A dedicated compatible is defined with the pdata struct with the 1 reset
line.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 75ddb8bee168..db9985375be9 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1360,8 +1360,18 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_en7581 = {
 	.flags = SKIP_PCIE_RSTB,
 };
 
+static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_an7583 = {
+	.power_up = mtk_pcie_en7581_power_up,
+	.phy_resets = {
+		.id[0] = "phy-lane0",
+		.num_resets = 1,
+	},
+	.flags = SKIP_PCIE_RSTB,
+};
+
 static const struct of_device_id mtk_pcie_of_match[] = {
 	{ .compatible = "airoha,en7581-pcie", .data = &mtk_pcie_soc_en7581 },
+	{ .compatible = "airoha,an7583-pcie-gen3", .data = &mtk_pcie_soc_an7583 },
 	{ .compatible = "mediatek,mt8192-pcie", .data = &mtk_pcie_soc_mt8192 },
 	{ .compatible = "mediatek,mt8196-pcie", .data = &mtk_pcie_soc_mt8196 },
 	{},
-- 
2.51.0


