Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF46ACCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 12:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s90KB/NTrY2uO7MTlr/2on1AH8hzlT2J0wqk/Ex7Qg0=; b=um9KOw+siRQ/h3YRlR2LcTLcVh
	pv6QdjRvrzsod4+EYv2ALRYqO5EQK4Frn95rKejMBZSrnjSl8EG905EBPNe6Ks8YqM6+6iH8YwfBC
	JS/pDEUMZZuDhH3EnYxhJk/u1sT1ZM266aNdr+/Dxn+TLzSk3rNoNJ1eDHYZKQnkrqO7UBWwemh+A
	PoXvFifkkQeVnjTJq0h+Hgo6/8PY3GPwRNylYarR0JEPOqNZi7Ic8U+6bijMIKCwwilmZ31QUBQnw
	Wa5fZcOSnwuueAFhdMLnXo1O3/4hhRmvAEjiotXWtXhYuIjx+gK8JcSWfEgzC6peGOg/VZwrkDHoQ
	AKL1o8rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Bow-00000008OOb-0SwW;
	Fri, 10 Oct 2025 12:02:02 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Bot-00000008ONU-2Y1u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 12:02:00 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b4736e043f9so290388766b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 05:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760097717; x=1760702517; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s90KB/NTrY2uO7MTlr/2on1AH8hzlT2J0wqk/Ex7Qg0=;
        b=lmSXbKmrLUKy4jTp7T9S6c9l6JTD4vCsUVvZobnExJD2BMRdiE59Mc7TVYkG1vvrw6
         IsVT2ZaPHAaSang/ZRPaA2VkManx0gHwbUGFZNIq4H10xcZqn3IGq8exXwFGXRkzLlu0
         ApcEYE9F6zeAt/Nf3zLbCHpwW7GDXPFzM7uQNsrG8QuBg3AkXmANdTnUVc5nprOYK9f3
         OZu+cJda7qyYTKAuem5opzbHam1/M3N4aWj3jhZ8Xwcg3SynIAwn1kLswMfgWJo3geI8
         zoQGCN3iuIt4pW3RpbTewaMjBkP4r4GgWjOvQl/HHxo1MzH0h5xILX2i/QGhibeq1Wpg
         9MiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760097717; x=1760702517;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s90KB/NTrY2uO7MTlr/2on1AH8hzlT2J0wqk/Ex7Qg0=;
        b=n3CITw4NYWYv/noIhkQs80P+hb0iS1HRHPxQtFvsSR+lInKySKn62YFgWddAGgJWph
         iK+SLzOvrovbrxn7NswYMRJhPGlqO1YZQ9Tjd8/iHaIuXtrv9rIoUxq54O0BPZalxAjb
         1+PFn4KsG2jJIZl20MpHXR1H3uraBjSB2cakZ7E0aA/d7Dfn3eTeDHc8Eb9qE1RqcEIQ
         xMlv/uPn9b7gDoQcPraqZQr0ct3dM33eQ5+Ab9LlUHKFt13KUeZYPgVFmMKQlVP/MpUx
         ss/lG/PQEibVsLJnkUESQzKDB3owAxXaeeTACkyzZf1simFTTy5bwmmlkgWhBNuJe74r
         W+dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFqR+/rcnfXDCiMX641ffuZ3oIuimO45oD75FdwTdzC05OsLkVCYRX0rFqjW0ZgmGw+yGvfZG6uYWCBjdMOF8x@lists.infradead.org
X-Gm-Message-State: AOJu0Yyay3BNGgRpnKea+GctwS9XGfKglQBvLmqwELL/+Wm8CUf++8C0
	+BYrE9v1XLcS6IleMn9Fkyx1k9b03ywBJimy5ghzIlV05DnR6J1IN5jyPeElFM/iDD8=
X-Gm-Gg: ASbGncvTso+7+SLj8FLmf3cDF6HeoB3yfxiw6fRawmU4Ld9dpu0nlrTwFTck9BaEMV8
	z8h0t3ROdgjevqC8Eyko/HJd52dmqLGl4vnyny10G9CB0BFzZeJ7yjnaP/gvx95IikOz+Qnkmij
	kyL9tb+1+C6ZHRrCIWUnQjDHGeYUwlqE+8OCwasd2hXOgurtn4aX3/paqezUWqUa2rBFvYvvtBU
	t0t4B6gfJFUaIPcraNiGSTkCWxyzEIqljlz3SgHj0yMAArlMVwloI3QVwdtsX8J8+IMI5i1MEQG
	ufd3sMYGnoMswNgLBjt5332E1m00pFcV39RObJ16vxqubSonH13BoI3XRy6HqMijpEtB3/vmvD9
	RS++aXvND45+FO44Y7D9I+bEv535XrlsuK9lgoV/zXEjEA7BkKTYI1JnQv3N5ykwuFWTBO6f4QM
	Rl6Ye/vVvTBJU=
X-Google-Smtp-Source: AGHT+IHFEbOgc0ODAF0VuKf0ziv5aS2t3f+mpFW0dy7lOT4Bfjw96VQjQByGIVRZZDYAlQhb3Y/lvg==
X-Received: by 2002:a17:907:7f0b:b0:b3f:f207:b755 with SMTP id a640c23a62f3a-b50aa48d873mr1107494166b.6.1760097717302;
        Fri, 10 Oct 2025 05:01:57 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cada4fsm229334066b.6.2025.10.10.05.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 05:01:56 -0700 (PDT)
Message-ID: <f71052d2-8969-436d-9109-d5abe70b81a4@linaro.org>
Date: Fri, 10 Oct 2025 13:01:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 06/17] media: rockchip: add driver for the rockchip
 mipi csi-2 receiver
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <20240220-rk3568-vicap-v11-6-af0eada54e5d@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20240220-rk3568-vicap-v11-6-af0eada54e5d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_050159_665234_F4C20483 
X-CRM114-Status: GOOD (  11.61  )
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

On 17/09/2025 16:38, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Rockchip RK3568 MIPI CSI-2 Receiver is a CSI-2 bridge with one
> input port and one output port. It receives the data with the help
> of an external MIPI PHY (C-PHY or D-PHY) and passes it to the
> Rockchip RK3568 Video Capture (VICAP) block.
> 
> Add a V4L2 subdevice driver for this unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
I've been stealing ideas from this patch series for some time now.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

