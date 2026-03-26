Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF902109E54B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 06:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9g2AAnC8qe/prRU7Bfg3yafNhzAQNHPWxAghNJRhpo=; b=GDypyCXWTW6KOOdMTM+Js9hWlk
	Xy4nPYORHvSwRHtFwLj/jW+VxdyOpLJs/6oXgN7dIY2htTjmma46iL4S25NfJVOPi+fDTo5kKvGK4
	6V+w6E8pjRyTMdWb5pQlNHnghyOeokVoknIQDYXpcwtHnQlcRiafpFEKoFduMcaFvG1DrVbSjmaZC
	dCTJCnMnB/ObvPrhj17KghKAkv7q21VVI+xCGodnpfZ3yxla3p4XR1cEzw1yziaElsnRThcSTards
	O60e3aG+YwEpfRc6zOa3Jrt2cUSOtcYeMWMQYRnufJJekXVmejIYQqJ9l/30QL2KvL+SiJxfWs8Xg
	mN2kfQsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eLg-00000004r8N-3Mnn;
	Thu, 26 Mar 2026 06:37:44 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eLX-00000004r6g-3TDG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 06:37:43 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5a12c19affeso846983e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 23:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774507053; cv=none;
        d=google.com; s=arc-20240605;
        b=C++kClxynSCltpfNcIcwoGj7a923fKmMax9SBKYH2s7gFj4QyB4FTVi41jtqwDfMkV
         NNUttzD89Af8teN7YE4/nvSlEgk7X5WCtQc7ABm7VBfqCZ0f8hWIeJofAVuebbyRPLLt
         n6cjZ4pAgqpQjJYSy/VOlKJpFrEm6tJqwILUZ8kwlr22WYcoSs884wCSXiPtRXDVYQTq
         uLnK/BBoKpfg1IAotMvrgu4BH09/9F/oF9L43uUv9SBhDuTgHCU1Kii4kttTgQAptAZf
         PFcdOWw2GVdgYtYnHvRVK+/UeCs7hZIW6saUginqHepAhHa7plRh2beaRMnq1D/1PqN6
         qFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k9g2AAnC8qe/prRU7Bfg3yafNhzAQNHPWxAghNJRhpo=;
        fh=3O6Vun5w/xNmJxut9mEkYFBf5uzfFubZl47gpxMSoTg=;
        b=J/fnkeAMjiWMyg0ClE0sbDlK15EJFBZ/ARNMxvaZh4sg94VwEyMjR6M/y5TdEstt/v
         seQIU7KzUxC/sQUDSapl+8HG/cJ/zMl28Mh+QAXhydKzXNuWgHHMqusoYYMLHVgxulL6
         1GvYBXqjUrBkaGQvlTtlP7zzsUuXTmNPZbO8sOGGNzNCbgVcxXl0fE5a68ducRKTUCM7
         0LRjZVbvjvP7c5lI+bKfbPTMm6vw+P67++RzldfYMh8i43Z9AJ2WYq8vJAVa5h1FiroP
         7reFQzJxka+L2ZRXFbNj5XPsuScGTkRIJGIThgFOdYBPhxv3gVgnPvm7hHDqIua/n1pZ
         7Buw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774507053; x=1775111853; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9g2AAnC8qe/prRU7Bfg3yafNhzAQNHPWxAghNJRhpo=;
        b=Zr+NUrxv7MUeZtcMsGoBuGf15fTu/ODJP2eeb6Z6h6Shkq5l/RfqM/2jKi8eYmiIh3
         2hlDkR+v6sbyzyGWN0/6jjA5+iAKUqi3kblICMdjvgwoGIs78qW1yStgYG5/EcoG4Z9z
         FI3Sl/Osj5+kWCnhuVVVUj9S7GKCpN2/RXquw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774507053; x=1775111853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k9g2AAnC8qe/prRU7Bfg3yafNhzAQNHPWxAghNJRhpo=;
        b=n391DD9bE1nV0P0UxqXqOXNQYkld7Mryu1X7S53qRSn6RyQFo4X9zC/dZoY1OjzqYD
         a7OBz7l0d6oJN/6DsuYgt0iQSzkMfdEcHWSprMgofS9lUkYi3pIYOQ0mudga7H7Jo6Z8
         cs3h548lCfHa4MUSZlCXF5WfAXHBqJPeN7JTA4OdvUfXz+8ut4izYUvln8uOaRZpurzF
         a+jCk4x1TwKI86XVfkRcVbHb0drNKuwlsAEKW1JWncPyOQv8/L3G23dvx1MSM6/inEx1
         bY+SpyCLC91ugCk2qTeZf3FZIP4BuEaWp2MpheEK73OdfNM887ZsC28c6KS6ciu54V4x
         W6SA==
