Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17710CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yzsm7UcLWz95w7mf2csUHMiUJrt8gEY4jLejuhdiuAM=; b=dq9p62mA5apHUSfCfVAaLFQRM8
	llIz+9JqlWVDgYlWfDSvXjz15TnIgvldQEfM8UWL0la3SOm8cRAitIp947fjfJdRnsXx4pm4eHo6+
	rxv4oGCyjCHhvfBk7cwJPVm23epuMUHEF6Lj3cbv+9+JSdoZkcWSQP5eE2uAgCV4DlJQ/ubsef4ra
	2AAsXwjhSXNsbiKP/B5zfGCdvBsZXvVCmcsxuV+5wbisbTPwIgC8nqKEQ9UiP2muUcFZiCh9/mwi5
	9g++bk7vpFRYnKQ61T1v9cmqUSJiMPquOeqJp1YRWFGuyF4qP+yeqgmriaOIQ/5SSn/kIy38DPIyW
	AB5QLOwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgk2-0000000DmSE-3YpO;
	Tue, 13 Oct 2026 17:56:46 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgk0-0000000DmRi-3qck
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 17:56:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3DE171A1216
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 17:56:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A30260362
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 17:56:43 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 8BB3B11D718D1; Tue, 13 Oct 2026 19:49:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914198; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Yzsm7UcLWz95w7mf2csUHMiUJrt8gEY4jLejuhdiuAM=;
	b=oXEftspwpv5Cu0BhFy4DXGKElKSC4jhTlOQnOltCPpJbREqnKM5cssu23X2FDfCWKitw+h
	k1UZLD8+pzK+I92I68Qs43sRiXSYMxyufFxRXTQlNfYGEaECtjJd2m1rBfkNxyodLd/37K
	4K4jBYOpAEShxeOrFm/88t8yj81x15wtfr3AmJnpUvZUcaq2YvCLWFhe3IPZ7N57amzmdt
	GJRbF+2KvEi7FsLaZsT67BeAbomeByPt8BIJ8GLfAYRTAMrZjy0GuRRM4aSOu0iulxBaqZ
	2t39HQfK3HMbb7Xsq9QAfJnw/DF83Y0NGovlL5asa1C8nT0J4ESq3rAgoyAPrQ==
Authentication-Results: mail.galae.net;
	none
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Masahiro Yamada
 <yamada.masahiro@socionext.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  Brian Norris <computersforpeace@gmail.com>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
In-Reply-To: <CADvTj4ppQannShF+dkLreST94g_vSAg4QdMqxhNORzkvci3O1A@mail.gmail.com>
	(James Hilliard's message of "Mon, 12 Oct 2026 13:17:23 -0600")
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
	<20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
	<8733ua23xs.fsf@bootlin.com>
	<CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
	<877bjmzqkr.fsf@bootlin.com>
	<CADvTj4ppQannShF+dkLreST94g_vSAg4QdMqxhNORzkvci3O1A@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 22:53:22 +0200
Message-ID: <87pkxey725.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NmtdqLHiX2yZ
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 8BB3B11D718D1
X-Spamd-Result: default: False [1.40 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	BCC(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[nod.at,ti.com,kernel.org,gmail.com,sholland.org,bootlin.com,socionext.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	URIBL_BLOCKED(0.00)[bootlin.com:mid,localhost:rdns,localhost:helo];
	TO_DN_SOME(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105645_090242_9684F50F 
X-CRM114-Status: GOOD (  17.68  )
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


>> >> commit log, I now disagree with the first part of:
>> >>
>> >> >The old handler can also complete the new wait or restore an obsolet=
e interrupt mask.
>> >>
>> >> "complete the new wait"? I don't see how a stale handler completes the
>> >> next wait given the handler is a hard IRQ and the interrupt enable
>> >> register is cleared on timeout.
>> >
>> > The case I had in mind is an already-running handler on another CPU:
>> >
>> > CPU 0: Read st and ien for operation A.
>> > CPU 1: Time out operation A, mask/acknowledge its interrupts,
>> >        then eventually reinitialize the completion for operation B.
>> > CPU 0: Call complete() based on the saved st and ien from operation A.
>>
>> For this to fire, the hard IRQ handler on CPU0 would have to be stopped
>> between reading st/ien and calling complete() long enough to span:
>> - A's timeout
>> - A's cleanup
>> - B's wait being rearmed
>> On this hardware, how is this reachable?
>
> CONFIG_PREEMPT_RT provides a concrete mechanism. The driver requests this
> IRQ with flags =3D 0, without IRQF_NO_THREAD, so the handler is
> forced-threaded. A higher-priority task can preempt that IRQ thread
> after it reads st/ien:

That argument only appears in this reply. It is not in the commit log
nor in the diff, both of which reason about a hard IRQ, no? I'll happily
take the PREEMPT_RT case into account: in that configuration the case is
reachable, but it reads as a justification added after the fact.

Then, I'm curious to know how the AI justifies the use of disable_irq()
as the RT-appropriate choice: doesn't it block without a timeout on the
very IRQ thread the scenario relies on being starved (and gives no
priority inheritance)?

Thanks,
Miqu=C3=A8l

