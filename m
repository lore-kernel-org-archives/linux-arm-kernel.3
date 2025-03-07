Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7242DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 11:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfIw/KMMmIDRi3/nd/gsWTKf+hzgQZ9OjQBsJhXyFrs=; b=olm4aHFSzPY5M6aQ1Dcbc+3y07
	JkX2lPmtv9+d4/UuJw5rDlbAd0ej/Rl/81qnbzXsUJhuvHUlKbvxrvfA+i07Zf4ee44ePiloPikDV
	gMkhGsW1KAUV1TmCT32FT+iQhTp+3XATzoUgG3qtsp7m1DmXRHsameZZgZRwWjxm1lQusWKrYrPDI
	R31Vk5b9sIi0EoMB6xxzR/VCqStrqe3Mem8gt0RXqzL9G2YqAOQNkPiZqVs4RgfrqAopu4jhSIX6u
	hyRCinuci7nasOQXWieqUbaKJePUJB9sooewjc68i0aPDpu8CceCSfcQ8GAXLhPFQ9vI/dKxoe82g
	4dEuVueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWHa-0000000E6Y7-2EQ5;
	Fri, 07 Mar 2025 11:54:26 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWFy-0000000E6NI-0Xzc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 11:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741348367; x=1772884367;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HfAgk9zOtpbfUTR/ph6GVkTV0/0ByfBX3QerezGYdeI=;
  b=YfygnyBlsAm33M3Ckcu/rLjJ/ZdwvUBapNdtYh0WPNBRb+nD47CpgV3s
   6SgO18XT4xYu4+5HTBARLY9WsFl5QFfbaCMzbi8hAgPWPjvqpdE0HNBMk
   dMEPCeUSyYDaVB0Ga6V1+35hGRULvROPiUXhLPDc2O1fVKkIu9yZaZ07p
   OqAFKjtQWH2/g+JCsJDN/QMmiqtyFzMrI+c+SXfYLX+WKZ7NLNspsOCRh
   diBKdFnDnNNmbHzvBjwdinI6tgBq9U6pcvJUP6TsncvK8xDHD6UxPi0Ef
   KII29hnUwCSdBB+wG1CyqkdAWjFxmiAmtg0V8D0hJdbqreRH55mQkqU1M
   Q==;
X-CSE-ConnectionGUID: 3aJlNtcSQV6LNk732RwREQ==
X-CSE-MsgGUID: dd5mh2LVRRyqrEfMGW5Aog==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="64834319"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="64834319"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:52:44 -0800
X-CSE-ConnectionGUID: Gq2NhXteTvWPF9+DnKuFJQ==
X-CSE-MsgGUID: opl3JIbRQVSlCkVEbStQSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120226099"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.100.177]) ([10.247.100.177])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:52:36 -0800
Message-ID: <43277258-7100-4230-82da-8a78ad341dde@linux.intel.com>
Date: Fri, 7 Mar 2025 19:52:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next v8 07/11] igc: add support for frame preemption
 verification
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
 <20250305130026.642219-8-faizal.abdul.rahim@linux.intel.com>
 <20250306002825.rva7wjsymmms7kbd@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250306002825.rva7wjsymmms7kbd@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_035246_207393_D257FA40 
X-CRM114-Status: GOOD (  26.72  )
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



