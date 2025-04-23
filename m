Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2C3C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 09:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AT3w9qrvqNQ7asAkLzicRanFyPBT5NT85+7uOTViCI=; b=2TTC0ukTzUuEGWFubVpbdQ7I1O
	xJWsqEpbbaKex1qUkH/ev17HEWv3voCqVaaTDimy0MnJ4f9mEXzjLMqCO5z9UKEUKcO9VbCXyqrS7
	jKoyxP9/EoZmyUCNPp9ppk8S5iLRf8xOe5wslzImt+/hffEQzwpjzZHZdJm+kSGCuqaD/uFhR/mAU
	vrl78Vf1zhLXrCZjrsdQ0QPNBBBRn7hbuY64yJRBltTchckHd18q0dd7nmrY4T2k9mW3ulA09GhIi
	id9NqqsWOZGGIzWw7tJe+B6Lf24idRWlQ/sEnLBXvK1AaG7BrFUwTPSU6FKaApJ0whMo3ax0P9S7C
	tf+m0m8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WlO-0000000A45Q-0XN1;
	Wed, 23 Apr 2025 09:51:30 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Vk2-00000009oXe-1qzp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 08:46:03 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-549967c72bcso6431884e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 01:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745397960; x=1746002760; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AT3w9qrvqNQ7asAkLzicRanFyPBT5NT85+7uOTViCI=;
        b=I7XmTEW0db3rtKwVh2gsRm2DCybNaAiTtkf62GuTL8AMWZiUmdxp+cQBWHSXhMJ8Rv
         ufBUvXuPdB/GzbgkAbbB2UdreymKPe0YfTpWtLXIiT1rVywBjYaznD9hPjKVo6r7k4RW
         6D3edZlZNAJUrOTI54CQ+suoUp3IqT9ouZs2lp8jZcICQNVL62PQ/uHygNY4Ye7IGjDV
         rkk8v2MELAAoIjZ15GfbyKiMprSJuY9DFzvK4Bb+JOQZphtF6sbAJcGfdj+bJhnVaLju
         Gng3n7Ut+6dmf9sOaYQ+5vs8Uh6BC5/IXMa6ItDdVc7JjUyJo2doRlJwTPgUosVEB44G
         ey+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397960; x=1746002760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AT3w9qrvqNQ7asAkLzicRanFyPBT5NT85+7uOTViCI=;
        b=fkczVPRLrHrMV9qHq+HMLXh5ldzn4/5NRVCtiDpjRfCHYMRfnk4l9IEOj8HL7EVRqV
         YfJgGC6d/z8+hkJY12iZc4jrXAed6qqcBwf4TmVe3L7w8P+LgT868kG44Jdxe84YwoUA
         kvtWevPDrAisNKWy7AYK1DVrXGxIirffmFCzJvxSZAJE20bo3Bsay1OK0iiEVz7/Ur0b
         VCxtHR6eXA1E+SGeLa/g8LmzedBb9OcQ13iKgk91MCsQwY38tjUCMqxmLbVvrar8h2tH
         OBSAlVtnN+iDDJK2GfsQnJNtLaMy2XgA8XUsBEun6fMgVJ+J2/CBfRSgdG5dXnT/ouIj
         UJ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVumj/Qydzg8o/6vDRimpNvd5mlrv9UVxDKb841FnxphZU/E8u8JTMgLxrpkxVodZt180q/f1xP2XHjTSZQpq0j@lists.infradead.org
X-Gm-Message-State: AOJu0YzEbs2d+PfOA9AUyE9Tlt6t7QSQUMeMsi2vNGszMufFehpVhw7z
	6eS7brEKXawcoSH+UCqVuXueO6aRMU6ok42GB2Gt4FXkzAxuB6MMBxFL1M7MT+LGdEAE46WR579
	392VgV89uCTdH5euQBbUs5oCQrjhNROFGq6WA/g==
X-Gm-Gg: ASbGncvGvzwaSMdDlM9Wx1zW3dW3wBRdZtIpVStA+QIwTRArE6GMhlHu5KtH78E4cvV
	4exMrI2nc1EMy6WIRy7320jrU0VI9vwy6sqpcr+UvjztYpTPaHYph88pCbaR+7kaANd5c+xHuvB
	3GD6LAQ///B7hEi659Zy8fdw==
X-Google-Smtp-Source: AGHT+IEM2sVrDJg1K3kkQKCG4hk7fklAp9PkKiypjTL5amBPKHe2ZUe0WuA6o3v/r3NttNzUZAhfuvsRPZ08Q44dSBc=
X-Received: by 2002:a05:6512:3b93:b0:545:154:52b0 with SMTP id
 2adb3069b0e04-54d6e62bd7cmr4837714e87.22.1745397960493; Wed, 23 Apr 2025
 01:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250422075216.14073-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250422075216.14073-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 10:45:49 +0200
X-Gm-Features: ATxdqUE2HM1GEgTnOYS1QVQsQ7fnZaFaPHwIcG2bQqgtWcyPZI7J9UPs7LEWcpg
Message-ID: <CACRpkdb2shemvCLHuvKvSo0s62-=Qjmpxb-aTKjc_CEoFecywg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix new design debounce issue
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
X-CRM114-CacheID: sfid-20250423_014602_488700_C9B59A1E 
X-CRM114-Status: UNSURE (   8.16  )
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

On Tue, Apr 22, 2025 at 9:52=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek.=
com> wrote:

> Calculate the true offset of eint according to index.
>
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>

Looks like a serious issue, patch applied to fixes.

Yours,
Linus Walleij

