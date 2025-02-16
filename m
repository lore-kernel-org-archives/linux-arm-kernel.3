Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F472C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 08:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXpKHX0ZasccCQS/rRdK60+YV5wRpbezRfa/+sNSrQ4=; b=XwrPVMhHv9r6ro
	dR0qxBRrMbqrctJftVxnTlcXMmvaHVKiI8C6Oza8VQ7MeCzV8PFYtUsblQ4JAwhkPVD5igNzjt4R7
	R8tZbtqLp+/teQEEbw64m4bcZpAluvxyfiIx1UT54cPKlpDAmU2ccL6atuT1TFM/lFxS2hyvitWKK
	tanDUFjHpaYS91agixDizF9US4o6I/qPrOE8Wih1vL+WTXF3d0No/XjT4d6/6t1CgEsrp10S8kL8x
	KRUFnLDqnIQhS3+99ETX6tJBukSE0VQTNDTTT9t4NoTmnh+/4EN3Z6pWs9cgoG8AJ8/IHdinw8/Qz
	AO9M7SqpgR2YNang05IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaEf-00000001ShY-2NF8;
	Sun, 16 Feb 2025 08:42:45 +0000
Received: from mail-io1-f51.google.com ([209.85.166.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaC0-00000001SNN-41fk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 08:40:01 +0000
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-8556adad825so256003639f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 00:40:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739695198; x=1740299998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXpKHX0ZasccCQS/rRdK60+YV5wRpbezRfa/+sNSrQ4=;
        b=OWRYvSc7fvuLrP11aR1fNIQymPUieMeVlBOfqAd8hE1vtWt08XB0GKAu875QNsC7bK
         WBZm9yla7beEt135wfRQURorrJ/ZKeXH/QxqRaAw8uMBBiZkqneCs71p2jVXVbZtHXHA
         Wg4+NshAPNBMtsJ5dBZxees202VGqsah7dfD158KmK9Af92eQNXZgYK3xPU+6qnv4FsX
         y2VIz769lAZI+555yamS6REffjuWXgQDsUpY5ByipKxtoAVMDZdRkKB0MKtRT0dfW+wI
         IwCNLXqjdXYeyh0MKXs3WaYtGIH9qtxhsG/o3p8Nea2Uoa+HWyVL7gdAyO1Wyvo2LZcf
         vIXw==
X-Forwarded-Encrypted: i=1; AJvYcCV9XpyOJuav5mCVCXjoZ4zltD4pFzN4OBqmf3bHOlPB/ULu0OGW+hxXVRNehPd4+WNTJZsZCevNW46ISyytsed5@lists.infradead.org
X-Gm-Message-State: AOJu0YwXFE39j6mEm7iqmiW+5jaov9dS3Niogt9DUE0k4ZDi7hImx6nP
	1zioxUVsyw3gVt4hwZ4qSHUlDYxGNWzUOAcjzS5I7/B6w5lBPAsel7DUHfjenaA=
X-Gm-Gg: ASbGncvUDYM/qRj6RrimXy9XyMIuXSL5owDBiQ2DthE6ESgJwKOLi61SZf9ystCQg54
	OLJlLMFDBSDDz9F8Vj9BwKZ9DSRjJ8UauxfXNaA8QPWk5djqb1Hb12XiYqZKKSU71a6PdEZvK7n
	OETfrlu2bQNvHKBjQ1RV93h2onaL604ggUyf6iwiNHU9SXf75xTz648BcjhABXSr3wRQ+9GoSbh
	25pboesJHWzdCWgJly0WeyqHjGly4cW++4eSVFMi5SYSaEGiA2Uc2pQs+VQdiTbuRfjNH4oSZql
	NNEfPjhfg5etEFpwOLsCNzIZwOSOsmXqVijhCLZchaUjvax7
X-Google-Smtp-Source: AGHT+IFhBIFeA39w+B4sc4O5ikTaG9AvQ3+N74yn102N7+lkslJDabYCTtEd5uYgXQLwduyHzAIptA==
X-Received: by 2002:a05:6e02:1b09:b0:3cf:fb97:c313 with SMTP id e9e14a558f8ab-3d2809cf122mr52715785ab.18.1739695198036;
        Sun, 16 Feb 2025 00:39:58 -0800 (PST)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d19eccff96sm10419355ab.11.2025.02.16.00.39.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 00:39:57 -0800 (PST)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ce873818a3so31682235ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 00:39:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVjdc0P0aYd06x8LUsBJBnbEF7+N1muZ0qpUTULbNfUya1dTJDlwgz5YBz+SJGEDQiRq7RTIzs8K34alCD7vZku@lists.infradead.org
X-Received: by 2002:a05:6e02:3182:b0:3d1:8ab7:9569 with SMTP id
 e9e14a558f8ab-3d279685dacmr46970125ab.0.1739695197464; Sun, 16 Feb 2025
 00:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20250214125359.5204-1-andre.przywara@arm.com> <20250214125359.5204-3-andre.przywara@arm.com>
In-Reply-To: <20250214125359.5204-3-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 16 Feb 2025 16:39:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v67JF-NBLG8GBnReHvczKXgiKBYHTR15HTCtspGcWTK5ag@mail.gmail.com>
X-Gm-Features: AWEUYZnAYxHy4jgtgA_B5U0mMvfm0UP2fVTcNC4hjtdhMTuDWPQD0C_dkfISXeo
Message-ID: <CAGb2v67JF-NBLG8GBnReHvczKXgiKBYHTR15HTCtspGcWTK5ag@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] clk: sunxi-ng: mp: introduce dual-divider clock
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_004001_005086_824E4AB6 
X-CRM114-Status: GOOD (  13.14  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Feb 14, 2025 at 8:56=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A523 SoC introduces some new MP-style mod clock, where the
> second "P" divider is an actual numerical divider value, and not the
> numbers of bits to shift (1..32 instead of 1,2,4,8).
> The rest of the clock is the same as the existing MP clock, so enhance th=
e
> existing code to accommodate for this.
>
> Introduce the new CCU feature bit CCU_FEATURE_DUAL_DIV to mark an MP
> clock as having two dividers, and change the dividing and encoding code
> to differentiate the two cases.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

