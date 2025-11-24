Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86813CFD31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLAilflNVxDgz68Weihz35LVrtdVaEgcJU6rw+Gc+S4=; b=ChQvseVmM5aEVNrNEE0G+tBtJP
	ZiSQSvmPtUcyCpQg8+XLfJGJQnPQ/Oiz1483/3iaQRb7R6dmNCG2Y3LHNjiLuXlEnrZlrSOU3LLiA
	+DN6TzVvagUi7tWHfinjiB3V+SG59Ybk6nfw/RLg8Z47LjXB/a4J+fS+4d2EeF8QnNis92gQfbhae
	2dBdVl0/UGaZsnrJEeJ/RyLdm/438Hqa3J8Kup7kTZMdpvz36DioVmvqSzMe2Q4GICwMr3BaS2SC/
	8NXEcu+MJp0v0MewIMPatpyHFAxwk9tT6S6/yjyoYiGiJqvL1wseKY0uof71MGWuwYC32CWKtIM6q
	mskDr9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNROB-0000000BExh-3tPz;
	Mon, 24 Nov 2025 07:53:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNROA-0000000BEww-22Sz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 07:53:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 95CF460183;
	Mon, 24 Nov 2025 07:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A78C16AAE;
	Mon, 24 Nov 2025 07:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763970813;
	bh=Ba/x+lH0Or0r4SZ7ljSij6gkS+YlackfK8oPM3gblmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iMe6OuXOUOmehIt+QzEUuw/lQgOX01lWBrHw8vpL6J/fiWGGpnMLr1BKcIMIDklXT
	 nyRrJKO6h1TH1Z/aoAY+kFUdN1w/UG1uldfcdYxD+Q428otXYsspogHKBWLwrLyME3
	 xuDSxuWTo51K2rWpO5QROSuTjtxIOKb0XPIN6obkSiwAh0TWswPy4jQKmKGTR67cJW
	 cQs6u88OOxEsAzLH6Gq41WXJnOPqogyQ2Ojze2NRDjufgVdWriZmeFCkUWY4hMHSlL
	 OZN32NR1OQrSIPORWmGLfOZv2njsgyD1xWXZTzLvoqOJTYIQg/Dqk/qJxFau7YPvNp
	 MUFrgTT33KyKw==
Date: Mon, 24 Nov 2025 08:53:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH 3/6] dt-bindings: usb: maxim,max33359: Add supply
 property for VBUS in OTG mode
Message-ID: <20251124-rook-of-exotic-innovation-fedcc5@kuoka>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-3-6b2e4b8f7f54@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251123-max77759-charger-v1-3-6b2e4b8f7f54@google.com>
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

On Sun, Nov 23, 2025 at 08:35:50AM +0000, Amit Sunil Dhamne wrote:
> Add a regulator supply property for VBUS when usb is in OTG mode.
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
> index 3de4dc40b791..a529f18c4918 100644
> --- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
> +++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
> @@ -32,6 +32,9 @@ properties:
>      description:
>        Properties for usb c connector.
>  
> +  otg-vbus-supply:

How is the pin or supply called in the datasheet?

Best regards,
Krzysztof


