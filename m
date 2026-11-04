Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21DC606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U2/2G2hs;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dSDLIn9Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vZywcU4Tpyl7Imqa/19fq644l3VIzOmHxylUZc8gS5I=; b=U2/2G2hs7dGs4h2OcU6LKrgZzJ
	9Tkmcz9lJ9vaq4pIXjdwosiTmhiOculPfqBfHVCxpQtbOLeFrUXUjs6o6DNhNGmg/PN4iy/G6bdqm
	Y2DiZFUKsWdjNy4aKH7pI3Cu3tFjipJYVgM1G9CvPvMgqy4M7tEK87zvVkRKeo7GZbGj839Pnc0ta
	u6MMQPTRawmYC9shK2nknN6j9HVp/RHjl3uELt/4sV1m8W92FHwa9BCkl4fSXqTv3/fS8/xXmG6jy
	ubJJjKqyLLmwLuDa9foWzR1V59D36TfMMwtfGpUxDgUtqW5uMFNbGK0AtH0xrLcncXoQ9j9O3Yon8
	+XMeR/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObCd-00000005Uuf-1Rg1;
	Wed, 04 Nov 2026 13:38:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObCb-00000005UuD-415h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 13:38:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1834D60DEE
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 13:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34701F00919
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 13:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799536;
	bh=vZywcU4Tpyl7Imqa/19fq644l3VIzOmHxylUZc8gS5I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dSDLIn9ZQZ9r/Ses78hycRTDZjPy44GtLGx0BLvIIIihhZ2v3cSg4ajqnbxJ2XMns
	 m725cFVSdYbSo0Ze/Juyhar/+eliRZLAVJIeAenD0eB3D5LJhbC99N47HVyaarlYlJ
	 VNSZklNuu7e43QS8YFctJcLMPBeA+UDGEjWW8c2eRxuWgLeoVH84FRMfEwq0oY+Pqd
	 wSTlITpTnueDpg98YnCWwNNGzHir8f1dccdsSkV1J7lAwiuITgFSizLF+xW98g43e1
	 POYpFpZHSFoWEP8fxQQMApxCmEDLLVH600aEEVl5cGtMiLiO//tBRgL+BvpK3nKSmK
	 ez7/JSnv2Tgtg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso760370e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 05:38:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByhUjulpUmF3frjInlSrv5lqPTjHx/VmVSZIvR0IjsHjXseaiISig7R9qxpPiB+nXxIM7v/MumFZh29mrCl50K3@lists.infradead.org
X-Gm-Message-State: APuU4Z8kFn8nrVxgBE3qeHEvBhUQ8wVhUnlUXGfLdSOiO5JC0cyqplCr
	OJZ1r1WxY8KqFIq5kWXPFvhDfoa+8feIUwil8z22SX8AvvhZUZde4OsopMTYofc9sAm0eqvaR1M
	c4a7Qktg+w+DSsKNjwY5GebrYF9CzSH8=
X-Received: by 2002:a05:6512:131e:b0:5bf:cabe:23b6 with SMTP id
 2adb3069b0e04-5bfd9569866mr5529745e87.33.1793799535620; Wed, 04 Nov 2026
 05:38:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260930101805.1770358-1-ruanjinjie@huawei.com> <88c40977-28f1-4f01-aa5c-6dedac822d21@huawei.com>
In-Reply-To: <88c40977-28f1-4f01-aa5c-6dedac822d21@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:38:42 +0100
X-Gmail-Original-Message-ID: <CAD++jLnX2ptZnOHWvU6QR+4VKeM+kPfjShkB0DQZpr3hnG0DOQ@mail.gmail.com>
X-Gm-Features: AclHuK9kvG8D0e3y0XT-oNPCO0nKfvGSwXLhxydNpJZTD7bCAeF6aTcpo_tZU_k
Message-ID: <CAD++jLnX2ptZnOHWvU6QR+4VKeM+kPfjShkB0DQZpr3hnG0DOQ@mail.gmail.com>
Subject: Re: [PATCH v20 00/15] arm64: entry: Convert to Generic Entry
To: Jinjie Ruan <ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, kees@kernel.org, catalin.marinas@arm.com, oleg@redhat.com, linux-kselftest@vger.kernel.org, will@kernel.org, shuah@kernel.org, peterz@infradead.org, thuth@redhat.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, kevin.brodsky@arm.com, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, yeoreum.yun@arm.com, linux-kernel@vger.kernel.org, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 9:52=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:

> Hi Mark and all,
>
> Ping.
>
> Are there any further review comments or new suggestions for changes?
> I=E2=80=99m happy to address anything that comes up.

You're pinging in the middle of the merge window, people are busy!

Now that v7.4-rc1 is out, rebase on v7.4-rc1 and resend please.

Sorry that this requires constant rebasing and resending, generic
entry is so intrusive that we need to take baby steps... maybe we
can merge some of the patches and not yet all? I.e. a trickle-in
method?

Yours,
Linus Walleij

