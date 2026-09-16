Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AB7C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 17:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/Mr8F+V9ZuhdE2vrQspzPF3L2NjVoWL5YbjTnlZDrw=; b=re4yELMSZtGb5sH10nM/wTL0HK
	q4ZXgb7VOjb5P8ExQjzqJOFs/79xyPLArlSi7+CIjomYmGpNkjBfRva3J6cvnqr+apYn0afMSOTzc
	yPSUv7fGwLkvtbV/6zeXDnBakzBxoJCOWUmRFNs4zFq58ss+lO914UqR6KFSt6sUzAO549U3LqTn2
	Zsdec2Jlms6yRhzxodrlPmrl25Qou//epxV0suzKJ73FT6788ylEU6HBS7nUZA7y4KXi7zPLxreWL
	/TPOnRIRl3+xVNfbEmURONHnkmx4Psbj2TLQi+yY7hoSlK/djSl3kpBKYYDAKNkH+fQZymuYBi03k
	SQnSqvVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tCz-00000009qVQ-2rZB;
	Wed, 16 Sep 2026 17:14:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tCz-00000009qVA-0HsO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 17:14:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57957600CB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9C31F00893
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789578848;
	bh=2/Mr8F+V9ZuhdE2vrQspzPF3L2NjVoWL5YbjTnlZDrw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jAGQ0wqbabPy+2R1bFiL65llzbNoTBgxvGo3XboduhMtCRgoYkAwFzLDDWfAwJxg4
	 ELf7wKcxt5BprDCSMgBAXnYHKz+aIvpCssXG+7H0V4lOrUmkm5f8aMXIeHuSjst8jl
	 U6I9k8hgEkAQfqdx/e2pACCRC2c/QczVg8t4xxXj7McueDzRh9FIe+u/DVDqboYTP4
	 ETgIWdm+rZa3DLc3sZztatMbNLOLDhSQnCSLbIk3EtjsoVyEJK6aWdQhKmeEa/y3GM
	 UwseA+9Izt56Ap8jmFcTV5g2/fGRQGdAaNiE0r56j2nU7KaaxaJD+Oo9HbDrly1pCc
	 h1ZMexRWy0wrA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b79784a6edso1367446e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 10:14:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw7QVhNOPjyiAVc3KSOWNdHh5LgmxXuJM6d526QHIGsDIn2kmhE79ADyUtIl1mMdHxeNJ+0sj9QFkf1Q1j3ZGxI@lists.infradead.org
X-Gm-Message-State: AFuF++k0Rb5U6mwbCUZeXCh3GO1JribhElgncAV3Tq3i3A5r8rfg8/Kk
	flGfdXVTWhiq4A5tuwlGiaXcXTihQ2QYNIe+2N59PnjSu0ubOVJdV+GR2iPZtLHvm7gk70GXxwg
	EndVNYv/YeENTt0EEdsDLUe8Y4udjUaU=
X-Received: by 2002:a05:6512:2243:b0:5b0:15b1:3d5d with SMTP id
 2adb3069b0e04-5b8b661e656mr953214e87.22.1789578846782; Wed, 16 Sep 2026
 10:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260911060917.94310-1-bolin.liu@seu.edu.cn>
In-Reply-To: <20260911060917.94310-1-bolin.liu@seu.edu.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:13:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLmeV5SejT1tEag91RO7jXw9eNtjA27shRihzkA3p3koXw@mail.gmail.com>
X-Gm-Features: AcwNN1VxNG3Resscifgf35MwxVxQqvlhAvkaWR5zg4ETLhuuFq_xzCAqsFoowII
Message-ID: <CAD++jLmeV5SejT1tEag91RO7jXw9eNtjA27shRihzkA3p3koXw@mail.gmail.com>
Subject: Re: [PATCH RFC] clocksource: dbx500-prcmu: check timer register mapping
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: daniel.lezcano@kernel.org, tglx@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Fri, Sep 11, 2026 at 8:09=E2=80=AFAM Slavin Liu <bolin.liu@seu.edu.cn> w=
rote:

> Return -ENOMEM if of_iomap() fails, before reading or configuring
> the timer register block.
>
> Detected by static analysis and reviewed with AI-assisted source auditing=
.
>
> Fixes: 9d2aa8c7961a ("ARM/clocksource: use automatic DT probing for ux500=
 PRCMU")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

