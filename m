Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D5DFB5164
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 21:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyThv2DxbTG/BKeYrv8aDgw2xYo6966hqmjyrursIqE=; b=OV6jNSpfc4l1t8jHVhX3rq7jXF
	uJkxCV43jQpwOWYT8R0bcJPhXFitgUOl4HQx3kiBCb0zXbj1wuQGDaE4Bm1xeR0dxBd24oQxh2XKk
	KY5vxAj5S4uEdKHvFZ1BHZs54JraYhVTTLX0E0FfRtvEbpAxCq/jaJPCF7OCOGRrTO3HjMc+23E6U
	ZTw1iOFlkPzYrf1sPx5nQdEErXkrr0ze0BZg/jUuWNDLoiAKschYmUAwHOKo8zvJGaaPYXnBYwRib
	RcHJrXvdzbpvGoM+xcKqpuGR7WtFZLiU5OXbV95DJHWlMxu3BZh5kkO9ctv3FTR9EuN6HmleaNrOF
	lvECpYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9rXY-00000005Wsq-1El7;
	Mon, 06 Apr 2026 21:31:24 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9rXW-00000005WsS-1Izh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 21:31:23 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-38e09b14102so8121471fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 14:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775511080; x=1776115880; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyThv2DxbTG/BKeYrv8aDgw2xYo6966hqmjyrursIqE=;
        b=Tw3Xh2pRUo2mXIIwOG8KOrd+Iw0lv0WVIgIiwxU1Wlz0FLNLBo7LL4cUq8P1oCfikE
         rc/Klsik1VPu1dxIOhB52TpAiuVi/os+VW5BUesJSYDulHB1PuMjUGruxpEW7WKl+hJu
         UZsQ00/l4YQ19VmZGCsaxwHbWgvKbmsgUY2ZLDGP46OodTDje80g943KddH/KNv8AIPR
         mcaeI+K0zR2yeGz97mr5DJ0/bJ6/7NjGWaprz/vzPS55YsTFJes0zzvewiepptnnujE2
         H+JkLtxdHJreGGvbUGoyI2fZDXh25FKJL+vzPDPYY+1BPkOjTz8T+tznJcOm4aRGotoZ
         VdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775511080; x=1776115880;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GyThv2DxbTG/BKeYrv8aDgw2xYo6966hqmjyrursIqE=;
        b=rWgrvvrpm4A6dKq8bXPMIynl9ygbes1GLYVmeKQosguwTJjrmCB11Y+obBGUs10uSs
         3B93TSeGBmfgJTKaZcV/pWd0saZVHTWgFyU+UUL6JdN85uTGcnIEVg1tZxILB9dymRqM
         mIzZ/ZD4QTZrSzsbaUFzfxEq1FT4gEUAB8jRG9Q7Bho0er9FlWSkZDS/Xomg/ZZ7hink
         q3Vam3HUFveFvAJHaajrs39W35ULxePSW1dAJDlT/dsxhmUHS2/Gwdxl6FNy03jpDwBp
         bMFk1aNN/gJqcmFhW6vULhiY0Heeczxu4o0jXMhxjVrLeho/jBFs/at/8iIr0pBBKpyJ
         rIbw==
X-Forwarded-Encrypted: i=1; AJvYcCUdRUtrhGoqyn73TR8uH8QQRI+rbnxPWavHpYyXDRJPkT3VmLYtQmKMgWNUIJO04elCN+KQFaPkoiapcPXWKXKd@lists.infradead.org
X-Gm-Message-State: AOJu0YxIrJ3GqxjP5zv/1E+kEuAhALtzEq3ZxAflCX6CMstvqobkVO2K
	AukBvZ6gHHI+7NhytQPwejldVyyzSQFZPrvssmcZAtMvsoQyV3S9IYia
X-Gm-Gg: AeBDiev3LeWtqe1uWpVmeZUSO4XYi06YVRfBymG4ljfsDlDRsjUEHq73ELki3Zp+BL5
	5HyEUsAa0R3FLlxqSQOClQb1T+M4lZzDTDyOVyGGgL2sgTJkoawm/N3ZpSgBA9XsXPMBKOeWlo8
	ldQJzkQfdGGfAZm++K3YsP1f13F6csJuIs0hZjxFdI2gUnP9M2JtIPTCIqXduuv8ykYQmn6MGj4
	4fJy9eTH8HSWdja+zC3m+L+fr0QNhwh2KMYvIEB5JK4hYzetkMHVpsKRYRQ95Ri7s5u+yQwdqBC
	XycNYrTstqLOJBofmjxWF5+EXhZxg2NwkQGv3E19Yi7AiLhrkqpkZn24e5hnX80YYYIdiBUT49S
	gyrHydAErMuMuKjT9S5kiKNlBvrFxk83HLSRKdd/V634f9GJrvU+RvlSBtkVfVUNzT7CCsfp2QJ
	AiRyHdOT/kaOisI7fhMpK2VTs13fE=
X-Received: by 2002:a2e:bc11:0:b0:38b:d8dc:4adf with SMTP id 38308e7fff4ca-38d9d439ed4mr46799101fa.32.1775511079668;
        Mon, 06 Apr 2026 14:31:19 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c708sm32952631fa.39.2026.04.06.14.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 14:31:19 -0700 (PDT)
Date: Tue, 7 Apr 2026 00:31:18 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: cedrus: Fix failure to clean up hardware on
 probe failure
Message-ID: <adQmJhxNkAe-ChRp@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
 <20260401191441.1217646-2-andrej.skvortzov@gmail.com>
 <ac5oecJ05oZD25VF@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac5oecJ05oZD25VF@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_143122_430688_DA9FC784 
X-CRM114-Status: GOOD (  13.37  )
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

On 26-04-02 16:00, Dan Carpenter wrote:
> On Wed, Apr 01, 2026 at 10:14:41PM +0300, Andrey Skvortsov wrote:
> > From: Samuel Holland <samuel@sholland.org>
> > 
> > From: Samuel Holland <samuel@sholland.org>
> > 
> 
> git am isn't set up to deal with two From: headers.
Sorry about that. The first line I've added manually and the second
was added by git send-email. I'll fix that in v2.

> 
> > cedrus_hw_remove undoes, that was done by cedrus_hw_probe previously,
> > like disabling runtime power management, releasing claimed sram.
> 
> The first part of this sentence is missing.
Thanks, I rewrite this part of the commit message.

-- 
Best regards,
Andrey Skvortsov

