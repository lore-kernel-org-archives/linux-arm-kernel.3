Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA5EEEC296
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 22:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwmeVddzSBrk6onBg3XthXPBezPsVZCBdsI2Jvj2LQw=; b=xOwbzO1BnxQLwZfodw3Zzhbr6E
	6vNWipEpInnqL/1yFNnRovGMoMLSdmpVxlMRDkLxFfBmQ3fWE2GIMrauY34BzKBn/GBze6Oyrejhh
	WGg3DdAa61OV/in+QfqaU9YsqodFlTuO2csOFLXgDAWHY6eSR2Ak2KDQcj+iN8SVU50d7mfsIw6cC
	nW5YHrsNJvcPBiaoCsAnyKessi0o9WjtQOx5JiqBkEHA/kLZe3nj/npViJm/lowPTJ5B6bUoNrWZw
	81DoScnV5W7qMiRZDwagAHIGlqWjnFbmPbeafmo0Sga1athW10otS/pwdq35+TP4x5LMdxmC95xno
	s+/wCz+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vudzt-000000015Qx-13Zo;
	Mon, 23 Feb 2026 22:01:45 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vudzq-000000015QF-2m5M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 22:01:43 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-12732e6a123so841279c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 14:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771884102; x=1772488902; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vwmeVddzSBrk6onBg3XthXPBezPsVZCBdsI2Jvj2LQw=;
        b=HNqOu8RIiwhrBoYyZS3dmmB0/QEgl7kWqePSwoGGQidt18NJLWEAoYH7u8EMdK9gac
         CV+eXBlL3oV0illc073wONBHAeVX4zWxXesOHnSLaBrmtxqpk+an6qV+EK4RWu3Bh9IA
         W6ANWr+K5ZEBRHBvTO1Ob1Ho5G2Ay6C/H89RmoA6YB79LXnd6XcOITxAI6h8mpvkBH3u
         EOZ4jbNQgMamwsWgW/3Ddv8P9Toc1kqHkaTyiUWCi6ycBlDdVD5Aq6ojjnNs4AaSyjzo
         ubAsqUk/ItL3GqcaWvH/8L5JxcYc4bTiY1BcGU08S1Skyob0EXTdBRfqQjVwDJCmYlEI
         v1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771884102; x=1772488902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwmeVddzSBrk6onBg3XthXPBezPsVZCBdsI2Jvj2LQw=;
        b=UzGWTws0VZxtmUAjs5/nTMBXDDLC/3+CVjbukpYR6rbyW2lq9dts3a1HVCoLZ41YLm
         Gp5dZmRwn8J7urmp5C0PVu6GsVo8g7v8Gp0WYAz3Ie0/yZ7LQvsp23qWSfj51H+63kWp
         XL6QbFm6OT781P5ucUbO8CUHrs19eDJ5mDTf/XdtOk+QZd1EnnaeaLDC3PjcgpjztpFU
         WVZLhKLvZgw5uoB46OndHKID1ISUX4Prowv84FaU3XFHJ7TcD+ePekwo6xr88XrY9u/o
         GaSkRN2PBzYpl2/9kPlSQrqlV1MTDaIczV25Dm0pKYkQXDGdDOndI0bikIZJ+Dgs/Gn+
         58KA==
X-Forwarded-Encrypted: i=1; AJvYcCVKt1fpkZbfAJk40mT1sHsoGFvebS52LCdlIy5cv8+ZudIs9W74sr1IOj2VMBu1OPQUvJcPcF5HkctbSsAyXxoY@lists.infradead.org
X-Gm-Message-State: AOJu0YyzO0LxsqtXDtr+DoCSFZbA2Pg/aa8WDJPqR52az47lpmlTTjVz
	OLfKCQkbGU9EX6P3ShBXquS7w6GqqGWTWlJYzgeRExj7GUbmHCHxVL4r
X-Gm-Gg: AZuq6aLQoY3K7Gb4pGHgVVUFHdx47JXxQJmP2u+Epp+kgyrTpHnqGJIpMtYMHNaRZ8B
	kk++ICnlN6Njdor2T22FRjfbzMYM5UiZNfgzWlsWqrJyENHXPXKeuo3nR6HknjQTl6O5Qqt8Izt
	Orpcmi0a1AnTWDYsUFaznj2JBwavKCm5N0RzCDrL3jdoRDUR65MfgQarbVETQLeh7yrd+krE5qY
	s9CPwwB1seZulcYyS/a4kUBLU/zb7b8yPuyH+sKakjQtHeP1hmOAIl273irNsbUnU6hBMFreMUt
	5gXpEIuIFg2Ra3naRk7f6jqss+IUj/XTSCC1ReBHSphnz0YHBNWMB3rmdoTx+eudQ2Z2/r6Y0ol
	wPZ2rMrxWyqayNSQBIsoh03NGv/LNusCShkuj8bkKcyb+ynXauCNNRb8g1TxV7Yg+8y+8ZWD21U
	4zdPgnw9vGpdVTY95ODYnJBZF4SXYY8TVQeQY+tziRyn5cvTE+w9G+jPlxWkERjfcO
X-Received: by 2002:a05:7022:2521:b0:11b:9386:a3c8 with SMTP id a92af1059eb24-1276ad8bb87mr4839876c88.41.1771884101638;
        Mon, 23 Feb 2026 14:01:41 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1b48:5d6e:ab6e:5287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af2edd7sm9460001c88.8.2026.02.23.14.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:01:41 -0800 (PST)
Date: Mon, 23 Feb 2026 14:01:37 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Julien Massot <julien.massot@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 3/9] dt-bindings: input: mtk-pmic-keys: add MT6392
 binding definition
Message-ID: <aZzOHVh10zr9hiWs@google.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
 <056cbc09fcbb4a2845cece69209a2a564d993ac5.1771865015.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <056cbc09fcbb4a2845cece69209a2a564d993ac5.1771865015.git.l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_140142_727883_42984770 
X-CRM114-Status: GOOD (  16.16  )
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

On Mon, Feb 23, 2026 at 05:12:42PM +0000, Luca Leonardo Scorcia wrote:
> From: Fabien Parent <parent.f@gmail.com>
> 
> Add the binding documentation of the mtk-pmic-keys for the MT6392 PMICs.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please merge with the rest of the series.

> ---
>  Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> index b95435bd6a9b..2d3c4161a7f8 100644
> --- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> +++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> @@ -30,6 +30,7 @@ properties:
>        - mediatek,mt6357-keys
>        - mediatek,mt6358-keys
>        - mediatek,mt6359-keys
> +      - mediatek,mt6392-keys
>        - mediatek,mt6397-keys
>  
>    power-off-time-sec: true

Thanks.

-- 
Dmitry

