Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD598C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 13:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnD9TeNwfT+U3ultRf7LUdWkp1sv+OxtUbvuDPJjDY8=; b=3jVvNBIQAiHZtCigK3CXfB/bTl
	szEtnKqPH9TymNOrFClLPsihiqgt3HZB0gWQqDB1DDNzjmDRXFckHmgEqXibJxGE36Yjq8y1hGjK0
	5w+6K6OoeGwWavY8YtkNuPS0JU70C5URqBiQp40Iuoe8azpGXKhQrXRnbEhUqHA1zMGrz002e9k/S
	ra5b4ouw8642ESr7UmMphsEICYUjzCeQquUEBuWef3Z2EEWed/rOHQcwBeSxoDb78rLWmbCBx+Mtm
	oEIXy1Srgux4wYTkqMsHKg3yLdx8/KwbvYZFeVuTIoyrmtn2L4IbFb5ksziz+K+zAQjmWjQt8p1md
	/JPr4Neg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZgt-0000000BDPQ-3qiO;
	Thu, 13 Feb 2025 13:55:43 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZfS-0000000BDBT-0vs6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 13:54:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739454854; x=1770990854;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=g5HGHBuqAjMQOceJtIfxFmXU57w01hrdcPk8EKvjSzU=;
  b=GehkrZqZCumdUE9UFpEjrkN1tjzdntVlR3R1Nicsc8TxHaP8APBsIgzW
   lGC/6mAPhn+ENtPDOqKN9BzNupMQPunU2OlNkLFJfzJ0rMb3Efc2XKRJp
   Pbr2U0M9GxU0wfVrJs/q5ubZ//pCRLt28Xm3O57SS4CaCuA36o2kcKl1E
   +8kzG3XolkkLVatj/pCP5lvH4hu0m4j2/5KM1iK0WhwP47i83RZMzeUrL
   H4RZxiSVY2CyNUimD17RiXWp3WhT+whUkWfMja+GMWWsXZ7ygC71yXz+s
   C/E97OBnQxP9E62BM7QZCIf9ri5Dhn0e79Y+eByDgct9+XCr30NPx4bs8
   Q==;
X-CSE-ConnectionGUID: V7n91u63T/aUFcst/Vox9Q==
X-CSE-MsgGUID: ovs3kj1GRvGe6SMc0k9dXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40019848"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40019848"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 05:54:12 -0800
X-CSE-ConnectionGUID: Va5fv8RuSjiYMn+k3238nA==
X-CSE-MsgGUID: 1CjFB4TaT2qSpWMyGvwtMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="118080787"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.42.34]) ([10.247.42.34])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 05:54:04 -0800
Message-ID: <1c981aa1-e796-4c53-9853-3eae517f2f6d@linux.intel.com>
Date: Thu, 13 Feb 2025 21:54:00 +0800
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
 Andrew Halaney <ahalaney@redhat.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250212220121.ici3qll66pfoov62@skbuf>
 <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
 <87cyfmnjdh.fsf@kurt.kurt.home>
 <5902cc28-a649-4ae9-a5ba-83aa265abaf8@linux.intel.com>
 <20250213130003.nxt2ev47a6ppqzrq@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250213130003.nxt2ev47a6ppqzrq@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_055414_297853_E2407EC0 
X-CRM114-Status: GOOD (  16.83  )
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



On 13/2/2025 9:00 pm, Vladimir Oltean wrote:
> On Thu, Feb 13, 2025 at 08:54:18PM +0800, Abdul Rahim, Faizal wrote:
>>> Well, my idea was to move the current mqprio offload implementation from
>>> legacy TSN Tx mode to the normal TSN Tx mode. Then, taprio and mqprio
>>> can share the same code (with or without fpe). I have a draft patch
>>> ready for that. What do you think about it?
>>
>> Hi Kurt,
>>
>> I’m okay with including it in this series and testing fpe + mqprio, but I’m
>> not sure if others might be concerned about adding different functional
>> changes in this fpe series.
>>
>> Hi Vladimir,
>> Any thoughts on this ?
> 
> Well, what do you think of my split proposal from here, essentially
> drawing the line for the first patch set at just ethtool mm?
> https://lore.kernel.org/netdev/20250213110653.iqy5magn27jyfnwh@skbuf/
> 

Honestly, after reconsidering, I’d prefer to keep the current series as is 
(without Kurt’s patch), assuming you’re okay with enabling mqprio + fpe 
later rather than at the same time as taprio + fpe. There likely won’t be 
any additional work needed for mqprio + fpe after Kurt’s patch is accepted, 
since it will mostly reuse the taprio code flow.

If I were to split it, the structure would look something like this:
First part of fpe series:
igc: Add support to get frame preemption statistics via ethtool
igc: Add support to get MAC Merge data via ethtool
igc: Add support to set tx-min-frag-size
igc: Add support for frame preemption verification
igc: Set the RX packet buffer size for TSN mode
igc: Optimize the TX packet buffer utilization
igc: Rename xdp_get_tx_ring() for non-XDP usage
net: ethtool: mm: Extract stmmac verification logic into a common library

Second part of fpe:
igc: Add support for preemptible traffic class in taprio

I don’t think Kurt’s patch should be included in my second part of fpe, as 
it’s not logically related. Another approach would be to wait for Kurt’s 
patch to be accepted first, then submit the second part and verify both 
taprio + mqprio. However, that would delay i226 from having a basic fpe 
feature working as a whole, which I'd really like to avoid.


