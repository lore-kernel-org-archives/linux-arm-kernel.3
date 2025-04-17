Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFB4C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 09:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GfMQK4BWJGxmnVTgDrQuVVqoMNetehKp2lZCVxuF/w=; b=RWcV/5G/QMGQIdsZKS0w85F2+k
	l7vMJeVJY9pCiLUoCvGXdd0jFSqbcqpERzQgpr3UNJCarq7e1Exh9eMbkUeQFjI2+ji3MctwwTTYf
	+67S2d07QMDfH9bgAQjTYKyQLtMRLEJ8jflL+SoZwwZbSZJHJcjyWsGv7OBDYj7qzzubkk5BfrKOL
	o9tC5sJ3ycD8MsNg/vMyjNxcb1ofldDuWKx9bqzp8slvQWLB3yHMP1z7ISN/lELVbDLwiv1m5dzc6
	GNhecKpylzGTijKdJ9u/Gjf3+3L4GESkfNRVSmwOsO1JpQ+Um0phd5R7U1bOaPaOAU4Lf+jdEAw2N
	0bai+nXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LJo-0000000CP53-0nCu;
	Thu, 17 Apr 2025 09:14:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5L5z-0000000CMTt-44yU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 08:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744880382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4GfMQK4BWJGxmnVTgDrQuVVqoMNetehKp2lZCVxuF/w=;
	b=GdlwYOr8wflWSbycV4CnbwvaUgO7rkIB58TN6qhrBAG5GhYsT/jcUGimvaNlNUiWID+SKY
	Hpq2nhYqsC2kxOLCJObtUWziLuBwgB7zHP5bA37EiLuEFepw4Bo7+ZFpmk3ZtNujqzkto8
	SQdJoZXD6qj/Nktf4scw3m0FHuljrvY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-xTL1RtfnNK6hgI_vDsR3Ng-1; Thu, 17 Apr 2025 04:59:40 -0400
X-MC-Unique: xTL1RtfnNK6hgI_vDsR3Ng-1
X-Mimecast-MFC-AGG-ID: xTL1RtfnNK6hgI_vDsR3Ng_1744880379
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so2838685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 01:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744880379; x=1745485179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4GfMQK4BWJGxmnVTgDrQuVVqoMNetehKp2lZCVxuF/w=;
        b=mkT9DasawYu9YbSJTQ2zYorWCxf5wg4y7kqnSAa8CyDGDHKxIvyMl0fyIIxvJSXRUq
         tfCv47IJOjXlRHyj6UU++s54bkkS4XVIreTJVazPengD6TWZY+hN7M4o7EQcKAqHoYbJ
         DGsD8M0nP6k7ru1x4IghWcqwW7J8EUvy9jg0ZahRkaRmLg8XCuqlpBXla9wXGROeoAXO
         qPdy19hxsZapM2IFx/X/arnwcElgzNR0WA30jsXj4Fke7NELOg4eECl9A3GYbo8mEiK0
         hKTZjKPOnB3ZOA+pKX5gy7ShUgQq/t1REx5YkeVKGhaSvdygopswH7F0LeaMcschfAY2
         NdXA==
X-Forwarded-Encrypted: i=1; AJvYcCWmhvbe7YeDw85IV8i9lZbMCFmHO8ucwkclz7Zt6SZFefNFIagNGpFIa6p9VTFU4MvqWbFy3RnCFKr/fIfLKg1c@lists.infradead.org
X-Gm-Message-State: AOJu0YytTcKrzsb+4WowLYfbHHx1dd/ltsMOMtOnICR/C6onZVKwQyOO
	tWGqOIt3RqS8ZMuMIPwGtWduP1KeARyLx39E/qm+GMchP0Q6AZ4bi5K9/lTOK8KFZLnIcjO/Yvk
	oogP/usLXg+dwg+7mTrpukEw79UT2IqTHWGvZmDmsAawiG2un20M7XQho6I1AUAL74U08NW7Z
X-Gm-Gg: ASbGnct2dKbtprKl65Mz18aspKs7mnX8wnFr/8yi9CAufgzU2/BfzZsdhS8zxlqK5DY
	7d+SqXBI4W81EHpaUwAkMlUnVcIWKwR1uWMFhpeDSRshMjTwTEbYXM/o2BMQ/jhR9rKZSjAoxgr
	ZItCMqbonq/z/eDLhEZhoK9My1nuyE8u1KzO7SupFPkVq5l/lVAeofgzehRfaHz97DMh0nAb/hU
	4WMA0pDGTDCPcB1ZLcEAuSOuR3MEQkTbFnHDNygKo6B27Aa9uv0bTIdCPI1azq7ljjBqrvf4rQY
	iu3B29fY7ymM3FEOZe/q97dbaL3S6bf6NSUAap6AfA==
