Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B356CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHCtfjeFxc5IrqY9Ylg8aIPRx+nL79BtlDjjquddJdg=; b=0AfoMhOaw61RpqlGoDlfhE3biB
	q+jKf8Yrnm0VtcqIc90AIxAeVwEyGu23zgRgKFzz8gBuj4ciMUf7s/8Kb3v+/NmZyeO/h2pMBuEDF
	rv1Z6QEiHICF32cy4BzVNmuW0dhpr73ub/ulQFL607IvV/DRTL3aFpYNy+RD2JHHLPPNsbsZHtqda
	tu3o5S/3YEWJFM21CHMSB8oHLa4/s3p34lQ1o10c49AhiN+YhVu3dt2BzczEQTDxKkEZZ+mx715yK
	MRB5Ns8xeskl7uC+fGYGB9bjG0X9aOpTe4WnDkkgzR/qU7G0Wgr9Z8SY33DcKvo80zY/l1CEXaone
	qMK1TBKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKITQ-0000000GqgF-1xCN;
	Tue, 05 May 2026 16:18:16 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKITM-0000000GqfG-47AQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:18:15 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so4167766f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997891; x=1778602691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHCtfjeFxc5IrqY9Ylg8aIPRx+nL79BtlDjjquddJdg=;
        b=jRzL/PgXXkEHLsunmWbPq0WIEbS8A0a967VVcgB5m/fYlGCoe8Pw2H1Nn+Yee4qeFg
         W0VCyDIbfkvTPu3fi2MeuoFPQiNvGvhwhB8mlHdDjgquVdhnsKBYmQEh/7X6rVO7BQ5l
         WLwrWVJTq3QOW14pkin5cwraXn3ulCaN/tRwTfUzym1yWnMAvdCwMGcdLD6/61GBlLOJ
         TYVsoL7l59NAcFttkt2byrD3hllfMIbyTnJyTNMi2SlijY93H129O4PTQ888BFcb1kV3
         8Y3hQwydA5bFfLhnmGXthNfgQSgD69WkAz1/8uPPJDU4Rd3LwMuLSPbyPbnCgS1Y67JV
         DjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997891; x=1778602691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pHCtfjeFxc5IrqY9Ylg8aIPRx+nL79BtlDjjquddJdg=;
        b=Jxbujpue86Ruwf1iF+JujDwNi15ao8v6AR5Tgk2O6oAIpyEFKHr20KmZ5hBj7B7OP/
         FwrALgegN11MONr7mo2dE1B3j4Yy8918YIwvYNWlxMstR/v78rXMQ7Qs6aLLf/m+N8sz
         3+qlewDVCr6w/5NeF40bzlI6qVhN0qGz77eiy64+LWEGI8Ki/DSMXsebC50wRTJuIrm4
         b6tYgbL44iLiWVALsKD+lXThm6q5EM/hrIOvWZDgFeQowKj6CWP/gNG1/mQ8mQM+nJ6J
         NOT1N0GlF1Uw9yCC4D6s5iKm+OReW5tjOki2sN4mcvqABLo4rmdzy8gREG77VjUfFf5L
         C8zA==
X-Forwarded-Encrypted: i=1; AFNElJ+R9+82aSWda/YdQ0m2kruO6d2X1L7AC32nVSxZHf0VeWmOJaPdhqMD/Nr2YyuhbmF/3N5K7Wi5TGc2k5UF/dOk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8O5iIvg/MoBfp83xWoKHjaL4yh3NgOzCPJuZ7rcCumKNqAJFs
	nYAmDyvAkF74RSDFp9OInZeBKvWztGhYFpdd8v5Th7zbmZRxWsTS6sBk
X-Gm-Gg: AeBDies1U5UfuN4TLletsQJi+3wSa689zyXKkBKXPJ9k1vVGf9rh2FPm7I4f5MlNxZR
	F2FtbyA0TJxR+tY6Iexyvq8DLkUro/N6w7RB7ORjZQFs2o2TwLGTN8dN4Ljau10OiuLIYfLOXmN
	zWYzRFF2BG/XvTqcX/9KqlvK/zVRjnS60BUCZgCeY4R+BZGK35Ly2NpFRp6+PNncDtupLgiikO2
	g/VtEpfnxCbxIE+sbZczB7N2Da7NIhomDBjxwIgYvwjUCaN2BoOQzO+W7qfyRBhhSrmvNjWsVPT
	pK1N/L5QMxMs+y6QdffoFteYfwxraDts1DfGZEz+efUwLwrDbV6Ra0a+3myxhtd4XIdQogCfeKZ
	/VKt1ZpMbQc9C42ast+V19OQcAGGqwJUUWmH7ZEcAIGa44Q0AqK351vPonVobEfqz8L6xwPwLPE
	L98tvXS0Oajd6HjuzOPm+Jvd0y9iEvVNLDjMCxlot6r5aX1FcTaIQGUfZF4OC3xDgw0wFlsjZ8S
	JB4rnhwIJw3FsYZ+if9ePfzFzZ2
X-Received: by 2002:a05:6000:2dc8:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-44bb2f282f4mr25038895f8f.9.1777997890976;
        Tue, 05 May 2026 09:18:10 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505558e213sm5821604f8f.25.2026.05.05.09.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:18:10 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
Date: Tue, 05 May 2026 18:18:08 +0200
Message-ID: <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
In-Reply-To: <20260505134812.408316-5-wens@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-5-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_091813_243367_19B18FCE 
X-CRM114-Status: GOOD (  12.11  )
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

Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The Allwinner H616 SoC has a video engine hardware block like the one
> found on previous generations such as the H6. In addition to the
> currently supported features of the H6, it is also supposed to include

Remove "supposed".

> a VP9 decoder. However software support for this is currently missing
> and still needs to be reverse engineered from the vendor BSP.
>=20
> Add the compatible for the H616 variant, using the H6 variant data.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

With that:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



