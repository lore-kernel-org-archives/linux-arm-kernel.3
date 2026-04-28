Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C776FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gA47fGzFrwfbeRQhPiDfBesIkKjWe3OMqniZMXkZ4A=; b=ukf71GD3ch0s7yza4sGBacfIv2
	fIp/yIw5CviMlG5kRQ8vGbsEqLiw4RYhQVkRzDyV37B8bw6SXc92lkS6077f/dR0nOVIn9ItJd6Qk
	yIMhI6sZ2Rtxpvbkz/DcGNpjjnAoSN6xZqf1/u7VoDFvcwzO6OEE8wzUpfMxBHXlyD88w0b4CCNk+
	NezOdenVlW6kjUGPYKAbbKuwSbVYSztZL2uemHkkbDlzTKZUs0ukE9XDPEvdlcLw8l8Ijed4DEURj
	A/2+PpMUf6mJL8XaYbeqTDlpGGM0NIShe8JUHexUOssS2Oh26u2rQc6uz2+IHSUzVaEFevtR09Iab
	0WQWwQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfs3-00000001Bwy-3Ufb;
	Tue, 28 Apr 2026 10:40:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfs0-00000001Bwc-0Z2U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777372845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7gA47fGzFrwfbeRQhPiDfBesIkKjWe3OMqniZMXkZ4A=;
	b=L7FKjramA3TEn7UZwClLnVgL66TDxVGAK7AqUYQCLIt5eLxwSUN6Oz2zH9fFj+DvHPKHDz
	BsUFAkIaR/BPc51fuF3sUWHy4ElJ+L+ljMD5XVz6Fg/NQofLo5Z7DNLYNIxezrvOp0pHIe
	MagducDfb38dlg0cWdaJPXqG5CGBuxQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-EKE1XuVMNdu1QEuZUEGeDA-1; Tue, 28 Apr 2026 06:40:43 -0400
X-MC-Unique: EKE1XuVMNdu1QEuZUEGeDA-1
X-Mimecast-MFC-AGG-ID: EKE1XuVMNdu1QEuZUEGeDA_1777372843
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a5f6110c1cso264269406d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 03:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777372843; x=1777977643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gA47fGzFrwfbeRQhPiDfBesIkKjWe3OMqniZMXkZ4A=;
        b=nqO/R0HkHimsFbJD4Z220JY5QtYlD06KXiC4MUb2r5Iom/qvlAuqP5+cIAU4Eb3jdl
         18NKmOk1tvnHpZclkziq3kI2Yo+tQgkNeN1jDA4x57amG+HclNZ2VSBPHPjojpfdvSas
         PrpT6ZZFETC8/mdrk+yvG+O59IQ43i3D0aOnaE1JNvf2kZApHkBxtQH//B6yaMH3B3eB
         CZlA+oL9khzv+wHgPExuvid+JMG2EnHSA0jDEkdjsVPI1O7AuPMzSVFzt7izNNfrA+w4
         ohXCzUK2wDz1IeWf5c+xpzyhnX7tH/BWMjW5pCLAuaMwg8q70cJlyZgn4V+sMol7gbs3
         xDqA==
X-Forwarded-Encrypted: i=1; AFNElJ/ivAUyOcHQvDZ80CjwfkD6+UV4dQarugwKb0hDeB8HD45T3wCa7cFtjC+AZtPREHp2o6PP7x6GUDEA6H+6wqA/@lists.infradead.org
X-Gm-Message-State: AOJu0YxVPpMMHh7MeE2s7rv5FFCUH3zne7d5jyNzdjhtn3lnoLG7GoMt
	9goO8cAzBdlkqP+QTZl8XwoEgtrbCjn3dTAmSyJsSWF0roCrmjZe9i2x3tufK6d/5j42XP7edw+
	MjyUjED0BsOaJhboqPD9F0NPV/h19DrZsBPiFW+FQjrEigyiXq1cuQRikMeyH+VR7aqMIduotVC
	1P
