Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B78C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3R/xMW1KRHZ8whxH1MaliizhE8y6irqdOv62B/5CbE0=; b=tOCng2go87zEa4gttIT9YgeVOJ
	TCriuU94SJABuHuv2LVUiEdXaHGOTbKFf9z1OtRE+lHxRv/RJIhq2VvnnNY11bZ1IgAiYD5CGZG9P
	WVrQ6LmTkUbk5W+q2ncfdKaJFNDb0ULuNrlYOic4CsRA/K/9N5hrxpClvhfKIADsoWU6GZpdbArOE
	9Sfoxtr5rAQu3ooNZr+s8WRkZb+agZREMlH28gz1JDCEf7Tz4CLfnFP3N07M4bKXYOO5fYhx5m8hW
	XNP1ZufuiDy+ZBpRj1PJbb1bpP49qxS46MdoNHAT3n2s0G0MW78okJLrILi/DcOLiBQg6v4fOZScZ
	XzaWV3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1rk-0000000DlDf-1EEB;
	Fri, 14 Mar 2025 10:02:08 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1oR-0000000Dken-2wqc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 09:58:45 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30613802a6bso21223091fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 02:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946321; x=1742551121; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3R/xMW1KRHZ8whxH1MaliizhE8y6irqdOv62B/5CbE0=;
        b=add0PYZVoCHg1PPN3WRsurP8PRzgCbeIlryy1Fi5vhHOJPux9yNVNP/6lTh2nVuMH8
         VHedmFnrhIENnNGki+UGEvHZsIxQeGxQP2iydwzwow/sIKaGWqdzPJBk6sPo3/jddkTW
         2OWTpGK+EHxMbDYyMQO4ZqHuTEuyuJBM5TSk3wGtJwG/NVs07Dg9T4qqJ2H7AqCTPU6n
         GkA+9xdd61SRIgy1yMIsyF6j+N1jsVw1cv8bx99nFYPf81kPxQo8AKB4+uFeGoynQ047
         TDb6pzkynN+uL3RG3jvDL3ZkNWK48NKExbA3Q+gmOd/nnFqzMX3zY1bVWqMbrPckI5vF
         Ys8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946321; x=1742551121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3R/xMW1KRHZ8whxH1MaliizhE8y6irqdOv62B/5CbE0=;
        b=NJT1UOQ4Chu9sc2Wf2I7HbNbnFCl50TP8yzrQtRPdr+rZgF2C2b8MRARdXj+oZfSJv
         5EVLOLk0Zrxq67HtaAyjqAOR7IqzGcEnelSEpsdkCZYsb8rr1SOoCAiIJXpLoSzJoLJb
         tHmajkwk/Zaw72G4dXn6Q/j+UKNqiZXo/+QcgUmNDIGxM52aB9UaU2dXFAbET8heu5ph
         r6U3Mbyk1VBXMdBThaO1fcjXgDalEFLhVCaUTwQMHZXD9Ekem+W/do3fst3e01BxIXkC
         t91w3USWr14syKMFqYbjppCd4t8YtT3g+oaNS9CrNa5FrdiUEpMXDYgoCKkHleQcIZPM
         Mssw==
X-Forwarded-Encrypted: i=1; AJvYcCWVWIPlioaxqAn7PpswPoa8oZARMSJp+VRufantyn9icIp7k0uipq4zaIvciTFgW14aGHdkD8S2nwnV2PXFH65K@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg2tBCpyi6e2ONYexVpC4JFhOw5DGrWggjYJDI/h6ywJ9PnYvR
	9H71qYutDOuYb0x3LdW31sgnFPyYjLOe5u6mVE4wLSmy13PgW5udqMIrs9CQTE9HWWNOxOT+fFa
	Nm+nYPIrcRidabzXMrQ++FafqU+hI8fmLsMIrwg==
X-Gm-Gg: ASbGncvYg/h0oiecKT2mTTR0ceti/CQhomY+ary2Hd30WTkraQkRtLvrDHrcK+NyC2W
	jg9/nSlgQIFTioNwFH2/rCyA2Za1d+eKPfzBJgzknDfLFrt7BxyURiKIIPnPI8dK5TSBQTzd7PT
	hkoWZGpH4XvH//jRfT2sWwaJU=
X-Google-Smtp-Source: AGHT+IGc3omYZ/PigNb3EELyzJBtPU76XiDZ8/lpHySnqIua+3ffxwK9HjrgiuZD5ypFcw6v7zL4wYHXWwqXE5nGVqQ=
X-Received: by 2002:a05:6512:158a:b0:549:8f21:bc07 with SMTP id
 2adb3069b0e04-549c38f1fbemr588651e87.26.1741946321224; Fri, 14 Mar 2025
 02:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250225140732.21557-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250225140732.21557-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 10:58:29 +0100
X-Gm-Features: AQ5f1JoobXwU1DJzGtfpxiI6KI8sg3dxeI7nlvijJlOYjKzE2Ra7o1u5ZIyffXY
Message-ID: <CACRpkdYSNMV2jymbHaxRp-PmzbbkEJ_eUcT20whYw3gdhEGOGg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add EINT support for multiple addresses
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_025843_742153_BFA04EB5 
X-CRM114-Status: GOOD (  12.96  )
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

Hi Hao,

thanks for your patches!

On Tue, Feb 25, 2025 at 3:07=E2=80=AFPM Hao Chang <ot_chhao.chang@mediatek.=
com> wrote:

> This patch depends on
> [v3,2/2] pinctrl: mediatek: add mt8196 driver
> [v3,1/2] dt-bindings: pinctrl: mediatek: add support for mt8196
>
> Please also accept this patch together with [1]
> to avoid build and dt binding check error.
> [1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D&su=
bmitter=3D215008&state=3D&q=3Dv3&archive=3D&delegate=3D

Since the dependence series is not finished I can't apply these
patches either, do you want to send an independent version of these
patches so we merge them *first* since they seem finished?

Then the mt8196 series can rebase on your patches in v6.15-rc1
instead.

Just send a version based on v6.14-rc1 and I will apply it.

Yours,
Linus Walleij

