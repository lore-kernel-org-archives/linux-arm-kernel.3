Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A20C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGcmjxpZCTXHRxx6IkfvznZnwzxo/1rjhgD1Rv2Z/Nc=; b=bwKvy3IWMAS1JPhEAFWkj+kLP+
	FfJkVQXoxxXoQLYBUYDeZIMqafKl4uiyTQfk+OAhvLkzrktZKPRCQ8un8NgyzCPSVa9b+7+CCwGOF
	h8cSIO9pqtTlftYvO+NKXnbwjykGvuDdRn7b6Mrx2P3kyntlIb95cbq4Gh7VDUfhNLP4fdWksQ2lX
	m73MRbGNjEH5GnGuHsRSQ54/x/DTfN73zmHrXM0HgetvdtGZqo8gDpcB5nHlBhcMQOxf5TPnsVG07
	pa8P8MoIAmKiyxnIKRdfkXepDcbzf0wZd6ewfEdAPTt2zRsRzmozjDB3W8aieyhGNqDLP/ebLtPVO
	NtOo4y4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RfC-00000006IWc-2QeB;
	Tue, 15 Sep 2026 11:49:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RfA-00000006IVx-1OaJ;
	Tue, 15 Sep 2026 11:49:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BFBA06025F;
	Tue, 15 Sep 2026 11:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3511F00893;
	Tue, 15 Sep 2026 11:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789472963;
	bh=eGcmjxpZCTXHRxx6IkfvznZnwzxo/1rjhgD1Rv2Z/Nc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CVgUMcUdzZ3HeCX7d6oqPXdbOOpGnXFMxjmYOiUrDVNMDt6KSFLhwNsMaJoGe3qW3
	 gT6age4Ix8+ho3dxOuPdVPygCOYJmPGqaSEykNHcZv6dAOxJwunKYYu4Iy6A9HEIGW
	 hcxAvgkD63Nv91Yz6yOQLgb7Ly/W9NSezfZRhRwHurpZzKr7aOf2o+Cm4PxtjClXqh
	 MW7HRD1EbMfKOn51qnYtFwoyPkyekFswcsrTqcrSWt/vX+swYhoct8jk8UjXmMMElm
	 /5HuOJJSvXEi0+me6ynfkfTCY644nEmjpK012H06rZNZan+EQsBhkzseJGuSock+gz
	 vnG+SGZD+4dDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 08/50] hexagon: commit fds on syscall exit
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "Jann Horn" <jannh@google.com>, "Oleg
 Nesterov" <oleg@redhat.com>, linux-m68k@lists.linux-m68k.org, kexec@lists.infradead.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-csky@vger.kernel.org, "David
 Airlie" <airlied@redhat.com>, linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org, "Peter
 Zijlstra" <peterz@infradead.org>, linux-alpha@vger.kernel.org, linux-sh@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, bpf@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, "Jens
 Axboe" <axboe@kernel.dk>, linux-arm-msm@vger.kernel.org, "Ingo Molnar" <mingo@redhat.com>, linux-gpio@vger.kernel.org, linux-um@lists.infradead.org, "Jan
 Kara" <jack@suse.cz>, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, virtualization@lists.linux.dev, "Eugenio
 Perez" <eperezma@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, io-uring@vger.kernel.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-8-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-8-4d5217d6b246@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 11:49:21 +0000
Message-Id: <20260915114921.AE3511F00893@smtp.kernel.org>
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

> Add TIF_FD_SLOTS and test it in do_trap0() once the system call has
> returned, before the ptrace exit stop gets to see the result.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-work-fd-re=
serve-unify-folded-v1-0-4d5217d6b246@kernel.org?part=3D8


