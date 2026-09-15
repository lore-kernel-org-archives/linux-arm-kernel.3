Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9261C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MldQSLt+lfDM6akgn8f71Sps4Op9V02KPlLk0XcZRhc=; b=NhOUze773dfapMBAxqWVn0deO3
	BTDwKssNfg6T/STol3zg25cIzMV32Lh02XIymzndF9xudcC65Q1htnCE/4PCWToboBLU1xQJT8pPQ
	fFvdp11S7R+HRLIzw2ReFSkHN7MFLBQICxBO5jbgbk0p3cCFL7ilYq9Fb7jp9UyIf5bsgos2b72YJ
	4OgYG0Eo5xdf08YB+hjhjKQg+hyQiA9WK09n9U8tds6vz8Ntfoq4P4MXUzacBVgJ2kseVLLlKb+Q/
	7crceQoSyx3UPGhQd7n0yrYN+4L7LJCXraNCPo6DYI5/+be+Un931kqhqInbsxeJmGMi/ZM1AJco4
	VdDDRs+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RqM-00000006M9W-2AtH;
	Tue, 15 Sep 2026 12:01:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RqK-00000006M90-33q0;
	Tue, 15 Sep 2026 12:00:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 389B141B2F;
	Tue, 15 Sep 2026 12:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE4C1F000FF;
	Tue, 15 Sep 2026 12:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473656;
	bh=MldQSLt+lfDM6akgn8f71Sps4Op9V02KPlLk0XcZRhc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TYtZVg6I4Bh2MSIVyOp4GLsBjyldHMWNSOFvEULmB/p14azRXWqSnww77YB7+TPqN
	 ScvufVzu/TJTXHoXtbu6nkMmHWq4H4dMpP1MqQSi0Nmrto4rdEsiZifxC0Gp3ctWOs
	 gVm0pQG3DVlsqt2P+zJAnwEEyISNTbCWqNK7nqDQbAM5w/PqbddR2Jr7q9aHUm+QFp
	 3CM71ghQDVb22etuVzHNdfC2YmQHMxeMwBg3BFoQVgyoGYCR1SeIZz2CuWCHLj4qhZ
	 TcgsJSPylBVRit7lOZeS75JIgRGNA5o89jEC9Doqt4/emxXQvDifGb95FahnRJnIlz
	 1NumvA/sq5Uew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 23/50] file: open-code receive_fd()'s immediate
 install
To: "Christian Brauner" <brauner@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, linux-sh@vger.kernel.org, "Peter
 Zijlstra" <peterz@infradead.org>, linux-openrisc@vger.kernel.org, "Ingo
 Molnar" <mingo@redhat.com>, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-hyperv@vger.kernel.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, "Jens Axboe" <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org, linux-hexagon@vger.kernel.org, sparclinux@vger.kernel.org, kexec@lists.infradead.org, linux-gpio@vger.kernel.org, kvm@vger.kernel.org, "Jan
 Kara" <jack@suse.cz>, linux-fsdevel@vger.kernel.org, linux-csky@vger.kernel.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, "Eugenio
 Perez" <eperezma@redhat.com>, virtualization@lists.linux.dev, "Jann Horn" <jannh@google.com>, linux-mm@kvack.org, "Oleg
 Nesterov" <oleg@redhat.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, io-uring@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, bpf@vger.kernel.org, "David
 Airlie" <airlied@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-23-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-23-4d5217d6b246@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:00:53 +0000
Message-Id: <20260915120054.5AE4C1F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> receive_fd() cannot defer to syscall exit as SECCOMP_IOCTL_NOTIF_ADDFD
> installs into the target task and hands the number to the supervisor
> and IORING_OP_FIXED_FD_INSTALL runs from an io_uring op. Open-code the
> get_unused_fd_flags() + fd_install() it did through FD_PREPARE().
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-work-fd-re=
serve-unify-folded-v1-0-4d5217d6b246@kernel.org?part=3D23