X-Gm-Gg: AeBDietWQwwXWUVwYraP5Jfx7p6smrQ5iyFN5Wda3z/yMpifVX3hepWUZylcEv3fl/o
	2fSancIrsZcB3zM5Wt7GA1NofUZlRcuFy32oy0pevl+si1LwxvMk15jycBT9RhRJSuIx7Ddu1FP
	7+tzS+R1HgJcVHmNkOasXgtcwKq44xNVpMF/abt+c79NUnBThKQgQHuYsjoChq46t+aAprZfDDS
	oD2GSRbdjXhmDhHUWtbw0apRUvmCCWi9wvvzc6D/x/ZcH6i3giDaTAZpUVSTOX5Y/kPWMAAnSL/
	4N5HqJZ6q0KgSouaTGLSIZQcSzlPVIu6I7HpKF6v4gVgmNllsWP1ANYjrP7uW01L8YcGyc4vX6x
	ipwyMK/Dk59i0r7PyshOUJJdpX+iB2hGmQoh2rf3KceleE3L6bnwneTb5R2sFyU9aYw==
X-Received: by 2002:a05:6214:2404:b0:8ac:b677:c3fc with SMTP id 6a1803df08f44-8b3e31dd1f2mr40510586d6.51.1777372843254;
        Tue, 28 Apr 2026 03:40:43 -0700 (PDT)
X-Received: by 2002:a05:6214:2404:b0:8ac:b677:c3fc with SMTP id 6a1803df08f44-8b3e31dd1f2mr40510006d6.51.1777372842607;
        Tue, 28 Apr 2026 03:40:42 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.9.114])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3e2811b1fsm17395116d6.10.2026.04.28.03.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 03:40:42 -0700 (PDT)
Message-ID: <1db7e764-1485-422b-8b68-b45b18f492b2@redhat.com>
Date: Tue, 28 Apr 2026 12:40:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v6] net: stmmac: Prevent NULL deref when RX memory
 exhausted
To: Sam Edwards <cfsworks@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Baruch Siach <baruch@tkos.co.il>,
 Serge Semin <fancer.lancer@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Russell King <linux@armlinux.org.uk>
References: <20260422044503.5349-1-CFSworks@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260422044503.5349-1-CFSworks@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F7idogC8RspxrmpaO1lMz-HY3y_iaZSGsasPgckTCgg_1777372843
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_034048_272890_4B477BF0 
X-CRM114-Status: GOOD (  40.84  )
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

