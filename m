Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01F4CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htcXVBoJ+Oi571ojYkob1zz2/Li5ONJ1UWcvCyCVl6A=; b=li8BZfaNWBmETy7dqkXO+/VZ2J
	/f4uX3IwkQsrGlRM44XmDx9tNenm5Wc+1p8fq7UoEzFsdeueZSHdakub2W9U7kYnQKitZFBC50ZhS
	7qZUumflhuwobx96Ch2e5maYoLyKVNPnfJRExkR9XRDrwJjv70U3499QlPhqKHRTX8kuTqD40jjVJ
	fCrCupd/bn/OEhhs2DZPZbYwlXI0Mh1Z4QonZOWy9lABMdxpAPlpkG2SyXTjJhtBldVGQbWiS3mZT
	VXuNF2UblYEuTUSwgD2MsgU6G9wDWR+2dltIswOx/OEmNkei8epEP4YKxZPItOsv+EfnVc5kBBOhg
	x3CXVJcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhqr-000000031mI-0D9W;
	Fri, 16 Oct 2026 13:20:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhqq-000000031ln-0X1o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:20:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 913C443C84
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 13:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794A51F000D1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 13:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792156799;
	bh=htcXVBoJ+Oi571ojYkob1zz2/Li5ONJ1UWcvCyCVl6A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f8X54eF7RLyztOsQqmnAyN0IQARFaLQzxhmph37vBS3WwyzriRZ2CEx52VxcAvj03
	 LW6FfeSRUceVdXIObmpsfHsqNWAZV4KZc0L+lhkP675/kW3yXd3S2ahDCy/nCyPAkP
	 tRFBlnSHW1JzVhMZtgNHdAiXoTkrU0Gv1xlfxO2rX0A0XswOFN8Ucp4R4c/98xSa3o
	 iQg0S2PtniLobKz7f4Qc40FH37DYGpu+mcUpW2Mxpvdry/a6+/g+KBy2cVlTAs+Rug
	 0ma+7Nfg61VT3Q3p1ieKBGcJszYV+eMwPaAm6KVRdpjBPIsZTJpS0sXyWsogw+Xx6Z
	 QBkhkomp7ayiQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so5243035e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 06:19:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBWFK0QIz5ZMRHyQ8S2b1myMlEZZS8zEGMF+46WKqFOeOGkHTpc+2671AXBK0dfsZfxrpcemA9Wz1yNpiWqJDM@lists.infradead.org
X-Gm-Message-State: AFq9FYLITLFM9Vb2wGwGh9qUk5b9IghIy2YeT9dxQdCCJKKvTIGqi6ZI
	cqlEo3R3kKqrpousK0fu8EA4nkfgoEDTokdoFA7o5nmfNTZk+PNaT9tZs0svZ2toWn/j1WlQCZb
	aJ5rCgy/xkOyA6dFLaxtEsA8iVbH2mFY=
X-Received: by 2002:a05:6512:32d5:b0:5be:4792:82b4 with SMTP id
 2adb3069b0e04-5be47928585mr1064494e87.19.1792156798198; Fri, 16 Oct 2026
 06:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20261014160917.139241-2-junan76@163.com>
In-Reply-To: <20261014160917.139241-2-junan76@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 15:19:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLk9Rga0OuaKyojE2ViT9cBcmD_Ow-pMth-qJbTfHgcybA@mail.gmail.com>
X-Gm-Features: AclHuK_KFf_KBCaZwGWjeEf8eIfhE2fCyZ7XO76MOBzC6uLnM6o0vpqUkSR2sgw
Message-ID: <CAD++jLk9Rga0OuaKyojE2ViT9cBcmD_Ow-pMth-qJbTfHgcybA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: stm32: fix hwspinlock timeout and EXTI
 mux locking
To: Ju Nan <junan76@163.com>
Cc: antonio.borneo@foss.st.com, bigeasy@linutronix.de, 
	alexandre.torgue@foss.st.com, arnd@arndb.de, clrkwllms@kernel.org, 
	lee@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	mcoquelin.stm32@gmail.com, mfd@lists.linux.dev, rostedt@goodmis.org, 
	u.kleine-koenig@pengutronix.de
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

Hi Ju,

On Wed, Oct 14, 2026 at 6:10=E2=80=AFPM Ju Nan <junan76@163.com> wrote:

> This series fixes two problems around the hwspinlock-protected EXTI mux
> and pin configuration accesses in the STM32 pinctrl driver.

Patches applied for v7.4.

There are still complaints from Sashiko, but Sashiko always
complains so I'd say at this point we are close to the merge
window so it is better to follow up with separate fixes
if there are more issues.

As maintainer I kind of have to decide whether to wait for
the perfect patch or if perfect is the enemy of good and
just merge the patch so the baseline looks better, so I
decided for the latter here.

Yours,
Linus Walleij

