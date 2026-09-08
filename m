Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23380C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TckXPuonbCjW3ll7vU9025NMYhL42FTH72OM8FtKwpE=; b=dzatJTi5t3QE6q+hhvzCWCsaCn
	tOPvVX6zYFwGA0otQksufHwAjy9e5IK7u5qtJSshimQ/LDu09meH3Pb+ODuWSyFeBNXMlHUonc/BV
	VI/ljKNyqgyaKZDpsy1K8XFBhZOaNTOiKwNrTNsW035XyXsgbUo22kuvv8Rf1CUTL7vfShcVujKaQ
	y83zkX43wIHNTfMSDu/AtIalcCun2VC38fB5oPFTxYJdcQlZhCUBYFZWnMh6gY0Efg2gnl/Rj64MF
	f0Occ321vJnI0wHmS3JDBvyxzX9UByf8hJp8845FFfhKdpKiCn9wsjrl7mZGNdI0as0DAzTgP+z0+
	8x7lPJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yAr-00000009Z8h-2rVp;
	Tue, 08 Sep 2026 15:55:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yAp-00000009Z89-3NlH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TckXPuonbCjW3ll7vU9025NMYhL42FTH72OM8FtKwpE=; b=dmiuzeIzTpvdVQkT8TSCZZXAlS
	JQ/TmTT04u9DfNqbAKZut+fifPzSVAvH8+3io2EVewY2mPH5F8V+auoH55AxngFJxG2ZYV9UVhokp
	THqVn/jRNEA58Ym2Bc7bcFxWgId2z4LfKszN6NioIMjDYsD7fBS0pabBwl88RcOT/2dgFTfW8Jaxp
	UAUgyyhrK+vnTdGV9R5UYF1VkTVWs/DhbAMc8v019iUbipNuLJVsHca6CEq3Wm9AEVeGjUdFBs7rE
	HhyXJIHLY2GnAJKsHySnmFbuPwFtDoNMuTKazlbbVfBlUee6ZNnWiEBt124/8cp+RCa8QTkYuKvbA
	4T+hos+A==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3yAm-000000003Fn-3VA2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:55:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 37F1E1A1A5A;
	Tue,  8 Sep 2026 15:55:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B41A6031F;
	Tue,  8 Sep 2026 15:55:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18B6111C7AF29;
	Tue,  8 Sep 2026 17:55:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788882947; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TckXPuonbCjW3ll7vU9025NMYhL42FTH72OM8FtKwpE=;
	b=BiiqCaipRCamk0P+DqN11XxWdSy4g9gVvsyt5FfiOOlp5yNf2KIHo7imzk0DFw1h+2+CZW
	/GhhUBzehC7Cx+qialfYsmDwJ9K2+qigt8EvXg+hj3OMtYyVWollUUprBYOv8WPpr3ZOKH
	ilr/fRiu+9Hkqqgn1uMg3epX/WfaxgSWLcRJgbSH7YfTCLxIwrAaSjVzv7Xo4BCvR9fRH9
	n7VPPfYD6lorWP/tTMdFLEck+0FVHA7JdBqaqEYH7Yum626QcbzsPvezTblfTvLzEcE5TB
	R3E99OJFt0I0gK5v44auBg0T+kpbEGc3ww77arkQtiurLSnx3KlOFSiU6d633g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,  Boris
 Brezillon <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: fit maximized ECC step to page
 size
In-Reply-To: <CADvTj4rFxwgYZgKzcHZG738UV0_94gxG1Dhy--ET9jC=E1dgoA@mail.gmail.com>
	(James Hilliard's message of "Tue, 8 Sep 2026 09:27:08 -0600")
References: <20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com>
	<87zexst5ze.fsf@bootlin.com>
	<CADvTj4rFxwgYZgKzcHZG738UV0_94gxG1Dhy--ET9jC=E1dgoA@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 08 Sep 2026 17:55:44 +0200
Message-ID: <87y0dbspof.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_165548_987398_524B6F64 
X-CRM114-Status: GOOD (  15.53  )
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

On 08/09/2026 at 09:27:08 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> On Tue, Sep 8, 2026 at 4:03=E2=80=AFAM Miquel Raynal <miquel.raynal@bootl=
in.com> wrote:
>>
>> Hello James,
>>
>> On 04/09/2026 at 16:39:27 -06, James Hilliard <james.hilliard1@gmail.com=
> wrote:
>>
>> > When nand-ecc-maximize is set, the driver unconditionally selects a
>> > 1024-byte ECC step. A NAND with a 512-byte page consequently produces
>> > zero ECC steps before the available OOB bytes are divided by the step
>> > count.
>> >
>> > The older sunxi NAND controllers support 512-byte ECC blocks. Select t=
he
>> > smaller of the page size and the preferred 1024-byte step, using a
>> > 512-byte step for a 512-byte page while retaining 1024-byte steps for
>> > larger pages. Unsupported smaller steps and controllers without
>> > 512-byte support continue to be rejected by the existing checks.
>> >
>> > Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>
>> As reported by Sashiko, there is another use of 1024 down the road which
>> must be modified accordingly. Although, in practice, 512-byte page NANDs
>> have disappeared for quite some time, so this is a theoretical fix more
>> than a real problem.
>
> Does the v3 I sent look like it should work?:
> https://lore.kernel.org/all/20260904-submit-sunxi-nand-ecc-step-validatio=
n-v3-1-931cec317c10@gmail.com/

Yes I think so.


