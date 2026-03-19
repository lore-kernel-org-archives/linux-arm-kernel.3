Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4570B1090220
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47NnVT78m+bHzv4zmH8R7x3ZDKiqqPX8ZpRp18XYgSw=; b=oxUZ+6ESFohPzf
	CAT3i04W6JouwvMZjxWsgYhzMyjQOalcuVAqC+SBT41hlfVLun4kV/nTicMVzFIKhnq470Ed641CE
	oBEIpf+O6tdCniO1FN8ZBuLJp646E4Wd5Xw9cmHj8jeTr0f+V8qClfa/v+a52fruMbwIvLNxsDSVz
	2CDoeOfeIeFeblhpUqHgoZM1t70g0XORENSii1bR5b4SoH0F7OTB7BicybDjDBRnEmwZHyn27ofz9
	FWrZ5Eoo0FFCiYnT2B/LMeizXg7rLSgXXS9R8DECcXyWlPUiBiJDi6tbSalLNK4M9snA3luCZL1Af
	4OQ1/q4RTKDZs5UKLOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3D8R-0000000AfA4-3xPT;
	Thu, 19 Mar 2026 13:09:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3D8Q-0000000Af9M-0kTv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 13:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2FE244539
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED1AC2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773925797;
	bh=Ts/ZBzEhwzBq6L1alBpL4MrUmv33n0V3E/Ul5uCiuTo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=RacmPq1bIqMeMcyhxiEK10j6ygmP3LMQK2Z2fVE3HCOxsgvgXy03lL3FuvuLQQvgj
	 GiQcbk0Gc68ea8eJ4LngePUDz9C5XojYstENdaRQM1y0oSw68pXH0FB/x9xYOoXLj5
	 yzHUkBwYEvcieaKcpfVCPm7nVCORUUsT0yOyNlGzfZbyxsZTMYNRLeKm/6/LsH6iAi
	 g+KwM2FKgeEjnQE4mZhq0fF6zUla5vAiMm1h5fjWA7LIX/ZFlm4NfZRaEHQvb0eRdn
	 ro9atKpn/5SRW63zxRDjmZnik2psm1mFQ05jHWL2srdHA6o0dMoRIWg/vWUDnwIL81
	 7blFfhRQzZ9RQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38b3ee785a5so7626711fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 06:09:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXe4Z0cidBMVtGLC/zyHD4MhSXeFvSfdE+rwyOR5CPkCVk642IyFlM5I3IeKDI9csDpw6jgbtqHTUxHUdh4PALr@lists.infradead.org
X-Gm-Message-State: AOJu0YwzPAgHwTaeh+b3COqYvWQ83njvhyv2yO+zzaycs7omn9PSuK3s
	iuqaB1oK7W1HlSocicFVD/k8OnYn/akSuLNHhorhxICGkTPpX2dBTiehJNSpwDe2RuErKtDBTOs
	tbl26QnW1MF2Nr1M/46Ojz6ohq9sn6Qc=
X-Received: by 2002:a05:651c:324f:b0:38a:d354:cb2a with SMTP id
 38308e7fff4ca-38be5f51b90mr10131901fa.18.1773925796044; Thu, 19 Mar 2026
 06:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com> <20260319105947.6237-12-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260319105947.6237-12-wsa+renesas@sang-engineering.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Mar 2026 21:09:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v67j91R7vsY2WOjgWQxyD-2Y8mRXe1go-F2jsL+9vbrBPQ@mail.gmail.com>
X-Gm-Features: AaiRm52DzwyqScnSD_1lE5a2W4uRQaDkIK3TFFUruN1gvKxXkVMyOzXMy0U3Fs4
Message-ID: <CAGb2v67j91R7vsY2WOjgWQxyD-2Y8mRXe1go-F2jsL+9vbrBPQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/15] hwspinlock: move entries from internal to public header
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Wilken Gottwalt <wilken.gottwalt@posteo.net>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_060958_232364_63FA3AA5 
X-CRM114-Status: GOOD (  12.15  )
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
> Providers need the ops-structure and the hwlock_to_id-function. Move
> these entries to the public header. With this change, all providers are
> also updated to use the public header only. The internal header is now
> used by the core only.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/hwspinlock/hwspinlock_core.c     |  8 +++++++
>  drivers/hwspinlock/hwspinlock_internal.h | 29 ------------------------
>  drivers/hwspinlock/omap_hwspinlock.c     |  2 --
>  drivers/hwspinlock/qcom_hwspinlock.c     |  2 --
>  drivers/hwspinlock/sprd_hwspinlock.c     |  2 --
>  drivers/hwspinlock/stm32_hwspinlock.c    |  2 --

>  drivers/hwspinlock/sun6i_hwspinlock.c    |  2 --

Acked-by: Chen-Yu Tsai <wens@kernel.org> # for sun6i

