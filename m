Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506DBC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 17:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAMcET+cuuKL0RWwCyWMytv8F9RmoUjag07rOTeO4/A=; b=Hfy++hhJXo4VbHckl4cpAnUnY2
	h5K+N5d2tKnhF+A/cQd+VoX/DiiadT/AA8HTVl3Fj9DZ7UncdZuo1Tny79cVyLLy1xnxzA+6e1V5m
	eEHcLkiC1FXEup791ldGgxeeJIf1HObHW1rqUEEyDz9pzmeOTnlP4ek5rMDwzLiK0ICkwj2wysEEG
	n6Utt90uNg3FtaU0C3q4VW/zVPUamTJ8UcJ4yYFUHFoQPz2J/nSNUaWcMxHD8uQVQI8EMgJaY8P04
	hebFl5pf5wmSu8O6wlJcJaI3tgs91lwAxFYny8Z++E/aHu8Hmn/x6aCB2B3N2IKfjPjNCrW6+Qmdl
	Tr9RJnrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3uO-00000001Sly-2wIx;
	Fri, 30 May 2025 17:52:44 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3nr-00000001R1l-1htb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 17:46:01 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-401c43671ecso1277021b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 10:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748627158; x=1749231958; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gAMcET+cuuKL0RWwCyWMytv8F9RmoUjag07rOTeO4/A=;
        b=PEtO+Kc5ZhK/LlhLaHN/QdxL48Fk/n5VlnCMvtOWcWjVwMP7BKwq1GnUd4ZMnO/+gt
         Bi7WwW7Q5gUtX7Rw2/TwPDHvIxXsSVVC5QTBxT73ZUYq3Ry4UqveFlMFrbBTNlMQXzpZ
         /9jiRMjQ4wBsoaPU84lUwlQdgjy7j9yaEDya63Bfo9O0x4Cw/7NArCrnUAJALSrvjDrO
         Qpj2ZncXzVjb5KRR3Sj1/A0pa9x1437vR6fBm4puYloVxQQIij3/npXS5WgfQ2WUiKqV
         kkmOP+MLoxwefVtgtfjmrY4+0SBS1OXD+yWgoDmC+lEgqXHO+F20Fy9G8rLtAJDO6knz
         lrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627158; x=1749231958;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAMcET+cuuKL0RWwCyWMytv8F9RmoUjag07rOTeO4/A=;
        b=QAWfGYmwFOnopBKvYL0iqILPmG91SDwbCyQumR9JISORiUya0pJ1eRHCGizFeKFG8F
         /GMZYPoa8261iILjQb8Pmtq6k+0QhWCI7WWa7WOFoqLYgabMUW7OBNfbt4YLAc+Rep4Z
         2kfVFIBHb9LBHRl7mOqM1pvTHkasUDF/AzQgPFthb7IwV5umd/h7oNAroLuHdXetpYKU
         9z1n6COAQtFqaAeEjAWwxLzI1k++/Ny9x2rbbn0dREX+/4h2mfm5JFzj9VYNXI8oXA5c
         cWkQD0vbx2PNyRbMWxeBItcnL81ts+krPA8PquJa1M+qNSdQHFi3SXzWsXrACw6PAkr0
         +xWA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ3qpubYCj8Jg8kmUbCPONtJtII1a+w9XU4lUBci7NhjpF3V/9niUqIq/m0s0xLsczyf3J1EBVdKe/VZ30aRbn@lists.infradead.org
X-Gm-Message-State: AOJu0YxVlWO1cBGa9Lb8zJhsFdL+k7JnLiJzUAwB+ycGn3rdK7gStf9l
	/eJj5kuxqKWLv+HjQzjyIA/MAs0u66H9iI3PnMLFFxFirYcG23EeR2Ur845SgKf708AsKqLS3qN
	sHF/P6Ok=