On 6/3/2025 8:28 am, Vladimir Oltean wrote:
> On Wed, Mar 05, 2025 at 08:00:22AM -0500, Faizal Rahim wrote:
>> Co-developed-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
>> Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
>> Co-developed-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
>> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
>> Co-developed-by: Chwee-Lin Choong <chwee.lin.choong@intel.com>
>> Signed-off-by: Chwee-Lin Choong <chwee.lin.choong@intel.com>
>> Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
>> ---
>> +
>> +static inline bool igc_fpe_is_verify_or_response(union igc_adv_rx_desc *rx_desc,
>> +						 unsigned int size, void *pktbuf)
>> +{
>> +	u32 status_error = le32_to_cpu(rx_desc->wb.upper.status_error);
>> +	static const u8 zero_payload[SMD_FRAME_SIZE] = {0};
>> +	int smd;
>> +
>> +	smd = FIELD_GET(IGC_RXDADV_STAT_SMD_TYPE_MASK, status_error);
>> +
>> +	return (smd == IGC_RXD_STAT_SMD_TYPE_V || smd == IGC_RXD_STAT_SMD_TYPE_R) &&
>> +		size == SMD_FRAME_SIZE &&
>> +		!memcmp(pktbuf, zero_payload, SMD_FRAME_SIZE); /* Buffer is all zeros */
> 
> Using this definition...
> 
>> +}
>> +
>> +static inline void igc_fpe_lp_event_status(union igc_adv_rx_desc *rx_desc,
>> +					   struct ethtool_mmsv *mmsv)
>> +{
>> +	u32 status_error = le32_to_cpu(rx_desc->wb.upper.status_error);
>> +	int smd;
>> +
>> +	smd = FIELD_GET(IGC_RXDADV_STAT_SMD_TYPE_MASK, status_error);
>> +
>> +	if (smd == IGC_RXD_STAT_SMD_TYPE_V)
>> +		ethtool_mmsv_event_handle(mmsv, ETHTOOL_MMSV_LP_SENT_VERIFY_MPACKET);
>> +	else if (smd == IGC_RXD_STAT_SMD_TYPE_R)
>> +		ethtool_mmsv_event_handle(mmsv, ETHTOOL_MMSV_LP_SENT_RESPONSE_MPACKET);
>> +}
>> @@ -2617,6 +2617,15 @@ static int igc_clean_rx_irq(struct igc_q_vector *q_vector, const int budget)
>>   			size -= IGC_TS_HDR_LEN;
>>   		}
>>   
>> +		if (igc_fpe_is_pmac_enabled(adapter) &&
>> +		    igc_fpe_is_verify_or_response(rx_desc, size, pktbuf)) {
> 
> ... invalid SMD-R and SMD-V frames will skip this code block altogether, and
> will be passed up the network stack, and visible at least in tcpdump, correct?
> Essentially, if the link partner would craft an ICMP request packet with
> an SMD-V or SMD-R, your station would respond to it, which is incorrect.
> 
> A bit strange, the behavior in this case seems a bit under-specified in
> the standard, and I don't see any counter that should be incremented.
> 
>> +			igc_fpe_lp_event_status(rx_desc, &adapter->fpe.mmsv);
>> +			/* Advance the ring next-to-clean */
>> +			igc_is_non_eop(rx_ring, rx_desc);
>> +			cleaned_count++;
>> +			continue;
>> +		}
> 
> To fix this, don't you want to merge the unnaturally split
> igc_fpe_is_verify_or_response() and igc_fpe_lp_event_status() into a
> single function, which returns true whenever the mPacket should be
> consumed by the driver, but decides whether to emit a mmsv event on its
> own? Merging the two would also avoid reading rx_desc->wb.upper.status_error
> twice.
> 
> Something like this:
> 
> static inline bool igc_fpe_handle_mpacket(struct igc_adapter *adapter,
> 					  union igc_adv_rx_desc *rx_desc,
> 					  unsigned int size, void *pktbuf)
> {
> 	u32 status_error = le32_to_cpu(rx_desc->wb.upper.status_error);
> 	int smd;
> 
> 	smd = FIELD_GET(IGC_RXDADV_STAT_SMD_TYPE_MASK, status_error);
> 	if (smd != IGC_RXD_STAT_SMD_TYPE_V && smd != IGC_RXD_STAT_SMD_TYPE_R)
> 		return false;
> 
> 	if (size == SMD_FRAME_SIZE && mem_is_zero(pktbuf, SMD_FRAME_SIZE)) {
> 		struct ethtool_mmsv *mmsv = &adapter->fpe.mmsv;
> 		enum ethtool_mmsv_event event;
> 
> 		if (smd == IGC_RXD_STAT_SMD_TYPE_V)
> 			event = ETHTOOL_MMSV_LP_SENT_VERIFY_MPACKET;
> 		else
> 			event = ETHTOOL_MMSV_LP_SENT_RESPONSE_MPACKET;
> 
> 		ethtool_mmsv_event_handle(mmsv, event);
> 	}
> 
> 	return true;
> }
> 
> 		if (igc_fpe_is_pmac_enabled(adapter) &&
> 		    igc_fpe_handle_mpacket(adapter, rx_desc, size, pktbuf)) {
> 			/* Advance the ring next-to-clean */
> 			igc_is_non_eop(rx_ring, rx_desc);
> 			cleaned_count++;
> 			continue;
> 		}
> 
> [ also remark the use of mem_is_zero() instead of memcmp() with a buffer
>    pre-filled with zeroes. It should be more efficient, for the simple
>    reason that it's accessing a single memory buffer and not two. Though
>    I'm surprised how widespread the memcmp() pattern is throughout the
>    kernel. ]

Thanks for the suggestion—it reads much better and flows smoothly. Got it 
on the driver needing to consume a non-zero packet buffer from SMD-V and SMD-R.

