Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F55C98328
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 00:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dM60/lQJZNJbWoteFqu6uPH785ljbJ4v68GljKAZeM0=; b=engx+tDdT6bBAWufKC9YgF9S8R
	pqRxZVv+eKUJjVYlkCZnhK9sSJpK3Fpz7heIIZYeyZYPkVj/mBxt5BHTl9crZ43tfzU42cpgELkDr
	ZCKyX5TFIOS+VoIWYWVPooEfWGhyVsECoFLDzPLnCkzz0tFsRyLkwFaRSpw+w4y7qWOo3Ub+bTTRl
	FkXlv3UH8zRokLPMhdAGsxiSquLccyHWrMbCsgT00EML5U+95OANXe1LoWAPNpZr0uMZjIdt8vjDK
	TNdRVO+BbZ/eVL0RaIDnTlwpSlB6U6KF4Lj5jqdx/Bb5Rgqq08jHTdX7D7XcbclnrBPlbaHWh5+sE
	oci547yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAcMZ-0000000FsLS-1VmS;
	Sun, 27 Sep 2026 00:03:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAcMY-0000000FsLM-1f13
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 00:03:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C33DF4451D
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 00:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72A11F0089A
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 00:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790467405;
	bh=dM60/lQJZNJbWoteFqu6uPH785ljbJ4v68GljKAZeM0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f/5SmjLjePvZl3LH6369Ee/UAZiErmbVU6lXrAbYe8NE4CaJWSkGPNzY4Lcv7x12a
	 55hDT4TwA3/WxLizDWvSaRTPsxLZICzsMNOTP/p5mDpjMfT/Lyabk9dWRluBeIpnDN
	 ikp62HRGBvtqqMDW4yWEaiv9mmFciTf1Z2PJ6Wtf0QwXai393RVogdrry0oHdlA+rV
	 X9/G7p+aCXHKyOMu5g+wG1ppLnlLEsPm2t0fIRSS49d85JsNrr1ixi20c8jU8nL+UF
	 Ujwme8BRAizGPecmH0uTOCV055bPXrMKzJj/vvj4/iB1w7G0utdP3YcRX3pvSPkB4m
	 JGPiAmlD8GAZw==
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afd63c3e0so153463866b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 17:03:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwnDXUvw91O/I1IQk95INwnvmCfEuBfkpJ/rbR7Vy19fKzetzCDTFbXy1q0z8R5x0eYkmP/Pq+QrUtWfpLSVdN6@lists.infradead.org
X-Gm-Message-State: AFuF++mxSKThHCjBcmGarKuHR3wyH8GOtU08mLgRbkjwcaeKUSbxE6Tw
	NnCGf9xDutRAWDmZ9dXpp0ZP2uaXZKwfcQZvfzrxIAjbNH9gc0BhAUqbUjopnDoKpglWRgUm4xk
	h3HDq6FXy/pI7GOwNp2w1IFJxi6cAgPOOevVawyGMhQ==
X-Received: by 2002:a17:907:970f:b0:c28:e01d:1d08 with SMTP id
 a640c23a62f3a-c2ac268a3b6mr767904866b.49.1790467402757; Sat, 26 Sep 2026
 17:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260926045517.3458413-1-matthias.goergens@gmail.com> <CACePvbWPLegjMtF4jYN4+_1ZeoEuBHwZuwNyMpYwPZaA0edO5A@mail.gmail.com>
In-Reply-To: <CACePvbWPLegjMtF4jYN4+_1ZeoEuBHwZuwNyMpYwPZaA0edO5A@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Sat, 26 Sep 2026 14:03:11 -1000
X-Gmail-Original-Message-ID: <CACePvbU_6o_9fEFU6TJ9VaZ=4yBsDG5qXcxFkrGHBSD69m5ZXQ@mail.gmail.com>
X-Gm-Features: AclHuK-ZyMX3KOF420HwXlAK4cpZeFQwMK0gQ_EG8K18s67LKRQ8CucrkEWbQU8
Message-ID: <CACePvbU_6o_9fEFU6TJ9VaZ=4yBsDG5qXcxFkrGHBSD69m5ZXQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate offload
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-api@vger.kernel.org, 
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, Karel Zak <kzak@redhat.com>, 
	util-linux@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Sep 26, 2026 at 1:32=E2=80=AFPM Chris Li <chrisl@kernel.org> wrote:
>
> On Fri, Sep 25, 2026 at 6:55=E2=80=AFPM Matthias Goergens
> <matthias.goergens@gmail.com> wrote:
> > The series fixes zram selftest device tracking and error reporting, add=
s
> > the swap policy with DRM eligibility checks, and tests routing, working=
set
> > activation and retained-entry write refusal. It is based on mm-new at
> > 995829088503.
>
> Hi Matthias,
>
> I can't find mm-new 995829088503 anymore.
>
> Your patch does not apply cleanly to the current tip of mm-new
> mm-unstable, or mm-stable branches.
> Do you have a git repo with your patch applied?

Never mind, I have the conflict resolved on mm-unstable.

Sorry I usually need to have the patch appliable to use my own review scrip=
ts.

Chris

