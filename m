Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B37ECD9B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 22:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzeO7zZ69I3XN/zyWY5Xw7az0QKbNdDG4yC9XwwJljg=; b=dwTfWZbins3T1Dvc2udIbkdjMd
	6N3SlyRAhUYdx3q4l3ugrsExgPxmkPRdyzbnj7U3yu5+Kw6BQlyCWDcBQSDYQGVry1jBWaZwoZfLy
	Lv4yKN6KretJ+Mvo2k+QZn3GL+sU//yU+qx/oAIuyLI3l/6G49KAHk32WqzjLNNLs1o5gUidHXiNY
	kcMPbuy3dladH/toBiAk37Qz81qBYQsV5+9B2BulPvizBrKV1y+WavUadmKXijQ1OcwVMWE4qKYXQ
	GLE68IGS/lvgUsu38H02nvIvZ1Q9GQ2HDPeTyKVvvRAZweA47wwUrnrm3saGZqYvRoXPGTH0tI+rb
	jMdvuS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo7h9-0000000AZ6K-1imw;
	Thu, 05 Feb 2026 22:19:27 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo7h6-0000000AZ5U-27T8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 22:19:26 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id DCBE9EC0568;
	Thu,  5 Feb 2026 17:19:20 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 05 Feb 2026 17:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1770329960; x=1770416360; bh=bzeO7zZ69I
	3XN/zyWY5Xw7az0QKbNdDG4yC9XwwJljg=; b=Y5jBh20B/zbvNv8ld+x1cD1QEi
	w0I95yUwCHT0Qyo6pdIA5GBpFt7mK3ax7GQ1KenrlTN1DjLVcYV5sa1pBQu5ctzY
	8WzQHfrDoIjH854yt7/w4GGUXyLg0OuNn9dbo8hN2QYlk6AfjKI2sGfAKwqB+/ii
	xEe+gPfA+8xXuvDIT4Qqt8Lxfb3cdJSLBat8t+EG8BP0zDavxJeNLQPIqJto68Db
	U/zJ5ewucxFuTOaRTV2GkjFQYHv9K1W668aWP6NaMXkYskqEdtqX8E7LuN+BwC1k
	PyxufgO+oHp69azOqK8vx6Bveb5ut9V9AFk5T09/uLb4M9q/w3p8ATCLZjoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770329960; x=1770416360; bh=bzeO7zZ69I3XN/zyWY5Xw7az0QKbNdDG4yC
	9XwwJljg=; b=VUGbsuPwFOZBgv/QprPB51PABGAZV7UBbXIGZ+wFrT5uA/ZAXiQ
	16ffcCOOetFXg75p4iw7zNlDGuKUWXm5PrhQBA0YCCt+K3MbHqAAIGw8PsGp4N5d
	Spl6MnvLUyCKjZb3mh/fKRi+e5LGHpiaPjS/huxXPllGqZWcPGFv4SgVFq2iOGRj
	e73YUsm9lZS7Mp8eDGrfI7vd4z1Jxv2VmPHoh8ga+3ccd10anDErvUby5sEuK20w
	IWdkR9+IE/ndmu8j8RxKfEBNK8+YkZx0dhxarESxNudjxohX153DmnGX4bR3iM/5
	rjG/C+l2boOyxCVkW34uz3SJw7SZ4/PRvOg==
X-ME-Sender: <xms:aBeFaYbYIVvtbPc1g1xO4vtwiHvOUSvB3xQ-M3zWAQ3mA9kCdnC5TQ>
    <xme:aBeFafP_qsKKtQNjrA9rJofRnXSMclwzi3e3o1BT4QpV0zKI-SvFALEOTPej97eHJ
    cygfQNyr-R8hRJqjDuNrVZqCJfRPB5zzbFTTgxrZV8ON7MWZWhsjhY>
X-ME-Received: <xmr:aBeFaeWFGPsI2UGkM5JytbsR1DMr6khiHkQTxo_n2RjYNRewY3JuHyNYD0i01xoysyAD9ToNNPsJ9eiKHo1mRyJLchUJQc-xJUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeeigeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeeigf
    dvheehleegiedtgfeljefgjeevfeejgeetkeetfeevtdefkeeluefhieegtdenucffohhm
    rghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphht
    thhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhvvghnsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepthhglhigsehlihhnuhhtrh
    honhhigidruggvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrod
    gutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhi
    nhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhish
    htshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:aBeFacL9hildb1R86kNZTiRGvVhzFFiVSSlflo-u5ziKOX828CNu2A>
    <xmx:aBeFaRru2Gf4Iw4XBFc6nILrdcPQrreCJWdehWQmEHfcEv-uXzDjUg>
    <xmx:aBeFabyOP1TGSu_w1B9VGKy4UALegcaa8nGKZ8Y-YS2H04IuSkMgAQ>
    <xmx:aBeFadu7NWBmwVz8w9pRKksEePDgHlCHnliwirHlGR_Q9Q0rqZu4ZQ>
    <xmx:aBeFadNZ7bNr-Uf-l8oXQSkVMEdLaaQN6dXC3oCAo6Sy1PxtSklF2vm_>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 17:19:20 -0500 (EST)
