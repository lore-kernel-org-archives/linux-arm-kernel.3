Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BA1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4AdpC+R4N8zDGtraiU5Lmy5Fens0u4reg+EHPOLw5QQ=; b=yp920SKtfdAAYg
	/3YZ+JSqQU/u0xym9cYPa7PhgMhtGy+Qszbwmy5yMsSRb0HDULTKb5tCOCR/WWXIKTj7S4X61s3GI
	yAVWDP8LDhSSu/SQUQo4ua6UaayVj8AGKv+RA69vJ1ULy55RAFyJx1igirh8Rs8OoKSAo1MKzJjUN
	vb+IJ32xrnCXGsBdg+C3T2sBHkq1mUsKqBrZ8kJQkC+yCJwO5XSFvbpt/1wnVYzk2eMt9Qh4qQN04
	WDbrSse9UmEdnAra+X7mwkBcwLzrjS1Ksi5mxZvOrOskVIL0ZNZFjpbe8wz5Wg/Gl0O/VgzTIm4mZ
	1z2OccG4MptmumSNKUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaDF-00000001SVN-3cF1;
	Sun, 16 Feb 2025 08:41:17 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaBn-00000001SLm-1fNn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 08:39:48 +0000
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-545316f80beso816521e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 00:39:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739695180; x=1740299980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4AdpC+R4N8zDGtraiU5Lmy5Fens0u4reg+EHPOLw5QQ=;
        b=J+6lyVKpTuykTojMkm9sbpCH0Pk/JTXSg1Mm1uhRIUiFVecAeUE3R0sv8ElmObk/Ya
         bDKfWd9InOjNWH8ZnIbg8e0nmqBkVEBpkmd6ZchpDTSfmA2l5xLC+AW9ZUzJ9JrCMyBf
         MbLKpJogAq3sVbZL02bv7a9uQDthHawCh0z77XuIqPWelAO9oGkMEVmtvhnpAnnEuUTV
         8tyqMFUmNuk+yzWEAR5ygJpF1Mo9P7wzhIl8jw3AieIFl3nr41/36wPi6l9qpJz8hORr
         cbKfD6ftbHLNeuSc1jFFGLXVDTn5Vz4cM9ez+V3Jw+vXQ8v6whEWW976XcsPrvusLvuV
         sSuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3qG5aV1as3RhDmoUMMHiumNP1ibZ2/SRe5N93pOl1xU+7xn0CBgGt/d8HR1DyojEoHEXjxVFjh7V6Ql8JEAuS@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfr0Q1nsW2Tp1NbdKkuoO/ALfCI4KXnTS8THD9PtsuaQySJSH3
	d21EcY1cM8WY3ptRH3gY1cX7MbVeC+wEbWuI/GmOKfgTPRyrb/sESN17Duab
X-Gm-Gg: ASbGncuF1po1cyBdMVVrGeT4vyOqAgtJTrLCKDX2L4CtIaDi3zHNJ5K2zF0RWl4H4hr
	6eluN3/7UJHJhmnYFp9Memlp/lK3hr4YD+2Fd03kLuYltcwxxrHuxfJ4GGINUaL0OBPAbHb8AJJ
	gA4SuFhFkmuKMztDpBpG+scqtowCsinTNL0BNU8PZkLGuKPo3tc0Kad+CK+WU/SFYKcpUetSapv
	jjFF8kKnTxkUsM3kBS0XqoXty+C+2XC1WhMWhJoEAys4iNphGUGW8wOdBY/OTFznjWBkd5ZpzPF
	XnK+/1jbIX068+T5AB7GacXxsq50HiS3rrJeHG5jjGvr3TqN
X-Google-Smtp-Source: AGHT+IE7WPsfiQ2TZSCcpD0UGxEmEykah8LcqmrODQ+kz2IodraAM6/SpXd/CW+wfFeRdbHmIHgHyA==
X-Received: by 2002:a05:6512:2823:b0:545:81b:1508 with SMTP id 2adb3069b0e04-5452fe26554mr1407453e87.4.1739695179946;
        Sun, 16 Feb 2025 00:39:39 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452a9dcf1csm768256e87.179.2025.02.16.00.39.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 00:39:38 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30762598511so33640641fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 00:39:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/R9kcTJTcATUL2wjU6IypadSiG1+4IaKjXroETipgqBjaxduuo8FLz4yqzpQunfc2QU5dVNgNveQKF9KYV6Wu@lists.infradead.org
X-Received: by 2002:a05:6512:3b0b:b0:545:c89:2bb4 with SMTP id
 2adb3069b0e04-5452fe3a9a4mr1513881e87.23.1739695178124; Sun, 16 Feb 2025
 00:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20250214125359.5204-1-andre.przywara@arm.com> <20250214125359.5204-2-andre.przywara@arm.com>
In-Reply-To: <20250214125359.5204-2-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 16 Feb 2025 16:39:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v66q0mymn9a0uy5zyYCOKiLV+WACkM6SHoy057u-F9vstA@mail.gmail.com>
X-Gm-Features: AWEUYZlJN5fyyQqJMaZNefcoToyMAqIjjxYWZyhvGNhYIbG8A1i9T2wmnDZTFAc
Message-ID: <CAGb2v66q0mymn9a0uy5zyYCOKiLV+WACkM6SHoy057u-F9vstA@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] clk: sunxi-ng: mp: Add SUNXI_CCU_P_DATA_WITH_MUX_GATE
 wrapper
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
X-CRM114-CacheID: sfid-20250216_003947_432695_1907853A 
X-CRM114-Status: GOOD (  10.73  )
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
> The PRCM CCU in the A523 SoC contains some clocks that only feature a
> P (shift) factor, but no M divider.
> Treat this as a special case of an MP clock: by forcing the M mask to be
> 0 bits wide, this always result in the M divider value to be 1.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

