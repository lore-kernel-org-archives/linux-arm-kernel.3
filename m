Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F1CC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCf8INkYZkwdneE2A9LSxUiQ+fJAXd8182xLW+8Tlv4=; b=YP3tvzRAD/ZGL4jmBWI7QYCDwS
	BEEGosdhk71t0dJItCfSnzYxrBCxZ+815BvX0cYboYBwnXkdxncOWtVSd0qjzFEjng4K1xNUjxsgg
	h2XxvOOi34VZkngkTfAVvE+EqDUs8Riv8yGQPGwz1JPgo1Vd7E55D0LFAwVCInU6cdlC+wcQKVK3O
	MD43sxhZGSVB4I5mIRuX+JC5opKmj59xfbO9iW3itemKLq09UAHBbrF9Ol9ZzcuklMe2wFnzgnAoo
	6WGXJy4XGlxCei4NzqjUUcbytfO1ElZbIrsxoE/8r0sxkfcCMJSR1OFcDJtHsN/wPoVnB+hFf2Q2U
	S2Xzb0Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaItM-0000000FaUo-12LC;
	Fri, 11 Jul 2025 18:54:40 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIcZ-0000000FX5d-37kV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:37:20 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-711756ae8c9so18574187b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 11:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752259038; x=1752863838; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCf8INkYZkwdneE2A9LSxUiQ+fJAXd8182xLW+8Tlv4=;
        b=JNbQh17DNRoaJg0xNsHHaHyRRnf4h4MS8rGUyTtgi6DYHW1nrCDhhfvRX/mmaYuJmO
         ekYdL3FGuazop09tq5gV2ICiVSEBDBPSAiFFx5iBe/pe7g7BTery9qP7ihGYKGjiotaj
         2PWckSNs0GIg86o6pyAe27f3MkFdi9An101x0nL4YDDdtLrQ+lWO0SCeHFcCPDYKbD6V
         SDheRHQWUXOeJsf9Tu+8UkP3/HkQ2Go/V8HAsmQNbmwMGa7KmK25Ng4ugZtTLUB6VNhc
         oS5x1wsjzq3BEb/200Ygk3eTX/Ih+MPEAMhv7vapsUQJ2p0Uxh+G6+c9Qf3POdNhgxDw
         r3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752259038; x=1752863838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCf8INkYZkwdneE2A9LSxUiQ+fJAXd8182xLW+8Tlv4=;
        b=NrDzkzSJuyUNW4ZYSbJWa8mgfcpY8qwuVR8C9avoGD68heroKDg0RosHu3RDV1O5mB
         QbomBe+TpXGnRGlcM84j7n6QwxCbUb8D3/KH51OAwLaE1Hs/GbCH+XF2iRcfVqR7QCYB
         yld3Jrs7hjiGzvpfXC6dJ1zQTa+HW38eFwdePbtMm6j2lJc1r2eSvXq7GFb8WZNXmmX3
         YMy1MbUMharBTuefK3X63UJETgTVD1gDdw+ozn94Octui0m3vH8ePPI4Q1FRWH+uOIw1
         ktecG41sPyXEffyiHdIexSxCqKmzZtgy45pCk9TjIPqfvibwk6cwUvlzT/CDcM4AVrdx
         l4nQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8cNgNbyuWr54MOYFVMt/jiFCHBu527wtQ/+U6LMYDtLu6fGze+T6/WABm6umSqPeOdP4Dvnn2GsSK0d1J1+ow@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqice+wfapAQrAI/xY51PkLX0n++3OP6E2SpR5F6y80L5j62Fn
	e3iDUMYhIJjc0jVSt8wvFt+/Gyl/T5OwFQZ0hwT2ax8lnfCnPH2Nk53QqSF3XJ+ZgG4I91QLkef
	JPYPpebTB80TxeB0d+T6cFarT/lyoadDXuK2eDc7otQ==
X-Gm-Gg: ASbGncv2ZzzNcBdBuoCPZg+mNjYqBMVp0vj9eNnnPV8HQsLneRy+rxb0aaPI9opaMBP
	iHgw3x6jMP1A9M6aGBLF91DIj+X3a0dnXH8Z1rU9z3voBqkk2TeJRSHUaJenC1340QqEZDV8YQT
	d7MEhlX7FM1RpSFgftUE9skSLSkk9rGPMcLivrOLLdwl0ZmTKeVszWY6ng6c1gMhEPyM6Crjuzp
	uLBZB8=
X-Google-Smtp-Source: AGHT+IHzkdQtsARg4tgkPF4WasK2Xo6Mfikt+zRNsUMsy8+DUZg6XHckhgK5mt593KfRZFbjIPg2gYdMMhURtB+dxr4=
X-Received: by 2002:a05:690c:f05:b0:710:e7ad:9d41 with SMTP id
 00721157ae682-717d5d7aa0fmr72034937b3.12.1752259038573; Fri, 11 Jul 2025
 11:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org> <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:37:05 +0200
X-Gm-Features: Ac12FXzfU1xcaSYLqYAP3dXdgN5KjaQup50oBj2gBIW6fBcQFAAh4KjvNIaCjNI
Message-ID: <CACRpkdYfRv-B=p61tVThFkjoqDGfcqOjmHxmj4wv-NYyky2-kg@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113719_799390_BBEE7DE5 
X-CRM114-Status: GOOD (  11.17  )
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

On Wed, Jul 9, 2025 at 4:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Use the existing infrastructure for storing and looking up pin functions
> in pinctrl core. Remove hand-crafted callbacks.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Needless to say I'm a big fan of this patch set and it seems only
this patch 8/12 has outstanding comments.

Do you think you can do a quick iteration of it or does it require
a lot of time?

I am tempted to simply apply patches 1-7 to make your life
easier past v6.17, should I do this?

Yours,
Linus Walleij

