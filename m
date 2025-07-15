Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA703C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnlcDQSgxotW+7K4kTxA5VIGj1my/BzqpFvR5bTVwoA=; b=eEZoH/exM7wvc4Z/46SBzjvZkg
	StsKnyndVENgt3sA7n9Vvfv0jDVdpeImgO0fKgDRVQgVQp3LmohkCt0d/YeunZ5ik7+BwayT/+//d
	AYm6gCNKN2y0feEc0oiucBXL9ZrRjmibdkJtIQUORBPE0XJYgYuq/NlMAkG8OEfZPFsuSItkt7rBM
	JAiAXTqYcXJotrLGTUgSHJF7V5gRQWBufcz2MW9XOet6rru3Co2lyoIuG93E14bZxI40g37GthdVc
	z5nW50HcmbOQLnP9POM6L/sM4TVE6ji46vsDCH35vBp/r1ki/ElGCcFZPTgqfj7IHHSoQ4KHssO4I
	FpAnVz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdi9-00000004vOS-06rI;
	Tue, 15 Jul 2025 11:20:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdWy-00000004uC2-3FTj;
	Tue, 15 Jul 2025 11:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=QnlcDQSgxotW+7K4kTxA5VIGj1my/BzqpFvR5bTVwoA=; b=h9DBQ7aOxJ0Cyo+S2iKcJBJcJ8
	M08lAAXa4gM7XGZIt0zLj/bMblsJx+U/4d7KmPeGF8T1CjIk6gjPXlM72gPBF+uHAmG6Jo3i/HiWI
	iNwZZaWyQ5gOrHKCOG6WuRBpdePzCqWCdxgNR7dum8rKjhdizwovCUOq3Vu8sBDcSAqtDOWtGNWQV
	HFV/AEGQd+bPAPQm4nEPW8DPQlVc3+RQQJtZJPqST3tflizqdsMKHe9YLZy9C2TrbHgxMhwxMySf+
	L4nmEEiBzjxicbClSzl+kjjxTAHrbqXyYnhlRfvzzyqLc+QHMjJWUhDIyl4STINfO8gzJt7V/tfPJ
	bHAhqIKg==;
Received: from [194.95.143.137] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ubdWr-0000O7-FZ; Tue, 15 Jul 2025 13:08:57 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix UART DMA support for RK3528
Date: Tue, 15 Jul 2025 13:08:47 +0200
Message-ID: <175257771277.2527819.763975053553493383.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250709210831.3170458-1-jonas@kwiboo.se>
References: <20250709210831.3170458-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_040904_811594_633CE14D 
X-CRM114-Status: GOOD (  11.34  )
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


On Wed, 09 Jul 2025 21:08:28 +0000, Jonas Karlman wrote:
> Trying to use UART2 DMA for Bluetooth on ArmSoM Sige1 result in tx
> timeout when using dma-names = "tx", "rx" as required by the dt-binding:
> 
>   Bluetooth: hci0: command 0x0c03 tx timeout
>   Bluetooth: hci0: BCM: Reset failed (-110)
> 
> Change the dmas order to fix UART DMA support on RK3528.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix UART DMA support for RK3528
      commit: ae019f0bdfbef3e0671e7b954321e92fc24c7e54

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

