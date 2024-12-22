Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626DAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 21:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2EAvvGaGQe4GZOyf1+O7bXahYdeX6C577uneV/yQI8=; b=kc9r99cadUkf/yr7oTKQqOUzoY
	mHU917KZLXlCuOujHxq9jmRP1uLysePEOf/ScXAmPYN1yv1VF6EjwOCZq1ZAhV2lyRTDxxf+7LKR2
	Ry0spgaswF2V0QCk/G/ElA4dwqdvJUEZ/eF+OQ2myVZjX6LkqMy5pS1SeZZ4+Xcdi8mSZl6EKkwhN
	NRAhlgn76hVcMO0C2PS18YSqZ0hVCoykntPLXoSVIUwzsYkbMEApIDJhUUN9QG0Mx67GtWuIeYaKN
	QQO3qeS3gG4f1MRUYjnwmnLykChTzpndRhfBgAklZjTVD7b/jZgFn2sBow3rTMyDrdgSv6wQGokDt
	9odoy4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPTJE-00000008qhS-3Lki;
	Sun, 22 Dec 2024 21:16:20 +0000
Received: from mail-pl1-f173.google.com ([209.85.214.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPTI3-00000008qcn-0p13;
	Sun, 22 Dec 2024 21:15:08 +0000
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2167141dfa1so31497025ad.1;
        Sun, 22 Dec 2024 13:15:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734902106; x=1735506906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2EAvvGaGQe4GZOyf1+O7bXahYdeX6C577uneV/yQI8=;
        b=oC2ZS2X9l5s5q7EbLQRuBMTaQvXyK/bFJyrz5yThMo9Xd5PmXuY82olZdYace6EXg5
         ZCOtwDxRqyLfbbyUGf2xlbgT1qN+IBTfTAdwDY1n+WtAjUKp5JQ/QTyR+lcDNO2i2GnX
         0J6EPpCOSkWb7P0CRu8UUu17TN94sHsBSEYX7RQK8LLSUc20KKljeBc/A9d10mozTSVO
         N3lyZe2NiE7vtC89rRWFVZhSKE2lJoI2UUFd8Q7vP7oUYXAKq1P7uThTmNyApLiG19S+
         yvvJzy4bzIwTLE74f6f+VJO4Ws7Hj/edZimKlGIrVRuDAanmMQD8mvhkrzKbSh5Xw2ZA
         KZJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEfvI8ugdz9oX8rLrotKxe2yE9CcK4UooUrlHB5H8X1regGQTdG0SD5WuHmKM49+aIowxJMKOIoNrz8HdxM8Q=@lists.infradead.org, AJvYcCWREOEsYvXAh6/KqIro8ucsJE4c3P+wnNqAZlhoUK3swgTteYtHmtLMqLxDn/WjP2FMIBreZvl2P1tjGE7wvQA2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi1ZDeG97pUQIeW8QsNGuAGwLMGVTqiuPdrdslAScRRtNqpQsw
	SB0Gf6SPYxHFKv751MmnNr/LrhB4+7YQgqOBdfH76bgQbecbXqOG
X-Gm-Gg: ASbGncv0a/Y84XYHMr4VnWR5WsL98bHEbhCEmzh4TXByjeNhUDgkOllXkL7l8NwH/KG
	G/B1idHEqajhh5dNyjAsqLHbF/bhVJZvXw3TKn02BfO8dgI2JqtCT3e7ZMWelzIXeAOGOg5A0wZ
	JFarp/FTRQ1RnJSLPXziZ6ckrTY1o8UiduQhSU0MAsgHfIlAT+bKD+DF0piKhrrYJZzZRWtUdme
	u9HomRfAzTn20df3uRWjxQn00SazD+A+qwO4F3Mu0pT6ETS/d+iFC3ChJ3lV0/w4gWuscTMAlvD
	LadA+F+7FXLRTxs=
X-Google-Smtp-Source: AGHT+IFnh8/2jH1K2C8laRyf+QSqdgxXTyVDB6IlMXv9COCrJqawDYFQvRtiTT9LwezuAyZuQTniUg==
X-Received: by 2002:a17:902:c402:b0:215:a034:3bae with SMTP id d9443c01a7336-219e6d59abemr151928855ad.18.1734902106227;
        Sun, 22 Dec 2024 13:15:06 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca0194bsm61117915ad.248.2024.12.22.13.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 13:15:05 -0800 (PST)
Date: Mon, 23 Dec 2024 06:15:03 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 0/6] PCI: mediatek-gen3: mtk_pcie_en7581_power_up()
 code refactoring
Message-ID: <20241222211503.GE3111282@rocinante>
References: <20241130-pcie-en7581-fixes-v5-0-dbffe41566b3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241130-pcie-en7581-fixes-v5-0-dbffe41566b3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_131507_243167_78BDB045 
X-CRM114-Status: UNSURE (   6.73  )
X-CRM114-Notice: Please train this message.
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

Hello,

> Minor fixes and code refactoring in mtk_pcie_en7581_power_up() routine

Applied to controller/mediatek, thank you!

[01/06] PCI: mediatek-gen3: Add missing reset_control_deassert() for mac_rst in mtk_pcie_en7581_power_up()
        https://git.kernel.org/pci/pci/c/3b2ea2d9a669
[02/06] PCI: mediatek-gen3: Use clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up()
        https://git.kernel.org/pci/pci/c/a28adc4d00b7
[03/06] PCI: mediatek-gen3: Move reset/assert callbacks in .power_up()
        https://git.kernel.org/pci/pci/c/599e5a6bc452
[04/06] PCI: mediatek-gen3: Add comment about initialization order in mtk_pcie_en7581_power_up()
        https://git.kernel.org/pci/pci/c/cdd822338f1b
[05/06] PCI: mediatek-gen3: Add reset delay in mtk_pcie_en7581_power_up()
        https://git.kernel.org/pci/pci/c/6c042f72a930
[06/06] PCI: mediatek-gen3: Use msleep() in mtk_pcie_en7581_power_up()
        https://git.kernel.org/pci/pci/c/90fcb3d015ef

	Krzysztof

