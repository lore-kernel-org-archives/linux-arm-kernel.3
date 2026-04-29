Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E37FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 10:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDwoZkSBsPOQpp1XrVFIX0acOZnbVSHW7p9UR2dGG/o=; b=2MkQb0ddMlcqsKEVTPLtvP4qfe
	vbyq9laJ5+WAbjsyFwFRKvkiiVS7+qfEiU3ASuLVVwl9oSr+rONAd1YmI6m5jbAUP87c2u745EwWz
	Knp+rXqYcqfoxoj9e6fDtGx3zGBP8fzhvQKAj2QAgiPVLjU6WcJ1LIREEKz6NB0I8EkS3Oa7zy1MN
	oGAJBj/56+CqzGqUuNQZJU2ob5SUeJTbjqK6jWgNblkrb5Lv+Oozm9CfXIVkwmB3GOzt7R+YMiiqE
	vyFzKlPTMf9sYycvqUUTcd5sExxNUQK60ImWSa8m5525XHUb4cJF6X6wxArJ4T3r2JSHcb9dYH/MR
	6IuhzKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2di-00000003Uno-3Xor;
	Wed, 29 Apr 2026 10:59:34 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2de-00000003Un8-3jho
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 10:59:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SDwoZkSBsPOQpp1XrVFIX0acOZnbVSHW7p9UR2dGG/o=;
	b=HzqLpwN9/XEe2ZdK0e5vdHBzHGZAh+dd1YzUG2jgEhJG+Hj9l6eNJgM+AtgZoNopLcaHbmo4b
	FJ+tCDXKM4ueHcwP4miUVUKqx5XunauNQuVXrRmbGIgaiIBfRz4NjYmDsBUyhRsXeEoDbzyW81P
	vWVxb0c5xks+upYKyjaNK6I=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4g5DfS2H71zKm5f;
	Wed, 29 Apr 2026 18:52:48 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B7A940572;
	Wed, 29 Apr 2026 18:59:17 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 29 Apr 2026 18:59:15 +0800
Message-ID: <b9e8146a-bc5d-0323-da2c-facfdbb6d8d5@huawei.com>
Date: Wed, 29 Apr 2026 18:59:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 next 00/10] arm_mpam: Introduce Narrow-PARTID feature
Content-Language: en-US
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tan.shaopeng@jp.fujitsu.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tglx@kernel.org>, <will@kernel.org>, <hpa@zytor.com>,
	<bp@alien8.de>, <babu.moger@amd.com>, <dave.hansen@linux.intel.com>,
	<mingo@redhat.com>, <tony.luck@intel.com>, <gshan@redhat.com>,
	<catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>
References: <20260413085405.1166412-1-zengheng4@huawei.com>
In-Reply-To: <20260413085405.1166412-1-zengheng4@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_035931_575338_E32FA22A 
X-CRM114-Status: GOOD (  13.99  )
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



