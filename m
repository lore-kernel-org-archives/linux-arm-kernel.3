Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D70C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 04:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmJtbpqxckhATASjD1d2w6bVsotMpvgKjxR9ut3OsBM=; b=VYA2+MuyZlnIOUupPhUwV3+oV+
	G7J0WkbOEhZP2kUkaIFpWBQIhgs7shDjczWoDNVpHXZIKj8xCz7TK4Zb6v0WgGJoBkZsDHjVXgkfX
	0qd+KaD20+s7fbrDs/FsHUYne+DcnmYH1PBi7bnuQs2fE3IDfjBmXGw6v70ETvT69vJ1iA1JmJhtY
	KoQHlyRK2uUumg6i1XYQ1OJ/QnY1kgYzQsjL/EQeZ7cMyLmFeqzX/Q07Qy9lXNUrKe5aDWXmpsX3d
	W+a+0BTyg7bgqXLxupb9GHDPRHUzoGg1FXHdPvgZpJki4V1NeF1MrjAmUwCPOBUhkt503mJYxSB0s
	f5n+L/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tinDR-0000000DaWr-2AMe;
	Fri, 14 Feb 2025 04:22:13 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tinC1-0000000DaM0-0Gz1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 04:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739506845; x=1771042845;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0N+NIkjKA48xzvqbJnB29lAB08YfjMQLZFPJzVlNIO4=;
  b=UwPslJ+MDDCXfoz1KS9ef99VSCPeEoHnmbXJpX5ZUGelghcgz/Gzzp5m
   FWOsBkwdgfbinUzMut73eu/RJePtyIWNWT90g0ztdR1b3YTCzHaSon1/H
   MKVPCyg++xZU530y3HMkC3CTtmqj/NIrTbOpCVjLMvRZ9hOyzfKqAQZ/e
   2lU5aswDDH6meaFTSPYchk4cl7+644ofo4G4lqnZYeD36IGug1/X+ie7F
   YwBPAZzeyp4uJ4RnxCD30l6HU9CJUhh0jEF6WyIYFpxHyysxZeoKn6XaE
   bJVUTHuF4eiTTwLJHlEB0MrN4/0E1oGrnLtLiqVrxdvJAvsVYzc5dbbnZ
   w==;
X-CSE-ConnectionGUID: WH9/KwtFRC+OvkTKkN5f2w==
X-CSE-MsgGUID: j9mEDELbSNGonPV1KotD4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40505971"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="40505971"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 20:20:43 -0800
X-CSE-ConnectionGUID: VV+jgGj8RGadw8WZ3YmWXQ==
X-CSE-MsgGUID: ktMrD4xUQYq+G2zq3bq7DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="144209439"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.123.6]) ([10.247.123.6])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 20:20:33 -0800
Message-ID: <b7740709-6b4a-4f44-b4d7-e265bb823aca@linux.intel.com>
Date: Fri, 14 Feb 2025 12:20:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next v4 0/9] igc: Add support for Frame Preemption
 feature in IGC
To: Kurt Kanzenbach <kurt@linutronix.de>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
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
 <1c981aa1-e796-4c53-9853-3eae517f2f6d@linux.intel.com>
 <877c5undbg.fsf@kurt.kurt.home> <20250213184613.cqc2zhj2wkaf5hn7@skbuf>
 <87v7td3bi1.fsf@kurt.kurt.home>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <87v7td3bi1.fsf@kurt.kurt.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_202045_147881_241DE599 
X-CRM114-Status: GOOD (  18.49  )
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



On 14/2/2025 3:12 am, Kurt Kanzenbach wrote:
> On Thu Feb 13 2025, Vladimir Oltean wrote:
>> So, confusingly to me, it seems like one operating mode is fundamentally
>> different from the other, and something will have to change if both will
>> be made to behave the same. What will change? You say mqprio will behave
>> like taprio, but I think if anything, mqprio is the one which does the
>> right thing, in igc_tsn_tx_arb(), and taprio seems to use the default Tx
>> arbitration scheme?
> 
> Correct. taprio is using the default scheme. mqprio configures it to
> what ever the user provided (in igc_tsn_tx_arb()).
> 
>> I don't think I'm on the same page as you guys, because to me, it is
>> just odd that the P traffic classes would be the first ones with
>> mqprio, but the last ones with taprio.
> 
> I think we are on the same page here. At the end both have to behave the
> same. Either by using igc_tsn_tx_arb() for taprio too or only using the
> default scheme for both (and thereby keeping broken_mqprio). Whatever
> Faizal implements I'll match the behavior with mqprio.
> 

Hi Kurt & Vladimir,

After reading Vladimir's reply on tc, hw queue, and socket priority mapping 
for both taprio and mqprio, I agree they should follow the same priority 
scheme for consistency—both in code and command usage (i.e., taprio, 
mqprio, and fpe in both configurations). Since igc_tsn_tx_arb() ensures a 
standard mapping of tc, socket priority, and hardware queue priority, I'll 
enable taprio to use igc_tsn_tx_arb() in a separate patch submission.

I'll split the changes based on Vladimir's suggestion.

First part - ethtool-mm related:
igc: Add support to get frame preemption statistics via ethtool
igc: Add support to get MAC Merge data via ethtool
igc: Add support to set tx-min-frag-size
igc: Add support for frame preemption verification
igc: Set the RX packet buffer size for TSN mode
igc: Optimize TX packet buffer utilization
igc: Rename xdp_get_tx_ring() for non-XDP usage
net: ethtool: mm: Extract stmmac verification logic into a common library

Second part:
igc: Add support for preemptible traffic class in taprio and mqprio
igc: Use igc_tsn_tx_arb() for taprio queue priority scheme
igc: Kurt's patch on mqprio to use normal TSN Tx mode

Kurt can keep igc_tsn_tx_arb() for his mqprio patch, so preemptible tc 
should work the same for both taprio and mqprio.

I'm suggesting to include Kurt's patch in the second part since there's 
some dependency and potential code conflict, even though it mixes different 
functional changes in the same series.

Does this sound good to you?


