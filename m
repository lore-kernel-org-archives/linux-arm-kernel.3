Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984F5C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozyYaD4uyMvYAeC6ThRYIW6+h6QCpMFE1Z79BTTe4Ys=; b=POY5nwO1QqKcH5Ggi0I7AFnyQs
	b1q6cnS426Sih0gpDJeJonB5uN3fzyCrGNOS+Jc34ejR9bJuzITEZMgChlw5MjSylfb4HzoNKu7kD
	Mu7RIEKcJswRYn6Q91IrYhSS3LacaW7mhFujQYd40Jc5hnfzXDCbP09Ltm8qorIyzZklZ6x8raAPi
	X009zAgqD8E9eGaVlA7YEGUde7HXXIOeGlGJc5kCX+7Qukv9hB+qpKKOsgtFriZMuQ/a/1ZLxCSsE
	/DjZ3s0yiwkDia2vBuen21QbNO662mqn8A9rZco5LRb7g+XRD8OXz8RrtGgnrekdIzOeLxC0EAnMD
	6aAqA0zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RGi-00000006ulK-3nTz;
	Mon, 28 Apr 2025 16:23:44 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9REj-00000006u6d-3Ubb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 16:21:43 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-70842dc27easo44088027b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 09:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745857301; x=1746462101; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ozyYaD4uyMvYAeC6ThRYIW6+h6QCpMFE1Z79BTTe4Ys=;
        b=MlmTv+8Qjifz7gcNndMWmd/VfUlgHdIWLBbCpo4zA+26beQh6kzVmk5PK81tkhVbOn
         DiI2I5xAwMQykmWAMatC8HBXnymdVJNHT2Dx0fdzEzgsBCL4bGAxCYcgVtPn1zc26shp
         vXuq94cmbcJ18N+2j2WYXvE+lwNvxkrmcSoca4VGArTKdiOPD6+IwpMaFPEKpy8fPkuV
         AWZXOgfLx+kH9haVsgneQydsbzlOCBp0sLMe0F2obI5YVqaVRVPg5bSIe0+FWLSzCzVE
         CjtEWMHOM6O3ptozfCVy7NDZWGJvxyvgiGNB1NrZ8hJ2cPW/30HJg8WrjSu/2cuDFntn
         TBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857301; x=1746462101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozyYaD4uyMvYAeC6ThRYIW6+h6QCpMFE1Z79BTTe4Ys=;
        b=O2d9DPLlDUq9N0ExZJzupP0Sfk1uMv/cOq5BCIo0mL9+t93ZN81NrXpDdW2LH5cCYE
         pI+mSLfOl29/w7Yee3CebLRqLOrOy7xR+F6iSm6uJPi2AFt4p5B3m8EWra65upVTPYin
         UyeqAkyYk+Zeehcysyad340QF6Z0drUd7CJRfqrskV8P5U0kHOxGZf9mfhNKRqgvrV4f
         ygCezO/GsNYDME394yzVL/wmHO45EjPfVxp7o18aW2QrwtvqTHRxw1IxtEhV0xVkoXQd
         CRlEA3sMt/cLsBnSbkAktENzRawpCAL4V0HMe2StEZ1VeA9MFPn8DXSgwbaRjJFf75cQ
         454w==
X-Forwarded-Encrypted: i=1; AJvYcCWVRaO0JWYOyIhw/duYKN2Q0GuPqq0XVFsT6DyrpdFtw02iytgE7E96UK5GA96+UTwe4mCxEgwqXzjX73j3nF/z@lists.infradead.org
X-Gm-Message-State: AOJu0YxCSTBJLUoFGQ3CMpW4GnnMA7fHiO405pd6YDE//Twprziebk1S
	DE5mhfvtmEJfAMvL5NjNO1SX3kltyMIPRmGEvb0n8WJ3KGVJOqTLwxmOaUSf+ynAIkesxnFdNX2
	2XxuKnbHLyBg8mYBxUJzZDRlOjjaoWs8329yE3Q==
X-Gm-Gg: ASbGncu2BfO0f8hkW3Wa1kwugHC8WwtZWx5XZKRa3wb2dO/XTtXY+E/4m3aw+1sUN50
	oQG6SlwRGiBAau4T2fXiNKVgQaucP8JlsQnVSap5KixCesI+RYqiOH0D4Co5prCFv143CloLMg2
	y2dfDklDEgIGUdr/gScSkZglM=
X-Google-Smtp-Source: AGHT+IF3Nj6mWpTWBj/+o4tJL25s0CN8hYakvk9PwN70OV0ov5/0UD6xzNyRF97ztJi6m2LHGnOwz76IAO3Cf/tDFG0=
X-Received: by 2002:a05:690c:7304:b0:708:170c:a699 with SMTP id
 00721157ae682-7085f239adamr122430517b3.27.1745857300782; Mon, 28 Apr 2025
 09:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250416120245.147951-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250416120245.147951-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Apr 2025 18:21:05 +0200
X-Gm-Features: ATxdqUG1v-Vp3M3iAycu00z5_FRl29-cbPTsX6LqWTtDPHUaj3lI0F-RZsKBbmI
Message-ID: <CAPDyKFrjaEk49O4T1dfaxmA1OSsFaF_iH3U73mq-fWnbBiRaVw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: mtk-sd: Add support for Dimensity 1200 MT6893
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chaotian.jing@mediatek.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, wenbin.mei@mediatek.com, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_092141_871415_D4BB4158 
X-CRM114-Status: GOOD (  16.15  )
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

On Wed, 16 Apr 2025 at 14:02, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a compatible for the MediaTek Dimensity 1200 (MT6893) SoC.
> All of the MMC/SD controllers in this chip are compatible with
> the ones found in MT8183, but do also make use of an optional
> crypto clock when enabling HW disk encryption.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 0debccbd6519..6dd26ad31491 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -32,6 +32,7 @@ properties:
>            - const: mediatek,mt2701-mmc
>        - items:
>            - enum:
> +              - mediatek,mt6893-mmc
>                - mediatek,mt8186-mmc
>                - mediatek,mt8188-mmc
>                - mediatek,mt8192-mmc
> @@ -299,6 +300,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - mediatek,mt6893-mmc
>              - mediatek,mt8186-mmc
>              - mediatek,mt8188-mmc
>              - mediatek,mt8195-mmc
> --
> 2.49.0
>

