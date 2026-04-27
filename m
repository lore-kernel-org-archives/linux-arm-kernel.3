Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B153FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 20:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MML6xm081n5Pak13fUwHMOoZLCSpJ1pdm1tH+RKwCKo=; b=1cNM4BYPoFGK/MohZjdXQJhws6
	68S5dFOkefYI336I1kSQOfidLmzWjzY8WjjnV9V4Enq7VhSDm+bzfIWkbGKYB7+h65CIEMDrwP8Bv
	Mqa366ftoCmhjI0k1w5rF+v8tWDQE5as5H5mPPl3cfNtTg7JdwOsPo1rBkE/AUdoa2V0G1hFDlgtd
	xUIeewzBVS2gmL4qsxFZZldv4cCHRTUPOuA+Xfgacb7qWY1X54Zt6jmZci9i/jVSEosP3262/w4ga
	5IDNoK/cKqB0cIiZpEyPT6XiNx4JnMt9ZsL/j4uTqY3qo3hkPgzu3m5i9Q4tjRTOGoEn9oTIoxZnd
	UfGXjjpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSOR-000000006wl-1cnY;
	Mon, 27 Apr 2026 20:17:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSOP-000000006wO-0kwf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 20:17:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E5BF43EEE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 20:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE08C2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 20:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777321040;
	bh=MML6xm081n5Pak13fUwHMOoZLCSpJ1pdm1tH+RKwCKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AFceGBooApUQ5vEYu3SKP0vMDyNtOrH6ADFSO8f23GVGxXa9VeS6udVvyeP/MmMJf
	 ToKjINBm8z+rA2W6yp/kvFSZ2J4aHwTVQNU841+uxVU88OqxiKGjkibsaVd8D+f90M
	 lITKeKWvceubXXHOSZ1iQ5B9KEl3DNYAqGm+Et8lIvj3h/7KFRScRTtuivZnz9mCnx
	 ADjOmojxZ4mUllM6WXf7/YaWytPQRwYDty7x2gieV1v51Gl8PMfnoKsyZQ5XUHRgtX
	 Zyi101epWXi3645DgAkU1MvmT91NSj0/eIQCOHVt1g0JiaYnp/K1ZDgwPx7i05sWcO
	 Eo7/fp1Cx/FcQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a62f43b76aso5067334e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 13:17:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+oWafJl0d5FTUDpRxhH1rQSMNPTmZD1rC0d+6CgzR+PdspswBVxv33tV+t3MGm8L2gjySsL8QJu6fn1KqV3BeY@lists.infradead.org
X-Gm-Message-State: AOJu0YyYdszhPtC5vTSTY3OPiBeBu3BUgqnJ2GQGFY6ozO/6++C51oAv
	cmcpTimRJtcLwNhty3aNzfBUUIemVhW50UB2uFe9+u8d2y8NeJDalAYfTwBvqSII5/H03uOO4t0
	96CLfuYGFjfZcRWOCAeFI/zLQAih1wPY=
X-Received: by 2002:a05:6512:401e:b0:5a2:9d02:9498 with SMTP id
 2adb3069b0e04-5a746407e15mr100233e87.7.1777321038631; Mon, 27 Apr 2026
 13:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com> <20260427-pxa-gpio-swnodes-v2-1-86fc24b9e714@oss.qualcomm.com>
In-Reply-To: <20260427-pxa-gpio-swnodes-v2-1-86fc24b9e714@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 22:17:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLkSrxqkwcNy+xfLQJZtVt-H3Oc9Nwijso+-Rh_PzeBL=Q@mail.gmail.com>
X-Gm-Features: AVHnY4JdYGMAvUN92AUjthb9aLHpzD4JkMhQlxldYhbXXjPiDFufTwMvhXYdFrk
Message-ID: <CAD++jLkSrxqkwcNy+xfLQJZtVt-H3Oc9Nwijso+-Rh_PzeBL=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ARM: pxa: statify platform device definitions in
 spitz board file
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@kernel.org>, brgl@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_131721_268267_20322304 
X-CRM114-Status: GOOD (  11.04  )
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

On Mon, Apr 27, 2026 at 12:14=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> The scoop devices are not used outside of this board file so make them
> static.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

