Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36D7C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D77DzhDZ72+rZ/B0lquPWAieMQAEtWanQKfhdNjgaGs=; b=QwEe1NXEMAsbPoCbRLp7WmGzED
	Zj1XGycbXyilD/IrBjNeSJh3+kUcs4wkAnyOvMPFXs1ewP/yy2TD2X8jF4epMsm3FUAGOdXtBKIeq
	zpivG8YvzPlquGnc3/2nBN5uUwz7+OctlJCYx+S38X0wy2Q3tdnaLvldamtP2J+hQm/1DyPc1WGAn
	1Znb0oRvCAYttm4Ywxmtb2rKIK03V8lihUjsBELpYOv3eAnJNBNmjg+uwP/AlrZ5DLR05+oAQhA3q
	xbabUuaE8VVS9d2OfgS22Tk//bVLvfRXEqHuDBHocFTSm2S8g8WW51oCA+iRKWvLWNBdQ4fCqKtrs
	1ajWeSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UHb-00000006xwF-0P3y;
	Tue, 15 Sep 2026 14:37:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UHZ-00000006xvg-1eI7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 14:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=D77DzhDZ72+rZ/B0lquPWAieMQAEtWanQKfhdNjgaGs=; b=q7tEqQNveVJ585E/8Rq6XIHVC8
	CSiXLtRw9li5ZDLVyiZgRXr6nIhQI0YdNKvmYZuEU0q3D3DPBQN5MUDUy4fxToVtvAUPbP4M2+prY
	EDLTpl2TxB/O2io/J0Jov0Enu27QutuexhSaR1CIdk5X5NHmFh5WCjwq5SpXr85FqVq3E9xvXjjZa
	vSihkP+Qj/8hk1++cBikuNptXjyFeMq0OCBw0FSj9HTOFj//suhewjAkLCnCazNjzCVjgrOBSn0J6
	nKq3CV0fDNzLVd0c+w7A46x88fgcOyVsfofX+gUQjvN+TRckUR8tPXlJsdrn79u0Z0xEafJ8PhAk9
	ynTfVAVg==;
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6UHW-00000006tVa-32Pi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 14:37:12 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso6391961a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 07:37:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483028; cv=none;
        d=google.com; s=arc-20260327;
        b=BCy/doxtUccgiwB29SyHaihvaPdpPeXI+KYQeTX9V/7RjE9O6VJVpTb5xtRjl9gvqI
         4VAyhYh/5KvUukCrIMfw7BABb1rR3bYTRlQzBosTLVHZGiP3cs2UvqEmW6cmzgzGkxdJ
         JY2FRQl0RvuLSWmgrz3V2rJt1Q/Sno99cdZM2dfWHR+vUkzsYSAkTvoLyMwa0bvg3bZD
         8dEKb0Qf/RpZzJ/AiKC7nImHDdvTiqbpH9yYc2jJYbaI7sfRhG4qcthasuZxgvEHIF2c
         4n0H+GE6zyByW0acdwrTNpuCAtPnOh02ly0mpY6f5P4c4g7fIAd7s/8Wc7BcJzYyYXMe
         7/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D77DzhDZ72+rZ/B0lquPWAieMQAEtWanQKfhdNjgaGs=;
        fh=4GDgZHkyo6Seuo0Q3dgyV/8m6kyOF9AHxLfSieYJocw=;
        b=ZIELyd22mPIrNdHW33kiyK5bJfAEqsPG55fQmJzs4WmDfE6PAr5YIi+esIrMoFssau
         3oRB9YSdgXJgbIE2hiF8ER9PgXvGBklU4/wx1d+LaXgB9PKah5mEDoDnrYGImf/El/Xs
         xhS2RV+6HckINoTgfhIwsGDz/AMjiZXai+G+UFQv5XuNlT0Tch3i5qFTQ1wsSAocGlGq
         GMZuDpXzFeda0stqBxaHS8NNJJQn9X8abn0LH8+Ja70HZBy1Gb4wLhGX8xSmqortuN6c
         2+XTm933z2gtNhzGCSKE4e+iKSa7t4jWb7uf2QfV9/2RkVzd4A3HknCRXMCbEYU60aeM
         mLbA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483028; x=1790087828; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D77DzhDZ72+rZ/B0lquPWAieMQAEtWanQKfhdNjgaGs=;
        b=WEDfrZfO/piumRH8EoJAATAIIndj1dCBDo0aPJ1wshHztOy/3hsdn9k/AeHPff6Z6h
         /sAvgfRUWKwveStJCPoX8XawWjxa5vQitGZIDlhrtSK4j/PpFlTT2AWZSFQGwHGGYNRy
         PRgg2JxM+++Yy02GOJJjTg1rjhR5IzsozEsO+kabGjGUndrzy/ofPvuF+P3xwhPjDFLm
         6jTYbmpBSDX9tpCg/JzXcN7kRXHfIHXjeHQ2tvc4kfy7Mm4GjYHMHFHLSDPkMKiVYv4z
         h9BHD9KOCiZd1wFKgjcxCLR5BpKGisyk+o+cfJW6N8uwcBSxuqqFxpbjTQhYdg1IVUF6
         go8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483028; x=1790087828;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D77DzhDZ72+rZ/B0lquPWAieMQAEtWanQKfhdNjgaGs=;
        b=ucwsHKIghtAZ5tHcJRdw9W8CksOqPvt+7oWgerZEs64M9N4rN9x+ER4n0nbh6N91Jw
         TpM6iXndJjzC/SIRkj3rluQ4x0eqXClaR2x2kL45D7hti4xRPzg54G0Dt9oLb5RzJcy7
         oNGwGFeMO/QYc7nP5aZEkDh3W+qYIsMF5/VnCpyXJmDovH6GdK+PD7klPZtJSuHN7Abx
         eu7JTDCBvJmNx6sAtqpccDuFk80DAsNtE1Te3UHdev2lLOLxBce7nhazXt/lYq2Tw8aP
         1D5NujwFjFa6A0yZEIG1dHENEYS2mBD20NavnmwDmZP+iA9T4J4SxhNsLnwjv5AjDFaE
         LIQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGsbmAfV89QtM5UJmOPW++PARcF2E+f+Rik53TCL3Txh+jpItJCL3PK/FOGyu/mmV/mswGZCL93aWCtKtwPOzg@lists.infradead.org
