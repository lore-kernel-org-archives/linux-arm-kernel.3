Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530BDCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ss7g9OPGrAkY9kUcGCclPiLcw52MVKuR0CuNg2oTpdY=; b=nrW2hUGqp9q7X7nI1yR1hFPM6s
	4aQlwcM+UntodqgyagbDmzuXoboQhK6Gx/Ok2VaRjFDtFPsr43SSbxXqHUmJufrmiPGwKW2RZYNrD
	gEST/pGj9QbAgRkGPIJbJtQgsQJItwEUIotlT/2wEpgS6aBZE60FfOA+bpfZFq5Vh43RgOOlfny1A
	zEXd2z9buGwGnMnyuLRdqCMqESXh20SNATxYcbuUi8qub+YyLDKBdWKIb2hJEeJ960xEXgWO9RrjB
	IG84jHbcB3adgfJUUn4r9k/oQkhlre5A8ZnQ34QF27De3V1PvRdin/y7INWyrUKfECUPsZq1PyEGI
	4dXvGS1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhOp-0000000Fo2O-3aVb;
	Tue, 28 Oct 2025 10:57:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhOm-0000000Fo1Y-2lI8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761649074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ss7g9OPGrAkY9kUcGCclPiLcw52MVKuR0CuNg2oTpdY=;
	b=V/rwW+GYupNQnEUEF+UQdK99K+xWqvSST3cYLpdiJ56RaB5Zobn+wfg3O7ghR46t9kfiLA
	XfjKCaS4bgo/v9FH9sOQawa6THDxBFXXrNm/ruimB9iVa57rmNJdCWPjr+I6PAab1p3Wkk
	TcxIztfiV7mrFMmg1DaJ/h6Dd6JtoXQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-qLJ0R-DPO1KjgCCfQYWLdg-1; Tue, 28 Oct 2025 06:57:52 -0400
X-MC-Unique: qLJ0R-DPO1KjgCCfQYWLdg-1
X-Mimecast-MFC-AGG-ID: qLJ0R-DPO1KjgCCfQYWLdg_1761649071
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-475dc22db7eso30619315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 03:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761649071; x=1762253871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ss7g9OPGrAkY9kUcGCclPiLcw52MVKuR0CuNg2oTpdY=;
        b=G4Raev53sRZ47LDpjadCevd5BgOUkmV9IwkrL9VY2mkF7Y7qnK3RsFX4KqZdGqxPBd
         arJtoY1SxV31+rmvs+tUlMi/CQWRmlu8kgR8opkzNWTKgTU2uzgd0Tzltll6A/2OEXrF
         N7IcouPRIf+mTMcOK9Wmwr1A0ovrnoyrLgGteifGSdzabM+zF/rxrjT2hE9YfC12wNlA
         JVtD5EFRDgdMvvly3LldTjJeMb6hLhS8ygPs5Z0dtyJRPNAlUmqeDcHcf2cmyuzdKiyU
         hReXub2eaWnj4SwKCQ4i+x+i2eid1Fko4rQDaqQuEHFqiYgKluDgxDRQ0raJ92MaZSVB
         pktg==
X-Forwarded-Encrypted: i=1; AJvYcCUbTWjsMesYqy09nYLBgGqvimOEA6/uEYkAwLbxPgIvtRnDPUxKqwLeVW0jE/FPbUtMhQNcUdKh8TeGG2xWF0l1@lists.infradead.org
X-Gm-Message-State: AOJu0YzuebMeEMuQjj1mw+cZx0ruPe1kf9NCof+DBhZf5MjlFvM98EXT
	Xg+lhxB2J+81kVfdO/jpYIJDde9UENr93RaDv2RA4AXc7qWlsCB7hnqgJ7jz3zYAbyutYJ5gPax
	Ox8AIfYLEEbLKVluTWWH68XYW1P7MvdFsUuN+ZlxkWiGpMz/YzGc93VzCJDkzdI24ZudwJIW3ng
	8v
