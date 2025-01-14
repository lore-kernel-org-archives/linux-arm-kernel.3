Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF84E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 15:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQWVZCzJjONf9MD2zqQKoSy7C5/tRi8G57MPvXxDJbk=; b=MxVqBMzH9Xk++CCMV+pTtvx+Ch
	4Sdz5uBZV8BzPACmfkL2LntCYHWzpXTYRrqsHNrFBAsaLLLs9kI4eCWBMokEhnKj/G11Ne217iUal
	6R3n2RROi3YotPTc4rMs43HawIvFLseUrpyzI3Pywtb3XajIjMtxtnn1S1Ji2XmazAxKeKWYkko/s
	QRtyeal3ZZDC2Z6Z4bvUiUS34wdPNBxA2d2hhjLI9nO/rZAlz/Qw5RsNtoV3ngUzH/EDE5vtuSutO
	T0KMtpMxvLq4vBL0H7d+HOAdUmbpXsJAES/P8cUmRL+v4GzsDgr5BMsyQZ09xOWWIlRdTGm5txtz5
	xhN16L1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXih1-00000008pgP-1AI1;
	Tue, 14 Jan 2025 15:18:59 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXifl-00000008pax-0O2b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 15:17:42 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso1015381466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 07:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736867858; x=1737472658; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQWVZCzJjONf9MD2zqQKoSy7C5/tRi8G57MPvXxDJbk=;
        b=GJVxbOQ33KOKKhuX+YO8qi5KmKlRq3y+63IN4eXJSlYkDV+/JUEsQS6AjaYD81o5oK
         XiucPfI6OzlHXVlLtrk2Wp9sr2U8byFO0dkDsrPljgsqmQ+V19JqiI1wVJxRCuW3EgYA
         +bfc3Se95aRekvGCKZg5GYGdkbps3Cs8TNQGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736867858; x=1737472658;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pQWVZCzJjONf9MD2zqQKoSy7C5/tRi8G57MPvXxDJbk=;
        b=JZ3cw9vNJdxUF/uvZRgxy/zQosKxCjRCJZHBwQgxJvIqreV0U5NrZDC3Fbhs4H3XSX
         /1BEAhViU3pKdUCSvmCSduhPTtGA/cVtvKNifSJ6svx5nKiI7EX0Wj81oGUi7I33vvGQ
         rvdGMCgUzws4sZZAUd15wy0bJeG+qOsp2308MvpQ8R1zrx7VmLZHgGwfJSyHXUeoTa4q
         N1np72BhJkvmC1IVMYHUDtNip+OGcxNgDdjPng3HUH0iN+WmRM36q9vdc34oRzoJuTGN
         OC7IOHeMIJXjotZ3Tq7IA7V9WPpTXWs7h9/FFrmeXhPCn0kgC07GarKyZnMbDZsJ1oN2
         McOw==
X-Forwarded-Encrypted: i=1; AJvYcCXePOsN49v6AbppFBhlwZrcrOOrGBd5cXUWTSUvc0+QqZnJlMBk8/iAWrolDWTdU9Jn5VL4ZNT/c5bGRLGdD+jT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx59Izue6zRy/Phdv9eZIpMMFXwFqs7JIKiQc2gsN2Y3ds5orRk
	Km1zsTAvQ7uvW7NKCXn8B4AfPSmirDZ1Tf1Xyk7Xa87xs4T0QI7tlwubo7aDDAs=
X-Gm-Gg: ASbGnctq9Husb6qan1UmE7+x/NxPRSgmkH1GPgcETdTQv7wcVFcGbOlMceZjHE7Nynq
	T9ctzqjmxgcocEQFXg3BM/8dbIS2gIXWRK742vGAzPlmaieSLY/OnOH+CLMnxkPsETWTWL4f7C1
	07rFQelnRSxEv+lR1q5VUQLL46Rb5ynwzzB7Vrp6/zZmZsdOc9n8WJ1u1cxWR+dwv9mwqhHwgEx
	Ud5sK1RsT7jN7anaDX7e9VWZzk1gt6RKzK0+rNUCk6a4UDTvcbG3y1ormn9YU8nWaP6
