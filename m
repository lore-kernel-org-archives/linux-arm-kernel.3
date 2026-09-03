Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B13C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Tb/L+VGBd0B4nk4cyFUET4v3yYKRPvEqokLayHQsa4=; b=clO4wbnUa0+5CGzxHkyZFVgz3y
	RluLPsN7MiaaVWzjzjhceX3O5aDK7bY50aUc3Ji4L8SacCmPn/HJkXEWSu/bRA68Rv8OTUHq2mXOY
	5ZCRtSYYqdlcp0Xl5FQ25hjwNCxVue3wJF+wbgMVXHjJUq8pt5KQBoapBFRDPousTX075Jb6kxtKw
	jgJSt6n0MtHvb9xqkWmo4DWxMN9P+IIUK8s0YfM+6qfqpeIZ9EC/HE5fOiF9IZYBGb6MHkX4tC0Py
	pTw0uKQWqSKbP6SLhMHutOy3evR9m86Vls39L3VubppQRy5Cf9+4ujINk3c679+OAe1vgD5GBchnS
	u25l5U+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27oe-0000000HRcE-2oJm;
	Thu, 03 Sep 2026 13:49:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27ob-0000000HRbo-40HS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 13:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788443356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Tb/L+VGBd0B4nk4cyFUET4v3yYKRPvEqokLayHQsa4=;
	b=ZYCDoS6rfdiq4qhRUY+mhL835/mNUgefS/t7RcLBsUxWkvknLZ9vujL5/mLckM2YD9+DTq
	MOOY+Hm0ODwg8U0Y3hA3DGcXSAALSQSjDyEQV49mOYlCEFYS06iwDwamdrYZBL8Sx0rT33
	oAY3S9n8Vs8/GNQ+XAqSVrByLae/onI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-cXyiap6QM7ibEprPKYLVXQ-1; Thu, 03 Sep 2026 09:47:41 -0400
X-MC-Unique: cXyiap6QM7ibEprPKYLVXQ-1
X-Mimecast-MFC-AGG-ID: cXyiap6QM7ibEprPKYLVXQ_1788443241
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-482f41ca436so2311952f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 06:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788443214; x=1789048014;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Tb/L+VGBd0B4nk4cyFUET4v3yYKRPvEqokLayHQsa4=;
        b=TNCd+mIUZtPpjGaqzNaywAkgpczIeTav003QKwHdYd9RjMVr1ZCErDqOjZkqZub0ra
         PzWooEeQNr73G28ewvBCuI1bLZ1njrvaNKwyHx7F3LyR4dG/INjag1xEVCCe9pjuXOG1
         7/2NyolxfNnKRFF57v2WtBC1buOJzYzIMSixUypiaK2AEvHchos1aVW2rOU5M5GSMNqD
         WWF5cgGCFGho1dDb7BJZwdZFAMRghpRsDfPf4fReAv/aT2jnf4cT4HeIJ0rkTk7ajiP4
         PcIXM0PEe9ozBg89AlYRkZwa/mRPv3vEJpR2o0H1tV5Q7u01/HBqwDPJ6z+pORy1tp0u
         dWpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRdA5gSByavthPeXftLx7flkkBorvOe9uVGRt99tvWQnc4rfCiYldxZqD5bjH9by1f9Zoik0nJmqDJ+IXAXnYu@lists.infradead.org
X-Gm-Message-State: AFuF++lXYYdD+u/c3aSlyiQAEe4OCzhewsGBxOt4y8RFRSreFGwGfwsx
	joGJeo2+9oz9poIjreGARwMpqVzB8phWjkUpiigso4eRcOetosdyaO/bz+0G/kmxBSGIvwJ/a39
	39TbELVbUMvEymiz8Xr+PDsfiq/VJlsl4zHURmjNo497OVXU5+pwZsbqrZ6ou9y+QzROxawz2KI
	M/
X-Gm-Gg: AYBFou1PaHeC5/LWs87rge8Wwo7W25xYxsj25ogr2zPahII6yNucmQD3Qq+TbWOcDVN
	cI+rufy9pFrpNy+Tl6eXtVoLbB4QSfxztra58s5zuQkFZCAwN93qBfc3l26fv+ijX9NWeT/FhMm
	rusFXPIJ/84tG6vFjYtycLYBcW28HNa6cYLf+laL2/I0ldjfnDDjEtcVccwz7OVJ/Ic/B29zl9T
	P0WLsoh9tY0SKdu2+NfDK6jW89MSV25GUUsbDN0FtkbrrlssEjObArpSFx+v/xAfQd1HhD524Eh
	SRVqbeejEEgpHn4tm0sxnQMjlip6qltBZxCsdKDtyRnBsUDvm/QuY8XI/EmTZiV/QhaIcX1pl10
	t+NZ0pjQtaL56DzSQx6HkP2+0W0PYIfKEFNcZHkndsIul8xVPg0+5GAkYYrxXSG1QMnR2rz5bXA
	==
