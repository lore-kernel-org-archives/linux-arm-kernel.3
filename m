Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC1DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 12:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwPmH81nKJ/dKUdS2s7CTbyuKAaXa7TlPqH1NAnZE88=; b=24fpT3Uy6ZG+fS4fXOY5CNh8kt
	4iAGAJ1OnvZbgBUwL+3382JwvTmPyTFfs34x/jN984xogCRe1n8V/ShstJbO2myVcvpxEgNH9gFru
	6nUNAqCHDsKcxXLcgblGXM7+p0WjFRYHftAxkSMwLPbknMZSR93tCzmzYCt22XGNcPY2Rw+4xJWYv
	jAGIOrUxZffiyDPtBU3zGz/wgrJxQVQ35MITAp1g+4IgG6zCF3TYL7uvBawgjJN3BZKFg/M7phogJ
	eHo+sXFXK61U8qvr60MH5cT0e23SHveTXwDtYn2hki38HybzwjyEyDBvUh6DaKDB0uvUXSArM/E12
	5FlQcllA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8YK-0000000GEtK-2czf;
	Wed, 12 Aug 2026 12:59:28 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8YH-0000000GEsK-0lG0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 12:59:26 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38e7109321dso783060a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 05:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786539564; x=1787144364; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pwPmH81nKJ/dKUdS2s7CTbyuKAaXa7TlPqH1NAnZE88=;
        b=Ug4jwULEAdBp4TZNLgsk30ZwEeAgNs23yDnz9BEJ28YddF7p4V0ZTZOyGOZxCYi6aV
         qn+/0PweU7q+8fH91GjlBppeEEpMLZ6i4uZSEG7qkjWsEN8F87Tj8YsoQis6BAVIdbDS
         dwsSujsNlhhyvO95phPZ7W3XiEQv7JXyN6SpkT6wCa0wKvgAgIn8hN6ZoUmQc4ZGH4u7
         sVPSS+uzCRomEsxl4IIGA3njPQ0bV6eut7slHj4yJaif78vqUtpbg+Lrjv8tWCWzXdHs
         EF3WgTahJO/qNUmyEAPhxxmZJRMbBrgmhebEQ/HfxxR9HwlIbdFPG1gqDP6LDJV0bWVp
         NaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786539564; x=1787144364;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwPmH81nKJ/dKUdS2s7CTbyuKAaXa7TlPqH1NAnZE88=;
        b=Q+KhBVf71lsf2YNOodS5GQ556gIX4nVnRk/31v4m5+mTMSNtwrWjKQMMV/vjXDOxGR
         z5ckgkBSSqzNzmMqOxkqtNDVReDZSSlb0Lnrhs/4YZgPlgKj25/5InDMBdyKeeQwvQrL
         TUzXGM2O06mf0+G07k6JR+0bNRH7/aLs6cFMREUsvvWf9NOp2pwQfAd9ON3qUtR3wOTt
         0Wyx8TYxGA4FRrVs7+JGnFcWOJp+6fxS1gpXvc4BbiRVwzX2vTkCfjMMj+qjXgnszU4a
         GWyfWjM9c/FkNcf6/y/G7rOJcOLEU5N/JCOB8jJHNj6kTnrvHF6qutvxJvunrFJEDB4c
         TzFQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsGBSPAUIFVclEF/ywOZh6lTkEGDXVtYhZETUDUEw1kifTeyqaBx6mzEfVxg2Wr70g2KECVPfp2E0SvAhht2by@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp5rOqyQ5xKsvNSgLCc7TV4gMwpAqcMj5TbY5Fj/hqR/E2VRF5
	xdKuXzmeY7XjSUYH/jTeBr4uSjX+P1WFcHCKXR4SWFNZ/mD2Npnz0bw7
X-Gm-Gg: AR+sD136WBSvpJHmMhz13GOVuBlbC9ppgVBdSq/a7V/3TgVu35VDz5cFpO4Lj88HWRa
	I1f6fNp+T2XcLseIXWTyOJcS937RZ0QNIL2QT1zT/Y1wgYjKNw3TmN2WhS02BzNS802AhKDxInv
	ClDnBTK/ddd8yPuSk0J1ssbiL+y8S9BzdCeACKSdzzQ0fXPgPwLoMSBWEiLx+VtsK29JIqVS6ya
	9Ho+PunCN5GrzOSGifhqkq/UVHOBUWI2XWXLXY7/ZyL1ugUEY6EIjBqWq+JxEJpSyyjRyOQEzXj
	J0Qk3+FUG5SgJkiFQCNBjYIa70Y7mC7LyXgMCCGjwAf1FpXMsddkphWOHrVNXdF1yCxtX78Wisy
	tEfERtEssrZC3UM+hJE2tNPNVkKVnowKWdv87Xe2G6xonwQWYDuWmucV57TVxSlUe5DCVTD4lPN
	NiDnKTn3wXkODrTX+NPFYiEiOEc1e0xZixLwfUWFkwpjeiYz6DoDOTwOJcLNezxu1FmggfyOu1l
	7oK
X-Received: by 2002:a17:90b:164b:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-3930128c13cmr4879261a91.7.1786539564092;
        Wed, 12 Aug 2026 05:59:24 -0700 (PDT)
Received: from zhuxin.hobot.cc ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392fe485255sm980949a91.2.2026.08.12.05.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:59:23 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	richardcochran@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: stmmac: dwxgmac2: add XGMAC timestamp interrupt support
Date: Wed, 12 Aug 2026 20:59:12 +0800
Message-Id: <20260812202027.976@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <b3d90606-781a-4055-8529-e68e22a45ce9@bootlin.com>
References: <20260810100221.9166-1-zxyan0222@gmail.com> <b3d90606-781a-4055-8529-e68e22a45ce9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_055925_221049_C08D6A02 
X-CRM114-Status: GOOD (  12.00  )
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

Hi Maxime,

On 8/12/26 5:10 PM, Maxime Chevallier wrote:
> If there's an interrupt storm, then this should probably be a fix for -net
> with a Fixes tag.

There is no interrupt storm. XGMAC_TSIE was never enabled before this
patch (XGMAC_INT_DEFAULT_EN was LPIIE | PMTIE only), and
dwxgmac2_host_irq_status() masks the status with the enable mask, so
XGMAC_INT_TSIS could never fire. The actual symptom is that
auxiliary-snapshot extts events were never reported -- a feature that
was never wired up, not a live interrupt storm.

So I'd like to keep this on net-next as a new feature rather than
retarget it to net.

Thanks,
Zxyan


