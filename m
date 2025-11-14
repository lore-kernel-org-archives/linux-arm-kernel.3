Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C251CE8D43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4pXsAK4BZupqlRF4vfkbjsbLDGVETSRtstfgB3HVmc=; b=tTQlLR3cLXxVlZ0elJfyd2yGw5
	tuyOSivV7YrKQ3Ufw4378Rm2hUbf+lKH2GxyjG0tvJp3HF+yTx4Xuko77eC/HuBjPnr5NiHMzPtmI
	SKwEiRLo7SrwdeT1phmWHiJMrb3CGaBLV11VZoR5ilSLU0/bunft0XUnuBW1W/qzEzDqvV9mEyRQ6
	R4hC9jZ+Nl6StR56VwPp2atO1NvzdrW2lvR6R/ndBcPEUjMqyxbz3lkedYmRM2ic+4MntUUrabZlr
	UKKeq05fBc3MDrEHFm6RB/0BWU1psr9lgPhoDQm00cskiDVzCboH1gf01v6hRPwk9NVHEyGSBW3Ha
	WmxYM1Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvdG-0000000CXyd-1KFt;
	Fri, 14 Nov 2025 15:22:38 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvdD-0000000CXy2-49An;
	Fri, 14 Nov 2025 15:22:37 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 15802340090;
	Fri, 14 Nov 2025 15:22:30 +0000 (UTC)
Received: from [192.168.1.23] (unknown [98.97.36.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 491CD13C2B0;
	Fri, 14 Nov 2025 07:22:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 491CD13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1763133748;
	bh=TH+Nrt7q+9X2Vdyupy3/Fo/i1Q9MVIoHvgkBfF0TRQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rGsrr7MEikNS+O47qapdoYAOl1p1pcuMKx9KZ0Zz8GjYTDeqZkIZ+NnL0/cW0S3LX
	 1vvonONhtWa6XkD+WWcl0xlntzf8iqEtph35XKov92SMKDuhuTYf/EUlHffJxqIbj5
	 D1OrcUio065QNbA0L9N0YiHqJNFh8FkGKnYDzw+M=
Message-ID: <c0dd1c92-982c-49aa-a4cf-fcf4b105e839@candelatech.com>
Date: Fri, 14 Nov 2025 07:22:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mt76 0/4] wifi: mt76: mt7996: Fix some locking issues for
 MLO
To: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251114-mt76-fix-missing-mtx-v1-0-259ebf11f654@kernel.org>
Content-Language: en-MW
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <20251114-mt76-fix-missing-mtx-v1-0-259ebf11f654@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1763133752-K2xk0p8JVr5y
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;ut7;1763133752;K2xk0p8JVr5y;<greearb@candelatech.com>;cd09869c97ce2e719a3744df88686fd8
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_072236_053792_C11043F3 
X-CRM114-Status: GOOD (  12.22  )
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

Hello Lorenzo,

These 4 patches appear to fix some of the problems, but the mac802.11/key.c lockdep
splat remains.  I sent you email with the details.

The kernel crash due to NPE that I was previously hacking around appears gone now,
or at least harder to reproduce.

You are welcome to add:

Tested-by: Ben Greear <greearb@candelatech.com>

Thanks,
Ben


On 11/14/25 05:16, Lorenzo Bianconi wrote:
> 
> ---
> Lorenzo Bianconi (4):
>        wifi: mt76: mt7996: grab mt76 mutex in mt7996_mac_sta_event()
>        wifi: mt76: mt7996: Move mt7996_update_beacons inside mt76 mutex critical section
>        wifi: mt76: Move mt76_abort_scan out of mt76_reset_device()
>        wifi: mt76: mt7996: skip deflink accounting for offchannel links
> 
>   drivers/net/wireless/mediatek/mt76/mac80211.c    |  2 --
>   drivers/net/wireless/mediatek/mt76/mt7915/mac.c  |  2 ++
>   drivers/net/wireless/mediatek/mt76/mt7996/mac.c  |  5 +++--
>   drivers/net/wireless/mediatek/mt76/mt7996/main.c | 21 ++++++++++++++-------
>   4 files changed, 19 insertions(+), 11 deletions(-)
> ---
> base-commit: c99ebb6132595b4b288a413981197eb076547c5a
> change-id: 20251114-mt76-fix-missing-mtx-db664ffcce1a
> 
> Best regards,

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


