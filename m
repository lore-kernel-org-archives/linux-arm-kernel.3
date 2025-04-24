Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A22C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOeIljM0dsLpiUp3sMIwGCn1MBf/0oPhJSiBM5sc4As=; b=qOJx7EUOr5ce+ps3kg0jL77tQd
	iDzWxG2KRBLIxJM04znhVsKM1c5Luxx6u7vXkgjtybUDgPdTFzdmqH8fA7cUjY9jN/h1RFH2PbL7y
	BCX7p8lQyX1ipcp12ZDQsQtlbOPStEgRh474vDKKOQ9j30LOjI1rQWz5ZPdnkJ375s8xfJd4GHRe7
	gksS8I0vZw1lyrh+OvJJGftjj29zVlabH8dp2lBOj5Ru1zmLPZz5BJiiAgzgqw8TViMEfEMB1tjc3
	0RIHJbvMwFrUdCOwmnjYMQio3qw/0sQddlTp2H3SOTvKkUPNjFBsKOvaed2aqF2hnOQuxoeurRu11
	5b5k2fmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z3C-0000000EZvu-0vbK;
	Thu, 24 Apr 2025 16:03:46 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vA7-0000000DvmX-1LYe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 11:54:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22423adf751so9316525ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 04:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745495678; x=1746100478; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOeIljM0dsLpiUp3sMIwGCn1MBf/0oPhJSiBM5sc4As=;
        b=bl/FZ0hVLmuXltrv2TZKhCkM07aUw1P1Bmh+5hNUh2jF5APVnAisvjs7C8zCJDiWtK
         lIyBYa/zbwoHhPQwYD9lYT3NqByBDl4XbsBZ7jDBWR+IS5xIFw4A7XW2sjxKRqXGbUGk
         GY9sysFs/GN9nQfpFaz22d8Mjd6czEt8rRJ/XVJj8e2CLFKUDMIMOWnuHAQa3R2jYNce
         N8GM43baC1fWZzFJWuN/oS/KqBQQNnsaLyyjaDehh7/evOrdEqozFyKb49E7cFNkFGvw
         65/IMrYhleXbPQkDZ/kMf7Yg/GAqKH8nuBGr6LnO4H4W8qWEAH1LhdXuYwrWXc84NK4p
         lOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495678; x=1746100478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOeIljM0dsLpiUp3sMIwGCn1MBf/0oPhJSiBM5sc4As=;
        b=DXUHBhsUv94hb1RLy+by9yz7W4A26NiGHEt4NCq8cZwY6M/EEDe5QOj5gtadQCGSCX
         PfZziCllQt+G53jKXatQwM4PHvoV+hSHV75vVZYE3soRhHSEaR5tQrdOE32gqErqLekL
         Q9SOW5LQaZXYcaoN6R0uHbC8J70bU6u5zWf5xrsQ+FzTSBoIpigAqFz62Zwh1lKxLnkr
         VsY7K5pX9QLxvfgLdGCjMOJEFeeHNADQKkdNP2awPFgcKOlIG87TzUYMTbnYfsyp2YGj
         rNgT9mvedn2Bol3mL2iY2rbcKmoKOkgQbFfRr/ojfmC+rZ1mXcL9UI2atAHHg1KI8tGe
         dBGA==
X-Forwarded-Encrypted: i=1; AJvYcCVbGmBzROjBzTzmXjukyFZaT+R+eYeL0KFFaVJN4VzIuX+ghNc/aFOBgZKfY9U2uAM2ihevILyLmtCf9X1IJHoM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5T5RxY9dSbQIugsefzqtiuGWF+F6T1wYB2VXzZfkpUuAuWRkm
	efhCCelQAHxMbUGA66YRnlszSfY1pEAqwYkHSyaBZfvlW3zLSzeiMu6ZZFbUZo4xPID4MmryXH+
	kdHak9BTndWD5eCZ/bnOzjeIaFCwhZbE/
X-Gm-Gg: ASbGncvfw6Z7cXkwhinSuV+q6bxjir3jDdBklJPrwreGwAIAQAH8eZI5EuCUYjbWtFQ
	oOE/m+mKnbQKQTyfAjoPv+vHQNjEFdEtrs3EYJe+gFLqdWgL5FTy6LQlO9lNE2Oy1f775CcU++w
	QMVSOFPd+QjYR4UTBoaw==
X-Google-Smtp-Source: AGHT+IEwa/y2fOKiJtPJOHNNBAcDhjfvq/eByFcVBE+2/Yf64GYFD5P4bbwNs4WymJaSgMNAyONJWmAiuB1qSHp44q0=
X-Received: by 2002:a17:903:2a83:b0:227:e980:9190 with SMTP id
 d9443c01a7336-22db3dc0b8bmr41057205ad.44.1745495677805; Thu, 24 Apr 2025
 04:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 24 Apr 2025 14:56:28 +0300
X-Gm-Features: ATxdqUHiE5YmwRp_Og4qSAkF2P9kcgp5oyollWnIMyXy-GIrHjsW43cM8hbn2Gw
Message-ID: <CAEnQRZDjKpUDgj5FwxGT-vK8WNGqdtf0JXoebsYqCYbWkOnUww@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx: Align wifi node name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@dh-electronics.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_045439_358903_82048EBF 
X-CRM114-Status: UNSURE (   7.38  )
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

On Thu, Apr 24, 2025 at 11:52=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
>
>   imx8mm-var-som-symphony.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not m=
atch '^wifi(@.*)?$'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