X-Forwarded-Encrypted: i=1; AJvYcCUljc3kUHe2liRrTe1zIAcwIVMwJntTs4HMn7y/ZscEetKbjKkO9rkPUgObr3NMWSe7vNxS5YNqJ8Rqx5WaAbqp@lists.infradead.org
X-Gm-Message-State: AOJu0YxKd7t5EHKQ3+VfF56F5kXI98v26tdeSxTRQUgQowl6Zy669jUV
	j/vjNxhEuJ9dCZCq1eMwx3ynJc3JqG2i25BIAyI0+gmdoGBja/9F35uBbtZEyXN6PDoI/oOVXYs
	Uh8eWb5Qe6jhTkDQYdkjVPRjkKO7xgpvUiYh14Nxb
X-Gm-Gg: ATEYQzwX6R67HpiX75wTfiAnozO9CYpQiV4N8XcErWnBYCvKjVvOdjmBMD3en87o/JW
	bRhvzmvsmsl51+sOmWEeok+006z41cKPgVwbSMQHwS95riaXEOI7TYvw32yiOz0L1I5U4HOtjrU
	Ai0VwnvRTcLL0mTZuLIS5H14xPpaoDS9KCk/q4WXnX0nsR368tuw9yKkENklcDyVS/irHv1mbFh
	eTER3wk7xjnwmcix/lVhU526lwb8+9jq05EhYQWvqUefajZ/3hjhbXQ2hYxQ8XhQ7CFpUUTMuUo
	RnU5owObw/Eo4pk7aixHt+z2iqeYDf7FDQmf/Q==
X-Received: by 2002:a05:6512:3f05:b0:5a1:2e7b:d885 with SMTP id
 2adb3069b0e04-5a2a50927f7mr203717e87.25.1774507053537; Wed, 25 Mar 2026
 23:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774499536.git.daniel@makrotopia.org> <65e504ac2c2d19b4baba6b79a241788220b19b34.1774499536.git.daniel@makrotopia.org>
In-Reply-To: <65e504ac2c2d19b4baba6b79a241788220b19b34.1774499536.git.daniel@makrotopia.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Mar 2026 14:37:22 +0800
X-Gm-Features: AQROBzCCmaG_qIJQfQe8KdYGB1bTw6MFFgF3aMq79sEp0x0VqbdbLLlRtaaQZUY
Message-ID: <CAGXv+5H2GdeEVf56apai56Ak3-b75DEK89S7SJgMO9YK5S3y=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: mediatek: add MUX_CLR_SET macro
To: Daniel Golle <daniel@makrotopia.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Laura Nao <laura.nao@collabora.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Sam Shih <sam.shih@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_233740_290656_D0B48B05 
X-CRM114-Status: GOOD (  11.15  )
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

On Thu, Mar 26, 2026 at 1:09=E2=80=AFPM Daniel Golle <daniel@makrotopia.org=
> wrote:
>
> Some MediaTek SoCs (e.g. MT7988) define infra muxes that have neither
> a clock gate nor an update register.
>
> Add a MUX_CLR_SET convenience macro that takes only the mux register
> offsets, bit shift, and width, hardcoding upd_ofs =3D 0 and
> upd_shift =3D -1 so callers cannot accidentally pass bogus sentinel
> values to wrongly-typed fields.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

