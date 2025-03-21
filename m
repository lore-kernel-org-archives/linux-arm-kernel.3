Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FA1C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 18:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRqBZ0OkMQP4BzSiooVfIumzyiQnM11f1AZ/zH2IWSk=; b=ONf2PS1GpXMyoFXVkvbUJtas0x
	xlVHS9j33ts2eC+V7Nv6UxAPOOAoa7wPVxHjOHX9dWBh/6QLg0EJAQsB28WU8JGUaDdoO7rNemNHd
	WVN6O5plQ8hwvNhONCltRIxK0nfHiEtZ9BOhyxoTAGl/F5cGPNystHqFaGwCBrzJ+8CnbY4pabTb2
	wuFnKApTgMzIt55S7lkfRuDobJSIPY5Hg82TG4foPwbC2p8BUFiBAITp8tg4HMuyUIQXb8RW5FCJP
	6mnqO8sAOb7BjuWtGnCTkM+qGgb9u4FQOrB/3W1Wx+IjY+IjYf9ixEL4KMWObObOMSwYZKwoMIxeD
	TiXfGbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgyU-0000000FpIv-2f9Z;
	Fri, 21 Mar 2025 18:20:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgwo-0000000Fp5O-2CVM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 18:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742581101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iRqBZ0OkMQP4BzSiooVfIumzyiQnM11f1AZ/zH2IWSk=;
	b=INmnnSJTDyHhNTY2PZJsfZwb5+lOhftv86YFzxkHC5ojg87qG9utHHRGAVD0Dk5AIdVjnn
	3OArhZBcapihg+Cb6QcGF4anYQsY22/z8/ln7lqVJjcUp043Y++/7J6Gzo6pv/aXFcCKs5
	e7gNMKm+LTJvHlwJ4j8eXEUHZAIqFB4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-UKa2Di6_Oo-Y_Q6d5D-M9w-1; Fri, 21 Mar 2025 14:18:18 -0400
X-MC-Unique: UKa2Di6_Oo-Y_Q6d5D-M9w-1
X-Mimecast-MFC-AGG-ID: UKa2Di6_Oo-Y_Q6d5D-M9w_1742581097
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so11046505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 11:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742581097; x=1743185897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRqBZ0OkMQP4BzSiooVfIumzyiQnM11f1AZ/zH2IWSk=;
        b=d73lGxnRHuLA6SBTIzJ9FNnl2cu38j4oYxpUwiZQo+X2NJFma41SMwD7QdAc5kPKtn
         SEW1jdxTUYTFD2acqZgB7VX/+h3nOYn83qS9Jle+HSPTC+ENp4ZrZDgxFRBc1xcOVvN1
         XwV0saJN4lLWyhrC2+jsFknid3CV8DR6pcLJf9yNMRyBMH/Cb9NFacG5GIvI5J6BCqkk
         aiNEJ4rzUFS2+5aJbwwqf7cPJgMNJgx2LVMPd6+bUCmnmaa7GjAT6qeB4dWrHgFjEgV2
         HAFyYPodP9mo0TV+Rr5Fd7V5g0bKkdAqX72vbJF/APS7f7lXd6KHn71gFyeJeHpHlU1c
         vTsg==
X-Forwarded-Encrypted: i=1; AJvYcCXdnl903jMgXxqxxMDgVgV0mOwUxcK0k7kqBpFCTMt3mIg3WlSG0aZX7jUnHcGfVLz+aIh+TdDCD46/Zz6Kdf6q@lists.infradead.org
X-Gm-Message-State: AOJu0YwQeYAZ4Y0k6S/SNXaFs99L6j92iIOj3bkeW/Dh6vkdIbyCnKD1
	3zMu4irh7hJFQQKqlSflsZYKmwM2X79Pits5ND6AiZB5sxP/9WGu32dEwHRQJIxXF3GqcWLxfM8
	61twLyvJtcXEdiwxGuzkueYj/ivAyXWLFZUe6FUBEt0rIw1ANP72WmVHPIuLFgb0h2F0wFUk+A6
	MnTxY4
