Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B7ECA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3J4+g2V4sWrtHtemeApia0D1CwSCabpiECH2Gc7jqHs=; b=JwF42ZZat1nacKBmmebAkr3PiC
	vz6xJOCA3zvQTKE7qfTUMzOcqePneR2gmDgz6JGcWVMM2hXKKtvbZlVDd0/XAMHfNKHOMpVivJ4hz
	7XctytARI3/hVGxUoihW87XN6pBAg/KVD/4DT1qjmHDLDnnfpb7VoyT25jvRAlCNRs5LF4snd0+rX
	0W0JLETvmz9ddMJHb0UVnp6Feuw+lGi/Gi6lrSsgKx6E9advWUsUFX91Qb5fx9AIy74hKb4jeRKDG
	5Hp6CkcSUdgYUU2FDnppfFvDHsWAocfYLrTRCtRW23bKuKWI9uD4qro1GVGifgUbmi+Jm29F5fWTa
	ZuT6k6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuT1B-00000000pjM-2Uy1;
	Fri, 05 Sep 2025 09:46:05 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRR6-00000000EHS-3cDH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:04:45 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-336dc57f3f2so18269021fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 01:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757059483; x=1757664283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3J4+g2V4sWrtHtemeApia0D1CwSCabpiECH2Gc7jqHs=;
        b=S30xlrtoQ0vKwUthWUbn1F2DGWMqy+xbKoIXbL7/TsgdpK6aMFfHKtL1Q/y2dheRyU
         7p1Hlnv91Hnl8YUzTWmfu7itcvOSs1mOItxzNnhLgcY1g/bG8xM7MvR/6PDRx0OFLNjh
         1My2gTfMPCtUNXGoTDiM5PGA+H6HlwW1S7kIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757059483; x=1757664283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3J4+g2V4sWrtHtemeApia0D1CwSCabpiECH2Gc7jqHs=;
        b=PLQ2guB4f9Y0PVYYQMe48HiQms9PzJAptUDkJgQFaryiDFka/oypAYyiP8Hlri9x2h
         +BRqlT5VICqA9SkQaEWeySNI6vNysXEBF1Dda8C/6k/+YBJoMiSx83zLnwKbZmoTZukv
         u8xv1QPcEsi5lkHvBkOEbXcFbzMVRh/G7ScyeOZ9y7Bg59CkVKfjs4MPCoEr9KP68SaG
         0oPzi1NsBoHRin6rg8bkBFyQ6+kfra58FO1WBXA1BP/j8opn8pHkBmGxwju8G5uWeOnq
         xAfo8uW0fyAR0GBOY1Jh2qzhmNfpS1+74dMtuPtsCZBe5zXTDbSwv5gNC8p9dgTlo9N1
         BrLg==
X-Forwarded-Encrypted: i=1; AJvYcCX+9JZs9mO0k6VueqOyoeXF6SUS/FkBn9DJ+WQVfJvla0stHepAiybYt/4xfX3hiGnzK0TwvPmlMiuuKheJWTjB@lists.infradead.org
X-Gm-Message-State: AOJu0YzJaurnyE9scrs+FQRFzumibaIcnSUjwCt0S+os52ZAZb+c5BeV
	09s9r5r2drVY+36du6AV15lHuRAnw3wYl2vpXFTJNlKBgUeIDqjwHuXHUxLOSb2QJ6Dd/G0LTzr
	7Go0SYvss1S30QRblAahbfffhyBQnga3aU5yqXpOS
X-Gm-Gg: ASbGncsNQ0ElMSwTG2P8iRFIE0gCugVanN1bt3X9IO1P70da+MyYKdyyprVrYEi95te
	8HGSFdsbB7F+jzcqLedxwbpa+107QGWRyAUUjQtc+SuhFiHEEQR52zH58kcCWP7pPR/bctOTwzS
	goBPqWsPLRgOIc40i3H5dIbHYaALpKC99aOYtB/F+3+ohrdBNB9Ii689vwE4sFFSSExyyU9+wHy
	we5riwQ2jBmqojduOGqy6fur3pXyteEzElrQAUWK3an9IdL
X-Google-Smtp-Source: AGHT+IFYc+QgjrNQcnNX0OlLPGUtYQKqYiLrIJbM/loEuXaaE2NFn67DssV7d5/BEdo89ntnizvXLq3xRVbqrk9nj5U=
X-Received: by 2002:a05:651c:2106:b0:336:e176:cd3c with SMTP id
 38308e7fff4ca-336e176d479mr52475301fa.38.1757059483084; Fri, 05 Sep 2025
 01:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-20-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-20-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 16:04:32 +0800
X-Gm-Features: Ac12FXyKW6bhjZsI-yGgtsh7BXxxyLqh5BQG4iFyVSU7pOJ_sKap2vxzQ5qbqlw
Message-ID: <CAGXv+5F0pWn5+iE+3pgpZ+GMoXDV-eoEx4zKTfsmV5cpa-WC5Q@mail.gmail.com>
Subject: Re: [PATCH v5 19/27] clk: mediatek: Add MT8196 mdpsys clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_010444_900325_FB85867C 
X-CRM114-Status: GOOD (  11.54  )
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 mdpsys clock controller, which provides clock
> gate control for MDP.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

IMO removing CLK_OPS_PARENT_ENABLE is the right thing to do.

However if the hardware ends up does having a requirement that _some_
clock be enabled before touching the registers, then I think the
MTK clock library needs to be refactored, so that a register access
clock can be tied to the regmap. That might also require some work
on the syscon API.

Whether the hardware needs such a clock or not, we would need some input
from MediaTek. There's nothing in the datasheet on this.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE remo=
val

