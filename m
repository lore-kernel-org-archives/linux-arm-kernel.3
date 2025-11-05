Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC48CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMspv3hUsxYf33GQdhTPOGgMERd6YtOjZBMB/CDCRMc=; b=sAPb5HoqxxAgQAMgLZqnL/ow/w
	yTn0aCxfKRmpDx4bpPeLD5yy13+Inan70kTk20suEbtg95iAtvBoJSeDDrMczF62tLTJixGk6AFQA
	LwI3Y0VW1WVBWM1U1W5ehuu5xvV7+Pcxxutq6Uzvkl5N+cQtR9tRmeLiaCX5nBBYAUxonqyj0vVQI
	++x/0W1T0pyFHT2SFnwn7ndeddRqxTrCTC65puqkeOVZuVdBscLckKulerC9IksAWkZWRcrZGnxjh
	aFXpleLDrEfXEzbKGYSb6OK5LSFltec/w1Uh2fFcU9k0n7YOIA6x3QNGzUOUGGLxU36K6t4XqNEcw
	0w7d0VRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdgx-0000000DnMC-1iEU;
	Wed, 05 Nov 2025 13:36:51 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdgt-0000000DnLS-47y8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 13:36:50 +0000
Message-ID: <f5713f16-d004-4794-9cfd-dad4bd4a1f4e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762349805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZMspv3hUsxYf33GQdhTPOGgMERd6YtOjZBMB/CDCRMc=;
	b=gao/pfr6YZEQh1VETo3tz3E330AzRN97tMm0hF2lvcK+DtOaq4FxspQCYwhF3TeVJQgqZP
	VCXJhP4gks4LR1a0fms78Ez+Vc17VYFCcJL1q3tmXk8vliNIi6eXdIPrzeDoFx8CGcOq2Q
	yQyDsYBWk5hVClIwRDDHYtdq12J0o5Q=
Date: Wed, 5 Nov 2025 13:36:42 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 7/7] qede: convert to use ndo_hwtstamp
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
 <20251103150952.3538205-8-vadim.fedorenko@linux.dev>
 <20251104174340.5d2d8741@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20251104174340.5d2d8741@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_053648_967120_F32B47DE 
X-CRM114-Status: UNSURE (   9.88  )
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

On 05/11/2025 01:43, Jakub Kicinski wrote:
> On Mon,  3 Nov 2025 15:09:52 +0000 Vadim Fedorenko wrote:
>>   	ptp->hw_ts_ioctl_called = 1;
>> -	ptp->tx_type = config.tx_type;
>> -	ptp->rx_filter = config.rx_filter;
>> +	ptp->tx_type = config->tx_type;
>> +	ptp->rx_filter = config->rx_filter;
>>   
>>   	rc = qede_ptp_cfg_filters(edev);
>> -	if (rc)
>> +	if (rc) {
>> +		NL_SET_ERR_MSG_MOD(extack,
>> +				   "One-step timestamping is not supported");
>>   		return rc;
>> +	}
>> +
>> +	config->rx_filter = ptp->rx_filter;
> 
> Same story as the first patch.
> I suppose these drives may predate the advanced tx config options.
> Simple fix would be to move the tx_filter validation here instead.
> 
> I'll apply 2-6.

Got it. I'll send fixed versions of patch 1 and patch 7, thanks!

