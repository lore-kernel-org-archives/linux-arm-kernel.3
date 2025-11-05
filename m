Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D655ECCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 19:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPCG4/wKuRgOdZXZHsD5gh/cG/gpHhwNURgx6mdwEdM=; b=Pl4x/anfW1qUVfGL522ySKTvcp
	mH4Rach7Mu6CUccp1bQF6cqW/D5gRXS0YfGtkCtMUgSlMXbgscG/VuI4bZPDDSqN+fpl0cAvSOzUc
	861xQODuh/9LSg4omp7qRv+QS21MK0n/kNl/muHuVFHx4fICpoz8K8I2K7jSclJ5ZikO/sEfXs+8w
	MBgAqRNu30KLdCJ0FnTQrRnZS12wjAjQvgvtGsVhpMbRAop77WdN/3vcjKAxiDwmU456Mv61vwNm7
	w0bpx/v8Ge9bwXUrSCLPayD11DqhzUuFggzfo7tfn5g/qXAQRfRWNOFmeCohMKNOE78MGtJQuRs8i
	bSC2mTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGiw5-0000000EI7J-3ztz;
	Wed, 05 Nov 2025 19:12:49 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGiw3-0000000EI6t-0sAm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 19:12:48 +0000
Message-ID: <3695841c-d9e7-4c71-a81d-4fca5e1de8fc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762369962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jPCG4/wKuRgOdZXZHsD5gh/cG/gpHhwNURgx6mdwEdM=;
	b=o2Dl9lqch12Si/UQeahzlhmTvC+ANlu0cTNgNVc+dxHTGCBQ6GeN/RZ0ll8beLDKEk23e8
	Rpvmb7+yBmRfodjZNWm9gtaIyYOrFoYFV4hu/qhnGqD87+9LzJArvZc7FLHrOAboOgsZsX
	6DRa1x6IYuBoLTBqUyGvphBDWA2tpJk=
Date: Wed, 5 Nov 2025 19:12:37 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 1/7] bnx2x: convert to use ndo_hwtstamp
 callbacks
To: Jakub Kicinski <kuba@kernel.org>
Cc: Manish Chopra <manishc@marvell.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Sunil Goutham <sgoutham@marvell.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
References: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
 <20251103150952.3538205-2-vadim.fedorenko@linux.dev>
 <20251104173737.3f655692@kernel.org>
 <f28ee997-ed08-4123-83ab-3496e88ed815@linux.dev>
 <20251105104610.726fb780@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20251105104610.726fb780@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_111247_482461_3064E700 
X-CRM114-Status: GOOD (  10.69  )
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

On 05/11/2025 18:46, Jakub Kicinski wrote:
> On Wed, 5 Nov 2025 13:33:08 +0000 Vadim Fedorenko wrote:
>>>>    	bp->hwtstamp_ioctl_called = true;
>>>> -	bp->tx_type = config.tx_type;
>>>> -	bp->rx_filter = config.rx_filter;
>>>> +	bp->tx_type = config->tx_type;
>>>> +	bp->rx_filter = config->rx_filter;
>>>>    
>>>>    	rc = bnx2x_configure_ptp_filters(bp);
>>>
>>> bnx2x_configure_ptp_filters() may return -ERANGE if settings were not applied.
>>> This may already be semi-broken but with the get in place we will make
>>> it even worse.
>>
>> Ah, you mean in case of -ERANGE we will still have new filter
>> configuration set in bp object? It's easy to fix, but it will be
>> some kind of change of behavior. If it's acceptable, I'm happy to send
>> v3 of the patchset.>
> 
> True, you can probably make the -ERANGE handling a separate patch
> for ultimate clarity.

Well, looks like there is a special guard hwtstamp_ioctl_called
implemented, so it looks safe to move the check. I've sent these patches 
as a separate patchset.

