Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A3EC56201
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 03:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IC37ysMh6ZKiMmXZQoVdT7RLjzLigmBICjngmFTmRM8=; b=NZO13c1nZwziqvcEFUbxvhOISR
	DKC8NdpqAU9C4uQlv1U12UkENyOhHFupcMEygG8p7m1N4h6U7CauAKLUGP7WeJUQ7yjEtSBjCNirR
	wJK9zLED2idN10gIrux/DjXGOIckVbJoNnvIX2tnYnek0Uf8M8wrLx2cM3buNVywmdpBRp0+/QOZn
	lo6El60xDqhmi1vcJYN8+NsD+jkqqTkXCNAGzlRdNG39FBs6M0Hfu0KpmuUo97dsVum6u12LjNuW5
	f0KC4lz9gCTFW04NCR2oWRK25ehG0Yns2mY/k1j1oBOCi4Xc9dMagBosFFbDVdYGpybkqtyYTVGjq
	KkwRyPfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrScM-00000003BiO-4BqY;
	Wed, 05 Aug 2026 03:48:35 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrScK-00000003BhW-01fp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 03:48:33 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47fdd674e17so261723f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 20:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785901709; cv=none;
        d=google.com; s=arc-20260327;
        b=fwRDDl3thUD9jL4DfbXS+NnDh+AE6UZR1IGol1W3927yZXVGNNsXSKmo5R6caBsq+R
         B1s011VY2I/QnOkYFQYOteI6zrWvF7r8qCnWT5MbRrA1lhzeqEPeJNbrqx3P1fofYqqm
         7GU14yuAdAMjFJw8D3PZ3TsciKej4AD19wVQOdA3a3rcwXlO52yDynVGU1LEgrp5R5FD
         /4k3GCriYi4affLdK/btwMrKBF8V4Yxjpy6RhB71ojAYCzhy1u2BytJbcInfarXcbgIz
         18p5qC4T2nNPhnmWoq0Fz41MFbUCY0VAHAG7I7wHgUo+V0lAbHcQQpkD/hAON+uYzFpl
         6dfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IC37ysMh6ZKiMmXZQoVdT7RLjzLigmBICjngmFTmRM8=;
        fh=yYeAObaXk4gZFcQH870k+Qpg+ZdQR+WPEgbHLdpDirA=;
        b=gSXFl6+0jsX7QCHa0AN1bQov5hpdpc8Qenk2V8ttohoJmCJB5rl7G1hl40CqguA7O4
         Tj+F7HVkpg/+n9BfnO2jPyJ7yHQJ9Ukw/bYxX3fqCZn9kS3biK2f5ISNbe97rIOIHyr4
         wN263QaBZTwjN3b1nX7iH1b1FT+IWgB+Mt8PhQM5kSbldcrK6SlYBD1F7FbLXV7B7nH6
         YESkUdDY6F1sO0G3gpNoJpoIDw9TaJqGHeGyTQGvXIVLpr6p1bjtEx28bewBsvFU2iSf
         QuhmTRdg58DUZVKDkjtHG3SVMdFhIRZb1tjZT7kVqz5iJ22sR8POw/PQ+yu4lM6+6Q04
         m/BQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785901709; x=1786506509; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IC37ysMh6ZKiMmXZQoVdT7RLjzLigmBICjngmFTmRM8=;
        b=eaIj7SoV+8VQz54qJ8FV8AAHypnaGHk19i7QxBrojCEepCrPDxwbhyEuElk8K8jG8V
         Fe2HtCKsu1EY0xZa5t+Ik79NgPqjBdCn/rMNESevIzI4zvP4fwP378poBVeAnX2Lq3eE
         +lQlW7spk7YxP/UIvHdZJopKOMebUF8VyqVKvHDuJLpa4FkB5lAiJPT33y1QEK6J4nqY
         HjwV/czyaRgIVD8i2Hhyy2A5ZDebtdTy2k0YMB7wjtx3UHGZWqMejF8FWEDUeBcMwNGX
         Z8z/UvNHpqnWsLsRBzMExFOrLzclFcL1ZtrYiNnZ4JqVYP/vEmtobxOjhv6oBPj70h4E
         UyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785901709; x=1786506509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IC37ysMh6ZKiMmXZQoVdT7RLjzLigmBICjngmFTmRM8=;
        b=B2TEyUy0GIkuNuM3PNURZEaydvfd6vzvZwZvyyxAc874ijHDZVg8759yStcdJp8Wu9
         YylFpkixB1pBnV46YYrgnfsVdfBlu1Wj1dejI4y2PF5Zh1BDcgqGkU2j2962ryTjBIiv
         pBUK3PEdZLAr6WinPlytfuLv5eXL9g6ogLgbNk7EyNNWrB1oz06VUy0bTIPYhalzOmJQ
         Q4xKZZ4l9O3uWwEWkqP/0/0QFjJEvwjoBNUTJLtAS1cCyXg8/u4XYSVtRIT08gLvg0ff
         WWeDel4E2EbUK/Cz0XfI1KDituemvSYjfGuz5XHDv54Z2040mq16oTbfjyv7Qky3ywAu
         NFLw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0qA7140uu4dUfKhVTMDnLEPSk/Da4Mz+Vtm6NAC45qcFJuUcousSQlbZHVWadwIy2e8ZoF/E7nUzlwCdEu+mA@lists.infradead.org
