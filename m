Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A6210BA42F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 06:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZor0r7uOoAf8oDJrrV5/yzEdBboUWXz0lgUtCeRdok=; b=ou+7RF4CeG1tdR4hqNOWQ9kVYE
	ZxtMmbSuacZYrSwiw0sa9uoKguVsDbwQFKd4ymhG2wfZJt3nItm2aWz9Y7+8UaOuIUbYEs9x1HmUg
	3zFLTDVAxJUzOgjgKCxji6L+YSfrsG4AMO8n9sSda7UuqNJTufmVLLbNskOtukq0NdlYFxnJbBWK1
	3gdkro5exZN00WabXEm/Y7/u5FnWRmIY02ltmYjjNVJBek2d8aAHuc9h6fL2K9UpMC0+mKmpnVYc4
	yP77w/yNCod4lFc4FcOH0OYRJ0yW24SaxgvVCVwd+D9V2qY1jToDSD7ngMWsxWAK5A24EgH1aKfir
	oqlbp4JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w60LQ-00000006jp7-0o2i;
	Fri, 27 Mar 2026 06:06:56 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w60LO-00000006jom-0N2d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 06:06:55 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so1700551a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 23:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774591613; cv=none;
        d=google.com; s=arc-20240605;
        b=VLEpA5JOuZn4O7FyK3KYZoQ+x0o4Snl7OJipU0+9QB5exexJKCL/ZxFqKiHexFjBxn
         IcMOdctMgM3CLOxNYqRSnVC/H1zv5k6X8oS7UdL3lr0PUl2LFhGqjBjHxWpVf0CFIruW
         r+px+Ud+PQvA77whrs09QPyhqQn5xNhnPAQnmQ3Px5RxI8K+eaj8JBe2OwE7QB4IqDLK
         0Id6LSGfjDmpcY/BR2sELpdn2UVyVSJVtHnB/w0D6s4mqNi8u8/y8JxX+jYfy7opeDCc
         rj/Wfvh9vMhP5sJgNlt1v/FCSJSHbKUssQC/o264uht7N7asR8SjxwjfXGgw9nAs9V0V
         5kGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZor0r7uOoAf8oDJrrV5/yzEdBboUWXz0lgUtCeRdok=;
        fh=nUX2UgFbsKYZB96O5bQAIoujehS7NxUcE0mtdFkXfRk=;
        b=dSegzZMe6xAg0q41hMxBluIy34a7vXtSUsFCSiuPAZyJ5zgL962p4pbbixAvmLFX5d
         nXIgic7ri8bepdf5kDT83kWxXlLe7vC6zwdEmaaUU2J6+IxKGsGbEGPGws0BCA7msuLj
         ciU6H5EOMD6G6U7rHB8cF604L8wbkmyPpNrJjwTSf5tu9C8N30E12fYD07blqxOZshi8
         +qUfWuKApqQTY1BPZxSDsMGXknnO7uqARLUVaodYaPg5pMtMwOpvqSiD4nQqNZ5pHTsm
         I5duaFyK47DAgwx+qxJ46PqL/ZwX9wI+EgTAt63iqBQJhZWu6XoPmTbXjz5msVTIaU6s
         /bDQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774591613; x=1775196413; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZor0r7uOoAf8oDJrrV5/yzEdBboUWXz0lgUtCeRdok=;
        b=jTq5omuVA3i/8U1zG3Ug4mn/eSbwy6r1ZbZ0egUfXhyJ9oe7Wh4+yEYMMNa8h/Nqrz
         T0P5JPUtVT5AvLt2t7fFDdjTGplP3ullJVf3S954SmCoB7/ANwovBagZeygW9DPOmlgF
         6+kmPY/JHNidDnCKy9d1plIXS++8QECSm7mCoGus+tuwspEL2gJKLuezaCM/Zm4H5hfb
         1ffUSCvAZvnL3shQVMd5C2VehdQwH9/7rJhCfa6ggav9G/39uXycvzQnsW0Q52H0VUAg
         Vz0HqD7FD32uY2U6/qs/DxcUw53P6DTI693ZlyjxREddwojk364wI4AVfb7d2uXuZ38o
         F4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774591613; x=1775196413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bZor0r7uOoAf8oDJrrV5/yzEdBboUWXz0lgUtCeRdok=;
        b=Mb4Zj66sIbC+VBtZc5SJ5KJRatg2ZmF1wyC694W/esJpDn7khQny7+IK0P7iXLteaC
         BQXpb/hjLP2JBblVqojI2pvFVbDR8mIw5NMn+9hkNiLljCjIyJ+1pVpfUazP3BklL/bD
         8rugc7zAuyQQ0U4AjGfgvjF+3fKWmk47zX3KM2F1S2s4gR18U0xzIDR83+5Nb/yJDIYr
         fdE/sHlWEjlCQwIkGLM+tghzwWEndtupYBoe/+D/Kd8ysOaxKQUMGkerNybpiPvS0Kez
         rvQ3x9wTU/o7K/DcOboq4dN64GpFQ/dlAt16uBlU5k2P//UmV4XosfKsnLbwJDziX8Yg
         9wHg==
