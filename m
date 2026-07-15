Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F014C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kaSv4wtGCrlgRKnb7+XoZM8S1WHPmiPgEfak3MCbz8=; b=MyoZz0cSc8I7MnmeXD089ln6JR
	qa76bLE4p75pha+m7bbowa72YzL7tAs+UatiJU90NXfLOjJcCyBXn/RGatR6YgDW9W11sERz6H3Kh
	0QmE1KDlp3GaUa5kyCyiCqU9jnpjkOvTUPbg4bOFP7TiZkhMLFbszxoxF9JemBkrwkHyS/7XKW7ff
	XrRYXGo6REMK+DUJfJfztIoO5MzheoONCBeu9glAGL0hecHKa+3uQVyrp4T7titOH6PBeCLMqLCqU
	IAixQQXZlr+AvN8v835Z0LCWZ4AlPPDt7JuIxUnNUIeQKlSpz00C8JjRcqcir9RH+hgg4MUrRhb12
	M/r3A7wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk06Y-0000000F1Az-0KUr;
	Wed, 15 Jul 2026 13:56:54 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk06U-0000000F19O-3kyC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:56:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso18526065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784123809; x=1784728609; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8kaSv4wtGCrlgRKnb7+XoZM8S1WHPmiPgEfak3MCbz8=;
        b=NXkurFVQkBi41I2ZHrGl/vvoqlDozDGFkrPmhSp3QCCPCm7cxXZau+Em2u7Sc8+0Kk
         r4xnYLBGNv1DT6o109kHUyjd9eomEv+liUCjmSRFaD3DpLAkHqkjCxXd9k9gyxxaVswB
         GbaUIp4f0d8zqeRf3l5iIEV4iWybvNYG4ps+5X6sKLpNClTcI3TIMqqeVNYAMACxmLZl
         Y2iyArz7wPlOIcGoPaslAvG14eJwThgLE7z24RKBwArTve2TBR1SxsN5eWRSNCJ+Kk6u
         OecPOXmySGmWnEuX7eGlSLs79/B9xlmjHgUp3uZd4bt+kbq5XmbGkK0dNg3JD2HAz3C7
         w9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123809; x=1784728609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8kaSv4wtGCrlgRKnb7+XoZM8S1WHPmiPgEfak3MCbz8=;
        b=bTq+4LgYjB+bz/iP2xMwPO+dlsU8X8UmzVT5oA4/ZxnsU6PF6uBVtoXCTpXB09tdkc
         z3aP/b1151yvb6VtTnsCFDw9DCU8SR4qWNzUC9bVJ63W7wwNnkbAfJLzs13W0PwXJcPN
         zGXHyL1sE+pmOsN1hEuEsIyxshm6cf0P3qjJxn14L6W+Pf79Y+9E0/GlgQuLWpCn13X6
         8/ryqNDeAUA5IDqWRMWLSSA690NPuwurx0nwIr/eRQ7mqjb0SQxjivzGc0CHqlH8mafC
         QS2W/NkScyoxBcw++QPH8Ujfy7eIbbfPZqxcgmsVmHKbSnZkN3GwEP/nq6QHzGgBdOza
         3KNA==
X-Forwarded-Encrypted: i=1; AHgh+RqN0XXX5q5Lrdriu6dqiYELfAPDLnrndYXxnsOHSsRr9oDyYPT7xXWMKajyVU4oKOkhxNCd4/KGsWsNHrbpMqDX@lists.infradead.org
X-Gm-Message-State: AOJu0YxUqkf7LMSQCqhEOo0MbA88A/C2uQBkgJsI0E777YU856YtutsO
	6e0+wlF7wX4DVyoHO7YEwylFEXGXJYedCBoHsSavpwCOsCyzSm3qclW4
X-Gm-Gg: AfdE7ckmlStHK+dYFC+wxlsf/hqMNuoZkgqDfYtwKrdfj9LK338o4KD6elt/gW7rhVl
	ttR1ZQ3jPlGgNiqhpoHwWvJJs/Id5C+wHnGF/ACWZvCejHTJm5n8kr7QJm69J5O2HLJyfmo48F+
	+AjNlkOycGqP+ca+5CrItrr7G+vdymc5yGkt/vylxl0edoxQJ9FRO237CxngVCf0pLX9hh4bUzX
	bmEgOw+WtWJd5w2xp/6z135tgY6FrjcBfH6uigDi7sn4WijP3fxL/hM8h9dtX5hm5vlFUlTmm6T
	UpE6PY36IIQzGEl293swNQccXjY6DGpORj8DaZgKbedbiLKerW1blTcNNGjSEC0Fj2HKzw3JCVN
	Eo7UmMbafULDdhUg1LcC/IKAsAykuis1/a52Zipx1zykBwl/W1u+pPoSVPCmr1nt3n01tLpbp0m
	+EJh4RHSOv
X-Received: by 2002:a05:600c:e557:20b0:493:f822:ac5e with SMTP id 5b1f17b1804b1-493f8818052mr137073085e9.23.1784123808894;
        Wed, 15 Jul 2026 06:56:48 -0700 (PDT)
Received: from owl5 ([2001:861:3201:3d10:e682:163f:4878:db7e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm223373325e9.12.2026.07.15.06.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:56:48 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:56:47 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: defconfig: Enable MT7921S support
Message-ID: <aleRnyxN-xt82lKf@owl5>
References: <20260310-mtkdefconfig-v1-1-717eb3e6eea7@gmail.com>
 <177850089272.133673.2886390087848759794.b4-ty@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177850089272.133673.2886390087848759794.b4-ty@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_065650_940361_4E8AC2A9 
X-CRM114-Status: GOOD (  13.25  )
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

Hi Angelo,

On Mon, May 11, 2026 at 02:01:32PM +0200, AngeloGioacchino Del Regno wrote:
> On Tue, 10 Mar 2026 16:52:12 +0100, Gary Bisson wrote:
> > Enable MT7921S which is the SDIO variant of the MT7921, also called
> > Filogic 320 [1].
> > This driver is now used by Tungsten510/700 platforms which are now
> > included upstream.
> > 
> > [1] https://www.mediatek.com/products/broadband-wifi/mediatek-filogic-320
> > 
> > [...]
> 
> Applied to v7.1-next/defconfig, thanks!
> 
> [1/1] arm64: defconfig: Enable MT7921S support
>       commit: f86e8870547299cb6ee5b8c29d7e35d942b4bc39

Any idea when this one will be picked up?

Thanks,
Gary

