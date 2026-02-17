Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4141DE63F2B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 07:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tA2t5oeOUZ8eAwOpBVyGbemY7+jVRLWknKxnMDhCYms=; b=gnZbvwCjckyHi6
	4+NBBk1WvTvqOs2y5skz2qhWaJroaxAlDgUc3o/m19qV4hv2ouTHCWkKtcMR8MyYShRjZrCeXA2iR
	5QV0bY8IyxzeAkM55Q38BoOjRotBOAHBJV1Zpn6wjgpOqqQPz45WfeCu6XMwj3H5bwsCo/bzPDRA6
	zDd4eH9HkdVtFrucpidIRUIkt/DAS1IUmgLffqSyui1aovjnuqLEPqzc1FbnPATZybWDwgQpRo7qt
	+Stqcehkl9m9sw/0qVBFYssKwgG2YJYteBLfS31rtxXHqa+cvzqvrIg2bPM8BITvtdtZcifCiz9Fi
	LpTO9yCSlrhT4+fz08dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsFu5-00000007nRD-2bjH;
	Tue, 17 Feb 2026 07:53:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsFu2-00000007nQi-0Z4c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 07:53:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DF73419F7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 07:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C703C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771314829;
	bh=tA2t5oeOUZ8eAwOpBVyGbemY7+jVRLWknKxnMDhCYms=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=LNnvFNt8TzdVxP6kq+X0upGc19BXHfJFty3jpW6tHWQJBEFvfpyonpjVgsx+jJ8mW
	 OhxWML1LoAuUxm6+M0IARUuQl8IpXeq3+tOEtWsvJuEwOD9nRjWDP/3PsuMsv7RZQ0
	 xsb/4z/aHIf8IXV9W1PuBJDPsydg617d4nwN8d9c9v8y5b0MP32wNRAZT+Yeq1YnIF
	 tKMvS140nE/O7gk0LldojB8VqdP+gJKoyiKObJFg59UEgD+cQ5qxdiadZ1yhraRSTT
	 v8KRahk1cQUgDZRiKE/Ps5AcYuVJ6HpkkhH2HZ8FWx/l2liL76A5UDmxW0kJacNQvz
	 bLZC7NTveINRg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38708180241so28132231fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 23:53:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNPqN0fQGMElgGROES3poFdAXpQPxc0lJntH7XhSacdHwwCRv5d490kDg0DhXraANoEIXNoaDs6q+w5ObFss/C@lists.infradead.org
X-Gm-Message-State: AOJu0YyuLW8rAC8Og3++t0sAN/3gnoR0ejcSBZsHzMMZiGgXv5B19IBl
	zWAGyHu6Dyf5AXgNY3VdR5dkqx6fX6oFE6elV3/4jLd6bkApXAulA+zZjn4709T52lDdPkF0c9W
	6DZj3WawEt2E39ZVmCGTFwNi+NIn4V6k=
X-Received: by 2002:a2e:be1e:0:b0:383:1232:379a with SMTP id
 38308e7fff4ca-3881050bca3mr34254911fa.2.1771314827466; Mon, 16 Feb 2026
 23:53:47 -0800 (PST)
MIME-Version: 1.0
References: <20260217014801.60760-1-ethantidmore06@gmail.com>
In-Reply-To: <20260217014801.60760-1-ethantidmore06@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 17 Feb 2026 15:53:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v64iwahkDyuTtWo3YsdgExBu-fs8XRcsgPvWX5ETb=irtg@mail.gmail.com>
X-Gm-Features: AaiRm53D6IJmr1XrVqkJyD7FBEAc639vco0g_d6NG7g082rgVzjQ9c8XaAjLhcg
Message-ID: <CAGb2v64iwahkDyuTtWo3YsdgExBu-fs8XRcsgPvWX5ETb=irtg@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: backend: fix error pointer dereference
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: jernej.skrabec@gmail.com, samuel@sholland.org, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_235351_181910_AFF5D2A7 
X-CRM114-Status: GOOD (  10.16  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Feb 17, 2026 at 9:48=E2=80=AFAM Ethan Tidmore <ethantidmore06@gmail=
.com> wrote:
>
> The function drm_atomic_get_plane_state() can return an error pointer
> and is not checked for it. Add error pointer check.
>
> Detected by Smatch:
> drivers/gpu/drm/sun4i/sun4i_backend.c:496 sun4i_backend_atomic_check() er=
ror:
> 'plane_state' dereferencing possible ERR_PTR()
>
> Fixes: 96180dde23b79 ("drm/sun4i: backend: Add a custom atomic_check for =
the frontend")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

