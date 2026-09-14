Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF09DC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bikajq6gPXx+5/b1yY5tPaGoZUSaoR9JVl/gex3jVF0=; b=ByBrC2NDf0LboPvQSu47RJrmY0
	/UEcXFZhc4AgueCz9Fa+447CFQFg10HsSBxDZ2Y8GrOfcUiQub0xr46xOiLwL2oPNu+OpFVNL3l5R
	CwLa/7f60OI0wne9kVlt+BXZO06LKBe0nkrZc/JH7Sa3WZXEDGGjDcQXsTM8NOsjKPoKX3zLRqh+e
	gYWniv3oN+A9v9KgzJjFNK7e4n1302DnVuiCUighPUzr4mrb9cAuHiSbkCJy+7AS9trPJ38Buv5Z7
	QSVe5d5n6lzwhsLvSCTXwngb8Xg7ebYJ4xUZ9Dx7zktwi6XyJ4SS6OwS8huHikDvAkrW6Sl1YSGE5
	bmRpgODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Ct-00000002lo7-20yQ;
	Mon, 14 Sep 2026 08:38:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Cr-00000002lnR-1HoE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:38:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F8A6601F0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097461F00898
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789375108;
	bh=bikajq6gPXx+5/b1yY5tPaGoZUSaoR9JVl/gex3jVF0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gG0JwTs5WXFNYujRACYdkpD8Yu4KLEpIm9Oo8vxUg1g2lKhthj1SUWh5LxP8LOd8j
	 s3IdBRCkiXG6oIB0xNjcPWCqv/l/6+D2BsIaE85D30ponbnqhvovkmiEGh9aEBHUgb
	 9GzFk8rnYx1zg6B2FB1sEtjr357if1NpCsPkEioCUj9N7vwy2spT4jZ2bmDrHIxfr9
	 O6eMU6q0h6SsdSzRd0qGmuRo956aFbT1NCXid4CbrjNV0tE2S+bfJ8S+dMMxAu+WYI
	 QiQ2wc/33TNV1S5Rvg/WGeue6m2Ln2rfyrsJe/Q9/vMS0WU/74xzFpITJp/s6NtG3n
	 tSThAWGBNUAmQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d76so1955691e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 01:38:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx3LnKR7XML2s9HGipFweI5WGYMLdF7ydRXO+UHGRTxNeIuFSwwkiVADkeHzDy+x96tYj7sKfnvmN+q+S8cYb8/@lists.infradead.org
X-Gm-Message-State: AFuF++lh8gp4xme6wihz0aEcK3K9i8aaZz9JE3jYc+SlWtQF2eVISXFc
	qFmz6iHx2E2MqLJDQ5asZ/zgqUUzWqh2IWWLs5SygyDuZoaukXcNJy3JCcjrZcfI1t7n9dVxNT/
	319w4psjNz3f/4M4THokkmVbzXi0q5CM=
X-Received: by 2002:a05:6512:31c3:b0:5b6:1a7c:26 with SMTP id
 2adb3069b0e04-5b8ae69c303mr379645e87.41.1789375106756; Mon, 14 Sep 2026
 01:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260827021054.0963C1F000E9@smtp.kernel.org> <B61B30904C7ACEEF+20260827080320.3351155-1-liudalin@kylinsec.com.cn>
In-Reply-To: <B61B30904C7ACEEF+20260827080320.3351155-1-liudalin@kylinsec.com.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 10:38:12 +0200
X-Gmail-Original-Message-ID: <CAD++jL=s_dyCyaPCHhQttukZ7m8hFMpCGm5hATrHUBirEG+RxQ@mail.gmail.com>
X-Gm-Features: AcwNN1XRCpHWiCNsju-U4qdFirQ62HAIRpU4gSyI_23OghB7AclZ3HrLyZLO5w4
Message-ID: <CAD++jL=s_dyCyaPCHhQttukZ7m8hFMpCGm5hATrHUBirEG+RxQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] rtc: ftrtc010: fix resource management and integer overflow
To: Liu Dalin <liudalin@kylinsec.com.cn>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Deng Yingchao <dengyingchao@kylinsec.com.cn>, Qin Yungao <qinyungao@kylinsec.com.cn>, 
	Luo Qiu <luoqiu@kylinsec.com.cn>
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

On Thu, Aug 27, 2026 at 10:03=E2=80=AFAM Liu Dalin <liudalin@kylinsec.com.c=
n> wrote:

> This series fixes three issues in the Faraday FTRTC010 RTC driver
> found by Sashiko AI static analysis:
>
> Patch 1: Fixes a clock resource leak when devm_rtc_register_device()
> fails in ftrtc010_rtc_probe().
>
> Patch 2: Replaces manual clock management with devm APIs to fix a
> use-after-disable vulnerability in ftrtc010_rtc_remove(). The RTC
> device is registered via devm_rtc_register_device() but clocks are
> manually disabled in .remove() before devres cleanup, creating a
> window where MMIO reads on clock-gated hardware can cause a
> synchronous external abort.
>
> Patch 3: Fixes integer overflow in ftrtc010_rtc_read_time() and
> ftrtc010_rtc_set_time() where u32 arithmetic wraps for dates
> beyond year 2106.
>
> All three patches are based on v7.2-rc2 and have been verified
> with checkpatch.pl --strict.

All patches:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Maybe they need rebasing on v7.3-rc1 or maybe they will just
apply cleanly (I think so).

Yours,
Linus Walleij

