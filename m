Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48927CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 12:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKVTpr4aNyZx4lSh79VinADzKQEIbf4Ts/2xtaUoVwc=; b=v9x6WVwkzMbUenhGT6FjORbVhR
	SFmFf8hWtO9/rlr9ugDXazCCd/ZGUQ8bsUVJ7WGTGu2rQIy3ZEJnJ06PWAW3lAmrVW8QpqidAYb9b
	4wTqBTYlrvfeuia1kIU/F4DqI9TBYAE3mlfKJyttLKrdRASCImevXkdFJWMnRKX2+FZWPmbyybNTl
	UjLkrNBKX5EkqsTdUoM4si0ZOu4qatnb8A0ZmcnIKPGq4u4mvzl9/ihblZ+NvYVuAu2Egbztuip1X
	m+6Rr0+bOnF0zCK41pXN3kO1fl/NqmmAyRFv+avoRjMHZPhqYUaV5+klFhNfLVKCSaq8OCQZy6iy7
	3NsC2Iiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXeLf-00000009NTW-2Vjg;
	Thu, 11 Jun 2026 12:17:27 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXeLc-00000009NSj-1lLc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 12:17:26 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so6600938a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 05:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781180243; x=1781785043; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xKVTpr4aNyZx4lSh79VinADzKQEIbf4Ts/2xtaUoVwc=;
        b=Zq34GC3lPuXpWZlSum/dtsS65wH+rx6G7sodqUq8AMQ6LhyTgot8TvZP+IHth5ZdQG
         ZtyMdWF5yPHmpXQ4jlDyTjE5ivnLT4Otn4PV3CKd7l1LM5mlrX8xUAbpvULLMZF4KGVD
         fjRFzVNc7vA3NO261tzCPw4EZUApTYEi0k5d03yxw8zbQ7rb/+0Gc2lEvP1X6HndsCwc
         0ZHpKJpBp4X2FgzpSnBqF9WyIP853uj/J4ASaCWNniX9hereSB7YBes47rwkzU8YXsLh
         47s/BfJqZCAfCxmjeT2NCVecA2nSmxJalSus1Slppv+aEYDr/AZ8zwRnvDc5cJ/zDxEt
         Iwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180243; x=1781785043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKVTpr4aNyZx4lSh79VinADzKQEIbf4Ts/2xtaUoVwc=;
        b=cbIlN2ypOExxVlL5to9jKdgL6FAzrdCK61Lqse2g3ghGdaQDA5h4doiS03fWLFepHd
         45xd+HKI3463jzGyEv6EeFWmBji7CsSaU94CVaEMdpLwEqVomqvy7E8VJN8tnPeYOC2d
         Rxr9aApGojCS1Nq+7WDPOroetodMygt6mNKeLFKrvWTQnihKPugTXXHd4fRNTMcWGPo7
         G8dsacaJPa+K1OHxm7M9U/D8vbQAhjqS5gHuvJ85BfWdYbV9DpRcicUKlrfdoeMXLYea
         w51H5+9usHHrTfKibsITH/XVHJWzBAiK2wJ464YX/SetUKYAB0JJ4AxePFkfTSeGmiNx
         rrPg==
X-Forwarded-Encrypted: i=1; AFNElJ8AdVDjDSDIlvmGyndLifzNeoiNHUt3qylKI2SQ+/dmNZbwQ6o/2MHCfUHgk2fgpuQInp4t699ckwf+XJg2TBeM@lists.infradead.org
X-Gm-Message-State: AOJu0YyzIhSUHD4AZ4cLaE/A9PONFOVnZtJ81L3WgP3heyUlrPpwyJc3
	UMAg+y91X3D8zxl4o+TWI9YHkCV7jv37BGDbyDplg3tH7jEFOZm+Gyul
X-Gm-Gg: Acq92OHTkbY6Bobr8FrWrS1WO91RVNkp20asiKU8ZHo3mW1SgO6U2fAoG5s6PqQM1n9
	tM3wMXR7znxsN+F4U9upGreRRY9WOkZEREW4ukJC+AeIfG0CcFz+nemedqFNdtTRs1DKwwNdQ5p
	RbsTiurdQm9WrB0w1nqQfawzFsATYTW/aqUIl2b+aerlwA0PlKutJ5DaEquUpo9O3EIMsLN+qxF
	S3IZ/UyD7bsK3kjNLUqoUWZHX3zLgJ/HnTZete1pkTrdHbYbr6InO6krgI1L1bJgxUUUCEoVzF0
	zMhnLx/YzdaCKR4O37F/q3ETlmMhkufhqUMnLQwmDngB8cE6ojWcnZUvefR6LcqJC5SNsnab29k
	ZzjqWMk0Rm231/YrfZP67a4CSlprCtOuuDoBzvNvLn9oSwg7Mw+9ZFPWIVCGNI2s/YpGNp2zKuz
	qdpjpLQwLBx+NO/sH3s1PKyURmy3kRBoPe7IiUvv0DanL6DkcOrWRf
