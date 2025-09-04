Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC98CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcXBJlUG+CJg2hi+omxw3bK+LZ+ihfccLqIESYw8ry8=; b=mYKmmCW/dI/xTcm9IlPd3fglFl
	CvV82y+umHqAVGtAO2xk/nkGvKJz4F1LcoSCm+iMncKHWD/DwJSvhVEiocNxNmoTUAnv82JVCjWTR
	tpe6N02ji0FHcoJ1QWQt/kOmdtabEbMBlGm0w13yVTkTS3Xzqxv+zogFdkoLbTE7SVH7dibA9QLwN
	KMsgrvpGgQz05WvK3Q6FakvrXbLxqEDeuw8kF+43aT2vLoSds/VBBhRfTiNvnqGqi7i6m+9HIBfqg
	9Ge7Sr3nIwKzgeDiWYvDZu7uKAGFvsq7LtHUD4jR8Kf3UG4zdMWX7ozyoy0aMH9MHAIwKjc9Ghw7n
	GGcAiK1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM3V-0000000G2Kt-3zE7;
	Fri, 05 Sep 2025 02:20:01 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuH9G-0000000ESXs-370C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 21:05:40 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id CDD74C0000E8;
	Thu,  4 Sep 2025 14:05:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com CDD74C0000E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757019937;
	bh=OBRGL6HZNFSkKPaRa20kUp/hyj/cpWg5XdAlcIDswbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CLhow39X54JKSZ5Hz3CXrURwAjhrTRYybXg/DQKwc5Yy+k7bcTs/1LAHrrOI1jAAG
	 Bw14Cywex/D5f0y/JRW5WCqdXAKW1wtE3O8c+Rbuzs4Wk2zkuFnzn2C6VOMnf2Uqc9
	 7Z3Wlmpy8wbY4CTSSmRWetCZbJ+esXV9ZKzNbpBc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 7A36518000530;
	Thu,  4 Sep 2025 14:05:02 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Andrea della Porta <andrea.porta@suse.com>,
	linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
Date: Thu,  4 Sep 2025 14:05:02 -0700
Message-ID: <20250904210502.222430-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4ff3a58e98d90a43deb2448b23754808afc7153b.1756386531.git.andrea.porta@suse.com>
References: <cover.1756386531.git.andrea.porta@suse.com> <4ff3a58e98d90a43deb2448b23754808afc7153b.1756386531.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_140538_805648_7DA160C2 
X-CRM114-Status: UNSURE (   9.72  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 28 Aug 2025 15:17:13 +0200, Andrea della Porta <andrea.porta@suse.com> wrote:
> From: "Ivan T. Ivanov" <iivanov@suse.de>
> 
> Add SDIO2 node. On RPi5 it is connected to WiFi chip.
> Add related pin, gpio and regulator definitions and
> add WiFi node. With this and firmware already provided by
> distributions, at least on openSUSE Tumbleweed, this is
> sufficient to make WiFi operational on RPi5 \o/.
> 
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

