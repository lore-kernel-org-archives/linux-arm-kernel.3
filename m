Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6A9CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 05:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBj8SHJfZNGuq71dQKyp+ING7ZoPtD6w+DOcmGVXVSg=; b=tJwzjM1GW7NWBecBEmWs4cwEhN
	unOprrEUEp9+DG7rzF3S3zJcFitLkNq1PkDafb9j7qevYa/qa4ScBQX89U5fI/YdQWgNSyaVAjY3I
	WSSnFM833rEDKhsLngDJqrPUXeXg9hr1XKoN+IiyAB0+CMkZPgnwgdBfhg5epiUrRdtfBx7Do2lQY
	l4tixtUjJMfuW64Yc9bPFnXXkpv8K2ypyvfZWY5/wjWPDxeFnaU91t50DrCyQlUTRE4tK+vr4NRc/
	MNVfF1tducxuYYd5hkl9gAo31kM4EkRnfQ6Yemh7Nlxa+udgA0+iXycINHKzVl7fuYgBk1jf0ePnn
	aEfUa4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upK8a-00000001ZRB-15ti;
	Fri, 22 Aug 2025 05:16:28 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDfZ-00000000jXf-3EUS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 22:22:06 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e933af9f8b5so1217531276.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 15:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1755814924; x=1756419724; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBj8SHJfZNGuq71dQKyp+ING7ZoPtD6w+DOcmGVXVSg=;
        b=JFqepFP6WTLC9ukFxVc0v0Crwtn1zmocKru8S7hczPlRwkjPbe3YjpYAnmxyhlv7gS
         2lVuXJSvPuNuizZzvGksACsn5TvO7RXUI55fFBqgmm3Hb63zdKaVFoFFddCdHOtkhcVb
         gxTVv8+wyVd/9szIMujc3mRzDgLoCFw+60u7nCcmf/ClrIEF7SWdW6yVOeV027NBPFhG
         DntyFKFIA22h6+2eFzzVddM2AQ0pCHUXUr8opYK0zB0Mxr+TKWsushtJs9DpLmJoAK2e
         6zPfQZZTAOCXm4L+qIJxzYyFULqgw2BfnAhrWmDjJJcsb4X00P1aPkpo+la+QT1IjBmD
         Hx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755814924; x=1756419724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBj8SHJfZNGuq71dQKyp+ING7ZoPtD6w+DOcmGVXVSg=;
        b=Ud4/7mfJPWfkgs/e0bA0pNT9A3EmPDhjLySg0F2uGTPV/NEtACyZLVMi7cpIAbTDl8
         s2aWHP8WgBS8Qx1sz/YH/neit7riV+cgkU3Dzuosr70Om0ngCOc4NSaynPa+Lady8zcX
         k7A7JdG9Yj2xOnxClAOZKzs5n6jPp6M+bg9Q9ZzmiZ7flhDQQSWPQ8uQZmFBWjBXkf+I
         nsU09v2vol5NEec/L4mNmz4UJfMcMGVemDWis9UmoxFmNsxdL7Ro7z9Oy1k8b/wWqGQS
         G+i9DIem1p9FQ/gtyYUjJn3mvmubNoTPS9NZohiiQZ7B5wm2I8G+KNbHbcyrNAcRylIu
         52Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXcIBQhVgHEwyN4Jiu1hk/KAoc2EmxffN0oL4PutfSbFR8OE81WK0qWl0cvkBjXmKNA9lmOVfhRdIC4F0tXxykv@lists.infradead.org
X-Gm-Message-State: AOJu0YxEAClfBIY9+hFW5iAkT9268hBfXIwlIkTcoPP3asrfGM1t6QEc
	iRDZZqETnffMfL4sTsuKX+kEJiPeFUX3p2lvq2tGqyfsaLehAWUq700vLURRSKF+vtRplnyg8fF
	RFPPbo7npX2U+3eqN+9VdBiULi9UQIMFCDY6i6ex8
X-Gm-Gg: ASbGnctvLdytLYqZf3JcWdly//i6Hsa5KxYnTqvsX5Sm2koKY6ibR1GC/23mlQVCm4n
	Tyq6Am4VqV2/C+LFmR9ss7AZqisegY0EkcWxOrvgD4/T/E5c2XR8r+69m+m25kinsi82EukRwby
	MzOXN+ZMBYZd1EFvINIOvV5Q4I6z4rUK+EJ8qZByLr7uiE35hlAm9EC9KIKf5eZqua4URaumkL/
	NAHTsLuK2OcFy1tgTKR2yKrcwprNVvxDjX3EoOL4aZzfHMrvnfTnfznwqeSig==
X-Google-Smtp-Source: AGHT+IGsRvIzVdiLiubOw6s26FCV+8GUBa/zvOZHQKwnuxp9m8DDW2C1NVHDopq1Qw9f3dHJcaZcP9J53I+yjNcPN2E=
X-Received: by 2002:a05:690c:9a01:b0:71f:96b4:9adc with SMTP id
 00721157ae682-71fdc327bd2mr9169047b3.18.1755814924223; Thu, 21 Aug 2025
 15:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250814200953.1969944-1-da@libre.computer> <CAFBinCA2XZfiY2ESDSp2WyM9r-XB_LSj9s91woU9iWoQKrp6QA@mail.gmail.com>
In-Reply-To: <CAFBinCA2XZfiY2ESDSp2WyM9r-XB_LSj9s91woU9iWoQKrp6QA@mail.gmail.com>
From: Da Xue <da@libre.computer>
Date: Thu, 21 Aug 2025 18:21:53 -0400
X-Gm-Features: Ac12FXxi99gixxdRQMIukXDBwJ56n_o8uuNClN7qs096fAcZ04uxsTATA3IRRuY
Message-ID: <CACqvRUaZaoh7vV7Qo_dtnxC-NE227rY7EQe=dx2a_nCcfiZB2Q@mail.gmail.com>
Subject: Re: [PATCH] clk: meson-g12a: fix bit range for fixed sys and hifi pll
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_152205_889216_98EA88F9 
X-CRM114-Status: GOOD (  20.42  )
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

On Thu, Aug 21, 2025 at 4:43=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Thu, Aug 14, 2025 at 10:09=E2=80=AFPM Da Xue <da@libre.computer> wrote=
:
> >
> > The bit range 17:0 does not match the datasheet for A311D / S905D3.
> > Change the bit range to 19:0 for FIX and HIFI PLLs to match datasheet.
> I have:
> -  S905X3_Public_Datasheet_Hardkernel.pdf
> -  S922X_Datasheet_Wesion.pdf
> -  A311D_Datasheet_01_Wesion.pdf
> These state (for all three PLLs) that .frac is [18:0] (that's shift =3D
> 0 and width =3D 19).
> I get where you're coming from with 19:0 - in the context of this
> patch this can be misleading as it would mean that the fractional
> divider is 20 bits wide.

Yes, I was in a rush and missed this. The description is bad and I'll
spin a v2 with the Fixes as well as report the clock differences.

>
> > There's no frac for sys pll so add that as well.
> I first read this as sys pll does not have a fractional divider.
> What do you think about: "The frac field for sys pll is missing so add
> that as well"

Will correct in V2.

>
> I guess at this point this should include:
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> > Signed-off-by: Da Xue <da@libre.computer>

Ack
>
> [...]
> Have you compared /sys/kernel/debug/meson-clk-msr/measure_summary and
> /sys/kernel/debug/clk/clk_summary before/after this patch?
> I'll test this during the weekend and then give my Tested/Reviewed by

Will provide in V2.

>
>
> Best regards,
> Martin

