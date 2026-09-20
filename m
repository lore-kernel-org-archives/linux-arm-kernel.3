Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D9CC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 22:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcpS2C5b2gU7B0ckmofHcYCfd23MRKzruBLpc8zPt4g=; b=uGvlh4MhQJzeWXjfI/sXQO4nzf
	39RcWzgQQ2+ynFD1ef1XXRqTpS0YZkCO47jmzI7bCWiUfWCBt5VHOVYVXj6FCAYieKKTCkfXsg7kX
	bEZzaA1w6w55WgevdNLKvCtIARN1TT6mOMGo+Irg+2agMXU/KK3cMCU8wqcArucaRMnRFAAJXc2QK
	/X8kRlPZ3gI/wTDkHOie2kkTMSlqsXAZI8P/No6ZZrxahX7at2qsX7rTejtfUHSkZ2R3rFlxD/vmn
	unZ0xdJy4IKTxKc67IT4bhIVt77vGTRenQe2HDJx2lI++jzONZjWiPERvbqYcN40Jp3cwlCEzoeNB
	JOC4VDgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Pwv-00000000Via-0kPX;
	Sun, 20 Sep 2026 22:23:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Pwt-00000000ViU-34fW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 22:23:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 17EB144795
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 22:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A5C1F0089A
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 22:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789943030;
	bh=XcpS2C5b2gU7B0ckmofHcYCfd23MRKzruBLpc8zPt4g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jUzB1v3ju2gDsG4RCi219Fw+ggbv3vozCq7XFlY4FfIB4lO1HvzH6kLVZOIrJ58Ui
	 aXFZMbVFbCuXt9iTZowfHhsE13QMJ2kLwna2vZIDvMH8SladHk1cFsQqDfJ8VZbMLw
	 MKVn17XruoxrYdYGf+o3MKTjVNMliRCZ1/3/6iaKFxcXUNsv+ezKCECnNqypuZXBa1
	 Gj1D0yGOKZ60uU8bPKhHiSld8jIxnqLgoL3gnlDm3I1P2LQ1LvitRbKuihVJPqFs4R
	 0NVu0hDG16s1iS/cMnNmsvnhx4WYVa/lvRwNGBlWWx4Ca2Di16YLAeRBGcjiaQb221
	 rN1RrqyX/EIDQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8b402f4e3so2450859e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 15:23:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByORAAlaetaZAhUwcLGpR+FwL9SPxykQZuikROQPFRrnIrmEkiFpmVUl/GKFbcWLVO+fdGmOqjhCISpGASaoct9@lists.infradead.org
X-Gm-Message-State: AFuF++kf0IU31QKeY0WAKjy+rbV0CYhEFxutRh8gFTBJ5h+j8JZC8VV/
	Eh2HgidRaS5QlLB7tzOQkmUVdxXaI734NqZOpW8Z4iFTk7o84iuXsR9hxgPzCcvOx7lzIZVaOvc
	j/DO3UdOGC59WnLgu/hYYEXN7JDjr/qc=
X-Received: by 2002:a05:6512:1293:b0:5b8:9ee1:10fd with SMTP id
 2adb3069b0e04-5b8c195b2a3mr2596776e87.32.1789943029592; Sun, 20 Sep 2026
 15:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <sa6bj9x31zk.fsf@dev-ag>
In-Reply-To: <sa6bj9x31zk.fsf@dev-ag>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:23:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLnh9UwMd_opPfhWrkOssDUJQkqmADa9Re_hqnGqHdnKrQ@mail.gmail.com>
X-Gm-Features: AcwNN1WxZQUUkn6BXksV0q35G5hTDHGJ7iW3Og4fCiJ7c6yi5T8Bf6oe0W8b92g
Message-ID: <CAD++jLnh9UwMd_opPfhWrkOssDUJQkqmADa9Re_hqnGqHdnKrQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: fix PINCTRL_SPPCTL=m
To: ag@ffroot.co.za
Cc: linux@armlinux.org.uk, dvorkin@tibbo.com, wellslutw@gmail.com, 
	arnd@arndb.de, afd@ti.com, aaro.koskinen@iki.fi, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Julian Braha <julianbraha@gmail.com>
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

On Wed, Sep 16, 2026 at 12:49=E2=80=AFPM Andrew Gaylard <ag@ffroot.co.za> w=
rote:

> The PINCTRL_SPPCTL option is defined as a tristate in Kconfig, and the
> help text suggests that the user can build it as a module by setting to
> 'm'.
>
> However, it cannot currently be set to 'm', because SOC_SP7021, the only
> platform that supports it, is a bool option that uses 'select' on it.
> Also, the SP7021 requires this driver to be built in, in order to boot.
>
> Change the tristate to bool and fix the help text.
>
> Tested on linux-next-2026-09-14 on a LTPP3G2 board.
>
> This impossible tristate was detected by kconfirm, a static analysis tool
> for Kconfig, by Julian Braha <julianbraha@gmail.com>.
>
> Fixes: aa74c44be19c ("pinctrl: Add driver for Sunplus SP7021")
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>

I applied this patch as a nonurgent fix.

Yours,
Linus Walleij