On 4/22/26 6:45 AM, Sam Edwards wrote:
> The CPU receives frames from the MAC through conventional DMA: the CPU
> allocates buffers for the MAC, then the MAC fills them and returns
> ownership to the CPU. For each hardware RX queue, the CPU and MAC
> coordinate through a shared ring array of DMA descriptors: one
> descriptor per DMA buffer. Each descriptor includes the buffer's
> physical address and a status flag ("OWN") indicating which side owns
> the buffer: OWN=0 for CPU, OWN=1 for MAC. The CPU is only allowed to set
> the flag and the MAC is only allowed to clear it, and both must move
> through the ring in sequence: thus the ring is used for both
> "submissions" and "completions."
> 
> In the stmmac driver, stmmac_rx() bookmarks its position in the ring
> with the `cur_rx` index. The main receive loop in that function checks
> for rx_descs[cur_rx].own=0, gives the corresponding buffer to the
> network stack (NULLing the pointer), and increments `cur_rx` modulo the
> ring size. After the loop exits, stmmac_rx_refill(), which bookmarks its
> position with `dirty_rx`, allocates fresh buffers and rearms the
> descriptors (setting OWN=1). If it fails any allocation, it simply stops
> early (leaving OWN=0) and will retry where it left off when next called.
> 
> This means descriptors have a three-stage lifecycle (terms my own):
> - `empty` (OWN=1, buffer valid)
> - `full` (OWN=0, buffer valid and populated)
> - `dirty` (OWN=0, buffer NULL)
> 
> But because stmmac_rx() only checks OWN, it confuses `full`/`dirty`. In
> the past (see 'Fixes:'), there was a bug where the loop could cycle
> `cur_rx` all the way back to the first descriptor it dirtied, resulting
> in a NULL dereference when mistaken for `full`. The aforementioned
> commit resolved that *specific* failure by capping the loop's iteration
> limit at `dma_rx_size - 1`, but this is only a partial fix: if the
> previous stmmac_rx_refill() didn't complete, then there are leftover
> `dirty` descriptors that the loop might encounter without needing to
> cycle fully around. The current code therefore panics (see 'Closes:')
> when stmmac_rx_refill() is memory-starved long enough for `cur_rx` to
> catch up to `dirty_rx`.
> 
> Fix this by explicitly checking, before advancing `cur_rx`, if the next
> entry is dirty; exit the loop if so. This prevents processing of the
> final, used descriptor until stmmac_rx_refill() succeeds, but
> fully prevents the `cur_rx == dirty_rx` ambiguity as the previous bugfix
> intended: so remove the clamp as well. Since stmmac_rx_zc() is a
> copy-paste-and-tweak of stmmac_rx() and the code structure is identical,
> any fix to stmmac_rx() will also need a corresponding fix for
> stmmac_rx_zc(). Therefore, apply the same check there.
> 
> In stmmac_rx() (not stmmac_rx_zc()), a related bug remains: after the
> MAC sets OWN=0 on the final descriptor, it will be unable to send any
> further DMA-complete IRQs until it's given more `empty` descriptors.
> Currently, the driver simply *hopes* that the next stmmac_rx_refill()
> succeeds, risking an indefinite stall of the receive process if not. But
> this is not a regression, so it can be addressed in a future change.
> 
> Fixes: b6cb4541853c7 ("net: stmmac: avoid rx queue overrun")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221010
> Cc: stable@vger.kernel.org
> Suggested-by: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Sam Edwards <CFSworks@gmail.com>
> ---
> 
> This is v6 of [1], which was itself split out of [2]. This patch prevents a
> NULL dereference in the stmmac receive path, and (at Russell's suggestion) in
> the zero-copy path as well.
> 
> The approach is different from the previous version and checks the dirty_rx
> index in the loop proper, copied directly from Russell's suggestion [3]. Parts
> of the commit message also use his phrasing. For these reasons he is credited
> with `Suggested-by`.
> 
> The commit message now acknowledges the pipeline stall that can occur in case
> of failure of the next stmmac_rx_refill() after the MAC consumes the final
> descriptor. I still intend to fix that bug when I can find the time to finish
> investigating and implement the timer as requested by Jakub, however I'm
> sending this patch now to resolve the outright _panic_ and simplify review.
> The stmmac_rx_zc() path is not affected by this stall.
> 
> [1] https://lore.kernel.org/netdev/20260415023947.7627-1-CFSworks@gmail.com/
> [2] https://lore.kernel.org/netdev/20260401041929.12392-1-CFSworks@gmail.com/
> [3] https://lore.kernel.org/netdev/ad-LAB08-_rpmMzK@shell.armlinux.org.uk/
> 
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ca68248dbc78..3591755ea30b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5549,9 +5549,12 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
>  			break;
>  
>  		/* Prefetch the next RX descriptor */
> -		rx_q->cur_rx = STMMAC_NEXT_ENTRY(rx_q->cur_rx,
> -						priv->dma_conf.dma_rx_size);
> -		next_entry = rx_q->cur_rx;
> +		next_entry = STMMAC_NEXT_ENTRY(rx_q->cur_rx,
> +					       priv->dma_conf.dma_rx_size);
> +		if (unlikely(next_entry == rx_q->dirty_rx))
> +			break;

Sashiko notes that breaking the loop of DMA descriptors owned by the CPU
may cause double accounting for the ingress stats by stmmac_rx_status().

AFAICS that is not a regression, as the existing later XDP check already
does the same, so I think that problem should be addressed separately.

/P