X-Gm-Gg: ASbGnctSonWN+rWhe8Gj954GyF2p6DKHO4Vq52/TlBJoiPDC1B9WRz3zVyyea28hfS+
	Kz12+YdM+ixYr/7xhsH2peLsXpCBmH5h/2X3s7Bra3nPlkMI+NwfQ09R8DBVEtWA+Xm7BBXVd4e
	4DndyObNYVVIQj873Y9wD6WnpJa0Dyey4nj1gnv19E/0DwpqjBB8dqPetDMxCb4N/nozugQifBf
	d2FLtdnSanIhWX43Hl5uupj9uI4W2l1SvUiP3wAbvIsUXRd8K7nX2fW/FG0z03zexTR41cIw8nF
	pOl+lp0Tkfcl4AXAjmBe/8Mib3I9dfDYVixz15IvFypqPw==
X-Received: by 2002:a05:600c:5488:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-43d50a31981mr32999235e9.21.1742581096866;
        Fri, 21 Mar 2025 11:18:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4hjspn7nFbirV1vOF+PWolmKka8uULS32ZeHXEmfN9pXrlTOZAy5VVuhKwl33XEm7itFSrQ==
X-Received: by 2002:a05:600c:5488:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-43d50a31981mr32999005e9.21.1742581096493;
        Fri, 21 Mar 2025 11:18:16 -0700 (PDT)
Received: from [192.168.88.253] (146-241-77-210.dyn.eolo.it. [146.241.77.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f3328bsm84371215e9.1.2025.03.21.11.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 11:18:16 -0700 (PDT)
Message-ID: <2d39033d-0303-48d0-98d3-49d63fba5563@redhat.com>
Date: Fri, 21 Mar 2025 19:18:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: airoha: Validate egress gdm port in
 airoha_ppe_foe_entry_prepare()
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
References: <20250315-airoha-flowtable-null-ptr-fix-v2-1-94b923d30234@kernel.org>
 <b647d3c2-171e-43ea-9329-ea37093f5dec@lunn.ch> <Z9WV4mNwG04JRbZg@lore-desk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <Z9WV4mNwG04JRbZg@lore-desk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ChpHDwXW5OBV5nobZle10hp39wXY5tBTDnRRkpSiYCc_1742581097
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_111822_631686_67FA6301 
X-CRM114-Status: GOOD (  15.34  )
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

On 3/15/25 3:59 PM, Lorenzo Bianconi wrote:
>>> Fix the issue validating egress gdm port in airoha_ppe_foe_entry_prepare
>>> routine.
>>
>> A more interesting question is, why do you see an invalid port? Is the
>> hardware broken? Something not correctly configured? Are you just
>> papering over the crack?
>>
>>> -static int airoha_ppe_foe_entry_prepare(struct airoha_foe_entry *hwe,
>>> +static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
>>> +					struct airoha_foe_entry *hwe,
>>>  					struct net_device *dev, int type,
>>>  					struct airoha_flow_data *data,
>>>  					int l4proto)
>>> @@ -224,6 +225,11 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_foe_entry *hwe,
>>>  	if (dev) {
>>>  		struct airoha_gdm_port *port = netdev_priv(dev);
>>
>> If port is invalid, is dev also invalid? And if dev is invalid, could
>> dereferencing it to get priv cause an opps?
> 
> I do not think this is a hw problem. Running bidirectional high load traffic,
> I got the sporadic crash reported above. In particular, netfilter runs
> airoha_ppe_flow_offload_replace() providing the egress net_device pointer used
> in airoha_ppe_foe_entry_prepare(). Debugging with gdb, I discovered the system
> crashes dereferencing port pointer in airoha_ppe_foe_entry_prepare() (even if
> dev pointer is not NULL). Adding this sanity check makes the system stable.
> Please note a similar check is available even in mtk driver [0].

I agree with Andrew, you need a better understanding of the root cause.
This really looks like papering over some deeper issue.

AFAICS 'dev' is fetched from the airoha driver itself a few lines
before. Possibly you should double check that code.

Thanks,

Paolo


