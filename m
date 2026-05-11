Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6C3CD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 10:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNgY87VaqJb6Z7Z0eDu16xO5cNHcZbmgVwEFK0s2B6M=; b=y3sp7n+nahWtG63cBipZj8od7J
	PXO0X6dv/PgdM2TNZtyo4ThgoRdblckTMt5/mZINa50WretElSGy2JCKpSeAYQR2Umd0lQdtmEgjr
	mFloUt42deZxnGZfTP1rvvrLfN80UmFsJe1bf9UHDNPucFPEW+mzskxSGNd+bKf43ho3fiMswieXE
	ePaxWiGwOR7a9Kneh4kZCbh76gcQQqs2ZX4SSbcTc+KG4mk5giJ0BDiomLf/lWc45yDeMUp4pwsqU
	p6YySWA2efxaF4y3VYCiHqX/FFvGQ5lSyBB/68ahyBNcB5XYpZcl45UKLElKcmp53OWeO2o+NvrLF
	3JWlcwBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOK1-0000000DCXA-1FDP;
	Mon, 11 May 2026 10:57:13 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOJx-0000000DCWL-3Ad0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 10:57:11 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5a62f43b76aso3549302e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 03:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778497027; cv=none;
        d=google.com; s=arc-20240605;
        b=NYaB1HgsdaHFbFB4esXKeAD68KWvBW6vAmI5Ks18x66hx1n8q/tAPkcPrATz9uaDwK
         GhknTGEYp4T3lIoh6XWBzLPfwRKwVD8diwaOY2JS01M2fwk4CzJfvqm/uLSmmFMrDELP
         oQnxNOQsXevYPNK2YwssruY4UjTi/0R4CAf3KfKqSmspxCTCgXrMc8naURsguV7UK/vs
         nu6z5h0PBIj93QW/uoCDVcsmNOESK+3d1jBpy8OxfVlaY8k/sdnpxf9102Bg3wuWbzdO
         aT1HCZtZdfURzMJsdXa+ajwZzMuDP0zW8uT6LaDZqH3RcxVoVG0XZBvgv9KAb7M/Op53
         748w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UNgY87VaqJb6Z7Z0eDu16xO5cNHcZbmgVwEFK0s2B6M=;
        fh=bZRUQz01DD/AhqtZmky5ZeBcFjYsdaLeF6Yveifo28g=;
        b=hffFiSiLzb3PHOq7jpBhev1W438HUT5TQKy4fZgqCTqlqsl+rsZV/1gx0OMCnpUl/Y
         KX1o4WzhyL5OnZaml52BtL9K80mf7+SPsR9pSi5vPq+zBS5WS31bntWWUM69l03ay/na
         RowoBfWIMvgoUCkzO08gRyfJok1k8sKKBVP2zEGCLh+2WkQmKAhi8j5ZMsQ9sGIw/S16
         5lzNg/JjsQ0VJcDSFkBUyiZkOSaeE1YFz1K+7w3irqFqWwkMTu7j7z12yuTai5Vi65md
         Jki1yKzl/tZYB44dB2zS956xSwO8SzLB9+V/nMLnUQjglebZ/HwBQPTxvghRQXaGP2tl
         Sq3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778497027; x=1779101827; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UNgY87VaqJb6Z7Z0eDu16xO5cNHcZbmgVwEFK0s2B6M=;
        b=g0MVkOjcQj8WTOIKovtn4JbtR46Nckrnct0d2W0vlqCwwhfGreb7Tt4ilcNvFlv9op
         agXRREyFuOJlJ6OHPyI0y2HPVqhfSP4Q/9XI5bkPmx6jufi+nPgXVWpdwPqltbLOqmM6
         l1Chpz45clxuxQrQWxrFKV83fA09vcUe/Sv3Epszbc9P+RjeM5H4UkDCixdegN+OiZ9x
         2SbBcSDY0gE/zorzthaEj0cOiZZRi2D7Db5C9wZHchRXEiPQ9DgRw//3m5FDuG4g5By2
         KUiwXGlXj3+BSAdmZiaF0j0cntYY2ZuFBBaVQnBLHSenHjbfxU/ZFTZMrn9h5ZqE6xMN
         4fTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497027; x=1779101827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNgY87VaqJb6Z7Z0eDu16xO5cNHcZbmgVwEFK0s2B6M=;
        b=VWWpfy0jeEqjhfJ6o7mKz3a4Rc5bPXOgyhdIWE5tV01rc2jnVDjhHlvHsFTDfO3x2h
         brEFct2wjn06QbUJzH81GOh4abZ2pt3bLNpnlvQ1htbv9nbzX5qENc6X+QunizlVQ/cH
         GQ1IAZ0Oimax30ZGVijjXrgbRR7sqFKpE7oCOtUPt+ga7Ab0a0NP1zDb+7K1NbROJKs8
         XpN6CHa8HX8Qo8L6T/5k9Z08lu/1LUbu7s5lwvErNAEOXU9WDOlkIu8+L2W9MyOhUMj5
         yj8zODA6OAG+addaDHYWEVLVXisxRPZcuXtI12K0hxWRtMCw6FVQJgwlzVZPLF5bw0eX
         c92A==
