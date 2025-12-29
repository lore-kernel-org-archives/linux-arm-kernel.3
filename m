Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D983D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 13:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o71Lxd227ZzaqIW1h39h+ZnNldOuy/R0kMia2ULVSMA=; b=CP0OYq1pqiduMYG14KM4kbvOvC
	m+4KvFUu1vsHx0IONDRcWS9GrsSPMUIk98p74Ws7+K4hOGV7/M4QwdmMJIf710Bu+5fdTWN65fmMD
	ovIucXhkEJyUx7b6/zdxZsxpJryIKz5RBiXhzGQ2qRQSpic7PxakYmQz5CbW/ya5urGeeE3lW4iHH
	nxRy6kYh1oDcl5sI3f7a3tHdzBqVT8uosvJqr72I0NgwZIn3qxdngxQxsS9Gu0ORvFMGlvOYlJFxQ
	DKtqCdvn2qki+KJDtJXhIFm707hB4ItV7gOib8MQhmQwrrTviE8+hCe9CvPT+ZtvJJ8oHL+nOaC9A
	n6uNkhmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaDdW-00000003kxg-0jMn;
	Mon, 29 Dec 2025 13:50:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaDdU-00000003kxG-0VF9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 13:50:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDFEE40D6F;
	Mon, 29 Dec 2025 13:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F12C4CEF7;
	Mon, 29 Dec 2025 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767016210;
	bh=JkD+7Su0h2sVFPy6YBrQzFZfhqvokIvRVoNcw/yYbk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GQhrozgZ3YlCEnV4LQ0e5FjvV7pwfEed0XenxxIsYtqTvg0aWEc1Ubj5VMDEFUJCm
	 uaGAVrMSD1Q+ruWEev6a2ke9reO3YhPOFrFTPP6BJW0Pw1FaG0DYsWT0CxCuVCigqe
	 Bo95h+sQsZemnhs2b9AsBV80kkibUBHFFF/2y240GItUj391+rPq/IN2X07beBYE87
	 Kd7GKJ/wXyBS9M1F5C62GR9LRfBf8FWSdFnQVARJSLDUoAUZaVoTEgjqU854OZde3O
	 5FOVd74V9w6ImzSmbNWTERx6VOy48/jQFyZ7zwE+H5ruRBRDoMCjPtWpUcv+k4WcwF
	 EJ56w5Y67vcUw==
From: William Breathitt Gray <wbg@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: William Breathitt Gray <wbg@kernel.org>,
	robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	s32@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/3] counter: Add STM based counter
Date: Mon, 29 Dec 2025 22:50:01 +0900
Message-ID: <20251229135006.10133-1-wbg@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <ba28863a-a5fe-498f-92a0-d71c356e7189@linaro.org>
References: 
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3077; i=wbg@kernel.org; h=from:subject; bh=JkD+7Su0h2sVFPy6YBrQzFZfhqvokIvRVoNcw/yYbk8=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDJlBbXcnzuU387vWVz/VXHTJ8j6JpXukGCJVSuo+SAf8j Mq23lDRUcrCIMbFICumyNJrfvbug0uqGj9ezN8GM4eVCWQIAxenAEwk2pfhv6P1X9Puk1suqrwI nqqbbOwaoqCqbS/6+/fJ3qV3k/fJWjIynGJb5r18e3hWYPq//6tWPOx0a227dWFvraX3vdlmXZI V/AA=
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_055012_199991_B4786E0E 
X-CRM114-Status: GOOD (  30.27  )
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

On Sun, Dec 28, 2025 at 06:37:22PM +0100, Daniel Lezcano wrote:
> 
> Hi William,
> 
> On 12/28/25 07:52, William Breathitt Gray wrote:
> > On Wed, Dec 17, 2025 at 08:49:57AM +0100, Daniel Lezcano wrote:
> >> The NXP S32G2 automotive platform integrates four Cortex-A53 cores and
> >> three Cortex-M7 cores, along with a large number of timers and
> >> counters. These hardware blocks can be used as clocksources or
> >> clockevents, or as timestamp counters shared across the various
> >> subsystems running alongside the Linux kernel, such as firmware
> >> components. Their actual usage depends on the overall platform
> >> software design.
> >>
> >> In a Linux-based system, the kernel controls the counter, which is a
> >> read-only shared resource for the other subsystems. One of its primary
> >> purposes is to act as a common timestamp source for messages or
> >> traces, allowing correlation of events occurring in different
> >> operating system contexts.
> >>
> >> These changes introduce a basic counter driver that can start, stop,
> >> and reset the counter. It also handles overflow accounting and
> >> configures the prescaler value.
> >>
> >> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> >
> > Hi Daniel,
> >
> > It sounds like you're trying to implement a clock for timestamping.
> 
> Well no, it is a counter which is used for timestamping. It is an
> automotive design.

I'm sorry, I misunderstood your device earlier. We'll continue with the
Counter driver implementation in that case.

> > Regardless, if you do pursue a Counter driver you'll need to follow the
> > Generic Counter paradigm[^1] and define at least three core components:
> > a Signal, a Synapse, and a Count. Resetting the Count is typically
> > implemented by defining a struct counter_ops counter_write()

Oops, I should have written count_write() there; when a user sets the
Count back to 0, it can be considered a reset.

> > callback[^2], while overflows are typically implemented by pushing
> > COUNTER_EVENT_OVERFLOW Counter events[^3] that can be watched by
> > userspace.
> 
> Yes, I think the Generic counter makes sense here for the goal to be
> achieved. Thanks for the pointers, I'll see how the counter fits with
> the paradigm.
> 
>    -- Daniel

I suspect you'll define a Signal after the peripheral clock input to the
counter device block; if it's possible to read the instataneous level of
this signal, define a signal_read() callback for it.

Your Synapse action is dependent on the edge sensitivity (i.e. rising,
falling, or both edges) of your counter device; e.g. a rising edge
configuration corresponds to a COUNTER_SYNAPSE_ACTION_RISING_EDGE action
in action_read(). If your counter only ever increases, then you can
report a COUNTER_FUNCTION_INCREASE function in the function_read()
callback.

Finally, the component names should be intuitive so give the Count a
more intuitive name than "stm-cnt". The same idea applies to the name
you give the Signal.

William Breathitt Gray

