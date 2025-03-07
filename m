Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A85C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 03:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdn4lX+kFQyWfA92qDWyZd8yYqxG7AVp6aPd2bjWTIg=; b=i7ItX9Q8YxGOdtvbR2+iLmlMu+
	pS8VDVA1hFq7QDl9gp1+4Lulp0bWZ748nD+gc0OKj6OBJr8w3Msz04JeuGhh2gwAj9MUE/xLUxFLP
	gxUzN7Of3RZxZ/2Wg6PNjSvqdMczaoNM2HK53gB9aQlFF2ESSqw+68dsHGd+RwPJE78g23bQy0q4/
	sKagl+cSG3TrYKI3ukjLxNt1eGAmKKrKAAPPIo2SpaqCjSMZ8ims9A9g4C1W3m4EfimDhhmr97Pjn
	Cds4t7LLWhhOETZUBHMleX2SMUrnx5qo5ykFo04FNuUwydwg3KerEfnJwOiL7XT1euv2yNce6abgX
	/QU3vlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOIi-0000000Cyhe-3iZT;
	Fri, 07 Mar 2025 03:23:04 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOH6-0000000CyUm-15w2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 03:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741317684; x=1772853684;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Jg5XeRxyuKD825uDbJYMZSOpqP9zMmh8t5nyw3/cSXk=;
  b=eVKYI77CQg1VBIAf3OxuOQrecRd1/4XNcA6wNVhduzIa7gX9tb5hf+Vu
   k9i6sqD8EQzt5uLhJ7LZ4ZDpO6FNEaw8jYbOCYKOh80+WJm+qZmWQrJwV
   Cit4b+ZOWvSjS4ZM/Xx368Uek4dio7dQJUK2agC17J6ARiioZRQ93hlUb
   sEpFfS3ZLcNDyUGqakmanJAmSxVSuMkAQimAZ0TFyMhv8/ldc/5ygpw+y
   FFwAYIYIP3lnCD+cUckJG9nmRV/48zOD28NQ8qSragERDKxpRPNf1AEaA
   zftZQxxU0h8593rqSZeIiGc4SsPI+Oe/Or7XcOhV79q1AfTzLgE+flQMZ
   g==;
X-CSE-ConnectionGUID: uNE8Zf0CRDaEK/iuO0pEeg==
X-CSE-MsgGUID: H3NIFVoxQ76bfwV3ZPrH8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="45164193"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="45164193"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 19:21:23 -0800
X-CSE-ConnectionGUID: iDlWGXgBRa+qU7VDX2G/zg==
X-CSE-MsgGUID: jWEeBpZ0ToCaX0rjX89xkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="119388873"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.100.177]) ([10.247.100.177])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 19:20:57 -0800
Message-ID: <df5f2ff0-2ead-4074-a40e-8a2fc9b63339@linux.intel.com>
Date: Fri, 7 Mar 2025 11:20:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next v8 11/11] igc: add support to get frame
 preemption statistics via ethtool
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
 <20250305130026.642219-12-faizal.abdul.rahim@linux.intel.com>
 <20250305130026.642219-12-faizal.abdul.rahim@linux.intel.com>
 <20250306004809.q2x565rys5zja6kh@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250306004809.q2x565rys5zja6kh@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_192124_351347_7D324AC4 
X-CRM114-Status: UNSURE (   9.47  )
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



On 6/3/2025 8:48 am, Vladimir Oltean wrote:
> On Wed, Mar 05, 2025 at 08:00:26AM -0500, Faizal Rahim wrote:
>> +/* Received out of order packets with SMD-C */
>> +#define IGC_PRMEXCPRCNT_OOO_SMDC			0x000000FF
>> +/* Received out of order packets with SMD-C and wrong Frame CNT */
>> +#define IGC_PRMEXCPRCNT_OOO_FRAME_CNT			0x0000FF00
>> +/* Received out of order packets with SMD-C and wrong Frag CNT */
>> +#define IGC_PRMEXCPRCNT_OOO_FRAG_CNT			0x00FF0000
>> +/* Received packets with SMD-S and wrong Frag CNT and Frame CNT */
>> +#define IGC_PRMEXCPRCNT_MISS_FRAME_FRAG_CNT		0xFF000000
>>   
>> +/**
>> + * igc_ethtool_get_frame_ass_error - Get the frame assembly error count.
>> + * @reg_value: Register value for IGC_PRMEXCPRCNT
>> + * Return: The count of frame assembly errors.
>> + */
>> +static u64 igc_ethtool_get_frame_ass_error(u32 reg_value)
>> +{
>> +	u32 ooo_frame_cnt, ooo_frag_cnt; /* Out of order statistics */
>> +	u32 miss_frame_frag_cnt;
>> +
>> +	ooo_frame_cnt = FIELD_GET(IGC_PRMEXCPRCNT_OOO_FRAME_CNT, reg_value);
>> +	ooo_frag_cnt = FIELD_GET(IGC_PRMEXCPRCNT_OOO_FRAG_CNT, reg_value);
>> +	miss_frame_frag_cnt = FIELD_GET(IGC_PRMEXCPRCNT_MISS_FRAME_FRAG_CNT, reg_value);
>> +
>> +	return ooo_frame_cnt + ooo_frag_cnt + miss_frame_frag_cnt;
>> +}
> 
> These counters are quite small (8 bits each). What is their behavior
> once they reach 255? Saturate? Truncate? Do they clear on read?
> 
Hi Vladimir,

These are part of the statistic registers, which in IGC, reset upon read. 
When they reach their maximum value, each field remain at 0xFF.