X-Gm-Gg: ASbGncvglOAwwRc14+DN1BQsjuHwu7/sb0XSj75RNKfA/+oSkWmyei0QlaNUSIapLdz
	AdmQaOcVl4mNKIvpFJyfzQGSBB1QLil5s8tMrpU+2AbAuWLylGHNlc1UgFJTWsJHcqq96LddbBq
	StpSWj3RgMKuYovdUO6j2bCBZt+xb28xE45jfvRpcCCBLVgtjJE2q5jok99lNVOxcR3XLy+tjbp
	8r6UP41rp/PgnuQsTdSanrvCMHJuYTrLxeb3BBXlQ+6MZA/hRn5bugPZh4zqU1zEpHkczDexNDV
	qsJuvQgjOjyXI3EVFt4E+EROb4OaGtH+XLIe3mZuaOdg5PzeB2yfQ5Iv
X-Google-Smtp-Source: AGHT+IHyl1e3Yym/gxdy5g4CfoGGquz0lE1x+UxDToQUNLQVwUIPOg1TJW9EOWFrIUF4GMcwRcWJcA==
X-Received: by 2002:a05:622a:514e:b0:4a4:3f16:c2e4 with SMTP id d75a77b69052e-4a4409b955dmr70951691cf.15.1748627147504;
        Fri, 30 May 2025 10:45:47 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:5285::5ac? ([2606:6d00:10:5285::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435767a5csm23220391cf.10.2025.05.30.10.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:45:47 -0700 (PDT)
Message-ID: <23ace820d130e5d18c599d29e960652be49e1457.camel@ndufresne.ca>
Subject: Re: [PATCH v5 00/12] Enable jpeg enc & dec multi-hardwares for
 MT8196
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: srv_heupstream@mediatek.com
Date: Fri, 30 May 2025 13:45:46 -0400
In-Reply-To: <20250530074537.26338-1-kyrie.wu@mediatek.com>
References: <20250530074537.26338-1-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_104559_457306_6E8E3C3A 
X-CRM114-Status: GOOD (  17.66  )
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

Le vendredi 30 mai 2025 =C3=A0 15:45 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
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

Just general comment, you built your patchset up-side-down. Start
with the fixes of things that was already broken, then do your multi-core
support refactoring, and only then add MT8196. Looking for a v6 with
a re-organization of the set.

Nicolas

>=20
> ---
> This series patches dependent on:
> [1]
> https://patchwork.linuxtv.org/project/linux-media/patch/20250424090824.53=
09-1-jianhua.lin@mediatek.com/
>=20
> Changes compared with v4:
> --fix kernel robot build errors for patch 4.
> --add reviewer for patch 1 and patch 2.
>=20
> Changes compared with v3:
> --change patch subject of jpeg encoder and decoder compatible.
>=20
> Changes compared with v2:
> --refactor smmu sid setting function interface
> --Some modifications for patch v2's review comments.
>=20
> Changes compared with v1:
> --refine jpeg dt-bindings for MT8196
> --optimize software code to manage jpeg HW count
> --refactor smmu sid setting function interface
> --Some modifications for patch v1's review comments.
>=20
> Kyrie Wu (12):
> =C2=A0 media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgdec
> =C2=A0=C2=A0=C2=A0 compatible
> =C2=A0 media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgenc
> =C2=A0=C2=A0=C2=A0 compatible
> =C2=A0 media: mediatek: jpeg: add jpeg compatible
> =C2=A0 media: mediatek: jpeg: add jpeg smmu sid setting
> =C2=A0 media: mediatek: jpeg: fix jpeg hw count setting
> =C2=A0 media: mediatek: jpeg: refactor jpeg buffer payload setting
> =C2=A0 media: mediatek: jpeg: refactor jpeg dst buffer layout
> =C2=A0 media: mediatek: jpeg: fix stop streaming flow for multi-core
> =C2=A0 media: mediatek: jpeg: refactor multi-core clk suspend and resume
> =C2=A0=C2=A0=C2=A0 setting
> =C2=A0 media: mediatek: jpeg: fix decoding buffer number setting timing i=
ssue
> =C2=A0 media: mediatek: jpeg: refactor decoding resolution change operati=
on
> =C2=A0 media: mediatek: jpeg: fix remove buffer operation for multi-core
>=20
> =C2=A0.../media/mediatek,mt8195-jpegdec.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0.../media/mediatek,mt8195-jpegenc.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 169 =
+++++++++++++-----
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 21 ++-
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c=C2=A0 | 112 ++++++++++=
+-
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c=C2=A0 | 112 ++++++++++=
+-
> =C2=A06 files changed, 377 insertions(+), 53 deletions(-)

