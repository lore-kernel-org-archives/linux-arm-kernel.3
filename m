Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6C4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2vxnuNliunow0C40/zWbCCIvm9+e4AnyBl+BaIGYBU=; b=y5rwPzOXN4QrC2u9hVP4Kk8VLy
	B0DRQn9ZG4Iew4dfxUMPXi2+ZsBps0E8khpYWxhfGqMgv3DZ13anYAZox0LwrHxLXy3ppbuX4asbb
	KZak15uKz5/YEN2I18JuDqqDT4NrR/B5g7LC0fUNWnzygfmw5Nj9LaaQRf2tKY8HZzE7eaB1ZHbXL
	ERCzmRFFxsEcipbcfXbW/FmJAhoxrAmgZbIjYeZp95H1ZkNJG33r79bzgmQz8gbNBG95QpRhL6R+/
	FUqrlWIYeQ9e4h1JQ4VZPsk83zlifUNlJCKWzB6Q2rRaLkpIZOGyo4T9Vccetw5U6kFGC44AB7zSc
	p3TjFp5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLn9B-00000001DiS-1Avn;
	Thu, 12 Dec 2024 17:38:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmp8-000000019DO-2HST;
	Thu, 12 Dec 2024 17:18:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 952FC5C5CD6;
	Thu, 12 Dec 2024 17:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59C5C4CED3;
	Thu, 12 Dec 2024 17:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734023881;
	bh=gUkmLslWwau7PQ/rqBKBXnsLHUj3XhDqGxojh6HslHA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cwKkrDWjiW8TR9jqZjKrU5uWhsvufo/SKwmpc6Rrg5GZe5ncsc0bu0jgz9DXMVafs
	 8R6byDSjz6nc2ZkWvgF5RbtYq71wKsVEdqrV6fwEA6XyvtQIdZKd4xkI+0SIzcCFap
	 ML8vQ0pyQ0njSAHDp0uPzqdPz71t2MOZDRe/1enAn+qslPZy3NqdtQoF5MD0jD+xqw
	 29v5HrtCmxHLLU5wAX/vzzKNtSLBKqwG6zJvUnfq+UeiVScxVgufqWl55r7UM6J8CF
	 xTOLKFCL1wLJZ+pr0NBzm3mztQKnxZg/w1/U8W2DTEW5wm2t8fkr66dfhpSTfhjRjL
	 xwR/tXpUcsMIQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, jikos@kernel.org, jic23@kernel.org, 
 Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jdelvare@suse.com, linux@roeck-us.net, srinivas.pandruvada@linux.intel.com, 
 bentiss@kernel.org, dmitry.torokhov@gmail.com, pavel@ucw.cz, 
 ukleinek@debian.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-input@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-leds@vger.kernel.org
In-Reply-To: <20241107114712.538976-1-heiko@sntech.de>
References: <20241107114712.538976-1-heiko@sntech.de>
Subject: Re: [PATCH v9 0/9] Drivers to support the MCU on QNAP NAS devices
Message-Id: <173402387748.2234929.7484373598047473898.b4-ty@kernel.org>
Date: Thu, 12 Dec 2024 17:17:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_091802_626068_51CF6E2E 
X-CRM114-Status: GOOD (  12.69  )
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

On Thu, 07 Nov 2024 12:47:03 +0100, Heiko Stuebner wrote:
> This implements a set of drivers for the MCU used on QNAP NAS devices.
> 
> Of course no documentation for the serial protocol is available, so
> thankfully QNAP has a tool on their rescue-inird to talk to the MCU and
> I found interceptty [0] to listen to what goes over the serial connection.
> 
> In general it looks like there are two different generations in general,
> an "EC" device and now this "MCU" - referenced in the strings of the
> userspace handlers for those devices.
> 
> [...]

Applied, thanks!

[1/9] HID: hid-sensor-hub: don't use stale platform-data on remove
      commit: e079a120f31e3f9c00180aa13c1df18cc138f7fe
[2/9] mfd: core: make platform_data pointer const in struct mfd_cell
      commit: 8f4009ad901c44f0428dbde654c4dd1fb29c863b
[3/9] dt-bindings: mfd: add binding for qnap,ts433-mcu devices
      commit: 8877bcff3e3b4f08a1fc0232dbfdaeda085cfdf3
[4/9] mfd: add base driver for qnap-mcu devices
      commit: 944ca826f69e4723853b3876875b03aeafe67b60
[5/9] leds: add driver for LEDs from qnap-mcu devices
      commit: fe6a21ee38f12e3e5f9adbd2f9a840be105b943f
[6/9] Input: add driver for the input part of qnap-mcu devices
      commit: 4b27e0da257371d3d141fae38fdbdc3c3a67bce6
[7/9] hwmon: add driver for the hwmon parts of qnap-mcu devices
      commit: 41755872a8a8ab8d1644459d9634c53b743fe2be
[8/9] arm64: dts: rockchip: hook up the MCU on the QNAP TS433
      (no commit info)
[9/9] arm64: dts: rockchip: set hdd led labels on qnap-ts433
      (no commit info)

--
Lee Jones [李琼斯]


