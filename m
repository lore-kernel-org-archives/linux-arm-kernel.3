Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6029C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 13:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=er9GV70+n6drdF5uljPxPj0kVCu/2tf7ro4DCkzk2hA=; b=HINg+j2FJd3bmVzlygUhSu2clS
	DI1fWKCf+v5VddTgVMRgEAk6bypFuzhpWo2qnZl8V8lcvo0ssZBhZXCERo7CVTUu8bA7nmnPxwQD0
	cVaQ7Wt03GMrlHdJbdIuhsJd1SSJ1Cp4bpxEyClCEtv+zIREsfetZHLLsj0cZT2nLHA2yhqcLdP4J
	GMsl0ZUqt/HTZY0BbJ1lDUq0lL3ARPXHQ8hJ7gU8ZIZRaxonwklVjlMoQb9B7D3x3TODPrFSPgW8Q
	OQB0KOn8xrMy+o+jix5hSASDDqP2md6g/hhGiazcBQqNk9RFlxtni7v7p30z32cRMS6+G5tSP/NM6
	V56E6Gpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtAd-0000000AM2M-0k5X;
	Wed, 18 Jun 2025 13:49:43 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRryQ-0000000A8nO-1dLh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:33:03 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-553b165c80cso5878529e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 05:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750249981; x=1750854781; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=er9GV70+n6drdF5uljPxPj0kVCu/2tf7ro4DCkzk2hA=;
        b=MHCcTRoNGz+Sidhum8kKN+EBpGHNfSpV0OVmpyUI5Uk9pyzv+YGajgn5alKNAZ6DR2
         uncvh2d3Y2TW+Aq+36XfcVRsOyw/gYlGG7vQEuDkFKlgHgkl/WHvDx5R3cT9+fjEM8QU
         RfSCDJN8/0b23OSRLwldz2puQ1a5BsROchbzHWgasSRHTUET/cvGL0xLBtwi0X8bMZ3s
         5lXxoORYb4Zwa++UJKpxlusvlBDPfofiFHgTDCOHpskeq+U6AT36Up7oq0WeyJMCeNrt
         UrBvR3N0AUd/LlyDiIzkdfzaqlGiRtWUkZkx2diD3eGBbHeIRcEKh0zifYHPQ2lOiTQ2
         T7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249981; x=1750854781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=er9GV70+n6drdF5uljPxPj0kVCu/2tf7ro4DCkzk2hA=;
        b=lRO52YS6oyFX9onccl0Ds1J44kS63dk8f+Lc8zHgdTVr20njvIpCEjXF6kxehI7SH0
         iC/52JsC77Qa/U8En6fsu4uFBWn87rry0VZKZQege6FbrXdpxgy2k5obhhTN+HdGPmzs
         3TBZiFrZrNtWNqB8MD1ZJjN7wiMjECMmUDQihMsOFSoQNh6z7RLMYyGlaPVZ8YXbRel/
         4AG3AnOtokHkEMeTBtYalR+ZIj2diZLh2E8oyHDWgbbl3jKtGVw1S1Vw5WBWBw1oc7Fz
         vcPc5kgA0Ci82m7WSyCBlnjzSNAOOQjLYLXIC44ukpbtscCimvoESNkgw88zgL7DuLY0
         KbWw==
X-Forwarded-Encrypted: i=1; AJvYcCVDXLFWf1sUElKnc7fHOhuhQ+HT4UYL5lXlzAkZA3gL6S5qukWPlh+lY/uCLNWoU+l63H0GzdUTzlLzw3p3wW7r@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4fAamtbzdj8SR6+F9lEuEreKZwiQ/gzw5ceGubVzV3bODHM3I
	UwkTZGc9vPjLu/181+WArPy6RxohR4SdseMBVUA0T3o9BxJ4Mi/OBZ5vpcVMnDRNX+fAKuw6Q1w
	9TsNMzEuFTboeo1SKVQOSV8nZPOgBg4+7YAPJbG/bPg==
X-Gm-Gg: ASbGncs8/dW4SXTpc3b1zR4La8VY40iaHrNzf9CopRS6R9tgnVGfcF+d6vJCH81DQEJ
	8tnCxo3E6ahy5LQ1iGEEbbJexdRIGAS11rOBI86nVvz1hUAQ9TR1IRT/lm3tmllLDnSygTFLRgn
	rBWxHzo96wcUMPn1n9YPVRHesLy7GIsT+PdhcDl45FbV0=
X-Google-Smtp-Source: AGHT+IHq8x+MK2Q+KzO0wn+EOPqwTKlQ89Mryv/yfukFFFcWkFHUwXTR4wa+yfRd5KaBrFwNGubCyPjw0k/OwXSOfLY=
X-Received: by 2002:a05:6512:3055:b0:549:8b24:989d with SMTP id
 2adb3069b0e04-553b6da8081mr4547256e87.0.1750249980579; Wed, 18 Jun 2025
 05:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org> <20250617-gpiochip-set-rv-gpio-v1-4-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-4-903703881fa2@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:32:49 +0200
X-Gm-Features: AX0GCFsjhUtynB_l1wpCuP4ZMWcDzuGMXSliazPojtQjqWcgC-p_VmDP2UNLCdM
Message-ID: <CACRpkdZPPh4zjL2+2e1_2nsU13TyyDCcAhOok2cF4PGwnqA5pw@mail.gmail.com>
Subject: Re: [PATCH 04/12] gpio: pl061: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_053302_426329_68AD4756 
X-CRM114-Status: UNSURE (   9.88  )
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

On Tue, Jun 17, 2025 at 2:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
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

