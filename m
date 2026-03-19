Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F051090220
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 13:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4IyYnjU6K1y1jTP9vSvUS57bkcYllaGKocUFvMjOAwk=; b=TAd8zlYy33DxSQ
	q/HNlU8UZ4EOurgM9wCAz1gmjETU25NTSDlzXqE87XEdfR1PQTat4EcCXLZnI2Tn8zlKXHSYlrCUD
	q+0Zp48qEVFYecu410R1PzyMBimJCoRCbrYa3lRw8nmoql1nJKTMrJ7ncCquzJWOi+V72AvnuNuNv
	djihOEohzLAhzAmQCYxbsFZVZeQr2TtuYK0fZuZgtu6QVR6UfQz3stH7AcWiDlCvF8PEXJjLZlExA
	bJK8WVctqTW6AhSnklMhHpUED0aLs5BpZfcGMmvsZhG1FHisC4UI3gQ0ImQUZME59ElFlIQQQE43l
	smMS4LEYWKndOHkXdg+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3D6k-0000000Aesv-0J1e;
	Thu, 19 Mar 2026 13:08:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3D6d-0000000Aerx-1LwY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 13:08:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 979E641874
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DECEC2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773925686;
	bh=PLIQNmpARgORTyPtKiscw4UfX4zOOAigpCDT2JYNybY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=PLF4kov8VHF5Sz3cCLnIzd9CB3vRVzrNjXvudGe6zNM9EioZ5xUNAjtWGfOSMaeay
	 lvq+NQihEbdMoSP9Jiq1NdWLcEhKx0vpVO9lGPcLGB4pqxvKGe/Aak/3Xq2Hbbyn3I
	 9uMMge3POiG3mLoH0PFauIh+4/wXlbhnx0S/DBSgx81OPUwDhJYiCaGEgaalECQ/Re
	 OICBDCGhdAHSQ6zYFduWEAhPkfM9k+NCePHEqCIjsaCSJ4KY1ZfZg9lSij+ytrOd63
	 9ngQGI/xbOH0TpHR2JehTFci96wF/M9JIQb0wCz3HmT4DSc2qVUwu/qiII139nm9JO
	 YaZVg7FnQY3TA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38b3ee785a5so7606061fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 06:08:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSz2QSMQv5YtlWm8bqnA87P4wr5zeNTCdlVXWLe9KB1g5c7HpEJtg3zsQahTRjgForcTsSpX0YuVlMDIT4VA1q@lists.infradead.org
X-Gm-Message-State: AOJu0YzMHfsPdY8jhdjLCoGaDdhn4nURkiXcd5M8nbkYMrubEF+pSodx
	I7BzC7tOTxLF2Y4qeEs3+iLzW6kucxeIWtApUy9fEO3uuicbzDvTyHBdMJdwMBn1tqpOzqpnW+b
	tWAQnJA5Jr8e+lVj1MEvXJnMT8rHVF6I=
X-Received: by 2002:a2e:bc20:0:b0:383:789:3c3 with SMTP id 38308e7fff4ca-38be5e6e7ebmr10670061fa.2.1773925684481;
 Thu, 19 Mar 2026 06:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com> <20260319105947.6237-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260319105947.6237-5-wsa+renesas@sang-engineering.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Mar 2026 21:07:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v67NVc0QD=_Ftwx5LSCQ8n1cEwuX1oMWZgEzowfGf7gMKA@mail.gmail.com>
X-Gm-Features: AaiRm51rluS_yVFu6WIEO2l7ox-ygOi8igmHKgG-QVsILV0f84uRCi8SrIk-dv0
Message-ID: <CAGb2v67NVc0QD=_Ftwx5LSCQ8n1cEwuX1oMWZgEzowfGf7gMKA@mail.gmail.com>
Subject: Re: [PATCH v5 04/15] hwspinlock: add callback to fill private data of
 a hwspinlock
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
X-CRM114-CacheID: sfid-20260319_060807_833151_AE0A1CC9 
X-CRM114-Status: GOOD (  14.05  )
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
> To hide internal core structures from providers, a callback is added to
> the ops which allows to set the 'priv' field of a hwspinlock. It is
> called when a hwspinlock device is registered and, thus, iterated over
> all locks. The register-functions are also extended to pass a data
> pointer to this callback, so it can do necessary calculations for the
> priv field of each hwspinlock. Providers are added only an empty
> placeholder and are converted separately because these changes need
> dedicated reviews.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/locking/hwspinlock.rst     |  3 ++-
>  drivers/hwspinlock/hwspinlock_core.c     | 19 +++++++++++++++----
>  drivers/hwspinlock/hwspinlock_internal.h | 19 +++++++++++--------
>  drivers/hwspinlock/omap_hwspinlock.c     |  2 +-
>  drivers/hwspinlock/qcom_hwspinlock.c     |  2 +-
>  drivers/hwspinlock/sprd_hwspinlock.c     |  2 +-
>  drivers/hwspinlock/stm32_hwspinlock.c    |  2 +-
>  drivers/hwspinlock/sun6i_hwspinlock.c    |  2 +-

Acked-by: Chen-Yu Tsai <wens@kernel.org> # for sun6i

