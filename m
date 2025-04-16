Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA36C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 07:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWD5DtO8Zmjj8hm/jgNeXXYBfzD9O0HKgWcyYm/pe+g=; b=Gmyl4p7n5T3O2cv31uonGf3MnD
	dZQ1krzUcPoJvespLei8yQNcfthEvkZYgu6/yT/8AmniPzmN0D+tlUvJcAtUIxi9YDGIs3b8xpjSQ
	xRpbXxD44KScAoF2Ja8VlI+AaUmCS8AosyuQY3V4OUZeYI6vi9p+crRlZ9fV7XTD5G5Zs0QdMvIqX
	xMJCaJgkUGEU9gI1GKUoFFNIyyV7WuAQ/zt4pj+h57qDvHBQpeQUolbW0nYMZnM1unCW9fYMFLUdK
	SBGUM9ZsW+mhbXIvhWnujopIbCzMCo+vOZZc3ISb9ucfpcBXmwWz8av2ezGXtaaYSpCDY8LLz/YSB
	3xFOm99A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xC6-00000008c7x-3BIb;
	Wed, 16 Apr 2025 07:28:26 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4x6e-00000008b3W-0zGG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 07:22:49 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso64936001fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 00:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744788166; x=1745392966; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWD5DtO8Zmjj8hm/jgNeXXYBfzD9O0HKgWcyYm/pe+g=;
        b=SQ2JhPr5W7ircCiYq+TjJ2UiNiLictiljDv++6ZgfLBYCO3qRA46askCnodROHRNKf
         imen+o8KHd9saZzTzDHOPdwqr/DxzlMn322KOAEW4i0RzSagP454W+mto8/aOE0NqRqr
         SfGYGQs3kyP8Hx7uI6fdoeaqY/68KDX+Mr9/9Allz4kJOz5zpHNMyDsZ8ROIO0YgvGsS
         u/JCOMleuX90kzUm1b0ZsvjsmTrSA2jN5aQCFaBg990RNcRWVjFvTpxzvWUN/fRWSC6z
         1+FZg0/WitVq/NeGorsEyM87q/ED5rY5AejA0Jbhy1GSWyZbFrEB0jyTHBOxQqI0NWgl
         syBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788166; x=1745392966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWD5DtO8Zmjj8hm/jgNeXXYBfzD9O0HKgWcyYm/pe+g=;
        b=hNpC7jUE8EyQSjzgd7yVZHpRbzZbjyST86corZLkabKyOhOFCFMe3j0R9PM2V9io//
         SFCQx17HKWyUfEvgwg6iHwVLzyGtlDkEaRneURK62wiWdT50hwd7+STDka3FgqtRBOXA
         dPW97uIwhV6ct5t0VLILGY8Hp1zcFlm7hCb/3DoioCBYtGhHfF9j8T0V9Y0RVhwcz6My
         TXeZw1h/ZMga5mhjKEFM7yuK6YUJyL/zsrlqJHhDgryvPuXl72B8+OGII6qcOHnsADdg
         2W2GR8U+u+ZPXtb7iAohr8UmgRuyrTC5qWkhIhEyum0c8k4XOapWVgkD/NWrXd5yhOKI
         nXMA==
X-Forwarded-Encrypted: i=1; AJvYcCW3jD/gKHZ1J1ktZMFxgnhWiE0F6CgTi7ju2yOmMcVUQ3DAe0/5xZG8aLatqATBggVwsl8kHIiTdRvWCUECkx2p@lists.infradead.org
X-Gm-Message-State: AOJu0Yx44hdkcNrnWoeOK+oYNxgptEMJHpxTOHcIqQwMNSeMduYWw3qW
	5RlIMGKltWptZS8Pt0lQEX9j8JlTuQx9nPTWm/plV8D4kt9UpIliWyPI23+mvknyZ/6JpnEHJCE
	jcXSb11wNyEUIKNnD2UXO07HmBWoQb1HydcmwMg==
X-Gm-Gg: ASbGncvGYLNOhWFLGNkw50CgKdpyCO1xYoGvlzRvH0+IvGBadLTN8onrcaLKMW0i3gZ
	3+fEwSn1LFYdoXZ8R9P8aTvJKnkwlr9dyqDa3cWUWGmIEzWcREsFaLRP7JIQTqIGF9utO5oxt0t
	sAyke/Wu3yZMni3uc+eDzitA==
X-Google-Smtp-Source: AGHT+IFJzy+zttruUfUSE7DAKwZxb0lvHyIXLpWKETv/eqQTmvTOtmlAPv2KPiXrE9yHLzHL0bc/wktEHBwODzsfibQ=
X-Received: by 2002:a05:651c:243:b0:309:2ed:72df with SMTP id
 38308e7fff4ca-3107f6ceca2mr1915221fa.24.1744788166445; Wed, 16 Apr 2025
 00:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250414090215.16091-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20250414090215.16091-1-ot_cathy.xu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:22:35 +0200
X-Gm-Features: ATxdqUGunV3YCOGXGIOJ9QSL-oTOhWVqzDgVFDf8RsYkNrat6ruPMmmT7W9km-0
Message-ID: <CACRpkdYUqHzid4Rnuv4arC9wu9fmpcGR22Jc5JzJhyr7fABMCw@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] pinctrl: mediatek: Add pinctrl driver on mt8196
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	yong.mao@mediatek.com, Axe.Yang@mediatek.com, Andy-ld.Lu@mediatek.com, 
	Wenbin.Mei@mediatek.com, Jimin.Wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_002248_273763_5411BDBB 
X-CRM114-Status: UNSURE (   9.64  )
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

Thanks Cathy, this version looks finished!

On Mon, Apr 14, 2025 at 11:03=E2=80=AFAM Cathy Xu <ot_cathy.xu@mediatek.com=
> wrote:

>   dt-bindings: pinctrl: mediatek: Add support for mt8196
>   pinctrl: mediatek: Add pinctrl driver on mt8196

I applied thes two patches to the pinctrl tree.

>   arm64: dts: mediatek: mt8196: Add pinmux macro header file

Please apply this patch to the SoC tree.

Yours,
Linus Walleij

