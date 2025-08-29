Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C4ACA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xjnj6nPS6qYYbzWCdNkcP1fjnBYRMWrLTWZgkTJjBnY=; b=g7ZXoXG/erp8s6bG2Iiezd11hw
	zJNyXJPqwPc827Q4btcUAv8H9O7haucAu5skihrlOv7r3JyGwjR4PVSwdeJLqb0GYU91H7akQFBY0
	HoUD10yHeTO39SLulCAx78Tz06deNjkmFsb9KrB49G19zD5uP0lPeJad1v6ZZC8+QTR29dDTeK5k7
	kMh6eGcrB05sV+lEmbVaAaETw4sLvpcVSrJAd90BI3Qo3HTlp+zV+HLxYM+n7CnbPU8iEJtnHwbEK
	XuoilsaAlHq1FnBATKBpNpWW6tygOnEMMCF9ZQCcNxEjTdo8QY1djv5IFGzlIie6xTxGxQbP//QBL
	DKDY54Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Sm-000000066XR-353g;
	Fri, 29 Aug 2025 14:52:24 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urw4y-00000005Gxh-15TK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:11:33 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-336b071e806so10585131fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 03:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756462290; x=1757067090; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xjnj6nPS6qYYbzWCdNkcP1fjnBYRMWrLTWZgkTJjBnY=;
        b=W1M0WufqXPsSTV76WZPKGnCu+ZqW1ksRYmjXKaEKuKbrioPpY9Yz2SgMOlUqa7Oko/
         LOjcQ3EkyVLoCPCwdbgQ0Ut8wg8vqgT6YipVIPCipMULNhw1twp4s3qNT+xh0LSpA3K/
         q3ieWkYOBhIzBKgFLDR+u35jDAS7unuXjVNPIv5hIvjUV7EF8w4uBM2ftnS3ZGxquXz7
         YtDMF73QhEzWQjXJNWum9IjLhAW8C3W7AWGRP5OWhHl3t0k1kkcmV5Gmxf9S8Eiz+4lQ
         dZRaVRqTZ5kF/tfLJVb+HToSsn22oMDHvkuQCOgDgGZwk3vCSeY1aYJLfWRgaSQWTjeI
         Gn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462290; x=1757067090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xjnj6nPS6qYYbzWCdNkcP1fjnBYRMWrLTWZgkTJjBnY=;
        b=qKvERSO3OOOQWvWwuQ5YX4I7piGaXHiIuGUTtKcxeEZTUuvwxKbeyuW84gaYisaMBg
         Q/q0XCh9UgKS7thFnJ6d5MXC8OIeBNyWdx898z1Vy0lxm8QXZGWPJlXRD9yTLTWr3x9t
         1FvyV71W3BsAkITJitPdLKP6K41EacY1pVU9tYAxsyev0p7u5idWOMFuHdTCNs1JsR91
         NJT1xRbGqKscKsvXn9BZCCHjowmxIMiLsVOYd5DV07YTTSIsNx0nRuMBixuhgBqnlOog
         bJTmbNcr5UMicchRQSFMJeCa3tKUosB6hw6WbCoXPoI9MvK8ujLrfE9B/2TvAO4F/YLq
         FZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaechf8bITsb/NhU6lxCWWzivZtShz+wb/Z2dfyFNT2GrCyxeEVaUP+Sr6QPik51eDSywOus7YhGWySAiuRU1g@lists.infradead.org
X-Gm-Message-State: AOJu0YyXdTIEp1ZWsVuOkn4CwDMoqB1wvB0xJDeBP5/W7GRvqz1IX28T
	EQOUivWbDYAXH+zZV4I0/u4M14n5lOl5W1NBFi/hjP17fnrsBxXArpeAtXkRrAjDDC6d63EzH08
	ofncaG10CgJLsGXQ/YmE5ZuDqXy0r9GEvLJo1CkV+Dg==
X-Gm-Gg: ASbGncuApReXXQTlTwmXUX5lCaaUWafL5e+z7Vlukvwx2b8b5efuDyH8ouGT3NKyICP
	xxhDCBfreIsNYbh6Zee6AseSVAJWyPjucQ/ScqhLPUJlaeQmBNkzao9FWjqsJ6dFGxWGltHJaWy
	mlSuwj3sOnZ1nRUwdDCoLiAlNnMeVL7mXvoSFol+K66mC9JRmpAB9T7cM0lti/RazeLBr2IR/Ie
	ZMPfPg=
X-Google-Smtp-Source: AGHT+IF2rckuWDB0N8TfxkqBuz+CSPuYoKPwq0L/OKD+eFOshcmaXOwCLTHg9xCg7qGXInQk7y2zM1fsjZxdnfUASAE=
X-Received: by 2002:a05:651c:1544:b0:336:a8fb:937a with SMTP id
 38308e7fff4ca-336a8fb9b93mr12812201fa.19.1756462290440; Fri, 29 Aug 2025
 03:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250825120720epcas5p491e16bbfbdbcd751acbb0c0e55f9e2a2@epcas5p4.samsung.com>
 <20250825114436.46882-1-ravi.patel@samsung.com> <20250825114436.46882-6-ravi.patel@samsung.com>
In-Reply-To: <20250825114436.46882-6-ravi.patel@samsung.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Aug 2025 12:11:18 +0200
X-Gm-Features: Ac12FXxjnbVzeqW8L95iuuSr2TZOHM52rnOiOuvqvFvgSGHYE7jxXOy75cPjyPs
Message-ID: <CACRpkdZwz8C=MRgo1tQrkQzNtKMLV+P-LK8XyRA3eSFW-cbFCg@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] pinctrl: samsung: Add ARTPEC-8 SoC specific configuration
To: Ravi Patel <ravi.patel@samsung.com>
Cc: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tomasz.figa@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
	dj76.yang@samsung.com, hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev, 
	Priyadarsini G <priya.ganesh@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_031132_313733_A53EEA97 
X-CRM114-Status: UNSURE (   9.16  )
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

Hi Ravi / SeonGu,

thanks for your patch!

On Mon, Aug 25, 2025 at 2:07=E2=80=AFPM Ravi Patel <ravi.patel@samsung.com>=
 wrote:

> From: SeonGu Kang <ksk4725@coasia.com>
>
> Add Axis ARTPEC-8 SoC specific configuration data to enable pinctrl.
>
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Priyadarsini G <priya.ganesh@samsung.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>

Please avoid CC to soc@kernel.org on these patches, they end up in the
patchwork for immediate merging for SoC:
https://patchwork.kernel.org/project/linux-soc/patch/20250825114436.46882-6=
-ravi.patel@samsung.com/

I think this is not you intention, the pinctrl portions will be merged by
Krzysztof who sends it to me once that part is finished reviewing.

Yours,
Linus Walleij

