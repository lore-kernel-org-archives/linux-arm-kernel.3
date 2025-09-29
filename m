Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B31CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 18:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtEAn6CmDr27aj5SF5YUmQQCee6wbRGfkRsR46WrjSo=; b=GAKO0AcG/Fp4caD5qMKHYud07c
	1ZAQhXFvPaeSGRbA+aPTM7s/aUJIS8QHEYqoTPNmp9nOjegmk0bAA1q/XrQ3KicnSBQIZBrP/b24Z
	d9UVT84IKNflWpIwrymP4NGMEef5EpMM37hnlZfzEz/n303785yR2rCrAV6oiVqAwyPmo44Yn/2O+
	OB/8ePp9DE/odS07gxSXq6qDLJDXmRldlGW5LjWC0aH5YH1BcdHpjP5Jyaq5pkSBg+IhjjHRdQnvW
	d1d26CmCI2EnsIPlQ43+Q+ndRKxFP69B9nT29ufJo011H6nzHV8utPyQXDlIRJC/1tMkRQdH7cR2m
	DGZ/MkWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3IUr-00000003EMk-26jX;
	Mon, 29 Sep 2025 18:21:13 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3IUp-00000003EMA-0tTl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 18:21:12 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4db0b56f6e7so43101541cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 11:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759170070; x=1759774870; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtEAn6CmDr27aj5SF5YUmQQCee6wbRGfkRsR46WrjSo=;
        b=jwtoynMueB+K4lOyQ8g8mL2D1Q9F09+DoLGBwNcim5wqVwqPOCO9XKCLR+htu1+qwX
         YRnNi7Z+25nS8dzhVUdPnv993EaCdfXHZomalR79neUoQvdMcaeJFdQKRMarfdj11y3U
         zkgFRKv1MwpC3TJHvDiwQPrqKjhBGYOIixJac8JINqZVBzq1s50N3zIzU5fcuIne0gTt
         8OP/3m7CrYTDhj7L5XBP8vFwfk3yZG1ErH1/WV4v9zWM6oTgJf4PbOCHs6K+YgzcXGBH
         AmVVWVRNM4lBaNevrNCnAecrf3cHp+syFCUXFRE7yqo5+tr6hNaxrrFMj67xFeJEu2Lu
         RZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170070; x=1759774870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtEAn6CmDr27aj5SF5YUmQQCee6wbRGfkRsR46WrjSo=;
        b=FhflMU5vfDxae2q4R0zpPsJpXeY/ZvYa/oD6+fk/YbKHO95FmHNDk+gDD/NwQbI2c3
         3vlL76bepp8q2o5yE+qzrMwjSDOsWziZif5Bd2K5oBsROtTY53ubH7HKsILKbP+1YXEo
         COF+t19TIFsw1La0GO2q+6i5L2tGsL5KEraeAHJjcOmc+WuGGQoO5pliLssr01b/ImDI
         CNLvNH5PskhYVtnXalLgEkD7ditWzxh9mT0IfzNTLUqaUuKJKjerePZgSksaesXovp3w
         g3QENecas0Q+qV6gVggqMzI8W6LBVuhVM53g3XNsJn3nfOL0psZq07xgGfzYUwR29OM8
         AqAg==
X-Forwarded-Encrypted: i=1; AJvYcCVlM/RlPAr4Dpkz9ijo9R9ANppXnrViPaU0s8Ga939WmUv7NW5mrEeUpile2Jcw47NDGXDLZ3AebZwD8hkP5VCS@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd7pfcvoBYlIf4f1CVlcHHTSlYrEI/a3Lt6arSvHTaY6S9pGRN
	/3twivjR8xYvrEjrxrrThAT+jToXqBI1sUJSXnFELzCjmx0AyX1DbgLHuQQhqp+ubMfo51c1ppP
	WMyN7jgPc1MYa6eoKQqji49Z+JNgBv/M=
X-Gm-Gg: ASbGncu53JKoHgnQA7svKWACJ8/5IhU8S+PULtk1SqfPY55UyiIYdD1O0xT0wriZdzv
	phgljsMOb5gbCMPX1Vj3YFYmJNRAsYE4JuS386vdGUQi6PWEqa4ZG9R1HEIQw7PWmpsn5AysQ6X
	VpRWFBn3mXONV+rYO2qmN7fl85RFsE77Mpm5LreXs8/0fqG/Aa1r7CTaicCylQ4wMs/8+d6WBlB
	HMcqFfa
X-Google-Smtp-Source: AGHT+IFrBeJSgMsR3HaccN16cnXjcttv9tgaaLMJKzDwaIqr0lNEmWSIpPm9V69kQrLev4/WKIw2zOmNYU6wfZ7+6Po=
X-Received: by 2002:a05:6214:2625:b0:78e:5985:92f1 with SMTP id
 6a1803df08f44-869973a156fmr24287356d6.11.1759170069962; Mon, 29 Sep 2025
 11:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250929065714.27741-1-jjm2473@gmail.com> <20250929065714.27741-3-jjm2473@gmail.com>
 <5700676.tIAgqjz4sF@phil>
In-Reply-To: <5700676.tIAgqjz4sF@phil>
From: jjm2473 <jjm2473@gmail.com>
Date: Tue, 30 Sep 2025 02:20:57 +0800
X-Gm-Features: AS18NWBViMs8caAfXLXKamwDlPSJ-YJ_sCg4Ny2_8taIjH_4vuLBQ4TYDgmLkh0
Message-ID: <CAP_9mL6e8ekL14xycSfPmVSkL7pANLeyewWd=rjxbtMgMQXxxw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add LinkEase EasePi R1
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	quentin.schulz@cherry.de, kever.yang@rock-chips.com, naoki@radxa.com, 
	honyuenkwun@gmail.com, inindev@gmail.com, ivan8215145640@gmail.com, 
	neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org, 
	pbrobinson@gmail.com, alchark@gmail.com, didi.debian@cknow.org, 
	jbx6244@gmail.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_112111_254131_2841AAD4 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B49=E6=9C=8829=E6=97=
=A5=E5=91=A8=E4=B8=80 20:28=E5=86=99=E9=81=93=EF=BC=9A
>
> Am Montag, 29. September 2025, 08:57:13 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Liangbin Lian:
> > LinkEase EasePi R1 is a high-performance mini router based on RK3568.
> >
> > Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
>
> In v1 this patch received an
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
>
>

In the next version, I will add 'Acked-by' to the commit message
and then run `git format-patch` to avoid missing it.

Thanks!

