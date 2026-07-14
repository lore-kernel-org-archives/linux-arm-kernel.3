Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03D1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uRkmkcj8gU8t5BfL4dxR5CXZJKYqNcUVTUFN6VquLA=; b=TiEJXIwHEZl9Q07tcZIY0N+xZu
	VakKlffwtgeG6LYnd72+H78+qkmMy5Es729/SEHjE5EZWqfH61bhbs8ngGDcw3vlHSrNG3fBxN9rH
	jxMKn9PTorclUeODm4JAR1o4qQ2BgieZ1o3ACjMK3AXo8JdCHJCI0OoGYYmbINOM+sXwX6xTtodYl
	it0Z2V79sxCsjaBbAp3FgzhV1XrYD3bEdMIF1GxEyP+UXbVljAkUdB+Pqu010n/K7qz6MqtSm8Wox
	LtSjpjejLzjC42FKPU8S3jVklYzh/wL6aAExfedVSHZ6jp9AyJmjN/m20i5+Di+pWlgEoF5LYyqjZ
	Tsc2grnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVRr-0000000AuuI-1gij;
	Tue, 14 Jul 2026 05:12:51 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVRo-0000000Autd-2rdY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:12:50 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c7c61b5292so7774075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 22:12:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784005967; cv=none;
        d=google.com; s=arc-20260327;
        b=cLoV8Yb9SWv5v9x5h4jCVnhG1r2Q4Pxnr5tVxsXP8fJL/Ax/qgn1NTEe80mT8KxTLR
         /yK3i9zx3v2NDwb1szg+v9mZOJL9DRmLNUx0WO2AXI/Pd64ROEaAFjy6wCBIileZ+2w9
         ajIP6uYrgQenkbbNZuorBFeGhBBiLwFsRW5Nk4XkGZU0MSTLqBceNQfpd/nZuqTUJuDO
         02iCZL1r3qWSd+QRDDrRGOLXXA31EqCi7mo2uNeekZW+iakgGdancGPm/08LoKAuwNlz
         0zJgT7dnTery7lVsemb1ObXUFnbO8lC45Pd3iqQ1YUCpiA8CdRe0qqGz29VwTrrF7L8v
         J7fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/uRkmkcj8gU8t5BfL4dxR5CXZJKYqNcUVTUFN6VquLA=;
        fh=F4KazNLTsEhrF4PQEBuNHjxFaaDvmEkJUndOvScc2uo=;
        b=XxIRwuxGXJyt4XHKLe9Fmpx6ZM5rlU57NNo3NGKB2HolH7n+yl6ozl1yNLWGbsL8Q2
         YY6P2vXGxRzWOSbQg9Kr9LS5OU3iAxC/U2VCemH+87MLToeBSxh2PBzPUxTdMCxCmyqY
         QxJebX/HgzrRepTxJiWB/QmNsuN/iw7zKvacPJv/5egQFGVQ5FJttX6hYdJgGMqTprIx
         OLcem5ZmDHUDLuwkeGgxDzRDUSWWUtbRCz/CxsFL4UAIjBdiY95ZYs7vB9GXHYdhnYFe
         w5BASKvBf39QdtU9592TvsWZsCPusw7C81A4IOD28YIRRw3hc+eyE6bI9xmwmYIPo27Z
         yHsQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1784005967; x=1784610767; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/uRkmkcj8gU8t5BfL4dxR5CXZJKYqNcUVTUFN6VquLA=;
        b=iGVftMIr+tTBYN2du5/fLRRhdz/nECJdHhpQxlahfo/p8lNu569ggeJTub1nRXNnH/
         cHzhrdUHy5Jw9wf6rrtXOR1JVHYNcASMefexy+dNGThDzlsdxkvKdv8CCbJSMfg5BhKT
         3zHH+P7iEO3ga9iE8efAAThGFRvJEclHUU9HQ4mKGzeC1BpWrfJf7iFZmmecZYKC8AKJ
         8jpl7GMZurTVU0pND2cDoDwHn7HOVSb4ovGBJU6Mdbb+aEU3sEdFHWbgqwCbC/xDmGtK
         SUc6/nEV94W9pcB05gaC01GjXfgZTrnLomcom/rhpDYc01WdYO/AK/LZmaJiYYdG1PzB
         OPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005967; x=1784610767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uRkmkcj8gU8t5BfL4dxR5CXZJKYqNcUVTUFN6VquLA=;
        b=dCEXovOZ4+p91l4Wak0GaAMQfSNjKmqA+M1WlVPr8I9hIwykzIOsGy7KbVkQGwbN32
         IUjHxBYh4MLC/inKdiXj87UVKK9tg27RVdTifmRizsViToZlF72SSNmPU750iKYCC/YY
         /oyU7xXW65PWm8IgtRIaCviebIOcsNlAe8sKsG3TL+CQlAAxFO6QO2eEDAc52sCgwGkG
         JuLuIfkCSQoji05CTglorwJsaqx9SIdDSQQYleULaztIFF69AEOSdG2JRARkS83eNas5
         FxmBldp5fm94oSoFQaUxYt3J/Nl1HIVA0eLiHFrGy4lsYrj1x0YW9GDWb6YXi4wv8Fes
         2wSQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbpMddpd+qxt9q9YnQv5X0MM6TSrZraDWsDKpdASaBer87hI5VZOcW3QOtYIYv6BU+oouklIT0WuXtqzYZgRpd@lists.infradead.org