Date: Thu, 5 Feb 2026 23:19:18 +0100
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: apple,aic2:
 Add AICv3
Message-ID: <20260205221918.GA71415@robin.jannau.net>
References: <20260128-irq-apple-aic3-v2-0-b4bc8e16c997@jannau.net>
 <20260128-irq-apple-aic3-v2-1-b4bc8e16c997@jannau.net>
 <20260205-pastoral-magnificent-cuscus-ce58ad@quoll>
 <8f506b2b-1309-4f9e-b8e6-4a73064ea2d0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8f506b2b-1309-4f9e-b8e6-4a73064ea2d0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_141925_140494_970D7847 
X-CRM114-Status: GOOD (  29.63  )
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

On Thu, Feb 05, 2026 at 07:01:51PM +0100, Sven Peter wrote:
> Hi,
> 
> On 05.02.26 13:50, Krzysztof Kozlowski wrote:
> > On Wed, Jan 28, 2026 at 09:57:08AM +0100, Janne Grunau wrote:
> >> AIC version 3 as found on the Apple M3 (t8122) is very similar to AICv2
> >> in its base functionality. It can use the same device tree bindings as
> >> AICv2 so add it to the AICv2 bindings.
> >> This interrupt controller is used on all Apple SoCs starting with M3 up
> >> to at least M5.
> >> The only apparent difference is the increased IRQ config offset. Apple's
> >> device tree codes this new offset as property of the "aic" node but the
> >> value stayed constant for all SoCs with "aic,3". Since the SoC specific
> >> compatible "apple,t8122-aic3" will be used in the driver this offset can
> >> remain a driver implementation detail.
> >>
> >> Signed-off-by: Janne Grunau <j@jannau.net>
> >> ---
> >>   .../bindings/interrupt-controller/apple,aic2.yaml  | 45 +++++++++++++++++-----
> >>   1 file changed, 36 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> >> index ee5a0dfff437816056bda0de5523bf38be4f49ba..a6e2251fcc111340c0a27ab6912452f6b1255be2 100644
> >> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> >> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> >> @@ -4,10 +4,10 @@
> >>   $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
> >>   $schema: http://devicetree.org/meta-schemas/core.yaml#
> >>   
> >> -title: Apple Interrupt Controller 2
> >> +title: Apple Interrupt Controller 2 and 3
> >>   
> >>   maintainers:
> >> -  - Hector Martin <marcan@marcan.st>
> >> +  - Janne Grunau <j@jannau.net>
> >>   
> >>   description: |
> >>     The Apple Interrupt Controller 2 is a simple interrupt controller present on
> >> @@ -28,14 +28,24 @@ description: |
> >>     which do not go through a discrete interrupt controller. It also handles
> >>     FIQ-based Fast IPIs.
> >>   
> >> +  The Apple Interrupt Controller 3 is in its base functionality very similar to
> >> +  the Apple Interrupt Controller 2 and uses the same device tree bindings. It is
> >> +  found on Apple ARM SoCs platforms starting with t8122 (M3).
> >> +
> >>   properties:
> >>     compatible:
> >> -    items:
> >> -      - enum:
> >> -          - apple,t8112-aic
> >> -          - apple,t6000-aic
> >> -          - apple,t6020-aic
> >> -      - const: apple,aic2
> >> +    oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - apple,t8112-aic
> >> +              - apple,t6000-aic
> >> +              - apple,t6020-aic
> > 
> > If you are re-shuffling these, you can as well sort alphanumerically.
> 
> I don't have a strong opinion here but the last time this came up we 
> agreed that we'd go with release order IIRC for consistency since that 
> order is used in every other binding for this platform.

The intended scheme as documented in some commit messages is first base
Mx SoCs in release order and then Mx Pro/Max/Ultra SoCs in release
order. This scheme isn't used consistently though. I think I fixed that
in one or two bindings already but there are other using a different
order.
I think these unecessarily complex rules are guaranteed to lead to
inconsistencies. I'll resort the entries alphabetically as that's the
only rule with a chance of consistent use.

Janne

