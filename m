Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0675C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 17:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKMKXByJGIrq/+twwJxQjT7CC+V8NuPCfTdd5H+SUA4=; b=iSZ5I4OE7rwyR4D8wpQaIl6c//
	bwoskF1WwuOYXN+Mb9wAEdOm0fzDgxHSP81pqeVbvmN9jr7Xer8rfFzAO2mOxPz1DNL0eC4l4/MZy
	yUgHhroNtMvNGCid9/RxE80r3wbkftQQt7axnHN3gDpZDVb/8jgsDFrNnAG9oZ8xWo1ppGs+rzMJc
	XWbi85LEdUJwme6f2C4Zbuy3+ebNUA2YaVc7klchsLysY44zD4llYhi1OKYgoITvayvwfBwOXiWec
	c0HBvyRI/9Slc8dHHFHyvI4JaI17JHYkSIydxWV9kk2VHsO18Y9zmCULMgbZx/kAgk1K1k+QdPHNM
	0JFYoc0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNEGC-0000000G8af-0I0S;
	Thu, 05 Jun 2025 17:20:12 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNEDn-0000000G84A-2vHx;
	Thu, 05 Jun 2025 17:17:44 +0000
Received: from engine.ppe-hosted.com (unknown [10.7.65.207])
	by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 5DC9F600D9;
	Thu,  5 Jun 2025 17:17:43 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 77C9BC045DB;
	Thu,  5 Jun 2025 17:17:41 +0000 (UTC)
Received: from [192.168.100.159] (unknown [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id B875B13C2B0;
	Thu,  5 Jun 2025 10:17:40 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com B875B13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1749143861;
	bh=pcqFadWfsfKrqR97jyj8RHYbUTDAgZDdJhSw2w0+aRk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q/Bn2HkUcDDWAFdZxqPfhuTM+UgBWdO3FDCdBSmbwD0xlANqir13cO/g3eaEKdIYl
	 kKFDVcP5H+o8U7Z583riUGEFT/q75RUBAZCCdiVemkTRyHSWJFzSzvrgNDEQsrjtS/
	 ZcDob1+FzAn6c/neMPvSPJod1kkchr1FgnfKIldY=
Message-ID: <7c99ee6d-2c2c-79ff-87c7-84b820da783a@candelatech.com>
Date: Thu, 5 Jun 2025 10:17:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH mt76 5/5] wifi: mt76: Remove RCU section in
 mt7996_mac_sta_rc_work()
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250605-mt7996-sleep-while-atomic-v1-0-d46d15f9203c@kernel.org>
 <20250605-mt7996-sleep-while-atomic-v1-5-d46d15f9203c@kernel.org>
 <909d2ca8-8409-997a-768f-8e9be4c5168e@candelatech.com>
 <aEHMZe0_vuml8eI9@lore-desk>
 <7b381baa-61a5-2a19-1bd6-47ad4abfdf3d@candelatech.com>
 <aEHQuQPuX8cuCXWY@lore-desk>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <aEHQuQPuX8cuCXWY@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1749143862-yFCG8EsQALAX
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;ut7;1749143862;yFCG8EsQALAX;<greearb@candelatech.com>;cd09869c97ce2e719a3744df88686fd8
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_101743_762736_707D9A48 
X-CRM114-Status: GOOD (  15.00  )
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

On 6/5/25 10:15, Lorenzo Bianconi wrote:
> On Jun 05, Ben Greear wrote:
>> On 6/5/25 09:57, Lorenzo Bianconi wrote:
>>>> On 6/5/25 04:14, Lorenzo Bianconi wrote:
>>>>> Since mt7996_mcu_add_rate_ctrl() and mt7996_mcu_set_fixed_field() can't
>>>>> run in atomic context, move RCU critical section in
>>>>> mt7996_mcu_add_rate_ctrl() and mt7996_mcu_set_fixed_field(). This patch
>>>>> fixes a 'sleep while atomic' issue in mt7996_mac_sta_rc_work().
>>>>>
>>>>> Fixes: 0762bdd30279 ("wifi: mt76: mt7996: rework mt7996_mac_sta_rc_work to support MLO")
>>>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>>>>
>>>> Thanks for the quick fix on this, it appears to solve the problems we
>>>> saw related to this.
>>>
>>> ack, thx. Can you please add your 'tested-by' tag in this case?
>>
>> Tested-by: Ben Greear <greearb@candelatech.com>
> 
> I am assuming this is for the full series ;)

Yes, and to be clear, I had to re-work the patches a bit to get them into my tree,
but that was just because I have a lot of mtk upstream patches and my own hacks
in this code.  I still think the tested-by is valid though.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com