X-Forwarded-Encrypted: i=1; AJvYcCUwAFNbpMgy+YIU+LVlDHGGF4d7cvbjR8Xp+xOAyYTXDVcsAVOQR/23phrRfq1TrtputyQkR8uLJIDCHaC87T+2@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv5LF640m/SanQq/6Ui9opE42JeNzGCuj76fXpmoBDIqpsoBFh
	eUR5Il1DhiqcnPQkuT76ePcCUUgTnnOEH8ADIZ4ArlfHcZkb1nqRs3c4ajE4t4S3lcnB7UcMw+I
	sDkUDCAakUMsgK3hjWSlS9qm5AHHjL0Q=
X-Gm-Gg: ATEYQzx3gKdK/3nH0hLwE4nMxMwIsQcruMz1h+zPVAnUeeAiXQS8QgYSl1c84CB02bi
	LfqQwfzkNNNVyhEOhzSQP3nFDtWAYNF9ml84e9gPrUkWnybGtWPbM8LU4uyxexdVE/nQkHhsIxl
	+rl2i+uOWGfKqcKL9sY74qTWANFoevGy+kc23u4OazG0U2kSAJgCrt6m1WWjC6Czf3UFhepuTds
	EYDcbh0FgFd/8DbauEoZPu7dU7BWP+njwXLfRUvPDEBQ7rJPnPXXU4jGaDw4DT3xTZbcWqTTMdA
	rjzoMGE=
X-Received: by 2002:a17:90a:e7ca:b0:35c:f82:fef2 with SMTP id
 98e67ed59e1d1-35c3002fc51mr1380306a91.14.1774591612670; Thu, 26 Mar 2026
 23:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260327031504.497650-1-chancel.liu@nxp.com>
In-Reply-To: <20260327031504.497650-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 27 Mar 2026 14:06:25 +0800
X-Gm-Features: AQROBzCzbEGPPttZKspsGG1E13nIFzodJ2Pa5Qt8YvIkcRF-KWLW83wNwQFeTOI
Message-ID: <CAA+D8ANNmKX1oULZH=N8YE0hp24pP1JSvS9srugq+XMo+sQFnA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_230654_132137_2C5D6DFB 
X-CRM114-Status: GOOD (  20.96  )
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

On Fri, Mar 27, 2026 at 11:15=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> =
wrote:
>
> Existing i.MX audio sound card described by this binding use codecs
> that operate in i2s or dsp_b formats. The newly added CS42448 codec
> requires dsp_a for its TDM interface. To properly describe such
> hardware in DT, the binding needs to allow dsp_a DAI format.
>
> Only i2s, dsp_b and dsp_a are included because these are the formats
> actually used by the hardware supported by this binding. Other formats
> such as left_j, right_j, ac97 are not used or required by the hardware

"pdm", "left_j", "right_j" are supported by SAI, so I think they should be =
added
from the hardware point of view.

Best regards
Shengjiu Wang


Shengjiu Wang

> currently covered by this binding, so they are intentionally not added.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
> Changes in v3:
> - Rewrote commit message completely to describe hardware requirements.
> Explicitly documented why only dsp_a is added and why other formats
> are not included.
> - Rebased on latest code base. No functional changes.
>
> Changes in v2:
> - Updated commit message to explain current support for i2s and dsp_b
> formats and new support for dsp_a. No code changes.
>
>  Documentation/devicetree/bindings/sound/imx-audio-card.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml =
b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> index 5424d4f16f52..75757fbccd89 100644
> --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> @@ -37,6 +37,7 @@ patternProperties:
>          items:
>            enum:
>              - i2s
> +            - dsp_a
>              - dsp_b
>
>        dai-tdm-slot-num: true
> --
> 2.50.1
>

