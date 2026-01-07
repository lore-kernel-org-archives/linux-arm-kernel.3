Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D778CD5854
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 10:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbQ8epoFNpTDePpvD9IRZqybaHzjDzfBt0FDNZxT3LQ=; b=KVz3QJN3XHgszwF1uLZGsPZVcu
	f1qRY7QmJwr/Qldw2RF8PNXcIf/L6ebr5kR4YnBoWvwFvEnRmJkZQWxAp2wSNrePFEvVeN5tHQD6n
	sLWFnmyaqjb9HtUe5k8XpVke9J0RUZx4waV98B8t8J34tJC4ophBDi1KpC/OGH1fuXsgcbckmn8wv
	czMYK37a8a2YngmXJZh7kei6X2OmxCfifQ9gbhd0fI7kDkayGCTc0KxeXuYoSNKmbc32vdXCQEugV
	3u4v50sL8AoGcwqAhujpXvLZROMzWzrJXt3bb6RTTM/3oTpnOz6MQal1pkHAmqriVzWVeB6IOQsH0
	ffhaVLOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdR9p-0000000Ekvw-0Usl;
	Wed, 07 Jan 2026 10:52:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdR9m-0000000EkvA-3Svb;
	Wed, 07 Jan 2026 10:52:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF71D40060;
	Wed,  7 Jan 2026 10:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C0D6C4CEF7;
	Wed,  7 Jan 2026 10:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767783169;
	bh=DUPfhQrr6JmsNOZ+CZkxyykOITDhWOpKmSkWkyOkKbs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ckVthmuUcZvDSlqlewy/Kb/0H0z9BF+bBYcIAw27KQ3c3NmdvXya8myv9+GoPEXrA
	 A5xs9jJ54qtmCIwJAzoSLo6BBxnPuM9s/t0QWsf+tKYaz0kKoS4bGbM5mEwoEb2kXB
	 W+EYW+kRftV9Q7tbpAx6XgsH2bu1pu80ToV5bcABTzafxespe1jlLasXmZmwxNxd4X
	 2KTfcVLSTsFiDvQtVlvQOTH7BuY0t3+0OFzw5k0frvDJYAF81W2HIpmTRriSZqheQ1
	 YO5zupcgJWtnGiJkjaNFgxIcYFUBj3bwGg09gi12jpkYSbqV5oLu1tQ+QPlDQUKNRE
	 h1vtfC+TizTwQ==
Message-ID: <080d9ed6-18f9-437e-89d4-aba8f69120fb@kernel.org>
Date: Wed, 7 Jan 2026 11:52:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] usb: typec: fusb302: Switch to threaded interrupt
 handler
To: =?UTF-8?B?5byg5rC45rOi?= <giraffesnn123@gmail.com>
Cc: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
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
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CACpCAL0GLMV-2p1tKAXe6R+N2c4YadH9vpEG3GdPoHTNTQSuow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_025250_881075_18B4F16B 
X-CRM114-Status: GOOD (  16.17  )
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

On 7-Jan-26 10:52, 张永波 wrote:
>> Still ideally we would solve this in another way then
>> switching to a threaded IRQ handler.
>>
>> As the commit message of the mei-vsc fix mentions
>> the root cause of these errors is typically an interrupt
>> chip driver which uses IRQF_NO_THREAD disabling the auto
>> threading of all interrupt handlers in RT mode.
>>
>> So the first question here would be to see if that flag is
>> used in the interrupt chip and if yes, is that flag really
>> necessary ?
> This is very similar to the issue addressed in commit 24b176d8827d
> ("drm/msm/dsi: Remove spurious IRQF_ONESHOT flag").
> The IRQF_ONESHOT flag is preventing forced threading here.
> 
> In irq_setup_forced_threading(), the conversion to threaded interrupts
> is explicitly skipped if any of the IRQF_NO_THREAD, IRQF_PERCPU,
> or IRQF_ONESHOT flags are present. In this case, IRQF_ONESHOT
> appears to be the reason.

Ah, well the code effectively does its own IRQF_ONESHOT handling,
since it needs to do its own threaded-irq like handling for
suspend/resume reasons. It disables the IRQ when it fires and
then only re-enables it once the work has done processing the IRQ.

So it should be perfectly safe to drop the IRQF_ONESHOT flag.

If that also works to resolve the lockdep issue that would be
the preferred way of fixing this IMHO.

Regards,

Hans


