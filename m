Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E65CDDE70
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPjbajRR4bOoqdpLgYZ8XbSz5ySdKuEORFF5va6CWng=; b=4VcaZ3F6/cNgcO2nS2g26HKWdM
	G4INUkIdhJYEuc9FA0hoU91MqRL302X8vjsSh9FUE5oYmNMTb5sHgCWcLSA79dgWnyQH1qYJBwmTb
	kB6O0IozKarCEVqGsBuE4rQzW2xhYwvbw3+KXhzUv0UWFBe6JnHf7Tt84qDaegDuzWDaj8Mun0r8y
	nKz6bXv2g3YqF5681przav/dNU1jtKogZFS3fUtVRS7Lqsqcaa6pKwn8JwpFot1zPhn2VnlBPtZIe
	wTc9jqhDiy3nCDVHV1rbekhGkczDzKb+ZcrrwS0hORccMr39GGHn+CwoCkTRt6oxIpo+8tv+vPa0L
	qgoj7ZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zp9-0000000EBsM-1epL;
	Wed, 23 Oct 2024 11:46:47 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Y5l-0000000DsxO-2L4e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:55:51 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so7180299e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 02:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729677347; x=1730282147; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPjbajRR4bOoqdpLgYZ8XbSz5ySdKuEORFF5va6CWng=;
        b=exB9+M7ariCmE56SnJEiYaCZFpOibpJEY+ewGz+HrinmvhGYN/U8j5ugBMKVf+z7sq
         oSrJnZBgw/V9PBxDOhd9VghittxEgnubU02IaEj6Yd05x92Yi4mB+g1ul2s+WT9Z+pKM
         yOF79r5hIWNUWEQUcPk+ogHd+pL1KS2/ILVWXzmatbCbpJqvBwLjVoj9bRS5SSAOSy6O
         HxeOtNayaBL8IhcUTI5g5q269NfD9QMvPrVzwY7YYpw2BKRfip4dlEV73PQuS5kk1bKg
         WYCyY4Arw6hC03IuzwdDyTYBdeNqM8ldOJGjqghjgrjGc/a87Tj+DalBkPqFbcag0nFx
         dFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729677347; x=1730282147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPjbajRR4bOoqdpLgYZ8XbSz5ySdKuEORFF5va6CWng=;
        b=s9y66tC+QECtVWDFUqJhvu7hWy/yH7hKBmRkoFLS81K1UBjjuLA1QlxzCWUbQ6DQJV
         2luZzgmuLoXEP4h2AzLzLt6mys7u/jsvEinZ2h5xVu4eZsvIxLs565/TS4nFXkNdApsG
         c2wgrzl1ZfpfDNFrUbi++XusV8mCVYXn7w+pn7cEINLeDn6+Q4VqbVxpbQcE2+EgniX0
         U3ZYzwecglFySC+6lfIBmBa3RRoOtk2Z0UQFnzmTPF5OavUmvCxl32/p6mOJOqLDBwAn
         zINqZnSjDnYTwoXHkPas/ix0OBzduVP006sezUGf4EaqGoMsRlfW2USAqwaOlZjF8chy
         GbxA==
X-Gm-Message-State: AOJu0YwsXY/Y9KassRItGJZpcUkolofOlduRpV5dBeJjvwBL+DXLr8nT
	Vt7Wx7PbbgFaihBUmiT+ETTQH97iPN3X4chdcRsK9A6sU+XTR27qFvHYkrUdB+16kupDtXDC6/n
	arY+/ZbC7Etekeur6PR6daYZ23wnKycdAqF+xnw==
X-Google-Smtp-Source: AGHT+IFolzLkC+hFN1J3gwCoJ6YWqJKWTBQDu86gMLl5LAGSfGYrnPJgVActrb1HJVkCYcI4kIlnf6HXC+/7svXA1PM=
X-Received: by 2002:a05:6512:e99:b0:539:dca9:19a2 with SMTP id
 2adb3069b0e04-53b1a355155mr926169e87.39.1729677347558; Wed, 23 Oct 2024
 02:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20241017211241.170861-1-marex@denx.de>
In-Reply-To: <20241017211241.170861-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2024 11:55:36 +0200
Message-ID: <CACRpkdYxerBV1sZ7KpOcO9_nwaLd1b+EKpttD2DW7zJx5ikUWg@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: pinctrl: fsl,imx6ul-pinctrl:
 Convert i.MX35/5x/6 to YAML
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_025549_653952_9D3B680F 
X-CRM114-Status: GOOD (  11.78  )
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

On Thu, Oct 17, 2024 at 11:13=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> The IOMUXC controller description is almost identical on i.MX35/5x/6 SoCs=
,
> except for the configuration bits which differ across SoCs. Rename the
> fsl,imx6ul-pinctrl.yaml to fsl,imx35-pinctrl.yaml, fill in compatible
> strings for the other SoCs and fill in the various bits into desciption.
> This way, i.MX35/5x/6 series SoCs can all be converted to DT schema.
> Remove the old text DT bindings description.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Marek Vasut <marex@denx.de>

This patch (1/12) applied to the pin control tree.
I expect the rest of the patches to be applied to the SoC tree
soon so we don't end up with too many warnings.

Yours,
Linus Walleij

