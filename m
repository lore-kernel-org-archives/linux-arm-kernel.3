Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4C5CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 06:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWrcQK6rwO5vL+UweTGlBCVjSv7I8OXbyx3DnwqVR4U=; b=gRSWJ7IuEfcqIpdfQq3ZvT8uxB
	jJP9Nf7bGM/UI2s2eJqhxozCTzprepIYOlfmLayhf7iMYf+0NJmCOXxfqjmD/2oUtt8UQbosvjpq+
	rOqZ7popYA3v7154BDBhUSKYL65WFwGZcIkCFLny3Jt3JmOnxTu8SUhj4jIQdNsnUbCEqPm2QtBcQ
	B+o6VR4k+yzT/dP2aT9KRRThZP0ethVZPLt72eNBFzT1UymdDRZdgzBOd1qANW0vLNVqCWBcucHDV
	E+5TeV5W2Y9G+Gyg3pSd6MlTHNCbX48EwIlulpfBGDwo/jvhXEP64mtDiG6h0p2/ao0T7P25TeDh6
	tFkMsW0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3PN-00000009Vs2-0xp6;
	Thu, 04 Sep 2025 06:25:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3Mc-00000009UkT-3ZPm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 06:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756966949;
	bh=S8ROu2J0tBFyJUj+u0MwT+L1Qg7X6nZn7GKODwuxqfs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i+vYkBzebjdSyNw74Y+YTYAgyCMoIqAGVF9uFeCqKrKTa9kGbNg9ySSbEAOe0tUYx
	 8spcEe+TjCfwJ23nXnUH8V3w1Y1n+hUIPC7HJOr22MrRQEp5o6QidZrvsfxZN0reld
	 48kSTHm8GD51Nv/qu/DcDkuKMeNybEZauPh8aL+BRc8i8PpTYZqVuo2bF5wGYwwwHH
	 OjPZy1XVHhdvtSYI3vijmYYccLLENy1/lfO+QwB0XVGMbPHiGC6Wt6EjfEAb4t/Gsz
	 btzt+yM+BqueuLl6ThUnstTp77oo9Xn0US+JJ3ca1R8fC2gMX36KNnnFbug03AqNQv
	 mUDkpjMJ2D6og==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FE8317E0B85;
	Thu,  4 Sep 2025 08:22:28 +0200 (CEST)
Date: Thu, 4 Sep 2025 08:22:24 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley
 <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Steven Price
 <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
Message-ID: <20250904082224.113d0cd1@fedora>
In-Reply-To: <838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
References: <20250321200625.132494-1-marex@denx.de>
	<20250321200625.132494-5-marex@denx.de>
	<20250324094333.7afb17a1@collabora.com>
	<c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
	<20250325084349.344a0f11@collabora.com>
	<7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
	<20250325153507.61d82e39@collabora.com>
	<4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
	<20250325155231.0d1b1000@collabora.com>
	<838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_232231_051237_6F608435 
X-CRM114-Status: GOOD (  45.64  )
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

Hello Marek,

On Wed, 3 Sep 2025 23:44:59 +0200
Marek Vasut <marek.vasut@mailbox.org> wrote:

