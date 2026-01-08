Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E31CF6A83
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 08:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1V44jK0xz3CZDV14Iur0DqLvDb3S9boNc6C8eAIi78=; b=igEqDybw7vgXYNz1l9BDJZXOEs
	/IX9pIXYUlzRp74aIqUB1HiH6CuHzuxJCgv1WDeO3DQsoGgkeprf/v0m9+Cew/q4VMhvZJh3DR2nF
	C3ACS/Q1vuSCPt1885iCkCBf/9ub6umziYuH9LLcZe22lOfyKOQwFQgSJj/cnkH4TDs+tfoC71iic
	1QHndZ4uIDED+m0pjOVnQrKvxHaTG8uYO6lnkUiJBd5aDP5z3cutb1EhmsL+SUQYUoypHyKt+HP2a
	5xD/JLNg08PFytAjNGRn84XmoApeQmSSUcReF9qhzd6ad1SiHlbhnpo3IQRJKA9wEkZMyl+1Forgv
	/z0DFc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlS0-0000000GIWC-37pX;
	Thu, 08 Jan 2026 08:33:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlRx-0000000GIVf-2KLP;
	Thu, 08 Jan 2026 08:32:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D06564418C;
	Thu,  8 Jan 2026 08:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74378C116C6;
	Thu,  8 Jan 2026 08:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767861176;
	bh=ltY6mc7NU7aREJqbvN6dWGD7GfTdXZD+6vLY1vjaX3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K/8GWXsLWXhvg+q7onRuZRXHMqahq4RaBcTacESC7Jh93809wGXQm7rhE5jcgEyVR
	 yYRgJlBP6ngSgoQEZjKlwL5uKeA//m6lEonatZ1FlLU6PPbzlKAsxrvEgYY3MCQG9e
	 NcOahYgvhveBjgtjzUYlqirwMEbF/wT0ezYQ/nb6bdwpcP4Z2NdHd/p0pAvbBeI+E3
	 p91TdjTSkd/UBWCRx7TKhUbTIxuRVFixjhZJ9BcaFUaaedWjqQsvhAKxpUgJRzIq47
	 6+S9CvTO84Pf9CwL/yOrvOCAORy51UTF4kW5bI9D47UG4W/Se+7AQhWMU1rqAl4ySf
	 2RN40IMWsIadw==
Message-ID: <ee3d4cf0-dccb-4ce0-9e69-a95507168e6a@kernel.org>
Date: Thu, 8 Jan 2026 09:32:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] usb: typec: fusb302: Switch to threaded interrupt
 handler
To: Anand Moon <linux.amoon@gmail.com>
Cc: =?UTF-8?B?5byg5rC45rOi?= <giraffesnn123@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 FUKAUMI Naoki <naoki@radxa.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
References: <20260103083232.9510-1-linux.amoon@gmail.com>
 <20260103083232.9510-4-linux.amoon@gmail.com>
 <6f30a01c-8fc4-4368-88ef-7c513c505515@kernel.org>
 <CACpCAL0GLMV-2p1tKAXe6R+N2c4YadH9vpEG3GdPoHTNTQSuow@mail.gmail.com>
 <080d9ed6-18f9-437e-89d4-aba8f69120fb@kernel.org>
 <CANAwSgRqpAopSGcZ=isLxALFcuPW0E4DBZzMhQvwRBhHMK0thg@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CANAwSgRqpAopSGcZ=isLxALFcuPW0E4DBZzMhQvwRBhHMK0thg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_003257_650972_17686467 
X-CRM114-Status: GOOD (  20.30  )
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

Hi,

On 8-Jan-26 07:58, Anand Moon wrote:
> Hi Hans,
> 
> On Wed, 7 Jan 2026 at 16:22, Hans de Goede <hansg@kernel.org> wrote:
>>
>> Hi,
>>
>> On 7-Jan-26 10:52, 张永波 wrote:
>>>> Still ideally we would solve this in another way then
>>>> switching to a threaded IRQ handler.
>>>>
>>>> As the commit message of the mei-vsc fix mentions
>>>> the root cause of these errors is typically an interrupt
>>>> chip driver which uses IRQF_NO_THREAD disabling the auto
>>>> threading of all interrupt handlers in RT mode.
>>>>
>>>> So the first question here would be to see if that flag is
>>>> used in the interrupt chip and if yes, is that flag really
>>>> necessary ?
>>> This is very similar to the issue addressed in commit 24b176d8827d
>>> ("drm/msm/dsi: Remove spurious IRQF_ONESHOT flag").
>>> The IRQF_ONESHOT flag is preventing forced threading here.
>>>
>>> In irq_setup_forced_threading(), the conversion to threaded interrupts
>>> is explicitly skipped if any of the IRQF_NO_THREAD, IRQF_PERCPU,
>>> or IRQF_ONESHOT flags are present. In this case, IRQF_ONESHOT
>>> appears to be the reason.
>>
>> Ah, well the code effectively does its own IRQF_ONESHOT handling,
>> since it needs to do its own threaded-irq like handling for
>> suspend/resume reasons. It disables the IRQ when it fires and
>> then only re-enables it once the work has done processing the IRQ.
>>
>> So it should be perfectly safe to drop the IRQF_ONESHOT flag.
>>
> Yes, the warning disappears
>> If that also works to resolve the lockdep issue that would be
>> the preferred way of fixing this IMHO.
>>
> After applying these changes, the device initially triggered a hard reset;
> And the board reboots. I need to find another way to fix this warning.

Hmm, I guess that without the oneshot flag fusb302_irq_intn() might
trigger a second time before it disables the IRQ causing an IRQ enable
unbalance issue.

So lets just go with your original fix of moving this to a threaded
IRQ handler.

Regards,

Hans



