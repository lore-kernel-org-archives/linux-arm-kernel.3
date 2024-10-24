Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB48D10380
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 21:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KlQoQ2CXOZzjXdEh9hNBwMUJ/TP7s8F9nbRsmKVAuw=; b=gJtIdf/4D1W697ii7XSfBGhs+C
	OiTNMd/dtdEFAdKmuwPoxA+ohMFG9ClgVyK9krgcVpHlI4E1+I6bNoeBOqPmTPB2/i3m6l0K7voBB
	PINkM0WkLLtvPNe1vTTOLfRru/G7MNMcOEiM8XBnGe5rG39mkE5Wqfjp+w0moEfmNuVBptiXu7gDd
	WGIAW40ENSsxt+ie3CGiE+HkIsmbi9I9ym7SLAmZN4e65H/9PQC0xliYjHaICUcF001a9vVwEbZ5k
	wyHb/2TEu9+30LWYKwpbw/L3PD5OyFyc5kovbG+ALYLa4979Cx7N2AmsiW9R7jLLP7s+J8CFAlStO
	A7zHT5pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4582-00000001qHc-2LHP;
	Thu, 24 Oct 2024 21:12:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44dy-00000001l3y-1bjA;
	Thu, 24 Oct 2024 20:41:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 084B9A45828;
	Thu, 24 Oct 2024 20:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AB7C4CEC7;
	Thu, 24 Oct 2024 20:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729802476;
	bh=2wGqo08YvcqvbNlSwVnfD6yQbCsQjcfQ/VQ98bfcrx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CrSEeHgumaYEhfER/YsDnXgcdHp3i3LgTZVbJLGmhameDT/m6MZMR6QNtEAlb+JAg
	 CEqfkOQlPDTgooTpLmPOIHAXNX1WTqWZ/bM4R8rSt1tDdX/4VxufjGd8QOdV+mX6Fi
	 GpL/jPjJdFzGXZHldvH9uZGJu6Oix5TiqtXpYyzuVMY9IQmKZK02rkXUFAat9jSMKo
	 c1ECzXBROcIPi1hZEAhX0wDiDaDcR48msq19vu3oaLnX1WJp1aWm8haMxGmi3KSFT1
	 7iSx6OcCNr6z0wA3/FfTZxTCg//rRmNMNnDIQoSrexBW+lXhuk4uneBC6gy3N6D53I
	 SRczsOrqWud3w==
Date: Thu, 24 Oct 2024 15:41:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Scott Branden <sbranden@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maxime Ripard <mripard@kernel.org>, Ray Jui <rjui@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 07/37] dt-bindings: display: Add BCM2712 MOP bindings
Message-ID: <172980247555.1013633.6457539285768075938.robh@kernel.org>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-7-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-7-1cc2d5594907@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_134118_574500_4B31984C 
X-CRM114-Status: GOOD (  12.40  )
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


On Wed, 23 Oct 2024 17:50:04 +0100, Dave Stevenson wrote:
> From: Maxime Ripard <mripard@kernel.org>
> 
> The BCM2712 has a MOP controller which is basically a new revision of
> the TXP.
> 
> Express that by adding a new compatible for it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


