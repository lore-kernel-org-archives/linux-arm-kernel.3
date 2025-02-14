Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2FFC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9l3d5h97w8JyBfnaFKOZUCgbofNi5r9Nz0RaWVnwioM=; b=vlMHW9cyJ3t7zxzU6ZZfqj17o9
	SyPVrcDcJH6aPCeERMfJp9ycLiIljK9avZTgMnysyAeohDnIP+NPMS1pVBC1EIpECcSjaEATS2jFx
	mYJZxDE88gP5fjdy/JB5iSa8Wwz9moY1eQzkHV4eRApNK4MY8uS/DAb+S2cUye3/K9AzSmAN1FHSD
	Iv6qThQe8cIaT5lZ5eMuP83qYAudLPcLn+eLgwgkG7bi/I1MWeksal3KgjAvVavF0Bt61PO+Q5v+Y
	7eX0u381x2PCDVSXk04y3sA7zbWVAJT69zVtRXAP0PMB5uyi8X9w36vkwQsDg1aAShCIsfaP9Rxus
	Md+Xdn5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiu1w-0000000Ehv4-15KU;
	Fri, 14 Feb 2025 11:38:48 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titk4-0000000EeFS-0T8U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739532020; x=1771068020;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bsMoByqwV8q04F4BIn7mVkZvxnRBIcre3Xld+Gy6r0M=;
  b=VEAcjJIvFJxUj3JHJa8hqqc3ETNBTRupaiK4U0zddaSVQ8F9OPBOCeST
   xp01eH9jJ73k88Z+8zXxdF2acGkXFV9X5DnemhmY7VIVbUYEPYY90to/a
   5d2gYHkU0koLcsoaSbGqujD7Kd23tfpZX9/iOD/lg9mPs2axMT3iHgZGW
   HRHkvajlEFIdBIjcf5EFVOE2CQtxKG12b7icK/r5918KlDLZodLnVygpk
   EEbTym7h+cpBVfRlTzzf1S2YbyDSWmKrn+3iXzRmMSQ+qX46FY32khrA4
   dl3vwgxY9Z9/ucb/SEibZjVbUi0dVfd109rPBosJQrFFP+M6+Vg4Y9W77
   g==;
X-CSE-ConnectionGUID: TcLLNYD2SwOx955takdYkA==
X-CSE-MsgGUID: mJ6UOwNqSyma9FPzAoj2KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50921224"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="50921224"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 03:20:19 -0800
X-CSE-ConnectionGUID: y7/+bKRnQVCJqHfK1+vedw==
X-CSE-MsgGUID: e3HzIYJQSCC/jYLkKMQc/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="113624859"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.89.75]) ([10.247.89.75])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 03:20:11 -0800
Message-ID: <afa50e3a-914b-46b6-8401-0589b6099f68@linux.intel.com>
Date: Fri, 14 Feb 2025 19:20:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next v4 0/9] igc: Add support for Frame Preemption
 feature in IGC
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Kurt Kanzenbach <kurt@linutronix.de>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Gal Pressman <gal@nvidia.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
References: <87cyfmnjdh.fsf@kurt.kurt.home>
 <5902cc28-a649-4ae9-a5ba-83aa265abaf8@linux.intel.com>
 <20250213130003.nxt2ev47a6ppqzrq@skbuf>
 <1c981aa1-e796-4c53-9853-3eae517f2f6d@linux.intel.com>
 <877c5undbg.fsf@kurt.kurt.home> <20250213184613.cqc2zhj2wkaf5hn7@skbuf>
 <87v7td3bi1.fsf@kurt.kurt.home>
 <b7740709-6b4a-4f44-b4d7-e265bb823aca@linux.intel.com>
 <874j0wrjk2.fsf@kurt.kurt.home>
 <641ab972-e110-4af2-ad9b-6688cee56562@linux.intel.com>
 <20250214102206.25dqgut5tbak2rkz@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250214102206.25dqgut5tbak2rkz@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_032020_203834_0CBF86AC 
X-CRM114-Status: GOOD (  29.02  )
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



On 14/2/2025 6:22 pm, Vladimir Oltean wrote:
> Faizal,
> 
> On Fri, Feb 14, 2025 at 05:43:19PM +0800, Abdul Rahim, Faizal wrote:
>>>> Hi Kurt & Vladimir,
>>>>
>>>> After reading Vladimir's reply on tc, hw queue, and socket priority mapping
>>>> for both taprio and mqprio, I agree they should follow the same priority
>>>> scheme for consistency—both in code and command usage (i.e., taprio,
>>>> mqprio, and fpe in both configurations). Since igc_tsn_tx_arb() ensures a
>>>> standard mapping of tc, socket priority, and hardware queue priority, I'll
>>>> enable taprio to use igc_tsn_tx_arb() in a separate patch submission.
>>>
>>> There's one point to consider here: igc_tsn_tx_arb() changes the mapping
>>> between priorities and Tx queues. I have no idea how many people rely on
>>> the fact that queue 0 has always the highest priority. For example, it
>>> will change the Tx behavior for schedules which open multiple traffic
>>> classes at the same time. Users may notice.
>>
>> Yeah, I was considering the impact on existing users too. I hadn’t given it
>> much thought initially and figured they’d just need to adapt to the changes,
>> but now that I think about it, properly communicating this would be tough.
>> taprio on igc (i225, i226) has been around for a while, so a lot of users
>> would be affected.
>>
>>> OTOH changing mqprio to the broken_mqprio model is easy, because AFAIK
>>> there's only one customer using this.
>>>
>>
>> Hmmmm, now I’m leaning toward keeping taprio as is (hw queue 0 highest
>> priority) and having mqprio follow the default priority scheme (aka
>> broken_mqprio). Even though it’s not the norm, the impact doesn’t seem worth
>> the gain. Open to hearing others' thoughts.
> 
> Kurt is right, you need to think about your users, but it isn't only that.
> Intel puts out a lot of user-facing TSN technical documentation for Linux,
> and currently, they have a hard time adapting it to other vendors, because
> of Intel specific peculiarities such as this one. I would argue that for
> being one of the most visible vendors from the Linux TSN space, you also
> have a duty to the rest of the community of not pushing users away from
> established conventions.
> 
> It's unfair that a past design mistake would stifle further evolution of
> the driver in the correct direction, so I don't think we should let that
> happen. I was thinking the igc driver should have a driver-specific
> opt-in flag which users explicitly have to set in order to get the
> conventional TX scheduling behavior in taprio (the one from mqprio).
> Public Intel documentation would be updated to present the differences
> between the old and the new mode, and to recommend opting into the new
> mode. By default, the current behavior is maintained, thus not breaking
> any user.  Something like an ethtool priv flag seems adequate for this.
> 
> Understandably, many network maintainers will initially dislike this,
> but you will have to be persistent and explain the ways in which having
> this priv flag is better than not having it. Normally they will respect
> those reasons more than they dislike driver-specific priv flags, which,
> let's be honest, are way too often abused for adding custom behavior.
> Here the situation is different, the custom behavior already exists, it
> just doesn't have a name and there's no way of turning it off.

Okay. I can look into this in a separate patch submission, but just an 
FYI—this adds another dependency to the second part of the igc fpe 
submission (preemptible tc on taprio + mqprio). This new patch 
(driver-specific priv flag to control 2 different priority scheme) would 
need to be accepted first before the second part of igc fpe can be submitted.