X-Gm-Message-State: AOJu0YwYEeIJHdg9axkIdh5NHRqOZ2C5O++QEeBGZ9bsT80mZxZvZrDK
	J8li0gqiw1PQ8FouAHa2JIplJQsz13AWQThMW4hrWwPwBTfWpNPxy7PkCo0esCHlKSdYxSXbffL
	tnSSFAcCITpvFgGzZaT9E+SInnoBgcMs=
X-Gm-Gg: AfdE7ckAeHUwfxLO6L/idHh9ZNrzuRZOUVaMNE0HObR6/DfU5/knzykldrQDb/Fcr3D
	wnxjEwxEo6YtOMQuofPvc9iAAeFcbez7Lt0jdDEQgBZClD78mLpTZy7gYimc1NU618oseg9cRcj
	XGtu59TU0QxRtE01f5LUiRsUtGJDFQ51OeW5xKTTuqe133kEq9l9kVf4yedhd4rlvEo+iDemtDE
	MPOtaOrxDhzPhCWV3qmc6xjsGPOvZs/mk34LjHkjgXFHFfgx/W7bjlbTqXcWZe2ZDUwSVGfN8Px
	J74PNUJuBBmiF1m+9sUp4DnEZgWW+g==
X-Received: by 2002:a17:903:198e:b0:2ca:d31e:ac50 with SMTP id
 d9443c01a7336-2ce9e99f4e8mr126780235ad.17.1784005967396; Mon, 13 Jul 2026
 22:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783977550.git.sean@mess.org> <b1ba67cf06df907bb1e25dd13554fb72f2ee09d8.1783977550.git.sean@mess.org>
In-Reply-To: <b1ba67cf06df907bb1e25dd13554fb72f2ee09d8.1783977550.git.sean@mess.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 14 Jul 2026 07:12:36 +0200
X-Gm-Features: AUfX_mx73l8ozq7YHB6NRGb7mR2H4Zdd5n4XL3gFzVk0yaPWxB0D4BDTcsu54Og
Message-ID: <CAFBinCBqhBXuMdx0JaAhe9B+z6xEX8eSaT4HbDEHq+FpRLH-cw@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] media: meson-ir-tx: Ensure probe error is propagated
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Viktor Prutyanov <viktor.prutyanov@phystech.edu>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_221248_727968_03DB2A8D 
X-CRM114-Status: UNSURE (   9.62  )
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

On Mon, Jul 13, 2026 at 11:31=E2=80=AFPM Sean Young <sean@mess.org> wrote:
>
> devm_clk_get_enabled() may return -EPROBE_DEFER which needs to be
> propagated else the probe will not be deferred, it will fail instead.
>
> Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
> Signed-off-by: Sean Young <sean@mess.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thank you for including this one!

