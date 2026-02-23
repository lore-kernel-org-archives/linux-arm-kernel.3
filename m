Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85A8EC110C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OcGDvI5Vhg6dPXFgOCa/nR74VEfVYmZMrety/KXu/0=; b=l3DzR877QeAYZT6Q+XCzrQ2nRP
	Mz69+BswOL2wNfotN9rH2s0MKPKsbssxttEJp6cM6YsdT18i3xLoaOrlvt6QDEe25m6yGQTOew+lL
	Jp/VmF8/+VB9xoT6Rj1TOtHuzdESzDauOOv3H5UPdTDBmoFA/bgU6AE9jc9JwjR8pHTDXJ0k4pokV
	/OQLYWRytzVfYG7scSChCJPKTQfucWJ19YaTMJ6inxG8NJPiV8AWGHJfMUZEv97QCIMtRPmEJ3Ghl
	FdposqjoqH+4p3LdKzf2uIjVJXxLji5bznJPoILvW/pEPuWMsMbvMxltU1fSneY2Vkv839jUUNHCe
	ykxWLtVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZlM-00000000msT-384C;
	Mon, 23 Feb 2026 17:30:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZlL-00000000msK-0gj1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:30:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 325B96013F;
	Mon, 23 Feb 2026 17:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3DAC116C6;
	Mon, 23 Feb 2026 17:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771867825;
	bh=ZIp+kH88X+B0codjMbbTpuBKbLjpavW3xKLfbpEfNXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sSn0GqUR7vhTU5DIVNM7kuo2FSwuPUWI3LczA7UndLmCS+Aqc7cnuOaSyYYwA31rP
	 jJanQofNa540NlippSBZehdVE+iNA51eYptB0TlNcwGtWS4oj7w1CQGV1h7e+tfw9X
	 RuABMKZ6KEfIs4coZx53S4769hgox53TC5fDVjdc4ZE1ONYvzKlxSpznW0qIKLNN3b
	 bzqbb5angnT+xmBP80pH6nb106cXoSdSQ4k34NpM520/3j60RCQW1yFQQd7p5/Y7aD
	 7B8OP38qt/dglCLbKYObYgXOufBKAPbUzev04g3uYVoTDz/jO08mFs5AxrgWr8sSj/
	 ZXjO8gxOObCgg==
Date: Mon, 23 Feb 2026 11:30:24 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>, linux@ew.tq-group.com,
	Pawel Laszczak <pawell@cadence.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Roger Quadros <rogerq@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	Peter Chen <peter.chen@kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/5] dt-bindings: usb: cdns,usb3: support USB devices
 in DT
Message-ID: <177186782426.4146809.2746797277313553789.robh@kernel.org>
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
 <20260211123436.1077513-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211123436.1077513-2-alexander.stein@ew.tq-group.com>
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


On Wed, 11 Feb 2026 13:34:28 +0100, Alexander Stein wrote:
> Reference usb-hxci.yaml in host mode in order to support on-board USB
> hubs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * reference usb-xhci.yaml# directly (suggested by Rob)
> 
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


