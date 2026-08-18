Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24D0C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 01:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfkLuSdmwN1ckqZLOyJ0ADFIrM3kNuRenkgg7slseYo=; b=vLlNpY0n2Jww4mFOndXyHsJQEi
	hujB2blzXb5t9Ornri3nYEM+/3Qmzr5IoAyHCEj1BJpOBhAl95UjNJQxlbQyFZtrT/APHfDaHI6G0
	9UEy0H/1n7xlPLZBRUxTKkqU0/hFFXAmPlNRKcqPdzqKz0sateBNnoU7jEN3TzMrqultWx0BNBv59
	ZU/Y43vh13JtM0UFuafzb55rv5zVyfn1SNEqzQ3V99vR4NPlPrYgQOqt3ieIV1pcaU8tQW4lT/Edi
	sX8BHpF1lRk59zPY+6IdbPPilRJJ9s5gb2NRUFvY/WW/aOyoaNTGh3nY9x7M6PeUHjYNhlLW/jZVG
	JtEGUwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww8UK-000000073Fv-16nr;
	Tue, 18 Aug 2026 01:19:36 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww8UH-000000073FC-1Ab8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 01:19:34 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84847482584so378592b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 18:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787015972; x=1787620772; darn=lists.infradead.org;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfkLuSdmwN1ckqZLOyJ0ADFIrM3kNuRenkgg7slseYo=;
        b=MOXmeJV0igmKdukikiDrKgo+0qX/0MCZkIbwD2rxxdBA1A8Wl+7lySvtmJZCmFjj+8
         +wSmyJOFL6s/RYBWUn2ITjwxhJUxJo73wNJc/uRKI7XwipzHkLZm5oa8+80wf4CO3Gbe
         sG5ACzyRi90/rRoR3fxsFSUN/PyCqwjpfZap4nybaDjRn2On3xI+BT2GieElF0HXuR/b
         D3N+AjR7J/XWdDuVVr99qJsBXOthFJhtAf/O7ElCa6pwPujxm28bXab1GOEU8pRvEk5N
         Md85uKD8VImilEYKGzti8CEA9JtaN9KlUNHDpO8pOJL82QFRbw4f3VftUKDZJdJH2Cuq
         rKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787015972; x=1787620772;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mfkLuSdmwN1ckqZLOyJ0ADFIrM3kNuRenkgg7slseYo=;
        b=s2cL1xPoRxrOwzfvGTsS7vIsh2HCjyyoNpJ3KYbts80OrPNS4NMafKNDjsAnzoiSWR
         0Skwo/lf0xJK6rJg/oJyCPKRg7Y1jfHQq24egk6E/Cr2dOK3g07tzPEBLrrtRP+NQOh6
         /Av/WdQn5AO8OkczNPyRR3+zYm6ra6aL5czAqY1OsLYi3dLlbObZ20qyYBtK48Wh3sEh
         UEoptKoAvvFzB8bPsas9yBIoWDXY+ddZQGGd996vJoev6VWtnTMQ18ZAvZjXN1U8VO+y
         FvxiZ8r/39nMmzItIzQdmLwz/evWXQQbtKhphNGgKqq/mormeK9blZPVSIYHEcW/1uoO
         I9GA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/xP04oybZSYffwC2GHREJrFgQGYgVHJxLeUmItlSAWBkPWcSI3J0RS/JIA315EZnuUpvkXlGkeMN616nbsXpV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7GX9xWRW5itOx+9uDHtjAApLzQqDa73mZBQtoVjh0edXkrCsv
	Gqt0oH0H+YglU1+bn0v5NJ6gFqAH7NRE+ktgo/y9fyqPpIFfC0YV4UUa
X-Gm-Gg: AR+sD11JeN/aj45aCb+5V0OSupF/LH4cL4ob3T2g9eKzAlIBQFl2Z1p/kaBVdlAAxBo
	8+5aEUWCGSVL2RCFSETKGHPvBRW1Q9RrWy/NiBIgOAn7L1ptxl6WT05ac3hO2uTP/j4i7s05UEK
	vl1yqnIqRuQSN49nsXS93RzFJF7yOsnD7ITBsgx0gBOrAIUVwHkmsOlCY3McR/0XHu3LKXcbPBj
	TJQIEyV5x7f3MIn3beLQJ29KfK9f+KpunKtfxiu6ivbitW5zA5VI4qBlG9fAGTBdYxhcjsGD1ew
	s0Tl47Zm4oC67/JLF5QJvL/ccPK/yt82UcIuYzcyolBmYnbmH4O96hZQT8Sa9oT0gKwUMRmYzJ/
	2M6Lhgvy53zFxWgHLbbgak3r3fUO7sCxVPOUySD+Xzj+QzTh5ztpn9Zm5HufLcGR6G4CkvQH5JW
	MBFGiyf7Im+8Z3iW0wCi4B2N3VqkVDl+TVydjTP30IKOI/eDBe/zfGxA==
X-Received: by 2002:a05:6a00:ba8e:b0:848:52bf:4296 with SMTP id d2e1a72fcca58-851bc3ccf5fmr2527196b3a.15.1787015972070;
        Mon, 17 Aug 2026 18:19:32 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b3d1099esm1196713b3a.0.2026.08.17.18.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:19:31 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v20 04/10] mfd: an8855: Add support for Airoha AN8855 Switch
Date: Tue, 18 Aug 2026 09:19:25 +0800
Message-ID: <178701596581.1096543.14003915779643840966@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
In-Reply-To: <20260817082034.20326-6-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com> <20260817082034.20326-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_181933_326812_ECF3C8F3 
X-CRM114-Status: GOOD (  12.20  )
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

Hi Christian,

I noticed a possible MDIO bus locking issue in
an8855_core_probe().

The helper an8855_mii_set_page() is declared as:

static int an8855_mii_set_page(struct an8855_core_priv *priv,
                               u8 addr, u8 page)
        __must_hold(&priv->bus->mdio_lock)

and uses __mdiobus_write(). The latter requires the caller to hold
bus->mdio_lock and checks this with lockdep_assert_held_once().

The other callers of an8855_mii_set_page() correctly hold the MDIO bus
lock, for example:

        mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
        ret = an8855_mii_set_page(priv, addr, page);
        ...
        mutex_unlock(&bus->mdio_lock);

However, an8855_core_probe() calls the same helper directly:

        ret = an8855_mii_set_page(priv, priv->switch_addr,
                                  AN8855_PHY_PAGE_STANDARD);

The MDIO device probe path does not hold bus->mdio_lock around the
driver's probe callback. Therefore this call can trigger the lockdep
assertion, and the MDIO page-select write is not protected by the MDIO
bus lock against concurrent accesses to the same bus.

Could this be changed to take the bus lock around the call, for example:

        mutex_lock(&priv->bus->mdio_lock);
        ret = an8855_mii_set_page(priv, priv->switch_addr,
                                  AN8855_PHY_PAGE_STANDARD);
        mutex_unlock(&priv->bus->mdio_lock);
        if (ret)
                return ret;

Alternatively, if there is a reason why the probe path is serialized by
another mechanism, it would be useful to document that assumption and
annotate the call accordingly.

I don't think changing an8855_mii_set_page() to use mdiobus_write() would
be appropriate, since the helper is also called by paths that already
hold mdio_lock; that could result in recursive locking. Keeping the
helper as an unlocked MDIO primitive with an explicit locking contract
seems reasonable, but the probe caller appears to need the missing lock.

This is a discussion and fix suggestion rather than a request to redesign
the series. Please let me know if I am missing an existing serialization
guarantee in the MDIO device probe path.

Thanks,
Wayen


