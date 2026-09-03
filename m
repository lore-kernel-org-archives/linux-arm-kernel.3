Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FA9C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbz/owPnKRrMjXILn4+/+C7V6jFSyrt1XBCIFCXBvC8=; b=Wop+fC2YbFkbbmUt/7oKYkK39I
	W+eBwaxlBckOkoSrXv0F528SrnNrU68fsSC2HZGDtfT3qEr6DXGCIMFSLUkfcJVWHjBQ7YdQxGjUM
	tBGfckQFOqGoSmxBS3boM1DYeKfG5QnuJux69l7dl0gAteZyVUTpfQOpT8hIWtADPcwB3d2wIZW0x
	OyH526yUqVY5sIbRXLPIPFcfhjhBOmaz6M4qzPQQN14AN6YouYqdPFxp1yliueA7D28r3pJtVR3hp
	9PS/R7MyHoeoeHTGCc+fGT5pnuOk976envrhN8SjdkfXzyAIqLnUBISw4OGXwa7RAQEXN7LNFfTEV
	5xIYfTgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29nS-0000000041f-0r7R;
	Thu, 03 Sep 2026 15:56:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29nP-0000000040X-4AQt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 15:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788450971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fbz/owPnKRrMjXILn4+/+C7V6jFSyrt1XBCIFCXBvC8=;
	b=NvC7FNkP5ObwSrZuJ95SU19DdLXLkjCI+5M/Iorr7+pZxniIsJkDgTFQJ3jrZpChvfAH4i
	ReceTz7FIXdty7lrV4EiEeryJaLCPyjliC8oxVTI0J8jCZlVffe9RRBdJ43EJ90dDITzuS
	XIOdvdGRnlgCkZFdzCABylNHevppCJ0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-fh8zx1dqMyaX9k39AqgYgg-1; Thu, 03 Sep 2026 11:56:07 -0400
X-MC-Unique: fh8zx1dqMyaX9k39AqgYgg-1
X-Mimecast-MFC-AGG-ID: fh8zx1dqMyaX9k39AqgYgg_1788450966
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso128825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 08:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788450966; x=1789055766;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fbz/owPnKRrMjXILn4+/+C7V6jFSyrt1XBCIFCXBvC8=;
        b=AN3m4QPn5qo0vpb32HFDVCF3puMCjJwgAgj1t/l7XifUvJ0RFI6hnTdr+fKMdRrxiA
         N6NdV/99jodbuRlPEcDZDPeEcZi4YqvYRujeFifr7IVE9BKFGTwzbOQL1XrblJSUbWxl
         TiVP4PJzP99nrHg0XEwLEgHJl1IsWPy1moklyb9ksZYWWKdcnEMRnCa8XU2nwf/UNpTw
         nyGhVwFOhDONVo8m6zB5nyqad92dNBM2HrtkWreFcDW5dbPK23qVVvZktmZoGMNp3D4o
         IImv15x/x7eO+oDfTBjFMDbgdSUu73rbQ2zgls8N7p7hkVwOPlg0t+6+wVRtozOBRWmw
         J2CA==
X-Forwarded-Encrypted: i=1; AKwUvByayfE5yXHGkzZRjDmWFmOlJR6gU1qY9C00i+9Tl5bVcEZuwWcx/ZPLI54BV5qGyiHlJJnBBKPnljd1vfEyejsQ@lists.infradead.org
X-Gm-Message-State: AFuF++ntzhKCabQ3aZ+s66a4xWLkUzZPfs3iN03cFkdkCWNhdXCkeVHd
	4RE2rVSrevnhqFes+lc+UYJ1gBX0rpaFVmQI2o1cCBdWbEstLfp9xV/M4AO0yQn48G2+EU8Dfwx
	uWTEdoXnD7Cvfskg83AKrJgA7tJfLFLPBQTyytAyK2SFcdAtbjhX7PSwAwmMdfUm534K/uJ20UE
	Hj
X-Gm-Gg: AYBFou11qlcvQLz9boigQPYJ8FW70J5d6Xk0NT9Z/itQ4OtkNVEREn0k2S3y7yzz2iR
	whRr4ulkAjx52vDHYmXpK95kYsOZJtk/zDpmEGPdEV4bZGAp1l1MbeVKZzUvg9HIjChMWCzVH9w
	WzAxwkTmOk/gk6sGu/IE8taE1oLEMF2OAngV83hDrzF8s2mi93gWCyUL70vREkHjfs3qgWzMD4S
	5uJTUxmpWUU2z82Bt1sLZeHfAV+rWY6LRTX8IdboIccR0J8XlOPznpMAq+3J0GALeFGTspbj/q5
	4h4CucJtq1q9VhIVTcuDlMArLGPLhcNHTf7umBq1g+dqcI0e4YoJYEb3RrXmYeol1YnjniWCUUk
	fmpZCahqJHgUt5YWPocf3HQ3blZnWjCPLVoAawH84c0UC67wjYHRqj+yuqYp7x7KAXhz4GWP9fQ
	==
X-Received: by 2002:a05:600d:4:b0:49c:e9c1:25ca with SMTP id 5b1f17b1804b1-49ce9c12778mr188520365e9.3.1788450966069;
        Thu, 03 Sep 2026 08:56:06 -0700 (PDT)
