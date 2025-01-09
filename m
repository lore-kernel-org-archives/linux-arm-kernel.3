Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C35E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bywW9vMeiiYOYy2QNzu7ZKqXWuFCGn5oBIdbY0P2hyg=; b=H1rnpUWYH7JnPN5OqZpfhX1MGx
	Zy2/jSuoGP50XtM8bnCL1uVhBnRxwgCG4UssBFrj6Le5c4IF7ha0mVDJcJjmrk6NcCQeRmLor5AWA
	3FJ1wJx1sBVVYsPeW0wfAOAf7Jb/V4+lQqxC3Gzd91/rrIdjHXin7J9V5pdlyXzvOoZpkR/Ct/ucA
	PvKsBSFEM2AFzpQaFUSLPhHciKg8ccH1lNnrwsGaDlvcQ2VE9OxExQPrUfCe5LHBpQ2ARTSiPcIua
	gHPFhTm9NyQNJWopOv3Dh/gNWXTFOA0T5J9lJZ5f6T7X4gDlmHBUEcEVFHAIUOrc/CzNSEEC2Q64x
	5rwxG0Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtDr-0000000CAyw-1eaU;
	Thu, 09 Jan 2025 14:09:19 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtBd-0000000CAPf-292h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 14:07:03 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7b700c13edaso49213885a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 06:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736431620; x=1737036420; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bywW9vMeiiYOYy2QNzu7ZKqXWuFCGn5oBIdbY0P2hyg=;
        b=EX91DW3z0rW6riD4Z/MNPebte5GI6PPDRY3qCkk/dEMgO8L//1+EzYegCHq4yYxswB
         QvDLnOqAfAXQd3zEY0sONTxFgQd50GJZGAvPeNW7l3XC49MczNTiZyWELlkLAkJrtS/n
         7MXcHarmzjm+STJfWzC1pAIBvwpC9Pn73vvsixBgxkJvnFgTMk4c0h76kHSvkFZXLjAD
         NQ41qHw0Oe/6YeIDHiad6bJbm1yWSZMkeHzh+mw3wWvboBuWvI59Zr4DkYO2PrjH7Jyg
         IGrZlf4UfeREpX1rTvuxW/ERPfs4BVUNPTxFslvHmQs9eLZhjwNguzByX6kbR2gc/Xcm
         i2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431620; x=1737036420;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bywW9vMeiiYOYy2QNzu7ZKqXWuFCGn5oBIdbY0P2hyg=;
        b=M/ACxNpylLxiONxD5rCoOhtl2Vze9929cZA9PXvcaCe2I2SIsTLgQ7HMgB+BkmY5np
         x0sM0I1I3XmCB75C9e3Hu5WLiaeo35KzMB9jJdcY7kRYLTp5AURhttZ3tSI6fRp8EhaW
         V3sgtfdpl6RzaiZRkUcjbjJGh00zGxEcPDiRfvWDtduGQ0fON6aua1GbQ3RiUAENnp/h
         oaFHjJBUnu7rGbzbsx1zURW8EGywOS2KDWndWQdK2B9UEw9SJ2ZXWNVXzMyCpwTV6WSA
         3PcpYlrmIaaxzzUTvIcCU60hytbaE9IMrQqoRTlI5FVfxz8RHhjwTwEUrKyV45UHjZuU
         VwOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/vIAFB/lGB5TSAPeE2lM+GntoTsxlp+zYJ5nstpDlBU4NDFm893RQ3uIp/KQdXFtZIOXPqturlCH63nBbXqA5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe7m5A5OZXf8ot7fbQANru5qz7DuhpXr+MzM84/bjTE+vvZeap
	hhZ4ooPJrd/mcG//whmPLaXJFszItpyu1xhJxqJdlTiAOf5tTTId03n0JWHKFGs=
X-Gm-Gg: ASbGncuyVq7y1YhU+YgsFcQQSXykEQxEjXuBO0ZOxSIe5g35fwY/6z/iDA/HUq/fWsZ
	kBK56b4Uwc/IyRLtQDGDHWLsUoO0vQsA1nVp2JG5R6oLedEU6P7GaLi1+fRGTvtZxOxNl5+Ahtu
	pD1uFn/4ylmC/bk1rX/bcI2kBsZVtuoSDz5VR/GlJOnu3mvy5mSrV3oVt/YvY0l9ulRtVGgSUJS
	zxvpf9PJuRdW8ku2NsadMf3Q2NiQQvmLazc4v+VsaMJviq13K4ysGMm3g==
