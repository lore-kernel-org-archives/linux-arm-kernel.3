Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B8EC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 22:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIFsmUdz10F99DC44yiISatbO4LMo/BgryDqrJj4LQc=; b=4nEPgtKjP5Ro92m9uaf18fLA+y
	bHKsE0HtQrBEn2ERGmHCqttXEw7aiydQKOfDxKp0MMXLkBYn7EsEgqS7k1pi2yG1wMCDX7WQvZ40I
	kKWnBTKVtQc/s53euuYTxGw9448sY7L71+jlVGZfCaC39OpSLa+TdTmLYjInHnMfIAsfammXaj6Rr
	QnaCZx3rmprlGjTgJekQCu8RxKAtBo4sJdpJ82qNcEM7BqKbPcWX6Ufq66HqSuRN5a8aKL5hM/Qtz
	SyDZsdI9goD2hbzF8v7eYCyYOXIwnUr5dFEvfWNRucneSqi0kymThFsZBIpmSEmUZj7gDzo4rMbmx
	Q1xVdcIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cjj-00000003R5U-4A0f;
	Fri, 04 Sep 2026 22:50:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cjh-00000003R5O-2QF2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 22:50:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4778841AE3
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 22:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA6B1F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 22:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788562217;
	bh=QIFsmUdz10F99DC44yiISatbO4LMo/BgryDqrJj4LQc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZrkOCCFIPkJL9lRqu7wbEsfcPgr9szRWtdXJVkCNjTDTC3gCEaGGvqNWcWiIN5oVP
	 WkvLrxRbHRl2NFOHrSb1uDPh/G5BAXF26rAEpslXDNDNs17rJGoKZYf53snypsTfXa
	 3+9+RRdYIUV+Ep6y7boSBZuXbssLmpQ3Yur7UKnO/Cjn2aLTwxzM12XbjRvfZqHTOR
	 /r1sjiSe9zJemV3JBlBDYAltBllyHOM7W8DczGHLMvUSIETWxG2uwWi5OR5eWnkzYJ
	 7icOCJlpibszmxCkAaAtP6RXpQp6roY0UZVBOCggQy9Kz72ETCGTxb3BskfCkx5ImH
	 4C3mI+SQih3hg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso1335241e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 15:50:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzkZATI3vNKB4WqSBhZHN3n0DZX7j5MXFC+jkvwczJF4Fu8HoqBVL2zV5+SgtkKJZ8loY6FEb+VuXoQf4V/Dq2t@lists.infradead.org
X-Gm-Message-State: AFuF++lWAYugKQmC2IiHASpk/aCv26fbgPNfk1ESs83Ea2JBk1xsUqY+
	uoburdSPKZxaYeuZiDEUn574fJ14AkuXQMlRH4S8dJhf/eczo54fRTVUS2UEA5yhILOKvjd+dyR
	XjEGLICUeKzbXR09Ylof0apyz3/geKtM=
X-Received: by 2002:a05:6512:3984:b0:5b6:1a7c:aa0a with SMTP id
 2adb3069b0e04-5b61a7cac43mr1040185e87.34.1788562215915; Fri, 04 Sep 2026
 15:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260904123207.36203-1-hemanth.selam@gmail.com>
In-Reply-To: <20260904123207.36203-1-hemanth.selam@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:50:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLka3QsnvoRDLB0mmAzMJFb-+yWqetSLxFmzpxf3i_1HHw@mail.gmail.com>
X-Gm-Features: AcwNN1W3m1-Lc4lxvPZ_ch92KoW1rz9j_7ac1OxU__eb1riTgKOJXNVRrEUuwvU
Message-ID: <CAD++jLka3QsnvoRDLB0mmAzMJFb-+yWqetSLxFmzpxf3i_1HHw@mail.gmail.com>
Subject: Re: [PATCH] mfd: fix typo "interupts" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev
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

On Fri, Sep 4, 2026 at 2:32=E2=80=AFPM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:

> Correct "interupts" to "interrupts", reported by scripts/checkpatch.pl
> using the misspelling list in scripts/spelling.txt.  Only touches comment=
s,
> no code changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

