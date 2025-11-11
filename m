Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C82CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SskqgXLt/V1yNmdj79sn9yutCDT6ypSkI+cVjqdA3Ec=; b=PDNITv/SvDiXBwFJXP3M1ecOW3
	KC5V3Z3f1d0aMB3ucQ50P/QyvmHlY0skoJHdRUFqf3GxD7DkpN+D06KyG+c5OQ23sct+MX4lKm/Aj
	UzYCF6P/h/yOi5kOJlyg8xLpdQhGA0UUBJvzdNvILGr757HfdhKcQ21XmVlI1kJ+vQQwQQdB7kKJJ
	VZ2zzB0FJBG24znAnWfU+wsqab3APLYW1x7U+PGP2c+YXj3HEBg5Kv3H26UeiG2JN3xZkQgO0sLYv
	Ty5UNBoNRHqdvZx/vLpj9ogHlB67JbYWvOQ+jNynmn8kFbEsfV0cOPbOlKncVhQQvjIATWUtz1TaY
	Ll1+7xqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlqr-00000006ytW-3hwg;
	Tue, 11 Nov 2025 10:43:53 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlqp-00000006ysD-0LTf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:43:52 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-7880686d178so4561877b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 02:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857830; x=1763462630; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SskqgXLt/V1yNmdj79sn9yutCDT6ypSkI+cVjqdA3Ec=;
        b=SJtBEcFf0xlJLUYc34sLw6Fi+KRskvBY67G7QdiTqKW2vAWf2sI3h7AO3z9VBxspse
         hPd49qghcs5dr5V9dtHsSGA0JOCcAEj61YpZ5NdZGRXJBUgbMSE5Ee12fdfYWn1MebED
         efM04/ofdIBxI/OmKE0D1ypQkEe7oLDlkVqpKgjgOaxSVwbjP0kH6wN2Ta6J0Y95s3+v
         LtoBeZkOFTG7rsRCRDGjuFu40bGNFXdQenlHU2wgTlzLb2mc4DXIHcDYrYJvxT//h0TT
         9zGf1cTl0DzVpYjtRJX0dRvveqJ0GXA5zKeg8zRcda9yMDj2wX1WQuw8QVSiDQG9xFna
         z0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857830; x=1763462630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SskqgXLt/V1yNmdj79sn9yutCDT6ypSkI+cVjqdA3Ec=;
        b=ZG+TyNBfzvMHMu4Lspuw8/hzXhZX/wj0ZRmVjb7ueHqVZunQD1w1r7AIP3WTP6QtIi
         06RLF//NpgbwoUN+zzKpA4tsoHtn6yBzgujiDjha9a2aeKYyS+FYihzhV0htm5S0OAHY
         TMNlRbeZXXtXVUv5rOtoLYUH/y9C8vm34+1MpXqQnZtFc4msuOYJihKPl+KWntLUGKO4
         0f4yCMrc309FIU6nIyeWGzo7ePylNgdoZh9Vt4oyoG+4UHCVTwcJanl+DtBru9tOhdbH
         xnoAsocVSmnH6a1FPnvyMHytK9JhbOnOGTEFMIGSLi2SP6OFRp9Oy9pxHZoTX3Jx4ZY2
         AiYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM3hh2JxK/SfdqItQ2BEmqogds2rQ0uDUcuJmgACiJ/865NaCYI2rXxPBx6AsIbbdWCtMm/p8F7j13lVdRa68t@lists.infradead.org
X-Gm-Message-State: AOJu0YzAPiXRFPKs0xtLLVynYrPLVhD4x6wrI/r+7uK7mHtJ+ljyYFlo
	MrvnkqRgunNGQjXdbNdUxzdULHrfx5TqS4b1y46h8Y0WQubr9bhFTbUTi7trfjT5+zTvjQt18wz
	ZnddqXEPq/+A9fY9VsfvIRc5hpv2y42dgxUsk7M+Sdw==
X-Gm-Gg: ASbGnctEOPAxReuSjDlahWT/tf4TgbKU+IuUi0r+gLSUE2msawxN5uTZnYZF5rK5Qh2
	tJlNIed4ncODE6+278YNrgsux4mczOWryTprjx6fthasubHq0A1AiX8k328Me9mxxvvR5q7ywJ7
	4jjOW6LA6+KENpdCNoB3v1aPTin+T4TQPvZsCc/6ApP5LDw8fF2mmzF8c6y/A7vdzJr/LjuOF8s
	HaL3GeN0RcBLRIzg4A/zZPZBzV7oE3GiaZWqtwXiDalc5KeW3uAO0ZsZldDWSS+CLgik10=
X-Google-Smtp-Source: AGHT+IEi46gFe2Gc58dgZGHKXPtg9MeZZjbfraM5Zhb8zF1ao1O9DUHuINeceNpyj8ML6p+v/cNPJjLoRvHJIEr4ZNE=
X-Received: by 2002:a05:690c:3505:b0:786:9774:a3d2 with SMTP id
 00721157ae682-787d5470c8emr109020077b3.69.1762857829792; Tue, 11 Nov 2025
 02:43:49 -0800 (PST)
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org> <20251029-gpio-shared-v3-5-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-5-71c568acf47c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:43:36 +0100
X-Gm-Features: AWmQ_bmyzwb3DdThSflgKKoxHLLAiD3IBdKLnNpObGkxmw37AFoyfkH61KGqKvo
Message-ID: <CACRpkdazzchuetece8WOJ+0D002HXhUvK6d47JmyeAauopoZXw@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] gpiolib: support shared GPIOs in core subsystem code
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_024351_419049_D9C1DA78 
X-CRM114-Status: GOOD (  12.07  )
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

On Wed, Oct 29, 2025 at 12:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> As the final step in adding official support for shared GPIOs, enable
> the previously added elements in core GPIO subsystem code. Set-up shared
> GPIOs when adding a GPIO chip, tear it down on removal and check if a
> GPIO descriptor looked up during the firmware-node stage is shared and
> fall-back to machine lookup in this case.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

