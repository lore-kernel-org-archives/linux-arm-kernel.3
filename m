Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5204ACCF2D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3q92h4IZ2Vq5Gf1TltvGb3LBBGAyynZEUdMpN9LU/E=; b=4wecje2dhdes6ODcplgw1qRXOa
	Gq7ow5W4rGRC5RQW24tV4gvkRyJudenHhEiB4Q69HnU2vJsd1ayYqw4c9MnJIYEoiwEW9/VLR/N9U
	0OybPsS5C3e69tJUP6WUxmZqhnv7/2E1mR7KGOw++F6KkV9TIvTylq5CGMgrbJfxrvUhUtdfqvcUd
	Im7Mte1MnBPpNK7bjJr3CRVrkWIVxeJBF9JH0lznd4kLTvnhqIykxrbysk3PYeRNT1IElbgnSCMAl
	OwJsi9IHwkeF9Y6Yg5y3qivYt2P4LKlTrhBBRBpHCqL9uBrRtjj0Kr0agrVEnvVRJR3DEt1QDfxJd
	eViGh/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmbd-00000001mTk-49oQ;
	Mon, 19 Jan 2026 10:35:33 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmba-00000001mSW-0d1E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:35:32 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-12336f33098so2958960c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768818929; x=1769423729; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3q92h4IZ2Vq5Gf1TltvGb3LBBGAyynZEUdMpN9LU/E=;
        b=fR/aqQAPg/3Yk0AZiuD/fe/X4ba6eyj0RMtRHhJjtaEJMa+9TSP7myumUoExZuPVxE
         kFD0HZMtVdxMLCaUXcxkDIrTi9OhnfyvBrx/PdSjzRJEfHXm1HyuQ2BsdGblPMj2IWWX
         Yw110e6BYd8sMwPYC5zPpuiN6Mt6HVkiIR7ig6AKUQ6UfSLFQd/A4arxo6vBGjA85xFj
         Pxq1qDg916lQVP7+PBWmq1Uzu/oRLJbxG3+jWee3Uh6fB78BRFxkgO5c1k10ffJ4kol9
         y6oExeAP5874D2MpWL5OuZzti+s71vZBJvY4LV8fl99C4nqLQ9GRicemNpFZMpSW/P4D
         fuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768818929; x=1769423729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n3q92h4IZ2Vq5Gf1TltvGb3LBBGAyynZEUdMpN9LU/E=;
        b=UChka/23sD+nTR4nGGBvm+k2zcbNVzfl80t3eZic7L2hOyIvIH4bWiXV7igc5oIydq
         wsXuLWl54Ab1vkEmNuCVLB3knZ7hJ13CdoanJ1r62Zkw93k2MOJUh6cHEBl8VSjGKShe
         HtoNQPo1b1PCq+wFflVAYNm3OwbWmn8FLJBL6AqXN1CdX0U/LtSEc23reV71oXXzffDn
         XaBb4r9a8SA5R7jiz/S/nELLeifGrJz3Lg8KBkvUfK1y8//vzgVM6xVehWP3QVw2x/pp
         9OVqZ56zll+JRPLQUbyHf6ZKLLrsIOPA4j81YrNYWzHzESDx5zQwSjkhvIgP+2ttTth8
         KkUg==
X-Forwarded-Encrypted: i=1; AJvYcCVCmi62jCcBxxG1fI/fNDDvgpVc9eabl864P9UD2XvoKU7TrdrzY/rVQBOhLSm0Aj5VC+1Stq6xc6gDOccsl6oX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+JnGCHnWxlp7I8BmoJObms9ev2aV7ZasPWqxf3+dh+Ryg2fdz
	w9pI6aD/3y5tKaiDhyCYocA/3yMDP619DJlU0GJ9UfTjSFHI47w/V6F1UVyIa/jrxztyu58uVZl
	duUSJ6VkbNV6DtaypKzOmMYZhqWRmITA=
X-Gm-Gg: AY/fxX4ItOG5aAOnyj8THao7kAdh2dcwlz2A6yWqXcENaMQOSl6+2JiumGrEJvubbP3
	4ZtNo3qD3y/I5tVrytxAVbPv+9Vbu8dBOIMf2iYAvht/cgZzbOV7phnENmDYciEC5rQmYvMCyX4
	CJsMll1StGsR5+yU0KDAATaARzsQ8yATbmsYznt4xTE4QnMiH9Lb4lxmJu8zYU5eLZbiMy30fLH
	I0rF5Y0QO+0iAXSRZdKRXkzoUfSlj4eIZpsb/iiED3ia6PJ50jQbOK1jZ1CD98sLXpEpErneG1z
	/iZrz2aZy8KCDDfUebtQ4Lj8bPoXnyvT0jlbiJcqMqY4bM8t3y7iXDCgI0XuEVs9aBxk/qKAl/N
	0dFeGKvbq6w==
X-Received: by 2002:a05:7022:3c12:b0:11b:95fe:beed with SMTP id
 a92af1059eb24-1244b36f52dmr5548679c88.38.1768818929182; Mon, 19 Jan 2026
 02:35:29 -0800 (PST)
MIME-Version: 1.0
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com> <20260119095511.3030739-5-zhipeng.wang_1@nxp.com>
In-Reply-To: <20260119095511.3030739-5-zhipeng.wang_1@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Jan 2026 12:38:09 +0200
X-Gm-Features: AZwV_Qgr_591rcHqBwOlaouog8Vh6-BcA6ABe_pXfwA_9p9X95EWt1kL0IH2W8c
Message-ID: <CAEnQRZBf6ymmrHUVXPdvQ3pQWwhON-dCqJ2v8FZPRBEo-X=zPQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clocksource/drivers/imx-tpm: Support building
 imx-tpm driver as module
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	chun-hung.wu@mediatek.com, walter.chang@mediatek.com, jstultz@google.com, 
	amergnat@baylibre.com, aisheng.dong@nxp.com, jindong.yue@nxp.com, 
	xuegang.liu@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_023531_124588_1BFE2B68 
X-CRM114-Status: GOOD (  10.06  )
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

On Mon, Jan 19, 2026 at 11:56=E2=80=AFAM Zhipeng Wang <zhipeng.wang_1@nxp.c=
om> wrote:
>
> From: Jindong Yue <jindong.yue@nxp.com>
>
> Change defconfig as tristate type and add platform driver
> to support building it as a module.
>
> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

So you can now select the driver Y/M/n even if no COMPILE_TEST present.

I wonder why we needed the `if COMPILE_TEST` in the first place. But anyhow=
,
this change looks good.