X-Gm-Gg: ASbGncuNkSBqUwa0/fKTfLZuW85kuUdzLQiB0m/qVl7zw4hGnXPoL6XemAghLHkUaMo
	fVvQlm8cOaaAIPudNnA8izPfdpTdtBjijaYz8Sep9BK9zQPzY6ljxRcmrg/nrYpM0ZB77dl7opx
	nzjc2eKIdOfU1hbzS+/s2N6rtT2pG23R27tXfPL3VrFFPXcCDRrP5NDqw++0SdagTATDpavBw2Y
	RfegYs8vaBd3YXzyPV+sRBBoeDLNXK70YDXxOuWh/uk7vo/sGdYdORfEkSTXgz0UPmeHOdP2jsl
	Ny4l7DfrkeiXYpUa5Zm2kEWbOJTHnS1yrP6swk9KOtxS9EFKg1AFgvyKG665TH66htg4bf4/MqS
	g/a3kvU000AQ3cpvRBhqyoSSwf/znJuNpyaPKH5rFr9Q/Z30=
X-Received: by 2002:a05:600c:34c7:b0:475:e067:f23d with SMTP id 5b1f17b1804b1-47717e30340mr24822455e9.25.1761649071067;
        Tue, 28 Oct 2025 03:57:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErU20c2eSasDdwQZzdlRNWvVKDbbva3lmpIExHrHtMT8SPwj/9JiHFRH8lMSjet+8CB83SCA==
X-Received: by 2002:a05:600c:34c7:b0:475:e067:f23d with SMTP id 5b1f17b1804b1-47717e30340mr24821915e9.25.1761649070539;
        Tue, 28 Oct 2025 03:57:50 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47853csm191118005e9.13.2025.10.28.03.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 03:57:50 -0700 (PDT)
Message-ID: <05efdc9a-8704-476e-8179-1a9fc0ada749@redhat.com>
Date: Tue, 28 Oct 2025 11:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/6] net: ti: icssg-prueth: Add XSK pool
 helpers
To: Meghana Malladi <m-malladi@ti.com>, horms@kernel.org,
 namcao@linutronix.de, vadim.fedorenko@linux.dev, jacob.e.keller@intel.com,
 christian.koenig@amd.com, sumit.semwal@linaro.org, sdf@fomichev.me,
 john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
 ast@kernel.org, kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 andrew+netdev@lunn.ch
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>,
 danishanwar@ti.com
References: <20251023093927.1878411-1-m-malladi@ti.com>
 <20251023093927.1878411-3-m-malladi@ti.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251023093927.1878411-3-m-malladi@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8foZ-g3vByXHP2l-LSVfcwU1TIybtfFor6T-3Yp6v7I_1761649071
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_035756_798444_EFF13F0C 
X-CRM114-Status: GOOD (  13.67  )
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

On 10/23/25 11:39 AM, Meghana Malladi wrote:
> @@ -1200,6 +1218,109 @@ static int emac_xdp_setup(struct prueth_emac *emac, struct netdev_bpf *bpf)
>  	return 0;
>  }
>  
> +static int prueth_xsk_pool_enable(struct prueth_emac *emac,
> +				  struct xsk_buff_pool *pool, u16 queue_id)
> +{
> +	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
> +	u32 frame_size;
> +	int ret;
> +
> +	if (queue_id >= PRUETH_MAX_RX_FLOWS ||
> +	    queue_id >= emac->tx_ch_num) {
> +		netdev_err(emac->ndev, "Invalid XSK queue ID %d\n", queue_id);
> +		return -EINVAL;
> +	}
> +
> +	frame_size = xsk_pool_get_rx_frame_size(pool);
> +	if (frame_size < PRUETH_MAX_PKT_SIZE)
> +		return -EOPNOTSUPP;
> +
> +	ret = xsk_pool_dma_map(pool, rx_chn->dma_dev, PRUETH_RX_DMA_ATTR);
> +	if (ret) {
> +		netdev_err(emac->ndev, "Failed to map XSK pool: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (netif_running(emac->ndev)) {
> +		/* stop packets from wire for graceful teardown */
> +		ret = icssg_set_port_state(emac, ICSSG_EMAC_PORT_DISABLE);
> +		if (ret)
> +			return ret;
> +		prueth_destroy_rxq(emac);
> +	}
> +
> +	emac->xsk_qid = queue_id;
> +	prueth_set_xsk_pool(emac, queue_id);
> +
> +	if (netif_running(emac->ndev)) {
> +		ret = prueth_create_rxq(emac);

It looks like this falls short of Jakub's request on v2:

https://lore.kernel.org/netdev/20250903174847.5d8d1c9f@kernel.org/

about not freeing the rx queue for reconfig.

I think you should:
- stop the H/W from processing incoming packets,
- spool all the pending packets
- attach/detach the xsk_pool
- refill the ring
- re-enable the H/W

/P


