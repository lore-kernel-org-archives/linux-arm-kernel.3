Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970C5CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 11:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0EtKdPy1PWYpoHwEbU4TADx/7jEVJjgADRxCA2SS1U=; b=wIQaIUokybKrQb7kOIR1c+ckxm
	tZDN1ObcODab71nbRmHus6Ljsa8c3QpR6nX+FS68m5E2s3jUf+YTdBbPAkiWfaW+R/wXn5/GRYvDV
	KA30rV13Fv+ckYyvGnOo843+rugrNywdYwCbYHfSiLpVPCZYNGG4PG85MdUWNcEja8IEvlXyss70p
	FMuS+2h7hkKE9lxHzLbIDnaaizvrcNiLZKdIzcLEXkb3TLb2u/6yab6UVKIB4B40rUcgOcyjs4tjU
	rjIwCSFaiULHp56DbIVMdbEjY1iRUVg38ApUQs184Y/em1uFPaKS6LI8xFldJYjVx2wq5AgoUg6Du
	kXZv8clw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlt2-00000006FxH-3QSL;
	Wed, 03 Sep 2025 11:42:48 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkoV-000000066qd-3bYH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 10:34:05 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-723ae0bb4e4so16669687b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 03:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756895642; x=1757500442; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z0EtKdPy1PWYpoHwEbU4TADx/7jEVJjgADRxCA2SS1U=;
        b=QGy4QGA3+bLAdEYcxxyivyGEnzHj4LsQfxAxbcKdZWHH06wF6llNsA+pfEkkGDETaY
         XVQAdabhe08uThOEjhyzDniYfunxHyVy2nrJSwEky2NyRfj5ZFvaGfHeHF8QSrs3qicQ
         Fxtgi6lBCzx8WWovAfYHZ2yOer1n2Hq7SdTu3uYLayDSUxqOHYVI+fqfLpDyNfxtveRb
         wgZjRKNvK7qU+rFwSSJi9PwZAJY24dIe/LSac+5bI6NUtJqItGUvko2g4zQX3YC5STYp
         WEKMcGF6iRHysYRpIQtIW9Avke3u9RgfLvnhRBKB4Bn865cY6NT7uw9Wmkn/v3EDGRJj
         lTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756895642; x=1757500442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0EtKdPy1PWYpoHwEbU4TADx/7jEVJjgADRxCA2SS1U=;
        b=ljpgBGPkOHgCxq2G3qEFHQ8GoCpUl2Q05KctYrDdBA3PqmoyebSbi/i2nzdIgQmDyh
         B9mJclbUJhRSD5mk8hwXYUorECZuq5JnSGD+/tpIiyQyci2DM6DoJEytFIdu8VXzRcx1
         WTMehPTP19N51CF+uQxGUONXDhfSIHYaL2pO2uPW50Ba7dcEb+/tVZ0Tyo/WBgdPSwsz
         CME+eUnrFw17kI4N1OzTul5HsT+AOx7Bfa6NVKu5aBc0igK4OLl+rqcjkcYku/lJkZyE
         kHLwcKyCUgt8tTb0/ulOfjKBDDfIE8CoAUA318tSXWDQidt95zw8lqXAOJKOWJmBlZsN
         detQ==
X-Forwarded-Encrypted: i=1; AJvYcCXngRWdkCkZ0cZlpQChTP4uGdL1QwVWpmMr3tq5HA7O4tGgPQI9mocnKvV3nYWxS6bbuRqyM+9wJFtN6kp0g70h@lists.infradead.org
X-Gm-Message-State: AOJu0YwjEgkUjbozYbbV2HQbS6HjyYVvVUxxgi22A+NAmiVQsXk63Hpd
	bM32uxbUvZxX/Ahkt4bHixyUtwt0bbHOi3gr60zoTLaxQO3PnTUlxEXYq7AxVESX97aF8li5G/L
	qzhKEzWzqSEZrO2RLhSqtIT9bFKE3kEiQEtBOPhcXQw==
X-Gm-Gg: ASbGncvr/Lkc9HGCrj5d22vUEkE3qsdBqpRiARTTo3AlnJ8OqMVCcg6FxDT5hJiSw20
	GMD52DxIdZH9/vHSlPWa81E7rrv9FTNFwhRnJ+Gb08qRtyjqeHjY+8uc/PBr6mvjZJmoE5ciupx
	L24YWPNtZL5n9palSkBFt6SQgIvp9MosKJtdESL55G4hmRmbxlOCh2JrC1WhTe+Bl3kzdoTbdHo
	VRqWdKnKwoZoPt7LWo=
