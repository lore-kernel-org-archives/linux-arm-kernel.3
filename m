Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF123C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYzMflbMuPv9H/GLK1g6J9E5AwtdI+O/+Pdc0wsdGlQ=; b=pcDPASa3wUC/nJIu2KILGB91ox
	iWWqtmzk6Trk8fr9glQJtQPFejWN5+fn+9dMrtE8JtLCc1w4RsWBpC1dfbmVnJNoNkg4LBSpUqCeU
	uNhC8jBvGZDAjZu8FytLqyN0J3FLBM9QMwyJUe9JxcRB6iwhu3z76VV1gYz9MjoHurRtXxQoBH6Zh
	saNyAuSGYiu6oYh2JYBPAaN70BAKNZhEZr4liX38F4EVJ+4+PygpnVxdTvLvz6+207dasF70kxqW4
	v5fMsj89D3uWOEKxqEOvAixUkOxKhcN+cMW9OgVYSziMlWBBB4O1SXBBGXy9AQ234FSnI/7ynSq3b
	93SV0PoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ryh-00000006P4n-21Ei;
	Tue, 15 Sep 2026 12:09:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ryg-00000006P46-15tu;
	Tue, 15 Sep 2026 12:09:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E3EE84096B;
	Tue, 15 Sep 2026 12:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED881F000FF;
	Tue, 15 Sep 2026 12:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789474173;
	bh=UYzMflbMuPv9H/GLK1g6J9E5AwtdI+O/+Pdc0wsdGlQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jH8MeFUt+Ca90GijJLK5hVAYB41iBAVkHXhYxlgSQZsl+pyWmTzGkAYZ9RXqYBDbG
	 rKZCB6pYmFyP5M1bk4Irpshq50uz2b5QkCnTtwMupHWy+yvoXlLhHmQpzBrkPJbweM
	 DOJFaJK8kjjNY5ZP2iw190s62x+TzNavmrmqQj5YP/0STVvoLNJYJafDKfgf5ojLUP
	 LuZmhYwmQV123gJgzbNrAwrP+hPwOyQBF3mK6DppyLtpzOvR8DpMm18peMtTYKiuPd
	 RpvHgbF2jJw+E059MS7iRdmviODCKeE/Aiqyn0EbGm/VrErx286rEzup2WusNoTIC3
	 +JC3oUetgOKKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 33/50] io_uring/zcrx: install the exported
 descriptor when the request returns
To: "Christian Brauner" <brauner@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Peter Zijlstra" <peterz@infradead.org>, sparclinux@vger.kernel.org, linux-sh@vger.kernel.org, kvm@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, io-uring@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-parisc@vger.kernel.org, "Oleg
 Nesterov" <oleg@redhat.com>, linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, "Michael
 S. Tsirkin" <mst@redhat.com>, linux-gpio@vger.kernel.org, "Eugenio Perez" <eperezma@redhat.com>, linux-csky@vger.kernel.org, "Jann
 Horn" <jannh@google.com>, linux-um@lists.infradead.org, "Jens Axboe" <axboe@kernel.dk>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, kexec@lists.infradead.org, linux-arm-msm@vger.kernel.org, "Jan
 Kara" <jack@suse.cz>, linux-mips@vger.kernel.org, "Alexander Viro" <viro@zeniv.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, "David
 Airlie" <airlied@redhat.com>, linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-33-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-33-4d5217d6b246@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:09:31 +0000
Message-Id: <20260915120932.0ED881F000FF@smtp.kernel.org>
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

> Rely on the fd exit path machinery.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-work-fd-re=
serve-unify-folded-v1-0-4d5217d6b246@kernel.org?part=3D33


