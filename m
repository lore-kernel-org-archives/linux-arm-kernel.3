Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BF1D1036C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzEacoa184HxeudCifAvtfpCrdNQlHrumwtyl5KN34Y=; b=TWWV5dD7ARfMQPfapKpOG3KhJA
	/twYm6+RGqmx+QX6cxMXHXXK7P7q1EatmzdUKeblhtsUpcX/wxYxXKs/RgOmnbf6ivhrqySHF4CXh
	IUi5nD8sSpt8n+X9mpS1nYWkiAKWYLdInd+DIZXCNhtlE2qlnT9z3trzi5W5JfIf7IO8ZmF3TS1bQ
	BQhhh8KAyXeT9753ycXGAwlYaVGHu77ZkZYpuq7iNYmBdWvYqCU6dohkLqMSaESuy7frvUzBYpOTp
	z0PoXy/Wumi5uBovGIlsRBR/8P3aZN2o+gXnHSZIZnJCf/lHxrkP+3+RxCzQ5DN2tjkak2KPed8hV
	l3YQPu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44iC-00000001mEy-0GTw;
	Thu, 24 Oct 2024 20:45:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44cV-00000001kkV-0JTv;
	Thu, 24 Oct 2024 20:39:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3EBE5C5523;
	Thu, 24 Oct 2024 20:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D80C4CEC7;
	Thu, 24 Oct 2024 20:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729802386;
	bh=fu1NI55gqVY8lwDobFa1EKGS2z61s5XU7//5aqHBG3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xzgqw8iVGQU0dI3OeuHLmVLmbJ/SEFjLNv6oxbdrHizj2AZDaCc3n9Vn4SxbyTUrs
	 T/qy1UKhHCnIdwOhjTrPnsCybxcQq7KfQ3XRLHHgCqjParoNauu523K51H21HrnyfN
	 HqJWMrzazZJfXjP4kM65OpfLBnBh9G8Do+HPWQ8qvqwsaxwqQXRjajFWwJIVj25PJf
	 S0duQysEtoqfpsCtOVRENsl9UybhyIS7YTliJcp6o81yrtGbcmiGMQwiAyDU0VywTY
	 QB4HlPDkRK68GrQc+X5pk5MZEzX0UTvfHpKSBfFDzZuq1+QJkGZuHBbI9ST696kQQJ
	 YPksUDIai5H6w==
Date: Thu, 24 Oct 2024 15:39:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org, Ray Jui <rjui@broadcom.com>,
	Stephen Boyd <sboyd@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 04/37] dt-bindings: display: Add BCM2712 HDMI bindings
Message-ID: <172980238460.1011654.10730669025533473709.robh@kernel.org>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-4-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-4-1cc2d5594907@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_133947_179938_D3110392 
X-CRM114-Status: GOOD (  10.39  )
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


On Wed, 23 Oct 2024 17:50:01 +0100, Dave Stevenson wrote:
> From: Maxime Ripard <mripard@kernel.org>
> 
> The BCM2712 HDMI controller uses a slightly different HDMI controller
> than the BCM2711, and a completely different PHY.
> 
> Let's introduce a new compatible for it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


