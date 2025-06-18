Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33314C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TAtb5+WwQF8Qk8Et8Rzp5oL8SQyUzBDnJHXSFDwr3A=; b=rJmf6z8EGKz+kvYI4fPJOvim4/
	slyoOXkt087jw9ILVlS8W6xokqOUHetZMrdTc384cTfwJLUWXJ0MwUWpgUDaqliR5wgFTsEDI48nX
	gbNFHZBdWBAHZAyn8z/9ayBaXorqcVvI4v2tjWsMu6kqGkClYTst/ds4nuCvnQjqMhA2po9kJm/KV
	3vhUao7Bl2r/o8EbaxzJvz1deFTvc+ROumZP1q/Y+7p+8opONzJDK1wT2da9l2Hm2WvIcUI4lT0xN
	d91FkneamqufHfOo2oPDFSDG25qt6lPX9S8VCmggwaBfSE2/zsydW8dX7/fZbv8FphJ0vajlS1mzy
	DnhBnfkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRw9s-0000000AnTd-44Wm;
	Wed, 18 Jun 2025 17:01:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuSG-0000000AYWj-114Q;
	Wed, 18 Jun 2025 15:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6TAtb5+WwQF8Qk8Et8Rzp5oL8SQyUzBDnJHXSFDwr3A=; b=YMQ5DLQE93ges3zM2lG2Xrqcd3
	w/XoBQ7+/X9PJHl91QRQiJly0pG2GxthYef3RCfoCGKG9mM7lHy93JmbRYYbX6w7bc0dMYJ0TDiBW
	5MqKGj0dmEicBvvU1wGAgN22P4+yQv32Tuto7OOd3WzFL9RLyulPS5le3kCMd7LlL6WZLYPaH/O38
	i0PxIctXsUZo1WjC7In+Pf+bcz2sgBo9T6rdJ0FBUCW4NungHh9MLWm1idZe/jjM6fyFk6vakAHMD
	O2nhxr2MwsGjG3WpIY7M3sGkGxJPoF1AQl1tLYK+6ttfE6EFKhwfpHQBKn1VEmOQ5fqcEwIQZ38am
	w+TIqaaw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuSD-000000048a6-33BH;
	Wed, 18 Jun 2025 15:11:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0C4FC5C4D68;
	Wed, 18 Jun 2025 15:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B024C4CEF0;
	Wed, 18 Jun 2025 15:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750259513;
	bh=Wzjwsii8yfmolxkQkAgPYhRM7Z6/qgUkeAnXTcoCpI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lt1GhWFdXGvw/76cv1ejyxtlWvo27KOCHf7dFV6dHavnMPdRL4A/VL1rB5aOiplVh
	 dLY7uNPH/1/fdcngFvNd8+pdFr6c9+mKgxsvKjJ8rvjJeMkcUe49vyEQ9EP5KAv7gW
	 sCtbdbiPHGCdMRnb9TLNI5n94cjLq9YSD64VZYnF4tK/lr2VjwBCPJ4wVBl/vF3Xph
	 oOktN++khB2MAHlHz2BMV9LPHJOSHPOYgVfrk14Hj7APsG3qzBh8MTKpx7xRXkDIYk
	 SwAhiSwGAGRccJtMIoRPKEjzJ0kpuvi128kKL9YlpASiEFmZjNz6VycDMJvrmcV5Fs
	 qxrJr5FvyHVdw==
Date: Wed, 18 Jun 2025 11:11:51 -0400
From: Sasha Levin <sashal@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: Re: [PATCH AUTOSEL 6.15 092/110] genirq: Retain disable depth for
 managed interrupts across CPU hotplug
Message-ID: <aFLXN5Rbx_egQBeB@lappy>
References: <20250601232435.3507697-1-sashal@kernel.org>
 <20250601232435.3507697-92-sashal@kernel.org>
 <aELf3QmuEJOlR7Dv@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aELf3QmuEJOlR7Dv@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_161157_961210_37128F1A 
X-CRM114-Status: GOOD (  15.37  )
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

On Fri, Jun 06, 2025 at 02:32:29PM +0200, Johan Hovold wrote:
>On Sun, Jun 01, 2025 at 07:24:14PM -0400, Sasha Levin wrote:
>> From: Brian Norris <briannorris@chromium.org>
>>
>> [ Upstream commit 788019eb559fd0b365f501467ceafce540e377cc ]
>>
>> Affinity-managed interrupts can be shut down and restarted during CPU
>> hotunplug/plug. Thereby the interrupt may be left in an unexpected state.
>> Specifically:
>>
>>  1. Interrupt is affine to CPU N
>>  2. disable_irq() -> depth is 1
>>  3. CPU N goes offline
>>  4. irq_shutdown() -> depth is set to 1 (again)
>>  5. CPU N goes online
>>  6. irq_startup() -> depth is set to 0 (BUG! driver expects that the interrupt
>>     		     	      	        still disabled)
>>  7. enable_irq() -> depth underflow / unbalanced enable_irq() warning
>>
>> This is only a problem for managed interrupts and CPU hotplug, all other
>> cases like request()/free()/request() truly needs to reset a possibly stale
>> disable depth value.
>>
>> Provide a startup function, which takes the disable depth into account, and
>> invoked it for the managed interrupts in the CPU hotplug path.
>>
>> This requires to change irq_shutdown() to do a depth increment instead of
>> setting it to 1, which allows to retain the disable depth, but is harmless
>> for the other code paths using irq_startup(), which will still reset the
>> disable depth unconditionally to keep the original correct behaviour.
>>
>> A kunit tests will be added separately to cover some of these aspects.
>>
>> [ tglx: Massaged changelog ]
>>
>> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
>> Signed-off-by: Brian Norris <briannorris@chromium.org>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>> Link: https://lore.kernel.org/all/20250514201353.3481400-2-briannorris@chromium.org
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This one breaks suspend of laptops like the Lenovo ThinkPad T14s. Issue
>was just reported here by Alex:
>
>	https://lore.kernel.org/lkml/24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com/
>
>Please drop from all stable queues for now.

Will do, thanks!

-- 
Thanks,
Sasha

