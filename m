Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB6CCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QksT58lJYyQue7qfj5sBxd5t1SOILKVGpmQ75/i+2ow=; b=AVLiFnZPXe6tzJocEo1B4hj+QI
	QbJjyHlS+6RHP+4zDCHFG/9r3OXKcyU8pjUMFP9etf89h9udqnXR18rFVDBnr8Y5C2he2//tUEbOa
	v+stGx/COjxiJR/TeJRZvYp+mQ4viCXUTnJkCb4Q5p96gcDrAKy1oRltFf0pPLY3k6rqKAurXhdmt
	rjjCnldBOc/IPDw+dzMXW46kM//sFepgBZe9kc8MmXy9F/wXRIS9YUg7rM0OScXO1FtcZhrOXihSO
	KLBv0AmtSy3VEmaYBWi3V1j8G89/tAzHIN5mhy91GI9zKVft46ers8maoKD4KmgjXBSKOj1C2hRR3
	DV/PDezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uturh-00000007dQY-30ML;
	Wed, 03 Sep 2025 21:18:01 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utq6h-000000071Aj-3MNS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 16:13:13 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-24622df0d95so909615ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 09:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756915990; x=1757520790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QksT58lJYyQue7qfj5sBxd5t1SOILKVGpmQ75/i+2ow=;
        b=d6mjR31BGH5/8Ul0nwHkbC9cTKxT92nCdf5gSsTRDEokIfqof/Y4R6HYjPBiiIlsou
         dm4zjZRIB8+1WkesG9SFynQe8kcaEMEzHSkEFEHZzSgtzNkbPthxDAPKjpiNaQtnMvpf
         ZlZZPzUIj4gYkFaTz3xr2JnC+mAYby8M8OmEobKbthjqgh+tqPXiQbRiWxe/Uaq1hvo1
         OEUHnG+bKDOoQLYJwjhkMPqhDYs9sAMOojNmvKCf07a9ZYXD+Ds3w8Oi7t7iow6xp1iD
         3mRhexxkCzo02iMC5UQFagq+6zHpAHl3xc5AuDidzhe4/hhQHYbhI+czrt6au5yxGIIx
         QV9w==
X-Forwarded-Encrypted: i=1; AJvYcCUINWljzsQMwRei/8R1B5qaR5GGm24CkNZo8+h3ahrCuBPOnwTCZBH4lfSyi+yubxgJUBAeAEMTmyi9ILXjSSly@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9DsDxrKjgBJmkvzBblxv3BRDsCzSq1ApL1b0sSJ0SHgYXYAmJ
	iWzHAX/cp9igfvK9e+tTQ3YW127mFeatDpjuOGfWyRJ738uB1iVS+VKYGD2Y7hmYR94arZWH9NW
	4vrM+sHa2wdbWMcMpPMEQi1djyFdHVf38cLybHchrVL7r4Cnuq0gEm/rJwPA8HS0rdYghlGNdnl
	ns4COAYzPBaA1ZCIGpHJ5Ghqs0qMf2MK8ODr9QFK1V5uyduyqS6hsum+M90To7qvDycYxkIw09F
	rmIHZLz+oAL1eA4pjLsWgp5y4vfQyGqjik=
X-Gm-Gg: ASbGncvzbVf0hqANuJOBNJjq7X2noR8w7Q/RF8piBFt7Rt2y6eWhuHnH/c90dMFnLWt
	NcCYSX8tOcW/m1YNYdqQOUJ/V3iBRpsZEZXrRM/2L4BrtU+gzl0csQC0uXiu6sAIuvRIC6PBaRE
	A8pa1lWyfO6sibKzQ2djDdhtWmDX7cqLFvQ+mmhZDfvIQbvVb1jBCT5hlsiwS/oUcz/uX3Rm1Di
	8KN2/uaTk1yBhR8RsvZkIC57vvW4GqmhaRYBsUbhZ0ESqQPCUfMOW2Mx60qCYVcrUR9eFiDkvXD
	3Mn7CXtBHoFoq1sAy1YA5RCdhYJ5H+ymvctj9ULACIVef1JPh6o6GOTAoZfeCKv/pBEZ4syrEgb
	LLjTYHPXBGNu5RYlAwJ3nPN5PD/IedBDxRxb8iXbXNOfSn3jXU+FEEVfjdWu5IXyBVbQ9nTKElc
	eIPhRs
X-Google-Smtp-Source: AGHT+IFYd4lWz+XVG2ufg7HJEi1d6J232NqQIxRi6ds/dqkf9dizBDKJAyGpaSG7tefbbhurdjZfgC5JqThq
X-Received: by 2002:a17:902:cf07:b0:240:3239:21c7 with SMTP id d9443c01a7336-24944aa1e6dmr208301945ad.37.1756915989813;
        Wed, 03 Sep 2025 09:13:09 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2490375f600sm12555265ad.18.2025.09.03.09.13.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Sep 2025 09:13:09 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8080713fa17so16232885a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 09:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756915989; x=1757520789; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QksT58lJYyQue7qfj5sBxd5t1SOILKVGpmQ75/i+2ow=;
        b=XD8kTZTCPNaQtLOde7xpOzDidWfFpieOVAHaKi10/9xVuj798IuGn8II4+mWJbfCSn
         z/UvtiPc3M7LU7A3FAnPga1JXk1lprEybMAAKQW87FNKWPtVNww/+sxCGK7UdCf04Xiv
         xt/iWGqCSK401wMsJI1OyDj0hbSAM4vYHwAMo=
