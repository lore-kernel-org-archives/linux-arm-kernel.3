Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8650C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qk5OgcOsGwnuuogWN9QlZM4wAsy5c40aEdSd6/7rY8g=; b=NP3TU2ya6kyrCvqDUr9OOt59R1
	azV5od06DPY9EuBn5X7hg3cxViwDPfv7JA5emmZnmjaGtpTum7e5B0ZzKQpNmKznMEE/AJBlus0JR
	1aKjx8i5KWnInrgaDCEG+p0SEnuxBtWcJAZIHG4+k/XslcYQy2b1YZRbC1JOMeuShHGSAUYE21/kY
	JINj/jhVrEvDKaend8FW0Q8I58nVeQ4ZD1MfRQZbk6ZXnzqSbfgPndktBDLd2tbZW5gUKyeBwtotC
	f8AhPcKOutcwaFgIPQ9ZqBniSciwmXWdZ1wp3xi02berH74Xf4iDMEV5HhvDqrEkdE8Jmjxa0OU2M
	aQD9aTCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I9q-000000087nK-1AqO;
	Tue, 22 Apr 2025 18:15:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FwB-00000007oNK-2odT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 15:53:33 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u7Fvs-0000r5-Mv; Tue, 22 Apr 2025 17:53:12 +0200
Message-ID: <54d062af-40ff-47b7-baec-c7e883defea3@pengutronix.de>
Date: Tue, 22 Apr 2025 17:53:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: imx: use guard to take spinlock
To: Troy Mitchell <troymitchell988@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: imx@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 linux-i2c@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Yongchao Jia <jyc0019@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
 <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
 <20250422161213.0000597d@huawei.com>
 <918e0177-8e26-405c-93ad-8b0d2dfd3b3d@gmail.com>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <918e0177-8e26-405c-93ad-8b0d2dfd3b3d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_085331_712554_6B47673F 
X-CRM114-Status: GOOD (  16.46  )
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

Hello Troy,

On 4/22/25 17:26, Troy Mitchell wrote:
> On 2025/4/22 23:12, Jonathan Cameron wrote:
>> On Mon, 21 Apr 2025 13:36:38 +0800

[snip]

>> In this path the patch changes the lock release to occur after
>> i2c_imx_master_isr(i2c_imx, status);
>>
>> That may well be safe; I have no idea!  You should talk about that
>> in the patch description if it is.
> You're correct that this change slightly alters the lock release timing.
> 
> However, both i2c_imx_slave_handle() and i2c_imx_master_isr() can safely be
> entered with the lock held — there's no requirement for the lock to be released
> before calling them.

Why would we want to hold a spinlock out of all things longer than
absolutely necessary?

> Using guard(spinlock_irqsave) simplifies the control flow by ensuring consistent
> and automatic unlock, which improves readability without affecting correctness.
> 
> I'll update the commit message to clarify this.

Sorry, I don't think that this simplification is worth potentially
increasing the time we spend with preemption disabled,
i2c_imx_master_isr() even has a loop inside.

Guards that don't increase critical section size however are fine by me.

Thanks,
Ahmad

> 
>>
>>> +
>>>  		return i2c_imx_master_isr(i2c_imx, status);
>>>  	}
>>> -	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
>>>  
>>>  	return IRQ_NONE;
>>>  }
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


