Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAE8C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 23:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pv0TSuxWUbLfyWJcf83pbitWWIKSiZQYxEH4kwn1yUY=; b=dDa2U1k9ESm3VjhLXkkV+i5+il
	S7VTGLo9cAdmHSnZSWumNeYSX7aT6Lnfkqip7FqbA0Xqo7DL7Bk1DzGSMCPQuqwegOCF1rZ4iAQjZ
	z6lWxZ3CTc8O1pWE1mxKmyNP96BOE7r9krMCuwdJ1xmEU9WyrtQxrz0FOrIwz6MdCB7gFNUVrJjiI
	QzjQaq+tw8b+lIz0VJSO+hzBkkqSDrWnA/hDHYhGtplwS50YwCru7ALSlKcurtm3gWCdzNOGYAzWi
	2GErpIcWLJwR3+ei+fIlL+VFO/g8Sf2jaoqFtF+nYKAvwhmdUVCQKPMQND93+KA3sI9d5dFiUx4Qn
	zFGN5zkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn3Be-0000000FH5k-2YFp;
	Thu, 23 Jul 2026 23:50:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn3Bc-0000000FH5Y-1tJu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 23:50:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 18F3344FF0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 23:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AFF1F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 23:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784850644;
	bh=pv0TSuxWUbLfyWJcf83pbitWWIKSiZQYxEH4kwn1yUY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M5tAzyky6AsZim7L7h8MTkZum1lNIFoFs0UhZOpZXGWFyG9lYeLL39L1TaHV2Ub0T
	 mpgEQDbCgmqRYDjYFVaP2gjt8N8mSMrVX+IVVLG6pHtFBTRyTwQk8IQlr3/2I9z2Mx
	 Sm0oNm51UFnXqfyODCckJKnMBMGH6a/e2gaW4nR5ngtlxo3XYNrv93ppCFSMrvyRWZ
	 buKpKQkbBBcl1T4XrOLssmdqEybohWFL+PCQLPYHvB/vonZyq9StxbLKf/xrU913me
	 t8C644gaiH2bLoJ8v19B+XpftSp4wBcl0wEZgGeCFeD6e6kH7q9eag1qfXxIatnJ6y
	 +/070I7ND34bA==
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbb662575d3so706351a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 16:50:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqch/NvhgnWtTWoyOdN+nDkLm76xzbjke1gy3Je13HgLHxsAyLB0OF0wwCqDzBdSe1NPWyRC0MVGbvoI6lVyYUz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0NgSBnAKgm7vHqJHPjgc3OWNGnzneNX5LWycVcGt76hYSQJgf
	LQXPw2yaUIiEYY6yO5LBLFuBWsJyJvFXjzL5TP2yZwJrzHqn4ijT/xw2jJ5GAayc5eX3NntAHwb
	KAEo0fwrcEczbNAg3gw9P1p/sEKLcyg==
X-Received: by 2002:a05:6a20:6a06:b0:3c3:a17c:1f77 with SMTP id
 adf61e73a8af0-3c44b245a28mr5768508637.51.1784850643482; Thu, 23 Jul 2026
 16:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260713112957.884640-1-lgs201920130244@gmail.com>
In-Reply-To: <20260713112957.884640-1-lgs201920130244@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 23 Jul 2026 23:00:25 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8nSZeVSyD9axg+7=j22408Qo6ECUiLVeLSPMnG2vvixQ@mail.gmail.com>
X-Gm-Features: AUfX_mzN_szIsR4Zx-5H9Zr7vUoQGqqfgU7Xy3zndft3JHX6RptvrPoQs8U9ltY
Message-ID: <CAAOTY_8nSZeVSyD9axg+7=j22408Qo6ECUiLVeLSPMnG2vvixQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: mtk_hdmi: Fix DDC adapter double put in v2
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Johan Hovold <johan@kernel.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Guangshuo Li <lgs201920130244@gmail.com> =E6=96=BC 2026=E5=B9=B47=E6=9C=881=
3=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8811:32=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> mtk_hdmi_common_probe() gets the DDC adapter with
> of_find_i2c_adapter_by_node() and registers a devm action to release the
> adapter device reference with put_device().
>
> The HDMI v2 remove callback also calls i2c_put_adapter() on the same DDC
> adapter. This is not paired with of_find_i2c_adapter_by_node(): it drops
> the adapter device reference before the devm action drops it again, and
> it also puts a module reference that was never taken.
>
> Remove the extra i2c_put_adapter() call and drop the now-empty HDMI v2
> remove callback. The common devm action releases the adapter device
> reference.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT81=
88")
> Cc: stable@vger.kernel.org
> Reviewed-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---

