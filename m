Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AF2C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3wkBIAWu6vMGhx4ihyYrJkvVRzXaSU5Nke0PKHHZR0=; b=NYLbPZmKjJ7MaYDvl9jeI1X4E+
	6aHLTzCZmy+Rat4Gx6RLT8AG2ui79Z6Rmhk52XQU55jmH9nYmL7iH6V4hKuHfzOk6N5OmbR8Ph59h
	2r57w6ypID+jKXl+ekgz1lA/YZGSj6F5CiC1I7V2mI29mMi/0zlaDHBHf5+Fe2Iu1uLVglkYLDBF3
	33VnH27+L0WucksyWFqK6dcdOT2AuZIHfagLQYVL+tRLuPS3aHUqlof76bvoA/Q1sK/g3XQT4s1gw
	zCgV6bFGpTurkXpgsEL21Hijh1QaYudk1dGv8DII0W+S0DkJ+aXSu6CMh6tJZanrxTlm8e/iAQffe
	uIsqFY3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5MY-000000052XO-3NNw;
	Tue, 08 Jul 2025 10:15:46 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ58K-00000004znW-0NaF;
	Tue, 08 Jul 2025 10:01:05 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-236377f00easo52492785ad.1;
        Tue, 08 Jul 2025 03:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751968863; x=1752573663; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3wkBIAWu6vMGhx4ihyYrJkvVRzXaSU5Nke0PKHHZR0=;
        b=YWf9Aq8HzaoWal/17P0okGw/vRpW/zwEXuDtmh0zNdnb2nNWux261tIe3D2tWRKFJa
         yP1mGyKICq454Ml7vxuMBzLh4MAbL1a9hyCavIv4wc2zx6geCczTSqwVOAiCdEbgtUNi
         +WjSQq/OZdXhPpSYPu9teGB6+RDyVW8Wj/TULFibgUavEcc2l/Qy9Yk/HG3nqQPMBQJS
         slsWxGxKtfwkfSnPkBssy60nQcwrxwOI2FNJ+TZjFoz12Q2AMm07NT0dNyCgugVMOxN0
         hZJDB64NnOoef91bTWeBVtqSZlMuZN64bgHFB1e0+eAQp4ywNBMh3CeSqFhn6zk6hmqt
         yxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751968863; x=1752573663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3wkBIAWu6vMGhx4ihyYrJkvVRzXaSU5Nke0PKHHZR0=;
        b=FIn4bXzyCLXM2p0Hdzk4Mk5J5mNEEj/3j6qq3BNw9KADvhRxlK95t4y7+QeLqvLGYC
         RljiloEpxRV9HCF7iWt+lGCY91kDkveKXIGpdW7I3Zh5F7RyDOytbLBLu+42N15NxEhN
         yk3XlXtKN4SAEkiNDZaI2eXZqQbL6kD5T25BFjVIuMQkSpoMb1SerEC4AYHL98bjguxs
         72RY0ucRL7ocy2FcK5GggZdlM0/R8ckeZ7Yiv2UL3Nz7X+OZ6DpS7HaMB4BsIX60Q56r
         X7B3TQTxE9gaSWQmAbYJSz298lXeBLHiwKp8Ic64nXF20Q2SADwRlKoOTQSh7tPxvfwm
         Ipbg==
X-Forwarded-Encrypted: i=1; AJvYcCUJMLiJDwYGcPi8HuGWYlfSZexDgM2+La++T8R2rVWN01dmK6FfU2gHq1mt6qYCmkw1rn8D+gMTp8TexYlNlrg=@lists.infradead.org, AJvYcCVtuo7GIX9ZRm/DmNfR8uW3JUl7iwsbpv9jkcq22axgdx2dhhHgV5nAW6sWaT9rKzGnYRI/BSWWBk4AMe5prSsg@lists.infradead.org
X-Gm-Message-State: AOJu0YyiiHuRwuAQWUwx8iKJx3njK7JqnUaWHmOka7Bpq/83FjfUKeBa
	MNjcDZU3Tt6ytFXOtgn81z3ZCPbZvkeY+AEkpZFfLqSRpaECDLsAZiUt3k4RsGudUQHjCJlmgXw
	qa6f0EJ5PHAwK9IiRNGRtDlJpwhN+4P8=
X-Gm-Gg: ASbGnctb7a1drAl8VIuSDawPm9Q0pGBPQ93gIc6FZFAmKOuwjlPG+DOknOxxxEbGdUs
	x6TTtf0i1qVy8y871d8uvixWQA56lHyedYWLrrJoyuxV3FAecnsr8+4E66B5eQiopkXGGinZvZh
	jlGaqk+6/tK2girytTn1NIhShlavMkI+TQNI8FZ2NJ
X-Google-Smtp-Source: AGHT+IGAe+59sFXxJtTzkwvN/ahnPXiW4uDCXu7SJ3GxoxXjyVqLVVp4TiGhxGEmNwLOC3JUTpSndKTB39EzWdmJQBw=
X-Received: by 2002:a17:902:cec1:b0:21f:617a:f1b2 with SMTP id
 d9443c01a7336-23c85ec7c0amr255897365ad.46.1751968862766; Tue, 08 Jul 2025
 03:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250706214111.45687-1-rosenp@gmail.com> <20250706214111.45687-2-rosenp@gmail.com>
In-Reply-To: <20250706214111.45687-2-rosenp@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 8 Jul 2025 12:00:51 +0200
X-Gm-Features: Ac12FXz_arerdXgv7XWPfT5u_8acT2yjf8UClrrHDQjOZEpD7ryHNclY75AcmHs
Message-ID: <CAMhs-H-DNZik1EhM03QjUk=KwJwdQ=MCS-XdkA_dy6G7EpjBbQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] wifi: rt2x00: fix compilation
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	yangshiji66@qq.com, ansuelsmth@gmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_030104_130573_A6A504F7 
X-CRM114-Status: GOOD (  10.80  )
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

On Sun, Jul 6, 2025 at 11:41=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> The .remove prototype commits seem to have missed this driver. Probably
> because COMPILE_TEST is missing.
>
> This is a mess anyway. These non static functions will be moved to their
> proper place.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/wireless/ralink/rt2x00/Kconfig     | 2 +-
>  drivers/net/wireless/ralink/rt2x00/rt2x00soc.c | 4 +---
>  drivers/net/wireless/ralink/rt2x00/rt2x00soc.h | 2 +-
>  3 files changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Best regards,
    Sergio Paracuellos