X-Received: by 2002:a05:600c:c89:b0:440:5997:681c with SMTP id 5b1f17b1804b1-4405d5fd8fcmr57027485e9.3.1744880379532;
        Thu, 17 Apr 2025 01:59:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6wnoEhMMEIcc2dVSD2Mi0/kYEuwxhffSm8Wyq9VeUY0iDYrT0ML62tAYo917pqBiSRXl7IA==
X-Received: by 2002:a05:600c:c89:b0:440:5997:681c with SMTP id 5b1f17b1804b1-4405d5fd8fcmr57027275e9.3.1744880379179;
        Thu, 17 Apr 2025 01:59:39 -0700 (PDT)
Received: from [192.168.88.253] (146-241-55-253.dyn.eolo.it. [146.241.55.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c817dsm45422165e9.4.2025.04.17.01.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 01:59:38 -0700 (PDT)
Message-ID: <ba5b4313-6e42-4340-8301-239dac046424@redhat.com>
Date: Thu, 17 Apr 2025 10:59:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: airoha: Add missing filed to ppe_mbox_data
 struct
To: Lorenzo Bianconi <lorenzo@kernel.org>, Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
References: <20250415-airoha-en7581-fix-ppe_mbox_data-v1-1-4408c60ba964@kernel.org>
 <20250416154144.GT395307@horms.kernel.org> <Z__S_m9fBEKmoos1@lore-desk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <Z__S_m9fBEKmoos1@lore-desk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GTSZR7tUbx8VC9woZKeMEUioxIJOyzlg-L8Wgpx3R5g_1744880379
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_015944_084414_BE76F3D7 
X-CRM114-Status: GOOD (  22.06  )
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

On 4/16/25 5:55 PM, Lorenzo Bianconi wrote:
>> On Tue, Apr 15, 2025 at 09:27:21AM +0200, Lorenzo Bianconi wrote:
>>> The official Airoha EN7581 firmware requires adding max_packet filed in
>>> ppe_mbox_data struct while the unofficial one used to develop the Airoha
>>> EN7581 flowtable offload does not require this field. This patch fixes
>>> just a theoretical bug since the Airoha EN7581 firmware is not posted to
>>> linux-firware or other repositories (e.g. OpenWrt) yet.
>>>
>>> Fixes: 23290c7bc190d ("net: airoha: Introduce Airoha NPU support")
>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>>> ---
>>>  drivers/net/ethernet/airoha/airoha_npu.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
>>> index 7a5710f9ccf6a4a4f555ab63d67cb6b318de9b52..16201b5ce9f27866896226c3611b4a154d19bc2c 100644
>>> --- a/drivers/net/ethernet/airoha/airoha_npu.c
>>> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
>>> @@ -104,6 +104,7 @@ struct ppe_mbox_data {
>>>  			u8 xpon_hal_api;
>>>  			u8 wan_xsi;
>>>  			u8 ct_joyme4;
>>> +			u8 max_packet;
>>>  			int ppe_type;
>>>  			int wan_mode;
>>>  			int wan_sel;
>>
>> Hi Lorenzo,
>>
>> I'm a little confused by this.
>>
>> As I understand it ppe_mbox_data is sent as the data of a mailbox message
>> send to the device.  But by adding the max_packet field the layout is
>> changed. The size of the structure changes. And perhaps more importantly
>> the offset of fields after max_packet, e.g.  wan_mode, change.
>>
>> Looking at how this is used, f.e. in the following code, I'm unclear on
>> how this change is backwards compatible.
> 
> you are right Simon, this change is not backwards compatible but the fw is
> not publicly available yet and the official fw version will use this new layout
> (the previous one was just a private version I used to develop the driver).
> Can we use this simple approach or do you think we should differentiate the two
> firmware version in some way? (even if the previous one will never be used).

I think it's better if you clarify the commit message. I read the above
as the current (unpatched) code will not work with the official
firmware, so bug addressed here does not look theoretical.

Thanks,

Paolo


