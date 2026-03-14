Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C2110706E6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 15:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79yloG2S6LSxDMg+2dBq+50iWkXEACUaWo+PxUDAKzk=; b=flhhuM+I4K1VmnUDh/SKFVNcIQ
	hI+NPjEn6QoFIAhTEFrvYlespykB2rjZbKsdkTZ0DtO3tnbVaOo925RZ0y5VNtAs7I3XhZ6T1kMaw
	yKCQzHVwfboLNp92xSxy47J2iVhdUlJHcQTV2wWKdhWmZNxqxEJEvc+WxcLTtOw2a62rIG4gY/vNA
	a0BfoOozpIZ3gnt0MABdIHzJ9yPP/t2ALs/eLONGLFZUAO4uDsANsonLKjZOKnb0O0kAln0R+r6ww
	ymjOw1IahY23bhJOWH5NoorvcdaWauL7Sj4q8/9/7PXfif0EmlCPXQcgMnFGf3+BLgYHMcWXp4o/H
	CXPeMMZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1QoJ-00000001xdc-2fIY;
	Sat, 14 Mar 2026 15:21:51 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1QoH-00000001xcu-0qYz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 15:21:50 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-50904a8f421so29505741cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 08:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773501707; cv=none;
        d=google.com; s=arc-20240605;
        b=G9GqOjYklfRA+bvTgzD4R6KC83+MhGG8TQYyF3HPTK5gaMM2esiQSNWvkPMs+lB9dg
         dvWFJGK6WXeNUkIF/9zuZaODy+RE+Tq1S0eciJPrHp7ph8JhZr+LDYZ70FPrqDJ5iXlL
         tktzSAUp39fEyF6m/sFVa1Whieyf+pZ8EkulzqPVgtDpIzioq8Bfw4qnwDqrrYpkEYo9
         jUfRYFicYlYuxJmQlokWsjvbEMS8B4FzLvoPgfAJCtN3q9wjHYWfeic0zIpAgYVbjzGr
         99+9cGoVJkDQiMLGwaxBtycrhecZsalO5FTLEzlxGROpqMh2hYqEZHP4SHHwQ3BPmfWE
         UWyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=79yloG2S6LSxDMg+2dBq+50iWkXEACUaWo+PxUDAKzk=;
        fh=fuqk5eg+vLgqP+jlTs6O8MypCe+RQvjvx89Mr96nTkM=;
        b=E+dNJDg32hi15DNsm9nZ9OICuhPUKKIaFWoloi7Ro1m4Tlq6j2ErCcdU0nYN6r9ZW/
         lNetUYZp9GIb+GnatZ2qIi9do2hgHLS04to7f5P5AtTKr/uOG6tyPkf1wYhnlHSRmjhY
         wCu7cChSrqn8Q0gQZHfYZVv+mROPosjcFM1Zfxyk/toGkzSskoUjTIztZqVMhAcA7H9S
         unej8aU5W9JqcN3oDp7IlSVaFrQFWeNHe8mjWlUU7ZkY8vLJWTplGjO9xxy0RE9HF9ze
         IH19GcWsYpxCBT9XaQNUYzyyvLBtu4vlv+Rubaubnb6iDjgW98yk9j+U58yMUL31PK2u
         uOzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773501707; x=1774106507; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79yloG2S6LSxDMg+2dBq+50iWkXEACUaWo+PxUDAKzk=;
        b=UpwJd9AMJeYRMBwM8JX0CdAHsPkJwj+ps74WJ7446uENt/3URkKfMyyPEKmGd8ON+l
         IXjL73EurynB69L0VB2Gq/aqOhvPZMQSF3w40uladP9hDnARyFkxAGqOxmb3OGiYoo2/
         HcBHlIvYicemPNjvYjbd2YBcS1xFjtdzqJyzGBfS8Jem2tHlmb+JZLFzk1QLPaERSELL
         FPHmasZDJPVCQB0Fg25sb07y2PSUpGNt39RrHwRpftkeEAp1X6P0LvDiAr3IWm/Y4b1d
         /MIXJ21kCpGmr8XoHzkGUESBWbfVIKz/zHp80rAP3Xl1OWWrG/CIjJiImaTm9xsVAtG2
         133g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773501707; x=1774106507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=79yloG2S6LSxDMg+2dBq+50iWkXEACUaWo+PxUDAKzk=;
        b=XrIfnU4TkYK1WLFeeafnSeZl+TWyGMI8gfvnmSuyYGCtpUrZBiQDBd9Jw2X0KoD9Ho
         PrO0L0c4ajtecG3vJ7bIvev2h0CAVq+OHuP4ojhEgq9LmpjHz3uekrKjsP7NJb+18xNl
         bLChm56NVLInkSnukWgAQYykqhDS+NbnKIsNQPIo5p5tWiBpM9EszEwEere6UqWnmVM5
         QtDX6rVtOqjJYL1i+0d9ZnUh2mMmY3MBtJRu3YmBKrPKEwRdS2aNeZoAE+RyJvi173nh
         xcdCwtEVHaFev5lbF2Ks5MC/ybubZhJ6nMHcHaxP1ZIRW3bUQflwMHxQXOsMOttPRKz1
         PxfA==
