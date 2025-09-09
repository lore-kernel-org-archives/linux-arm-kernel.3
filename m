Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B12CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqM7enTl5JCEBh5L5tH8TyjNRitV3B594uobCX8eDCc=; b=i1dDC6hSU3qze2
	h2I2X8u8Ee2z5jVR5+97EqLUctSpQ7El5KAb1lrZnRYI45BUmLnBvgA4jZKVv092fDb977RCCt1LM
	c//xDaN/m1P5H3IzreASMEW6bXOhQ1h7DepDNlVCk5MqKku2aVxVcbfp0dkmvgPxA+bBv5faA1B5F
	EBRev+LrfvhR7TZEPF03LLbfp6X1hOd+Jc9ZWg4odNmWWYNpChN1w7AbyDp8Eo+uMwwWfgd1q9yeW
	k/acb47qm1xywSh0YW0TXDaJ2CmSfJdrjBJhQBxSipaIkRd8cp+CQOSThYi+J+Izbl5Rs2gUBWtPp
	yGf+cS+83dus1Uew8Uiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26K-000000094Tx-08Nt;
	Tue, 09 Sep 2025 17:25:52 +0000
Received: from mail-lf1-f51.google.com ([209.85.167.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0z0-00000008SY0-351i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:14:15 +0000
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f7039aa1eso6417686e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 09:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757434452; x=1758039252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mqM7enTl5JCEBh5L5tH8TyjNRitV3B594uobCX8eDCc=;
        b=HaY9GovZPBwDYH98Io7Cg1mT9gfk7v7LrM/j3Jo3jMFh7HG8Gp64G0jtHwoPITS0mS
         7JrjnRbJuo8/95RoV2IsAoNHgW5dkjksX2bJQKpOtFDAv71+4KurzmLLoc2VqrsPMAtx
         pErnny/LN+jjn81BGGUmTn67DETF1gEsaQUPMQC+co4UzLSa7CROhXlTYOrR9hNt6HLT
         wNEC9IG5kCGUtKeN4n7JkPVCG8flFZGlXoqPABO4cZ9x1iqbCW+WE2BncUXJdOegmykq
         NQ5nTO/Vnd+1hQYNrK/IxEIG2PCSvzKyTw7mPcMdlUcCGStX7ugaFXlkACd+YsnnLwAm
         l6sA==
X-Forwarded-Encrypted: i=1; AJvYcCXCDmydUcrsyyc/3EIWkd0JCwJJF4S0pxkQ4k9KN+Odlmx/qugcnUn7O+b++WvL9N5apkxfbuK1Ld7wH0xOvFEM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/v0HaM2T3ZxoGi1u93yjv241C+I+GoHvGvoT6ynvRyYA6Y5P0
	S8OitLQJKsybo/jfXt5H5beQG/yX3p4813DFHevwlIRQrWuudxuPWWWLQvpgfbYR
X-Gm-Gg: ASbGnctlZLp/T9D6dH+YYhIrLB+ATX67kBC9IE/6NV2KsUivhvofO2PfNluNbHy2sUD
	JlLwzjxn2AIu3Dv8KrknprxmNZg5892IfVD76rMiNkmKrvdB3go5DVqCPKA8qJOrwBV2SsQ+P+W
	tzLRd9LZroFAmOmzEkaTU0P/zDndi3P/MBJznCnaZQHnCp+ZazpdOHJSSvOXjFDlzPtgDim9Yw9
	WjMnqJEB+mR0/NuMuY/i1sUhC5uwxtgwmB6Lqgj+4PXkdv4X2Ge/r9inhMvsrHKJ/9lmLDheVUy
	H/AgVBOgJ9W6FROcdMxCUtJ6KMdjZ0+F+I4YF1HpkNNqmKVYqke8sTNh5rBmjXn9rccqUnPn+mg
	tmqcu8cho3QOUuCS7ArNWkVPPwuWPxSLKh3sL0yt5hjLmhb/yhb3ZhuwppQq6PHw4JVNG8neCrh
	3S
X-Google-Smtp-Source: AGHT+IEJyVQXxj+b8eZ/3+FaUPvPlpCNjlv+DP6YgqD3tpSBnXcWSW1Onl16raH31xG9BPCcn5Iwcw==
X-Received: by 2002:a05:6512:eaa:b0:55f:4760:ffeb with SMTP id 2adb3069b0e04-5626275e6f7mr3954797e87.49.1757433981868;
        Tue, 09 Sep 2025 09:06:21 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56818cfbdd7sm588846e87.136.2025.09.09.09.06.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 09:06:21 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-333f901b2d2so59633601fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 09:06:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWO5nFEJ7ugCDYOq5aizBcGDfism7NTj8jSMfq+yKOoWZNqWaRr3L/aAwDz3g9bUfYGk+7zZm6KMKV9f45QCgha@lists.infradead.org
X-Received: by 2002:a05:651c:1118:10b0:336:de52:5c33 with SMTP id
 38308e7fff4ca-33b58cbe583mr29181991fa.16.1757433981198; Tue, 09 Sep 2025
 09:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250903000910.4860-1-andre.przywara@arm.com> <20250903000910.4860-3-andre.przywara@arm.com>
 <CAGb2v65rRqTWvn2NR-OSeP-zVJzheJ=L0YeG5DOrCTPJ8Haiyg@mail.gmail.com>
In-Reply-To: <CAGb2v65rRqTWvn2NR-OSeP-zVJzheJ=L0YeG5DOrCTPJ8Haiyg@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 10 Sep 2025 00:06:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v66DEh3ZGTsBkX6RELRs+0ZPbMq7bsNQhdUcpxHHMxDhhQ@mail.gmail.com>
X-Gm-Features: Ac12FXxEC7pM8O5XaLI0ogPtLktnWEqjnqEb6kXbRdWLZTDBJ17zyeRXdPd0u4w
Message-ID: <CAGb2v66DEh3ZGTsBkX6RELRs+0ZPbMq7bsNQhdUcpxHHMxDhhQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: generalise update bit
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_091414_781163_D7F470C1 
X-CRM114-Status: GOOD (  21.22  )
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

On Sat, Sep 6, 2025 at 12:15=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Wed, Sep 3, 2025 at 8:09=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
> >
> > A few of the Allwinner A523 CCU clock registers introduced an "update" =
bit,
> > which must be set for changes to the other bits to take effect.
> > Of the three clocks where this was used, it was always bit 27, so we ju=
st
> > encoded this as a single bit feature flag.
> >
> > Now the CPU PLL also features the update bit, but puts it at bit 26, so
> > this flag trick won't work anymore.
> >
> > Add an "update_bit" field to the common sunxi clock struct, which takes=
 a
> > bitmask, so we can encode any bit to use, even potentially multiple of
> > them. As uninitialised fields are set to 0, we can use this as a defaul=
t
> > bitmask to set, so can OR this in unconditionally.
> >
> > Change the existing update bit users to use this new encoding, and add
> > support for the ccu_nm clock on the way, since we will need it there
> > shortly.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Hmm, actually, we also have the "key field" feature. Maybe we should
generalize that one and merge the two?

What do you think?


ChenYu

