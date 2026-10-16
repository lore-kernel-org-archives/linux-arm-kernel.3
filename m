Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A7ACCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOXYAK3P34oXRs56UKPcrMmNb5YVhQRzHiwMXJEYU1M=; b=ttsqjG9seXb9TVpdVgTYHdeUk4
	tMgyK24wpNy3zTYTr5duMqE7uv/x0cVnCYAJPPWLXgAGqHTOFb9si7RES2gS+cHBjJclygvvCWEpm
	Cvl2u8CsBqUUcxd/WKYy/N/wpX48vliHqjJvs4O8gtgxQr8jXFQr/VWFTVoj4hriTlT+Pw83v+rfK
	pT3DwhmLi184u7+7gnWiLdCngNE56ZjcYAcJxFseAUZnEjZaTDOzeSlwucs1KMXJ4qf7SD6wV1+zC
	xzAHqFkLy09pXgau4U0DWi2kkQXg3ZVIL/JAjelxG/UrRaTTWRV6ebdxD2Yx221f83q/H8CuDJwcp
	beUys1yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdn7-00000002PgU-27DJ;
	Fri, 16 Oct 2026 08:59:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdn7-00000002PgO-0pqA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:59:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B6D5A418FA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 08:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4951F000C6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 08:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792141192;
	bh=kOXYAK3P34oXRs56UKPcrMmNb5YVhQRzHiwMXJEYU1M=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=iO2sM+jbvui+551BfDOVupfnxeFlGkU3/BVv0ukDDrWHPOoEN0d/1aLdOJfG9wb2g
	 joFwTrRUplfWAXkuTUxhNN3+vjaUnyTySRrbsznWFdoqIHgocEPxn3pVT3Xz+fsjje
	 lge9ZUe+2fEHQ2o7W2l9GRr7C+bmWwgh/MJ9xy5/TAFK1vKzDsg39dRZxzbYAkAhqd
	 +0YlhFNZsIv9pSjbcfkMq7vUVJXCRMKaEodx33ci7q0KK0iXgv6q2nU1e3x15mNkAc
	 IWpvmba/JvT1kZtTyGbZsE8rNkmiUJ3fzCzBYTRLiEUMJHOGmc359Z/+K/6J7+idXZ
	 Z9PaBLzlZZ4pA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a75f960be3so33605181fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 01:59:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvuWd+ONL/Ydxwa8Lk8B60+7F4pgontjp0BmhdUzhKIAzh8SlkC9r1Rd2U6R0wPAWqAgeynaIu4+55PfyFzUJz@lists.infradead.org
X-Gm-Message-State: AFq9FYKZ7c0bxbHhcYXbgoi5tiL+RjlTXlCLVoVOwN02++qcKHY1g1FS
	gs+4NxgjxPpxst5nV87u93nC2z6dlJYr0BOc93hMN+O5i7tQ1fHpBnkkVm+SNsMixyJtj/9xUdK
	QBcXjsybRT10u8VZKOKiJi0M+naqlYGlttO31tOXiig==
X-Received: by 2002:a05:651c:19a4:b0:3a9:c1de:852a with SMTP id
 38308e7fff4ca-3a9c4ebaaa7mr54566611fa.3.1792141191356; Fri, 16 Oct 2026
 01:59:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Oct 2026 03:59:49 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Oct 2026 03:59:49 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261015171557.21243-1-jayarajdmit@gmail.com>
MIME-Version: 1.0
References: <20261014204331.15383-1-jayarajdmit@gmail.com> <20261015171557.21243-1-jayarajdmit@gmail.com>
Date: Fri, 16 Oct 2026 03:59:49 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdzQCzqtY3OOnMjYsKh2LXJw9aQ_EsvkFwvkeZODa7Q3w@mail.gmail.com>
X-Gm-Features: AclHuK-Epf01-bEUjh-NNjcbEZntePVtFa9eua4Tkj9glPl3OYTYWhiQnbnZdm4
Message-ID: <CAMRc=MdzQCzqtY3OOnMjYsKh2LXJw9aQ_EsvkFwvkeZODa7Q3w@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: lpc32xx: check devm_gpiochip_add_data() return value
To: Jayaraj Devaraj <jayarajdmit@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 15 Oct 2026 19:15:57 +0200, Jayaraj Devaraj
<jayarajdmit@gmail.com> said:
> lpc32xx_gpio_probe() registers each gpio chip with
> devm_gpiochip_add_data() but ignores the return value. If registering
> a chip fails, probe still returns 0, so the driver binds with a chip
> missing and no error is reported.
>
> Check the return value, print an error naming the failing chip and
> return the error code. Chips registered earlier in the loop are devm
> managed and are removed automatically on failure.
>
> Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> ---

Please don't send new versions of patches in response to existing threads. They
must be new threads. Please consider using b4 for managing patches[1].

Please resend it as a new thread.

Bartosz

[1] https://b4.docs.kernel.org/en/latest/

