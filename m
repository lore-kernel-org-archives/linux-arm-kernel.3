Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CFDC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 00:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/dmxM8U7yCFEEDI6/uvUgelwcDT3JQj4aGe50ihU1c=; b=s2xuTTo4qMl8zMfL6b05XUE2EI
	fuaMCq8MuSmZCzXK4p00BJklkm3FywEoH8teRy4Xjs3M/g+OKjAJYE4CFmQ2VCviZBu29sEv+Z5+u
	PvhtuN9nSw5zlcsb5og+X6iH2BAahXNKsrVWuKWkvfdAcQykHF3cCQcKoxRDCOm877FLoMrdzfi3S
	3h9sVQvQ1lN38E8XaFfz8xn9aBHaVtjd2CJSZRgATGvpYWAjVjyuHJOQuBrnQVUJEVDx7ImY2BSBk
	5v6dA1aQYILStxinApLiTlgSGvxZtYQ1ubar3GxQn0BwoMkMoGZQeNzfUvHXPeKdeGmm1sMuGZZY8
	B06tcR9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udHpo-0000000ElbS-3S5l;
	Sun, 20 Jul 2025 00:23:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udHnM-0000000ElVn-0z5T;
	Sun, 20 Jul 2025 00:20:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 276E95C4020;
	Sun, 20 Jul 2025 00:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF514C4CEE3;
	Sun, 20 Jul 2025 00:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752970846;
	bh=OtFSKnQJLty8pNLNiDG+01ViY9iOpad5TmroInGnKcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gp/L4yUeeuj6moNS7hE8ns2uEdOo4Nyg0bhcpd4SZ0ID+jaFjSLW4qjENp5xWKOxs
	 ba8zlU3l729BseY5uWou352gHYh1h/FgxSDKWrIyUfnCsVExiTxOQCXPXTKSGHn04e
	 Fr3B4B8EjJUZLppBfVeGODlDFcqnQerC6JLGlTJwFzDf40DACNofGhMJwffixr24qK
	 FwoRyYbnlLpwGXOo84BbZQj899W/CBoVmQerDv65bcQvKrpeCxCNx0T8uYn5Lmm4MC
	 jc7IQ/t1Ct51Hz605ZImGBeZZVVmGfcYGybqxA/S9eHoRo4jldYV/1sAIKwwqnd4gF
	 2yghXXgl36L3w==
From: William Breathitt Gray <wbg@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Leon Romanovsky <leon@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH v2 6/7] counter: Add rockchip-pwm-capture driver
Date: Sun, 20 Jul 2025 09:20:15 +0900
Message-ID: <20250720002024.696040-1-wbg@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250602-rk3576-pwm-v2-6-a6434b0ce60c@collabora.com>
References: 
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3362; i=wbg@kernel.org; h=from:subject; bh=OtFSKnQJLty8pNLNiDG+01ViY9iOpad5TmroInGnKcw=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDBk1ZoZ8Gz+aTdhw53D1hbVX5Nc3ZaxsPTyL8/YuN56Cw FKrq62WHaUsDGJcDLJiiiy95mfvPrikqvHjxfxtMHNYmUCGMHBxCsBEli5g+GcXl79B3f4I/867 8fImitd+ThGcE1JmLzIzvlMjR/6602qG/9H/Jmx+MC3/sEbhh10T7266ybuXNelCScrmxZ2RmW0 3XnMBAA==
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_172048_354923_EC265F5E 
X-CRM114-Status: GOOD (  24.32  )
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

On Mon, Jun 02, 2025 at 06:19:17PM +0200, Nicolas Frattaroli wrote:
> Among many other things, Rockchip's new PWMv4 IP in the RK3576 supports
> PWM capture functionality.
> 
> Add a basic driver for this that works to capture period and duty cycle
> values and return them as nanoseconds to the user. It's quite basic, but
> works well enough to demonstrate the device function exclusion stuff
> that mfpwm does, in order to eventually support all the functions of
> this device in drivers within their appropriate subsystems, without them
> interfering with each other.
> 
> Once enabled, the counter driver waits for enough high-to-low and
> low-to-high interrupt signals to arrive, and then writes the cycle count
> register values into some atomic members of the driver instance's state
> struct. The read callback can then do the conversion from cycle count to
> the more useful period and duty cycle nanosecond values, which require
> knowledge of the clock rate, which requires a call that the interrupt
> handler cannot make itself because said call may sleep.
> 
> To detect the condition of a PWM signal disappearing, i.e. turning off,
> we modify the delay value of a delayed worker whose job it is to simply
> set those atomic members to zero. Should the "timeout" so to speak be
> reached, we assume the PWM signal is off. This isn't perfect; it
> obviously introduces a latency between it being off and the counter
> reporting it as such. Because there isn't a way to reset the internal
> double-buffered cycle count in the hardware, we filter out unreliable
> periods above the timeout value in the counter read callback.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Hi Nicolas,

Would you help me understand the computations in this driver?

If I understand the purpose of this driver correctly, it's meant to
compute the period and duty cycle of a PWM signal. What do LPC and HPC
represent? I'm guessing they are the low period count (LPC) and the high
period count (HPC). So then you calculate the total period by adding
LPC and HPC, whereas the duty cycle derives from HPC.

Am I understanding the algorithm correctly? What are the units of HPC
and LPC; are they ticks from the core clock? Are PWMV4_INT_LPC and
PWM4_INT_HPC the change-of-state interrupts for LPC and HPC
respectively?

The Counter subsystem can be used to derive the period and duty cycle of
a signal, but I believe there's a more idiomatic way to implement this.
Existing counter drivers such as microchip-tcb-capture achieve this by
leveraging Counter events exposed via the Counter chrdev interface.

The basic idea would be:
    * Expose LPC and HPC as count0 and count1;
    * Push the PWMV4_INT_LPC and PWMV4_INT_HPC interrupts as
      COUNTER_EVENT_CHANGE_OF_STATE events on channel 0 and channel 1
      respectively;
    * Register Counter watches in userspace to capture LPC and HPC on
      each interrupt;

The Counter chrdev interface records a timestamp in nanoseconds with
each event capture. So to compute period and duty cycle, you would
subtract the difference between two HPC/LPC captures; the difference in
the timestamps gives you the elapsed time between the two captures in
nanoseconds.

Would that design work for your use case?

William Breathitt Gray

