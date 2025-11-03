Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34949CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRwPUktMFGp/Comr5LxB75bQkPyJT9fVhB6SL5uplVg=; b=4ElZQoawbzypZVovMs31kU66cH
	2yW0PME2arNEDJiMthwg+NGqA8HRoGBN9j2c1P0TK8yjcs3+Kd3HYSC3sSq3EI0MXILX4wQugchLr
	GRtV8pM62m0qV4H6EKDEFTO+5NSiF/W+DZhYqXqh2aVCnUpMEisVdfD5ewHgDMQ+VGrSmrIc9Ori/
	A5RFD7971r1NenwLD8p6yUstb9Tpuu3ayEkGJVus+9qMKm6dlFcTcaPZXFbE3u2aT+Oh5FtXkkoUq
	pnpxDtWjBKBKa1e/Lj+oAYXPqEBcrGphJrJYbLVEinkU4SRR8VY8p2YLZiDOWwJrOB9/+l+o4Wv04
	zl3X59jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvar-0000000A1aP-05RK;
	Mon, 03 Nov 2025 14:31:37 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvan-0000000A1Kg-2bQ8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:31:35 +0000
Message-ID: <04d22523-34ed-45f1-ba59-ab8170d749e7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762180233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SRwPUktMFGp/Comr5LxB75bQkPyJT9fVhB6SL5uplVg=;
	b=CcqTrDvFulflmHynUwnickQYQCFq4t8CE4PwdAmPujfMOwui7gI8S2olXAhbWue7OCcveD
	ecbLLXCpe/vGRm6BfXccmU2m7mbp21wGicq/nrW74fVNhbOJDYffL4x8u7J9wtKkckNNTB
	xjRFzL41d1EnE96DYP/ewai31vzD5Ag=
Date: Mon, 3 Nov 2025 14:30:26 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next 6/7] net: pch_gbe: convert to use ndo_hwtstamp
 callbacks
To: Jakub Kicinski <kuba@kernel.org>,
 Kory Maincent <kory.maincent@bootlin.com>
Cc: Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Sunil Goutham <sgoutham@marvell.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
References: <20251031004607.1983544-1-vadim.fedorenko@linux.dev>
 <20251031004607.1983544-7-vadim.fedorenko@linux.dev>
 <20251031183525.5b8b8110@kmaincent-XPS-13-7390>
 <20251031113840.067ef711@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20251031113840.067ef711@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_063134_155557_47559EC9 
X-CRM114-Status: GOOD (  10.98  )
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

On 31/10/2025 18:38, Jakub Kicinski wrote:
> On Fri, 31 Oct 2025 18:35:25 +0100 Kory Maincent wrote:
>>>   	case HWTSTAMP_FILTER_PTP_V1_L4_SYNC:
>>> -		adapter->hwts_rx_en = 0;
>>> +		adapter->hwts_rx_en = cfg->rx_filter;
>>
>> It seems there is a functional change here.
>>
>>> 		pch_ch_control_write(pdev, SLAVE_MODE | CAP_MODE0);
> 
> Good catch. Looks like SLAVE | MODE0 translates to 0 | 0
> so presumably the device doesn't actually support timestamping
> of V1 L4 SYNC messages? Unclear what to do about this.
> Maybe let's leave it be? keep the hwts_rx_en = 0; ?
> Not strictly correct but at least we won't break anything.

Ok, it looked like typo as the function actually does the register
manipulation while it's not doing anything for disabling RX timestamping
which probably means it's enabled by default.
But as the code was added back in 2012, and nobody complained, we should 
probably keep it as is. I'll send v2 shortly.

