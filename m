Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01837CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9B3SR19oJ4S3wTqH54qXg87P04aoYoMU+dhTQW4GQY=; b=2E3Q4AWbrHeVvQvXmzGOGIuITC
	fX+MeuB0RuDepw02qBfaJ6hWNZROGDNmLlMjEyB7U7EexMC1VR3zTFE3xC4nQMgXTLwGT0jJybTQt
	5+38HOBh3+i/5DRIucyVe7s4yw4jH4L4qfcOcfbcj/WdxilLRj3fhK+127r3auA8CwvSL2O5ZU21G
	WGWBxL26iv8dGVCD/vr0Z0XVo/l8nmP7A/Nmd3z6I+8OT+BXjHC7yrJ0JC5rPGvad22xR2d6wneon
	uGGeNOYS6STsVfY+nP+v3KFvReOtfwvZEy7ZKRhAIDIvGXXOvit4WDlfBSIX+ONUP80URoGwsgIep
	sGO1m5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqjz-00000005aoB-2hwy;
	Wed, 30 Sep 2026 09:36:43 +0000
Received: from mail-m1602365254.xmail.ntesmail.com ([160.236.52.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqjm-00000005al8-0BFD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:36:34 +0000
Received: from [172.16.12.11] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4fa2030e0;
	Wed, 30 Sep 2026 17:36:17 +0800 (GMT+08:00)
Message-ID: <6fa1e90e-49e9-495b-8b17-6ac54f441313@rock-chips.com>
Date: Wed, 30 Sep 2026 17:36:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/1] mailbox: arm_mhuv3: Keep the combined IRQ
 enabled during system suspend
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260930033657.312266-1-finley.xiao@rock-chips.com>
 <20260930033657.312266-2-finley.xiao@rock-chips.com>
 <20260930-excellent-hallowed-cheetah-bfcde2@sudeepholla>
From: Finley Xiao <finley.xiao@rock-chips.com>
In-Reply-To: <20260930-excellent-hallowed-cheetah-bfcde2@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0f1ac052403a8kunma654f6034a9696
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGRpDVh1LH0pNQ0xDSxpNTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=UCx+q7fRLDQVKoSoSo69UcDEYNN+b6D8WvTCx7ZyOUnsq5EdR/tgyg1Ek8/IkINWvlXbx8uVYhJTvrXfgt0MS5PLGtY4yfbYEveJm62UnNSPBG8gbuQz9XSf72plzNjyeIKfJL/av0ywhcTMt6EHV7b+dwjyMm13bFWe2PaoWk0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=n9B3SR19oJ4S3wTqH54qXg87P04aoYoMU+dhTQW4GQY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_023633_083357_E0302B92 
X-CRM114-Status: GOOD (  16.02  )
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


在 2026/9/30 16:50, Sudeep Holla 写道:
> On Wed, Sep 30, 2026 at 11:36:57AM +0800, Finley Xiao wrote:
>> When MHUv3 is used as the SCMI mailbox transport (arm,scmi-mailbox),
>> SCMI clock and power-domain operations still need to work in the noirq
>> phase of system suspend: genpd may power off a device's parent domain
>> from genpd_suspend_noirq(), which issues scmi_clock_config_set() /
>> scmi_power_state_set() and waits for the firmware reply via the mailbox
>> RX IRQ.
>>
>> However, dpm_suspend_noirq() calls suspend_device_irqs() before running
>> the suspend_noirq callbacks, so the combined interrupts are already
>> masked at that point and the SCMI transfer times out while waiting for
>> the reply.
>>
>> Both the PBX and MBX combined interrupts are requested as threaded
>> IRQs with only IRQF_ONESHOT. The MBX combined IRQ must stay enabled so
>> that firmware replies are delivered, and the PBX combined IRQ, used
>> for txdone by IRQ when not in polling mode, needs the same treatment.
>>
>> IRQ threads are not frozen during system suspend, so with
>> IRQF_NO_SUSPEND the threaded combined-IRQ handlers still run in the
>> noirq phase.
>>
>> Add IRQF_NO_SUSPEND to the MHUv3 combined IRQ registrations so that
>> SCMI remains functional throughout the suspend/resume cycle.
>>
> Looks good to me. Just to confirm, the expectation is to just have the
> IRQs functional during suspend/resume cycle only and *not to wake up* the
> system right ? If you need wakeup, you need to do more work.

Yes, exactly. We just need the IRQs functional during the suspend/resume
cycle (for SCMI traffic in the noirq phase), not to wake up the system.

Thanks for the review.

>
> For this change,
>
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
>
> Jassi,
>
> Please pick this up for next cycle when you are at it. Thanks!
>
-- 
Best regards,

底层平台中心 肖锋（Finley Xiao）
************************************************************************************
瑞芯微电子股份有限公司
Rockchip Electronics Co., Ltd.
福建省福州市铜盘路软件大道89号软件园A区21号楼 350003
No.21 Building, A District, Fuzhou Software Park, Fuzhou, Fujian 350003, P.R. China
Tel: 0591-83991906-8602 Mobile: 18506057603
************************************************************************************


