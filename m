Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07159C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 11:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLkIh8hUpNx+fetBHcv6ts2+oAr71F0OW4FhDVnFMS4=; b=UlIjYZ2XCo8w/uMaOb2EB/fnIL
	UgdQzUpWyNnds/Qhv2WAGf3DM6/dO/crklFfzRtmrBfaLnrrQHJezFz+1vo0uPUM6ueP0sh6Pq54c
	ESzbfmQ9xdPFldWbGg6UwUoAk2PIoZUp9w+2zNMqPQ5njXLGQE/D2chHwVNzxDOhsujjGU/bZmZ6L
	Xdale1QYgfVrIsuNZvcOOhGTysfQ6sDZOiIqVHOPZBfG/HpsouQhwJTm5ExsX7UCsHs4rOG+6p1Ka
	Q6zoOb3ciWTKMwtH6i3Z4V8Q+RvmxVI81qWpaeWNQIyW7dh2kOaDGvzfyynpzPgp07Pf5GWHGSA/W
	HlaN0Z2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbNT-0000000FboG-024A;
	Thu, 29 May 2025 11:24:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKasJ-0000000FYaG-2b1Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748515958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLkIh8hUpNx+fetBHcv6ts2+oAr71F0OW4FhDVnFMS4=;
	b=P/IX6yFQcjgrKQbcu8xkvHQdfQhtgUFHY9sN0cqMN1KlbZ7XP+lBjpuk5b28sjDB9ghWN0
	nvVySOfMZifDLJUwED2CSqRi2P5pqE60gxbfyKHMT54rvheyYJpYLxj1hPBStg36J49YUg
	qeaQqiZ/Aw6mJvPgO4lhSqW/KAipRbs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-5uvAhmS1MOmalcWN-MvA4w-1; Thu, 29 May 2025 06:52:37 -0400
X-MC-Unique: 5uvAhmS1MOmalcWN-MvA4w-1
X-Mimecast-MFC-AGG-ID: 5uvAhmS1MOmalcWN-MvA4w_1748515956
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4d95375c6so388504f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 03:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515956; x=1749120756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oLkIh8hUpNx+fetBHcv6ts2+oAr71F0OW4FhDVnFMS4=;
        b=gaZBuq3hX+5TkPr232qi2//RO1sD9iSJS8tY52+JFLWXs6xvW/8+0wwdpRQ58QhfBS
         7uZibtEFbZu0LQo8znLV6QRIoxrwf0OocNXopKhxqXH12KngDKVbQHnbbPrczQv+5iVn
         cVs15DC6iPaQBqwJaoP+Gm9JnAz09VkNN9FiAVsGcR41Lub4GfZiu5EJlxo5cDGy0r7I
         vyhIstwtqVeg+1xUP2fPA3WdVlIavf/2WxV3fB+soQlcteR/Z7EQoq1A1GFVj/2NPSo5
         x5JiFCIQxuL4+yqjK0+SLU2nBWDAgdjALRIECoE35jTGKWcuvSsUtJ5CRR3kfYi0rDUn
         QeGA==
X-Forwarded-Encrypted: i=1; AJvYcCUrp8MD6+4hTk0CjzfLZSBuXDSb6Pmj/fDkz3zV0CR9IEFF+MGyihuTuqrf6YiapVsUQm8eHOKUFdkeV6wkQ3+b@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg7p1tMeptOhhKetIgDHxnZO38EvnJQCbZG1xecpDLPqBEOWma
	nBpn21SQPmXt8QL6/b6Cq1bVgIXqeSG11VHvcE74xfQC9rjH97tI4jrCBKlA3O1Ase0tfgYNKNU
	8LIIk1K9DBtA6oyl7FO+1CSmofnJmCbV7ooeHMr6ypqHTkVlaRIlbJHKu7VKiqwoZbdBj3Itp9K
	Se
X-Gm-Gg: ASbGnctgpUDhWMGE01R1ojOoAiWyXDXNOmutyACKdxctwCsCpuV2vNVvLHh7cFLcvZV
	kOqkpmNCVkoSt0ys0r0odS4LhLViEKK8Whin42IXW0aefwGWA4oLLt4d+gEZmPH5vVdkcF8WSLD
	p61ZLJVzwjAFl0ABDAIyDC/C1ie/bHMsJFIBwQIfUKwStwDWUBrpfkxEm8AwdpbJIJAu+VeoJ15
	KaR/6hyaZ/SfwcEFqJqGuAzblsp4nICShqwoxkr4tWm7PXKao6p8C/NTZN2f65cDirriyGwsW1V
	MQbB/cgT4Is7wqe2TaKVzkqPsTfNsiC60gEkGEygGhrtUJkkgsGUcHV5/lg=
X-Received: by 2002:a05:6000:2905:b0:3a4:cfe3:850f with SMTP id ffacd0b85a97d-3a4cfe3866emr18548896f8f.26.1748515956326;
        Thu, 29 May 2025 03:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd5rBzaY1hUfRsYOE+gTC/pugRVRTJ9nUCAUf9lmcPzrrorgZJVoTSNaWXkDhPqzVybmEIrg==
