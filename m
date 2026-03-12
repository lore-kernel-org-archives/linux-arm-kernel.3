Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542DD106703C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 14:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltlhWB/R+dYGhwgGAypvr2FmzCOvy+OJ80K5UktbZIE=; b=1ELaeKZTiTXKlgiQ8Up92Q/Pcz
	Y4I5l8kxEZTZX+2ZndfeG/7e6OvRtM0BRNSireyL8m1hyHheemr7lnxO9gSfIWEkGfwwAge4hvGqA
	cu3GZGFhVRoTcuBDGtthcG/S9Sdp/65t34u37r7IaW5BvKKEhrRvJxn1MJ2kscdK8YbldAYzNgjxK
	qDTHjm+I9McaoJ6SUtnAUkMSBptGRqgdFrOvuiYBbay8ppDqYtDrKNrsteAjSr47PuecDbZCE8Uar
	ArmDrcuOYB3MsqMBOKpkfO8mSa7Vk78QT190CA8k2pTRQR/DkHYVlq+EyJmVHO38y5edqvhidOzOy
	RIc/Wf2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hEZ-0000000EDsZ-2MTv;
	Thu, 12 Mar 2026 14:41:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hEU-0000000EDrj-3t1i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 14:41:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9182A4E42504;
	Thu, 12 Mar 2026 14:41:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D5475FDEB;
	Thu, 12 Mar 2026 14:41:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F0A210369D80;
	Thu, 12 Mar 2026 15:41:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773326503; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ltlhWB/R+dYGhwgGAypvr2FmzCOvy+OJ80K5UktbZIE=;
	b=kV0XiLLpl4YNjd6gU8pjNriysy8QLHtVqlgAPiNuSIDpxocFAZ98E0y6tD6BaKry4u3SFN
	KAEvXGtWCbFfJtsbTk7yJq3ZoVQ9N7aclod3WLXq6l/Y+jorST7y0mPhxgv2doAaI7dLY3
	2slj7/07RR5LtJZhp8A151pDaMflTE7+Qmp16V6a9/ckHcHP+gDvQjm7iJIjB3jT568ATs
	YwmvkArjHljO9a3iz7FyOpyoWz6YTyJUCcczcGtrMWWQvnbmzz2+pA09scVrJX9nMfuvUo
	8Ngy9QYTATB++eYBEmYgM1qsF1qEupUNEHf4LbsyjXVDXYQWXcKb//pz1dNoIA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Chen-Yu Tsai <wens@csie.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,  Wentao
 Liang <vulab@iscas.ac.cn>,  Maxime Ripard <mripard@kernel.org>,  Boris
 Brezillon <bbrezillon@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] mtd: rawnand: sunxi: introduce variable user
 data length
In-Reply-To: <20260305100137.2558423-7-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Thu, 5 Mar 2026 11:01:37 +0100")
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
	<20260305100137.2558423-7-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 12 Mar 2026 15:41:37 +0100
Message-ID: <87a4wdkt3y.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_074151_158208_BE7E8A39 
X-CRM114-Status: GOOD (  14.39  )
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

Hello Richard,

On 05/03/2026 at 11:01:37 +01, Richard Genoud <richard.genoud@bootlin.com> =
wrote:

> In Allwinner SoCs, user data can be added in OOB before each ECC data.
> For older SoCs like A10, the user data size was the size of a register
> (4 bytes) and was mandatory before each ECC step.
> So, the A10 OOB Layout is:
> [4Bytes USER_DATA_STEP0] [ECC_STEP0 bytes]
> [4bytes USER_DATA_STEP1] [ECC_STEP1 bytes]
> ...
> NB: the BBM is stored at the beginning of the USER_DATA_STEP0.
>
> Now, for H6/H616 NAND flash controller, this user data can have a
> different size for each step.
> And the vendor has chosen a different layout from the one on A10, using
> 8 bytes for step 0 and nothing for further steps:
> [8bytes USER_DATA_STEP0] [ECC_STEP0 bytes] [ECC_STEP1 bytes]...
> (Still with BBM stored at the beginning of the USER_DATA_STEP0)

I would rather be in favour of not following $(random vendor) firmware
layout. Upstream, it makes probably more sense to just allow access to
the maximum number of bytes that can be covered by the ECC engine, so I
would rather be in favour of computing the maximum size that you can set
for each step, without going over the OOB size.

Once this set up, I believe adapting the driver locally (out of tree) to
match a specific vendor layout would be rather straightforward, as all
the configuration pieces would already be in place.

Thanks,
Miqu=C3=A8l

