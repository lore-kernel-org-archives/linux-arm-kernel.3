Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68EAC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehW9K4c48CwLY/BR+mDs7xsKqDAw7Qeg9IJQ7Ou3tbg=; b=qUhaVgAe2AC9eepJ62mfab+PJi
	KFhzEQ21g5g5+uzblJUPXvjFhA9+FKCbjUn+g1L/O3sAV4MmE/kfI1TcDvqikCEYx/jVCqmDOqY5/
	9B8YEgn0kp9xJzNXl4h0ULhB/+rWEVpzzoH2OFDnn1CswRAh0eKau34JZBxE7N1OIDL9+3XlxVesH
	gvXnm4lFbYDoNi1U52dlJ4jr6qSj5jpj4Dz+kNpby6cUM4zhKW4AjCyBCEtIPFFIN+R1qdiV8hi34
	8YhKArMwMtjYM16JIrV0RW1tA6s0l0UfyVX+nIabTHns6K2ZMnZRnu4ll/cu0zBZSvJZgOogdGLN8
	WrqzRT1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSA0-0000000AUXL-13j3;
	Fri, 07 Feb 2025 17:29:00 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRhM-0000000AOLl-40PL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 16:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738947565; x=1770483565;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=h75b+TdsJ58/EyAZzGusAGULFypKzhj4oZJY0fm1wu8=;
  b=Cl6LlcBNDgMZSNek0LhjuIuQZShCcC3pLXwv1/7f5yf6Gp/KhAGfPojq
   da/LDB3NzjblgoxzfXSVDMafs9NJxcaT9v24jkuPFIfGSGw0VfQBKAz26
   bO1vCKlW/HLG5L38AlsOqBNRI4nxGkUYLYtbAB6s3WLNLjXIJDQxj9P+1
   1gVJQeQQEBLItlkV17dK4piTVbMr6fA59v8iieYP1hiU+lH8d7geQLLp8
   +nl7p5UqUUsHM6pbaEaNuL2x5zzKan931PM+iyYw5OlZkqdLv9PFQJ54L
   ZJv4IZ+yUoXAqSmDSUEzG57dkQiA8DfsJQr98m1PdEPwzCVE7S8qMFQWn
   g==;
X-CSE-ConnectionGUID: sN5iJSGxTtW4dQheKajOeQ==
X-CSE-MsgGUID: JclNT8+xRRmq3+gpF3URmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="42436000"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="42436000"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 08:59:24 -0800
X-CSE-ConnectionGUID: xh97f0y8TjGtJI3gx/8V4A==
X-CSE-MsgGUID: uTOuguuVSR6n8OMUQ6ULHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116777275"
Received: from wkuan-mobl1.gar.corp.intel.com (HELO [10.247.64.179]) ([10.247.64.179])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 08:59:15 -0800
Message-ID: <65c82c04-6c71-4120-aaa0-5d20e7eca0fe@linux.intel.com>
Date: Sat, 8 Feb 2025 00:59:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next v2 5/9] igc: Add support for frame preemption
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
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Furong Xu <0x1207@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Petr Tesarik <petr@tesarici.cz>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
References: <20250205100524.1138523-1-faizal.abdul.rahim@linux.intel.com>
 <20250205100524.1138523-6-faizal.abdul.rahim@linux.intel.com>
 <20250205171234.cuscjpzdyc34ofbn@skbuf>
 <6bf3f4b2-efee-41fe-97b3-cb53eca4dfed@linux.intel.com>
 <20250206150410.u4rehwxnnuhtcfxr@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250206150410.u4rehwxnnuhtcfxr@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_085925_013872_D574F74E 
X-CRM114-Status: GOOD (  18.01  )
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



On 6/2/2025 11:04 pm, Vladimir Oltean wrote:
> On Thu, Feb 06, 2025 at 10:40:11PM +0800, Abdul Rahim, Faizal wrote:
>>
>> Hi Vladimir,
>>
>> Thanks for the quick review, appreciate your help.
>>
>> On 6/2/2025 1:12 am, Vladimir Oltean wrote:
>>> On Wed, Feb 05, 2025 at 05:05:20AM -0500, Faizal Rahim wrote:
>>>> This patch implements the "ethtool --set-mm" callback to trigger the
>>>> frame preemption verification handshake.
>>>>
>>>> Uses the MAC Merge Software Verification (mmsv) mechanism in ethtool
>>>> to perform the verification handshake for igc.
>>>> The structure fpe.mmsv is set by mmsv in ethtool and should remain
>>>> read-only for the driver.
>>>>
>>>> igc does not use two mmsv callbacks:
>>>> a) configure_tx()
>>>>      - igc lacks registers to configure FPE in the transmit direction.
>>>
>>> Yes, maybe, but it's still important to handle this. It tells you when
>>> the preemptible traffic classes should be sent as preemptible on the wire
>>> (i.e. when the verification is either disabled, or it succeeded).
>>>
>>> There is a selftest called manual_failed_verification() which supposedly
>>> tests this exact condition: if verification fails, then packets sent to
>>> TC0 are supposed to bump the eMAC's TX counters, even though TC0 is
>>> configured as preemptible. Otherwise stated: even if the tc program says
>>> that a certain traffic class is preemptible, you don't want to actually
>>> send preemptible packets if you haven't verified the link partner can
>>> handle them, since it will likely drop them on RX otherwise.
>>
>> Even though fpe in tx direction isn't set in igc, it still checks
>> ethtool_mmsv_is_tx_active() before setting a queue as preemptible.
>>
>> This is done in :
>> igc_tsn_enable_offload(struct igc_adapter *adapter) {
>> {
>> 	....
>> 	if (ethtool_mmsv_is_tx_active(&adapter->fpe.mmsv) &&
>>              ring->preemptible)
>> 	    txqctl |= IGC_TXQCTL_PREEMPTIBLE;
>>
>>
>> Wouldn't this handle the situation mentioned ?
>> Sorry if I miss something here.
> 
> And what if tx_active becomes true after you had already configured the
> queues with tc (and the above check caused IGC_TXQCTL_PREEMPTIBLE to not
> be set)? Shouldn't you set IGC_TXQCTL_PREEMPTIBLE now? Isn't
> ethtool_mmsv_configure_tx() exactly the function that notifies you of
> changes to tx_active, and hence, aren't you interested in setting up a
> callback for it?
> 

Ahh okay, got it. I sent v3 that also included this update. Thanks!

