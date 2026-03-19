Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B471090223
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 13:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uc9E0xeVc/I43dVMYVDus0YY3HE/sgkaC1QGndLxyOY=; b=BU9N4dk3znUX3a
	+GDqwG41k8bTWpw3jmfbYou7uq+7gzrZeHGuKXL9sOaYdkIU3qEng3FZ4FV0karIuH2+4yzjwBFq3
	tTrKPSlXA62zI6x1l4WmSvMJgTFav5WnCxrWHQZhaAUg48yEeEOJ05BveptJEhdxi72frA1JKC33h
	77/Q8YoTpofvTTloLYix6BUeSlmf01bXZnfdG1bcXfrEyzXfGszULqXVjHcKLxnMFXBfBju+QS+ZX
	uxFJkOT1+9nL8BfI0HS36eehqAHgKvj/S+TahcOyLES1AlaexwiGc3kekFYEg3zs5JrD3O16tXnkB
	34UetSdES4dv8KTCSX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3D7q-0000000Af2j-2X6L;
	Thu, 19 Mar 2026 13:09:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3D7o-0000000Af1u-2VP4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 13:09:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E424844160
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3116C2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773925759;
	bh=Q6j72inhTsH6ewxfYJqIA8kdxCdrfzZ/qo9HHgaCAUs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Qygsp4SYDnjNIkRepZ6B/Da7WIVTVHYU4iXoNk8PmGV1OM/gGOd5/M9BvufNOMbpX
	 L3fe8ghS0ZDexaf/xoBcCNoxfpzJGgcSymUOSQM8LFCm7B7oLjrOmUhDXWw83okB85
	 JQKsLI1aTMKRjTk8mRQm4qDfSybEOQ/uU2kuBX7DlPaciRMwXzFDcFiQGi1TZaeY7U
	 /kYnMWhOloiKv/Vxw9DHsIIOnyr5Jm2RgGOup9G6c0BG3+vMniwNt0YL5DyO74/QJY
	 tvIbSDut+lE9CHg5aThsCyDdx3qXRcHu/ur7TUusVV3mLOE3vNUfEnXpdq66baJQkI
	 rj9/ECGl7VWpA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38bf132993dso3436471fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 06:09:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8lf5QHqXh8XrK9dLh99E/J22PPC1dTtTyrJ16VJ5uOIRCtE5GIZ3bTayM5Y9WrOgX4tFBJdhabSZmLu1eCOWj@lists.infradead.org
X-Gm-Message-State: AOJu0YyPQspvgoq+F2oBXNDGaGgHRKSHExrRhUrU6EtqN6RT3Lt3HN+O
	J250A0nrXfcN2DjPvP/sRQ7fElQuUNhJSMUI6JmlCekQW8H/fZS1l6gEEpKV+J49pexczky9vOO
	04vlg77Kth8YsSDIDpX2MSiPyfxE54JQ=
X-Received: by 2002:a05:651c:201e:b0:38a:4a27:1b58 with SMTP id
 38308e7fff4ca-38bd58700a4mr22921261fa.23.1773925758025; Thu, 19 Mar 2026
 06:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com> <20260319105947.6237-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260319105947.6237-11-wsa+renesas@sang-engineering.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Mar 2026 21:09:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v673oGgYbK9vxtgzCNSKR0=d+yT+3tD_bp_0AwLdVbht7w@mail.gmail.com>
X-Gm-Features: AaiRm51-S2qI8OWMlxRbpEKWhlUg86es_OnJ0C138mWD9n1SBCUMxkSAhbQynxE
Message-ID: <CAGb2v673oGgYbK9vxtgzCNSKR0=d+yT+3tD_bp_0AwLdVbht7w@mail.gmail.com>
Subject: Re: [PATCH v5 10/15] hwspinlock: handle hwspinlock device allocation
 in the core
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Wilken Gottwalt <wilken.gottwalt@posteo.net>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_060920_676376_10E45B09 
X-CRM114-Status: GOOD (  14.97  )
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

On Thu, Mar 19, 2026 at 7:00=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Providers have been refactored to avoid using core internal structures.
> As a result, they do not need to allocate the hwspinlock device on their
> own anymore because they can access everything they need with helpers.
>
> So, the allocation is moved to the core. As a result, the registering
> functions now return a pointer to the (soon) opaque hwspinlock device
> which may be needed for unregistering only.
>
> Because the argument list of the registering functions is changed, all
> users are changed here as well.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/locking/hwspinlock.rst  |  6 ++--
>  drivers/hwspinlock/hwspinlock_core.c  | 48 +++++++++++++++------------
>  drivers/hwspinlock/omap_hwspinlock.c  | 10 ++----
>  drivers/hwspinlock/qcom_hwspinlock.c  | 11 ++----
>  drivers/hwspinlock/sprd_hwspinlock.c  | 17 ++++------
>  drivers/hwspinlock/stm32_hwspinlock.c |  7 ++--

>  drivers/hwspinlock/sun6i_hwspinlock.c | 12 ++-----

Acked-by: Chen-Yu Tsai <wens@kernel.org> # for sun6i

