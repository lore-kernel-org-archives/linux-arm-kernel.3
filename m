Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C62C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 01:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPvO5ea4bJ3AEPNPYkVWBmgC2/crRwDDiQRw7JYiRc0=; b=q2KZwtASMD6M6GOmLmjkgrIWlQ
	6YSTkDdiGbdQob25M1KatzYgNRMJhUU6eT0rBypVhbP/3q6+514ohiHGNBjU4QVkTgQcLM/kZC+sh
	nbtFHY5kPwlkHpXlHyFqQ1IR8qClclCSFLmDlA/9bCuTZUSLn9Lh/Cvvix/ZUdP1WT2v7LVdYCRAS
	Sjgp0IhhwQ3vgFOz2f0COQFdBMNDOeBED0pjjCsOgCvBEds4k9two3cj51ph6LMy1LiDzIHtmZQV0
	8KaDOGnPZT7PlUnMYXWm8sHyQtrcJ5HgBmVX8pt8SJI8uw/LFM7ZWAKTTFH752qJt3kIK2ib+nVkR
	mipXyEWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKSDs-0000000EfQV-3xwT;
	Thu, 29 May 2025 01:38:20 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKSBh-0000000EewL-1bUS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 01:36:07 +0000
Message-ID: <51768fa6-007e-4f30-ac1f-eed01ae1a3c5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748482557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPvO5ea4bJ3AEPNPYkVWBmgC2/crRwDDiQRw7JYiRc0=;
	b=SI9oJffrQhJFzwVRI6hy+E981adGUz2hteYYf8fv/sQWmJIRMo03ZeEUEayJQ+OSmrRmQF
	aL9NacS00yCzFi3hTqHqhiFDvIg6tNPvYNsbL6ljM5L9GHmyrx+Ck8QTLLd5LilVp/5q6n
	PVLBXK9IeoWaseY3eISs0IaVaHE3LY4=
Date: Thu, 29 May 2025 09:35:36 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next v6 0/5] net: stmmac: Add PCI driver support for
 BCM8958x
To: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
 Andrew Lunn <andrew@lunn.ch>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, richardcochran@gmail.com,
 ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, fancer.lancer@gmail.com, ahalaney@redhat.com,
 xiaolei.wang@windriver.com, rohan.g.thomas@intel.com,
 Jianheng.Zhang@synopsys.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
 linux@armlinux.org.uk, horms@kernel.org, florian.fainelli@broadcom.com,
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>
References: <20241018205332.525595-1-jitendra.vegiraju@broadcom.com>
 <CAMdnO-+FjsRX4fjbCE_RVNY4pEoArD68dAWoEM+oaEZNJiuA3g@mail.gmail.com>
 <67919001-1cb7-4e9b-9992-5b3dd9b03406@quicinc.com>
 <CAMdnO-+HwXf7c=igt2j6VHcki3cYanXpFApZDcEe7DibDz810g@mail.gmail.com>
 <7ac5c034-9e6d-45c4-b20a-2a386b4d9117@quicinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <7ac5c034-9e6d-45c4-b20a-2a386b4d9117@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_183605_648050_DDD3F05A 
X-CRM114-Status: GOOD (  14.16  )
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

在 5/28/25 8:04 AM, Abhishek Chauhan (ABC) 写道:
> 
> 
> On 2/7/2025 3:18 PM, Jitendra Vegiraju wrote:
>> Hi Abhishek,
>>
>> On Fri, Feb 7, 2025 at 10:21 AM Abhishek Chauhan (ABC) <
>> quic_abchauha@quicinc.com> wrote:
>>
>>>
>>>
>>> On 11/5/2024 8:12 AM, Jitendra Vegiraju wrote:
>>>> Hi netdev team,
>>>>
>>>> On Fri, Oct 18, 2024 at 1:53 PM <jitendra.vegiraju@broadcom.com> wrote:
>>>>>
>>>>> From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
>>>>>
>>>>> This patchset adds basic PCI ethernet device driver support for Broadcom
>>>>> BCM8958x Automotive Ethernet switch SoC devices.
>>>>>
>>>>
>>>> I would like to seek your guidance on how to take this patch series
>>> forward.
>>>> Thanks to your feedback and Serge's suggestions, we made some forward
>>>> progress on this patch series.
>>>> Please make any suggestions to enable us to upstream driver support
>>>> for BCM8958x.
>>>
>>> Jitendra,
>>>           Have we resent this patch or got it approved ? I dont see any
>>> updates after this patch.
>>>
>>>
>> Thank you for inquiring about the status of this patch.
>> As stmmac driver is going through a maintainer transition, we wanted to
>> wait until a new maintainer is identified.
>> We would like to send the updated patch as soon as possible.
>> Thanks,
>> Jitendra
> Thanks Jitendra, I am sorry but just a follow up.
> 
> Do we know if stmmac maintainer are identified now ?

I'm curious why such a precondition is added？


Thanks,
Yanteng

