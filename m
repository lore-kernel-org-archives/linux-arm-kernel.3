Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22CED12D7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 07:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKS2ivMfGZwRbgqnCIUlWddkSsDm0WEsgdFK/5SEzuo=; b=NvIBYpQxPikaurewuYMVoRZ55r
	pB0KXpdYZIYPiAca/w7ylQ5YwTa4emV6IBNNsLQKxQ70lcCb74kOSsb2p0IvyIgt/l3EE2p+u1b5C
	0KLJ8jKS8m8A10b02XcKxpCGwoZPEwOapI1gT+i40zm4JDsVMGBsLpEcRdNYLYwbNzLEEaHH6wFFU
	gDNXgu+BGAe++3zz6Y6y0iV37uWQkk2hLXQwPkB3uv5LYTJwwAJa/RAIFsQAnI2q43dCzNP6CJEtt
	nysRB5dY2CrS+HZvuap+qcAhv/46OH6IBFawbYpKRq6siiRbH53VOmSco/soLBTDCAgYheQWJlbWt
	l2G2SQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPFT-0000000GiPS-0FZJ;
	Mon, 11 Nov 2024 07:54:11 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPDh-0000000GiFI-2weW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 07:52:23 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539e6c754bdso4078399e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 23:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731311539; x=1731916339; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKS2ivMfGZwRbgqnCIUlWddkSsDm0WEsgdFK/5SEzuo=;
        b=irDDtwo/nROOuK7BvZPIf7NYi884zEhGwakWqZHFNohUf5TyipT1nlDed3/Ov9OJLr
         CclhBYq2R6zrd98kalHIz4hCaZtqjOQuXKfQ03DHkvWpjk2wk2FZioKYxZzoNdf8e+pc
         Dfw/RTjEh0jQRZZFFOmboSJXWWC22GNyx0mto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731311539; x=1731916339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKS2ivMfGZwRbgqnCIUlWddkSsDm0WEsgdFK/5SEzuo=;
        b=d8HvjWaqJ2Pw82JunF9Gs+gysxhrkQZFW9vtgGuiIumAZJzM1wG+HmGFTFb5EjOw98
         /OpbOeykF4ORlEOrvS2KmVhD1pkOwyHDZ1kcHhOdth9YNTO5O6KR4CD+NxrbvF5O/M5y
         u0PFi1Cc1ClCMoelVhBSQXyQgT2n2Ejx2bpp0K+Wezav9OOfIhd6EuF1LwyBAWuwQlXR
         15QhC1Alp7ZrsCaCStjIKunA404zxP/ZuLpw8N1+Z0rwY4kn3k5AyDbccZoG8tl+Qv6h
         wEBHcIDUwI9J/5FW3qKaTgVq41MQ0pjmL2X3L6zt8DoqlhiC792EoNx8Rvd5EJEtZv14
         Bc4w==
X-Forwarded-Encrypted: i=1; AJvYcCVu5n7vsIXfxpp+9wpH+ZzDvLqzURmHFZ6VDXi91gAsImu/955DVhDrIfI39Gov808+IBLTBPU3IC/Cb0WEx5eZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwBOOhAAIZnbuK5Ou6lTSwMnnIDqAHkMdVqRXxuF1y/guGkJ/+S
	4piXPHq1ZxFQwzcwtygZKtnXN+g/l7bE/ww7+opdZzWV1CV2YBu9VBPYewRCtvWZIxYxjvjoqPv
	l+o6VtB+MEm1qaFSEYwi/ZWZSXzrVQXPlbgNT
X-Google-Smtp-Source: AGHT+IGRHfTP9Kqq9mD5swqZoNxYRg8klYW5cXpLbVdWWLihAGznsqQ/hB9z7H/R/X3QaXj3PIOAVkGZbB37Lx2K3FM=
X-Received: by 2002:a05:6512:2214:b0:539:530e:9de5 with SMTP id
 2adb3069b0e04-53d862798damr4078071e87.56.1731311538956; Sun, 10 Nov 2024
 23:52:18 -0800 (PST)
MIME-Version: 1.0
References: <20241111074030.25673-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20241111074030.25673-1-ot_cathy.xu@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 11 Nov 2024 15:52:07 +0800
Message-ID: <CAGXv+5GC1zoTnSQueDOtH8JRB6R5cg6mBMzAoRTsWPKVWAxGyQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Add pinctrl driver
To: ot907280 <ot_cathy.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sean.wang@kernel.org, linus.walleij@linaro.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>, 
	Guodong Liu <guodong.liu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_235222_086581_4A9685EF 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

On Mon, Nov 11, 2024 at 3:40=E2=80=AFPM ot907280 <ot_cathy.xu@mediatek.com>=
 wrote:
>
> From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
>
> Add pinctrl driver for mt8196
>
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Cathy Xu <ot_cathy.xu@mediatek.com>

No tag?

Please rewrite the subject as "pinctrl: mediatek: Add support for MT8196".
The current subject is too broad.

ChenYu

