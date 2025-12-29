Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE866E94100
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 23:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMB1tPUK6XDEY0fbuEI+ZV5BRdEMJjSvm1TQgmMtnkw=; b=dxu4e8n1vv1PPKnH5Pwq5++Rk0
	nca44/fABCs1Naj6Si01FCGJz+qiwx7wDHLk5v/8brfendVW4XvcnOFg14Z6MYXlcm3U2iMAW/Is4
	3YfUd8hT7lOSUAf42vLrCk5jGSOPDV8lbO8wFzGmxTy9dPKXDWSfNjhn4Rn+RO82GAIBZ4Sfy5R3L
	T4PGqAFoLmylNLSvTsKHwIeod/9T8pDt8xOhQrSApnAtKHbguTxbX/Y/JU/3Zwx21ggxCFI5rTUpS
	xEaQLRFD844w9lbk/E037D02eXZD7o9ydjkjgxbeSCJdP3LK5H6ddj/n59EC8I2KBg1n3hKdWWav1
	X971X6Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaMli-000000049EW-4AWp;
	Mon, 29 Dec 2025 23:35:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaMlf-000000049Dt-0TRc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 23:35:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 364BF43B5A;
	Mon, 29 Dec 2025 23:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A6AC4CEF7;
	Mon, 29 Dec 2025 23:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767051314;
	bh=sGG51MCoV7W1LUkTO42FAWhTXUFofGiZZFTBsNMdG8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RRXPi6EZ7Gso9xNo+pfIlQpx5ecEiLkR+m1417tHk4qBetbXx2i1Cn6lIbRvAizVi
	 zYR71qHUgWt5iXBnPTrlHRXc6qW8su3+sVnlGvZ80MA5iGV7wMZQ4T6IgkaW15bWez
	 YYEoL9FobDylm4WB9Cpv5ToYIe8dDewrqEA5H2/BPxenSawcOfKdlWgY6TtF++OiYm
	 Aagtli9tv88PZmE8/a9cFIPIiRbhlcgAbQLqYaPRS8mONySFOpr4+cHdUj88SARWSw
	 fEvjW+SJXi9F8itTfnqr8DdlTqAd96iZ2oj66LQ19B1vJSJKRtGPMtBKDac5r3CKR5
	 sUGjkABfmWWlw==
Date: Mon, 29 Dec 2025 17:35:12 -0600
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 2/6] dt-bindings: usb: cdns,usb3: support USB devices in
 DT
Message-ID: <20251229233512.GA2785770-robh@kernel.org>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218152058.1521806-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218152058.1521806-3-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_153515_192543_772A492B 
X-CRM114-Status: GOOD (  16.52  )
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

On Thu, Dec 18, 2025 at 04:20:49PM +0100, Alexander Stein wrote:
> Reference usb-hxci.yaml in host mode in order to support on-board USB
> hubs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> index f454ddd9bbaa6..1f7f0adc3b1ed 100644
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> @@ -85,6 +85,17 @@ required:
>  
>  allOf:
>    - $ref: usb-drd.yaml#
> +  - if:
> +      properties:
> +        dr_mode:
> +          const: peripheral
> +
> +      required:
> +        - dr_mode
> +    then:
> +      $ref: usb.yaml#
> +    else:
> +      $ref: usb-xhci.yaml#

I would just do:

allOf:
  - $ref: usb-drd.yaml#
  - $ref: usb-xhci.yaml#  (includes usb.yaml)

2 reasons:

As I remember, 'dr_mode' is at least typically what the default mode is 
rather than the only mode the h/w supports.

Even if you are peripheral only, I don't think it is too important to 
disallow otherwise valid properties. (It's random, unspecified 
properties I care about.)

Rob

