Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FB1C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 20:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fij0F7REbhBjOSux4ItPJsaKU8QY9MctiEHoW8yRhwA=; b=2GyNRYqFQnJvz4Wu46JpHur0dk
	NC1UYH4m1R8B3Ac5PkCIyqWY8TKYygXUubpUnGwXHMlFrkp+fp6EWw2b+FXqrS25XgfMyjq6CzIhJ
	id/HDn42Jc2IKWqL6TQW+jmiJGZt8nQpYADmYUnivstgNtT1ffpkAmlpCRTxhw0wSEN8kO0S6sRlt
	0doIVGUEJcXKRF5BctA2RdcDc+DKbpwcAgwuk8sJwPmVWckYMEHnhns2Ps7aBSdeGfzGKhnc222Fz
	aHhWOv/DWI+k2MtYB5jGnfDIbCTci19TTb9untI1vfqmBy8a3LuxYVOhnr6pbRTt90NM7v+21SZjl
	CILS9ImA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFgx-0000000FkrX-2no7;
	Fri, 27 Jun 2025 20:28:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFbv-0000000FkED-1NC4;
	Fri, 27 Jun 2025 20:23:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FFEF460CA;
	Fri, 27 Jun 2025 20:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55852C4CEE3;
	Fri, 27 Jun 2025 20:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751055826;
	bh=ZUs7oMicwFryr12OGl0ndU7qfjIlyTt3/e0DKs0MGVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XYvqsoLCo0czRGJb19eWtrW5bHpMhPlUhmy3uB8g/ehHEVFMs0cYqhFkC6s1buEte
	 d3kuw4FX3ejzT8lKoG5vvM8t5pJLOpUD1C/l0ILPWGcpiDU+Pt2/zXqjzw6XZZJRBx
	 R83HUQ0OLhZmEFVYHvgTO6kV8+se8wkpCRZs2hWif0nEVt8crYdNOBjVGT3vI6xTZ7
	 ZQ+wk7leKA7qh/DwmmOEToGfD5FyMUa7slAWwXG4OB0WaIBO+P+ylzMZ7LwlLSB6lg
	 1vGJEWgbMfOrt9o++UWhJ8niIFR4SlzkluUyq7SEqmWgr4faAJDig5UNL7OJQw5lTZ
	 O8TFDLQHEogBg==
Date: Fri, 27 Jun 2025 15:23:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Alexey Charkov <alchark@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Conor Dooley <conor+dt@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Yunke Cao <yunkec@google.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/8] media: dt-bindings: rockchip: Add RK3576 Video
 Decoder bindings
Message-ID: <175105582524.23618.936234591360412095.robh@kernel.org>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
 <20250623160722.55938-3-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623160722.55938-3-detlev.casanova@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_132347_387227_D66846D6 
X-CRM114-Status: GOOD (  12.35  )
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


On Mon, 23 Jun 2025 12:07:16 -0400, Detlev Casanova wrote:
> The video decoder in RK3576 (vdpu383) is described the same way as the
> one in RK3588 (vdpu381). A new compatible is added as the driver
> implementation will be different.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


