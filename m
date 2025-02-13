Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FEDC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 12:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7acrumWnCLIQCVlU0AgIWrp2QB9ISOBnuH4BR/NhIk=; b=RCPb9XOuKji1mWdwvSc32AixCa
	fav+Z//ZjcCJwkoJbeghf+8nBCj1Wo8oaAmubRguLgCOBuAsNK2cbVU24qLsjnOcaHONsjaTlLAFq
	w0DM0nAp41IHWprZYEp/oDxdCnWR5J2w8m9VtzG/wqUn2tXLKrdv8Y+b8giApXuweXq8AY108+CK6
	DPPdvhCKjuhd/1rHltVQAT+YgyLxtyLADw7YpJqhcPyDibfHOR/HM2nmutDFnqLKXDK5ihfXH5OlB
	zhtYxaB24n1PwTz+J2BJTnq3WptlckTeWmoKxJ9zf1bZtB3b7bpH3rcDeuCwP8RtC2LBBhWkX+XCY
	VrsUTyxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYlM-0000000B3wq-3txG;
	Thu, 13 Feb 2025 12:56:16 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYje-0000000B3jU-1TXQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 12:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739451271; x=1770987271;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UN3Y9x428Mk8h/CXSju3Mtr+T4Cd2Rs3PZKgk+wNRiA=;
  b=d1T/yWN0G92sRqAYEX3xaQwqApgD/o8kSIcCuyLvRSriiL/c5oBO6YEV
   vqdDEjyC9xsS1df9nc7FCSp2iBJfDwjgyuZBWNL9d6SKfSp81k5mDYpk+
   ItkM+ja5oX2OjwC1prNg79tHMlgGk1SPf/j6NcyBPzcPopyCYAjS4pyRA
   S6XP6OwB5hkH/Fgu4RT/qBBIOky2AiFjS2Ywm4lQvCUQQfc3GLynHNtgz
   NWLiBjGmLVf1natKrFI5xbh73coLdHhGnvUffmfGWe5DYZaHJycPFIRmi
   AQcbTQJesmc6LEsCO/hPOW3CKIWwdj272ooq3/in0OmqcRA3EMomw9z0m
   Q==;
X-CSE-ConnectionGUID: zj3oDRJHR1yNgfiXLGJbUg==
X-CSE-MsgGUID: +8FYSg50QCyPPsKV86+Y3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40266543"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40266543"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 04:54:30 -0800
X-CSE-ConnectionGUID: hz/02A95Toi+RKP8+COzSA==
X-CSE-MsgGUID: 3oCHI4xJSWuWUpbQsVvUsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150303991"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.42.34]) ([10.247.42.34])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 04:54:22 -0800
Message-ID: <5902cc28-a649-4ae9-a5ba-83aa265abaf8@linux.intel.com>
Date: Thu, 13 Feb 2025 20:54:18 +0800
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
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <87cyfmnjdh.fsf@kurt.kurt.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_045430_441725_30D238D6 
X-CRM114-Status: GOOD (  16.14  )
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



On 13/2/2025 8:01 pm, Kurt Kanzenbach wrote:
> On Thu Feb 13 2025, Abdul Rahim, Faizal wrote:
>> On 13/2/2025 6:01 am, Vladimir Oltean wrote:
>>> On Mon, Feb 10, 2025 at 02:01:58AM -0500, Faizal Rahim wrote:
>>>> Introduces support for the FPE feature in the IGC driver.
>>>>
>>>> The patches aligns with the upstream FPE API:
>>>> https://patchwork.kernel.org/project/netdevbpf/cover/20230220122343.1156614-1-vladimir.oltean@nxp.com/
>>>> https://patchwork.kernel.org/project/netdevbpf/cover/20230119122705.73054-1-vladimir.oltean@nxp.com/
>>>>
>>>> It builds upon earlier work:
>>>> https://patchwork.kernel.org/project/netdevbpf/cover/20220520011538.1098888-1-vinicius.gomes@intel.com/
>>>>
>>>> The patch series adds the following functionalities to the IGC driver:
>>>> a) Configure FPE using `ethtool --set-mm`.
>>>> b) Display FPE settings via `ethtool --show-mm`.
>>>> c) View FPE statistics using `ethtool --include-statistics --show-mm'.
>>>> e) Enable preemptible/express queue with `fp`:
>>>>      tc qdisc add ... root taprio \
>>>>      fp E E P P
>>>
>>> Any reason why you are only enabling the preemptible traffic classes
>>> with taprio, and not with mqprio as well? I see there will have to be
>>> some work harmonizing igc's existing understanding of ring priorities
>>> with what Kurt did in 9f3297511dae ("igc: Add MQPRIO offload support"),
>>> and I was kind of expecting to see a proposal for that as part of this.
>>>
>>
>> I was planning to enable fpe + mqprio separately since it requires extra
>> effort to explore mqprio with preemptible rings, ring priorities, and
>> testing to ensure it works properly and there are no regressions.
> 
> Well, my idea was to move the current mqprio offload implementation from
> legacy TSN Tx mode to the normal TSN Tx mode. Then, taprio and mqprio
> can share the same code (with or without fpe). I have a draft patch
> ready for that. What do you think about it?
> 
> Thanks,
> Kurt

Hi Kurt,

I’m okay with including it in this series and testing fpe + mqprio, but I’m 
not sure if others might be concerned about adding different functional 
changes in this fpe series.

Hi Vladimir,
Any thoughts on this ?