X-Gm-Message-State: AOJu0YynirLyus/TOL0/B9Dg2qPGrcEQyXEnBxorb9ITrV8BfNyVlgCw
	np+C8uqqYiyc1RjvgJwKvYuGQnBRu9AySFTgwsQDzRXVbhfS/WHZvE4sjAnqcs59rnn8+00PlqY
	4YcWHtXXCcxXxtw08NYM3mje+pjRH198=
X-Gm-Gg: AR+sD12gzgSiQ5YzE2PyFx4Ud34GZuXzinOin71HF2i7a9vz3Pz9DkhrPIiZa1glgHI
	JK7vgCnek8AMtymDirJrVZ710hLFke4B6krqxuD+fQZCubKGM3njAS0UL976cCrS3tUct24/lXr
	NiYyqPRJlGR6hWjRDU3LWeJ+K/9A7xPSaWjbXlgADDnw9u5dQOrwHzpYbdQpxJjdov6ej30KHib
	8z3+djyVova1RGqfgT/nMNqz0QFZaGqwbrBB69lkXNvmpVKeM48nz116WvU7AB8liA1kal8tEoV
	xlshhWIfIQNrr/dzaxe4zni+Y/lHRJ+q8ZnE9FDELf4CHV+GqSBfff50HOWsYq2HxvoUKPsf8Ss
	n9auKV/nSlCiw
X-Received: by 2002:a7b:c408:0:b0:498:ee7:e403 with SMTP id
 5b1f17b1804b1-4994e7db010mr23612565e9.19.1785901709391; Tue, 04 Aug 2026
 20:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_FF56D057857A89EBFD82C037D80A53598C06@qq.com>
In-Reply-To: <tencent_FF56D057857A89EBFD82C037D80A53598C06@qq.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Tue, 4 Aug 2026 22:48:17 -0500
X-Gm-Features: AUfX_mw42ZkfMvaqB3cDywMHwxabaZ-q76T8alcxd9P7DU-SEanTaAyKauHIg34
Message-ID: <CALWfF7Ly=o85=ZQ3Laewe5VwW6agHLvqqSPKFDzcf75UWYnP4g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Enable the NPU on LubanCat 4
To: Pufan Jin <2254650260@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_204832_062190_2C6824C7 
X-CRM114-Status: GOOD (  17.33  )
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

On Tue, Aug 4, 2026 at 9:49=E2=80=AFAM Pufan Jin <2254650260@qq.com> wrote:
>
> The three RKNN cores and their IOMMUs are disabled by default in the SoC
> dtsi, so the board has to describe the NPU supply before they can be
> enabled.
>
> This board feeds both the NPU logic and its SRAM from a single RK8602
> output on i2c1. The vendor DTS makes that explicit by giving the same
> regulator node two labels, vdd_npu_s0 and vdd_npu_mem_s0, and then
> handing one to rknpu-supply and the other to mem-supply. There is no
> separate memory rail to describe, so npu-supply and sram-supply both
> point at vdd_npu_s0. The binding requires both properties.
>
> Neither property is what actually enables the rail: the rocket driver
> never requests a regulator, it only takes clocks, resets, register
> ranges and a power domain. The rk3588 power domain driver marks
> RK3588_PD_NPU as needing a regulator, so the rail has to be described on
> pd_npu, the root of VD_NPU that the three per-core domains hang off.
> This matches what rock-5b does.
As you mentioned here, the power domain will control the regulator. So
please remove the regulator-always-on from the regulator.

Jimmy