X-Received: by 2002:a05:600c:4592:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49ce5828104mr200759305e9.7.1788443214237;
        Thu, 03 Sep 2026 06:46:54 -0700 (PDT)
X-Received: by 2002:a05:600c:4592:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49ce5828104mr200758365e9.7.1788443213792;
        Thu, 03 Sep 2026 06:46:53 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dadddsm87661595e9.9.2026.09.03.06.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:46:52 -0700 (PDT)
Message-ID: <1ef90408-99b6-42fb-a7c6-7e5bca20c46d@redhat.com>
Date: Thu, 3 Sep 2026 15:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5] net: airoha: add HW GRO offload support
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, Madhur Agrawal <madhur.agrawal@airoha.com>
References: <20260831-airoha-eth-lro-v5-1-6b0f50401121@kernel.org>
 <fce0ee5a-476a-4867-9dd2-08e55993bd90@redhat.com>
 <aplpllPidmCjhSmA@lore-desk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aplpllPidmCjhSmA@lore-desk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FCjOUzzgjvbi4LjWqX_HmigLcoxZJsqyGAYxU-zHCJU_1788443241
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_064919_175276_ACAE6B9A 
X-CRM114-Status: GOOD (  22.12  )
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

On 9/3/26 2:35 PM, Lorenzo Bianconi wrote:
>> On 8/31/26 8:34 AM, Lorenzo Bianconi wrote:
>>> Add hardware GRO offload support to the airoha_eth driver, leveraging
>>> the EN7581/AN7583 SoC's 8 dedicated LRO hardware queues mapped to RX
>>> queues 24-31. HW GRO offloading does not support Scatter-Gather (SG) so
>>> it is required to increase the page_pool allocation order to 2 for RX
>>> queues 24-31 (LRO queues).
>>> Since HW GRO is configured per-QDMA and shared across all devices using
>>> it, HW GRO is mutually exclusive with multiple devices bound to the
>>> same QDMA block. Call airoha_update_netdev_features() in
>>> airoha_dev_set_qdma() so that NETIF_F_GRO_HW availability is re-evaluated
>>> whenever the QDMA user count changes (device registration and runtime QDMA
>>> migration).
>>> Set CHECKSUM_PARTIAL with pseudo-header checksum on aggregated packets
>>> so that L3-forwarded traffic is correctly handled by the GSO/TSO path
>>> on the egress device.
>>> The HW does not report the per-segment MSS (msg3[31:16] only reports
>>> the max aggregated size), so the gso_size of an aggregated packet is
>>> just an approximation computed as DIV_ROUND_UP(data_len, agg_count).
>>
>> What is the <max aggregated size> exactly? I read it as the maximum size
>> of the aggregated segments, am I correct?
> 
> Hi Paolo,
> 
> with "max aggregated size" I refer to the length of the aggregated TCP
> packet (composed by multiple segments). This value is reported via
> QDMA_DESC_LEN_MASK field in the DMA descriptor. Moreover, the hw reports
> the exact number of the aggregated segments via QDMA_ETH_RXMSG_AGG_COUNT_MASK
> field.
> 
>>
>> Also any more details on how the aggregation engine works? i.e. can it
>> aggregate "random" segment sizes (i.e. 200 - 300 - 400) or does it
>> respect HW_GRO layout? (i.e. all segments except the last one must have
>> equal size, the can be smaller).
> 
> The hw engine, for each LRO queue, is configured with:
> 
> - CDM_LRO_AGG_NUM_MASK: max number of segments for each aggregated TCP packet
>                         (64 in the current configuration).
> - CDM_LRO_AGG_SIZE_MASK: max size of the aggregated TCP packet (composed by
>                          multiple segments). 16KB in the current configuration.
> - CDM_LRO_AGG_TIME_MASK: max timeout to compose the aggregated TCP packet.
> 
> In order to validate the scenario, I run the following test:
> 
> TCP client:
> ------------
> - disable TSO/GSO
> - set MSS to 256 bytes (iperf3 -M option)
> 
> I can see multiple 310 bytes TCP segments on the wire
> 
> TCP server: (where rx-gro-hw is enabled):
> -------------------------------------------
> - the engine aggregates ~64 segments in a ~16Kbyes TCP packet
> 
>   so gso_size ~ 16KB / 64 ~ 256B
> 
> I guess this would be the behaviour even if the original packets
> have different size (not sure if it is a real use-case).
Lacking more details from the vendor, I think you need to use a
pktdrill-like sender, explicitly sets the segment lengths to some not
mergeable (like, i.e. 200-300-400) but otherwise fitting a GRO packet
(i.e. same hdr except for the sequence number and push flag allowed only
in the last packet), ensure that the aggregation timeout lasts long
enough to receive all of them, and check if the engine really aggregates
them or not.

/P