X-Forwarded-Encrypted: i=1; AJvYcCXq5ojM4E35Y4g6dU0P6qYlyehrkqKrJgB+Bygbzd87RQq0lLSpam40k+KNqaFCmsxzzX8WyzQkNKjbQmgC6j4S@lists.infradead.org
X-Received: by 2002:a05:6214:3018:b0:70d:ae3c:b712 with SMTP id 6a1803df08f44-70fac78f732mr169448336d6.26.1756915988541;
        Wed, 03 Sep 2025 09:13:08 -0700 (PDT)
X-Received: by 2002:a05:6214:3018:b0:70d:ae3c:b712 with SMTP id 6a1803df08f44-70fac78f732mr169447226d6.26.1756915987413;
        Wed, 03 Sep 2025 09:13:07 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b644f2c9sm31043936d6.63.2025.09.03.09.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 09:13:05 -0700 (PDT)
Message-ID: <b266c39c-ae53-48dd-8fb9-0e05efca33d4@broadcom.com>
Date: Wed, 3 Sep 2025 09:13:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] include: linux: Destage VCHIQ interface headers
To: Stefan Wahren <wahrenst@gmx.net>, Umang Jain <uajain@igalia.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel-list@raspberrypi.com, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
 <20250827-vchiq-destage-v1-1-5052a0d81c42@ideasonboard.com>
 <20250827124016.GF5650@pendragon.ideasonboard.com>
 <we7tl65ijs44ae2zxfejmvnml3ls2pkfhcp2fqsmvec2eqevwm@yb45fs7nnf5s>
 <8ed6519a-6e45-4793-b11b-7b63c1703d6e@gmx.net>
 <910dae68-0545-46fa-b41f-8e4fb32ed649@broadcom.com>
 <c35ab51a-e9df-48f5-bc18-889980098d08@gmx.net>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <c35ab51a-e9df-48f5-bc18-889980098d08@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_091311_875882_C37C5FEC 
X-CRM114-Status: GOOD (  19.48  )
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

On 8/27/25 23:19, Stefan Wahren wrote:
> Hi Florian,
> 
> Am 28.08.25 um 04:17 schrieb Florian Fainelli:
>>
>>
>> On 8/27/2025 12:05 PM, Stefan Wahren wrote:
>>> Hi,
>>>
>>> Am 27.08.25 um 16:33 schrieb Umang Jain:
>>>> On Wed, Aug 27, 2025 at 02:40:16PM +0200, Laurent Pinchart wrote:
>>>>> Hi Jai,
>>>>>
>>>>> Thank you for the patch.
>>>>>
>>>>> On Wed, Aug 27, 2025 at 11:54:08AM +0530, Jai Luthra wrote:
>>>>>> From: Umang Jain <umang.jain@ideasonboard.com>
>>>>>>
>>>>>> Move the VCHIQ headers from drivers/staging/vc04_services/include to
>>>>>> include/linux/vchiq
>>>>>>
>>>>>> This is done so that they can be shared between the VCHIQ interface
>>>>>> (which is going to be de-staged in a subsequent commit from staging)
>>>>>> and the VCHIQ drivers left in the staging/vc04_services (namely
>>>>>> bcm2835-audio, bcm2835-camera).
>>>>>>
>>>>>> The include/linux/vchiq/ provides a central location to serve both
>>>>>> of these areas.
>>>>> Lots of SoC-specific headers are stored in include/linux/soc/$vendor/.
>>>>> This would be include/linux/soc/bcm/vchiq/ in this case. I'm also fine
>>>>> with include/linux/vchiq/ but other people may have a preference.
>>>> I agree with this point and I might have missed to notice the
>>>> include/linux/soc earlier. That's seems a better location to me since
>>>> it's actually broadcom-specific.
>>> I would expect that headers and source would be more related.
>>>
>>> For example:
>>>
>>> include/linux/soc/bcm
>>>
>>> drivers/soc/bcm/
>>
>> This is not Broadcom code, it is Raspberry Pi AFAICT, therefore, just 
>> like drivers/firmware/raspberrypi.c, we would need some namespacing 
>> here that reflects that, ideally.
> The VCHIQ code originally comes from Broadcom, but the current 
> implementation has been adapted and tested for Raspberry Pi. I'm not 
> against a Raspberry Pi specific namespace.

OK, that's a fair point, but it's not applicable to any other Broadcom 
SoC, more on that below.

> 
> Should this also apply to the DT bindings?

Ideally yes.
-- 
Florian

