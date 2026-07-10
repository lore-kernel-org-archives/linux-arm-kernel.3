Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13372C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 18:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mS485fOgIvhcuepZ3Oku5/wDYi5YVAtYod06IGUO/W8=; b=qyhYiUy6z/OEoCjv0uTNv5QQ+6
	5M7j7I1NyMtDvDogbrsanSCRDj/QpcsBDD8B9IsurNJrOCSgxhrjtNqXVulKIycG8v3RePDfbEziL
	vcLV3WwdXuQ+yAupNe8U91pz/6x7bCs7Hs1bL57kqHzzkob0qBxRXVs/TpvysyNaoZvlrzRO5c/0R
	vD0G19y8d/5QlIIglDzAT3apVlm/K1qkoSxIMMe2rpanrBRg8zo+SvUlsCwHi8Fn0GcLn3Tbv1s4u
	PjtM0vli3HJhdygi8CWd02G3M8KCrc+bh41J1t+jFWpXbiJYWearM74OKCgNcc1utC/I1hNtEgGGV
	/2UnWbnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGLp-00000005YPx-3omn;
	Fri, 10 Jul 2026 18:53:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGLp-00000005YPp-2FHm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 18:53:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B7D7F60051
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712241F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783709608;
	bh=mS485fOgIvhcuepZ3Oku5/wDYi5YVAtYod06IGUO/W8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nC1gZkZGUu1c+ijRrCKUlcDODg0wDdbTfE/l8HAx67EYodxhv5NUpCETx43W1TTkU
	 6bDmYUu3pjoHfW8d2SifUOq7ef+JQ2k7es4ev27hYVTTZKTUID62MenQ2qHU9p6Q/I
	 zshxisfohZVOFnwJOtkapzZXGeHFRn0EW8McOD4z/5N0bWb83eNFd5SGxk7fyh7Rmu
	 MSWB4cyXgFLPcAbRCO4i/8frv/c0YYd5dRipH5fhIQDqUj0UqnPhcSi5hhsj+qBk2Q
	 R2kNF9ITFd5pqJ6qFZwzWBY8QqJQNQpRjmrA68EfbzPlDGKbgw78ngCZ7RxgkGmbx3
	 qwqeIi/pPifQg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeae771c49so1360646e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 11:53:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqhtzNO/NtEgLjY8Vbi4+JcHdAU8tqZ+1VZ3RAjmQ2PNS83IC/+9UZssWuNEQEZy5YYdeUEd0wjOcfrr6uZJMtJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfi+viucgp9NArUdwt+PjoW1H+gLx3+h8OHZYB2pouXHq9e/2R
	alEFj+qwXbRAR0L+Gl5HK1z25NqD5ZZi7eQd/v/COc0OWGUDeCLteIxQlTNYymfh8/K+k7jb159
	INUKkRubIJIDtbGceVAWQM6iG7kjMAJA=
X-Received: by 2002:a05:6512:6699:20b0:5ae:b629:4517 with SMTP id
 2adb3069b0e04-5b0236de948mr44182e87.63.1783709607271; Fri, 10 Jul 2026
 11:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com> <20260706101823.341230-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706101823.341230-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 20:53:15 +0200
X-Gmail-Original-Message-ID: <CAD++jLkQPHfq=_D_TPMbmmA4JFwbhhtTC+3Dj+uD2P6LFNtfUg@mail.gmail.com>
X-Gm-Features: AUfX_myNLzbgrTSqqqiX6xG1do6m36L6LA1SqCR-RLu3gRQM6LPnA90pLzI98Wc
Message-ID: <CAD++jLkQPHfq=_D_TPMbmmA4JFwbhhtTC+3Dj+uD2P6LFNtfUg@mail.gmail.com>
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

On Mon, Jul 6, 2026 at 12:18=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

This patch 2/2 applied to my ux500 tree, thanks!

Yours,
Linus Walleij

