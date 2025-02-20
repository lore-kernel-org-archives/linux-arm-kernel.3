Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B33CC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 03:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuZQt7G6sgo8CGWDiMdFanq2N8yNV5r0IKaW70I99FI=; b=NXWJnYLiGo1iui9XK20TvkqfXE
	73zRoMjDnEJsUujS6n0D3V6MB2E5kP7BnpehKlZzXG96X+yksa7mb17fck3S/NISWQjnMPlzAXdgJ
	TCza69A8KFq1eK+5A+7fnREe849afvIsn0CBh5hDBxJA1Eyp/oZrrpKugLBp6Va8XWPnh+c50ZwEd
	TapUX/+raEA9+wQizOpgkRh9A4J+/oJ/Si7nvyae+2d3a+w5suy34LuIeuNRCcxixdp1Yz+PTLDJw
	MDUcNWYJr0N6VnSu7Dn6UMf/1K5oR7IdHTTr4g4eLrDh2bqwGZIkpUWLQvcSnnRSR5Fqebe9VKcbm
	FsiMRCUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkx23-0000000GVuB-1fTq;
	Thu, 20 Feb 2025 03:15:23 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkwvy-0000000GTze-1A5T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 03:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740020945; x=1771556945;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6Om/YQ9BDTJoSdcjeVlNE5mx2TxHgQH+HygQWJDZxTI=;
  b=dSH0fArpdSQjxlPE19DEJPq9UIU2W12dl8Xt39ZBrRY2lI8+OWPWwhpz
   n4sw0ThFO6Fk9vpf56TeVfoje3oW79K5vv9yLOfYtv1PKPlfePVfxxHRn
   N6tI40RWJXTyMBZFXM4glbAKZTcqpT+yKKqP3LwfQG+C6oYnYcOnVxZCn
   WE8kvje45Vi5hv0u8R9NaFX5ZbHCohpxqFfWja/khkCAtsjOMIXSbQN6k
   1VRH7ASA09tgIA/ChnMQWTR1ZcBCCSH0H7F+UL5PFk+WmLwypLNOOd2hl
   HuDU6Z06NJKWuEHTXYCxVYYMY9c7ktt3jKS72TF0Tzo11yp8s/FGrDt0w
   g==;
X-CSE-ConnectionGUID: n0MaWrYmTLqdjcfBZZN/eQ==
X-CSE-MsgGUID: ukf2b2OrQRavhstm2g2qmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44433455"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="44433455"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 19:09:03 -0800
X-CSE-ConnectionGUID: NtSLS7/pTki0JlkmiayN3A==
X-CSE-MsgGUID: phFnrHBBQ4u+5LiD6T/d6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="114892383"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.77.104]) ([10.247.77.104])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 19:08:56 -0800
Message-ID: <72c1a698-ba1e-44f6-a52f-ef03c7acba06@linux.intel.com>
Date: Thu, 20 Feb 2025 11:08:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-wired-lan] [PATCH iwl-next v4 0/9] igc: Add support for
 Frame Preemption feature in IGC
To: "Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
 "Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>,
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
 "Gomes, Vinicius" <vinicius.gomes@intel.com>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250212220121.ici3qll66pfoov62@skbuf>
 <SJ0PR11MB586651473E7F571ECD54B13BE5FF2@SJ0PR11MB5866.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <SJ0PR11MB586651473E7F571ECD54B13BE5FF2@SJ0PR11MB5866.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_190906_361443_EF257662 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
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



On 13/2/2025 4:59 pm, Loktionov, Aleksandr wrote:
> 
> 
>> -----Original Message-----
>> From: Intel-wired-lan <intel-wired-lan-bounces@osuosl.org> On Behalf Of
>> Vladimir Oltean
>> Sent: Wednesday, February 12, 2025 11:01 PM
>> To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
>> Cc: Nguyen, Anthony L <anthony.l.nguyen@intel.com>; Kitszel, Przemyslaw
>> <przemyslaw.kitszel@intel.com>; Andrew Lunn <andrew+netdev@lunn.ch>;
>> David S . Miller <davem@davemloft.net>; Eric Dumazet
>> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
>> <pabeni@redhat.com>; Maxime Coquelin <mcoquelin.stm32@gmail.com>;
>> Alexandre Torgue <alexandre.torgue@foss.st.com>; Simon Horman
>> <horms@kernel.org>; Russell King <linux@armlinux.org.uk>; Alexei
>> Starovoitov <ast@kernel.org>; Daniel Borkmann <daniel@iogearbox.net>;
>> Jesper Dangaard Brouer <hawk@kernel.org>; John Fastabend
>> <john.fastabend@gmail.com>; Furong Xu <0x1207@gmail.com>; Russell King
>> <rmk+kernel@armlinux.org.uk>; Serge Semin <fancer.lancer@gmail.com>;
>> Xiaolei Wang <xiaolei.wang@windriver.com>; Suraj Jaiswal
>> <quic_jsuraj@quicinc.com>; Kory Maincent <kory.maincent@bootlin.com>;
>> Gal Pressman <gal@nvidia.com>; Jesper Nilsson <jesper.nilsson@axis.com>;
>> Andrew Halaney <ahalaney@redhat.com>; Choong Yong Liang
>> <yong.liang.choong@linux.intel.com>; Kunihiko Hayashi
>> <hayashi.kunihiko@socionext.com>; Gomes, Vinicius
>> <vinicius.gomes@intel.com>; intel-wired-lan@lists.osuosl.org;
>> netdev@vger.kernel.org; linux-kernel@vger.kernel.org; linux-stm32@st-md-
>> mailman.stormreply.com; linux-arm-kernel@lists.infradead.org;
>> bpf@vger.kernel.org
>> Subject: Re: [Intel-wired-lan] [PATCH iwl-next v4 0/9] igc: Add support for
>> Frame Preemption feature in IGC
> 
> Please start commit title from slam letters:
> Igc: add ...

Hi Aleksandr,

I haven't updated this in v5 yet. Could you share any reference or 
guideline for this?

 From what I checked, the recently accepted patches in igc seem to follow a 
similar commit title format as my patches:

$ git log --oneline | grep igc
b65969856d4f igc: Link queues to NAPI instances
1a63399c13fe igc: Link IRQs to NAPI instances
8b6237e1f4d4 igc: Fix passing 0 to ERR_PTR in igc_xdp_run_prog()
484d3675f2aa igc: Allow hot-swapping XDP program
c75889081366 igc: Remove unused igc_read/write_pcie_cap_reg
121c3c6bc661 igc: Remove unused igc_read/write_pci_cfg wrappers
b37dba891b17 igc: Remove unused igc_acquire/release_nvm



