Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32F2C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 13:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVQCgol4pHEYkXFyhqCJGDpWyHh5mZNVIqJzWtQqDZ4=; b=d3WD4jXgsIm/N4yjGIcQYJWADL
	3d+eDpZBLiFPRxza7v4XG2DHsr1IAtT80VjdUoJxpBp/AlRy3CFS2E//7aBTTSoSUJsBzZF5j2PCO
	i2SNoUe0wmVVwTwJEs22h7dOxoJfAsoDzVaR+kKREGechUsRWG/7qE6l2cZT0BGVX8n//EU9xVhcY
	vjY7bG3hZs/vG8OiQWWXYecYHpwAhCYzhG0cu6xDpSeQLf8TG69nE8sLb8HceIL9u9JuB4ND7dTa2
	YBJqeJ6EZKpwUpgH1I0E+nTstDxBTWE/AIg2AbN0Y/neuLV/1WX5BpufqJJe4zXFYtsxUkcnHz2wU
	BGg67BLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCf7L-0000000FcTS-1tJ5;
	Wed, 07 May 2025 13:47:23 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeju-0000000FYl2-3OYY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:23:12 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6f5499c21bbso2134776d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746624189; x=1747228989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVQCgol4pHEYkXFyhqCJGDpWyHh5mZNVIqJzWtQqDZ4=;
        b=jvQ9lfw1KHJ2elq4zI3byjUCSGvXpos1KpfkML09h7pnsd/YiWq8ZcY3AFGAZ1YnuQ
         VNH8ZJi7XYNujJgr2CKcNGUSZpApvepy/AgzuRgyYGHlc3gKT0Q9iIQb8jzR78IHlAH5
         oXN/GGeoqKau5SqTkE+nPcJKmibU8PMdMMrKK5bQg0+ioaCrRf15SsJ1qbcWGYw8DPcJ
         3v3d4Wn3pVcMRu12ETcclrZt3Y8E77aI9Q5M9bkcoDRkwFmP37zpEQk5TUXTUe1MtcWg
         BrWiCsPI/UIqxrHFfyCk86CrlpXkMZYN+M/jkuC0vUwc13fNm/3tfHYbOlOQAcDEaYaO
         HMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746624189; x=1747228989;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rVQCgol4pHEYkXFyhqCJGDpWyHh5mZNVIqJzWtQqDZ4=;
        b=X2H3H5DvMKkgUpB0/xXXFgPCPAWcNtc103A1BxkA/j/J48IllLZDrGb1dcexz3ruEa
         4Sop0TihD8il6LwFb8apU02f6x5LKTKMnflbPMko/lmx2dQ1l+UDycpa2wZV0M/5x6mk
         SeFiDj6YAR6w4+aj0BgvOHKQ1vnwQW8QzsFeG1l3Z8IBkUBwp1mthV+PRRl2tdNEJomB
         Xqfc5YRA7T8xCYR7ms/370q+A5vfGvrRN5RnE/xmrrB2eLjaJaQAdZlzV9XmPPCNGIO0
         P6wUecE98ASWHerNhpUQMvVTCNHm3GxeKng/TFGrErEwLIdgC4ceCMdzbWsAcjD2VuuF
         hMjQ==
X-Gm-Message-State: AOJu0YxWbrpEWLMr0V/O4wY06lZPCmvCFBPKm4SXSWR12nP5UzgZH2+8
	0zVPtHvtRsvnDRe4xboX+A4GVU7GoLmWB5HjfcltsyBopxvyibwq
X-Gm-Gg: ASbGnctcUPlaVHayw44xQzFhLEGMKkUq4OuCDGUpzr79gIjP66KwLWTAfX6Gcqm4SBZ
	Wtwt18Edc0b0OCpy06+vpirbr4Q0z/JBo7mYPAGO85TCCBcCFHEPsPjFP9R9LLol4/U/UMrdJDr
	EbmIeO6xzEF6RUZamGhlVthdDpn9WMbbhWVb4a3sVXQ4NZ1cWZxnOLjYRd7ox1IsMZpMnRDsDUj
	HlS/QPFvIFMJEujsb0WXcW6mcbuUvzrwcdYrC2iQr+XssDdLITMaYfEbPThox4zBMGkmhSFt3Fw
	paCqFhqXQZMx49f1sdvDlE5W5cE+Pj6/RuDOyl/iv3b8K9Rm4aZLW/yDT2YOTKs2COJbrPpLXH1
	DtE72jbVF9m8qjaCoaRMC
