Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D58C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/d9m43TxhAffh3ZgQ1jebeO+R7ZKEi4Q/arfkRVVd4A=; b=fWAVlgg2OzUeVQctK7gJcitqIg
	frXroZ49d442j9NusbszLJ0Uw4wWnhbJnIlVdfExaJp8dQOwhYNO1PYSeIC8vUOlPx9UhnBDBiETM
	HRzYKueM8L2aaq+yqNaFsH3WBDM4hSreoPFhii6LvI0DXEecosXCfS6pKljAuEtfrgF6iAhign1wV
	panUjKRBWiVsDJ2r9pVwKXolvayX0JgM2MCM6PhdVAjtTSccnhSN5pFafBkxkUt84W+QjwBL4J7y3
	Cdw04Lv2oxaeeY6E4KXahb95ByFkDLxt92jbH8VwdKXFPa9uFuuICxV9vD+M0hmrF9H+ZS1kUdRqd
	9I4LyloQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bXA-0000000DxEn-0189;
	Thu, 10 Sep 2026 09:57:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bX6-0000000DxDz-0Q0q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 09:57:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BCE1F4E415BD;
	Thu, 10 Sep 2026 09:57:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C681602B8;
	Thu, 10 Sep 2026 09:57:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65F8211C78279;
	Thu, 10 Sep 2026 11:57:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789034242; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/d9m43TxhAffh3ZgQ1jebeO+R7ZKEi4Q/arfkRVVd4A=;
	b=kEXJagfuHj+Ex1oMPbUBWxtgifSU41VUI9E0sXmqowTJRfarf3WpgK1OPAky2CIElKghe3
	E4jF0Qq49rtgGsORPOyzfsAIbMjppGCFifmdE5UTwa99E46oDwnjbZLqp1TU8FJgqzrrkB
	7UFZX/61PJq65f5sO5DOxhOQFFDP6wmKsZNy6F9nC9ZwoAGDufDEqne3LPHbbLGM0U2lVH
	QAfD6QXjB2fRBwQ5Ocxzu/Myk3lPErNOrg8ZEXUTo7dAkd00/uobt6LAARxdv3i+hhZDg9
	F3K+Tur2sJ8cV+RTr9K5uGWX7JTOCr6XqjiFxOKT42tpsKqWMvRWmcJEqPdTvA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Randy Dunlap <rdunlap@infradead.org>,  Steam
 Lin <STLin2@winbond.com>,  Hsin-Yi Wang <hsinyi@chromium.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v5 03/25] mtd: spi-nor: Refactor Read Status/Write
 Status support
In-Reply-To: <b78b8e6a-2fab-489f-aa1b-a2ab23051794@nvidia.com> (Jon Hunter's
	message of "Thu, 10 Sep 2026 05:38:01 +0100")
References: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
	<20260904-winbond-v7-1-spi-nor-rv-addition-v5-3-2909a45fe4fa@bootlin.com>
	<b78b8e6a-2fab-489f-aa1b-a2ab23051794@nvidia.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 10 Sep 2026 11:57:11 +0200
Message-ID: <87ecf1sa2w.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_025728_283132_96AC4415 
X-CRM114-Status: GOOD (  16.28  )
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

Hello Jon,

On 10/09/2026 at 05:38:01 +01, Jon Hunter <jonathanh@nvidia.com> wrote:

> Hi Miguel,
>
> On 04/09/2026 19:12, Miquel Raynal wrote:
>
> ...
>
>> This is a really hard to review patch, it is big, full of changes
>> everywhere, but I cannot really split it further. The commit log is
>> really important, it tries to explain the steps I went through when
>> trying to refactor the whole QE/SR handling for which I received
>> feedback from Michael, Tudor and Sashiko.
>> Ideally we could expect test coverage of each case:
>> - BFPT_DWORD15_QER_NONE: Probably not needed
>> - BFPT_DWORD15_QER_SR2_BIT1_BUGGY: Expected from Hsin-Yi (flag is being
>>    renamed _NO_1B_WR)
>> - BFPT_DWORD15_QER_SR2_BIT1_NO_RD: Tested with a chip re-enabling RDCR
>>    in a fixup
>> - BFPT_DWORD15_QER_SR1_BIT6: TBD
>> - BFPT_DWORD15_QER_SR2_BIT7: TBD
>> - BFPT_DWORD15_QER_SR2_BIT1: TBD
>> - BFPT_DWORD15_QER_SR2_BIT1_1B: Done.
>> There will probably be breakages on older chips. These cannot be
>> guessed because they are not properly listed in manufacturer
>> fixups (yet). If we want a cleanup/simplification, we will have to cope
>> with this risk.
>> I hope the diff stats will motivate people to have a look and report
>> their testing.
>> I will also eagerly monitor Sashiko's output which will probably be
>> very useful to catch niche weird cases where these changes might break.
>
>
> Since this landed in -next I am seeing a flash/boot issue on one of our
> Jetson boards. This board, Tegra234 Jetson Orin Nano
> (tegra234-p3768-0000+p3767-0005.dts), uses a QSPI flash device and the
> kernel is used to flash this device. Following this commit, on boot I
> now see ...
>
> spi-nor spi0.0: probe with driver spi-nor failed with error -22

Thanks for catching this early! I'll get back to you with a proposal
very soon.

Miqu=C3=A8l

