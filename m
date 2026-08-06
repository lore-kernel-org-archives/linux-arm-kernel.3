Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB939C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 07:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIpNJGDYu2wZCVnPTESRZf6oFiqJiFOUQMFU1NQbBq4=; b=TkYFbjBqA1l0j5A6UcUi4AHqJH
	G6nv6gvbbZkPdcSSkZO0V5OJkIBGi613jGO3rO+x7Dd0Fi0tc9G/KblGVm5O7TRP7+soepDMSfaRN
	KiQpeYx0OJLFKyFF2fk3IrFOpMcvkuRfRSczi3WhCT5yKSJaZawMsZsL1EVkt1AEPsQQmrm+/5v0M
	ffGet3gKEswJAqmGMs5gQe0JH6PFYQ64NA+ieRFUJXuisn8a4fiyAVIcS2LYkXYLczSKCMeNCEITf
	ov8hM/WmH/reJjmwc9uExLCX0C0DXDZjT8ages+T+DUydJJgUaNwhVyvz5e034aVduxkNGmBmxBQy
	Z+NAh+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsgy-000000059nh-1OSt;
	Thu, 06 Aug 2026 07:39:04 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsgu-000000059mi-01tm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 07:39:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F1E781A1463;
	Thu,  6 Aug 2026 07:38:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C23C7602B8;
	Thu,  6 Aug 2026 07:38:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1D0111C35B4E;
	Thu,  6 Aug 2026 09:38:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786001936; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QIpNJGDYu2wZCVnPTESRZf6oFiqJiFOUQMFU1NQbBq4=;
	b=DwL0rzdXpbyZjZlyFIANEjiJii3OqpE1w9gWtP+xSGzuZf8WBXo8Zf0XKP00Lwu2Lz2Kf2
	QakD2hT3EM8vt1EDbbm/OhFIuO/s7p2injKXw96ciew1qKWqHbIUW8eYxkp2IW6dKi/J+8
	9XqTlmxKD+O6H2bY3b5eUkn/AUGtcZfzTRK8JSHSrkUB3CaF+aZpVxiEMbRHA6K2kDpnOX
	EnzPG6+eI4JGvLfUNbvtSjrf14deK0sS3XhlT7haV8UoUIS4oS0pAybe0Arydv52+WYpjp
	L1reV7b4KyLh6KBsJcjlvTM2sjEOfAR6q7njQqOfagrrqC125aey+i6Vwro/xg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Nicolas Ferre"
 <nicolas.ferre@microchip.com>,  "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,  "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>,  "Steam Lin" <STLin2@winbond.com>,  "Hsin-Yi
 Wang" <hsinyi@chromium.org>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  <linux-mtd@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/5] mtd: spi-nor: Refactor Read Status/Write Status
 support
In-Reply-To: <87mrv2exwp.fsf@bootlin.com> (Miquel Raynal's message of "Tue, 04
	Aug 2026 16:57:26 +0200")
References: <20260529-winbond-v7-1-spi-nor-rv-addition-v1-0-f3ae18502d5a@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-rv-addition-v1-1-f3ae18502d5a@bootlin.com>
	<DJS8PQ5HZZG5.2YT956NCDX8MG@kernel.org> <87mrv2exwp.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 06 Aug 2026 09:38:50 +0200
Message-ID: <87se4rem0l.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_003900_381708_180D654B 
X-CRM114-Status: GOOD (  11.53  )
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

Hello Michael,

>> One thing that comes to mind is hardware write protection. If
>> there's nothing before that code which checks it, the verify might
>> fail if the hardware write protection is enabled. So we should
>> somehow check for that and drop the verify here.
>
> But how do you think we should handle it? Will the QE bit writing
> verification fail if HW WP is enabled?

Looking into this further: we shall return an error if the QE bit is not
set. It just tells the caller that quad mode cannot be used. Then up to
the caller to either hard fail or just degrade into single mode (maybe
because of a strapped WP). What we should do is to propose a DT property
to flag when WP is strapped in hardware, this would make the content of
the status registers immutable and we would just skip the entire write
operation in the first place, instead of deliberately trying and get a
100% failure rate. Nevertheless, the changes introduced here are kind of
orthogonal and do not alter the current behaviour; we shall however
listen if people start complaining about this and perhaps implement the
solution proposed above.

Thanks!
Miqu=C3=A8l

