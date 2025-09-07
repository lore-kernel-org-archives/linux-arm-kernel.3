Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403A1CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 09:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsrWPgmAZaJ/RQXv9vh46/17znTpH+AKGhI80dys7ZY=; b=ZwlQ4aOVx6EpFy/VzAtaXc2h+O
	WUjz45vmH39RupnCwzisJiEM5M+A1lSq/5IPU+kwbIBW2CeV2Kgk8u5OlyysqepltpdjwA/Fu/t3K
	VJK9D2mwRO5gkQGsNSEhbDCLfVRymThBb6tZHbKQPZ7MiLulowK0pD/vyIBjvMaKW8KVzQKMECTTp
	uoTHCYo3UR70u4Woh1FUkgZFtzHdnuGwfwuCGyCqXDl/3H7RD96pHDlL2dxZWArKQjdyDYwgWExFM
	N1sBdxCXYZxHsZujvnaEiPIlrfJaU3If453w3oRPF7w/1dSqGk3IFL4+8IdMtLySW6SrBadAMTxHb
	KNBH6+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvC7q-0000000AXBm-12fS;
	Sun, 07 Sep 2025 09:55:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvC0C-0000000AUoG-0gSq;
	Sun, 07 Sep 2025 09:48:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87571601F6;
	Sun,  7 Sep 2025 09:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AAA6C4CEF0;
	Sun,  7 Sep 2025 09:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757238483;
	bh=AJo8tXGXBCNKvK0egKRIWYrjkAvNXBOqYMH+m5aqxhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qzrah6sL4dBECdyKDsnszqo0PaNZdQiYxoWj0K7Wf7zdo/p1VhDkr5tndUsPlJVF+
	 19jHoOnTOtJnq3Rptr/t4aY9YK/ZpaBFFQxdvzNWDDvkH4PVNds+G6IUD1B1xfsPTK
	 +LdMrbVMLVMAXkKhUVMCGedmfvdK0dLJEEUJAkRXukQ6Fvi0X0WjWHwbWHvvMoXJuQ
	 v8u/XF9btaC+f1E9olbhVWDwFQW2+tX6qa2CKYyo95uBr3sIG+0C6aLWkJamarNRup
	 xuCCz1cx/RinMvvmEVXyR/uTqjJOp4cDUVXkoR99bOhrYAT0NdaheoBc0RRoHppuyN
	 3wYgKxDiKDX4Q==
Date: Sun, 7 Sep 2025 11:47:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 20/22] arm64: dts: apple: t8103: Add Apple Type-C PHY
 and dwc3 nodes
Message-ID: <20250907-zippy-auburn-koel-d6da32@kuoka>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
 <20250906-atcphy-6-17-v2-20-52c348623ef6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250906-atcphy-6-17-v2-20-52c348623ef6@kernel.org>
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

On Sat, Sep 06, 2025 at 03:43:33PM +0000, Sven Peter wrote:
> Add all nodes and connections required to make USB3 work on M1-based
> Apple machines.
> 
> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  arch/arm64/boot/dts/apple/t8103-j274.dts  |  12 +++
>  arch/arm64/boot/dts/apple/t8103-j293.dts  |  12 +++
>  arch/arm64/boot/dts/apple/t8103-j313.dts  |  12 +++
>  arch/arm64/boot/dts/apple/t8103-j456.dts  |  12 +++
>  arch/arm64/boot/dts/apple/t8103-j457.dts  |  12 +++
>  arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 137 ++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi      | 105 +++++++++++++++++++++++
>  7 files changed, 302 insertions(+)

Please do not combine DTS patches in patchsets for Greg (e.g. USB). Greg
expressed that many times, that he takes all or nothing, and DTS cannot
go via driver branches/trees.

Best regards,
Krzysztof


