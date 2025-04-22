Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172A8C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soGONZdGElBWg1s+JnUAkldV6q7Nw4zxmEsBKOtO3BI=; b=RQWp61eY2uttcJt1P8j+Jm+oEN
	YFA7HiiO8aXT7j1s5qf43SBdwkBf62LhNwow2uj2PbuTxbC7PwkbxhldXATD7b3Lt87hyr9Mknd9T
	sXnh5leSPJQAltw0Dhph8onv8FISd1z2ZnL+HOF7HY6fSwO8bj9c9dPP8QvHAqF8b56VFm4ZzJYDB
	gccXrhMZZVU3Ut85kBdPaf7bTlZwxWviOrpE/qdcBC+EwYSNrj09edT5/xmWrcO4nCMGyxPNhW7RU
	M8TYxOGxbLGxkDdbJamjhOO2XBu8a5e3zZljQy7vx2WuteV96E5iBwUyKE92NO2HveUindRELWCP/
	MVyjHzUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7JaN-00000008LUG-2xmx;
	Tue, 22 Apr 2025 19:47:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7G83-00000007pcu-1zjq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 16:05:48 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u7G81-0003jx-Ha; Tue, 22 Apr 2025 18:05:45 +0200
Message-ID: <53024a1d-a9a9-448f-9ddb-45efe4bece21@pengutronix.de>
Date: Tue, 22 Apr 2025 18:05:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: imx: use guard to take spinlock
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Troy Mitchell <troymitchell988@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, linux-i2c@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Yongchao Jia <jyc0019@gmail.com>
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
 <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
 <20250422161213.0000597d@huawei.com>
 <918e0177-8e26-405c-93ad-8b0d2dfd3b3d@gmail.com>
 <54d062af-40ff-47b7-baec-c7e883defea3@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <54d062af-40ff-47b7-baec-c7e883defea3@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_090547_514270_733ACA86 
X-CRM114-Status: GOOD (  19.50  )
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

On 4/22/25 17:53, Ahmad Fatoum wrote:
> Hello Troy,
> 
> On 4/22/25 17:26, Troy Mitchell wrote:
>> On 2025/4/22 23:12, Jonathan Cameron wrote:
>>> On Mon, 21 Apr 2025 13:36:38 +0800
> 
> [snip]
> 
>>> In this path the patch changes the lock release to occur after
>>> i2c_imx_master_isr(i2c_imx, status);
>>>
>>> That may well be safe; I have no idea!  You should talk about that
>>> in the patch description if it is.
>> You're correct that this change slightly alters the lock release timing.
>>
>> However, both i2c_imx_slave_handle() and i2c_imx_master_isr() can safely be
>> entered with the lock held — there's no requirement for the lock to be released
>> before calling them.
> 
> Why would we want to hold a spinlock out of all things longer than
> absolutely necessary?
> 
>> Using guard(spinlock_irqsave) simplifies the control flow by ensuring consistent
>> and automatic unlock, which improves readability without affecting correctness.
>>
>> I'll update the commit message to clarify this.
> 
> Sorry, I don't think that this simplification is worth potentially
> increasing the time we spend with preemption disabled,
> i2c_imx_master_isr() even has a loop inside.

Ah the loop is in lpi2c_imx_master_isr, sorry about the confusion.
I still think that the simplification isn't worth increasing critical
section size.

> Guards that don't increase critical section size however are fine by me.

Thanks,
Ahmad

> 
> Thanks,
> Ahmad
> 
>>
>>>
>>>> +
>>>>  		return i2c_imx_master_isr(i2c_imx, status);
>>>>  	}
>>>> -	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
>>>>  
>>>>  	return IRQ_NONE;
>>>>  }
>>
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


