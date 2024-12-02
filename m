Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24350D78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMx9usLc+8H+1O3Ux5r/Qz56sk5GB2iRle+hBCjO6+0=; b=CCjTIHIoAUo8WGcfD79JgeJHue
	AJj2MTdVWlNq1jjYfZgixVSXsyiUgpVb+v/RlXG3Uh4MgAThdRRoH35L2bnaDbvLfyawt+gAP4jk3
	5870Lb91oBDcA+T0FqKEnlrna9ZJUaD8tKVsfoBVtH0cmfsQlIMq3S8KTxpCP+We6n40EacqVsarm
	Mj4RM3MhalAGYzBNnla+f09ANE/X8vRtStv8VE4/l6FO3HjyHX9Ja5+GRI5Tpg4y1FbpGsoS/hpo+
	5qfWKZf0YFnHtkp+aD+y/FaHAAapTghk/nn5YGLF+fx1AUavfshQ5S+Kt0Je9QRzEFTzVWF+Z6awK
	3RFlSzgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8IS-00000006dys-1Kus;
	Mon, 02 Dec 2024 15:25:12 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8HS-00000006djc-1dDg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:24:11 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-6eeffdff41dso36729237b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733153048; x=1733757848; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XMx9usLc+8H+1O3Ux5r/Qz56sk5GB2iRle+hBCjO6+0=;
        b=AFzA1QzganktXr8rKMv+RGRrObto3vPBV1F93vS1RmbVBnMwNzpynz3um9FGPjWQZ2
         Wq0Dx/r8Od3Gp6iPFToRXxRKjxgeHmaQdoJLu5CCw0kg8q7mp1vUFjPTLfe3/HhGtqmS
         siXgJ+LCERy10n67ax+2i7K82BHAX2iIOCgKvPg/i8YxO2VwIgsLfTfSSyGTZor2mGOd
         ocRW2ca4EOSbkwyUUoKa9jPSZsTbeQYPbkMtDXZW7+Cr997fehLosOC++XJbDA6DUNZG
         l7Qow8tmfmFBdBB6ZjqGtuMN40rxGsqsB2Ig7JVadOLcM3hdDPPlA8Ida38jZKUBDHYr
         FpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153048; x=1733757848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMx9usLc+8H+1O3Ux5r/Qz56sk5GB2iRle+hBCjO6+0=;
        b=A5LyweT+l/qSSc2pVQ20e5Raa1fo5DfLzmO52QXli/XzvyG44PSlq4GjDODzv67Ys3
         /rjgc4l5IZJTAnHnGQ7IcL37LgzCa9ScfzK9/egxHsMEbXvKFVbaEJt0eTeUhigddvc4
         ZPVv+gflRdAkJdXTxLFFx+SHB2ZNac7dxqtLqX6sM4ueJhDU76FBLroAAwjCKWLEl1wD
         JBu2DK//7ZpHR80rkVq+wHpCx+SIf1K2T1cAZNAA5C5edIFhM7K9sAKBILn3/R0uclMW
         D3NWgYWDWcDYXvRSwGq+cFWqi5dTt7UAiVfjjQoHcpwY/1BuGTHxGU6kZRlVXzYPkocj
         pa5w==
X-Forwarded-Encrypted: i=1; AJvYcCW3xgrEiiHk5XZ2ttNOdt7JnoY9hoo/p1DVruaTR99H9NY9ZN6IqSNmlmG3X3yAvj/nbLoFkDO/ODtaeSsrjXrs@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/p27OXBEfIQzVmLxBpEy9FBVfrUdHMdaOS+sRMeamWw+7HbQU
	OkN6BqmN2EcToTjw684bVRQoo/MHXffFT9jmLDJGxVYz/d5U1/afisp7BCT0tYPYJ8L17k2h8Cl
	HvQJ0j5cEzY83mQHO+XmnPODDksTcI2KpCP0h7w==
X-Gm-Gg: ASbGncvmOsVjj7Z1Vt4tU8DWx6oHBFQzI2w3koXupBSm6AKNlWYGHa5jY41KfT+wFPw
	OeLUBIXRjvNlGvLl6m6eolNYT3tUawXGx
X-Google-Smtp-Source: AGHT+IEGJdd9IwF7sSUzoqqAWgtWCRY1a0UMhBwb88ErQOHU8BaxnCWHnPMW9+ru+41yFpFYGuJqHhtoLonEK76JtT0=
X-Received: by 2002:a05:6902:1895:b0:e30:c614:5c3a with SMTP id
 3f1490d57ef6-e395b869b78mr21357729276.3.1733153046692; Mon, 02 Dec 2024
 07:24:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1732030972.git.Ryan.Wanner@microchip.com> <e9e9e4cf0753422706bdc44fe7d20ca3a686ce7a.1732030972.git.Ryan.Wanner@microchip.com>
In-Reply-To: <e9e9e4cf0753422706bdc44fe7d20ca3a686ce7a.1732030972.git.Ryan.Wanner@microchip.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Dec 2024 16:23:30 +0100
Message-ID: <CAPDyKFpN-2kowdi_eCtbW1WEdc5OKh7tj60GfbPPBR0Hbpyj5Q@mail.gmail.com>
Subject: Re: [PATCH 04/15] dt-bindings: mmc: atmel,sama5d2-sdhci: add microchip,sama7d65-sdhci
To: Ryan.Wanner@microchip.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_072410_474365_3EC7020F 
X-CRM114-Status: GOOD (  13.00  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, arnd@arndb.de, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, linux-mmc@vger.kernel.org, claudiu.beznea@tuxon.dev, mihai.sain@microchip.com, linux-gpio@vger.kernel.org, dharma.b@microchip.com, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, varshini.rajendran@microchip.com, krzk+dt@kernel.org, romain.sioen@microchip.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 19 Nov 2024 at 17:42, <Ryan.Wanner@microchip.com> wrote:
>
> From: Dharma Balasubiramani <dharma.b@microchip.com>
>
> Add mmc binding documentation for SAMA7D65.
>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml b/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
> index 8c8ade88e8fe..ba75623b7778 100644
> --- a/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
> @@ -22,6 +22,7 @@ properties:
>        - items:
>            - enum:
>                - microchip,sam9x7-sdhci
> +              - microchip,sama7d65-sdhci
>                - microchip,sama7g5-sdhci
>            - const: microchip,sam9x60-sdhci
>
> --
> 2.43.0
>
>

