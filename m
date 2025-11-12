Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3DACD484E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 21:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8q3Qe6gb056JvM9s++jg7oTSQ04Kj7us0jGA/rzNvOs=; b=GgOBv6eHgxOUeAug0Yup3ZhNSa
	j01iEHU5L7bwHwPi+HqGcBYwR9cH/4Bm0GInyo1HUH1ViVq3qsVOpQBRWgpitStXKafwdB2h19HOQ
	XSSU1qPGFArRRCm8GqawZnPANpfYlUORjDd9sMTxn3MNHRaPnVvCGzqcBs70TEcL3XYDyAg+fRhMu
	CTslafYklmXJfZ3id6jH0cbHdpS2oAGPBvf4yivwFduyICx02rsUNavsQi6cCZcneAdNZt+mXIKOy
	1xWEYtxPZlB14NQ6VbnXz11KD2EtcjO/4lS4C8McJoFOR6OSzy1rfyiIF5ZVa3hY4UFajnFqhd9jl
	5VVfjs4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJIrJ-00000009Yxg-3MVP;
	Wed, 12 Nov 2025 21:58:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJIrH-00000009YxH-0Um0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 21:58:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8A9943D2C;
	Wed, 12 Nov 2025 21:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A965AC19423;
	Wed, 12 Nov 2025 21:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762984708;
	bh=DCH5YBw66ErM1uxNNoYc8WJxzsfE8ZpJahysVMrqAkU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oiByVJTnWtO3RGPuzsmVE4E2uE/UfTblS478WXOkC0X6nxJ04o4iYt40TAukSmtzM
	 b9LjYsPnXMBkDmACHOOjmm+zPI6GlG8BVFMZ/BbVVkrwXCk0fM+OYtixdNnylkimVG
	 i+/E/UN8DriSWpPQR9nP/eEzoEHPcfm3AmmhuWMzlvK/fJAB6l4bg/wcqXi2tZxha6
	 ydiIQOZf886r2mu/1FfxaVQ4sdGVWWPcML1X3WB+XAgPk16zytV9u170+XMXXONFx/
	 s2lGF8aKLMP7rPymB7B6IYBACriIQPv1lknibV0I139ZO3Y2oxU044TziB1secfV/p
	 rlx8c+ZIzYF8w==
Message-ID: <69451eb5-a36e-4443-8e34-7a06627b087d@kernel.org>
Date: Wed, 12 Nov 2025 22:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net V3 1/2] veth: enable dev_watchdog for detecting
 stalled TXQs
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?=
 <toke@toke.dk>, Eric Dumazet <eric.dumazet@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 ihor.solodrai@linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
 makita.toshiaki@lab.ntt.co.jp, toshiaki.makita1@gmail.com,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-team@cloudflare.com
References: <176236363962.30034.10275956147958212569.stgit@firesoul>
 <176236369293.30034.1875162194564877560.stgit@firesoul>
 <20251106172919.24540443@kernel.org>
 <b9f01e64-f7cc-4f5a-9716-5767b37e2245@kernel.org>
 <20251107175445.58eba452@kernel.org>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <20251107175445.58eba452@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_135831_189441_6C1C240F 
X-CRM114-Status: GOOD (  16.80  )
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



On 08/11/2025 02.54, Jakub Kicinski wrote:
> On Fri, 7 Nov 2025 14:42:58 +0100 Jesper Dangaard Brouer wrote:
>>> I think this belongs in net-next.. Fail safe is not really a bug fix.
>>> I'm slightly worried we're missing a corner case and will cause
>>> timeouts to get printed for someone's config.
>>
>> This is a recovery fix.  If the race condition fix isn't 100% then this
>> patch will allow veth to recover.  Thus, to me it makes sense to group
>> these two patches together.
>>
>> I'm more worried that we we're missing a corner case that we cannot
>> recover from. Than triggering timeouts to get printed, for a config
>> where NAPI consumer veth_poll() takes more that 5 seconds to run (budget
>> max 64 packets this needs to consume packets at a rate less than 12.8
>> pps). It might be good to get some warnings if the system is operating
>> this slow.
>>
>> Also remember this is not the default config that most people use.
>> The code is only activated if attaching a qdisc to veth, which isn't
>> default. Plus, NAPI mode need to be activated, where in normal NAPI mode
>> the producer and consumer usually runs on the same CPU, which makes it
>> impossible to overflow the ptr_ring.  The veth backpressure is primarily
>> needed when running with threaded-NAPI, where it is natural that
>> producer and consumer runs on different CPUs. In our production setup
>> the consumer is always slower than the producer (as the product inside
>> the namespace have installed too many nftables rules).
> 
> I understand all of this, but IMO the fix is in patch 2.
> This is a resiliency improvement, not a fix.

As maintainer you have the final say, so I send a [V4]. Notice that
doing it this way will cause a merge conflict once net and net-next gets
merged.

[V4] 
https://lore.kernel.org/all/176295319819.307447.6162285688886096284.stgit@firesoul/

--Jesper

