Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F791E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 16:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QFpAwlhscCSDaqV4J6CvbYoGhHQAUaA0Ln+PXMaf8A=; b=fCh1LZ7/oJdm9Os33uoCR/C9IX
	lA2mo6isSLA4lvsRLIOW/7JeNxkqIB3rSUOXumGg/c8cf+VHlS3w5ogVOz8uuNsJk6XKKkj/XX6m+
	+KZxiKQX/PAB0Vj0COTxvJyND9LXLV7sqqARvAlH6kfWSipX4MzQjQJkgR6kjEsj4ezSNu9kN1yHH
	43eIJaq/3wKu/C80/kyURNnaNG18fTUGrdM0/s6P+sYRvjXTwDdP0PT8rGGHBwksSPh0AGrEKw5Cl
	ws5/KwTOKQNR+jZCyVpuJNayCmnSlDG29XLZKCYnCdkvJ6P6MVXV2DW27gTKB5FC4wKteyZQxjk6u
	UNK4dVPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWeTX-000000015Qx-2eYj;
	Sat, 11 Jan 2025 16:36:39 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWeSJ-0000000159j-16EL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 16:35:24 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2166f1e589cso61939575ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jan 2025 08:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736613322; x=1737218122; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3QFpAwlhscCSDaqV4J6CvbYoGhHQAUaA0Ln+PXMaf8A=;
        b=NrGYuflMXdt89LxG/jKfa91U3naT4Wm8QrCdW7winDZ33nUt5NQoTE/aOpuwVaOC+F
         fLPBR7SoIWdYPX8T9vgZdm4R41sfD2/LAG8pYMeu/Bxt2efTlJqqaQqJDUICZzJhcG8E
         DWYDAzhvJolYaJ0VBFGvELjwC0AiWqQjJW/JbTG1x9iSoVC4JDi/CLUQ2UwQFUjMizE9
         w5qEGF0NqA/AhIgHhVKhNZ/4WW95VXbyI505rRyuxG0W0EyhVYHjfkRJy3Un2XuwWTW7
         pV4CKDyYSimnr5XlLtaXeEs4m1KUPqd3MiRNws7ZqVDDbc3rj1L2/Mt7WhS1M5CQE0bC
         E0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736613322; x=1737218122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QFpAwlhscCSDaqV4J6CvbYoGhHQAUaA0Ln+PXMaf8A=;
        b=Oou5rBLWppxVkZic4dzJkb3EMIObH6wnaEZwMNc0fePvRocDrucphFbyNfgLY+N/LU
         7FYfi/F/uiIgL18Mx2KsLtEzeEK+sTAQCyhCpLbAWJc45U9PKbcHNPWHPVui+J6vXM89
         MKOoM+YyU+pHqxnyRJRsepZ8mWlYKtTNXBKtwZS8BrM82ujeSzgmKmW4lTExJtVX+Iae
         FnBl/TP5kil1t39a9lpGPzbPe39chj0hUBAflLoZ9E4ny4jBVpkMMhe2gaM9ajQ+X+99
         gXhr+6dxissVVlKt8rJWdc6lqFJCxYdqWxKj9TpBIGfCgDZnhOc5fQqwwhGX+wbPapXr
         fWXg==
X-Forwarded-Encrypted: i=1; AJvYcCU8DJajBrarbOXzUVj/ztuYzNU97qiQjzLV+cbBvETh5UwKULYhCxOkCY9f8ufxpZYA7XmuzoaoIqTXsGNxwvbo@lists.infradead.org
X-Gm-Message-State: AOJu0YzXIAxYaoL07oJxeVSoq+zUBiKrnFpja803mzp18clAfjrzByra
	Zk4KblDrvqrlAfvb93UiCN2hY7bACeufGD1AT/ieaHY1loZHLZt/
X-Gm-Gg: ASbGncujSAVKn8vHM91KElCGaesHqSWpESrGx7gZKuxX1N3Xcl6W/Jvn0QVg7zXefsL
	J9cXfa1PB0+Xe1vcAD/grPUlw16hZZBcELhPDuhh9wCHIQfDX3P2iA7DlGewmgAtWmH/Fep4itw
	ABUOfPEi7B+w8hcKkIohOyumyjp76ey4eQ5PoN/hyWwezgzewBCLryQi4LqS+kqZNO+svRk4ACw
	yBP3V8i5H09sMm/sDXGKczUJBDRE+An8nF14Itq1K7mDZ2vPRe0k8l64rPQA45kn0y05t0fvs+e