X-Google-Smtp-Source: AGHT+IGw9zFvQzhsnQJx2KylHinzZ1CicUi3HmuYemzfpRLT6lEp99L4vAVhTeNIaVwipM6aKEmGYg==
X-Received: by 2002:a05:6214:226d:b0:6f2:b0a7:3982 with SMTP id 6a1803df08f44-6f542acc44fmr53423916d6.37.1746624189303;
        Wed, 07 May 2025 06:23:09 -0700 (PDT)
Received: from localhost (141.139.145.34.bc.googleusercontent.com. [34.145.139.141])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f5426238c2sm14081686d6.21.2025.05.07.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:23:08 -0700 (PDT)
Date: Wed, 07 May 2025 09:23:08 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 sgoutham@marvell.com, 
 andrew+netdev@lunn.ch, 
 willemb@google.com
Cc: linux-arm-kernel@lists.infradead.org, 
 netdev@vger.kernel.org, 
 Jason Xing <kernelxing@tencent.com>
Message-ID: <681b5ebc80a81_1e440629460@willemb.c.googlers.com.notmuch>
In-Reply-To: <20250507030804.70273-1-kerneljasonxing@gmail.com>
References: <20250507030804.70273-1-kerneljasonxing@gmail.com>
Subject: Re: [PATCH net-next] net: thunder: make tx software timestamp
 independent
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_062310_849925_350752B6 
X-CRM114-Status: GOOD (  21.21  )
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

Jason Xing wrote:
> From: Jason Xing <kernelxing@tencent.com>
> 
> skb_tx_timestamp() is used for tx software timestamp enabled by
> SOF_TIMESTAMPING_TX_SOFTWARE while SKBTX_HW_TSTAMP is controlled by
> SOF_TIMESTAMPING_TX_HARDWARE. As it clearly shows they are different
> timestamps in two dimensions, this patch makes the software one
> standalone.
> 
> Signed-off-by: Jason Xing <kernelxing@tencent.com>
> ---
>  drivers/net/ethernet/cavium/thunder/nicvf_queues.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> index 06397cc8bb36..d368f381b6de 100644
> --- a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> +++ b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
> @@ -1389,11 +1389,11 @@ nicvf_sq_add_hdr_subdesc(struct nicvf *nic, struct snd_queue *sq, int qentry,
>  		this_cpu_inc(nic->pnicvf->drv_stats->tx_tso);
>  	}
>  
> +	skb_tx_timestamp(skb);
> +
>  	/* Check if timestamp is requested */

Nit: check if hw timestamp is requested.

> -	if (!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP)) {
> -		skb_tx_timestamp(skb);
> +	if (!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP))
>  		return;
> -	}

The SO_TIMESTAMPING behavior around both software and hardware
timestamps is a bit odd.

Unless SOF_TIMESTAMPING_OPT_TX_SWHW is set, by default a driver will
only return software if no hardware timestamp is also requested.

Through the following in __skb_tstamp_tx

        if (!hwtstamps && !(tsflags & SOF_TIMESTAMPING_OPT_TX_SWHW) &&
            skb_shinfo(orig_skb)->tx_flags & SKBTX_IN_PROGRESS)
                return;

There really is no good reason to have this dependency. But it is
historical and all drivers should implement the same behavior.

This automatically happens if the software timestamp request
skb_tx_timestamp is called after the hardware timestamp request
is configured, i.e., after SKBTX_IN_PROGRESS is set. That usually
happens because the software timestamp is requests as close to kicking
the doorbell as possible.

In this driver, that would be not in nicvf_sq_add_hdr_subdesc, but
just before calling nicvf_sq_doorbell. Unfortunately, there are two
callers, TSO and non-TSO.

>  
>  	/* Tx timestamping not supported along with TSO, so ignore request */
>  	if (skb_shinfo(skb)->gso_size)
> -- 
> 2.43.5
> 



