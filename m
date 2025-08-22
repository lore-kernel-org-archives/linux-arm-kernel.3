Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFECCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cETdVQ5/OA56exs5Hlg4kZFW96QH2Jl0ZyQG8E35t88=; b=PBZ9p0wtEnjqOm2CYfw/8LFYZE
	VKzon1yhdCSM1Bvu0GHErKp1+ofcJg+Z5tQg5+w1Qs2vIpus3aBMvHeXExEAOUgiKK3l/X/OBMJ1e
	/WWWJrzGXPfVy5oOHc61EWo0kVXDNl5nbkqyTGP9OFyKE8WFfH1Xv/xfVHdvTtniZ5FirGJWP+ojL
	UaugZ4p1lFF9m9h9Cjz4U24kZoUVnvZfGhOuKveaD4ahj5k9wnQCQlOODZgYAQmvggGkwfPqfn6vS
	NYokks0SYxu1+HcN10X/PsJWDKOyaJXyA0RZVfHpDvS/bwn9axQC8ar9C7Ul98ghW7Upi6Usve7Fc
	nP4qRqRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphnp-000000041sy-1NMm;
	Sat, 23 Aug 2025 06:32:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upT47-00000002t3J-0UK6;
	Fri, 22 Aug 2025 14:48:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2C792A588E5;
	Fri, 22 Aug 2025 14:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DFBC4CEED;
	Fri, 22 Aug 2025 14:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755874105;
	bh=LkKrp7CULRzpmB7Oo+nw2+h0gNYKA+9aLRXVU8vBOEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nEyjKluOkgPROp9org1bWv32L7DJPVEJYdQ6Ysbpp2Eby0GVIzUqNasQ2XqCHzxgP
	 EqDJ3F2OSNWoxEeRrOKHK46REihwzbojKN6bQlhw3hJYmP6Jyi+j4ATwzTQl5dM5yx
	 Kh3lkC9RI1LKITFhDQIGsapQ8X5xe30RxswppV6d9FtDF3bZ/4KaM6r7ISJCiW99Ij
	 OOGgqdJnpwnvu1wHE9feHPL7Nm5qRwACsW33jbcNjGWNC3neAZFsCJyThMq2pDb03g
	 7h4sqO7ipnzbPCAW9OWM5+uxpWG/Lwhbg2EcT0zFErkzhXfgo8YtLuvN1JTWjLjB+h
	 PfM+3grNyiFqw==
Date: Fri, 22 Aug 2025 09:48:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Robert Foss <rfoss@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	Simona Vetter <simona@ffwll.ch>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	Arnaud Vrac <avrac@freebox.fr>, devicetree@vger.kernel.org,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Maxime Ripard <mripard@kernel.org>,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: ti,tdp158: Add missing reg
 constraint
Message-ID: <175587410389.3790335.14225691250888377466.robh@kernel.org>
References: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
 <20250820-dt-bindings-display-v2-2-91e2ccba3d4e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-dt-bindings-display-v2-2-91e2ccba3d4e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_074827_233453_AAF2F8EB 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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


On Wed, 20 Aug 2025 16:17:37 +0200, Krzysztof Kozlowski wrote:
> Device can be used over I2C bus, so it documents 'reg' property, however
> it misses to constrain it to actual I2C address.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


