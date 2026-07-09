Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21EEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hF1OuSvsIS+NC39otbFE0b920oBAHgX+1bUMiTukbmE=; b=ySlBkSEZC2WjrC3GGaG1tG4OaD
	bpGs7umvShoWbA6rWdI52tPn4j+bqkqyx50mzp/LEEt4jEsvUweqNi04PBqfqTtWx7P4QRtNxGdOH
	9VTvsEfKMf8njRP4xzavhx4HmO8cAKdv3Y4hPHRp2crTLgJUL3PUHIPRY+8KKUnjfcWsFuhJZcM6Q
	kxyYamuiMaTx1XzTz5Q8bRLta+QsKl+1X1KZVDLk/cOilDULQOOBAA2pO6B4v+x/AmI42ePI9Jkjt
	FbHZfmzUocm5uJHiC0LRb4r0iIXw6nt/pg+jurJGFowXtcjdSkLLsZQso9K+fwz89u7f8h8mXnRiw
	V9XLezcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whl17-00000001lBa-1JdV;
	Thu, 09 Jul 2026 09:26:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whl15-00000001lB7-0hFF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:26:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E42F9357B;
	Thu,  9 Jul 2026 02:25:53 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57F2A3F66F;
	Thu,  9 Jul 2026 02:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783589158; bh=r1QShwB/9V/I0bdqwOV4mWuyphrL3DCBdCUyGIHA03s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=soghxfurEEX84ljf4uRd93H+Thd3S0QZKTyNgrf/Ga7kG0mU7NGwTqf5c5fm7BGmg
	 ssRgcMOUX3GkElbF48HVNBWA7lbZD2IhMGp/DpGGXtU+Uq57HwQr8MPEgUzoiNJLu7
	 fDDtZKikUufCT/CUuIZD8Kr9mEAwoj3rR4YNMHKM=
Message-ID: <0aa3bbbc-c0f0-404c-b03b-9113a1e91ce5@arm.com>
Date: Thu, 9 Jul 2026 10:25:54 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v4 2/3] arm_mpam: resctrl: Add pass-through
 resctrl_arch_preconvert_bw()
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: james.morse@arm.com, fenghuay@nvidia.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net,
 x86@kernel.org, linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260706160639.2136674-1-ben.horgan@arm.com>
 <20260706160639.2136674-3-ben.horgan@arm.com>
 <4c520a28-9a72-4abd-8e5b-654a312c92fd@intel.com>
 <e9185282-94b9-4de4-89db-f9451e47b506@arm.com>
 <8d5d9c98-54df-44fe-8795-189554ea2399@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <8d5d9c98-54df-44fe-8795-189554ea2399@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_022559_259429_F3539EE9 
X-CRM114-Status: GOOD (  16.43  )
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

Hi Reinette,

On 7/7/26 15:51, Reinette Chatre wrote:
> Hi Ben,
> 
> On 7/7/26 1:35 AM, Ben Horgan wrote:
>> Hi Reinette,
>>
>> On 7/6/26 22:33, Reinette Chatre wrote:
>>> Hi Ben,
>>>
>>> On 7/6/26 9:06 AM, Ben Horgan wrote:
>>>> resctrl rounds up the percentage value of the MBA based on the bw_gran. As
>>>> MPAM uses a binary fixed point fraction format for MBA rather than a
>>>> decimal percentage, this introduces rounding errors.
>>>>
>>>> Without this additional rounding, if the user reads the value in an MB
>>>> schema and then writes it back to the schema, the value in hardware won't
>>>> change. However, with this additional rounding, this guarantee is broken
>>>> for systems with mbw_wd < 7.
>>>>
>>>> resctrl is introducing resctrl_arch_preconvert_bw() to allow the arch code
>>>> to specify the conversion resctrl does to the user-provided bandwidth
>>>> value. Add the MPAM version of resctrl_arch_preconvert_bw(). This does no
>>>> conversion.
>>>>
>>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>>>> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
>>>>
>>>
>>> Unfortunately the "---" separator is missing here.
>>
>> Another silly mistake.. sorry about that. I've corrected locally and
>> will send a respin in a day or two.
> No problem. 
> 
> When you respin, could you please add a snippet to the cover about expectations
> how this series should be merged? This will be the first piece of work that
> touches the x86 and Arm driver as well as resctrl fs code. So far I assumed it
> will go in via tip but I think it will help to state this from Arm side.

Yes, I was assuming that too. I'll make it explicit in the cover letter.

> We still need a plan for if/when the Arm side touches the same code though. Thankfully
> this work is small.

I'm open to whatever works best for you and the others involved.

Thanks,

Ben

> 
> Reinette