X-Forwarded-Encrypted: i=1; AFNElJ8RMTkI8amWldfp9IUFlgImUQ96uLO5hHeE0cSpZjeOQ3hT4Ie31GV4+Muwm4ZXlFefV8Zh1zOQZVtL7oEqrqbH@lists.infradead.org
X-Gm-Message-State: AOJu0YygCKgIswzp4DiROUo12gyM/fhl4GXA0SFWq1EkuAkrXGja3K+G
	Pjujl2g7BeUAv2qT/1P5Bpcg2XL0yAw6iI0AyN1k2FEAMhXWqiExkC2wEzKbsG7yDaPJaJmccrK
	XT1D65wCeoofi2+nwUI7+LnjqN3yAvwOuqO60xfaVQg==
X-Gm-Gg: Acq92OFBJbYKcnnSStX9RKTxlJG+NgxsHauRRfLMOeQPST5SS3e0GztNHY27LdUV5Yg
	dr9zl+k8VT92U8YE51UN7E2I+wQCZmfvsvxM/b2AcqwGc0fFVZrfSS2/DMQB2h4shkdUb7m46Ni
	qRWlfTFeoW27a0I1jhXLQnOBcg+Xt196fDVZZEBZgynJGcfajQWY8r94qwd3RJbGqwXLlgYoRl3
	noPCcPhrJqU68XJSWaIuBLpzjEMuFvxWpGRSCiPv/8mXV6KxUFh08SxCUzX2VXE3X+YTgyCQE8u
	gtlXkhiUdTMy43UEV1H00IEaZNUHig==
X-Received: by 2002:a05:6512:3b97:b0:5a8:837b:3d62 with SMTP id
 2adb3069b0e04-5a887ae201amr7135423e87.9.1778497027226; Mon, 11 May 2026
 03:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
In-Reply-To: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 12:56:30 +0200
X-Gm-Features: AVHnY4K5Fa8XIOuKEc9fwP0nNsU7-2i8Jr2vSBdRJyGo1uaG2J7xzeVbIFlyyOo
Message-ID: <CAPDyKFr4TdLP825VrpC+gELKOnHHFK=oZ7x8HWQaKFox8Ur0Tg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pmdomain: core: add support for domain hierarchies
 in DT
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_035709_922530_4E0F4ADF 
X-CRM114-Status: GOOD (  25.21  )
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

On Tue, 21 Apr 2026 at 01:51, Kevin Hilman (TI) <khilman@baylibre.com> wrote:
>
> Currently, PM domains can only support hierarchy for simple
> providers (e.g. ones with #power-domain-cells = 0).
>
> Add support for oncell providers as well by adding a new property
> `power-domains-child-ids` to describe the parent/child relationship.
>
> Also adds the first user of the new API: the Arm SCMI PM domain driver.
>
> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> ---
> Changes in v3:
> - cleanup return codes for add_child_ids()
>   - < 0: error
>   - zero means no child domains present
>   - > 0: number of child domains added
> - arm_scmi: adopt to new return codes (only <0 is an error)
> - Link to v2: https://patch.msgid.link/20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com

The v3 series applied for next, thanks!

Kind regards
Uffe

>
> Changes compared to initial RFC[2]
> - dropped RFC
> - rewrote the parse/add function to use iterators/helpers from of.h
> - add a remove function for cleanup
> - use child domain language instead of subdomain
>
> This idea was previously discussed on the arm-scmi mailing list[1]
> where this approach was proposed by Ulf, and then an initial RFC[2]
> implementation was made.  From there, it was suggested by Rob[3] to
> use a nexus node map instead, which led to several more versions
> attempting to implement that, culminating in v5[4], where Rob and
> Geert then had second thoughts about the power-domain-map approach.
>
> Therefore, I've gone back to the approach in the initial RFC[2] to use
> the child-ids approach.
>
> [1] https://lore.kernel.org/arm-scmi/CAPDyKFo_P129sVirHHYjOQT+QUmpymcRJme9obzKJeRgO7B-1A@mail.gmail.com/
> [2] https://lore.kernel.org/all/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com/
> [3] https://lore.kernel.org/all/20250528203532.GA704342-robh@kernel.org/
> [4] https://lore.kernel.org/r/20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com
>
> Changes in v2:
> - dt-bindings: fix warinings from make dt_binding_check
> - scmi_pm_domain: switch to dev_err()
> - pmdomain: core: fix locking around add/remove domains
> - pmdomain: error unwind if any children fail to be added
> - pmdomain: fix node reference leak
> - pmdomain: ensure power-domains and child-ids properties are same
>   length before iterating
> - Link to v1: https://patch.msgid.link/20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com
>
> ---
> Kevin Hilman (TI) (3):
>       dt-bindings: power: Add power-domains-child-ids property
>       pmdomain: core: add support for power-domains-child-ids
>       pmdomain: arm_scmi: add support for domain hierarchies
>
>  Documentation/devicetree/bindings/power/power-domain.yaml |  34 ++++++++++++++++++++++++++++++++++
>  drivers/pmdomain/arm/scmi_pm_domain.c                     |  14 +++++++++++++-
>  drivers/pmdomain/core.c                                   | 167 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_domain.h                                 |  16 ++++++++++++++++
>  4 files changed, 230 insertions(+), 1 deletion(-)
> ---
> base-commit: f7b88edb52c8dd01b7e576390d658ae6eef0e134
> change-id: 20260310-topic-lpm-pmdomain-child-ids-e3d57ae57040
>
> Best regards,
> --
> Kevin Hilman (TI) <khilman@baylibre.com>
>

