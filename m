Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4270C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAx37NgIikC1yEJzl1y/wDUAlNIlXDU8MqE4p0RIg9I=; b=ML/FTMB56OSoqdm6KEM5MZrZ/5
	8t3dmjMNUnk7Mxq8XX99IDd99dlBLGWL1uviCHwHTuN6S97QXbemU/Pz5FNH+L1up0LYpe8kH+fW/
	ci3rUy4aRCM1QXbF/7RkA0N3opNW6/47NTbp7XutgMmIxlkckj97H6M+n6bJjYbELiswV1pBkNh7j
	5ac2dNYi54Lzbt20I/ISpHW8E9HoxJE2UNfKao8yGywOZFXQzfPrCId5EcRbM4lHRqcsRf+4f/eWy
	q55YhLKyBw4an8/vtuvnxfKgu+bq5BCN45Vr4ILL+DrLiBzfjiXK0Irw4Z4lP2LKkpSk+EFxsPHon
	8HX1ZCiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5ac-00000008l4P-2YJ3;
	Tue, 21 Jul 2026 08:12:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5aZ-00000008l3P-0H0m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784621550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XAx37NgIikC1yEJzl1y/wDUAlNIlXDU8MqE4p0RIg9I=;
	b=UM2GmjIwnba5Kpg7Rjkx9R7s0Xkl98vTD6hsq4tT5OyUnMgO8iOZLm2vuUbLVEhPMehb/T
	3W3GtSwoQ55TVWna6CyfF9rDnbGxQ+58lajKVljqBoeIdQ40geP1f7N6OiFKbYgB93XKbT
	BsDmt0pncvtufl9GaGmcFoig5NHmFVk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-__Q1gyyvNMebOra5_qkzhQ-1; Tue, 21 Jul 2026 04:12:26 -0400
X-MC-Unique: __Q1gyyvNMebOra5_qkzhQ-1
X-Mimecast-MFC-AGG-ID: __Q1gyyvNMebOra5_qkzhQ_1784621545
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47485fde05aso6508750f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621545; x=1785226345;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAx37NgIikC1yEJzl1y/wDUAlNIlXDU8MqE4p0RIg9I=;
        b=WLgUKA4MSpQbj/qcZW9oqRZ+RtE8N3X6o7qvJuugphGHER8NxFKHqS1ANstzuLIZ5X
         qU6eA5FKISfW7KGjUPtriVoiwSYt4sz2iUYgBq9qG46RTZh8s94sSv1q2a+XBWTxm/OF
         qD/A32zCijGl04QCnD2G6pWiBB8eBh8Wwf1DKHbl/VJqf9mkJ2UuU4if8a1iPEOIUkZC
         xcN4V8F+uOEu/tLL8KY9Ya4SVeWL7PFlrPBHCsAKBqxsj2WbMoYpcHmtATcJ2GId3VhE
         9cWLYP+w8TrUAsbuvCfqEgcPWObwlf39DSAcg6hZFMUZ5iCwTFl+VSIXX+hZKFf6lMIC
         +Szw==
X-Forwarded-Encrypted: i=1; AHgh+RplPiIvT49GNNkTa1m0oXgur2s4OWGwIFx6WrU/4HZXI5gRqOo12aValq7dRKH0knyKgXjWae0kNPrXbLbAzXP6@lists.infradead.org
X-Gm-Message-State: AOJu0YznjjfclLBmO8jvsQop3ieCguWFJ6xKEVGGAPvSaXmA9iatUpuH
	8EzgmfXLRStfuetXmi799w0tU5ZCMy++HugTx511XTLD9dwzdumij0CQjVFZVchkfZAVKBPLsPN
	1rPrTNAq9Ss1hBEGHSQz4+NRUVqxRxSHdawDKdoDl3QcuKhcksFFO5gE0j8AMZxtAJW8yLVnRYe
	ec
X-Gm-Gg: AR+sD12jc/Ziyrl09REKzHUwrKMnOiwOOaEAAWiAl1M/rDdMdwbp5heFzWl0aaEbyW7
	N/YjGowyzM5eO81uafMe8FZlmvVct9pM1OC2lDGApoUf5rr0Z7BtbKD4Y3ygvkR9Sx+XbF9MrRb
	BzP0mAK5hf2FZ/3VfXm9GmhkAJkjOGYNS0GCHGPBEqLnhj282+zl0k058GshTh+wDG63fbs4KkD
	24XaTs0HvWvP4qi/5UAfRH32t7y2C13JuyfWlRjl5BVJTQ+S2hP4g78VdHRwWp0Ffwmm1YNT7Fq
	b7mnRgprzan/zNJCNex+dV30T/jPTGSCIwH9HvpzAaC1HWv3zMb4vFWNykSp5uYjH9faNXH7eST
	0KtPmX9w5Yiia6RNyL312zC2iLwv5QA9GOOKD5sXl0uoPQy0YzZd1Fw8nEY8Ni6K3WUPQkxKDfw
	I6mg==
