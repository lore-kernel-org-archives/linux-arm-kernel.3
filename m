Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F11D5B16C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 21:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pK1WczCMZIw0u/2xZq8mRqHd/PyjP8Py22ENm90CJTA=; b=ktfF0V9hhhnJEIeCuUBL6B80YR
	vPA+2Pp1Np3Er+SBg6x/EzrHd39BDUDlOMt5yKoRE/vaUQDzpsJPTmBQ74wpfLXmHnX70jXygzroK
	w45GgFjSUvj92MJVPhoaPGyMuT05WCYFrBSbYQ0idt0vLk2/pSt+IqFJ8PAE5ZxxTvTqJ7eCg8PRX
	6F5Kgot7iCGkvE0z7IKAh//NyMi48LvcAfCEsj1YisSgtx6uFUWxorANwkIMXUYU1tWuCNWSkLwue
	6sDXc7RzXrJIN5SwoqaeWnDfiXiOpaaURnjtocWR+J1imJVK7dS/yhx608sdoU03yGbE+xKsdQhdi
	FRgdi4fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUtrj-00000002kd4-2x2r;
	Sun, 14 Dec 2025 21:42:55 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUtrg-00000002kcg-2tQ0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 21:42:53 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-430f1cd0026so822175f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 13:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765748570; x=1766353370; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pK1WczCMZIw0u/2xZq8mRqHd/PyjP8Py22ENm90CJTA=;
        b=imxUP2c/gc7Wa45tfYYSDZlft5Vcy6L9W1+T5rkyfKUdeTzD/MK0PjUuFGJSq40l21
         zH4mGnRq0Z/uF1D6r9nKOlL/h57OLlHUcYZULEtlAof8x0AE6bIGhDvi4eDpoRRzfHKW
         ZTEOhm21blpm7txh2H2K4xGfohfKeXgpvkD1SPE0wxkMts+uGMOGkyoqdtqX6ETJ10mm
         2VNvWyksYMo4Rh6u/pYuKiZCyhvOoogv6YA6otQz8M8kOVwVgoph4GQWUQKCLuqY1TbM
         +/1wOTuFhaawTvKlgC9DFRGjhD3apOkA5kQSj7wvcU/owhsDDvcSO7/bkmN9BIHjaW5j
         V/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765748570; x=1766353370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pK1WczCMZIw0u/2xZq8mRqHd/PyjP8Py22ENm90CJTA=;
        b=Fry0rBFI1QO0pAjDNC2kI3Irw1DhusDZ/OPLoYZrJbcvbALMJSj8U2p8hjspx2RsWr
         yyc/bb5nb9Zo50v8nMj7I9ZQR/8M2kfURYPcPrYzUUrI5Us0SdnpU3Uv9uHpBL0Smm6u
         ve0VrALtE1uG0il71IkvPsBhPf5LlQXbvRuoRBN4awiOv0wgs4hp5jZ9foTviT1VoO4P
         sk80bnL6cWWYeIGkk/blgw8o/LAsoimV6SJ0lYOKKdbzJFMCxCy933ti+uR7YhouCSHy
         pKslSFFgMsqSd33wNmTkHyeHaAn80RsvunVw9SWGrDnXwOzdrUF3j20Pm0cHU17BV+2k
         xVXA==
X-Forwarded-Encrypted: i=1; AJvYcCWAvoHvxl9cBI+tacTOQQq4CVlrRIxNVCRGWWXk8S8foUqW5+nvl2/awfqORLGu3ePvK3P6DfL6mYXCAycP5obJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyJyMJNO+vwVOjkLtD0ut8zSfMMXBtZP1amikaYhsXKZpeCjDD1
	b+V0+eldWmIQRB3nBWXSUXOLlAjYQ8tJd+b3KrGYolOoILajsbtBaWv8
X-Gm-Gg: AY/fxX5nUO396lNxWjWnP7Ldkq5qDcYPImfxetpNduivfZ1ol1EfJkjy+Kt5rEGigU4
	XrdBMPzJ5fUFLb/q7Ukcbm2Xk4CmjsYEcMq4Fnz5/VaEnjNEnlYJesCVs4XS6jQS1YzgI+JRTZj
	/OriLTCxTVddGX+rXxSyaLHZXWUhxS8Xf4LjQgoigc3KuXAwhyCmED3bCzBY1LEdR9eF4Efq9Bf
	Wt3IQ8KEY9Idy8sXwtA6qaTHAClBSNCNECRsxNK7cabPMItGmDLO54erOAZbKNJUb4wqZ4znP5z
	ALYRWR7GSyKDtT/sHUq8nf/4gYOCMbVgNgfyTj3qL5CEQtz4SKd3uBVb+zeCRi16Iz0+bmTHK8z
	4M61nbzE2tz5gUZhrYIqbIckmJKyFIlatUpUVcHJ9Sp+MOOPudrTbYLAhlv1wSzG4VKiXFOyT7a
	EAjQ+xMsFltxXI6rqB3XiR+WpSA77QHPCD471TfQu0UW9eFVLdsfTLlM/0HkOwZ3EwznAZ8ZVU/
	9PQnnuy0pojOoNmD6/K1w==
X-Google-Smtp-Source: AGHT+IGSOBeRKEVKVoegRRzx46nWQ9m2s3+RwYkJz4Dz4oFh7swBSjzkSvsc4nPXR0ZZ6L2YMWaIlQ==
X-Received: by 2002:a05:6000:26d3:b0:430:fc5a:40ac with SMTP id ffacd0b85a97d-430fc5a456amr2022627f8f.54.1765748570209;
        Sun, 14 Dec 2025 13:42:50 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f7c3040esm5989065f8f.37.2025.12.14.13.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 13:42:49 -0800 (PST)
Date: Sun, 14 Dec 2025 22:42:47 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 6/6] arm64: dts: imx8mp-var-som: Add support for
 ADS7846 touchscreen
Message-ID: <aT8vV_5cZW99YIB-@Lord-Beerus.station>
References: <20251214110531.9475-1-stefano.r@variscite.com>
 <20251214110531.9475-7-stefano.r@variscite.com>
 <CAOMZO5AzuZVkD3rTLEDGFpCx0ovtKfzjZtNgGG0uLDXbPkiqRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5AzuZVkD3rTLEDGFpCx0ovtKfzjZtNgGG0uLDXbPkiqRg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_134252_791030_DCB59339 
X-CRM114-Status: GOOD (  10.69  )
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

Hi Fabio,

> 
> I understand they are both from the same family of touchscreen
> controllers, but shouldn't you use the ti,tsc2046 compatible string
> instead?

thank you very much for the hint, I hadn't noticed that compatible string.
Even though it belongs to the same family and uses the same driver, I will
use the ti,tsc2046 compatible as you suggest, so that it matches the
hardware more accurately.

Best regards,
Stefano