X-Google-Smtp-Source: AGHT+IEscSxY4Do3TXZ6G7JOMUAekHEsOUeBZGyyHfF7ljBFczTdIIJ78AZHYR6zSk6tQnyqAKAV5A==
X-Received: by 2002:a05:620a:414a:b0:7b6:dddb:b88 with SMTP id af79cd13be357-7bcd976277dmr964450385a.38.1736431620006;
        Thu, 09 Jan 2025 06:07:00 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce327bb28sm69478785a.64.2025.01.09.06.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 06:06:59 -0800 (PST)
Message-ID: <c67ebf846d19086586b00d1d79252c8296a704b5.camel@ndufresne.ca>
Subject: Re: [V1,00/12] Enable jpeg enc & dec multi-hardwares for MT8196
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "kyrie.wu" <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Thu, 09 Jan 2025 09:06:58 -0500
In-Reply-To: <20250109133513.20151-1-kyrie.wu@mediatek.com>
References: <20250109133513.20151-1-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_060701_754356_32B81A5E 
X-CRM114-Status: GOOD (  14.85  )
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


Hi,

Le jeudi 09 janvier 2025 =C3=A0 21:35 +0800, kyrie.wu a =C3=A9crit=C2=A0:
> This series adds support for mt8196 multi-hardwares jpeg enc & dec,
> by first adding mt8196 jpegdec and jpegenc compatible to install
> kernel driver. Add smmu setting to support smmu and iommu at the
> same time.
> Secondly refactor buffer and clock setting to support multi-hw jpeg
> working.
> Lastly, fix some bugs, including resolution change handleing, stop
> streaming sw flow and others.
>=20
> This series has been tested with MT8196 tast test.
> Encoding and decoding worked for this chip.
>=20
> Patches 1-3 Adds jpeg encoder and decoder compatible.
> Patches 4 add jpeg smmu sid setting.
> Patches 5 fix jpeg hw count setting to support different chips.
> Patches 6 refactor jpeg buffer payload setting to handle buffer
> size bug while resolution changed.
> Patches 7 reconstruct jpeg dst buffer layout.
> Patches 8 fix multi-core stop streaming flow
> Patches 9 refactor multi-core clk suspend/resume setting
> Patches 10 fix decoding buffer number setting timing issue
> Patches 11 refactor decoding resolution change operation
> Patches 12 fix remove buffer operation
>=20
> ---
> This series patches dependent on:
> [1]
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240808092555.=
12999-1-jianhua.lin@mediatek.com/
>=20
> kyrie.wu (11):

would you mind fixing the --author in your configuration, write your name
instead of your user name. UT8 is allowed, many people will use a ASCI spel=
ling
(some approximation) and then add their real name in parenthesis.

regards,
Nicolas

>   dt-bindings: mediatek: Add mediatek, mt8196-jpgdec compatible
>   dt-bindings: mediatek: Add mediatek, mt8196-jpgenc compatible
>   media: mediatek: jpeg: add jpeg compatible
>   media: mediatek: jpeg: add jpeg smmu sid setting
>   media: mediatek: jpeg: fix jpeg hw count setting
>   media: mediatek: jpeg: refactor jpeg buffer payload setting
>   media: mediatek: jpeg: refactor jpeg dst buffer layout
>   media: mediatek: jpeg: fix stop streaming flow for multi-core
>   media: mediatek: jpeg: refactor multi-core clk suspend and resume
>     setting
>   media: mediatek: jpeg: fix decoding buffer number setting timing issue
>   media: mediatek: jpeg: refactor decoding resolution change operation
>   media: mediatek: jpeg: fix remove buffer operation for multi-core
>=20
>  ....yaml =3D> mediatek,multi-core-jpegdec.yaml} |  10 +-
>  ....yaml =3D> mediatek,multi-core-jpegenc.yaml} |  10 +-
>  .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 126 ++++++++++++------
>  .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  17 ++-
>  .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 116 +++++++++++++++-
>  .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |   4 +
>  .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 113 +++++++++++++++-
>  .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.h  |   4 +
>  8 files changed, 343 insertions(+), 57 deletions(-)
>  rename Documentation/devicetree/bindings/media/{mediatek,mt8195-jpegdec.=
yaml =3D> mediatek,multi-core-jpegdec.yaml} (95%)
>  rename Documentation/devicetree/bindings/media/{mediatek,mt8195-jpegenc.=
yaml =3D> mediatek,multi-core-jpegenc.yaml} (94%)
>=20


