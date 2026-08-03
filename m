Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF7DC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oz+46xoU5Ps+EiowJN5fDiWs3w3cNh/2x67ul7cY68U=; b=glgS60XJg5jbw/Bn6n+/JlOYPU
	6yVVmXiVAhNhVBH9EQ8hAxjQlLZvnHYBxpVbuY1Ca0V+X94jehZWiX7JF2FK2SSwfI8ZAEg5ljkoh
	Qt02m50qZJaJEQNXwN0Wrt5F+uVx476SVXtLZjLlNtOJspzb5wfhtWMf+JXchodg11f439SQbSxL1
	oV3IhwGzC3TMdu73H7i8PD7fYYicxH6PnREXPxL+G6n3OLbRYpuCd0Fq+ueVQ3CTRoRFiGC74epgq
	dtbzMbuygETOy+LRCX9jWAXlqO1xnBebATxHYTatMJ51PYFF/yeaNRip2SUV4cY22sR1u/F7eEuNT
	LmsB1XJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtmv-0000000HP9G-3ck7;
	Mon, 03 Aug 2026 14:37:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtmt-0000000HP8E-1rpY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785767826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oz+46xoU5Ps+EiowJN5fDiWs3w3cNh/2x67ul7cY68U=;
	b=GWPTgQza/FGzpBYrl55xvJCgfkAQJYJLHQxLioH/iqGZ/QymGKUFzz4Ypknz7hjv61Qgay
	8/gTTqNCg20WZT6/hqlcmu0sAtJ6Kwlya1BZLq0e/fErLppi76WGc1dWnN4ks/C0DI6xU2
	wJtt+PI8glyEooB0NXdFGxDygZiHVg0=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-nnEQzfnON2Km15oAep_ZYw-1; Mon, 03 Aug 2026 10:37:04 -0400
X-MC-Unique: nnEQzfnON2Km15oAep_ZYw-1
X-Mimecast-MFC-AGG-ID: nnEQzfnON2Km15oAep_ZYw_1785767824
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e92ddc199so118107457b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767824; x=1786372624;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oz+46xoU5Ps+EiowJN5fDiWs3w3cNh/2x67ul7cY68U=;
        b=HjK/UOih2/bMvvOxMyT74KJ4MPO0FOrsK51ppfiJXqPPY8Lp5UtEsXLFwVTpb1LzI4
         StKVwNQuBbc24gJG+oewqW68L+f1++snDfoLiHsrv8K1Y2LnhT5gNZZ+6K4rp+HZGwKS
         +7g/G+pIHWvJzFb47SZ5Ii1ON0E+sbSvVr//PyA+gTbTeDIa3vxlUw+S7CoD4uSc0GL4
         QzfRivQYE9V/XSQbFJJH36Y9tvl17xFJven7PN30TWS8agbgiL7w7HRgLorQT6Az1wiA
         miBUUyZ5qgwEvBfHpErR3bNCiKlqMZdGkqs32CHz+trq2O4MinzTcgLNHPEM1W4Sbh9n
         j/fQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/493A4Na06iWmox+F6UdIT3b6EsrFkTA27DpqSiAe5BPmUlQ9xTLu7eic0Al+BvjTrAPtuswMOuZROeHOSw8r@lists.infradead.org
X-Gm-Message-State: AOJu0YwaA8EPmh0WWbUMfSPvshfSRVLlyO9ijAQSFem859uSeGUqBKCc
	YS0ns9615RaCOFhxwjlNVyhAhnW4+K/DXUal7eLVkPbYfutKvevigKOK34hiNtXKExoB9W8jTQL
	qkFzwKNeRlfJ1+MLfyfW56Qu2+sch4Fa89O2v41t1NO0KSoi4UkLgbxiCRgL57UpiFFALVf5rqg
	/g
X-Gm-Gg: AR+sD13RthOWg5VqvYSQGTkXxkdUW0E/F+sP1nrJ0YusduVyn0GrmidyclK2wlXsUy1
	J6r2ZjVW+jT+fTw7/9zGg3fHiVe5/0Fx5uTB2K0Blgi7+wU400Vy5DPe0Ruxp6iByQxfvLckAD5
	00rAbJRqu7ELvY84vjGZUT+Dz4HS5Hgun5DlV2blAxHM+suABsjTLHzdenLls0TVpLUcZMZtGRV
	8HxhZoaJgbPJvuF1q5xZDvwuAqynq5sw2yP7/SBfEPa/Dj41zq0TOhoJUyo3hbPDhg8eYDTPjte
	tieO3A836MiEyIAhAlxK5lSH9BjI6l+A+psUjnKoOX/CojbfYQkmBkCygA9LkGnZcisy+LRxY/d
	suuQgbWI3Yvps/jvGi/ASvMCevFcbAzmNAB0=
X-Received: by 2002:a05:690c:4d83:b0:80b:9f4e:a70 with SMTP id 00721157ae682-81fd4ba6936mr134850387b3.26.1785767824034;
        Mon, 03 Aug 2026 07:37:04 -0700 (PDT)
X-Received: by 2002:a05:690c:4d83:b0:80b:9f4e:a70 with SMTP id 00721157ae682-81fd4ba6936mr134850157b3.26.1785767823526;
        Mon, 03 Aug 2026 07:37:03 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d70besm54676927b3.31.2026.08.03.07.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:37:02 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:37:00 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 10/25] clk: mediatek: pll: Add BAR reset register
 offsets
Message-ID: <anCnjHectpXOqQku@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-10-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-10-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 641YN-Ol7uN7Y1f0NYjqmbEyrVjl0vfvSMFbu9Lwaag_1785767824
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_073707_558973_910FE06D 
X-CRM114-Status: GOOD (  14.34  )
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

On Sat, Aug 01, 2026 at 01:20:56PM +0200, Louis-Alexis Eyraud wrote:
> Currently, the register offset to handle BAR reset, for PLLs that
> support it, is hardcoded to CON0.
> On MT8189 SoC, there are separate status, set and clr registers to
> handle this, so differents offsets are needed.
> 
> Add the new fields for offsets and addresses to the MTK PLL data
> structure and modify mtk_clk_register_pll_ops function to compute the
> new register addresses so they are available for clock operation usage.
> 
> Also, replace reset BAR address computing by its computed address
> from MTK PLL data structure in prepare/unprepare callbacks.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


