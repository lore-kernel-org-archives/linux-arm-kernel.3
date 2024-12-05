Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1ECE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 03:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwfLitJcijVjn3mYmWjqS2pZ/U3vybZ9MoCggOPZX9Y=; b=tg5+qhvl+BaxoZbQqRSp6x7mz4
	QI2exoJaFXrUvyMGd7mbIt0Ru4JvDPjB4G7pJlHcBTl3taG2ma74sUtP0g7EaOGbgwwIei4S5I4z4
	z/IlOs/9ul0j781iW4XaRGZajaf/tZBAujGDG+DMhEVTfLMpD1nxKUw8mpYzvWnB9NOHG5rGZ8xde
	la3w0ByimmHCbfE6lgiqY13X7tugCdc28EW6dEVKRGW0JdJ20sozpmAlXjMRWJEPGlpciKvkcEAVA
	wPYdIYRBT/wwMqRJFNjFs2kVhwz03Ewx6SgjjQD3EsF6vIiZ7PDH40rXbh8OMc85JKrYcgTvovhIl
	u1D5Xh0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ2kr-0000000EfvI-3g80;
	Thu, 05 Dec 2024 03:42:17 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ2jr-0000000Eflq-0lAX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 03:41:16 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53df67d6659so462671e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 19:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733370073; x=1733974873; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwfLitJcijVjn3mYmWjqS2pZ/U3vybZ9MoCggOPZX9Y=;
        b=Wx29szyl2MgTHmdBVlHOe+9hAZL0jw6u7HW1xy6vUwlH0f7vA3zTTA7LZegNsEGK1B
         Pz0lSUqPk/OjJfM9t1bPeY+BgcCDjNDBSUTVmi0vrbZ2GLgj3+NYCo68JbmsqchvPceb
         iWCd8ZDKGhRaC2pfPKvbOOZKe8rwos/XvmZYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733370073; x=1733974873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwfLitJcijVjn3mYmWjqS2pZ/U3vybZ9MoCggOPZX9Y=;
        b=gL+q7mE1eIa2IMJ0JHP7qBdmNtHWBkUm4xCAHcPQ2BzFMXmU+g6GlIdtDZ7O2InJID
         WZDA6iNWrUFkGfrjraMXjcjxDu7BtAz9YraEEJ03s5dLVdp+3PkNOMFWhd4bsYepgcek
         /9PfDTFBy4uv2QI8gmoSWq9eiEo/atIWljPqNX8fWGdEvylFcCDhn/zAy3oSIE/FYh97
         CHjwHnzPVseuhQJyvbbpQE5U511mr8tUI/+VL1SqEuCzyU1h4raQe2qs9kU5l10mhBD5
         oUykX8TKxHI+/trL+0VGNGtYtM1Er3bk62Fu/HufT8B65ydLRgEvcIADVrp4g/xf/r29
         krNg==
X-Forwarded-Encrypted: i=1; AJvYcCX3aIIZnDY96HPZ9kddP/y+PQyM+qElKS0L2Y5nP8UgCkdZeEeMur7FNLtGARUAnsqeV+eyEuTSKItdO8m/DDmU@lists.infradead.org
X-Gm-Message-State: AOJu0YwuScfLeG5Rag0IDlUy5l5YYe3NIHlPTc3Btl2pXExlBByDVbPy
	ZYU8voInhrhESZ3mypm3xM7bDQA2/RIaRlmh/Q/XIv31FXaolem2NHUP3+SgYgaU+1hnSYL2CO3
	53NVodc1E5MswcFcWSE72ZP6MWb8F8W6pBzzo
X-Gm-Gg: ASbGnctWp7KIgPbLeAAmPOcQqNBe1j46tLmvbCUuflS2Y57LHtbxCb2I/hn3wRo9Kp2
	5+F/Xk8vvtsz8mazcdGCqXM7fBWzJvBgeu64lcOGLQwTWkEbutwPtA8Bp274=
X-Google-Smtp-Source: AGHT+IHqgDnUkKGPY8hz6ukhVqJstOuAN0fggL2+fodGywtVNADNTkDdluEMvlUwqS+eqw7nTOCdm7Cyv8kDB7dlMcU=
X-Received: by 2002:a05:6512:2822:b0:53e:228a:85b with SMTP id
 2adb3069b0e04-53e228a0a02mr191564e87.11.1733370073161; Wed, 04 Dec 2024
 19:41:13 -0800 (PST)
MIME-Version: 1.0
References: <20241204092855.1365638-1-wenst@chromium.org> <20241204092855.1365638-2-wenst@chromium.org>
 <4762E5F1-59F2-40D1-9D22-724107623AAB@public-files.de>
In-Reply-To: <4762E5F1-59F2-40D1-9D22-724107623AAB@public-files.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 5 Dec 2024 11:41:01 +0800
Message-ID: <CAGXv+5EYf9-r88nv7zDo8JFGhMFyzVPU1gBNwkETvGTp+27q0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: mtk-sd: Document compatibles that
 need two register ranges
To: frank-w@public-files.de
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	Andy-ld Lu <andy-ld.lu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_194115_249590_612C2CB8 
X-CRM114-Status: GOOD (  18.26  )
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

On Wed, Dec 4, 2024 at 6:38=E2=80=AFPM Frank Wunderlich <frank-w@public-fil=
es.de> wrote:
>
> Am 4. Dezember 2024 10:28:52 MEZ schrieb Chen-Yu Tsai <wenst@chromium.org=
>:
> >Besides the MT8183's MMC controller and all its compatible derivatives,
> >the recently added MT7986 and MT8196 also require two register ranges.
> >This is based on the actual device trees.
>
> Hi
>
> Mt7988 is similar to mt7986 (only using different clock settings) and usi=
ng 2 reg too.
>
> Currently there is no mmc node in mt7988 dts (i currently upstreaming it)=
 so i guess this is why you have not yet noticed it.
>
> See this for more:
>
> https://patchwork.kernel.org/project/linux-mediatek/patch/20241202122602.=
30734-3-linux@fw-web.de/

I think I noticed it at the beginning, but it then slipped my mind. I
might have gotten it mixed up with mt7986.

> Maybe you can add mt7988 compatible here too in v2.

Will do.

Thanks
ChenYu

> Regards Frank
>
> >Properly enforce this in the binding.
> >
> >Fixes: 4a8bd2b07d88 ("dt-bindings: mmc: mtk-sd: Add mt7988 SoC")
> >Fixes: 58927c9dc4ab ("dt-bindings: mmc: mtk-sd: Add support for MT8196")
> >Cc: Frank Wunderlich <frank-w@public-files.de>
> >Cc: Andy-ld Lu <andy-ld.lu@mediatek.com>
> >Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >---
> > Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 9 ++++++++-
> > 1 file changed, 8 insertions(+), 1 deletion(-)
> >
> >diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documen=
tation/devicetree/bindings/mmc/mtk-sd.yaml
> >index f86ebd81f5a5..9ea035928563 100644
> >--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> >+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> >@@ -235,11 +235,18 @@ allOf:
> >       properties:
> >         compatible:
> >           contains:
> >-            const: mediatek,mt8183-mmc
> >+            enum:
> >+              - mediatek,mt7986-mmc
> >+              - mediatek,mt8183-mmc
> >+              - mediatek,mt8196-mmc
> >     then:
> >       properties:
> >         reg:
> >           minItems: 2
> >+    else:
> >+      properties:
> >+        reg:
> >+          maxItems: 1
> >
> >   - if:
> >       properties:
>
>
> regards Frank

