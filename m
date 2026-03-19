Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DFD1090220
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 13:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpXIrq56d91FcsaDhJ+B/5m13NVNcOANCYUupQldphQ=; b=pOd45GV7F4bAME
	LjXZZhXKFqNTjVKakET/Y+svcF9TP5HfVgXdFvDNcrk5aXnKlanfto9CUlc9slJiQyrrkFuhckE8G
	jpP+nPKVZ3XtRIUk5Uo6IiuPzbLMIfT5b2wJS0OozXXzXgV5LnqebznidnS0i7bFqDWpZ4h5JcZoG
	Js6GqhtJCWpACDQAKb5Fejj+uZCycmS2nPJbTY8yjkzuI+Cdzx4O/Z4kRK/4rdVEJqzs/GSvRZyMi
	kVMbYEf0tcFAEAJZFa/+UDOFGrp+tygo83zQdFoKcMW5uvEO8yiwWn7aHzBzSrMOtHTprVkMYSJCZ
	W0MIyNMLMNFzwsOpTcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3D90-0000000AfGI-16bM;
	Thu, 19 Mar 2026 13:10:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3D8y-0000000AfFK-1Lxr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 13:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FA26418A0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43ACC19424
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773925831;
	bh=/z6FEu0IUK6nCL3Uiqn1iq1VRQstHdDNDk6ymaE5UrI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=ohXffSiKjHFGIljP5m647FzaA2YI5VHFQ18WexKRG35OLGSs9+V3F52Y4agLl+7wh
	 zCeCJ8VVuKYky81nqE5qzJ9nyGjlkhrU9G2c9E5rQaMTnF7Pq/EAgi5LLxZJVJFOd5
	 YT32UITkBBjAsS3ZNpg+f+myNQkv7/kggpQlbzPanL34NoLMHmxWFRM23zoUPeNHcF
	 io53upotFMSYspBlvYzIuRjWM/eO0Und68n8zlAQz1CvO2r0yg6ITeokF66bKLitjN
	 KjB/XQLfjTVpipHcIn7Bx/A5jolS5ZNEySjipgzH87fs4Nc9/dWA+CVDsnWf1GP6nh
	 2SRcbXLccZ6Lw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a12cd0bd79so912579e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 06:10:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpLjVIDfg5PjCrH8eIBDISWkplNp1Qqf0WVhTF1YJUo+xdZ04lbLC5+bSXYDyVP3BFiiC6h2nnb9HXH/e7zgaw@lists.infradead.org
X-Gm-Message-State: AOJu0YzzTdqkiuSWx+xwdvZ5vXW6ifdw0apJBXF1btH9gwqqR9byWSBV
	MSlDuo1cVi3/X70jvNberv0ovDKyYzMfNaOmkc3D5PQ0kfkt5t7jm2vceDoG1kIyb8qeTwe98H4
	pLxOePqLfTMkcQuxttRF6p3eOjbZuilI=
X-Received: by 2002:ac2:4303:0:b0:5a1:49a0:af35 with SMTP id
 2adb3069b0e04-5a27958560emr2184109e87.10.1773925830317; Thu, 19 Mar 2026
 06:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com> <20260319105947.6237-15-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260319105947.6237-15-wsa+renesas@sang-engineering.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Mar 2026 21:10:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v668mhN7XnjbA5Zg4ExRXLVqn8d9kDjap4wVNEEL780p7g@mail.gmail.com>
X-Gm-Features: AaiRm53ZA49QZnlP2rMulPZJ-bDSE_dydGwTankSFX-RnHDx5Riad08-AOxumlo
Message-ID: <CAGb2v668mhN7XnjbA5Zg4ExRXLVqn8d9kDjap4wVNEEL780p7g@mail.gmail.com>
Subject: Re: [PATCH v5 14/15] hwspinlock: refactor provider.h from public header
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
X-CRM114-CacheID: sfid-20260319_061032_378241_16863608 
X-CRM114-Status: GOOD (  10.22  )
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
> Factor out the entries only needed for providers from the generic public
> header. This allows for a clean separation between providers and
> consumers. All providers are in the hwspinlock subsystem currently and
> are trivially converted here as well.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  MAINTAINERS                           |  1 +
>  drivers/hwspinlock/hwspinlock_core.c  |  1 +
>  drivers/hwspinlock/omap_hwspinlock.c  |  2 +-
>  drivers/hwspinlock/qcom_hwspinlock.c  |  2 +-
>  drivers/hwspinlock/sprd_hwspinlock.c  |  2 +-
>  drivers/hwspinlock/stm32_hwspinlock.c |  2 +-

>  drivers/hwspinlock/sun6i_hwspinlock.c |  2 +-

Acked-by: Chen-Yu Tsai <wens@kernel.org> # for sun6i