X-Google-Smtp-Source: AGHT+IFg0xphykRhQKusjtbwyZ+bfCNk9Lo/GQN5SR+nGcOGfnhtXjaDW/RgazWXKPH9B+cVxv1LDQ==
X-Received: by 2002:a17:902:ecc7:b0:215:a18f:88a8 with SMTP id d9443c01a7336-21a83fdf379mr199295665ad.51.1736613321903;
        Sat, 11 Jan 2025 08:35:21 -0800 (PST)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f259fb5sm29138805ad.239.2025.01.11.08.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 08:35:21 -0800 (PST)
Date: Sat, 11 Jan 2025 08:35:17 -0800
From: Richard Cochran <richardcochran@gmail.com>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC PATCH 06/10] net: ti: prueth: Adds HW timestamping support
 for PTP using PRU-ICSS IEP module
Message-ID: <Z4KdxQMBXmkF37KI@hoboy.vegasvil.org>
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250110055906.65086-7-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110055906.65086-7-basharath@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_083523_328751_A6B27FC6 
X-CRM114-Status: GOOD (  18.26  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, prajith@ti.com, rogerq@kernel.org, ssantosh@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, parvathi@couthit.com, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jan 10, 2025 at 11:29:02AM +0530, Basharath Hussain Khaja wrote:

> @@ -189,12 +190,37 @@ static void icssm_emac_get_regs(struct net_device *ndev,
>  	regs->version = PRUETH_REG_DUMP_GET_VER(prueth);
>  }
>  
> +static int icssm_emac_get_ts_info(struct net_device *ndev,
> +				  struct kernel_ethtool_ts_info *info)
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +
> +	if ((PRUETH_IS_EMAC(emac->prueth) && !emac->emac_ptp_tx_irq))
> +		return ethtool_op_get_ts_info(ndev, info);
> +
> +	info->so_timestamping =
> +		SOF_TIMESTAMPING_TX_HARDWARE |
> +		SOF_TIMESTAMPING_TX_SOFTWARE |

The driver advertises software Transmit time stamping, but where is
the call to skb_tx_timestamp() ?

I didn't see it in Patch #4.

> +		SOF_TIMESTAMPING_RX_HARDWARE |
> +		SOF_TIMESTAMPING_RX_SOFTWARE |
> +		SOF_TIMESTAMPING_SOFTWARE |
> +		SOF_TIMESTAMPING_RAW_HARDWARE;
> +
> +	info->phc_index = icss_iep_get_ptp_clock_idx(emac->prueth->iep);
> +	info->tx_types = BIT(HWTSTAMP_TX_OFF) | BIT(HWTSTAMP_TX_ON);
> +	info->rx_filters = BIT(HWTSTAMP_FILTER_NONE) |
> +				BIT(HWTSTAMP_FILTER_PTP_V2_EVENT);
> +
> +	return 0;
> +}

> @@ -442,6 +482,173 @@ static void icssm_emac_adjust_link(struct net_device *ndev)
>  	spin_unlock_irqrestore(&emac->lock, flags);
>  }
>  
> +static u8 icssm_prueth_ptp_ts_event_type(struct sk_buff *skb, u8 *ptp_msgtype)
> +{
> +	unsigned int ptp_class = ptp_classify_raw(skb);
> +	struct ptp_header *hdr;
> +	u8 msgtype, event_type;
> +
> +	if (ptp_class == PTP_CLASS_NONE)
> +		return PRUETH_PTP_TS_EVENTS;
> +
> +	hdr = ptp_parse_header(skb, ptp_class);
> +	if (!hdr)
> +		return PRUETH_PTP_TS_EVENTS;
> +
> +	msgtype = ptp_get_msgtype(hdr, ptp_class);
> +	/* Treat E2E Delay Req/Resp messages sane as P2P peer delay req/resp

s/sane/in the same way/

> +	 * in driver here since firmware stores timestamps in the same memory
> +	 * location for either (since they cannot operate simultaneously
> +	 * anyway)
> +	 */
> +	switch (msgtype) {
> +	case PTP_MSGTYPE_SYNC:
> +		event_type = PRUETH_PTP_SYNC;
> +		break;
> +	case PTP_MSGTYPE_DELAY_REQ:
> +	case PTP_MSGTYPE_PDELAY_REQ:
> +		event_type = PRUETH_PTP_DLY_REQ;
> +		break;
> +	/* TODO: Check why PTP_MSGTYPE_DELAY_RESP needs timestamp
> +	 * and need for it.
> +	 */
> +	case 0x9:

Delay response messages are PTP "general" messages and not event
messages, and as such they do not require time stamps.

> +	case PTP_MSGTYPE_PDELAY_RESP:
> +		event_type = PRUETH_PTP_DLY_RESP;
> +		break;
> +	default:
> +		event_type = PRUETH_PTP_TS_EVENTS;
> +	}
> +
> +	if (ptp_msgtype)
> +		*ptp_msgtype = msgtype;
> +
> +	return event_type;
> +}

Thanks,
Richard

