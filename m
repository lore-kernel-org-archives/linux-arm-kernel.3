Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2862C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Z9zSxLfnk7YiVlIisYk8KT7P1MGEF3qpYsTg5YEnEk=; b=Ee27suyG/uOe0d56V9W3PjN4RU
	aS05dsIN60NvROMQyHlJb4xg8Nqy5uzx6N1pVg17Cb1bmUTzGFXWuMwc+jgs3QK3E+StpxPTKa0b1
	UctFISSYlUuvQTN3QDDTKv5yFbfhGB0jcIwF7e7p0uJkcLggZURLAiR7F9pz3rrI8JRP1Wlp0mNAB
	fHI0g0D+SIzrZg9ABkt8WV1K8Yt0ReNinDLplIZ9tNQ2RPnWxdi0XFAM5Hx7ynyUogNDBtLeSSG33
	kzv0qdnITGyeC6GtJabJi6XUe5+JuhQ71qsCh+ZS9yk6gLaJZ93MHmrv/9KPdqbixRnDjU4VmG2lx
	Fgpjb2/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL36-00000008CEg-3Ww9;
	Fri, 07 Aug 2026 13:55:48 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL35-00000008CDz-0b60;
	Fri, 07 Aug 2026 13:55:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4CBEB4E4113A;
	Fri,  7 Aug 2026 13:55:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CDA8603F0;
	Fri,  7 Aug 2026 13:55:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77B3411C37940;
	Fri,  7 Aug 2026 15:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786110944; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8Z9zSxLfnk7YiVlIisYk8KT7P1MGEF3qpYsTg5YEnEk=;
	b=nlNd8SWwUAven5A2D+JdB964IEJxFekkIs00rvccp2m4ShINygrjg5jELkdc9PIe+RCin3
	+rLDGFD1GhyNRoREH/YpRbKPzDkwNoYQKUn86dwDU0L3k8TFZMY6rrcZIsSA328SOvOzOe
	9J7aE94wqutVPNpitsyqWtjmu/DaAe0U36u6qv1j3MdhgWRL9BOZGxkPZavVh0Pfak1IGT
	XQeSmRH4n+FjCIArWgHTQuM33N/0xevGlSPQxcaU6CgW78Mx8kW7CTYk091Lza3t+Vdq5S
	PLCGfpWbd+HBe05P6dqKYs95LC9YV+FD9J7wLObmBaZtgi0uaby42e+XoSWAuA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org,  linux-sunxi@lists.linux.dev,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: add H616 MBUS DMA support
In-Reply-To: <20260717164202.3099982-1-james.hilliard1@gmail.com> (James
	Hilliard's message of "Fri, 17 Jul 2026 10:41:58 -0600")
References: <20260717164202.3099982-1-james.hilliard1@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 07 Aug 2026 15:55:41 +0200
Message-ID: <87tsp6avc2.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_065547_317722_54D5DC13 
X-CRM114-Status: GOOD (  11.30  )
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

Hi James,

On 17/07/2026 at 10:41:58 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> The H616 NAND controller uses a descriptor-based internal MBUS DMA
> engine instead of the direct address and count registers used by the
> A23/A33 controller. Since the driver does not support these descriptors,
> it currently attempts to request an external rxtx DMA channel and falls
> back to PIO when none is provided.
>
> Add a single-descriptor backend to the existing ECC page DMA paths.
> Allocate the descriptor coherently, constrain data mappings to the
> controller's 32-bit address range, program the H6-style data block mask,
> and request an interrupt for both command and DMA completion. Keep the
> existing external DMA and legacy MBUS DMA paths unchanged, and fall back
> to PIO if the descriptor cannot be allocated.
>
> With identical kernels except for this patch, running
> flash_speed -d -b 1906 -c 100 /dev/mtd6 on an H616 board with 2 KiB-page
> SLC NAND reported:
>
>                          PIO          descriptor DMA
> eraseblock write        3365 KiB/s       4192 KiB/s
> eraseblock read         6454 KiB/s      16040 KiB/s
> page write              3254 KiB/s       4021 KiB/s
> page read               6419 KiB/s      15686 KiB/s
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

This patch does not apply (linux-mtd repository, nand/next branch). You
need to rebase and send a new iteration.

Thansk,
Miqu=C3=A8l