X-Google-Smtp-Source: AGHT+IFfKLxV9tyzOQnEikdZaazb4yoGYzUJMKmsuTzVmQ83iHm/xqY/KhFL0iCqSoFlmWwQqKTl/pZIy8pjx3bEoRs=
X-Received: by 2002:a05:690c:9992:b0:71f:b944:1015 with SMTP id
 00721157ae682-7227656cde8mr166303267b3.48.1756895642243; Wed, 03 Sep 2025
 03:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org> <97231ac9-5cde-49bf-931b-d5baf6d2d2d1@ti.com>
In-Reply-To: <97231ac9-5cde-49bf-931b-d5baf6d2d2d1@ti.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 3 Sep 2025 12:33:25 +0200
X-Gm-Features: Ac12FXxVFiRwM0u9ulXeQmiXI7_oecrVOWSFM0H3YtDXDfcwWKQ-S2uZTHsACkk
Message-ID: <CAPDyKFr8AYuS2aEVs8X2As1NzXnbea4rPLKiF5=fKjq=PAeZgg@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Sebin Francis <sebin.francis@ti.com>, Saravana Kannan <saravanak@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_033403_911776_D77C51D3 
X-CRM114-Status: GOOD (  34.88  )
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

On Wed, 3 Sept 2025 at 09:39, Sebin Francis <sebin.francis@ti.com> wrote:
>
> Hi Ulf,
>
> On 01/07/25 17:17, Ulf Hansson wrote:
> > Changes in v3:
> >       - Added a couple of patches to adress problems on some Renesas
> >       platforms. Thanks Geert and Tomi for helping out!
> >       - Adressed a few comments from Saravanna and Konrad.
> >       - Added some tested-by tags.
> >
> > Changes in v2:
> >       - Well, quite a lot as I discovered various problems when doing
> >       additional testing of corner-case. I suggest re-review from scratch,
> >       even if I decided to keep some reviewed-by tags.
> >       - Added patches to allow some drivers that needs to align or opt-out
> >       from the new common behaviour in genpd.
> >
> > If a PM domain (genpd) is powered-on during boot, there is probably a good
> > reason for it. Therefore it's known to be a bad idea to allow such genpd to be
> > powered-off before all of its consumer devices have been probed. This series
> > intends to fix this problem.
> >
> > We have been discussing these issues at LKML and at various Linux-conferences
> > in the past. I have therefore tried to include the people I can recall being
> > involved, but I may have forgotten some (my apologies), feel free to loop them
> > in.
> > > I have tested this with QEMU with a bunch of local test-drivers and
> DT nodes.
> > Let me know if you want me to share this code too.
> >
> > Please help review and test!
>
> During testing on a TI platform, I observed new kernel warnings after
> applying this patch series:
>
> ti_sci_pm_domains 44043000.system-controller:power-controller:
> sync_state() pending due to fd00000.gpu
>
> These warnings occur when a device (in this case, the GPU) has no driver
> bound to it. The fw_devlink_dev_sync_state[0] in the core has a check
> before printing this warning. It checks whether the device driver has a
> sync_state handler OR the device bus has a sync_state handler in the
> dev_has_sync_state[1]. If both conditions are false,
> fw_devlink_dev_sync_state[0] performs an early return before printing
> the warning.
>
> Before this patch series, both handlers were absent for device driver
> ti_sci_pm_domains and the device bus, so both conditions failed and no
> warnings were printed.
>
> This patch series adds a sync_state handler for the bus, which now
> satisfies the second condition. So it doesn't do an early return and
> proceeds to print the warning.

Thanks for the report and testing!

Indeed this is the new and expected behaviour. I agree that it's
certainly questionable if those prints should be at the warning level.

We should probably downgrade those to dev_info(), at least. Let me
send a patch to see what Saravana and others are thinking about it!

>
> [0]: https://elixir.bootlin.com/linux/v6.16/source/drivers/base/core.c#L1777
> [1]:
> https://elixir.bootlin.com/linux/v6.16/source/include/linux/device.h#L909
>
> Thanks
> Sebin

[...]

Kind regards
Uffe

