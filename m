Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1413C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ii2WJSGxuN91zGRL+o1Elt7P0y9IW0tcr9T0FJSPak4=; b=SthUEBrxJnYhFHVJmsQkCAC+nT
	ckloDKezeX79ohbs26F9krU9UVPbpHpEtZatTv6vuLCB612dUwEInBE6IywVEvNvssGQ9bnPYZKZl
	AsVRUvIJbspvvfcNyQKxGSyht+VYu2CILBU5xnlqCMxBZoxWrHB9Y6A9H0kKu3iijP46CdZuqhF+X
	Ivtb4/gmAlzuUGCbHqUTlIdY5uAus5Qmp9g4/uSUMTczaX+rBIBeQclc7tUQoFJGbQS4u//XHmnAt
	+R2hrsun2zRYbfNZcbHEinrIx7DQzJUrSoqV/T3I5fDOPICbj/LEA0gboU1G1BPbKCUt7bEbc9r5O
	C3NbqqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXWw-00000004d8m-2Tf1;
	Tue, 01 Jul 2025 09:43:58 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWX62-00000004Zz8-1yv0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 09:16:11 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-32b3c292bb4so48641611fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 02:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751361368; x=1751966168; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii2WJSGxuN91zGRL+o1Elt7P0y9IW0tcr9T0FJSPak4=;
        b=D/oiZY45nOtkjcP045jcL0HorCAXxY300sKHhldsYRf7D3naM2//zCFuyaL9YEMgU7
         UjfdYOklXGR+w8sWtHD3n/RtpTvAbZCIJX126ryH9RrQkpEiV9OPZ6g7dOfY0r+l2P6I
         hquMWJemry6wXwGfqECwQksz3c4RCW4qdmeRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361368; x=1751966168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ii2WJSGxuN91zGRL+o1Elt7P0y9IW0tcr9T0FJSPak4=;
        b=Ykkwstk77y12U6c9AmiJjvW/2BWfa9EM+RrHNqb74NTjm24eju6gomLNieyhYDdDcN
         +BZ8oIToXovXcCsLR3NOkG0xMiSCeNPotI7MprfosRvNNpHiYQaqLjPs8so06rHxbqjH
         48ypJ1vstORD3b5KVL24v8OBSsRxMPwYY+/nw8y2CyO7Zpd5aS0H6NxYobDkd1ajCSb/
         2FNf5NX/+CP6fHA11fzZzOgN+P1UVf+uNudf1Y52Pbalix46NDvW2nToXqU3ZmU188Bs
         LDGwAqwfZYybR/MJvXm/f4f3VEiOAEyDyw6A0MIitavAofYcKieKIVE0OvqXQkKMKlt0
         ZmFg==
X-Gm-Message-State: AOJu0YxsOvpAxKpQKnahfCF4W+AxcZxPlxBzjCK0s10ILm3OHV4fVG9d
	o2giZgpEbzIQzaMKuwq53pq+wYBhtKpiYUpk+KCuPUR9xSSQ9OeOvvObWXd+T96y0RvsGrqBfQX
	zSfO3U/l0AdcXCz7TRDW8Sj9jfukSwzILJr+gZovx
X-Gm-Gg: ASbGnctD/qSeyCWhMAHxZKDueld5u2mz0Wgdq04kdDBqJiKgkUftbaznhzhDyJ1Q+Nq
	D8tNFIGH2Qp5lX+/F1vggrf6UWpUuSfRJmtLYR7w/KsCjRSk5VdbnGb13sS+YF92/LyKUDYXMD9
	l5fjOMlT7nhsuM325Qa46tw+kpA5thdI7Ps8bfcUSnRJirgo0gyHEGwKFe7rX5IemtPsKLBuc=
X-Google-Smtp-Source: AGHT+IHBrDnDLJq/wJvKGLgxQgDrKBxEEuyZmoLKMExSbzXgm4RYBgKbsnJ/qHE5B5f1OiZ34CTPYU5ibJdkRjsWKOo=
X-Received: by 2002:a05:6512:3f1d:b0:553:aadd:1987 with SMTP id
 2adb3069b0e04-5550b9ee8a2mr5372873e87.30.1751361368119; Tue, 01 Jul 2025
 02:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250610063431.2955757-1-wenst@chromium.org>
In-Reply-To: <20250610063431.2955757-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 1 Jul 2025 17:15:57 +0800
X-Gm-Features: Ac12FXxeyUHnDez8Q8D4O-LF6jWdCG451UjT4Bbb2Ps3qaRoBzaVTLBPU9xxrc4
Message-ID: <CAGXv+5HDAZ-MBBMk00O+cdcq55KnsKdEAMD7E2uaAf=2LY=1cg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: mediatek: Enable efuse GPU speed bin post-processing
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lala Lin <lala.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_021610_525542_AC6532C8 
X-CRM114-Status: GOOD (  19.84  )
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

Hi Angelo,

On Tue, Jun 10, 2025 at 2:34=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi everyone,
>
> This is v2 of the MT8188 efuse GPU speed bin post-processing enablement
> patches. In v1 [1] the change was made to the driver. Angelo, the platfor=
m
> maintainer believes the change should be made to the DT binding instead
> [2]. v2 adopts Angelo's argument.
>
> Patch 1 updates the efuse DT binding so that MT8186 is a base compatible
> with no fallback, and MT8188 falls back to MT8186.
>
> Patch 2 updates the MT8188 DT to follow the new binding.
>
> If possible I would like to see both patches merged through the soc
> tree once the DT binding maintainers give an ack. This avoids prolonged
> waiting for the binding changes to land and uncertainty about whether
> things have fully landed or not.
>
>
> Thanks
> ChenYu
>
> [1] https://lore.kernel.org/all/20241223100648.2166754-1-wenst@chromium.o=
rg/
> [2] https://lore.kernel.org/all/11028242-afe4-474a-9d76-cd1bd9208987@coll=
abora.com/
>
> Chen-Yu Tsai (2):
>   dt-bindings: nvmem: mediatek: efuse: split MT8186/MT8188 from base
>     version
>   arm64: dts: mediatek: mt8188: Change efuse fallback compatible to
>     mt8186

Friendly ping. Please take a look and see if this scheme is to your liking.


Thanks
ChenYu

>  .../bindings/nvmem/mediatek,efuse.yaml          | 17 +++++++++++++++--
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi        |  2 +-
>  2 files changed, 16 insertions(+), 3 deletions(-)
>
> --
> 2.50.0.rc0.604.gd4ff7b7c86-goog
>