X-Google-Smtp-Source: AGHT+IGT2QdUEExo3ZYiHoJHmXJJ/EkUrorLws5bU4PVtJoU0zzZ/jzA8NZO5j2BZKS0oNyTy74E/g==
X-Received: by 2002:a17:907:6d04:b0:aa6:9ee2:f4c9 with SMTP id a640c23a62f3a-ab2ab6c6dffmr2382002566b.23.1736867858477;
        Tue, 14 Jan 2025 07:17:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90d9ae0sm648358966b.68.2025.01.14.07.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 07:17:38 -0800 (PST)
Date: Tue, 14 Jan 2025 16:17:36 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Hector Martin <marcan@marcan.st>
Cc: devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linux-usb@vger.kernel.org, linux-embedded@vger.kernel.org,
	Asahi Linux <asahi@lists.linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: Re: Unified Type C PHYs and top-level port management
Message-ID: <Z4aAEA6Kmc4R-Wlb@phenom.ffwll.local>
Mail-Followup-To: Hector Martin <marcan@marcan.st>,
	devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linux-usb@vger.kernel.org, linux-embedded@vger.kernel.org,
	Asahi Linux <asahi@lists.linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org
References: <fda8b831-1ffc-4087-8e7b-d97779b3ecc5@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fda8b831-1ffc-4087-8e7b-d97779b3ecc5@marcan.st>
X-Operating-System: Linux phenom 6.12.3-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_071741_135141_B3757CFF 
X-CRM114-Status: GOOD (  29.89  )
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

On Tue, Jan 14, 2025 at 09:32:11PM +0900, Hector Martin wrote:
> - On the DP/display side, we haven't implemented this yet, but in the
> future the single "apple,display-subsystem" driver (which actually
> provides the top-level DRM device for all the underlying discrete
> display controllers, and is already its own virtual device in the DT)
> will present virtual ports for the different PHYs, and handle the
> muxing/assignment between them and the display controllers on its side
> (there is potentially complex policy here too, since not all display
> controllers are equal and there may be a need to reassign a display for
> a lower-spec screen to a lower-spec display controller to free up a
> higher-spec controller for a higher-spec screen, but we need a
> controller assigned to a port to even read EDID to figure that out, so
> it's going to be messy).

Just on the DP/drm side I think the pieces are there, but might need some
polish:

- with drm_connector_helepr_funcs->detect_ctx and ->mode_valid_ctx you can
  temporarily steal a crtc for probing, and as long as you don't hold
  unrelated modeset locks userspace shouldn't notice. This goes back to
  crt/vga load detection where some hw needed drivers to light up a full
  crtc. There's also the entire drmGetConnector vs drmGetConnectorCurrent
  to avoid such potentially expensive probe steps and just reuse cached
  values.

- if you can't get a crtc for probing there's the "unknown" connector
  status. We could perhaps sharpen the semantics of this (like officially
  documenting that reprobing with all other crtc switched off sometimes
  helps), but it's there. I'm also not super worried about this case
  because we don't have any available crtc anymore, so even if we can
  probe there's no way to light it up without disabling some other stuff.
  And as soon as you disable other stuff you can probe everything again
  (with the fixed locking of the ->detect/mode_valid_ctx callbacks)

- for the crtc assignment issue there's either drivers virtualizing them,
  or userspace doing combinatorial probes. Personally I'm leaning towards
  drivers having to virtualize crtcs (and then you can peak the least one
  that works, which I think should sort this out), but it's an open and
  getting discussed in other areas (like having to steal crtc for
  dual-pipe outputs). We might get a proper documentation patch with an
  actual kernel/compositor api contract here.

> But I'm not happy at all with the weird, load-bearing intermingling of
> tipd/atcphy/dwc3 there. There's bound to be places where the
> abstractions leak and we end up with more and more horrible workarounds,
> or layering violations.
> 
> A further question is how all this should be represented in the device
> tree. That might drive the software architecture to a point, or vice versa.
> 
> Any ideas?

For the larger issue my only uninformed take is ... smells like too much
midlayer.

Like you'll certainly get some raised eyebrows if you submit a DP driver
without using dp helpers since that's a proper standard. But if your hw
has half the DP stack in firmware and just can't be smashed into the drm
dp helpers we have then I think even that would make sense.

Plus we already have like 3 different generations of dp helpers anyway,
because getting helpers right is kinda hard.

> Some further reading here:
> https://social.treehouse.systems/@marcan/113821266231103150

I dropped some unstructured replies with the same stuff on there too
first.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

