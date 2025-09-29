Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841DBCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wo+c49wamlH5OIn4NEbxEDOQ99erhVXBTj7EjS/boc=; b=UuaaDcTfx07O4OYe59T5jr8rR5
	GbDg0vN0aev18mSiRqaBduemEJqd3ffN6rUCQhQD5tlGsjM6Wv8rL3J+0wjAGjuHoCm7DFkoDUtYi
	X7nNyB9+LsRbVBSTDxuve52IkoLuVxeoPRjwRMcc7U1LZptlJaZy3Wd5ukM41D/0O/rrZxiJPwc9W
	rwv2j1FJ4XVPYZafcOrwS8cm1B5gtVOlUHBzVje76pbmFZZxGqhHAEnyrgANkpQErTlCJv2pLYFWs
	OAE++d7a58jJRlglSOBcjm8KkMAh6h18HwXaVzd9AqFn8Wn/O5mWs/ti5i0ZQLPcygQTxRGpsfRrY
	P8cVmciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CB3-00000002LvB-1ORa;
	Mon, 29 Sep 2025 11:36:21 +0000
Received: from mail-ua1-f41.google.com ([209.85.222.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CB1-00000002LuJ-1QTy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:36:20 +0000
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8e401b11bfaso1340583241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145778; x=1759750578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wo+c49wamlH5OIn4NEbxEDOQ99erhVXBTj7EjS/boc=;
        b=K13jUmSqFn7+RH1paQ/vaYtTimvn00Y90aY2wwXWXPAwxKhpPBtKU+4CRfwymL7BTf
         uOQKArjKo3t5+0fV6cRwW2bGK1CfXYJlKCyVDYjZGoul12eLPqdWqHZXvWQVYKehJMnX
         2ED5pmoHy1SJhJ3YwnYCbMbcRMy/wB8TKmkOJDig7Ql+TS9Atoetu4vTwxSwD3uhqt2w
         V6TgEoCEXpFTxp7szXcgSOldddQaTyHU3gQitvWvPqrFXHqLIhx1dLHaTQ3K3hud3l2o
         df6zZ1+uOimdyTFMdUloi+8VhdDomXTNG+gXfxnPsg/fsfgb/qFM/t3hQ1RD376Ijk8m
         RtRg==
X-Forwarded-Encrypted: i=1; AJvYcCU90bGr7Qz81NmpQ1A9DcFRjmb2Gs7A2oljSKs8oRXsd/hkksvIsMgosXpNS7G6vWLNGtQ4bYU3ZASQ1TfrTo2t@lists.infradead.org
X-Gm-Message-State: AOJu0Yys88xgR1cBy45R95jh+PPwtoE34LmEAl2CZ4HuQ4YuNvj2XhU+
	70DVbTcyM1ogEcT8wP1gV2e83t/qOQgxkRbWCvj3CJeSqZMZ6VYD4/aB+Nl5w82l
X-Gm-Gg: ASbGncvTFgV37qPnYJ0WyJdnyTC4+aRaZfTfS8UfussKEnA2M0WMJZ/nEHuKCF/3OKW
	OJfQKHA1roHG987zbHE481YrAdme30cXLoGbtXasWvFcWEuW9NUtYQof5IsZbfJusX9iq7omqqp
	VeAhO53yKS6DyjikskDwMVDVBbP++g9x+057CFFp+lKEqxcFRfbOXLYHwLc0zn2Y+mwB8qXmbHm
	rlFi2gePLBlwc2U5VktfKevtP1iq7Epa29u6VdmunRQ3sSoLa36V1ebtwmOfa+ENVKzSrfHi35z
	6OEFSAg9WwBrrk06u/UMYWHlbSN6FNaFY/arQZ00j55gM5ocK7Vo18EEtO5vRsGjn/UViZAEngQ
	3KIjXurvs4coHrzunAXZL78GDQxcUs2bKieH8/1hV5YyS/lZL4STixfLtKYnpUcZwEBjvmjyVmR
	y9IauoOA==
X-Google-Smtp-Source: AGHT+IHHaLdzYmSkcn255sQqTxDBtGrZ2S3nipnxjwgCvvtcqzwpHbNtoLgiQd0bbBy9sWGk/j4TZw==
X-Received: by 2002:a05:6102:f08:b0:59d:6be4:5b87 with SMTP id ada2fe7eead31-5acc623f633mr6330986137.12.1759145778000;
        Mon, 29 Sep 2025 04:36:18 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916d2948cb7sm2350148241.9.2025.09.29.04.36.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 04:36:17 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5c72dce3201so467181137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:36:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWAkEWDwGO6ktGyW+D/pCubpCqvwfL401dphTuZ/W0HLrRYfBgmIGd7VzuZS7GI+a8VwwSxnHW/xR5IMPHGVBFx@lists.infradead.org
X-Received: by 2002:a05:6102:38d0:b0:536:7bfa:22d7 with SMTP id
 ada2fe7eead31-5accd215f1dmr5953694137.18.1759145777154; Mon, 29 Sep 2025
 04:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250917170202.197929-1-john.madieu.xa@bp.renesas.com> <20250917170202.197929-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250917170202.197929-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 13:36:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfZG=FEMesgTz=q4agJ0huMPFe+gsvX+8-zmKBup-Feg@mail.gmail.com>
X-Gm-Features: AS18NWA4k5X5kIR9EAR4SmDXTePu3QOZUfbdTpezmeEEx4rSxAt1uKChq-x8rPA
Message-ID: <CAMuHMdUfZG=FEMesgTz=q4agJ0huMPFe+gsvX+8-zmKBup-Feg@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] arm64: defconfig: Enable the Renesas RZ/G3E
 thermal driver
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, daniel.lezcano@linaro.org, krzk+dt@kernel.org, 
	lukasz.luba@arm.com, magnus.damm@gmail.com, mturquette@baylibre.com, 
	robh@kernel.org, rui.zhang@intel.com, sboyd@kernel.org, will@kernel.org, 
	biju.das.jz@bp.renesas.com, catalin.marinas@arm.com, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	p.zabel@pengutronix.de, rafael@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_043619_378546_EA51806F 
X-CRM114-Status: GOOD (  16.89  )
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

On Wed, 17 Sept 2025 at 19:03, John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> Enable the Renesas RZ/G3E thermal driver, as used on the Renesas
> RZ/G3E SMARC EVK board.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

