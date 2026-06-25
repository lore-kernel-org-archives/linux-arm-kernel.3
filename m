Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59B8CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 06:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7HNIXy0yS9fIOHY7kjeZItIikOpAOo6Lfo/NHE/T5U=; b=k01k/aeTE7Gjj3Uq7z+oPfVNPR
	fSG6ZFQHXULGnoJtYrU2h2GO3s+uG4dYSmmF2PZR8F1VeRlkkKslsNIgxw5s8nivFYWBss8RCeDPX
	CWY7GV2Uh/jqE9WFh7oM2XglWCSA8ryMp9Ha3lYnf9l11Fz3AriM1bH5/TWIY3nEyZCGuKjRprhTI
	/vdkMw2LOTrqLGWO+LNmSgHPmPww1HlMLndqpx0N5tesmE9/ZAx3KrssQDPoj1if2QitFnVphTPXg
	IspmtukaTJy1YQVl/8kcYNuz0RjFprHzbm8mc23WzKvWy1WvrSQ4FzMa8oLDVk1bxCz19jXwv871n
	Ih3W54YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcda3-00000008hhT-18oS;
	Thu, 25 Jun 2026 06:28:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcda1-00000008hhJ-3Ndh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 06:28:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E35F8403DD;
	Thu, 25 Jun 2026 06:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC5D1F000E9;
	Thu, 25 Jun 2026 06:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782368932;
	bh=p7HNIXy0yS9fIOHY7kjeZItIikOpAOo6Lfo/NHE/T5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fg6BC8coU5E95/Mh5DqDAWknpZO2AklIJPThPdg82BRVS8KGklSx7NDtxtQAvl87f
	 G23Fok8UmFnoFuTcL11Esui6YeMmkw2yCfigJbDMjM5pkLpRS+4W3akzi8JV9qP6ve
	 ue26x8VpOzvns1dNWkFW6uT6sw/IAZ75fhzLjifvVehpeosjy60F40p9l/T+xaw+ir
	 5xJt4KcULI4kiFio0pkV3eYbzfky6dsnxtOugwx3DXN9b2f6cnxokHnbgL5DAGZJrm
	 xrAy/8g6QeJoCPhx63RnOMfhQ6ordHCgNZW2JjoClkZNER1SJvwh33+6Yc2UgdlIPM
	 ez4R5H+CCwpvQ==
Date: Thu, 25 Jun 2026 08:28:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: Conor Dooley <conor@kernel.org>, 
	"mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-imx@nxp.com" <linux-imx@nxp.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jackson.lee" <jackson.lee@chipsnmedia.com>, 
	"lafley.kim" <lafley.kim@chipsnmedia.com>, "marek.vasut@mailbox.org" <marek.vasut@mailbox.org>
Subject: Re: [PATCH v6 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Message-ID: <20260625-artificial-coot-of-climate-efbecd@quoll>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-3-nas.chung@chipsnmedia.com>
 <20260624-junkyard-sensuous-fcd43189b593@spud>
 <SL2P216MB2441BB9DC91CCBE494F2B45BFBEC2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SL2P216MB2441BB9DC91CCBE494F2B45BFBEC2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
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

On Thu, Jun 25, 2026 at 01:43:33AM +0000, Nas Chung wrote:
> >> +  sram:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      phandle to the SRAM node used to store reference data, reducing DMA
> >> +      memory bandwidth.
> >> +
> >> +  iommus:
> >> +    maxItems: 1
> >> +
> >> +  "#cooling-cells":
> >> +    const: 2
> >> +
> >> +  "#address-cells":
> >> +    const: 2
> >> +
> >> +  "#size-cells":
> >> +    const: 2
> >> +
> >> +  ranges: true
> >> +
> >> +patternProperties:
> >> +  "^interface@[0-9a-f]+$":
> >
> >I have to wonder if this interface business is required at all.
> >Why can this not go into the parent, with each region fetchable via
> >reg-names, interrupt-names and iommu-names?
> 
> Thanks for your feedback.
> 
> I did try the flat model, but the blocker is the IOMMU.
> 
> The control region and four interface regions are independent DMA requesters
> with distinct stream IDs, and each interface can be assigned to a different VM,
> driving the video core with its own isolated memory.
> 
> If all stream IDs are listed under the parent's iommus, they bind to a
> single device and share one domain, so the isolation is lost.
> This is the main reason I added the interface nodes.

Feels similar to issue Qualcomm has. I rejected such subnodes and
Qualcomm came with a solution in DMA IOMMU code, but that solution was
rejected by DMA folks:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

I don't have proper arguments to convince DMA folks, thus I agree for
Qualcomm for the subnodes. It should be fine here as well, in such case.

Best regards,
Krzysztof


