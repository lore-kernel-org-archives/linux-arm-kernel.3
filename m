Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D7BC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 09:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q69I5kR0I1QwXgOBFOzjho6suHR3Ek6iV/goTrGeyN4=; b=I7LVggox1zxl7+prN+gHz5hkRu
	jyxamWGcGUKTHxOJjn1rPHZxVQZnnpok7Z+ezueZuun11p6byjomsWoTN2aUr/OWPOJ3SD2E90R2Q
	Fkt08fxGROiWWUB2zDwvnUyASXoFZWV5diUIxuDHm01Fq5pUSs66PyXFhCzYxZCHIBaR2WPRpLfOw
	kqy7v2xslckNmUp+wa/97ycCRmkp45M2XpE4nzDxX5Ku/04k/4ovEusDqTqYspVxLXgAs5GN2CL+u
	kehs2kMrKF/avBqpYtEq+TswpubdzKRGTBEvIWlTMklXV+a3oGnWvE1E008gQld/UxuH5ln437EQT
	D152tjAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvAcU-00000003hof-2Png;
	Sat, 15 Aug 2026 09:24:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvAcR-00000003hoJ-3QoC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 09:24:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D43B71A14F6;
	Sat, 15 Aug 2026 09:23:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9323C604AA;
	Sat, 15 Aug 2026 09:23:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DCB0411C4F477;
	Sat, 15 Aug 2026 11:23:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786785830; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q69I5kR0I1QwXgOBFOzjho6suHR3Ek6iV/goTrGeyN4=;
	b=2ZhRWxqQpKrj1UYWokB3VMcuXHLckjJOdgERbJeii/4ZPLfGYBZOe34qGK/Lxzci9Lt5Nj
	DyAngLI3bJi0WVVRy0q4i3Tbl+WfE5xaMJ+Cmuw5hNzHP23p5Md5vFfmOQ/yhi0lwRFafU
	nszhIxFy/n6ViyKg3z++Uy+qG6jpiDkbLLO1LYzRDGY9ili/RYFU4/behaq+6nddEVpkri
	tiG9SKAhfb4CwcyQbepUc41oyF2yumHbao2WHhMtnpQwxVbBkyeB3CVhHA+0gEfRczdkm0
	OtDs3oBzRiTJpuuylwKGhWPePAWzteYH3r4Zv3kirR/7oL7gWHQwhjYJOHhwXQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Steam Lin <STLin2@winbond.com>,  linux-arm-kernel@lists.infradead.org,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] spi: ma35d1-qspi: Add DTR support
In-Reply-To: <34412d10-cea1-42ef-a53c-ef515b452793@sirena.org.uk> (Mark
	Brown's message of "Fri, 14 Aug 2026 13:56:10 +0100")
References: <20260813-perso-ma35d1-upstream-qspi-v1-0-b217b9870eb1@bootlin.com>
	<20260813-perso-ma35d1-upstream-qspi-v1-4-b217b9870eb1@bootlin.com>
	<09c3928f-4b58-4ac6-8e1a-84dfe3ff6b92@sirena.org.uk>
	<87ik5ckh2j.fsf@bootlin.com>
	<34412d10-cea1-42ef-a53c-ef515b452793@sirena.org.uk>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sat, 15 Aug 2026 11:23:46 +0200
Message-ID: <877blrka8t.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_022400_021268_D7D5CB76 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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

On 14/08/2026 at 13:56:10 +01, Mark Brown <broonie@kernel.org> wrote:

> On Fri, Aug 14, 2026 at 02:44:04PM +0200, Miquel Raynal wrote:
>
>> > This needs ctlr->dtr_caps configuring, otherwise the validation will
>> > block it - only the _mem_caps were updated.
>
>> Ok, thanks!
>
> I've queued the existing stuff for CI since it all looks good and we're
> almost at the merge window - please send an incremental change for this.

Ok perfect, I'll send a follow-up patch at -rc1.

Thanks,
Miqu=C3=A8l

