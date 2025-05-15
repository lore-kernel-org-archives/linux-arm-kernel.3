Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530FBC54754
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 07:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsFmIkwdH9OoXCMppMf8wUNa7gtRjrtDKlbCp4u90l4=; b=oUvu6gEww+O58uxoPbhSHDKdFO
	SStHOuCc1McMa9DSeu0/DI2BJuFobbYOE4vly90nIJmOH0JTv4gNOc/z01BeSp03JQ+nygun38CDY
	cLaFw4njqEr98wi0fFw4jeqTZbMMpftqsYqmlEPsHv7u77/uwKD/0OP53piIO345XuCL653ZwmG2T
	c9SYk2xuMyJ6d/aP/HBAcQglIQ21j3WEdyxwz4GIdPjLSOAa3rR8aW+H0E0mMHy8qYbX3utJpe8y/
	zVAWlIzz8hmiPHBW5Ln5dP6vhTvmqENpv3uGJr/P2PeYLMv6MpOXQiT9rQbHJAXc2qCtv8iingQ+e
	KM/3XbfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSdC-0000000HDmI-4BH9;
	Thu, 15 May 2025 07:03:51 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSAE-0000000H9v0-0E0D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 06:33:55 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54F6XcsB2840777
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 01:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747290818;
	bh=vsFmIkwdH9OoXCMppMf8wUNa7gtRjrtDKlbCp4u90l4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=AJuuJZmoSy+db7mgObmuNpYkkrQ0tFEJr8H+XgANp8lEmD5mFbnpK3VkuKC3KUp1C
	 VNmn4/ashv7iKQSj7ChApECaXKrNf6xFMq/v2rtez45sqUR9OJqjQW0awtb6U7NP0J
	 b19oC07uC/B+xhPyZiWdW4PqPy/Eup1QcZJsUc5s=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54F6XcZR129050
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 May 2025 01:33:38 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 May 2025 01:33:37 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 May 2025 01:33:37 -0500
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54F6XWVx116598;
	Thu, 15 May 2025 01:33:33 -0500
Message-ID: <4373351e-6dfe-428f-8253-dcc6a1374335@ti.com>
Date: Thu, 15 May 2025 12:03:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10] net: ti: icssg-prueth: add TAPRIO offload
 support
To: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: Meghana Malladi <m-malladi@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Simon Horman <horms@kernel.org>,
        Guillaume La Roque <glaroque@baylibre.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Roger Quadros <rogerq@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <srk@ti.com>,
        Roger
 Quadros <rogerq@ti.com>
References: <20250502104235.492896-1-danishanwar@ti.com>
 <20250506141709.rnhvtoghn2tc47rw@skbuf>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20250506141709.rnhvtoghn2tc47rw@skbuf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_233354_298898_6DA37738 
X-CRM114-Status: GOOD (  22.14  )
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

Hi Vladimir

On 06/05/25 7:47 pm, Vladimir Oltean wrote:
> On Fri, May 02, 2025 at 04:12:35PM +0530, MD Danish Anwar wrote:
>> From: Roger Quadros <rogerq@ti.com>
>>
>> The Time-Aware Shaper (TAS) is a key feature of the Enhanced Scheduled
>> Traffic (EST) mechanism defined in IEEE 802.1Q-2018. This patch adds TAS
>> support for the ICSSG driver by interacting with the ICSSG firmware to
>> manage gate control lists, cycle times, and other TAS parameters.
>>
>> The firmware maintains active and shadow lists. The driver updates the
>> operating list using API `tas_update_oper_list()` which,
>> - Updates firmware list pointers via `tas_update_fw_list_pointers`.
>> - Writes gate masks, window end times, and clears unused entries in the
>>   shadow list.
>> - Updates gate close times and Max SDU values for each queue.
>> - Triggers list changes using `tas_set_trigger_list_change`, which
>>   - Computes cycle count (base-time % cycle-time) and extend (base-time %
>>     cycle-time)
>>   - Writes cycle time, cycle count, and extend values to firmware memory.
>>   - base-time being in past or base-time not being a multiple of
>>     cycle-time is taken care by the firmware. Driver just writes these
>>     variable for firmware and firmware takes care of the scheduling.
>>   - If base-time is not a multiple of cycle-time, the value of extend
>>     (base-time % cycle-time) is used by the firmware to extend the last
>>     cycle.
>>   - Sets `config_change` and `config_pending` flags to notify firmware of
>>     the new shadow list and its readiness for activation.
>>   - Sends the `ICSSG_EMAC_PORT_TAS_TRIGGER` r30 command to ask firmware to
>>     swap active and shadow lists.
>> - Waits for the firmware to clear the `config_change` flag before
>>   completing the update and returning successfully.
>>
>> This implementation ensures seamless TAS functionality by offloading
>> scheduling complexities to the firmware.
>>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> Reviewed-by: Simon Horman <horms@kernel.org>
>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>> ---
> 
> This is not a review comment - just wanted to mention that a week ago,
> I've added a selftest for this feature at
> tools/testing/selftests/net/forwarding/tc_taprio.sh, and I'm wondering
> whether you have the necessary setup to give that a run. That would give
> maintainers a bit more confidence when merging, that things work as
> expected.

I wasn't aware of this. I will check if I have the setup and try to test
it before posting future revisions.

-- 
Thanks and Regards,
Danish

