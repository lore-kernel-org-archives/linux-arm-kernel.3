Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021D8CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQIqNjTVj1GHbqmaXq7xQzF58NYgXBpjqOdxPM1igPE=; b=IJItiCEDMKBBHPpwYhHJkz4KWY
	tF1/b/gXLRFbL/mwaTqSQyVKRVgsTn9aiHncZqTpCimH71cFK7zr37tq5en6IWM+dVvkJCP4d5BKy
	ulS7abbLX4kxMcix7Te3Go1MYgW61HjnJjp29zv2qYVga+K6Xp8/T2fhIL2pIaWEhqIXB7cLlytpb
	9g96jv8ns/VbBhgKoWwG9P9R1VDzYfcsNE55SzJmYDB6+3e4pLGaAjoLQWL7lZ06z1szb27lDqzVv
	0IrQlZ0lpP7LfnGOAMNm8wfGNybIKuF9LXvERzhtm0+hAur2TwcmQK+gf89Tu0jARaPIdsprc1Gil
	6+uNI7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQGZ-00000002O0r-1rat;
	Fri, 22 Aug 2025 11:49:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upM68-00000001nvt-1uMn;
	Fri, 22 Aug 2025 07:22:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D813C5C5950;
	Fri, 22 Aug 2025 07:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F136FC113D0;
	Fri, 22 Aug 2025 07:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755847323;
	bh=9FEAxH3+AuZBvYVKXXR2QRHxEq4KpWqmux1TYKe6B8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=utA5OxOBW3wrcfUPDWJiVKWH7kUQEfDzLbyiCVlbCix33FrRPrMxlMzVoPR6S8Urn
	 pqFFq4qNFXiw1XXRFXDPrx1MXlW3npksb6kFkmRjtDMwLKaa1038S0g6N8PSlpmLta
	 Y8y7Gkbtxp6S0/0rcI4QFwHmsTeTwAcxOPTobpAEFRVWtg4pVaDqNYbixEPhPZBpIh
	 OoGUkFBvk/q2Bu6j24BBeQp8vMoqYbFdEM528eeseV5vSkzjR9wjjGyUtx53gR9jj9
	 hkpDBeK7kkjaQk8CMpO/PJ0AxdM8Z/iASISn0X4l0bw+ltsNZ1Z+g+mGuOMSpgj7m6
	 ACKNdRw7Vw8jg==
Date: Fri, 22 Aug 2025 09:22:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH RFC 01/22] dt-bindings: usb: snps,dwc3: Allow multiple
 iommus
Message-ID: <20250822-skinny-clay-harrier-64dc58@kuoka>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-1-172beda182b8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250821-atcphy-6-17-v1-1-172beda182b8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_002204_531974_EBB4F3CF 
X-CRM114-Status: GOOD (  14.02  )
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

On Thu, Aug 21, 2025 at 03:38:53PM +0000, Sven Peter wrote:
> Apple's dwc3 variant requires two iommus.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index 4380bb6fa2f08a475b557e80467abc2861f622e2..6d35dcc605c01977f4fc6fdb6f12976f1cef2b9e 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -60,7 +60,7 @@ properties:
>    dma-coherent: true
>  
>    iommus:
> -    maxItems: 1
> +    maxItems: 2

Never tested. You anyway need specific constraints.

>  
>    power-domains:
>      description:
> 
> -- 
> 2.34.1
> 
> 

