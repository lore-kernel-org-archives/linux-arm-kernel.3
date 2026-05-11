Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A9BCD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDHouvSKIaohVa9IYx7jzYabikw6L93PsWX5S9TsOgU=; b=fHpok6swA1QHZrQH1RQzaTmQTk
	NUMJ8uVmm4opvXujcpm2DROIa2Ns6lpHNR74oWz06NZIsXg4X7QKTJaB++5FvDbng/BqorupNZgKQ
	wO23auBUqNaFx10nNOfxCo5sWm+NWeu+9s/iMEQpHXF7/+QziQLlo1Bc027FvnCRnukPsC2d0O/i8
	u+zckMOfgcTOLO3Gt/pInCEEMwQWe7lPJyy+W/YZcZ6oHumDzQDDFRxQnykXKUzSu358549e+nq1b
	W/TckYJX4gL5ABQblyhKnkIHddT8GX2qPHktssFbALU8J0qYx/ESpcypC6rlebKuU2go+cw1r+NsZ
	WkzagvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMbQ-0000000CqTv-2hXH;
	Mon, 11 May 2026 09:07:04 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMbM-0000000CqSj-2dxF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:07:03 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-132c338a537so810846c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778490419; cv=none;
        d=google.com; s=arc-20240605;
        b=DKgQxPj2AJKnUL8CR+nGt+/ZHla77ez9PYXrL+ESUIB/LNqN7CGNx4+iCakZJZPG+4
         rADDwmhdpY52m6mazZSiRsB1XNz/RmBnVkluQqNs6tgQ5vwLh5TUXEGPNR7yuLaDfbIN
         JxliJQMS4eOawPu2rwzuaF/N7dH1yBNiw0Fb04gthFYlzv7CcysFecTbPmIEh0WPopei
         53oHyoTGb84uJhrXjGP3k0qGGMPlmU7z3wqXeAM0amzTXH92grdYw7pV8MFf1SpT65Ar
         1f0llqDvj/Quns93rpJ0b7rymOyA+1tIkSeoBlLK5wMzak57Jwu/WMGWRU6jUj5LEHB6
         +wxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fDHouvSKIaohVa9IYx7jzYabikw6L93PsWX5S9TsOgU=;
        fh=taw8lHqVfMUDOjEDrJNVMumEktcEQQtvK9dm8SXbyxI=;
        b=F3AGpJyhggIEAyTU4bHjvvU6H70uEAK7upaRaYZcHJ/hlQBLGmz95TAQHWCKMrgqjK
         8Vcv/mi6MUp8q7f0my56HuU7a6U6H6T8IpiwHM5j7VXQ4kZmxcDKFLQXvHrcVC7ffr2O
         VtUg65SZl9KMuSQn3j26vgao39B9ZYbZq8nbUYzUuL9XZFi5fAsDo5Fp+0FymHEZ2twH
         uSA0QxamsJAUmWA777naZirk4EVOhrfWLdturrj2ozG3oRDyEezEDeD46NfjWVyo/pYc
         91u6BD3U4oe6w9nln4+RfD27bV4T6oUXW0xhO/OY0wFka3uNyVZQFPqPDZKq/U4zGzp6
         Pqzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1778490419; x=1779095219; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fDHouvSKIaohVa9IYx7jzYabikw6L93PsWX5S9TsOgU=;
        b=EzT0zLgtigL4KWpXVCPNUKz3BKDhumxmlfFWNuQXGj+dmsgPV7mk8MRvis+p4chk5/
         VSAWnpZ3iTSv/Vx9ruBlxI4v69XSESyrLe5sjleaMDvU5560/dWkd4HOmC1H5k13waT7
         C9XYH8jBcqLZIj7d62oCrdb7uKh1LueUaOEnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490419; x=1779095219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDHouvSKIaohVa9IYx7jzYabikw6L93PsWX5S9TsOgU=;
        b=dxvoIE1QblNvoCwjtf+YoP9+0jNu4QbToycmx42qvOUiXOS1JIW8zUKUG/gUi+HU8G
         G2tBN1PIg3eQEq8zBWjjUfkRmNCUGfJ7GTIfOf/Nx+r1oVntUUKGhpj2yaMu7v9ygjtw
         qXnoFsmgFjeotdn/TvlDUx0T3iW5QzXHU4gKoUiVgl0rd9y9wftP2D7vcF4zJf1khUVG
         epqINIYgN6mYg/jBke8k+uQz50tQOP2rEuy94MCYHskAL4YqV0/FieD1dhbdP/2QYYQh
         70L0Eu4U/P+mrlX9CrPVbD315D3TUiEonLLaAwXd3G+ezcgjevElGHvBq6eawwA2jMIW
         BMQA==
