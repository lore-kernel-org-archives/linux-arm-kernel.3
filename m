Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829BDC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 01:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvrO7AWGxoNErdt5JCihmAWqLgTj/DJvdaHKt+Vu9Zk=; b=vJTQlzlTZ+Y1epbbt9ykVNUvtn
	MQQl+eXOz7REU68q52KOJutonXI+pA3IAIs0B3K8Ce9OpPvYYyBNPS8wMOFzeqUAmMng3rBKR8DQ8
	ruH3wIwDMsUWxyd2uTQj4fHKiSFehSLW0JOy6NyZjsuTPhY39W+N9UYgK532kpGVps887aU8Pe/y1
	XZmlxOxRt2F5/Em22qRx0Cok1k5s3VJjgVitz5WeiSXwvcIdF+LcONYrIrYXlffuBIQ42OciGNZw/
	3A+oJSdY7hNNh1FFJuEdHzPhrw6YKXfMiY5CFtNlwpfip+YqSD6honKyyCNNlzLrrnhDnw6P6iQ6v
	R9h23drQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZEE-0000000AZtK-3X0u;
	Wed, 19 Feb 2025 01:50:22 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZCk-0000000AZju-396J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 01:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739929730; x=1771465730;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/6YPLRHm6H9wPjnB667+gK6xaD7arKiwsNiLpHXnheg=;
  b=Vf5gzDRmBVgZMyxxzzBdRiNBQjWVE7xYyrPkKp4FrgJnOeUa+k+HKNPj
   nOu89oBVys7Y/hNEekUgiK4Btf1Eb2qIr3WwG6EF65XiyyNGr0t4r56ac
   1363ExTQnLDdJrVVx/e3uLgG3/pvqvjL9/fB2xjpa/zzS8Ng+ynovAYEc
   cD03Gr1JLUWJhjCTYz/RpDMg8WpytR6Axvyz+G7fpoDOJYr0PJNZhF/fQ
   njyxJa16ryhcS6STv8O4sA6umKXH58X72lhCRT5jzzDqzLCE6QYH867N1
   p5agbLBDIxgp/zBOkBy2X7MAEfA0Bkcne9nZYpsLEorif51yCejikhA8V
   w==;
X-CSE-ConnectionGUID: GoMpq5isTCWUVeChB69Jtg==
X-CSE-MsgGUID: LK3Sr9OeSSWo+Ad0R4fovQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="66006876"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="66006876"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 17:48:49 -0800
X-CSE-ConnectionGUID: 3tCnTqP2SCm9n+J0hFQeZw==
X-CSE-MsgGUID: pUBD94G+R3qLe0pCfMzcOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="114748406"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.64.179]) ([10.247.64.179])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 17:48:36 -0800
Message-ID: <b3e02516-d59c-4ed4-b59d-afa72c23d04b@linux.intel.com>
Date: Wed, 19 Feb 2025 09:48:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next v4 5/9] igc: Add support for frame preemption
 verification
To: Simon Horman <horms@kernel.org>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
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
 <20250210070207.2615418-6-faizal.abdul.rahim@linux.intel.com>
 <20250217113113.GK1615191@kernel.org>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250217113113.GK1615191@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_174850_804495_E2B83BF8 
X-CRM114-Status: GOOD (  13.20  )
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



On 17/2/2025 7:31 pm, Simon Horman wrote:
> On Mon, Feb 10, 2025 at 02:02:03AM -0500, Faizal Rahim wrote:
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/intel/igc/igc_tsn.c b/drivers/net/ethernet/intel/igc/igc_tsn.c
> 
> ...
> 
>> +bool igc_fpe_transmitted_smd_v(union igc_adv_tx_desc *tx_desc)
>> +{
>> +	u8 smd = FIELD_GET(IGC_TXD_POPTS_SMD_MASK, tx_desc->read.olinfo_status);
> 
> olininfo_status is little-endian, so I think it needs
> to be converted to host byte order when used as an
> argument to FIELD_GET().
> 
> Flagged by Sparse.
> 
>> +
>> +	return smd == SMD_V;
>> +}
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/intel/igc/igc_tsn.h b/drivers/net/ethernet/intel/igc/igc_tsn.h
> 
> ...
> 
>> +static inline void igc_fpe_lp_event_status(union igc_adv_rx_desc *rx_desc,
>> +					   struct ethtool_mmsv *mmsv)
>> +{
>> +	__le32 status_error = le32_to_cpu(rx_desc->wb.upper.status_error);
> 
> It looks like the type of status_error should be a host byte order integer,
> such as u32.
> 
> Also flagged by Sparse.

Thanks for spotting these, I'll update them.


