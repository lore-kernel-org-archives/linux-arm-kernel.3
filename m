Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59179C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 05:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Pk1Eb2vSHZbYbbZLyo5U1NwioDIXYgsUp9ezTkNplY=; b=m8DElNWlzeAX3ZhHmuMNjI+fE0
	kGtgcfGtUYmFfKfmaIFmonrtDTannTqMH1EF56LOw5n4pQybZTGryzzXLV2HPq4FsJ1/0VNGi0CK2
	a896DcY7jNsW4XHtii0RXzROeNaeC1wbFD0uWS76DM7QXCI/xIV0fGjg++i5Th4yy0qJLskfZBcHf
	ga1YJPs1nWf4F2vNY46TVBGl+8S61wjDxxmHkrSdyh/17NeWZkER/j+z13WU1rpg+PCAVZb5GiD1t
	wI/G8/UFH8m3yPvQQpeIkFundxEnMoOBWRZ0qTln7hssQYMSUOyE1knwWYN9B0sKdXhRU/USNxAAE
	VBFyFSow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKVeA-0000000ExvZ-1D4v;
	Thu, 29 May 2025 05:17:42 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKVbz-0000000Exjo-0X0H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 05:15:28 +0000
Message-ID: <eb591c65-0106-45f4-9e57-434dac54e923@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748495722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Pk1Eb2vSHZbYbbZLyo5U1NwioDIXYgsUp9ezTkNplY=;
	b=ObYYFtehliQgfdv9YsufkQYdreAjIYc0E64+xUmOXpyZAGLUi3KQ5qjBDKGKhGQbr2gXbl
	+Ckk8pCdISYyqIC+bjZEqZ7+pMCxl2Ism9o12gOkQVTM0OVV0O9pH/x0Izj/T+Ru3xfAPq
	s7AfyOVLoGxpdbAhyE7WWpwl1QlON9Q=
Date: Thu, 29 May 2025 13:14:32 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next v6 0/5] net: stmmac: Add PCI driver support for
 BCM8958x
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Cc: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>,
 Andrew Lunn <andrew@lunn.ch>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 netdev@vger.kernel.org, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com,
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
 <51768fa6-007e-4f30-ac1f-eed01ae1a3c5@linux.dev>
 <CAMdnO-KNfH79PG1=21Dbyaart2JN_e1XcF+tTG93BG5BobX+Gg@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <CAMdnO-KNfH79PG1=21Dbyaart2JN_e1XcF+tTG93BG5BobX+Gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_221527_313239_7D5B7AAD 
X-CRM114-Status: GOOD (  27.09  )
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


在 5/29/25 10:56 AM, Jitendra Vegiraju 写道:
> Hi Yanteng,
>
> On Wed, May 28, 2025 at 6:36 PM Yanteng Si <si.yanteng@linux.dev> wrote:
>> 在 5/28/25 8:04 AM, Abhishek Chauhan (ABC) 写道:
>>>
>>> On 2/7/2025 3:18 PM, Jitendra Vegiraju wrote:
>>>> Hi Abhishek,
>>>>
>>>> On Fri, Feb 7, 2025 at 10:21 AM Abhishek Chauhan (ABC) <
>>>> quic_abchauha@quicinc.com> wrote:
>>>>
>>>>>
>>>>> On 11/5/2024 8:12 AM, Jitendra Vegiraju wrote:
>>>>>> Hi netdev team,
>>>>>>
>>>>>> On Fri, Oct 18, 2024 at 1:53 PM <jitendra.vegiraju@broadcom.com> wrote:
>>>>>>> From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
>>>>>>>
>>>>>>> This patchset adds basic PCI ethernet device driver support for Broadcom
>>>>>>> BCM8958x Automotive Ethernet switch SoC devices.
>>>>>>>
>>>>>> I would like to seek your guidance on how to take this patch series
>>>>> forward.
>>>>>> Thanks to your feedback and Serge's suggestions, we made some forward
>>>>>> progress on this patch series.
>>>>>> Please make any suggestions to enable us to upstream driver support
>>>>>> for BCM8958x.
>>>>> Jitendra,
>>>>>            Have we resent this patch or got it approved ? I dont see any
>>>>> updates after this patch.
>>>>>
>>>>>
>>>> Thank you for inquiring about the status of this patch.
>>>> As stmmac driver is going through a maintainer transition, we wanted to
>>>> wait until a new maintainer is identified.
>>>> We would like to send the updated patch as soon as possible.
>>>> Thanks,
>>>> Jitendra
>>> Thanks Jitendra, I am sorry but just a follow up.
>>>
>>> Do we know if stmmac maintainer are identified now ?
>> I'm curious why such a precondition is added？
>>
> It's not a precondition. Let me give some context.
> This patch series adds support for a new Hyper DMA(HDMA) MAC from Synopsis.
> Many of the netdev community members reviewed the patches at that time.
> Being the module maintainer at that time, Serge took the initiative to
> guide us through integrating the new MAC into the stmmac driver.
> We addressed all the review comments and submitted the last patch series.
> Without an official maintainer, we didn't get feedback on the last patch series.
> Because of this, we wanted to wait until a new maintainer is assigned
> to this module.
> As Abhishek expressed in his email, it appears the HDMA MAC is
> becoming more mainstream.
> We are hoping to rebase the patch series and resubmit for review if
> netdev team members show interest.


https://lore.kernel.org/netdev/20241018205332.525595-1-jitendra.vegiraju@broadcom.com/

In my opinion, the precondition for waiting for a maintainer is that

the patch set has passed the review. I checked lore and did not find

any R&B tags in the patch set, which means your patch set has not

yet met the merging requirements.

Therefore, I think you can continue to push forward with this patch

set and not let it stagnate. I will take some time to review the previous

versions (which may take a while) and hope to be helpful.

Thanks,

Yanteng

> Thanks,
> Jitendra
>> Thanks,
>> Yanteng

