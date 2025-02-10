Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E25C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCbQd1LAZR0TfTleQXyuhbIq0kGFNmo08NhmsmUbhLI=; b=ROEhs6cAMNk4ns1APi+b+9cxi8
	WwFrhSVMrUWJGoTkE007Rtn6bCmefi78fQJaFIv9x19gG77gAiW1lj9ozUC3rmqsTF0I55UU5KD9u
	tbjlwom8eFto+nz8j4/WVFICt5nY8iyItlxzMUPqSvkV68eFiu8k6Mbg9h5wEeR4Htppf08CPFCkQ
	PA6P5P7jf1+DlfxWjfkD0PlFrDjpF+RrmLPulQrPHBrW4DreCe+C6h7D1AUFmG/HYeUUOClQ+Mjrq
	d9ekdyY7+NboCbGtxWXcnGAH4Ex4pS0Hd59BVmyC6z1TvZ5WSUg6fg2FDaw6ltOUoOiruTXhewu9o
	LWLBIhFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYm-0000000179y-2xEb;
	Mon, 10 Feb 2025 19:35:12 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYoZ-000000010Lf-1jJn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:47:29 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id AF3ADC000921;
	Mon, 10 Feb 2025 10:47:10 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com AF3ADC000921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1739213230;
	bh=Rjaduz+wTU0xDZ1yzr853VAo/AdOAlZwOabGtbt7I6U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Os0gwdMAhxp6wgPZO7j/72GqbIhznB/z4JCiDkym3l7hq6l2nkbUDYL9NH+uWEAK5
	 ODms3k55/7y8EU9ofLjgyrXCqc5a4wOnQ8ZUg2kLCJLv+QLdQe3e4oTYNLVFOETHOB
	 8tixKn8gMnUxZD+VyF8IRUEGog4c4+f1VqpORtT4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 80DE318041CAC6;
	Mon, 10 Feb 2025 10:47:10 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	kernel-list@raspberrypi.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: bcm2711: Fix xHCI power-domain
Date: Mon, 10 Feb 2025 10:47:10 -0800
Message-ID: <20250210184710.1127354-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250201112729.31509-1-wahrenst@gmx.net>
References: <20250201112729.31509-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_104727_609710_3A214D11 
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Sat,  1 Feb 2025 12:27:29 +0100, Stefan Wahren <wahrenst@gmx.net> wrote:
> During s2idle tests on the Raspberry CM4 the VPU firmware always crashes
> on xHCI power-domain resume:
> 
> root@raspberrypi:/sys/power# echo freeze > state
> [   70.724347] xhci_suspend finished
> [   70.727730] xhci_plat_suspend finished
> [   70.755624] bcm2835-power bcm2835-power: Power grafx off
> [   70.761127]  USB: Set power to 0
> 
> [   74.653040]  USB: Failed to set power to 1 (-110)
> 
> This seems to be caused because of the mixed usage of
> raspberrypi-power and bcm2835-power at the same time. So avoid
> the usage of the VPU firmware power-domain driver, which
> prevents the VPU crash.
> 
> Fixes: 522c35e08b53 ("ARM: dts: bcm2711: Add BCM2711 xHCI support")
> Link: https://github.com/raspberrypi/linux/issues/6537
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/fixes, thanks!
--
Florian