X-Received: by 2002:a05:600d:4:b0:49c:e9c1:25ca with SMTP id 5b1f17b1804b1-49ce9c12778mr188519615e9.3.1788450965620;
        Thu, 03 Sep 2026 08:56:05 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5e589bsm74190425e9.13.2026.09.03.08.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:56:03 -0700 (PDT)
Message-ID: <0ca33b49-07d9-4cea-a9da-1ccdd6a40cea@redhat.com>
Date: Thu, 3 Sep 2026 17:56:02 +0200
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
 <1ef90408-99b6-42fb-a7c6-7e5bca20c46d@redhat.com>
 <apmWLtgcUXRrOTFj@lore-desk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <apmWLtgcUXRrOTFj@lore-desk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tLMe-A5s4rhTLrfpc76SMp_TlsC7yrB-Jpj7pEq-aug_1788450966
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_085612_098496_0EE786CE 
X-CRM114-Status: GOOD (  20.68  )
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

On 9/3/26 5:45 PM, Lorenzo Bianconi wrote:
> On Sep 03, Paolo Abeni wrote:
>> On 9/3/26 2:35 PM, Lorenzo Bianconi wrote:
>>>> On 8/31/26 8:34 AM, Lorenzo Bianconi wrote:
>>>>> Add hardware GRO offload support to the airoha_eth driver, leveraging
>>>>> the EN7581/AN7583 SoC's 8 dedicated LRO hardware queues mapped to RX
>>>>> queues 24-31. HW GRO offloading does not support Scatter-Gather (SG) so
>>>>> it is required to increase the page_pool allocation order to 2 for RX
>>>>> queues 24-31 (LRO queues).
>>>>> Since HW GRO is configured per-QDMA and shared across all devices using
>>>>> it, HW GRO is mutually exclusive with multiple devices bound to the
>>>>> same QDMA block. Call airoha_update_netdev_features() in
>>>>> airoha_dev_set_qdma() so that NETIF_F_GRO_HW availability is re-evaluated
>>>>> whenever the QDMA user count changes (device registration and runtime QDMA
>>>>> migration).
>>>>> Set CHECKSUM_PARTIAL with pseudo-header checksum on aggregated packets
>>>>> so that L3-forwarded traffic is correctly handled by the GSO/TSO path
>>>>> on the egress device.
>>>>> The HW does not report the per-segment MSS (msg3[31:16] only reports
>>>>> the max aggregated size), so the gso_size of an aggregated packet is
>>>>> just an approximation computed as DIV_ROUND_UP(data_len, agg_count).
>>>>
>>>> What is the <max aggregated size> exactly? I read it as the maximum size
>>>> of the aggregated segments, am I correct?
>>>
>>> Hi Paolo,
>>>
>>> with "max aggregated size" I refer to the length of the aggregated TCP
>>> packet (composed by multiple segments). This value is reported via
>>> QDMA_DESC_LEN_MASK field in the DMA descriptor. Moreover, the hw reports
>>> the exact number of the aggregated segments via QDMA_ETH_RXMSG_AGG_COUNT_MASK
>>> field.
>>>
>>>>
>>>> Also any more details on how the aggregation engine works? i.e. can it
>>>> aggregate "random" segment sizes (i.e. 200 - 300 - 400) or does it
>>>> respect HW_GRO layout? (i.e. all segments except the last one must have
>>>> equal size, the can be smaller).
>>>
>>> The hw engine, for each LRO queue, is configured with:
>>>
>>> - CDM_LRO_AGG_NUM_MASK: max number of segments for each aggregated TCP packet
>>>                         (64 in the current configuration).
>>> - CDM_LRO_AGG_SIZE_MASK: max size of the aggregated TCP packet (composed by
>>>                          multiple segments). 16KB in the current configuration.
>>> - CDM_LRO_AGG_TIME_MASK: max timeout to compose the aggregated TCP packet.
>>>
>>> In order to validate the scenario, I run the following test:
>>>
>>> TCP client:
>>> ------------
>>> - disable TSO/GSO
>>> - set MSS to 256 bytes (iperf3 -M option)
>>>
>>> I can see multiple 310 bytes TCP segments on the wire
>>>
>>> TCP server: (where rx-gro-hw is enabled):
>>> -------------------------------------------
>>> - the engine aggregates ~64 segments in a ~16Kbyes TCP packet
>>>
>>>   so gso_size ~ 16KB / 64 ~ 256B
>>>
>>> I guess this would be the behaviour even if the original packets
>>> have different size (not sure if it is a real use-case).
>> Lacking more details from the vendor, I think you need to use a
>> pktdrill-like sender, explicitly sets the segment lengths to some not
>> mergeable (like, i.e. 200-300-400) but otherwise fitting a GRO packet
>> (i.e. same hdr except for the sequence number and push flag allowed only
>> in the last packet), ensure that the aggregation timeout lasts long
>> enough to receive all of them, and check if the engine really aggregates
>> them or not.
> 
> I think in the example you pointed out (length 200,300,400) the hw engine will
> create a single TCP packet composed by 3 segments (with gso_size = 300) while
> sw GRO will just push sigle skbs. I agree this is just a GRO approximation.
> If it is not enough I am fine to switch back to LRO implementation.
In such a case I think LRO should be needed. I suggest to explicitly
validate the statement, it should be feasible, and the possible gain
relevant (should the engine instead do the right thing).

/P