X-Forwarded-Encrypted: i=1; AFNElJ+GuQX2Auoa+mQM3bEqoChEzymnEvwSi9CLX+jWehLqvuz0fAeQFrfin34H5pX/cUtS+Bm0aW91hBhrk4230/jo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr5HSuxEdlaaDzkYDSy7UnP2jgC++m5PQlpNu/1FbF8UUXsdNG
	fduoTIr67beAmZnIyuB9BTmMAKMd9EQs3KewP27A7mLpgCRlYsft1se8CR+YD6Q3UInDIKClSat
	3+WfSBq8c/SPB7P+2LSEwFh/lI7B+ZT0dplx1DyewcA==
X-Gm-Gg: Acq92OEq706zwObkALXiZaecfDpZ8XOwmMnS3MF/flxv7bNpAk/QPcCUUbT16oix92r
	t6usyoJIPBMgnIOH+JhBmYIKV12etITwsmeZxIDYAOHvjguoPxrQomtIhDA1Wts/P4+CUT/nloY
	PLJKvLOl8d0+1lei+FoNzyh07Af2pNXeTXzNWnbxt8kIJTH2vTEx7e7evBaGbdHSfB2lBFOWTjY
	Hdwbnh18Gevt10KtxOMChPZo+a9BwkHTca7sS6A3Blhiswznku2EqOXWuJckmnCH6Sp9ST+zbS6
	s5l1yI82HqS13qCvS1kBnXlXW2JuQmr6o7FyWXoFyCRqGGTKSl4=
X-Received: by 2002:a05:7022:4588:b0:12a:6abf:ab1c with SMTP id
 a92af1059eb24-1323ae990d7mr7795416c88.11.1778490419302; Mon, 11 May 2026
 02:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260509104255.15479-1-sozdayvek@gmail.com>
In-Reply-To: <20260509104255.15479-1-sozdayvek@gmail.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Mon, 11 May 2026 18:06:45 +0900
X-Gm-Features: AVHnY4Ls_cfTwlTD5iPSIxoH1794TMIvrwk8_DVkW9CFVke0q-JxeAZGgVQz9Qo
Message-ID: <CAFr9PX=f7iJ1cHKX_VG9CoNXQCGEXGXVSoLa26tw8CpcvgQj7Q@mail.gmail.com>
Subject: Re: [PATCH] clk: mstar: msc313-mpll: fix one-element shadow array overrun
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: romain.perier@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_020701_781513_2D9DA1D7 
X-CRM114-Status: GOOD (  10.34  )
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

Hi Stepan,

On Sun, 10 May 2026 at 02:58, Stepan Ionichev <sozdayvek@gmail.com> wrote:
>         mpll->clk_data = devm_kzalloc(dev, struct_size(mpll->clk_data, hws,
> -                       ARRAY_SIZE(output_dividers)), GFP_KERNEL);
> +                       NUMOUTPUTS), GFP_KERNEL);
>         if (!mpll->clk_data)
>                 return -ENOMEM;

It's been a long time since I wrote that stuff but what you have found
looks correct. I think initially the driver only exposed the "output
dividers" outputs and then was adjusted to expose the undivided pll
output and that allocation didn't get updated.

Since the report and the change look correct:

Acked-by: Daniel Palmer <daniel@thingy.jp>

Cheers,

Daniel

