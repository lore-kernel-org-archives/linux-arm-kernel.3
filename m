Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9A9C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foNXNPfm0YOXYb4+jKYd4+lAF9aF6NFtBcoJMDQD3PE=; b=4oBX3RvTN+lhHauK6BdGZo5DGf
	ciD77NideoaPDlahAvshNwl0/PRyPy6OA7pd1NXNo2YsjAZJaIh8scNIuQvon0FcJDnnT4vhEE/Ir
	24Ta897vLgPGmm29F+14Heu0Pfo8FKSS++zkZ4kvHZVOISHuIaSmCtsfL3PiaadBJm0E/0vRgJiLZ
	TMzliQeLpQRSKwmpD6dEfZPiqgLqX6ZXNyUnybSlfMnCeJaUbjC9rgq9cFbbeIb7OJio7xgxvaEo6
	tlNNRUCoMdiu+IyH9mPu6C2d5Dv6VUnar+eCOudZJ3mbGIysXhmCvhgZTAiwrCvbxx0blgxb0z+5L
	SAvzI1ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rmy-00000006Kst-3ntZ;
	Tue, 15 Sep 2026 11:57:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rmw-00000006KrT-2kUy;
	Tue, 15 Sep 2026 11:57:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 09E4041ADC;
	Tue, 15 Sep 2026 11:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2291F000FF;
	Tue, 15 Sep 2026 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473445;
	bh=foNXNPfm0YOXYb4+jKYd4+lAF9aF6NFtBcoJMDQD3PE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vtnl/09NTEmqyW1tNPT+8T8JuOyDJguLBv2ERQfv5mV8sUbXuBe9nfRUxjy6D04/B
	 Hcm4AIGNtGqTcc2GGlKlSglke2u/FXcZ76lL25z2/NeeHWPcqygtSbbzmeVVztVUgW
	 hoS+iCHyLKT95UZw6JB3PNuoK4/zapEViq1/QVJmftEtEMsjVlV/1Wdd/5mzRfse5N
	 Hf4nzWabASK5Nn3pr5jvJ/Gt8VwGXr0IJhqiu3SrFCMh0A7gLPSMGtW3IAoUbAv4fC
	 i4vkJOaZ592ko8M1p7dcC3BjyfLFGQY4bZoyHYD9fIuFfPgwESBHAG9TF4alz32jll
	 rFcSGLJmW5YeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 16/50] sparc: commit fds on syscall exit
To: "Christian Brauner" <brauner@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-csky@vger.kernel.org, linux-snps-arc@lists.infradead.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, "Jens Axboe" <axboe@kernel.dk>, io-uring@vger.kernel.org, "Jan
 Kara" <jack@suse.cz>, "Ingo Molnar" <mingo@redhat.com>, virtualization@lists.linux.dev, linux-parisc@vger.kernel.org, linux-um@lists.infradead.org, "David
 Airlie" <airlied@redhat.com>, linux-alpha@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, "Oleg
 Nesterov" <oleg@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-hexagon@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Michael
 S. Tsirkin" <mst@redhat.com>, dri-devel@lists.freedesktop.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, "Jann
 Horn" <jannh@google.com>, bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org, "Eugenio
 Perez" <eperezma@redhat.com>, linux-openrisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, "Peter
 Zijlstra" <peterz@infradead.org>, kexec@lists.infradead.org, sparclinux@vger.kernel.org, linux-hyperv@vger.kernel.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-16-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-16-4d5217d6b246@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 11:57:23 +0000
Message-Id: <20260915115724.2A2291F000FF@smtp.kernel.org>
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

> Add TIF_FD_SLOTS and test it together with the other syscall exit
> work on the way out of a system call. A task that reserved
> descriptors calls syscall_trace() on sparc32 and syscall_trace_leave()
> on sparc64.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-work-fd-re=
serve-unify-folded-v1-0-4d5217d6b246@kernel.org?part=3D16


