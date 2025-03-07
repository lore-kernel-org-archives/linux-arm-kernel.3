Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37D3C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 11:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZmBOEDl7GAhGmfF6UfWgCSp1DiacmxMZDHkcWSK2wM=; b=Z0C3jg4S6PSeXaIugUAIh7Eruz
	B2KUQSUShPfIPEfd76Cl7N8rqTxRRrkl6/c1ZbfyiytlQbmh1OM9J2/L2spQB4ydYjxxmYww9n0s0
	H0U4N5rVNV+t8uDNglt+VUVZwQgtdYZzSYMaLUvzeLLRsVL7bmoPQbiMrl0krkf1c+SXkqxhZSkSu
	pyPiSAEN9qlSHSbfGoG3eMKr06/vz//dIecetrzJAHTpC87Cisa1N4NBPwkR5fP4MKLtZrgyxboZ9
	Dsj9xcktFr1PwGFB/kt0h3rySYnbffi6ZBBmjdUSNs3Ijm9MKl+Iv7tkUuFbNJF9DLv55+n7AcaUA
	WFMPsLoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVtQ-0000000E3Qq-4BIE;
	Fri, 07 Mar 2025 11:29:29 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVqO-0000000E2fy-2jil
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 11:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741346781; x=1772882781;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IRGd/73/547JbPgxOPTPAv9MDN91O+zWBBkgec1T5PM=;
  b=UUkZR53nUtMH7mc/mHQHkPzFd5HGOvXkjj4H9mm/3XgshMB2zC2otzi+
   lP+nD+wwnqggvEcZ6TEfL7rGsWseWYfnII8jUeVrF1O8koswf8BVOAHDV
   FgzZfnxzoTba2sw1lbSw3wv7ZbY2gHGCGn3mx+6X3Y7TYvQzq4ICW0S4J
   KL2XzwgaVdSFEvZaU4QYMUFAP/bX9o0CW5EOQTLFe78QkhvcwZx/Gam/5
   USQHhTOjGVRV1KxGpmiOsBKUHNrooYHEpWSLgQWQE43rLRZJnmnuAaPc4
   W+K7MqZxy/EKRmZNuEHhdn1spNIVacoUKxPBaHxrclDK0gRyS5fe9Zqui
   w==;
X-CSE-ConnectionGUID: IRtnVin2RAqxLCR0a8Ke2A==
X-CSE-MsgGUID: IrKPtUxSR8i0eegskQfCsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52598949"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="52598949"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:26:15 -0800
X-CSE-ConnectionGUID: MhGzflfcR5uwjOmgTHfi1w==
X-CSE-MsgGUID: RXDB3iloTN6BhM+AbCLNOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="123891784"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.100.177]) ([10.247.100.177])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:26:08 -0800
Message-ID: <152e48f6-e68d-4de4-8170-3f35df1ddd1d@linux.intel.com>
Date: Fri, 7 Mar 2025 19:26:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next v8 08/11] igc: add support to set
 tx-min-frag-size
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
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Chwee-Lin Choong <chwee.lin.choong@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
References: <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
 <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
 <20250305130026.642219-9-faizal.abdul.rahim@linux.intel.com>
 <20250305130026.642219-9-faizal.abdul.rahim@linux.intel.com>
 <20250306004301.evw34gqoyll36mso@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250306004301.evw34gqoyll36mso@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_032620_740394_14281975 
X-CRM114-Status: GOOD (  15.85  )
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



On 6/3/2025 8:43 am, Vladimir Oltean wrote:
>> diff --git a/net/ethtool/mm.c b/net/ethtool/mm.c
>> index ad9b40034003..4c395cd949ab 100644
>> --- a/net/ethtool/mm.c
>> +++ b/net/ethtool/mm.c
>> @@ -153,7 +153,7 @@ const struct nla_policy ethnl_mm_set_policy[ETHTOOL_A_MM_MAX + 1] = {
>>   	[ETHTOOL_A_MM_VERIFY_TIME]	= NLA_POLICY_RANGE(NLA_U32, 1, 128),
>>   	[ETHTOOL_A_MM_TX_ENABLED]	= NLA_POLICY_MAX(NLA_U8, 1),
>>   	[ETHTOOL_A_MM_PMAC_ENABLED]	= NLA_POLICY_MAX(NLA_U8, 1),
>> -	[ETHTOOL_A_MM_TX_MIN_FRAG_SIZE]	= NLA_POLICY_RANGE(NLA_U32, 60, 252),
>> +	[ETHTOOL_A_MM_TX_MIN_FRAG_SIZE]	= NLA_POLICY_RANGE(NLA_U32, 60, 256),
> 
> Please make this a separate patch with a reasonably convincing
> justification for any reader, and also state why it is a change that
> will not introduce regressions to the other drivers. It shows that
> you've done the due dilligence of checking that they all use
> ethtool_mm_frag_size_min_to_add(), which errors out on non-standard
> values.
> 
> To be clear, extending the policy from 252 to 256 is just to suppress
> the netlink warning which states that the driver rounds up the minimum
> fragment size, correct? Because even if you pass 252 (the current
> netlink maximum), the driver will still use 256.
> 
I originally changed 252 to 256 because our internal validation failed when 
setting 256 via ethtool. The test case was based on our old kernel OOT 
patches code, but this run was done on the upstreamed FPE framework plus 
this series. After thinking about it, it doesn’t seem right to change this 
just to accommodate the i226 quirk in a common layer when the IEEE standard 
and other devices use 252.

So, we’ll update our validation to use 252 instead. The driver already 
rounds up to 256 anyway. I’ll drop this change in the next revision.

Also, noted your point about being cautious with changes that impact other 
drivers.

Thanks.