X-Gm-Message-State: AFuF++nhIR8zazOBT1LEZC97euvpfVhOix7pYS/d/KVfFG2SR34BgMyA
	imL5DQovklU0M/kIiKjDGOrUgPZBeD5JowqKveoCMbxUWF7bAVM2fhAKt/Oab9HNE4PWGZNlVxJ
	I8l84nX97UAhMOG0BR3oHLtU7PNrEudze1PBytPAOig==
X-Gm-Gg: AYBFou1p58QjlQkhGWIGvzzKF06WoFPV+H00bbx2JGarw4muykPuff4BjBcwIItLkgZ
	Xh7PTQXd396Uv8mAeTB3ipFazxDtPCNDIt5q3bO8rpvJcklz+IZKGr7Yu7XrHpxLMjwiZwl6IR9
	G9NunjKFlFMb8cIWUWDDtnEZ0Df2CPsdE8fJ/bpA9OgGMW6yuADaxN6woWm6EYv0W8fjOjNlB6j
	WPIDIvnTLdFTxUZtQ4Ej2MliheksztXEGQk+Ji9GgRvqmad9KMMJ2n7pMBaNBWsq230o0Ah61zd
	kOXXj+2spW2Fpc0APyHI+4Z/q7sRVRvQf/j4LiaT+68TpMdQH+gHmvoP8i6tdNh42/iInsEa8ZT
	T60nHzmMpKOCWDg==
X-Received: by 2002:a05:6402:321f:b0:6a6:32fa:54f4 with SMTP id
 4fb4d7f45d1cf-6a9f62147e2mr5365012a12.19.1789483028305; Tue, 15 Sep 2026
 07:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260913123740.203698-1-tturner@lineageos.org> <20260913123740.203698-2-tturner@lineageos.org>
In-Reply-To: <20260913123740.203698-2-tturner@lineageos.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:36:56 +0100
X-Gm-Features: AcwNN1UA7ww0ycDC66g2CaA2kAQpsW144jRswzivDAFwsftYfjODQouGwyp4baQ
Message-ID: <CADrjBPoud7_Bn-BgMX4+MTOyk9Un8M1B-nR1RX3SO3avBqv4GQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: samsung: Add compatible for
 Samsung Galaxy A21s (SM-A217F)
To: Thomas Turner <tturner@lineageos.org>
Cc: semen.protsenko@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas_turner@talktalk.net, alexey.klimov@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_153710_803902_52CED3EE 
X-CRM114-Status: GOOD (  15.58  )
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

On Sun, 13 Sept 2026 at 13:37, Thomas Turner <tturner@lineageos.org> wrote:
>
> Add binding for the Samsung Galaxy A21s (SM-A217F) board, which is
> based on the Samsung Exynos850 SoC.
>
> Signed-off-by: Thomas Turner <tturner@lineageos.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> Changes in v2:
>  - Sort via alphabetical order
>
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index 753b3ba1b607..021250497da9 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -232,6 +232,7 @@ properties:
>        - description: Exynos850 based boards
>          items:
>            - enum:
> +              - samsung,a217f                   # Samsung Galaxy A21s (SM-A217F)
>                - winlink,e850-96                 # WinLink E850-96
>            - const: samsung,exynos850
>
> --
> 2.47.3
>

