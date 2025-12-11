Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9DFD3B9AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 00:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JYkoyZtX+AYaSCjaxLjeTfpVBahhj7hlnNxgfUao1E=; b=VPKP1Aus/0oiU9i7GA6QdbosIM
	mhLoM/DuwMMMm+9BG78jROUIHfg2VLFQAGjZmsKO1oWEmXERre8m32FO74hBO7mME2gJMTUUNEji0
	F7RiKPqledqnyj6b7uNDCXAufgbjkkDerLDwD6jZfp59we9hHg54SbgN7JHDBF1Liel5YF6hPWH5m
	3bcsnFXjkkTk2c0tjNA5NpBdHYGnGGa0WrJVc7b95LCSIBs09zHodncgVJq9glZx+Pob6Bj2rfllR
	InMUgPNBiGQrRhhbBUcE4Up4oET8Ih04eEPLArhq8IHAycdBM4N7Yft3oz5wCfc8qPlAfRSetCbcL
	TlSR7IWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTUpF-0000000G25L-0jgg;
	Thu, 11 Dec 2025 00:46:33 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTUpD-0000000G24w-0N1a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 00:46:32 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5959b2f3fc9so370668e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 16:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765413988; x=1766018788; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JYkoyZtX+AYaSCjaxLjeTfpVBahhj7hlnNxgfUao1E=;
        b=lH10VGF2Rvdmm6XeUy/GcthGSNdsDSMpiYH72LtpkweiyipHcDgzKqd6vUAuqubHyO
         sDeXi08nfFkkHn8pBPrdOyi0vjiRuJEFQp1xv0ux3IixEeYuAXSd6nAA2RPK4tQvCtPJ
         VenRClUMCkKGENQ9y95zVdce6ubD4FMjXHTv3yUcvh71Jz9y00xH+LRcSJOJFnULJqoM
         jW2QY2j/St+P5uoXZtgX6ZWbApc8EGiT03B1s57owco2qXU1Zezyh6oqLNZP6XiFP8hp
         8WCqsIg8DnLxIUCX/GfPVufRrQPcQNizsCjJ9pKyqsO9PmH+5oxBOCIsMhjBeiwzNelJ
         SkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765413988; x=1766018788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7JYkoyZtX+AYaSCjaxLjeTfpVBahhj7hlnNxgfUao1E=;
        b=AvICnTbt5t+BZO1rL/bBIfhdZTdIawQ6X7SgvCCoqt4lgnd0xsQgG6mfWAwlUiyKFR
         YG0vBjJjhjgShGVQVNnVoL2TnnIw7Uqh1FL3JnY89wmSgBN7N7Ewz/kNtVfSxsInBuhs
         TYZM2pBMfGyNfNv/0k+yfQc5NTZ1GmPEUemFuJ1/vai8M6VUORN6gTNjOHvPUxEVI4gO
         nXBQXdXPfpQdQCRRYcQX9yZHhOhrdt1T5UufV9ylxuiezC2Fnznh1JnhAPbtxXQp2UCx
         Eb46Nda6t5lzXpWg1Et+MdHKRps2fFraHJMw2153ENixTuFqkUlu1Shce9o1nWPzYb4P
         JQig==
X-Forwarded-Encrypted: i=1; AJvYcCXOHWhFfx0ViVFKDpEbh3vGh8e9I3CxAx/rzPbFHm8z6IJ8/5czXV/eowOy4sO9H08kCcdQiCdTDDir5caWUM5n@lists.infradead.org
X-Gm-Message-State: AOJu0Yyoqki2ghal/+CE1saTq4VUWmcd06uyxAtpmoxf7bCe0uT5JMk+
	8egakNCJ9rSLXc+L8g328i3xminzjzKXuuWgpqczDxWMA3n4nmQU+vqjf8pc6j3IKuavfzMOUv3
	8SQsT86BA/FbZOf4yRSBwwrqEc3kL49o=
X-Gm-Gg: AY/fxX6c920sX7PpHA9lbls8ILFrjmyslU+ToAGwOymDGzDk3p64dNIF9xneMTQwfFy
	XrwZqnzxtnk0e9yIOT3a4cHVHbLhslR5eIdpYpv8Q1voiOctE88uyFOvOHynefxoIh+tUKN3T7C
	w5Xta3dJSjL6J1HrRu9qBNrLh8WnI0FOtrZ2BwXgXzEYfNnO5CkmQovFU5zoua+Zk1zPPfzwd+t
	SFCzzF/NO+998zvTSILouPw2m/BwwGLtkdDVLQYMEUu+D9iKWuCV/Edp+0eSmyWs0/2fk9D1kk2
	Q0cD5oFGZbppciztbu07h4rMmQRM2RlsKqkxQw==
X-Google-Smtp-Source: AGHT+IH6NbxkTUZSljGL5UXTIkr6tHBMYOHOGf6OgfMEP2fzi2rZqXy88k3bhBA+yI5GG+va9k8Djc20ctoHh43XOXI=
X-Received: by 2002:a05:6512:3c91:b0:594:546c:431f with SMTP id
 2adb3069b0e04-598ee4bfcc2mr1798313e87.49.1765413988056; Wed, 10 Dec 2025
 16:46:28 -0800 (PST)
MIME-Version: 1.0
References: <20251210152000.42265-1-stefano.r@variscite.com> <20251210152000.42265-4-stefano.r@variscite.com>
In-Reply-To: <20251210152000.42265-4-stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 10 Dec 2025 21:46:16 -0300
X-Gm-Features: AQt7F2oJTNhQYHQm4Mp3X_RNji2ahbbkHznpjmov3J1DROZAGzAUDzZ2iEMc9-U
Message-ID: <CAOMZO5B2__4qgJRni=DPxd1QoPQLwO+r9ZbdbsOWXZemVU86aw@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] arm64: dts: imx8mp-var-som: Remove UART2 console
To: Stefano Radaelli <stefano.r@variscite.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_164631_176381_2D27D92A 
X-CRM114-Status: GOOD (  10.12  )
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

Hi Stefano,

On Wed, Dec 10, 2025 at 12:20=E2=80=AFPM Stefano Radaelli
<stefano.r@variscite.com> wrote:
>
> The VAR-SOM-MX8MP does not include an onboard console connector. The
> debug UART is provided on the Symphony carrier board, and customers may
> choose to expose any UART controller on their own carrier designs.
>
> Since UART2 is not populated on the SOM, drop the UART2 node from the
> SOM device tree.

This change is OK, but you need a patch for
imx8mp-var-som-symphony.dts to describe UART2, right?

Otherwise, people using imx8mp-var-som-symphony.dts will lose the console.

The same applies to other patches of this series.

