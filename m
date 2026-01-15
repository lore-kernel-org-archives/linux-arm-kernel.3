Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA85FD41174
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzHj0TNUH65L9j3ZK9ouwPQ2Nv/Iou+bX2MHB1wlMQ8=; b=za3jxkXH4eRLEjMCdkwuCtv8Iq
	AefaltrmtK6Dv9It2AF+yUNfEMeqrDqDNlmKzLDrNZtGO2i0n455pKUV+uNgZszmED/7S7IOt0QG4
	YcVW6KDC5NFdpF0sjtG9n8t8J5GKerQ6SK6D+y9Njgk9JMSQB2C9dqASUqkBM04BK6SKLBSpq9Y+I
	DJomefwmcxQg2Yx13y65GgDX63aGRodNJqn3UMX/S1faRRHqrfh4/dgF9DIwDAPKahezHqWGWTwEa
	eEghVJV1MW5X9zLKnH+BuGBXYgCkFAfiSD95pEYuR1G7b6Pm0sCwzm/Yl+4e9ebR7eMfNUB84VndN
	zk0rY3HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLeq-0000000CEhx-42xh;
	Thu, 15 Jan 2026 11:36:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLep-0000000CEh7-08tq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:36:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FA0FFEC;
	Thu, 15 Jan 2026 03:36:47 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCC003F694;
	Thu, 15 Jan 2026 03:36:48 -0800 (PST)
Message-ID: <440ea311-67b7-4b7a-936c-845fce4919b5@arm.com>
Date: Thu, 15 Jan 2026 11:36:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/47] arm_mpam: Add KVM/arm64 and resctrl glue code
To: Peter Newman <peternewman@google.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <CALPaoCh=brY6+_oJZXJLfpv_Qkz0i0RuPfuRa+TgXLu_xV6rsQ@mail.gmail.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <CALPaoCh=brY6+_oJZXJLfpv_Qkz0i0RuPfuRa+TgXLu_xV6rsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_033655_125716_F10ED1CB 
X-CRM114-Status: GOOD (  13.00  )
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

Hi Peter,

On 1/15/26 11:14, Peter Newman wrote:
> Hi Ben,
> 
> On Mon, Jan 12, 2026 at 5:59 PM Ben Horgan <ben.horgan@arm.com> wrote:
[...]
> 
> Like before, I applied the patches and successfully booted a kernel on
> a baremetal Google Cloud C4A instance. I was able to confirm that the
> resources we expect were present and I was able to successfully run
> the monitor assignment test cases I used to validate ABMC on AMD
> systems. (Though I had to hack the driver to pretend there were less
> MBWU monitors so that the counter assignment interfaces would become
> available.)
> 
> My use cases only cover resctrl in the host, so I didn't try any of
> the KVM integration, but I can at least say there wasn't any evidence
> that it interfered with resctrl.
> 
> Tested-by: Peter Newman <peternewman@google.com>

Thanks for the testing!

Ben


