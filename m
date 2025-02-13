Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34103C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 05:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Do17BA+cEX8egqIOlhDHgQ++q9RXTUe7OTvSkOYSCyk=; b=sjLs1ogkfjc/gkTyxVsM1bzI70
	VNDuXmnEurqtJlbpgaTbTOxr/OJG6AAha6in03nkZ3IMhlw9jj+usvIOsiU2sIlxzE14LTtepr9SU
	zSUoHcZe6ogsL6M7qNQe8DIFa5C0Awcbvm9QvgDHoKlkNxFPmeIyBLx1i/WwQWKuEA5WCkejIQ3QK
	pyBFGalxTQB4C5s68fecIp5K8w5Jjh65gng1fpXbMeBelnUOc+5F0tlsdDaf6eQtXEP8DXEkjAXlA
	W7SiuBcEBWyt3Znptk5uB5+xZlF/f9vyee4yGl4/BhPKJIO8A/mcTKCUsQwpUaHtgpxbNPtlYv2Mx
	v4JeDMAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiS1B-00000009pf5-1IZO;
	Thu, 13 Feb 2025 05:44:09 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiRzk-00000009pTA-1fjQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 05:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739425361; x=1770961361;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=s1+zMW0r7uW6tCZ4MRxVO4Jw77rHPs73bHu8Fg5RZuA=;
  b=dmtumI2YXoip1013JRbte9Z94fZHFJyFEqvXu1PdqS3H/ydoqbPPOMfj
   FLPBSvcR0aYIaf0K3hfQ/dafhY4aWWMezc9F4lgy+G27Uy8lAzOPUeoDi
   kWs+I5cC0Ndo9gfJ5gnz9nwqJ5XEGyjwy/VqBL0x3o03jx2DwvCS02Y54
   ykfWVaISU781ykqQDuMWRdVj+JPFoH9BmrnsGu1qD7XkQco2pfxfF74sI
   qwBZrvwZHv0bKEjJCoopU6JDvRxKfGPprkV1AD2XE0TAWVBla9YdYmuOI
   jOqQzDobMvQRN1+CyI27CD7GGvEj7Vjx36u6Ny5+KfiogUfvJkzwmPvv3
   A==;
X-CSE-ConnectionGUID: 3nKNCJKmR2GqZQq9NDrALw==
X-CSE-MsgGUID: eomvCdaWTymZTpg7Ejb0SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40144845"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40144845"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 21:42:39 -0800
X-CSE-ConnectionGUID: absVRYFWTE6GjFbSpIfu3A==
X-CSE-MsgGUID: Rc56qI39ThGchxAi5S5+/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="118128278"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.42.34]) ([10.247.42.34])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 21:42:31 -0800
Message-ID: <74a324de-7a64-4d67-8167-79bf6e4ae8da@linux.intel.com>
Date: Thu, 13 Feb 2025 13:42:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next v4 9/9] igc: Add support to get frame preemption
 statistics via ethtool
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
 <20250210070207.2615418-10-faizal.abdul.rahim@linux.intel.com>
 <20250212215408.v47eb42zx67ij6vp@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250212215408.v47eb42zx67ij6vp@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_214240_487692_FAAD9EDF 
X-CRM114-Status: UNSURE (   7.54  )
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



On 13/2/2025 5:54 am, Vladimir Oltean wrote:
> On Mon, Feb 10, 2025 at 02:02:07AM -0500, Faizal Rahim wrote:
>> diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
>> index f15ac7565fbd..cd5160315993 100644
>> --- a/drivers/net/ethernet/intel/igc/igc_main.c
>> +++ b/drivers/net/ethernet/intel/igc/igc_main.c
>> @@ -3076,6 +3076,7 @@ static bool igc_clean_tx_irq(struct igc_q_vector *q_vector, int napi_budget)
>>   			break;
>>   
>>   		if (static_branch_unlikely(&igc_fpe_enabled) &&
>> +		    adapter->fpe.mmsv.pmac_enabled &&
> 
> This bit is misplaced in this patch.

My bad, thanks for catching that.