X-Received: by 2002:a17:90b:5607:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-3779d7a1208mr3111460a91.7.1781180242867;
        Thu, 11 Jun 2026 05:17:22 -0700 (PDT)
Received: from [192.168.89.2] ([27.232.220.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3775558f317sm2486069a91.9.2026.06.11.05.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:17:22 -0700 (PDT)
Message-ID: <bfc283bc-a5db-4e96-a447-e8e79cc97d34@gmail.com>
Date: Thu, 11 Jun 2026 21:17:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] crypto: inside-secure: add EIP93 ESP packet backend
To: Simon Horman <horms@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260523121522.3023992-1-hurryman2212@gmail.com>
 <20260523121522.3023992-3-hurryman2212@gmail.com>
 <20260527100824.GJ2256768@horms.kernel.org>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <20260527100824.GJ2256768@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_051724_471066_1CDED86F 
X-CRM114-Status: GOOD (  23.57  )
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



On 5/27/26 19:08, Simon Horman wrote:
> On Sat, May 23, 2026 at 09:15:21PM +0900, Jihong Min wrote:
>> Expose an EIP93 packet-mode IPsec backend for netdev drivers that need
>> ESP encapsulation and decapsulation offload without advertising EIP93
>> itself as a netdev.
>>
>> Add provider selection, capability reporting, SA lifecycle management,
>> IPsec request completion, and provider fault notification around the
>> existing EIP93 descriptor path.
>>
>> Assisted-by: Codex:gpt-5.5
>> Signed-off-by: Jihong Min <hurryman2212@gmail.com>
> 
> ...
> 
>> diff --git a/drivers/crypto/inside-secure/eip93/eip93-ipsec.c b/drivers/crypto/inside-secure/eip93/eip93-ipsec.c
> 
> ...
> 
>> +static void eip93_ipsec_abort_requests(struct eip93_ipsec *ipsec, int err)
>> +{
>> +	struct eip93_ipsec_sa *sa;
>> +
>> +	while (true) {
>> +		bool found = false;
>> +
>> +		spin_lock_bh(&ipsec->lock);
>> +		list_for_each_entry(sa, &ipsec->sa_list, node) {
>> +			spin_lock(&sa->lock);
>> +			if (sa->aborting) {
>> +				spin_unlock(&sa->lock);
>> +				continue;
>> +			}
>> +
>> +			sa->aborting = true;
>> +			found = refcount_inc_not_zero(&sa->refcnt);
>> +			spin_unlock(&sa->lock);
>> +			if (found)
>> +				break;
>> +		}
>> +		spin_unlock_bh(&ipsec->lock);
>> +		if (!found)
>> +			return;
>> +
>> +		eip93_ipsec_abort_sa(sa, err);
>> +		eip93_ipsec_sa_put(sa);
> 
> sa is the iterator for the list_for_each_entry loop.
> However, here it is used outside of that context.
> 
> 	"If list_for_each_entry, etc complete a traversal of the list, the
> 	iterator variable ends up pointing to an address at an offset from
> 	the list head, and not a meaningful structure.  Thus this value
> 	should not be used after the end of the iterator.
> 
> 	https://www.spinics.net/lists/linux-kernel-janitors/msg11994.html
> 
> Flagged by Coccinelle.
> 

Hi Simon,

Thanks for the feedback, and sorry for noticing this mail so late.

Your point is correct. The `list_for_each_entry()` iterator should not
be used outside the loop like that. If I continued with this series, I
would fix it by keeping a separate selected SA pointer before dropping
the lock.

At this point, though, I think the right thing is to withdraw this
EIP93/Airoha series.

The reason is that many Airoha SoCs also have a higher-performance IP
block called SOE (Secure Offload Engine). I recently wrote and tested a
driver for that block, and I am currently carrying it here: [kernel: add
bonding LAG XFRM offload infrastructure and Airoha
support](https://github.com/hurryman2212/OpenW1700k-test/commit/fbfe8f919f836bb62b3849f803865a4d9b8dc76f).
With the EIP93 path I could get around 1 Gbps, while the SOE path can
reach about 5 Gbps in my current setup. Because of that, integrating
this EIP93 ESP packet path directly into `airoha_eth` is no longer the
most useful direction for Airoha Ethernet.

That said, SOE exists only on some Airoha SoCs. EIP93 can still be
useful on other platforms as a look-aside ESP packet offloader, but I
think that needs a cleaner infrastructure than this series had. The
look-aside offloader should be able to live as a separate module, not be
tied directly to one specific netdev driver, while still allowing
compatible netdevs to attach it into the XFRM path. I think that needs a
more general infrastructure extension, so I would rather revisit the
EIP93 work later on top of that kind of model.


Sincerely,
Jihong Min

>> +	}
>> +}
> 
> ...


