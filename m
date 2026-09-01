Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B552C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4X6ne0Uit8P26QhcBLgYQcoxfNjm1+NrZSLM/Ma+6Gs=; b=sFNzAoluzKGsBwwz0nj73pVhha
	YagY2wtGS+Cc1mRCk41z2DpW1296jeh5GYmLHkfc890opv2Zlk+1UnZZlN+jFOUaH0mvd/bGYUNDM
	8ochc80q67EI4gSoC+xTXZRPuFvKJqeY1BpAdiMmudGxwjCXEDkVCM0xgEx1mI13jRykliKDi5eJW
	lCmY/ezs00mPLzXKCBggcUOdElOk9ZWdYl9uUGH6Yn4MUm9ffj+B+yUkpW/nXkaCDuaJoNlK1Y2Az
	8hxYUKvyQEjGgm0X4p1BNWqL81GIS+e+lkquVpebgEmdBJtkEkWsef/3uVvxHNW+wCuYll6yZxCJx
	L4sv6X3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Rwk-0000000Ckcs-2VNU;
	Tue, 01 Sep 2026 17:06:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Rwj-0000000Ckc9-0cUL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:06:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 309056013A;
	Tue,  1 Sep 2026 17:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8801F000E9;
	Tue,  1 Sep 2026 17:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282411;
	bh=4X6ne0Uit8P26QhcBLgYQcoxfNjm1+NrZSLM/Ma+6Gs=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=B+9hs4x51CerXJGm2Kz2FazK25vRVZnw8AXRDpfnZWrX6t83Agp7ZgfH9lRIsU2sc
	 PV4wRQI9tH3q0oA9/9/qU6HPvtJVVLCELewZG1LQI53enGfV2Bw8QO90JQrrIo7bCI
	 QHl52OrK262QmCjAHB/ahRMvx+nPPAVr80PT0YJXFP7GnZGApwHmJbqOixngb0ppbv
	 2bTk8QJ7q62nTpcT+YszZsOfQAhdF9mo/KdlbVjeekMthdnJgYnBUon/zEVrelLr5k
	 tlZFEFPHh13B45ZcgKCOPoFoUoAeD0cF+gaEQq8GkdiR+zj2VSdmXwCP5yZhIrthxE
	 lvly1PZVaNbcg==
Message-ID: <3b916a31-3da8-47b3-afc0-51c9d178e645@kernel.org>
Date: Tue, 1 Sep 2026 19:06:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sven Peter <sven@kernel.org>
Subject: Re: [PATCH 13/19] thunderbolt: Add QUIRK_NO_DMA_PORT
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-13-44bc9348683c@kernel.org>
 <20260901090439.GD106095@black.igk.intel.com>
Content-Language: en-US
In-Reply-To: <20260901090439.GD106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 9/1/26 11:04, Mika Westerberg wrote:
> Hi,
>
> On Sun, Aug 30, 2026 at 10:19:31PM +0200, Sven Peter wrote:
>> Apple Silicon machines load and update the host router firmware with a
>> separate, proprietary mechanism and have no DMA port. Add a quirk to
>> skip its initialization.
> DMA port is Intel Thunderbolt 1-3 thing and not expected to found on USB4
> routers. The current code should not even be trying to find it, if it does
> then that's a bug that should be fixed.
>
> USB4 router firmware upgrades use the standard operations and if those are
> not supported then we just don't expose the corresponding NVMem nodes.

Yeah, you're right, I can just drop this and everything still works.
I think this may have been broken back in 2023 when I brought this all 
up for the first time (and still had trouble with the Type-C PHY and PD 
controller which is why I didn't try to upstream any of this back then)


Sven


