Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED2BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcxVGicBeXIlHqcfnZNHNlV7cLNQK0d6woyZaSqWTmY=; b=rQBKnNvsazrkZsc1QpSvGaJUf7
	qtFT0oQZL3WBC7B6q07AkRkdDbzxwBhif7315TmiITUJYT08tUvOQh04bXRQKzWi8lnwmMFnce3D+
	n94QYpsAKt0/PF5Yv7nBombdn0EHzqMlvbU+pY5JIqt19P/U1aIOhi2loDCMMHeQDZIDpqUyuFbYf
	Wf9x/PPQ4RvW/sytHu4QQaNIs4Cgb4P9cbppMndUzLjAMPXnCx9YTHMFIR6MQB8DgsfcrThrt4bYJ
	BsLHV/fKaKdtARrnuWuGRI9FdTlxabrrDucYB4S7yG+nh1vnzQSadSNOFOfhtAzK5XcxrBcfazhq4
	fql3+Wng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpo10-000000082a8-2ull;
	Wed, 05 Mar 2025 12:38:22 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnww-000000081s1-2onC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 12:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741178051; x=1772714051;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KXz7qN+UCvg/zXe/kDPAg/cy+msMPeJPVH/lqPdGHTo=;
  b=M4QJgfcTHFY8dFtS1t2Mwo6gnUGTVL4DxwmQTV+kjJfLpnr47W3Bdf3P
   i3jiXXmzvYqNiNdGI/hLeJeIs8QlXf/wBMC83IM3b3DTYhEm/DZL3XAJB
   +SfaBzERBJ6oA4VoJeLZNZB7T9YhrUXri36HJjcmGeoCdl9Bk0vQygprw
   2sFR3M82CgwacBnYl1/DwA6mz0mY1PH5J4+d0FqmckxAIeKthmaiKXzoz
   JA4P0DcsCHNhUwYW/pn8iEW0uo/cv0yRXovpdir3OOD2Sqi46OLNi0l5A
   ZQ6niN3qrfIBLUfFPmIwAZQyXuOt5X0rqRTveyMFyd8X0fesE1qzUXYGO
   g==;
X-CSE-ConnectionGUID: lvbR86F9TvGZlfjrM15JYQ==
X-CSE-MsgGUID: hLGfe4RCRAGwNXP9R50nOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="46064873"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="46064873"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 04:34:05 -0800
X-CSE-ConnectionGUID: N7Xoy4TzQJysW2kMb1XEUQ==
X-CSE-MsgGUID: eBSnBMUbTKa2RR8mn5mMOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118829798"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.123.55]) ([10.247.123.55])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 04:33:58 -0800
Message-ID: <4882bd5b-1a64-4ac7-ba51-66143d029e8a@linux.intel.com>
Date: Wed, 5 Mar 2025 20:33:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next v7 5/9] igc: Add support for frame preemption
 verification
To: Vladimir Oltean <vladimir.oltean@nxp.com>, ",chwee.lin.choong"@intel.com
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
References: <20250303102658.3580232-1-faizal.abdul.rahim@linux.intel.com>
 <20250303102658.3580232-6-faizal.abdul.rahim@linux.intel.com>
 <20250304152644.y7j7eshr4qxhmxq2@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250304152644.y7j7eshr4qxhmxq2@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_043410_725158_7BB96D6D 
X-CRM114-Status: GOOD (  14.73  )
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



On 4/3/2025 11:26 pm, Vladimir Oltean wrote:
> On Mon, Mar 03, 2025 at 05:26:54AM -0500, Faizal Rahim wrote:
>> +static inline bool igc_fpe_is_verify_or_response(union igc_adv_rx_desc *rx_desc,
>> +						 unsigned int size)
>> +{
>> +	u32 status_error = le32_to_cpu(rx_desc->wb.upper.status_error);
>> +	int smd;
>> +
>> +	smd = FIELD_GET(IGC_RXDADV_STAT_SMD_TYPE_MASK, status_error);
>> +
>> +	return (smd == IGC_RXD_STAT_SMD_TYPE_V || smd == IGC_RXD_STAT_SMD_TYPE_R) &&
>> +		size == SMD_FRAME_SIZE;
>> +}
> 
> The NIC should explicitly not respond to frames which have an SMD-V but
> are not "verify" mPackets (7 octets of 0x55 + 1 octet SMD-V + 60 octets
> of 0x00 + mCRC - as per 802.3 definitions). Similarly, it should only
> treat SMD-R frames which contain 7 octets of 0x55 + 1 octet SMD-R + 60
> octets of 0x00 + mCRC as "respond" mPackets, and only advance its
> verification state machine based on those.
> 
> Specifically, it doesn't look like you are ensuring the packet payload
> contains 60 octets of zeroes. Is this something that the hardware
> already does for you, or is it something that needs further validation
> and differentiation in software?

The hardware doesn’t handle this, so the igc driver have to do it manually. 
I missed this handling, and Chwee Lin also noticed the issue while testing 
this patch series—it wasn’t rejecting SMD-V and SMD-R with a non-zero 
payload. I’ll update this patch to include the fix that Chwee Lin 
implemented and tested. Thanks.