X-Received: by 2002:a05:6000:2905:b0:3a4:cfe3:850f with SMTP id ffacd0b85a97d-3a4cfe3866emr18548873f8f.26.1748515955955;
        Thu, 29 May 2025 03:52:35 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cce5:2e10:5e9b:1ef6:e9f3:6bc4? ([2a0d:3341:cce5:2e10:5e9b:1ef6:e9f3:6bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73eebsm1627199f8f.44.2025.05.29.03.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 03:52:35 -0700 (PDT)
Message-ID: <6ae0ad5a-f560-43c5-a581-e4699634b65e@redhat.com>
Date: Thu, 29 May 2025 12:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net v2] net: wwan: t7xx: Fix napi rx poll issue
To: Jinjian Song <jinjian.song@fibocom.com>,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 corbet@lwn.net, linux-mediatek@lists.infradead.org, helgaas@kernel.org,
 danielwinkler@google.com, andrew+netdev@lunn.ch, horms@kernel.org,
 sreehari.kancharla@linux.intel.com, ilpo.jarvinen@linux.intel.com
References: <20250528082827.4654-1-jinjian.song@fibocom.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250528082827.4654-1-jinjian.song@fibocom.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LOsCKP1whj04eUPSBq8AKddUdawzID54gIyEyXFqD1M_1748515956
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_035239_736984_6D7AAE06 
X-CRM114-Status: GOOD (  18.39  )
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

On 5/28/25 10:28 AM, Jinjian Song wrote:
> When driver handles the napi rx polling requests, the netdev might
> have been released by the dellink logic triggered by the disconnect
> operation on user plane. However, in the logic of processing skb in
> polling, an invalid netdev is still being used, which causes a panic.
> 
> BUG: kernel NULL pointer dereference, address: 00000000000000f1
> Oops: 0000 [#1] PREEMPT SMP NOPTI
> RIP: 0010:dev_gro_receive+0x3a/0x620
> [...]
> Call Trace:
>  <IRQ>
>  ? __die_body+0x68/0xb0
>  ? page_fault_oops+0x379/0x3e0
>  ? exc_page_fault+0x4f/0xa0
>  ? asm_exc_page_fault+0x22/0x30
>  ? __pfx_t7xx_ccmni_recv_skb+0x10/0x10 [mtk_t7xx (HASH:1400 7)]
>  ? dev_gro_receive+0x3a/0x620
>  napi_gro_receive+0xad/0x170
>  t7xx_ccmni_recv_skb+0x48/0x70 [mtk_t7xx (HASH:1400 7)]
>  t7xx_dpmaif_napi_rx_poll+0x590/0x800 [mtk_t7xx (HASH:1400 7)]
>  net_rx_action+0x103/0x470
>  irq_exit_rcu+0x13a/0x310
>  sysvec_apic_timer_interrupt+0x56/0x90
>  </IRQ>
> 
> Fixes: 5545b7b9f294 ("net: wwan: t7xx: Add NAPI support")
> Signed-off-by: Jinjian Song <jinjian.song@fibocom.com>
> ---
>  drivers/net/wwan/t7xx/t7xx_netdev.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wwan/t7xx/t7xx_netdev.c b/drivers/net/wwan/t7xx/t7xx_netdev.c
> index 91fa082e9cab..48007384c030 100644
> --- a/drivers/net/wwan/t7xx/t7xx_netdev.c
> +++ b/drivers/net/wwan/t7xx/t7xx_netdev.c
> @@ -172,7 +172,7 @@ static void t7xx_ccmni_start(struct t7xx_ccmni_ctrl *ctlb)
>  	int i;
>  
>  	for (i = 0; i < ctlb->nic_dev_num; i++) {
> -		ccmni = ctlb->ccmni_inst[i];
> +		ccmni = READ_ONCE(ctlb->ccmni_inst[i]);
>  		if (!ccmni)
>  			continue;
>  
> @@ -192,7 +192,7 @@ static void t7xx_ccmni_pre_stop(struct t7xx_ccmni_ctrl *ctlb)
>  	int i;
>  
>  	for (i = 0; i < ctlb->nic_dev_num; i++) {
> -		ccmni = ctlb->ccmni_inst[i];
> +		ccmni = READ_ONCE(ctlb->ccmni_inst[i]);
>  		if (!ccmni)
>  			continue;
>  
> @@ -210,7 +210,7 @@ static void t7xx_ccmni_post_stop(struct t7xx_ccmni_ctrl *ctlb)
>  		t7xx_ccmni_disable_napi(ctlb);
>  
>  	for (i = 0; i < ctlb->nic_dev_num; i++) {
> -		ccmni = ctlb->ccmni_inst[i];
> +		ccmni = READ_ONCE(ctlb->ccmni_inst[i]);
>  		if (!ccmni)
>  			continue;
>  
> @@ -302,7 +302,7 @@ static int t7xx_ccmni_wwan_newlink(void *ctxt, struct net_device *dev, u32 if_id
>  	ccmni->ctlb = ctlb;
>  	ccmni->dev = dev;
>  	atomic_set(&ccmni->usage, 0);
> -	ctlb->ccmni_inst[if_id] = ccmni;
> +	WRITE_ONCE(ctlb->ccmni_inst[if_id], ccmni);
>  
>  	ret = register_netdevice(dev);
>  	if (ret)
> @@ -321,9 +321,10 @@ static void t7xx_ccmni_wwan_dellink(void *ctxt, struct net_device *dev, struct l
>  	if (if_id >= ARRAY_SIZE(ctlb->ccmni_inst))
>  		return;
>  
> -	if (WARN_ON(ctlb->ccmni_inst[if_id] != ccmni))
> +	if (WARN_ON(READ_ONCE(ctlb->ccmni_inst[if_id]) != ccmni))

READ_ONCE is only needed when the the lock protecting ctlb->ccmni_inst
is not held. It's not needed here, and likely in pre/post stop operations.

/P


