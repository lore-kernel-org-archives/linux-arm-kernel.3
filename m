Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E02FC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 04:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ivC4LFjcMA2NRwtoT8yMygCEmK6Wm4+nSoOjwBWKu5Y=; b=sdecPznYeIaTpx3huemirUE9c9
	B5piEuU68+mWfuSzwnASq+iTTYCSWVVTAdrfCg+EHU4h/3S/mlH/UZVZqVvEkTtW48wQUBtI0LMu/
	kPjPWT8kjX43qeiLaGVf9UEoTlFPkaaMEjFQ/aKoAeDqkLu4vUowf8/FgZUaE/E2bdmdQlUchskV4
	wktWFOUb5YaNeK8pLYtP0Z8U7zonozCNFsjEwGFzlXWJi4nNZU8e9fPsyLSEploES43Hg3jdAbOoF
	wK03aeP52Qi5NPAArKMPH9CnKGJ2Z6Mpwdkmddfvdj37ImnNDdbcIduPMenAWxC0qGYwJXezUk7Z+
	CGxD3vDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uczK5-0000000DsL4-025v;
	Sat, 19 Jul 2025 04:37:21 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uczHa-0000000DsBB-3FCL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 04:34:47 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6fd0a3cd326so30252566d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 21:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752899685; x=1753504485; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ivC4LFjcMA2NRwtoT8yMygCEmK6Wm4+nSoOjwBWKu5Y=;
        b=dVDIs2SAITxrFbZkJG4C5vNSnQ52C0lBV032NlcEPLqs2RVbyXl1sO3yBm5Ho1VOWK
         4dYSHaE/swDHbThlKByIv/3rc3mstCS707kOqsTacX7BowO9msJxmlEXCDAC7s6jeo83
         KVfw8IVFKi7VXDQF7HJF6RXD7j8cT+CwPB9ExF//Gd2mkSNEeDhNwBvSz9bmAQvEKF8+
         ouky5zu9gG3Nzoti5PkoO5K1L3pVn7HHYqNCs8ndA3b9m27oKQxemVYUpIb6chK/6Emw
         O9To+A4gPDgIiWYWVmio75PF5t3BT4C13GnFBQjYhRpPZejvPEbNjJqxd/qyyV9NMkD1
         /IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752899685; x=1753504485;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ivC4LFjcMA2NRwtoT8yMygCEmK6Wm4+nSoOjwBWKu5Y=;
        b=KtuaKc2iuhlBXPooYmkd0G7NTpGA4Bah2D6YE9arOVJ9umiXbpifN6+Vrl3Qky4O7a
         ASRZnWMMEiCgVEr7iyR0l6zz6IvtfRnJDWbvVKtLTiusbvGkH5m166XhnHhycXUij2oE
         54TSGv6+/U9TuLB+uQaw5h+5WrmYMU5enbQAdekLizyI2h1sVfnF3cLG0F86FUWT2hnT
         0USjfI8VAvnYCdCPkREIrBTT9++TKkvoHruZPVSCkG8tE03nJuAtIp2CqZcD68j0M/8E
         6zgsVdFPFtdXc0VVgtGZmZT7f6Nj8YyGguDyr/AYG+UiClatKiiowkVwlni5hHcEVjT3
         /Q1A==
X-Forwarded-Encrypted: i=1; AJvYcCUeReiIBwXeN48HvVTIMRn+damz7nUJN7vyOJE28PkJILe6LK7fK6gmkDmMEcd+klX1CVaqhxFDTtOoRfxP9P3L@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb+YDRMlXgFMM5GYSSo5DSJr+xZKuFyvZBvrU0voCE1RMpPcBZ
	aIe6cg9lH4+KZShWC0F7sLpxKlsT618UwG0GfqeF2yq+tux26jzfgnC+
X-Gm-Gg: ASbGnctIXl7tZapIxCua81U2yB+MKY1Z/TY3P+WWcRnos8IM9FZ7czuMqGNi1xL0giu
	axFCscW5CB2L0sw05Hlh3CwqmOpbLsYPso/nmY/EJLwrEbIF6D9QLYBNcsPtV5W2tjveG6ZyzRP
	dOoRTDgPubzk/UYeSTr9B/FaOpuIXKXDZshnxlFtcw90MYGAmMOtqOgkTCkPxW96RWyj8E+iq7M
	N6bdLa2R+xCk6aoXmKE1VfTsk2pyx5qW62NFQdS4O66Ge/IJeTJrPtCmVcd/rdoHlxljbPcHRNq
	OBIjX2jd47Kwo6Qh187VQaGM19Qqb+QeD1zX48pXr0EME2XXxMF396WipooNxDPx1/skv8dICaN
	gyCbcS+JztjxSog==
X-Google-Smtp-Source: AGHT+IFWu8yLfIBJKy6pujMDr34336Oh0WE1hUlwO3izF+IRV6PaVvvw+XcS1tSMo+tG1oya2fRzJw==
X-Received: by 2002:a05:6214:5c08:b0:704:7d7d:8af7 with SMTP id 6a1803df08f44-704f6afbfbemr164519986d6.15.1752899684901;
        Fri, 18 Jul 2025 21:34:44 -0700 (PDT)
Received: from pc ([196.235.158.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051ba6afd9sm15249976d6.56.2025.07.18.21.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 21:34:44 -0700 (PDT)
Date: Sat, 19 Jul 2025 05:34:40 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH] PCI: mvebu: Use devm_add_action_or_reset()
Message-ID: <aHsgYALHfQbrgq0t@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_213446_816364_CFB1538D 
X-CRM114-Status: GOOD (  11.05  )
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

Replace devm_add_action() with devm_add_action_or_reset() to make code
cleaner.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/pci/controller/pci-mvebu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index a4a2bac4f4b2..755651f33811 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1353,11 +1353,9 @@ static int mvebu_pcie_parse_port(struct mvebu_pcie *pcie,
 		goto skip;
 	}
 
-	ret = devm_add_action(dev, mvebu_pcie_port_clk_put, port);
-	if (ret < 0) {
-		clk_put(port->clk);
+	ret = devm_add_action_or_reset(dev, mvebu_pcie_port_clk_put, port);
+	if (ret < 0)
 		goto err;
-	}
 
 	return 1;
 
-- 
2.43.0


