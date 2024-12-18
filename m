Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1260E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kP77otwR85pohU1u8v+U6/CSHDJCnIQRrPv+NibxSx0=; b=kHybpLWqXZMOqP25WbSdXgUItF
	QZr33Gl6aHQfkbG1Jddb41FS+gQ1+ezl55d9IKfFNrcS09CJw4DvItoTsLdzrClmuU55VgTginkuM
	R6I2nA2nnkt3ZZptxHtljHTH1aWFRjbIjpfpwwoNIL0eIhnwXA1II0ltOonPsKRkfCwaUCakOa89Y
	xVhma0C2WNw5sKmf3h4zwKhD7acAUcskYhvzZPeEIBLYlBhNgfrjgIOIVNbkN42+xdhmsqTwqzJgs
	W7QMb2B4idVY5x9z55pwDClhwlCugUhKoL3VQn7oCPg4I1aZ2cHaC/LQ2Xw8nmHn14w+s6hPYr/Q4
	LM5bV+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwQ1-0000000H6uy-2JXU;
	Wed, 18 Dec 2024 15:57:01 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwOw-0000000H6jn-0jNI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:55:55 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-6ef81222be7so63374267b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734537352; x=1735142152; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kP77otwR85pohU1u8v+U6/CSHDJCnIQRrPv+NibxSx0=;
        b=qjolgfQYhBZavTvrVdFLNMiJLial72x2r3C/SPE7twsnzXp6SaZpuY2gouSOjTUOf2
         48aCy1ovcUW24JAtkWMEuPteM6prWVjHwWJYn+ZIv/idy7sTzJNZps2QmIiDYWJOnz1j
         wvQLRWd5l4x3JoUsDthmwkThfdwJC8mImkHbgXv44Wg1FvTvVKIb1cBgegMiGfbbY+91
         lAvq7znVJi+pkfuerjaQ9Sqe5bBd/GLfvJfsbt6buz3DhDvr5zxh5vGh114BR+RMUePn
         F85btDYXDyOJqGM1C8ZEYd4lIyCqx8rfPXVs0KxxHnVgimMbK2YLUQFHl3i1t200cZeZ
         mSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734537352; x=1735142152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kP77otwR85pohU1u8v+U6/CSHDJCnIQRrPv+NibxSx0=;
        b=HQR/mIzOZAYTqoOMuEz+ZpGg2xxJWl4BsvHJKYUXhaulAPrYr8XLFqbj9CBYm1Jxf5
         2oavWoe+89TGCG+Sde6JokmZ3MSWX2JKDzdVB0+ACNGYSMzGsQvpLEDuJT20Sr+dLyuv
         owGctzdLctWTe+vi5NFQmL5ncN2F8p6RiOPJfT+EPzQOk9d1dhmZyHMCOZKml1yWqYsG
         F5o9+WTB3/tH8EYdXYjEQZafxueUeJOFSvZPparuASLmFjZZyY/LVFt+8Vy+XgQguLP+
         XGbgypez1MG1bvo1FNaKPNatcj6FPzVw5sgeG0dGhuNd1kg5FPBhniVEX/fY1630hsrJ
         fArw==
X-Forwarded-Encrypted: i=1; AJvYcCXQaj1U2s25G6XjeFbYm4eddDr7E5PVsqOHX4WBO/QyNvDlLcI4INV1wmiaP+/rEIKjxlRjvsi54SOsohE++Gkb@lists.infradead.org
X-Gm-Message-State: AOJu0YwhkRqahqUlxDbdAjv6AVUWE5bPGf8BuLbfon/zIOAyai4VyfJ8
	BTQ7+Vr1bA8hAu+wmIy7ANcicyG8VsV+kAzypprcQFCWNjeqo3gZrmc+5wBZmfiSUtjqD3Ufqog
	fg4ycLuKgTJka1+yHJRujcM5kcDfMax0bJPy+Wz8T5IxXdO5h
X-Gm-Gg: ASbGncuydpO3RCsQgY/jpgycpWdiMTTqaERCrKwg726+x3Z6zsJeSgRwxi0rlem5TYd
	DUjF0NmywBZ18ozygjpMAMyWNg9BSqdQkvM7AmGg=
X-Google-Smtp-Source: AGHT+IFcDjIyutnN38PrfueeZkhwflHd2lPy0n6+1NpWzd1eHmYno36KM7bQpYPz6FkOWtp55zLwUusqOGk7tdB2RlI=
X-Received: by 2002:a05:690c:9a8c:b0:6e9:e097:7191 with SMTP id
 00721157ae682-6f3e1b30fe0mr1408447b3.9.1734537352351; Wed, 18 Dec 2024
 07:55:52 -0800 (PST)
MIME-Version: 1.0
References: <20241210073212.3917912-1-wenst@chromium.org>
In-Reply-To: <20241210073212.3917912-1-wenst@chromium.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Dec 2024 16:55:16 +0100
Message-ID: <CAPDyKFrJYvMvBby5mhOAsyp2_Dx+KuOEnGaELMydKBHFcyO_VA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mmc: mtk-sd: Limit second register range to SoCs
 requiring it
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	Frank Wunderlich <frank-w@public-files.de>, Andy-ld Lu <andy-ld.lu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_075554_209014_B5697CC1 
X-CRM114-Status: GOOD (  19.03  )
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

On Tue, 10 Dec 2024 at 08:32, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Changes since v1:
> - Added MT7988 compatible string to list that needs second register
>   range
> - Dropped comment about uncertainty of MT6779 from commit message
> - Picked up Angelo's Reviewed-by
>
> Currently the usage of a second register range for MediaTek's MMC
> controller is seen only on a few platforms. However the driver tries
> to grab the register base regardless, and then ignores any errors.
> This makes all the other platforms that don't need it produce confusing
> error messages.
>
> Instead, make the driver only grab the register range for platforms that
> actually require it, and correctly handle the error. Also fix up the
> binding so that validation of the "reg" property is as strict as
> possible.
>
> Please take a look.
>
>
> Thanks
> ChenYu
>
> Chen-Yu Tsai (2):
>   dt-bindings: mmc: mtk-sd: Document compatibles that need two register
>     ranges
>   mmc: mtk-sd: Limit getting top_base to SoCs that require it
>
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 10 +++++++++-
>  drivers/mmc/host/mtk-sd.c                         | 15 +++++++++++----
>  2 files changed, 20 insertions(+), 5 deletions(-)
>

Both patches applied for next, thanks!

Kind regards
Uffe

