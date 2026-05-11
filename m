Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B443ECD484A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yH/da57m9j66BBfxDcaOUHxrZwIbeRL1xLwNB3IDa6M=; b=Rw1sJDkusNElDO1TGkd1xu/Z8u
	E1KeM01l7eGZhBNJ4aIPrVIABAPnMgbsNwA2+clUgjbrhVqT2BGmkmYMJraXUFD0vkY7+IBppppIs
	ZBnDRpM2Bsae0+4MHyjHEWtxAzrk6FJPQx0pUzTma/vW0zxi/i22Urm13T02IQrLDy5sM2cxK3Fyd
	FR/eKLApAh3yzPNZURXkTH4OVTWX6tVEjOq05+sE+5A58bMSRFX8LNMjNSB0PGEb8hIXmOGNMpacE
	PJwtXXqaAkzAiheUr28FedtAMwGFUpBf4SHnn63tJ/OpGCU+7x6RnjeqsVAo0Az2E6mnbyIayZ2bl
	NVuRdDPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRHM-0000000DrPA-3MFj;
	Mon, 11 May 2026 14:06:40 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRHK-0000000DrOR-1OH6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:06:39 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-130b2295ed0so11746443c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778508398; x=1779113198; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yH/da57m9j66BBfxDcaOUHxrZwIbeRL1xLwNB3IDa6M=;
        b=pZDN0oD2G+Qmxvj20FvD4E6BGS77HhmzgvNlntu7f/kgFXaSkuFU4xAup11o+4SYEK
         8t9ur3UYBPlS3DNBC0KEU95gZ1Or2vApjCGxFIpir82OPSU+fsSyFv4B0csIBwMA9o96
         FsPL+yw3kbMeX9fTfEsx9l+Bu38hwEcfHaF9QEQBFTXV4hmqjQqD9h8VQKo40uguXctS
         mOVjAz1nsk59NmauPZhR7heLe2WHXP0lxWg863YdkKESRcWO3+y4f/QPiBe6E6BUL/eg
         KmzuypNDotKW9PnUU3nU3Nan1awAfiO6ucZFjyEUOyvwUKODSvMXoU6cPqethtJoyFdC
         v/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778508398; x=1779113198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yH/da57m9j66BBfxDcaOUHxrZwIbeRL1xLwNB3IDa6M=;
        b=MhTUGhol33A4STcmYQQW53MOkegkGbvn9TzB2gINBTnj8cHs3fCXj/8yyj3UmumLek
         0X+AnpDxGp8R6RCrle+RYaLgqVQFm+JVGJLqVDkscH5A/zRR12yzawxlWSh6g+COOpYd
         9S4UUGnx4budCSVmmV2HruyQmwqfoih5ibZyhiBh/6YxMdemQCi0UmXqtV/OsN1C5ior
         DtUGCz9555Sh0vOZX7k5+ym6Zzlej2DW6TRzrNLN2lRx/RqnIbjO9EsHxHOanF+1bZe5
         tAtlae/9GAxvyD6E4QJdNSYcy/DeReetGmCueDYfP/BDF27/7g1MO08pRf4SUJ3wOIwZ
         bu8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+LtcauzYsprO72951UpNFm185RE1DFk7NJsKqozD7S/gKTYJLLpYOToUmR051MDl6qpQaH8UZ4BIXK39g4HFJP@lists.infradead.org
X-Gm-Message-State: AOJu0YxEpXqev5rdp5LVnjCqHh9OmB87a4o2qj2Rl+t1hxsJ2KTAM+/P
	nB0waj4YjxofWKvd6HVdv2MoU1vM0sc/+uRbPOCs9jPapSWU2yCVU8VS
X-Gm-Gg: Acq92OEwDgEnBVjOtuEea7FLzYy6bakHAks01vTaFoFdexoS4c/gmHdcgNMB8fYXsJr
	1RO2YwtXDI36KUhfMd5tm1BhaNyWqrnRS1AX2v8deOX0TozRVuuoSI2beMRW69DkBrhLicC14RG
	TI9bpYefcP5d8UgFfS6PgKeKnsErfFEneEo4AQVhz/AuZL67gEmBPt07PWT3kMTjSnt69z9uiLE
	jl5tO2uI+gz4U8g97NqAnG6bxnfA3y5b/ES1bxrUnMdsHbAQoBygE1I30tYA5L/Np+Xb0AI/ML1
	3lMWzPQAMwOUYUUz+AHUd7G0HZU/oGdlolovMA5LasnipaePmxwx/n1hRotcBHtiSnZN7osogE0
	g81DgnZ/aCBUZ4Nw6q68wEQ1b56Wap1Kd6r/X0kvtbFpS7fGoBqq6QYHMfdt40GpHl+aHz3rPhU
	Mp1SDAwp+WGpwQoezXLnOInMRStmRtrBPkLW14
X-Received: by 2002:a05:7022:488:b0:12c:8e70:c33b with SMTP id a92af1059eb24-131852d2e27mr14527532c88.8.1778508397470;
        Mon, 11 May 2026 07:06:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13277bb2b14sm18610981c88.0.2026.05.11.07.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:06:36 -0700 (PDT)
Date: Mon, 11 May 2026 07:06:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org,
	Joshua Peisach <jpeisach@ubuntu.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: watchdog: apple,wdt: Add t8122
 compatible
Message-ID: <a3055969-31ff-4b33-b6eb-6418cbf3597e@roeck-us.net>
References: <20260507-apple-m3-initial-devicetrees-v3-0-ca07c81b5dc7@jannau.net>
 <20260507-apple-m3-initial-devicetrees-v3-2-ca07c81b5dc7@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-apple-m3-initial-devicetrees-v3-2-ca07c81b5dc7@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_070638_423636_01CE3323 
X-CRM114-Status: GOOD (  16.44  )
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

On Thu, May 07, 2026 at 09:33:08AM +0200, Janne Grunau wrote:
> The watchdog on the Apple silicon t8122 (M3) SoC is compatible with the
> existing driver. Add "apple,t8122-wdt" as SoC specific compatible under
> "apple,t8103-wdt" used by the driver.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>

Applied to my watchdog-next branch.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> index 05602678c070..845b5e8b5abc 100644
> --- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> @@ -16,7 +16,9 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: apple,t6020-wdt
> +          - enum:
> +              - apple,t6020-wdt
> +              - apple,t8122-wdt
>            - const: apple,t8103-wdt
>        - items:
>            - enum:

