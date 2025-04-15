Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEF6C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=; b=fruhaWGRRqoA/7azcTJYYtFwAa
	jq+xswZ8K9a63MSjmt7Jy2yY+E217rkPK8Hqqm930QG5kBNalm1CcGnUBN7mtdPr0j87zcwF40CFd
	Ctns4cNgubpLkI4TwlLNHBVnB7qTs8YSNt1X44rH+QdvLj+vG4+UFBmAjL8E0ERThQWqRB8wXJ9pH
	OgK8IBvomT0wfozleFjPi91egmFxSS+Vz7ffwtWAiOK1l7jAseEm1235Gz0q8Ud890cn5mo3wvunL
	Uy/AnkzBjxEy1ELCOTJ2Eohg0oZFbtSWgtbpffxPXETHEI9sHyjppV/UZw7kT8vSOfYQLDsj2v8xh
	DNM8oB7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bp7-000000052Hh-1LPm;
	Tue, 15 Apr 2025 08:39:17 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bfK-0000000505I-2BSP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 08:29:11 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54addb5a139so6009993e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 01:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705749; x=1745310549; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=;
        b=RE2vnj7bu4shTcFtbHoQRdRpr7tBS9LNxX0qntvUtnU2i0/09TFKQ5ahGYF3OmDhkp
         5Ub2Ykk9x8+FuVmA2DcX5AJuqR1P8PmGp7V3Fp7CUv0LI54e/xcAY2ck0AttrS9SDS1B
         VQtx1fwe3lMXLeqLM7osPoCO0OQ0YNXsELtdCb2O4o/XzahDTotpv/r6TXGzXuZWavZf
         FImbxc5Ea2xkIlz48P1VvmnWIBfPjiVj42Se+Si+tB8psDAiCXlCpIIcLpURNNrijnzv
         Zs4L6aKBgVYkdn1mR0xzBVBdkH4qVK3fPMSZ3l/HQaIITWNfaFN04T0KyNoyqi5Di5pK
         Yexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705749; x=1745310549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=;
        b=wPPA/AJy6Nq85XFC5zyGABZ9yYT3gAHOLKGqIZOpGdkE69w9FsB410R/vjuOY2XBhO
         K7K1arJ9oZdhO+fhTMZsuvXkMIR5WfhempNpIj5VN7A0ICaVrRaqcGmv+hBTFjF4wNDh
         kX94C+PGsmVl8BodrLOTB7FxpdtXJEG2i1ftH2ISpDt1uQcNjoja+3LIkOed7oYO85nE
         beFqduS+fR7BVfirdYGx2iDAG9SEPpE/y+Kf1CGQT00nCttARAjp4xdCkvX1SyJI5dOT
         snLsemQh0FvHnGKG3y4449hipCH0pgv3X0xQMyF9k8jcsd/ny5iK0L8r8j+grUVpzDAp
         glQg==
X-Forwarded-Encrypted: i=1; AJvYcCUmzb2u7cyiE1wAuBTdmWpHU26Hw22iiHZF6TLodpFm15+09AkUVyilYDilQvWL4hYs70u8akXVpKW71BbnpVgE@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb3EDvRbHuxf+PQ4sqCV+z7RMrEz1nWFxtbHolSmxDdEV0N+q7
	L7eHv5chUUEgfTLIomTNKaRSl3ha4lFNnXR+InA+AHO/IcewdC9lWaiGEApaYxZcr5pQ6rYKZbT
	GWJ4oNI5i2DZjOMSjl5FQ+5l94EJ/Uba78GtkUQ==
X-Gm-Gg: ASbGncsNawgcBYBoBvzzcyVACbon4Rau6QI/WnYFRj8gKk+gzqR/R+OqnP8+s0FPcjJ
	+7THbGM29yJC6fK3E0jCstzGke4Ujn4X1f68TAVg/Dkwm4WfDlCIg93cR7VlAYaN65g8SrCoyLb
	DFmxYZsrg55JVGa89WxNgMMw==
X-Google-Smtp-Source: AGHT+IEldvSloEtUxO9vAvr6pIUF6+6mI//GyNNWKS45SYnCGnbYk7X+AjHq8bg3bqosme6qdruAqr1basQdBWgZhUQ=
X-Received: by 2002:a05:651c:30d4:b0:30d:e104:b594 with SMTP id
 38308e7fff4ca-31049aaef6fmr47714041fa.40.1744705748864; Tue, 15 Apr 2025
 01:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org> <20250407-gpiochip-set-rv-arm-v1-2-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-2-9e4a914c7fd4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:28:58 +0200
X-Gm-Features: ATxdqUFq-Vl9qhescQDJ20ocPhYf75xWr8mTBKZ04eLcprRDa-HJLgwcNWmq4o0
Message-ID: <CACRpkdYN4wZcnmxjh9KGCa7i_K_hKtzvFgBzywbVAfK46A2fKQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: sa1100/gpio: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_012910_553308_D69D8853 
X-CRM114-Status: GOOD (  10.62  )
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

On Mon, Apr 7, 2025 at 9:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

