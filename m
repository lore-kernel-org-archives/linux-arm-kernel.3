Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6067EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SoN4/99QCeCPD/IFUUNrENS2wuoOQu8z5Qt527CEi1o=; b=GnbKho81iMG89INpx+HykGTRyc
	9m6ZPBwVnT/qeLoqvmuXQyY3zFZ82BnKeUFxkDHQGYq2l66kk68EEjrUNy2NSHIxDseLG7UYEq39/
	JaVkDQerMZUMMvx31plCn6Ab5dXBkk7XfSpq7SrJGnCWc8JsHzu/JkGR0fuk1FGHAgL/ry7ZswDRF
	FCoB9ksZpbQFVvycme/0eBKpqM2gcKcu5Q69NykXhv23sycFkwCSg0Bgg+gRWSk8xdP7RS8XYtH2B
	kuRfStbM8h4YjMqIzwke187FLk4mBOky7d/z3HjsjrsNNTjWOZs8YHQk69Qy5tZeJgfABnWkPXnKy
	5tWHAtCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z2x-0000000EZdQ-2qbn;
	Thu, 24 Apr 2025 16:03:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tzz-0000000DiNp-3ch4;
	Thu, 24 Apr 2025 10:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SoN4/99QCeCPD/IFUUNrENS2wuoOQu8z5Qt527CEi1o=; b=qJm6IcntFJa56EMTK7ygs7VJ10
	ve4C7GZvZk47A8hMaYkMc3WeG8xf1uB64AMqIlcOWtHv0LW+6SsRmmg83cXMOynE2rcWxgULhW434
	aV6OtZyRMK/sRVykLBvNmZbRBHaNSnZto33SH0+msELR7JJGfa7ETas8KQrAE+nw6to4ag2o3/yUK
	ReFoYQKzg8Dir/i4BrAiRDieJW4uRk4yPZwNmXVPHeNVaiPe6gAwuzqjzlmfjHMyzMO/V+aWtXX67
	YvNBeRFxKo89WOgDtZmj/ZBmNHwzhC+ObGoRsPp9WQDCHjl+riGwEtJ8y2oq8Wkogl9uxwB8hekc1
	2wH5MbWg==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tzx-0000000BkR0-0L0w;
	Thu, 24 Apr 2025 10:40:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-440668acbf3so1266255e9.0;
        Thu, 24 Apr 2025 03:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491203; x=1746096003; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SoN4/99QCeCPD/IFUUNrENS2wuoOQu8z5Qt527CEi1o=;
        b=jjawOh7ptTZT3yQ+NmpDivXGsDQ7lsXtZV9lnHIIdCGZKI/QgzFSiUCjG6NF0ukbUU
         5FnkWFnef0KqS2gy67Ak0BvPVJ7icURuaFA4ZRszj1tvwtFJL7x+C/oNpoNaLThaJyXz
         ZfjJYXESJnzHAjWYPvKDcDOHMXQYuzWsqrxo4aLKWGnfF5hn2Zn2lvfhu1TJDhrV6zr8
         pz9PB2wMDF090s81bj0AB9DtZV+ALvn2769fOHYibpu1crk8+WF7WBPIQexvFEOu9S34
         dxqa22ckpUAYzseJUnSapA4YM/IBBUYTsbhL16AMb2J1IifeysKe/+3zD7+ZutNd7pmt
         lgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491203; x=1746096003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoN4/99QCeCPD/IFUUNrENS2wuoOQu8z5Qt527CEi1o=;
        b=KRAFYOHyN0NJz8z6iHik6klVUdt5Aw/JJUPBls6q8GcsXUVHFEFY6J26v0OqFChwYy
         3Cz+GsbpksOT2NR+2/M9TCd9RGYilmFXvT3Vy1AUORFiXDNP7f11T/0Q6lrrGcMxFkpy
         xLnMWPM1kuPTrCmVka3eahHhVCjJYVYF8cSx2jtnuflchPuoUXIqk3QjDvGMKACuY+h8
         VAJVwz0vcD3LvPkNA5VSM9OB/DRnwy7R/+48h4RPkAuNYHAjnAa/L4/54pUnZr2i3N8s
         3cgQ3QS7JkPgNB+D9fcBtMVWPxcE0Wztmby/lw7Hy3kLV1Zv42ZT0K09d28fHiemtDPr
         uuLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+A2re4TDYrq82rYuBfgWN7xkre7gS3nKwai7ByGGXxoIK7yL0U3Kew9ItCrrcLgvSVDP4pAgWxv3a9kXvkHlx@lists.infradead.org, AJvYcCXVkAnFccZLUdbE/vJa6XtEsXrMjQ7jH0CtmEbKJ8vSfZvFScQDWYvjjV3InOC1UuaCiii8RdFYRLFee1QH1w8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVdUHkeXqVeaUJwng/EzsDTBbtszWzLvhih8sYwRTcCJwsKwOA
	9og4Qo99yxxVUoY/in2MPvIouLDEgYPZuJTLYJ8ythnrPQPBBnNY
X-Gm-Gg: ASbGncuMkvukgOajKZuLvAEm5J3bAiIlBA+H6/0ecxG4GjU8dsMs+AP98o7tq7xFwKf
	BYuuW3tHvYsrW7QWY2qsP0zY34GiYH+f+i68BOGAlUN6I8snutiEQSvjBRlN6z7CAPPPlKKfSzN
	Jq0vm/WR20qcdBJfI+YthMqpdhZXi+SUarlYXUttHNuFsoNvV4fbYkiqxnsJC5A4WdmmusvRdzR
	nmyMeSI36JOZcU7qLN8qUhBqleEdF1FFyjbvpciub1WQgtsxwUToU127Pj6HnAxxE9C2HA8RYuj
	XfEBlxd449s2GwGZNKjZ2s7GtHrL
X-Google-Smtp-Source: AGHT+IERnn6Lllt+pk1rksgyARdqZz/Xxbg52YA6wZMDe6rtFjjM8/E9kc1gFGW2aF+k041jBLFGpA==
X-Received: by 2002:a05:600c:3516:b0:440:58d1:7ec3 with SMTP id 5b1f17b1804b1-4409bda5fadmr6714175e9.6.1745491202872;
        Thu, 24 Apr 2025 03:40:02 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d0a7802sm49830355e9.1.2025.04.24.03.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:40:02 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:39:59 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>, Neal Yen <neal.yen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: dsa: mt7530: sync driver-specific behavior of
 MT7531 variants
Message-ID: <20250424103959.tifvhfhpsytqzxpf@skbuf>
References: <89ed7ec6d4fa0395ac53ad2809742bb1ce61ed12.1745290867.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89ed7ec6d4fa0395ac53ad2809742bb1ce61ed12.1745290867.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_114005_200422_6F02D323 
X-CRM114-Status: GOOD (  11.04  )
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

On Tue, Apr 22, 2025 at 04:10:20AM +0100, Daniel Golle wrote:
> MT7531 standalone and MMIO variants found in MT7988 and EN7581 share
> most basic properties. Despite that, assisted_learning_on_cpu_port and
> mtu_enforcement_ingress were only applied for MT7531 but not for MT7988
> or EN7581, causing the expected issues on MMIO devices.
> 
> Apply both settings equally also for MT7988 and EN7581 by moving both
> assignments form mt7531_setup() to mt7531_setup_common().
> 
> This fixes unwanted flooding of packets due to unknown unicast
> during DA lookup, as well as issues with heterogenous MTU settings.
> 
> Fixes: 7f54cc9772ce ("net: dsa: mt7530: split-off common parts from mt7531_setup")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

