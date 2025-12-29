Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D9EE92FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 20:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mT72sLXnNV3V/jTjLvqc6CW9rW/yO+T8uURGolooNUk=; b=iflaVyiIDvhHYiwFSQvuDNWkQl
	2Hit8M4ceYAWcsROuvLOIQZlooIHXNCY+g6/hQCbc2eKv8T1kMhVDvDdQb5gSUcVNjh6MGr2xZtrS
	/IB9vjFT1vYXboNmgLqSOjovqMX5EHUr2VIhB15mDi70yGHjR3RCqkgfrfWUwHdbrY3iiNunzDEoO
	woZ6IHz22g/xx0damspE2DuA0b6AEp0I+umlz2InpVdTRz3G1weMuH2fvfrBUE9zLY8xIS4ntfAmv
	NyEW8FKlze3Pop5gy32ns5Tz4I86Fz24GvbyaGg5tBvRPt1rWCVjgqMIvw89zeORXPkOCHSEopdoI
	vZ4Q2OWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaKKY-0000000449C-1aEN;
	Mon, 29 Dec 2025 20:59:06 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaKKV-0000000448m-3EXG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 20:59:04 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so4693488f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 12:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767041942; x=1767646742; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mT72sLXnNV3V/jTjLvqc6CW9rW/yO+T8uURGolooNUk=;
        b=ndmvZotDOfaCCxYoufLQb67P1FHlGCW8n2XqG3SIgEKVDXf70t8Doxug/hLTtsV24L
         GYy/4CzFObB0dSlqvkXDdGi8oNBizlsTCB9r0PJYqNFZVwUvxhzHdefVrB9/mBOWzkUK
         WCMdYIR0Zb0FNGTbuy6JKSECgrY1qA4wnAJd5j8T19WnalzVPKMsDK3RXantKS2Ti251
         g/4f+48l2hqA9kNuHFizJAtBhn7+NYT0cpLbhC/CVhLLLVUEury6GschDiVK9Q8oGnSI
         uR6pwaK3O44Ch5TgQod7fP8UTcdr+ocgAhqZM0ujcdaSjQD6wNw5JrmFKsH+H5+q18Kr
         Dt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767041942; x=1767646742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mT72sLXnNV3V/jTjLvqc6CW9rW/yO+T8uURGolooNUk=;
        b=Hgj2ZXGQImolvYIBh6ri73wD+RwqFbeEgrhAO0QihDYnXUojuC8vNZKV4Wuh5iOvLp
         kzxeimWgY6g8dXH9hvyEERtXwEUkdnfD6uWglpcxnk0Vd+8cfvVVCYwlZZ3wRUAzIafo
         vPl674TNSNHbA6avdFa9BvcxFLFX1MxOCrUHYUdnPCrNoJgG1zrUrZu2hRgfrF3OXwM6
         Ulm3poCJir+M/DEx1fy5FB9P5PMWnzjDhza+jPBH1SbxVz9k31e/VPQNEw2gm6gwokef
         YWnBUXObKNRAsNERCuV12HRcq0yqwg/MPYJO0yru+pE55DaWCscJUart4T9juoCDEWAa
         8kRw==
X-Forwarded-Encrypted: i=1; AJvYcCUA9X0jo9z9j81uNE4jZa8Oog4jlM0YZUX9M979yVbn6TT7fYfNjGPcMHkxfzFpG3Pjx1Gv/uDOhQKiSJYz0XCB@lists.infradead.org
X-Gm-Message-State: AOJu0YwobXwakFhdHjpUxBQjnzFVzx3Vkh1PejM7wNoPUr/LMwdWS8g6
	tGnosqDdZb/5G91UK4PBJoKBEONv+FYXGODWlwx/LIXP6imG9yK3LTpv7WXGBl3d
X-Gm-Gg: AY/fxX4h22Awb7ZBOqXALMXm+Hi9jTXvCareqHLazbKAzjlk9udhVO02zps4j2hiE6X
	f8jfHawXbZUbFDR4aUsEC4NqzGqZfWUmWXRaadzry2hZ2gGnMnzDJn1AV1S40ACcbGj51ZrOpAe
	oMKlqp0NkILVpUuFIcVRF24nB5Tk8Gd8SCvqp9UOYa9FTQ4Y9Kyg1fpX4C7fScRwwD8Wh/imf31
	DJr4b1l4xb1Kxac7R+4NTjhgFeLxSkz7DNWLmenj9q2XB6GOnPfKsx1e5uEXcSI+7O0K3ZgFOdm
	6RhAFfnEg8UcwJiQygQiajBvg3Zph/yXJtBzggklseIBI0WbhtGoqGs9jMkZ6I7iA/PWJb5XV2s
	6ksN8IdII2s9CLIRYH+UH0rR8jbhy2XCe0L4xBPc3V+My/XVhYdYPzt5uh8tyF8LGk+ORU4SFXw
	Yxo8qexrkhX8xLmqwEZptCKBeEfhoI+jq+GFkRIF/jNkI9VXdFKdLkKCK7wS0twzUP3UNJKkMRt
	gI5e8sgnHr20+dOyVjrE6q53Kw=
X-Google-Smtp-Source: AGHT+IF+6dfGz8jAW2jy8V3d7wl/tvhBrzoFF1KjAPTCU32EzmQO5hO9Wctj+4CVYLo8hx4OP+5hSg==
X-Received: by 2002:a05:6000:186e:b0:432:4c01:db00 with SMTP id ffacd0b85a97d-4324e4cff0dmr41189328f8f.27.1767041941354;
        Mon, 29 Dec 2025 12:59:01 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-220.cust.vodafonedsl.it. [5.94.28.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432613f7e6esm53784810f8f.21.2025.12.29.12.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 12:59:00 -0800 (PST)
Date: Mon, 29 Dec 2025 21:58:58 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Yannic Moog <y.moog@phytec.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 3/3] arm64: dts: imx95-var-dart: Add support for
 Variscite Sonata board
Message-ID: <aVLrkqgjrsX7jfYw@Lord-Beerus.station>
References: <20251229150421.57616-1-stefano.r@variscite.com>
 <20251229150421.57616-4-stefano.r@variscite.com>
 <0afc0945-af65-410d-8556-1d09792981cb@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0afc0945-af65-410d-8556-1d09792981cb@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_125903_827429_E8CD541A 
X-CRM114-Status: GOOD (  13.97  )
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

On Mon, Dec 29, 2025 at 07:24:50PM +0100, Andrew Lunn wrote:
> 
> What is this ethernet connected to? In the commit message you mention
> an SFP? So i would expect a phandle pointing to the SFP cage node,
> which follows:
> 
> Documentation/devicetree/bindings/net/sff,sfp.yam
> 
> 	Andrew

Hi Andrew,

You're absolutely right, thanks for pointing that out!

I mistakenly thought fixed-link alone was sufficient, but after reading
the sff,sfp.yaml binding I understand the sfp node is needed to properly
handle the SFP+ cage and transceiver module detection via I2C.

I've updated the patch to include the sfp node with i2c-bus and
los-gpios properties.

Sending v2 shortly.

Thanks,
Stefano

