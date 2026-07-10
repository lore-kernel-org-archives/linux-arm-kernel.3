Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4DCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 18:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouBlTpHGnmyUfrXsmo1Bq7O40Y624bpYwfRwC5r1Lzc=; b=bZwyO77xxxs0/YqPq5q9qmtoaz
	Jth1BjNJISiESDU0C2lCWkN99+rW/FlMti075tMLPQ0GNRh7uI0NxQnkiHBR4kmGO1ReN6guwgUbd
	vT0nt8PPr3vCydxTvHfIhtqA/n08k5EwjLL1EaitX05ux8ARyseXFTV5FHPjh+FlClFE8gMEHt2/Q
	hfs0w5+vCEowym+ToCdiNWd0VLvXG6qLD6MlyRVE6hoXVI8zL8V2HppJ9LjPnRm2G/nfmzL4uaWc6
	UC32mgkRu8fSGifEoFHwtbq5TxRWzArZWeG8ZELwbfGk1XsfeQCj5r2CA/DPCuScOwBcHnJ0EmHlI
	hPzS/L5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGMi-00000005YVu-0CGc;
	Fri, 10 Jul 2026 18:54:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGMh-00000005YVl-1Z0w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 18:54:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1054943D50
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90E01F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783709661;
	bh=ouBlTpHGnmyUfrXsmo1Bq7O40Y624bpYwfRwC5r1Lzc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=njlNg6ftu1pr5TlPVDwX5iYcyzqbkWZjhazrr5pZxCuSLX4SS4vRCyPH/3Krq/JKR
	 2qVVUZWPTgLmxYxYxlKOZefx8K3az8Cm991C6PSaghBVPz4x3qjpZJji1f84w19KTv
	 N+EIVk5FrLC8rA/qN4i6WKFcWmFGbqUxEgMMxQE6qhUzsS162mRMAMSc1aGkFD8Pjo
	 wBprcfpqR37kWJJKptREZel4YnXs1YnkL4jmUS4kc58cjcJpj17sjp5kiL95SipdiW
	 iPhR1kKFCgJFwx6T5YrAVxMJgUuJFObpzapqamBWiZ1BnxkagBQ0cTALJo3Q45YioC
	 0GBdXgSJ4SxCg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c953950dfso9415261fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 11:54:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp+5Ag20eLU2UzhrbOvMFJdstroPzYkBkm3bALhsgDyaYURSYQNLR5UzbBmeE7iWALO6kVii/Y112onvc/mvO2V@lists.infradead.org
X-Gm-Message-State: AOJu0YzHjpjDafVWDQuOpYGW3pm4rNX+BLpjwXpsCD5i/5uybxMc7kgs
	/qnWN1m/fwicrxh3W3Xd57RuiXmLL1aZ/C7eFi0ojsGeXPLzlX/gMKYJ56PH3Z9qW/dm4inx+UL
	kPMLBgOUZuGp6O8luj2PYeSxWNLNROQE=
X-Received: by 2002:a05:6512:33d1:b0:5ae:bd53:70f8 with SMTP id
 2adb3069b0e04-5b0236a3403mr65056e87.47.1783709660727; Fri, 10 Jul 2026
 11:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706101823.341230-4-krzysztof.kozlowski@oss.qualcomm.com> <CAD++jLkQPHfq=_D_TPMbmmA4JFwbhhtTC+3Dj+uD2P6LFNtfUg@mail.gmail.com>
In-Reply-To: <CAD++jLkQPHfq=_D_TPMbmmA4JFwbhhtTC+3Dj+uD2P6LFNtfUg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 20:54:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLmk7c-836VWFkZTKtgFgvR-4uizQShiUuyQ7jL-iAJP_w@mail.gmail.com>
X-Gm-Features: AUfX_mx-aW0xSlv_lXB_IgSnV0_rVkl-4iwi5PwHYhMokOtVpZa9KEbz-fl7ZxA
Message-ID: <CAD++jLmk7c-836VWFkZTKtgFgvR-4uizQShiUuyQ7jL-iAJP_w@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: st: ste: Correct indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Jul 10, 2026 at 8:53=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
> On Mon, Jul 6, 2026 at 12:18=E2=80=AFPM Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> > Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> > No functional impact (same DTB).
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.co=
m>
>
> This patch 2/2 applied to my ux500 tree, thanks!

Oh nevermind they are already in the SoC tree, even better.

Yours,
Linus Walleij

