Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AB4C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 06:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oAWyQpxOetBs4E6OmdRYR94Rvs0dkU7aab6agKV5H4=; b=yDiDMDYx+0kp0LclAsejCIcHeP
	0d8H0HDVwH0QhiUVLvbaaBcexSELRnmZJHYE+P5UFW3wBsqaE5QWYc8kAXYAuX9NVCBywfVsdAFWF
	+9qzUddjW16iF1a7OB2gLq4l93RLYxbMAtNXp5GtWunMTJUlyjpt/+KtSVHJLWEmF3UFuCLbuvM+s
	hsa/5hUwmBBRrz1QLPaQtbmwKt6J+rnOBuDxh80B8xNgfYjdsLcDANn+OSt5slwG2Wyg10I6GJmBH
	w2bxv1rOt6LqOy3cceYGee/9DZmVRdJa1fneOwRYPUNiY8eymdZBnNpLxSNsUx/uZWzRe8ij7dIWi
	7XKmjbxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSV3-00000009u99-0LM8;
	Thu, 13 Feb 2025 06:15:01 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiST4-00000009tsw-0tMc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 06:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739427178; x=1770963178;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GEJZwnWqsIMq3HKET1mdxf8SV5zMREPN381jd4cLlhM=;
  b=Y3B6dGVaf4XgFtsnu/SpHcDfNJF19sAkVqkorop83pyJdV0+xMg2Tu1E
   obdbhTVAHJtorV2VsusW2Jfblde7oZpQamVkmiEEnQu5sW5PfjmepNVVG
   mhgQZ9+EC89hQemYNtLl8H2/hjv5I2Z4zdu6rNzYlT3Ag3JIMspKPlO8I
   sZLgaIYBpSwGWdHMJdzmponi27jrRGLrMdet5eAV+w4SSoQnhk0RYsB81
   N1tSPmrdF1vsHlllWh3uL/JoWufAErP0AP33N/WCTrme5f4RX9yY9T2Ll
   F/yvo+s1GT779sHSZ2y1t/fq0wzL9UW+EFN0TLHfIuqT9E0TvSySAd5B9
   A==;
X-CSE-ConnectionGUID: 8IF4OeUUT+qvN/z+HVpCeQ==
X-CSE-MsgGUID: offkVCUcS56WdLaRjHVUVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="44046222"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="44046222"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 22:12:57 -0800
X-CSE-ConnectionGUID: bkfrU6y2QB2L4ycTkHh9VA==
X-CSE-MsgGUID: VzfZiVD2SRO52yQ6ry9WDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117156622"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.42.34]) ([10.247.42.34])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 22:12:50 -0800
Message-ID: <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
Date: Thu, 13 Feb 2025 14:12:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next v4 0/9] igc: Add support for Frame Preemption
 feature in IGC
To: Vladimir Oltean <vladimir.oltean@nxp.com>
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
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250212220121.ici3qll66pfoov62@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_221258_270883_2B39DA53 
X-CRM114-Status: GOOD (  13.65  )
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



On 13/2/2025 6:01 am, Vladimir Oltean wrote:
> On Mon, Feb 10, 2025 at 02:01:58AM -0500, Faizal Rahim wrote:
>> Introduces support for the FPE feature in the IGC driver.
>>
>> The patches aligns with the upstream FPE API:
>> https://patchwork.kernel.org/project/netdevbpf/cover/20230220122343.1156614-1-vladimir.oltean@nxp.com/
>> https://patchwork.kernel.org/project/netdevbpf/cover/20230119122705.73054-1-vladimir.oltean@nxp.com/
>>
>> It builds upon earlier work:
>> https://patchwork.kernel.org/project/netdevbpf/cover/20220520011538.1098888-1-vinicius.gomes@intel.com/
>>
>> The patch series adds the following functionalities to the IGC driver:
>> a) Configure FPE using `ethtool --set-mm`.
>> b) Display FPE settings via `ethtool --show-mm`.
>> c) View FPE statistics using `ethtool --include-statistics --show-mm'.
>> e) Enable preemptible/express queue with `fp`:
>>     tc qdisc add ... root taprio \
>>     fp E E P P
> 
> Any reason why you are only enabling the preemptible traffic classes
> with taprio, and not with mqprio as well? I see there will have to be
> some work harmonizing igc's existing understanding of ring priorities
> with what Kurt did in 9f3297511dae ("igc: Add MQPRIO offload support"),
> and I was kind of expecting to see a proposal for that as part of this.
> 

I was planning to enable fpe + mqprio separately since it requires extra 
effort to explore mqprio with preemptible rings, ring priorities, and 
testing to ensure it works properly and there are no regressions.

I’m really hoping that fpe + mqprio doesn’t have to be enabled together in 
this series to keep things simple. It could be added later—adding it now 
would introduce additional complexity and delay this series further, which 
is focused on enabling basic, working fpe on i226.

Would that be okay with you?