X-Received: by 2002:a05:6000:402c:b0:47f:7759:89df with SMTP id ffacd0b85a97d-47f77598aeamr9608873f8f.3.1784621545010;
        Tue, 21 Jul 2026 01:12:25 -0700 (PDT)
X-Received: by 2002:a05:6000:402c:b0:47f:7759:89df with SMTP id ffacd0b85a97d-47f77598aeamr9608820f8f.3.1784621544539;
        Tue, 21 Jul 2026 01:12:24 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eddd1csm36838340f8f.29.2026.07.21.01.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:12:23 -0700 (PDT)
Message-ID: <2946c0f7-1c79-4890-a4b3-94141f42bc1a@redhat.com>
Date: Tue, 21 Jul 2026 10:12:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: stmmac: resume PHY before hardware setup when
 opening the interface
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Stefan Agner <stefan@agner.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
References: <message-id-of-your-v1-mail>
 <20260707195425.405989-1-stefan@agner.ch>
 <c8cbf359-e224-44c6-8692-9e1d1527ae0c@bootlin.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <c8cbf359-e224-44c6-8692-9e1d1527ae0c@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: puHC5qkqhNUQUwEoAy2Ol2dTmaW8g36m0pq4pSF43cM_1784621545
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_011231_183526_78F4E291 
X-CRM114-Status: GOOD (  25.41  )
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

Hi,

On 7/8/26 11:16 AM, Maxime Chevallier wrote:
> On 7/7/26 21:54, Stefan Agner wrote:
>> Since the referenced commit, changing the MTU on a running interface no
>> longer disconnects and reconnects the PHY; __stmmac_release() merely
>> stops phylink, which also suspends the PHY (BMCR power-down) when WoL
>> is not enabled. __stmmac_open() then performs the DMA software reset in
>> stmmac_hw_setup() before phylink_start() resumes the PHY again.
>>
>> IEEE 802.3 22.2.4.1.5 allows a PHY to stop its receive clock while
>> powered down, and stmmac requires a running receive clock for the DMA
>> software reset to complete (the phylink config sets mac_requires_rxc).
>> On such setups, e.g. the RK3566-based Home Assistant Green with an
>> RTL8211F-VD PHY in RGMII mode, any runtime MTU change now times out and
>> leaves the interface dead:
>>
>>   rk_gmac-dwmac fe010000.ethernet end0: Failed to reset the dma
>>   rk_gmac-dwmac fe010000.ethernet end0: stmmac_hw_setup: DMA engine initialization failed
>>   rk_gmac-dwmac fe010000.ethernet end0: __stmmac_open: Hw setup failed
>>   rk_gmac-dwmac fe010000.ethernet end0: failed reopening the interface after MTU change
>>
>> In the field this is triggered by NetworkManager applying an MTU while
>> activating the connection, breaking networking entirely.
>>
>> Resume the PHY in __stmmac_open() before the hardware setup, making it
>> the counterpart of the phylink_stop() in __stmmac_release(), like
>> stmmac_resume() already does for the same reason. phylink_start() also
>> resumes the PHY, but only after stmmac_hw_setup(), and it cannot be
>> moved before the hardware setup since it may bring the link up
>> immediately from a workqueue, racing with the initialization (see the
>> comment in stmmac_resume()). For the regular ndo_open path the PHY has
>> just been attached and is not suspended, in which case
>> phylink_prepare_resume() does nothing.
>>
>> Fixes: db299a0c09e9 ("net: stmmac: move PHY handling out of __stmmac_open()/release()")
>> Link: https://github.com/home-assistant/operating-system/issues/4858
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> I was able to reproduce the issue on imx8mp and socfpga. Adding this case to
> my periodic test list...
> 
> Indeed the assymetry isn't very nice, OTOH there's not phylink counterpart
> for phylink_prepare_resume(). This helper was added for the suspend/resume
> case, and only for it as the doc states, it just happens to do exactly
> what we need to fix the issue :
> 
> /**
>  * phylink_prepare_resume() - prepare to resume a network device
>  * @pl: a pointer to a &struct phylink returned from phylink_create()
>  *
>  * Optional, but if called must be called prior to phylink_resume().
>  *
>  * Prepare to resume a network device, preparing the PHY as necessary.
>  */
> void phylink_prepare_resume(struct phylink *pl)
> 
> I think this helper should be renamed and the doc updated, stmmac is the
> sole user, and it's really about controlling that rxc and not about
> suspend / resume. Resuming from suspend is just one of the cases where we
> need that RXC early on.
> 
> So either something like 'phylink_prepare_start_or_resume' but it's long,
> or maybe we can be more explicit about it and simply call it:
> 
> phylink_start_rxc(pl)
> 
> (without a corresponding stop)
I read the above as a possible follow-up more than actual changes
requested to this patch, am I correct?

Thanks,

Paolo


