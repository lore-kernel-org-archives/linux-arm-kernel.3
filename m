Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECAEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSaeyfo8DQwqJGKUIUvYkkgVgRZAUJU2hAJTGaurvSE=; b=e2ymNUHDy+zaamqJwLnCvx6Vcm
	3XQSXxzJgE4ajw9kceQ8V70pPL+ST2x6g9QfFjYjH54yrgpCaYMaTcrEqWEBGN/cpAcRtXyFC8cfI
	uBN1FfstULvgOGSWu4VOcYbA1pSp0OcSgggSE6Q6rKPx97kqOwMVDLSZFCy1+axW+U4FHzuxDXegY
	jQwitqt9enIXSVN3hs00Jur3qFu/C67fSp+nMA0d7AJmfNTb+c/NZX4mZZY20C+UJk0im7VPPFd3j
	/iQfCQvLdLJ1iN6sazIaTwe+ZUgRoxLVEmjQ5tc2iB3SDj1AL5//0SjCzfNB43Xl9XX4BkvFJ/QUR
	qcH39Czw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirKI-0000000EAW4-3hxO;
	Fri, 14 Feb 2025 08:45:34 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirIq-0000000EADS-3mus
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:44:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D198441E5;
	Fri, 14 Feb 2025 08:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739522643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WSaeyfo8DQwqJGKUIUvYkkgVgRZAUJU2hAJTGaurvSE=;
	b=iF611NiJf5UmWwAeRJ9fSRHPIr3slCUYg5J6GAy0IdyLMF/8cuZA6Vlvrdk9KqZZpGEpG8
	kLtnvTavAgWOoMu/olJ9i0hTVWQZKGjyvLFuGt9ENeeuW2gHQeRM3dozeIy233+ZMMhS5l
	4cDs+4mGEpzgEf4vKDvoq+1MDohQXLjW1DGeXMvZ8xsXfUVsOcYUKMMVf6067nFcAb05mB
	cfewLHnFQN1PM5oKIbQVBVnPsEDPGm/PFVLg9W1dFGD/POGdAICBc/mMRZ+80qIVM1vKux
	lBikh5Q99/eDpUU7L0gR4sCdqdJ80nrXpDpQzlbTGaohs3kqxrCBjUkk1PI9qQ==
Message-ID: <1274bae7-e473-4711-9235-de0aeeadb02f@bootlin.com>
Date: Fri, 14 Feb 2025 09:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: mctrl_gpio: add parameter to skip sync
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-doc@vger.kernel.org
References: <20250214-atomic_sleep_mctrl_serial_gpio-v2-1-1e60c732fd90@bootlin.com>
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Language: en-US
In-Reply-To: <20250214-atomic_sleep_mctrl_serial_gpio-v2-1-1e60c732fd90@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegledvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdetteektdehudelheehkeeggfejgfelveevgeevtdejudfgveetgefhtdduuedtnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddungdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepjhhirhhishhlrggshieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrghgvnhhouhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghro
 hgthhhiphdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghvpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_004405_090190_90F43DE6 
X-CRM114-Status: GOOD (  14.80  )
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

On 2/14/25 09:38, Alexis Lothoré wrote:
> The following splat has been observed on a SAMA5D27 platform using
> atmel_serial:
> 
> BUG: sleeping function called from invalid context at kernel/irq/manage.c:738
> in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 27, name: kworker/u5:0
> preempt_count: 1, expected: 0
> INFO: lockdep is turned off.
> irq event stamp: 0
> hardirqs last  enabled at (0): [<00000000>] 0x0
> hardirqs last disabled at (0): [<c01588f0>] copy_process+0x1c4c/0x7bec
> softirqs last  enabled at (0): [<c0158944>] copy_process+0x1ca0/0x7bec
> softirqs last disabled at (0): [<00000000>] 0x0
> CPU: 0 UID: 0 PID: 27 Comm: kworker/u5:0 Not tainted 6.13.0-rc7+ #74
> Hardware name: Atmel SAMA5
> Workqueue: hci0 hci_power_on [bluetooth]
> Call trace:
>   unwind_backtrace from show_stack+0x18/0x1c
>   show_stack from dump_stack_lvl+0x44/0x70
>   dump_stack_lvl from __might_resched+0x38c/0x598
>   __might_resched from disable_irq+0x1c/0x48
>   disable_irq from mctrl_gpio_disable_ms+0x74/0xc0
>   mctrl_gpio_disable_ms from atmel_disable_ms.part.0+0x80/0x1f4
>   atmel_disable_ms.part.0 from atmel_set_termios+0x764/0x11e8
>   atmel_set_termios from uart_change_line_settings+0x15c/0x994
>   uart_change_line_settings from uart_set_termios+0x2b0/0x668
>   uart_set_termios from tty_set_termios+0x600/0x8ec
>   tty_set_termios from ttyport_set_flow_control+0x188/0x1e0
>   ttyport_set_flow_control from wilc_setup+0xd0/0x524 [hci_wilc]
>   wilc_setup [hci_wilc] from hci_dev_open_sync+0x330/0x203c [bluetooth]
>   hci_dev_open_sync [bluetooth] from hci_dev_do_open+0x40/0xb0 [bluetooth]
>   hci_dev_do_open [bluetooth] from hci_power_on+0x12c/0x664 [bluetooth]
>   hci_power_on [bluetooth] from process_one_work+0x998/0x1a38
>   process_one_work from worker_thread+0x6e0/0xfb4
>   worker_thread from kthread+0x3d4/0x484
>   kthread from ret_from_fork+0x14/0x28
> 
> This warning is emitted when trying to toggle, at the highest level,
> some flow control (with serdev_device_set_flow_control) in a device
> driver. At the lowest level, the atmel_serial driver is using
> serial_mctrl_gpio lib to enable/disable the corresponding IRQs
> accordingly.  The warning emitted by CONFIG_DEBUG_ATOMIC_SLEEP is due to
> disable_irq (called in mctrl_gpio_disable_ms) being possibly called in
> some atomic context (some tty drivers perform modem lines configuration
> in regions protected by port lock).
> 
> Split mctrl_gpio_disable_ms into two differents APIs, a non-blocking one
> and a blocking one. Replace mctrl_gpio_disable_ms calls with the
> relevant version depending on whether the call is protected by some port
> lock.
> 
> Suggested-by: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>

So despite changing the commit description, I forgot to update the actual commit
message, which is eventually not adding a flag anymore but new APIs. v3 will
follow, sorry for the noise.

Alexis


-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

