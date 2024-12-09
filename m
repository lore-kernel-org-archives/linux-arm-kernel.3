Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4977E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dEgr6OpgHZjVc2Im78pfKS7HysoQJSF6iVpM5jFCQU=; b=KMX96bzWvi1kIYbhcSnyHWcYo7
	JNOMQPzVFMUy9ApVw6Ef6L6CJCu6kCXQFm1C1Uk9eJmdch3To7lla/k2g4AO4cb5HlF2Xs4sNqX9Z
	vB36QU7BElP10Af0ClOfrCVqY8rre5msGyuLZ3NiJn1BpYPJ1kKttuTh4kFO5QOmgyqKGIGtgLhpv
	0HMQVTSlDVt+JPMsKMoE+UIyw0HIwYWKcEYeZlX7PkHcBzZr6MqrE4U9yKY7uDZsrfCSmp9GVvaXK
	VOjGoRYlZyI2iZBTSMTOhS19Rs7aL8HIIzx9hsY7yh9A06CGuv0qV2zp0CeVN3HOde/aIxlXEa+ZR
	1zXWnwpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKf1X-00000008Fs1-03zu;
	Mon, 09 Dec 2024 14:46:11 +0000
Received: from mta-64-226.siemens.flowmailer.net ([185.136.64.226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKf0T-00000008Fd9-3qXW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 14:45:08 +0000
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202412091444589586e6f660f58efd0b
        for <linux-arm-kernel@lists.infradead.org>;
        Mon, 09 Dec 2024 15:44:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=diogo.ivo@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/dEgr6OpgHZjVc2Im78pfKS7HysoQJSF6iVpM5jFCQU=;
 b=MpvFD+rCvxzx8xva5hr3nsUvs2LKTdXkzEfM04rBRDxpPIIPYXnkeC3YZFdVgfvEZdoAgw
 z61x8EOUQjPlhsAanQBmDeesAimgmGKPZAnJAhXPKcrkXJqyCJ357X9C0PQ1fW/hI43vZyB/
 ZF2dIWpjCBEya6UJ2O2qoCKKK4y89XUEpMfE10IShP8ruEVFsaVC3L9/0yz1HE0qc4iZwmI4
 WROiTw8NYdq2c7bLB9mzW9/zOM+CgbO3bK440lUvbKTeriqZbsbdr6lRG4OE/vpWLYQ9yWFq
 vQs3O/tT2BtR0TGsNSQpu6dl+6olTg95I8iGlJrsQnB32nM0UdIEsdFQ==;
Message-ID: <320d8f96-fcff-48e7-9814-6586f7f642ca@siemens.com>
Date: Mon, 9 Dec 2024 14:44:56 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net v3 1/2] net: ti: icssg-prueth: Fix firmware load
 sequence.
To: Meghana Malladi <m-malladi@ti.com>, Roger Quadros <rogerq@kernel.org>,
 vigneshr@ti.com, jan.kiszka@siemens.com, javier.carrasco.cruz@gmail.com,
 jacob.e.keller@intel.com, horms@kernel.org, pabeni@redhat.com,
 kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 andrew+netdev@lunn.ch
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, danishanwar@ti.com
References: <20241205082831.777868-1-m-malladi@ti.com>
 <20241205082831.777868-2-m-malladi@ti.com>
 <a86bc0b1-8bb4-477e-b7e1-13921bf47b53@kernel.org>
 <64621290-2488-474d-b2ed-597a1f4ac85f@ti.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@siemens.com>
In-Reply-To: <64621290-2488-474d-b2ed-597a1f4ac85f@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328357:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_064506_457544_114D39E3 
X-CRM114-Status: GOOD (  15.82  )
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

Hi all,

On 12/9/24 10:34 AM, Meghana Malladi wrote:
> 
> 
> On 05/12/24 18:38, Roger Quadros wrote:
>> Hi,
>>
>> On 05/12/2024 10:28, Meghana Malladi wrote:
>>> From: MD Danish Anwar <danishanwar@ti.com>
>>>
>>> Timesync related operations are ran in PRU0 cores for both ICSSG SLICE0
>>> and SLICE1. Currently whenever any ICSSG interface comes up we load the
>>> respective firmwares to PRU cores and whenever interface goes down, we
>>> stop the resective cores. Due to this, when SLICE0 goes down while
>>> SLICE1 is still active, PRU0 firmwares are unloaded and PRU0 core is
>>> stopped. This results in clock jump for SLICE1 interface as the timesync
>>> related operations are no longer running.
>>>
>>> As there are interdependencies between SLICE0 and SLICE1 firmwares,
>>> fix this by running both PRU0 and PRU1 firmwares as long as at least 1
>>> ICSSG interface is up. Add new flag in prueth struct to check if all
>>> firmwares are running.
>>>
>>> Use emacs_initialized as reference count to load the firmwares for the
>>> first and last interface up/down. Moving init_emac_mode and 
>>> fw_offload_mode
>>> API outside of icssg_config to icssg_common_start API as they need
>>> to be called only once per firmware boot.
>>>
>>> Fixes: c1e0230eeaab ("net: ti: icss-iep: Add IEP driver")
>>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>>> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
>>> ---
>>>
>>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/ 
>>> net/ethernet/ti/icssg/icssg_prueth.h
>>> index f5c1d473e9f9..b30f2e9a73d8 100644
>>> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
>>> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
>>> @@ -257,6 +257,7 @@ struct icssg_firmwares {
>>>    * @is_switchmode_supported: indicates platform support for switch 
>>> mode
>>>    * @switch_id: ID for mapping switch ports to bridge
>>>    * @default_vlan: Default VLAN for host
>>> + * @prus_running: flag to indicate if all pru cores are running
>>>    */
>>>   struct prueth {
>>>       struct device *dev;
>>> @@ -298,6 +299,7 @@ struct prueth {
>>>       int default_vlan;
>>>       /** @vtbl_lock: Lock for vtbl in shared memory */
>>>       spinlock_t vtbl_lock;
>>> +    bool prus_running;
>>
>> I think you don't need fw_running flag anymore. Could you please 
>> remove it
>> from struct prueth_emac?
>>
> 
> This flag is still being used by SR1, for which this patch doesn't 
> apply. So I prefer not touching this flag for the sake of SR1.

Currently for SR1.0 this flag is set but not used anywhere in the code, 
so it can be removed.

Best regards,
Diogo