On 2026/4/13 16:53, Zeng Heng wrote:
> Background
> ==========
> 
> On x86, the resctrl allows creating up to num_rmids monitoring groups
> under parent control group. However, ARM64 MPAM is currently limited by
> the PMG (Performance Monitoring Group) count, which is typically much
> smaller than the theoretical RMID limit. This creates a significant
> scalability gap: users expecting fine-grained per-process or per-thread
> monitoring quickly exhaust the PMG space, even when plenty of reqPARTIDs
> remain available.
> 
> The Narrow-PARTID feature, defined in the ARM MPAM architecture,
> addresses this by associating reqPARTIDs with intPARTIDs through a
> programmable many-to-one mapping. This allows the kernel to present more
> logical monitoring contexts.
> 
> Design Overview
> ===============
> 
> The implementation extends the RMID encoding to carry reqPARTID
> information:
> 
>    RMID = reqPARTID * NUM_PMG + PMG
> 
> In this patchset, a monitoring group is uniquely identified by the
> combination of reqPARTID and PMG. The closid is represented by intPARTID,
> which is exactly the original PARTID.
> 
> For systems with homogeneous MSCs (all supporting Narrow-PARTID), the
> driver exposes the full reqPARTID range directly. For heterogeneous
> systems where some MSCs lack Narrow-PARTID support, the driver utilizes
> PARTIDs beyond the intPARTID range as reqPARTIDs to expand monitoring
> capability. The sole exception is when any type of MSCs lack Narrow-PARTID
> support, their percentage-based control mechanism prevents the use of
> PARTIDs as reqPARTIDs.
> 
> Capability Improvements
> =======================
> 
> --------------------------------------------------------------------------
> The maximum        |  Sub-monitoring groups            | System-wide
> number of          |  under a control group            | monitoring groups
> --------------------------------------------------------------------------
> Without reqPARTID  |  PMG                              | intPARTID * PMG
> --------------------------------------------------------------------------
> reqPARTID          |                                   |
> static allocation  | (reqPARTID // intPARTID) * PMG    | reqPARTID * PMG
> --------------------------------------------------------------------------
> reqPARTID          |                                   |
> dynamic allocation | (reqPARTID - intPARTID + 1) * PMG | reqPARTID * PMG
> --------------------------------------------------------------------------
> 
> Note: The number of intPARTIDs can be capped via the boot parameter
> mpam.intpartid_max. Under MPAM, reqPARTID count is always greater than
> or equal to intPARTID count.
> 

Thank you for your review. Please find the test report below for this
patch set.

Test Environment:
- Kernel: linux/master (commit: 6596a02b207886e9e00bb0161c7fd59fea53c081)
- Architecture: arm64
- Platform: Kunpeng 950
- MPAM Features: 256 reqPARTIDs, 32 intPARTIDs, 4 PMGs

Functional Test Example:

~~~
   # dmesg | grep -i pmg
   [   11.528919] MPAM enabled with 256 reqPARTIDs, 16 intPARTIDs and 4 PMGs
   # cat /proc/cmdline
   <...> mpam.intpartid_max=15
   # cat /sys/module/mpam/parameters/intpartid_max
   15

   # mount -t resctrl resctrl /sys/fs/resctrl/ -o debug
   # cd /sys/fs/resctrl/
   # mkdir p1
   # cd p1/mon_groups/
   # mkdir m{1..963}
   # ls m963
   cpus  cpus_list  mon_data  mon_hw_id  tasks
~~~
Able to create 964 resource groups ((256 - 15) * 4), which matches the
expected result.


MPAM KUnit Test Log:

~~~
[   11.515338] KTAP version 1
[   11.515340] 1..2
[   11.515398]     KTAP version 1
[   11.515400]     # Subtest: mpam_devices_test_suite
[   11.515402]     # module: mpam
[   11.515405]     1..3
[   11.515497]     ok 1 test_mpam_reset_msc_bitmap
[   11.515568] mpam:__props_mismatch: __props_mismatch took the min cmax_wd
[   11.515579] mpam:__props_mismatch: cleared cpor_part
[   11.515581] mpam:__props_mismatch: cleared mbw_part
[   11.515592] mpam:__props_mismatch: took the min bwa_wd
[   11.515594] mpam:__props_mismatch: __props_mismatch took the min cmax_wd
[   11.515613] mpam:__props_mismatch: __props_mismatch took the min cmax_wd
[   11.515658]     ok 2 test_mpam_enable_merge_features
[   11.515722]     ok 3 test__props_mismatch
[   11.515725] # mpam_devices_test_suite: pass:3 fail:0 skip:0 total:3
[   11.515726] # Totals: pass:3 fail:0 skip:0 total:3
[   11.515728] ok 1 mpam_devices_test_suite
[   11.515730]     KTAP version 1
[   11.515732]     # Subtest: mpam_resctrl_test_suite
[   11.515734]     # module: mpam
[   11.515735]     1..6
[   11.515792]     ok 1 test_get_mba_granularity
[   11.515795]         KTAP version 1
[   11.515797]         # Subtest: test_mbw_max_to_percent
[   11.515850]         ok 1 pc=1, width=8, value=0x01
[   11.515905]         ok 2 pc=1, width=12, value=0x027
[   11.515959]         ok 3 pc=1, width=16, value=0x028e
[   11.516011]         ok 4 pc=25, width=8, value=0x3f
[   11.516069]         ok 5 pc=25, width=12, value=0x3ff
[   11.516127]         ok 6 pc=25, width=16, value=0x3fff
[   11.516182]         ok 7 pc=33, width=8, value=0x53
[   11.516236]         ok 8 pc=33, width=12, value=0x546
[   11.516290]         ok 9 pc=33, width=16, value=0x5479
[   11.516345]         ok 10 pc=35, width=8, value=0x58
[   11.516401]         ok 11 pc=35, width=12, value=0x598
[   11.516456]         ok 12 pc=35, width=16, value=0x5998
[   11.516511]         ok 13 pc=45, width=8, value=0x72
[   11.516565]         ok 14 pc=45, width=12, value=0x732
[   11.516617]         ok 15 pc=45, width=16, value=0x7332
[   11.516673]         ok 16 pc=50, width=8, value=0x7f
[   11.516726]         ok 17 pc=50, width=12, value=0x7ff
[   11.516781]         ok 18 pc=50, width=16, value=0x7fff
[   11.516835]         ok 19 pc=52, width=8, value=0x84
[   11.516889]         ok 20 pc=52, width=12, value=0x850
[   11.516943]         ok 21 pc=52, width=16, value=0x851d
[   11.516997]         ok 22 pc=55, width=8, value=0x8b
[   11.517073]         ok 23 pc=55, width=12, value=0x8cb
[   11.517139]         ok 24 pc=55, width=16, value=0x8ccb
[   11.517196]         ok 25 pc=58, width=8, value=0x93
[   11.517254]         ok 26 pc=58, width=12, value=0x946
[   11.517309]         ok 27 pc=58, width=16, value=0x9479
[   11.517364]         ok 28 pc=75, width=8, value=0xbf
[   11.517418]         ok 29 pc=75, width=12, value=0xbff
[   11.517474]         ok 30 pc=75, width=16, value=0xbfff
[   11.517529]         ok 31 pc=80, width=8, value=0xcb
[   11.517583]         ok 32 pc=80, width=12, value=0xccb
[   11.517638]         ok 33 pc=80, width=16, value=0xcccb
[   11.517693]         ok 34 pc=88, width=8, value=0xe0
[   11.517750]         ok 35 pc=88, width=12, value=0xe13
[   11.517806]         ok 36 pc=88, width=16, value=0xe146
[   11.517861]         ok 37 pc=95, width=8, value=0xf2
[   11.517918]         ok 38 pc=95, width=12, value=0xf32
[   11.517972]         ok 39 pc=95, width=16, value=0xf332
[   11.518027]         ok 40 pc=100, width=8, value=0xff
[   11.518084]         ok 41 pc=100, width=12, value=0xfff
[   11.518141]         ok 42 pc=100, width=16, value=0xffff
[   11.518144]     # test_mbw_max_to_percent: pass:42 fail:0 skip:0 total:42
[   11.518146]     ok 2 test_mbw_max_to_percent
[   11.518149]         KTAP version 1
[   11.518151]         # Subtest: test_percent_to_mbw_max
[   11.518204]         ok 1 pc=1, width=8, value=0x01
[   11.518259]         ok 2 pc=1, width=12, value=0x027
[   11.518321]         ok 3 pc=1, width=16, value=0x028e
[   11.518380]         ok 4 pc=25, width=8, value=0x3f
[   11.518434]         ok 5 pc=25, width=12, value=0x3ff
[   11.518492]         ok 6 pc=25, width=16, value=0x3fff
[   11.518546]         ok 7 pc=33, width=8, value=0x53
[   11.518603]         ok 8 pc=33, width=12, value=0x546
[   11.518662]         ok 9 pc=33, width=16, value=0x5479
[   11.518718]         ok 10 pc=35, width=8, value=0x58
[   11.518776]         ok 11 pc=35, width=12, value=0x598
[   11.518832]         ok 12 pc=35, width=16, value=0x5998
[   11.518887]         ok 13 pc=45, width=8, value=0x72
[   11.518943]         ok 14 pc=45, width=12, value=0x732
[   11.519000]         ok 15 pc=45, width=16, value=0x7332
[   11.519055]         ok 16 pc=50, width=8, value=0x7f
[   11.519110]         ok 17 pc=50, width=12, value=0x7ff
[   11.519166]         ok 18 pc=50, width=16, value=0x7fff
[   11.519219]         ok 19 pc=52, width=8, value=0x84
[   11.519276]         ok 20 pc=52, width=12, value=0x850
[   11.519331]         ok 21 pc=52, width=16, value=0x851d
[   11.519387]         ok 22 pc=55, width=8, value=0x8b
[   11.519444]         ok 23 pc=55, width=12, value=0x8cb
[   11.519504]         ok 24 pc=55, width=16, value=0x8ccb
[   11.519561]         ok 25 pc=58, width=8, value=0x93
[   11.519616]         ok 26 pc=58, width=12, value=0x946
[   11.519676]         ok 27 pc=58, width=16, value=0x9479
[   11.519730]         ok 28 pc=75, width=8, value=0xbf
[   11.519785]         ok 29 pc=75, width=12, value=0xbff
[   11.519840]         ok 30 pc=75, width=16, value=0xbfff
[   11.519893]         ok 31 pc=80, width=8, value=0xcb
[   11.519946]         ok 32 pc=80, width=12, value=0xccb
[   11.519999]         ok 33 pc=80, width=16, value=0xcccb
[   11.520054]         ok 34 pc=88, width=8, value=0xe0
[   11.520106]         ok 35 pc=88, width=12, value=0xe13
[   11.520161]         ok 36 pc=88, width=16, value=0xe146
[   11.520217]         ok 37 pc=95, width=8, value=0xf2
[   11.520270]         ok 38 pc=95, width=12, value=0xf32
[   11.520323]         ok 39 pc=95, width=16, value=0xf332
[   11.520376]         ok 40 pc=100, width=8, value=0xff
[   11.520428]         ok 41 pc=100, width=12, value=0xfff
[   11.520481]         ok 42 pc=100, width=16, value=0xffff
[   11.520483]     # test_percent_to_mbw_max: pass:42 fail:0 skip:0 total:42
[   11.520485]     ok 3 test_percent_to_mbw_max
[   11.520487]         KTAP version 1
[   11.520488]         # Subtest: test_mbw_max_to_percent_limits
[   11.520540]         ok 1 wd=1
[   11.520594]         ok 2 wd=2
[   11.520647]         ok 3 wd=3
[   11.520700]         ok 4 wd=4
[   11.520752]         ok 5 wd=5
[   11.520807]         ok 6 wd=6
[   11.520858]         ok 7 wd=7
[   11.520909]         ok 8 wd=8
[   11.520962]         ok 9 wd=9
[   11.521017]         ok 10 wd=10
[   11.521078]         ok 11 wd=11
[   11.521138]         ok 12 wd=12
[   11.521193]         ok 13 wd=13
[   11.521245]         ok 14 wd=14
[   11.521296]         ok 15 wd=15
[   11.521346]         ok 16 wd=16
[   11.521348]     # test_mbw_max_to_percent_limits: pass:16 fail:0 
skip:0 total:16
[   11.521350]     ok 4 test_mbw_max_to_percent_limits
[   11.521375]     # test_percent_to_max_rounding: Round-up rate: 43% 
(18/42)
[   11.521409]     ok 5 test_percent_to_max_rounding
[   11.521411]         KTAP version 1
[   11.521413]         # Subtest: test_percent_max_roundtrip_stability
[   11.521465]         ok 1 wd=1
[   11.521515]         ok 2 wd=2
[   11.521565]         ok 3 wd=3
[   11.521614]         ok 4 wd=4
[   11.521667]         ok 5 wd=5
[   11.521719]         ok 6 wd=6
[   11.521770]         ok 7 wd=7
[   11.521820]         ok 8 wd=8
[   11.521871]         ok 9 wd=9
[   11.521922]         ok 10 wd=10
[   11.521973]         ok 11 wd=11
[   11.522022]         ok 12 wd=12
[   11.522075]         ok 13 wd=13
[   11.522126]         ok 14 wd=14
[   11.522178]         ok 15 wd=15
[   11.522231]         ok 16 wd=16
[   11.522233]     # test_percent_max_roundtrip_stability: pass:16 
fail:0 skip:0 total:16
[   11.522235]     ok 6 test_percent_max_roundtrip_stability
[   11.522237] # mpam_resctrl_test_suite: pass:6 fail:0 skip:0 total:6
[   11.522238] # Totals: pass:118 fail:0 skip:0 total:118
[   11.522240] ok 2 mpam_resctrl_test_suite
~~~
All 118 MPAM KUnit tests passed.

Tested-by: Zeng Heng <zengheng4@huawei.com>


Best regards,
Zeng Heng

