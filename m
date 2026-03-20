Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A51D108B8E1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15qRFIauJbZWIOHfsFfMNQAVUG61meAdvRvs8zItI0I=; b=wxcGFY3UBj96yawa8GPAAvhNop
	tWvLu3Cw1iDSuy2/HbtzzfHnU8kw9BfEsFTZtTOYay06AlZfbjPV1iP7LbG+HSbDZMoJkhsEjmscN
	E+fceY8DFq9NbTuJ6IvnM2iDkrudhd5IbKRMO7VmaLoFoyBINLs9PrbwAaSuwXliwBwnncVgkYaFz
	WAKxkDq/u3QXk/YstQrCGBmLd51aUeio9WulTPutbsdoTlfgEfZy39lApa8KztS5Qxlx+lEHnOdDa
	4Rd1OoBlPHQbr9k2VkcHU0gkA3oIdJcZF6HPkTwILtIGdCiYBWUZKHZkaTCNdCHVGhckmlArnecBR
	zg80U5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WLJ-0000000CV0T-1UD3;
	Fri, 20 Mar 2026 09:40:33 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WLC-0000000CUzT-1UCl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:40:32 +0000
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d7ebe11bffso486611a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 02:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773999625; x=1774604425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15qRFIauJbZWIOHfsFfMNQAVUG61meAdvRvs8zItI0I=;
        b=rzAQxN4m+GklQ4noteLeM6y4cVMvsS056cnAsu3avIfuWh5heBjhfK95iK5MCd5DEf
         PitGkisxfB5hWfbRdmPziO1pWL4j/EX6SV4chBagbUUyr89Inp0FhfCD3g+gnBKX/7PQ
         gPhFq8FTnzir0SUGJvT6twMn5e1GzCyVa57cqBMrNrZf0QmlaVNQtjN2c0FawT5iTydA
         sxJRCVGlnUJqZj4tOHOam5Aw0tAb+8DXgiyBjVESu93JT64JUUMEWjg+3vFmvVy5HMGA
         nlKnvL5pm5KOJI0JI+DQAGyO2P7RLQvau0djujhvFhMKJ/v49Csg+xLUK/Z59hmkuZ48
         5/RA==
X-Forwarded-Encrypted: i=1; AJvYcCVXzwv+YiGktcAhFvjSywoVvo9+tAluTdVJ5H3/e16hw3Lo2I5BbnqP3DTW6OaAub6k1iSiPu08A/YB9no4x6ZO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8UqYjM69zLAxHsLvGqDsCt5DJkma3t6NEW4/7MkX5hoBCUsiY
	ShSZpVuRmWSgUhXspyKcisyPKqLx2krITxmNP8cO9oyoO/lGU7TtVshnXR9Ek+1NKgw=
X-Gm-Gg: ATEYQzypLShQgM8pyvAYG1KkSm3LrD4s9tVLAngcQWBJjdhRwLlORQhl5tAtiF7RFOd
	zvWuuDN/Zx4j8hdC+rZpwA7LI+iQubk3gOkE0AsmcIUoUvkJj7BlEpb78qBCCSSf2dXye+oeV/4
	7IzcPraknC9vY6ujzwuG5FoRNagnqvzPK61UUPitK5OugJpyTHvSLlpMaRVsoZtwGw3iA5AvBQx
	nEiR8GOY25cEGtpUTQAEg40FOOCDBHLcLGnda5wpvZatONglHjdFfrM12dAP3z8GDvC5W6YOt2M
	+nZKcJYIgw8vYQfncPKATWVgyqdRNqoI+u5nbaNninwDgwp9/7skQ2Y+LGP29/fIsTGqPlVdtaT
	NMMweIkfyi6vt6kuTc4+90FXDo9Mx0IntJtW18IVNtY36upSh6hdcCr6+vLYEn/Egj4j+zUW2/J
	0FVdVs78cPg0Lp0vb+XnA+Sud0DOEO/d6Yq9niRU4xVAYhX7s30o0BqTT8lsfJ
X-Received: by 2002:a05:6830:6adc:b0:7d7:d217:5116 with SMTP id 46e09a7af769-7d7eaf5a367mr1564260a34.17.1773999625200;
        Fri, 20 Mar 2026 02:40:25 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7eae5d60csm1746193a34.25.2026.03.20.02.40.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 02:40:25 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d75371d873so451837a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 02:40:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSFSXprQ5D00oj9zK/M38FNMWe62Zw1/sqHWqginmNhCA3mCgiqnkyRqRP36FETUvoZB3Al1BcyF4WtRl0srFc@lists.infradead.org
X-Received: by 2002:a05:6102:304c:b0:602:ac40:96b3 with SMTP id
 ada2fe7eead31-602aed11942mr1079634137.26.1773999125034; Fri, 20 Mar 2026
 02:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260303132305.438657-1-ulf.hansson@linaro.org> <20260303132305.438657-9-ulf.hansson@linaro.org>
In-Reply-To: <20260303132305.438657-9-ulf.hansson@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Mar 2026 10:31:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV6-QJiLBfV6zuFndz7cFUgPCEH1VP6OCdKOgbewK8DcA@mail.gmail.com>
X-Gm-Features: AaiRm53FivaU7oSnu_R918Q1YM4DLUxcMTOVOIPw0jl1Lb0otoe9R2-7ObHqWwE
Message-ID: <CAMuHMdV6-QJiLBfV6zuFndz7cFUgPCEH1VP6OCdKOgbewK8DcA@mail.gmail.com>
Subject: Re: [PATCH 8/9] pmdomain: renesas: rcar-sysc: Drop GENPD_FLAG_NO_STAY_ON
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
X-CRM114-CacheID: sfid-20260320_024031_266578_6B8BB774 
X-CRM114-Status: GOOD (  16.48  )
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

On Tue, 3 Mar 2026 at 14:23, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> Due to the new fine grained sync_state support for onecell genpd provider
> drivers, we should no longer need use the legacy behaviour. Therefore,
> let's drop GENPD_FLAG_NO_STAY_ON.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