X-Forwarded-Encrypted: i=1; AJvYcCUhOlEZu/JU3IZK3csSqTLuhRW3JCfYjcb2lc4QQIqrpRPQA4CFFp6+uBIDWzM4BOsEmg/pXc5BKHAXg9rTpbP1@lists.infradead.org
X-Gm-Message-State: AOJu0YyV9h4JPMC0ZmT1dcNpi2YnJqbAWmh3m8RGuAvlTTtHgzHiSi/c
	QFvN+xvFp4NV1yRj1wiTonF7FdtYpC4B4p/0ppchfhIvAHQkp/u7BQ8wKcxOf+5nE3AHE1xDMyb
	TpdZLHB3H+93IUJKdNdZc0YaBJ2RZFXQ=
X-Gm-Gg: ATEYQzwcwOKCgAI1T2pDTSmHrinxYwEbhu4BD0zcjQcN7+cJo0vSeHNCjk4KkqLmG8t
	gST064ZqZFIH2q4QJzz77/+oWD2mcosANZRaEDAQlJQjLVUacO6INPt3keAFe9tzGasADZyAd/F
	a6kGREErZWmpNMWHDSRGTTjEHgYoBmPuqPomkNwk9GMNWbi/mFSgb+6NJHtKCVrNNZfqq3wiRoq
	5HLUx5O9srR0OTzTXdBuKwzOl0ntAARDoTfvM+w2TaKhYJQUuFMRkLsHX1mM9E5176MfNbdCPGS
	SKhV+k8y
X-Received: by 2002:a05:622a:48f:b0:509:30b0:831e with SMTP id
 d75a77b69052e-50957cd8e8cmr91300511cf.21.1773501706958; Sat, 14 Mar 2026
 08:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260312041533.187553-1-akkun11.open@gmail.com>
 <20260312041533.187553-7-akkun11.open@gmail.com> <20260313-cunning-fresh-rattlesnake-ab8087@quoll>
In-Reply-To: <20260313-cunning-fresh-rattlesnake-ab8087@quoll>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Sun, 15 Mar 2026 00:21:36 +0900
X-Gm-Features: AaiRm535EmprjKZQc-5oWppPCZE2tY_D2F_kXvT9geVdj9eW0363jXm8lhZ_OXM
Message-ID: <CAKr_iV4m9Jaxv3SCR1Rxg4ZmKPCkDteVaLZNCJo+tjqhX0=6sw@mail.gmail.com>
Subject: Re: [PATCH 6/6] dt-bindings: pinctrl: mediatek: mt8188: Fix include
 guard comment
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sean.wang@kernel.org, linusw@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	hui.liu@mediatek.com, nfraprado@collabora.com, linus.walleij@linaro.org, 
	mars.cheng@mediatek.com, andy.teng@mediatek.com, hanks.chen@mediatek.com, 
	sam.shih@mediatek.com, rafal@milecki.pl, ben.ho@mediatek.com, 
	erin.lo@mediatek.com, zhiyong.tao@mediatek.com, Jason-ch.Chen@mediatek.com, 
	amergnat@baylibre.com, seiya.wang@mediatek.com, tinghan.shen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_082149_251542_B7D30EB9 
X-CRM114-Status: UNSURE (   8.60  )
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

On Fri, Mar 13, 2026 at 10:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> No bug here, otherwise explain user-visible issues.

Ok, I'll be careful in the future.

> No, just a churn. This has no benefit, because it is obvious which if/end=
if
> this corresponds to.

I understand your point.
Certainly these patches do not affect the compiled kernel.
However, I found that there are over 400 instances of mismatched include
guard comments across the kernel. While it doesn't cause bugs, I thought
this discrepancy should be addressed for consistency and readability.

Anyway, I withdraw patch 4, 5, 6.

Best regards,
Akari

