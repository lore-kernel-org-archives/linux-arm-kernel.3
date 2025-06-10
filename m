Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED437C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 17:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f/uq1I+B9LLI06wSlnUmvAFUkcW1tFqKrymABT6FCYk=; b=AI2ALgqJhxTezgu2lKj6NRVz/i
	WQZNEhbekx3waKc0N3JNqI2EjDvqVXmOA4+sYRrDtCs7q+gLxItWuRfLe+XiJAp/45sjQZE4oAslU
	G4E8cY+bdrMfu9LbgIoQIwUi392mrG9J8/I8TixtXO8AU45hIgFaNTTVrtp3Ceediv8t18JbGLsOB
	FsEFxr77rvPQUUQMk+Ure/DG/RSmQUNzmxnV+CfilwV39H6YW3vuH42fh+42yvg8EMu7HD5mqwI4y
	716qQZNQHbSFxqLHPOLeS0uo+7U5HiK99BsI2DFRG991DI2XYAwZDQfXVncLoqyNNqNFa44I3fMXj
	IV1k7vqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2uw-00000007ecy-3zM3;
	Tue, 10 Jun 2025 17:37:47 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP03p-000000078lC-07Ev
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 14:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1749566085; x=1781102085;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f/uq1I+B9LLI06wSlnUmvAFUkcW1tFqKrymABT6FCYk=;
  b=ji0+9G84yE2l4i0Kdp9pOrTFk/gWYc6wah15ycpVVNrgEhqTPukz4qjy
   xkmJr25ARXZkGhF8/+0/C9G7//265YiJ2haoMwh2o/HLdaRtOZFajRzxU
   5Ddd9Y2oRqF7QEe5fjqq9qBulqvnGeTdTG7FXnsO1cbp36qeR/iRJulYy
   4HBu760OmAf85R3VTEBWa9JQziT5+ltTNqDFRCqbj9aT9cyKx5rX5QIlK
   d5WTPw/btvjr+QatiWVq1Quf7ygHNuochTAVc+ndNdTKF81IW0EZa8lFx
   oq60FrhnP74QxSHmcai1KAYh4zUiyrju1R5ccM1Jkse5YRHhGrwOGtWL3
   Q==;
X-CSE-ConnectionGUID: kYgfLlyHSVC6h4XfKHFkxA==
X-CSE-MsgGUID: anVKDUSkTFuCimA0q5i7LA==
X-IronPort-AV: E=Sophos;i="6.16,225,1744063200"; 
   d="scan'208";a="44549795"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Jun 2025 16:34:42 +0200
X-CheckPoint: {68484282-17-28ACC837-DD1065DB}
X-MAIL-CPID: CAD6A884CD6B476837959D4E89B9D99C_2
X-Control-Analysis: str=0001.0A006370.684842A2.0045,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36E39161097;
	Tue, 10 Jun 2025 16:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1749566078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f/uq1I+B9LLI06wSlnUmvAFUkcW1tFqKrymABT6FCYk=;
	b=V3ZL1UlcxBDSCM+zF2qoWQqbdc7RMwjd6ZLNPbs45h5DmD2iDslDGOil58Z/u4JMA4fVv6
	P1p1OyuzK9scqQrbSXoOR0OyytqR26xiAWrh3R5HVvcm0m9/6lU0qQM3K+Ws2TUX5Fsx7u
	zOwoWTaE+2tq293w5C/r86oxC47XtV2qIOfaFJl+gx4+B7L+v1iSKGm963NMMoAgJ6ctzi
	zMJOFK5zjXODej9uSfA9zJMEAoQ+m5XY0zx3hiStG8O+wCfa+FpyOdKIWnYDoshChvVvvn
	W3XXXjGDpboPd2aYD10MiTTaINxS3NeuqH2cUlT1ub3fTad89Hoaj6mJHu0Ibw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: netdev@vger.kernel.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 linux-arm-kernel@lists.infradead.org
Subject: UBSAN: shift-out-of-bounds in include/soc/fsl/qman.h:70:9
Date: Tue, 10 Jun 2025 16:34:36 +0200
Message-ID: <7817812.EvYhyI6sBW@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_073445_548753_CD2E87B7 
X-CRM114-Status: UNSURE (   6.55  )
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

Hi,

I'm running a Freescale LS1043A based platform and with enabled UBSAN the
QMAN driver raises the following trace:
> UBSAN: shift-out-of-bounds in include/soc/fsl/qman.h:70:9
> shift exponent -1024 is negative
> CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-rc1-next-20250610+
> #3065 PREEMPT  79669a76f0881c2711711352971d97872fae206d Hardware name:
> TQ-Systems GmbH LS1043A TQMLS1043A SoM on MBLS10xxA board (DT)>=20
> Call trace:
>  show_stack+0x28/0x78 (C)
>  dump_stack_lvl+0x68/0x8c
>  dump_stack+0x14/0x1c
>  ubsan_epilogue+0xc/0x3c
>  __ubsan_handle_shift_out_of_bounds+0xa0/0x1a0
>  qman_resource_init+0x178/0x1a0
>  fsl_qman_probe+0x260/0x480
>  platform_probe+0x64/0x100
>  really_probe+0xc8/0x3b8
>  __driver_probe_device+0x84/0x16c
>  driver_probe_device+0x40/0x160
>  __driver_attach+0xd0/0x240
>  bus_for_each_dev+0x7c/0xd8
>  driver_attach+0x28/0x40
>  bus_add_driver+0x108/0x244
>  driver_register+0x64/0x120
>  __platform_driver_register+0x28/0x38
>  fsl_qman_driver_init+0x18/0x20
>  do_one_initcall+0x6c/0x39c
>  kernel_init_freeable+0x32c/0x394
>  kernel_init+0x30/0x160
>  ret_from_fork+0x10/0x20

AFAICT this happens in qman_resource_init() when QM_SDQCR_CHANNELS_POOL_CON=
V()
is used for channel 0-256. HW IP is revision 3.2, so qm_channel_pool1 is
set to 0x401.

I don't know why this works or this never raised an issue before.
Any ideas or suggestions?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