> On 3/25/25 3:52 PM, Boris Brezillon wrote:
> 
> Hello Boris,
> 
> sorry for the late reply.
> 
> >>>>>>> Hm, that might be the cause of the fast reset issue (which is a fast
> >>>>>>> resume more than a fast reset BTW): if you re-assert the reset line on
> >>>>>>> runtime suspend, I guess this causes a full GPU reset, and the MCU ends
> >>>>>>> up in a state where it needs a slow reset (all data sections reset to
> >>>>>>> their initial state). Can you try to move the reset_control_[de]assert
> >>>>>>> to the unplug/init functions?  
> >>>>>> Is it correct to assume , that if I remove all reset_control_assert()
> >>>>>> calls (and keep only the _deassert() calls), the slow resume problem
> >>>>>> should go away too ?  
> >>>>>
> >>>>> Yeah, dropping the _assert()s should do the trick.  
> >>>> Hmmm, no, that does not help. I was hoping maybe NXP can chime in and
> >>>> suggest something too ?  
> >>>
> >>> Can you try keep all the clks/regulators/power-domains/... on after
> >>> init, and see if the fast resume works with that. If it does,
> >>> re-introduce one resource at a time to find out which one causes the
> >>> MCU to lose its state.  
> >>
> >> I already tried that too . I spent quite a while until I reached that L2
> >> workaround in fact.  
> > 
> > So, with your RPM suspend/resume being NOPs, it still doesn't work?
> > Unless the FW is doing something behind our back, I don't really see
> > why this would fail on your platform, but not on the rk3588. Are you
> > sure the power domains are kept on at all times. I'm asking, because if
> > you linked all the PDs, the on/off sequence is automatically handled by
> > the RPM core at suspend/resume time.  
> 
> I revisited this now.
> 
> Can you please test the following patch (also attached) on one of your 
> devices, and tell me what the status is at the end . The diff sets the 
> GLB_HALT bit and then clears it again, which I suspect should first halt 
> the GPU and (this is what I am unsure about) then again un-halt/resume 
> the GPU ?

It doesn't work like that. What you're describing is like executing
"shutdown" on your terminal and then typing "boot" on the keyboard
after your computer has been shut down.

> 
> "
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c 
> b/drivers/gpu/drm/panthor/panthor_fw.c
> index 9bf06e55eaeea..57c0d4fd29aa2 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1087,8 +1087,16 @@ void panthor_fw_pre_reset(struct panthor_device 
> *ptdev, bool on_hang)
>   		struct panthor_fw_global_iface *glb_iface = 
> panthor_fw_get_glb_iface(ptdev);
>   		u32 status;
> 
> +pr_err("%s[%d] pre-halt status=%x\n", __func__, __LINE__, 
> gpu_read(ptdev, MCU_STATUS));
> +
>   		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
>   		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +mdelay(100);
> +pr_err("%s[%d] likely-halted status=%x\n", __func__, __LINE__, 
> gpu_read(ptdev, MCU_STATUS));
> +		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
> +mdelay(100);
> +pr_err("%s[%d] likely-running ? status=%x\n", __func__, __LINE__, 
> gpu_read(ptdev, MCU_STATUS));
> +
>   		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
>   					   status == MCU_STATUS_HALT, 10,
>   					   100000)) {
> "
> 
> In my case, the relevant output looks like this:
> 
> "
> [    3.326805] panthor_fw_pre_reset[1090] pre-halt status=1
> [    3.432151] panthor_fw_pre_reset[1095] likely-halted status=2
> [    3.542179] panthor_fw_pre_reset[1098] likely-running ? status=2
> "
> 
> That means, the GPU remains halted at the end, even if the "GLB_HALT" 
> bit is cleared before the last print. The clearing of GLB_HALT is also 
> what panthor_fw_post_reset() does.

After the halt has been processed by the FW, the memory region where
you check the halt status again is inert, since the micro-controller
(MCU) supposed to update those bits is off at this point. The FW
interface is really just a shared memory region between the CPU and
MCU, nothing more.

> 
> I suspect the extra soft reset I did before "un-halted" the GPU and 
> allowed it to proceed.

Hm, not quite. I mean, you still need to explicitly boot the MCU after
a reset, which is what the write to MCU_CONTROL [1] does. What the
soft-reset does though, is reset all GPU blocks, including the MCU.
This means the MCU starts from a fresh state when you reach [1].

If I had to guess, I'd say something is messed up when the GPU is
halted, and you need a soft-reset to recover from that. Unfortunately,
I don't know enough about what your FW is doing to help. Maybe
Arm/Freescale could...

> 
> I wonder if there is some way to un-halt the GPU using some gpu_write() 
> direct register access, is there ?

That's MCU_CONTROL, yes. And it's done here [1] already.

> Maybe the GPU remains halted because 
> setting the GLB_HALT stops command stream processing, and the GPU never 
> samples the clearing of GLB_HALT and therefore remains halted forever ?

Exactly that, and that's expected.

Regards,

Boris


[1]https://elixir.bootlin.com/linux/v6.16.4/source/drivers/gpu/drm/panthor/panthor_fw.c#L1034

