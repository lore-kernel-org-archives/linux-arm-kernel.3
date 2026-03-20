Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FE81091914
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=043aRu80oNzZpDNLQsr22bQjNBOCbJEW+dvHRdFYP0s=; b=dOV65Izu33NN2w0kCNfT/IVtfO
	djeaLIEtA2gsX9cH2BsLS4Bx2PWvYOsCJ2i3DVRsX4KQA5VxalUH95mKSqeYQ+4WftMYb0yG48WAj
	gP/y5Ish+6f74hikBzdtUxlUlDUW/muFLmremSK8zlq+isKjuRd6HCIjrz59RX4jqElWFeI5qhPs0
	+a04O8qINCpHwLt7+z4ZslIIv7Co533UNmaPg0cdBTpRlN+Og5u97FS8WQXkgGmU7fPmbOyt3UZL5
	9Zy39mfehjub7voNFhTy8AFptfK6gsceHtraOlnb26Dl5B7YKDnkz26SD+oUodP2DN7gLT4f8llGZ
	jKoaikew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WID-0000000CURc-3NGF;
	Fri, 20 Mar 2026 09:37:21 +0000
Received: from mail-ua1-f45.google.com ([209.85.222.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WIB-0000000CURI-1T4k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:37:20 +0000
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-950c26b6b05so1014638241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 02:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773999438; x=1774604238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=043aRu80oNzZpDNLQsr22bQjNBOCbJEW+dvHRdFYP0s=;
        b=kNjZFPfGDbcOO+wisU709jQrtuWQHHqjRPC1ibOovmzBsrRlDdrzbubSqGKV/wq4BL
         BS1x2IaWptXbYcTJPlClz5TilMJ2A8dy2aXb1aBkHyiztG5ITHvgFOm6+Vc61PtbT9TV
         LiwYQOo0v/NYfetwJM4m+zwPDw/3WDKGflffUQX/EkQ+Oi0tFGdhCS8VD62hM7t6Lp1l
         W5+C+mFZvFWLRN/2rzsjYeDpWdfDajCvRNGIQrktzLDGVQMXgZZnmRAOw6X0P1X+I22U
         Y1z7Xq/ywUL/LGdrWyK2asEQaYpDrWuybHUuivpizLyPAoSvcIOjWx/k0fvrA174z/nu
         iARQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR92Rt2jOZpgj4RnExsJ44LdSymCeYSH9NbypMRc+IzZgonJPbDFNILuqbIwaHNN3r3qEVd3zKowohFLHYkGJW@lists.infradead.org
X-Gm-Message-State: AOJu0YyMiTPWiHB2ZhJwbbuBdr9Z0GMgQblhL1B7iy8CdSRE52Stz5YU
	9WFYXHuW6cxJ0LbfgFUyQbKPC43R9CI0Z80v2sM1qiUnjgIbYWSnKWBRT1LShHq0CXw=
X-Gm-Gg: ATEYQzwFPa8ns8ipXJMxdHatgIfr8+f1ajBkCowRF7r3sftUZwM/+XmCztlVpil/WIm
	7ykIAjTYwMX62GvHScrat8PB0zQTCI3HUr/aqNx6mJaU4TttYLuBaf3KnRrLFtUv1nCdtKc3NG+
	tI7bddacTFGX10MkZubbUgS8WA50KOEDxPSp93j4KB/0hVRAN2O6TFR+GR4oKoajYMDpoI8fC/Y
	JvRZbhy3iQ7P2936PcN+MPE51IF/Meis9W6wmKhSlIPWtItyfYpATkCIf9106JykM3VBSLmHc48
	Zr983lcbhEbtCjnjs46Pq11DS40a/Bdrq9EwEzk2Kyb2+3S7D6blrhY26e/Zhu/KpuUBeSbIOih
	VE3FJLiOoTV3XO6vTm6FOWVHBiXuSPa553dtQU1oooO2cnBBHKbRYx9mwc1fw9exPVxD3Nu1Keg
	/HUidJMhznBRUQd88WIvt8xgoHQ+EkBWpVTnPLuHS/Ix7nB/Txm1kwT9bJJE8K
X-Received: by 2002:a05:6102:80a2:b0:5ff:bbc1:50a7 with SMTP id ada2fe7eead31-602af72b21emr1086738137.15.1773999437736;
        Fri, 20 Mar 2026 02:37:17 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af8ea547sm881585137.6.2026.03.20.02.37.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 02:37:17 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ffe41e8e83so1111691137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 02:37:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUa0nUrO0I23B7oGYmvS6pZLKbxvtq0QINIW0ZNvkqkGy2vBq2ikrux3xI54qEdeXHZ78n8hV4zDGkzXQIeeHqt@lists.infradead.org
X-Received: by 2002:a05:6102:e08:b0:5ff:ecd0:1d1f with SMTP id
 ada2fe7eead31-60295fbd13emr3475496137.19.1773999436473; Fri, 20 Mar 2026
 02:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260303132305.438657-1-ulf.hansson@linaro.org> <20260303132305.438657-10-ulf.hansson@linaro.org>
In-Reply-To: <20260303132305.438657-10-ulf.hansson@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Mar 2026 10:37:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUK+xePxZc-OXRfDmvQ1v4q5d=HQ9c9aNqUg7gPAMxUAA@mail.gmail.com>
X-Gm-Features: AaiRm53dJdS28UgcJSslHTg92ZueMj8wSzmPzodj_bB6ak0ZjTNGpHHyRikIKcw
Message-ID: <CAMuHMdUK+xePxZc-OXRfDmvQ1v4q5d=HQ9c9aNqUg7gPAMxUAA@mail.gmail.com>
Subject: Re: [PATCH 9/9] pmdomain: renesas: rmobile-sysc: Drop GENPD_FLAG_NO_STAY_ON
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_023719_394706_ACC18786 
X-CRM114-Status: GOOD (  16.72  )
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

Hi Ulf,

Thanks for your patch!

On Tue, 3 Mar 2026 at 14:23, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> Due to the new fine grained sync_state support for onecell genpd provider
> drivers, we should no longer need use the legacy behaviour. Therefore,
> let's drop GENPD_FLAG_NO_STAY_ON.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Rmobile-sysc is not a onecell provider, and thus never needed this flag.
Regardless:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

