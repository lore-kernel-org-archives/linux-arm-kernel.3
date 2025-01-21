Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802E1C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 11:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7zIFb2biPGgp9ksv7Po3u3QL1cwm6u7lkcvFCycA2I=; b=ThbfYwxblKwQtx0z9v/24vgVmc
	WB+oPpijjUjD220fSw5AmxTV2Rk0iJZ4paAFdRTGvgTtpFVPPiv/8zwSFESGGVflUIDNCUiPIz1VK
	voMUxDItWl+8ms8g38Nd5afUbQygXsP2gGBl+m2Lz0RChmy6XoFyOKo2wTnSKRp5JzatpdzW2w1QO
	C4ZNlR5ZcXCsfbWtcbCMea8nXhrpUhI0thTUqoJax6/4guaRqsuHjbIqn9wto3eIHWyGyyl7pnfA/
	QRSt9mBhc/6iNyVZanDBAbKC9aq/1o3NUQa4flXjtlEmoHbST4wnplILBfM2r8VKMYrm6Af50PLDr
	IUel0hzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taCLG-00000007k8D-3thC;
	Tue, 21 Jan 2025 11:22:46 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taCJN-00000007joy-0XMZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 11:20:50 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-436a39e4891so37366735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 03:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737458447; x=1738063247; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y7zIFb2biPGgp9ksv7Po3u3QL1cwm6u7lkcvFCycA2I=;
        b=elkxbjFJHCjj4q/Bzw/Xt6kHDNVh58ckkw2FqMPolBOdiwXNrdLaReVbX+hfgDl61J
         VMUFY5wsFnncnHM9sc7OSSjrp6S8/+KVTsXY77iLvqWyQ/IT5N9CvJ4RwcDy3XmG1aGV
         j6viBr0kruspWeWcFHB4nW3mjBmG9RFF+B4G8f/Ks05+7d6AAUuYrjtxMhcX0lkTxkVJ
         r8kx2KWP0ITxdCSaZc+97xWbZO3S5XweSfRWZjQIggpliNYFytzMGYtRNPBiumOJpgz+
         hPyU5gf4kZvwF4Fxtc+thV+AJmc67ozIfFxHctjoNUufedZJjPP8FMvQhgYmEgGXCI8E
         KKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737458447; x=1738063247;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y7zIFb2biPGgp9ksv7Po3u3QL1cwm6u7lkcvFCycA2I=;
        b=jxmEbXTrxXROwKEq6y7iYXCSTT5OuyuX6cSElW6YbvgSSbi5hBauRe8v7yYF3KYMWY
         X9k+XAVjnUys/AlQXBUEkzITror2cTkuhWZPBisDxD7CG+ccRJbdBemYkNFjkgU8FxK5
         9jWv3zUOo+jzz6lcU/zklCkLSTRAsCn+YrcrlTYIC/1/yLcTavBtv+nOKHtf9mKbmaRv
         yCGb2P4l7ec/EyS9pscSEH1mNIou/gTbcCCde0W6n+TbXeTL5MWgYhxql4a0eICW5mRu
         HGceUtrVdkgWpbldLf9sRRd0b5ut2bJx5StwWDKbFxP6XSO3qOFmiyDfbtKw1n47Ny5c
         6+Dg==
X-Gm-Message-State: AOJu0Yy8fP6UpC1PwvmM1QhyANCx+Z/+24/pDXwVzBy8X4KyJ5M2QhOT
	3FlJvqt9/1uGsSjYfGwEGXOOVcIP76dvp4TabFBUjC8qBg4CIFK/u1pCfMgfZKw=
X-Gm-Gg: ASbGncutnIHDWeoNI72PnwIL/NRVUIZUY75ToazmAL1mi67uborw2Y9pnGuILYwbiB6
	5xbz15eXUHTbCO/e3yBnuoeSa+Ah6HDNfmW9y8eL8nF5cFsqp0AS9/+cuI5x+zFi4pfw5C9qgU9
	Xk5f5rNIx+qbC5iKKhjA0qTrrWAd3WaGsNQ8/tTI1yNxW1/IbW0ESVtopR1pZIGeLU5rF3uhLt4
	9U9QH3AISk5FvwTxft+eEgdJXAIugdHSTVdDfGNbgVl6GF9tMzb4KItik92sSuou024I5y6jg==
X-Google-Smtp-Source: AGHT+IE0y+tu0fWyAhJdzk7OF8kSuvMPYyFJRvvseEP3YUChEAoRqL2VBPrLKjVbpVCv/r4cnPgqGw==
X-Received: by 2002:a05:600c:1547:b0:434:a04f:2557 with SMTP id 5b1f17b1804b1-438913c7fbcmr154303575e9.4.1737458447389;
        Tue, 21 Jan 2025 03:20:47 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499942sm234080805e9.6.2025.01.21.03.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 03:20:47 -0800 (PST)
Message-ID: <4ac64a481d80785973d038b9292a05781e70a670.camel@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
  linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org,  kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Tue, 21 Jan 2025 11:20:45 +0000
In-Reply-To: <20250120-pinctrl-fltcon-suspend-v1-2-e77900b2a854@linaro.org>
References: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
	 <20250120-pinctrl-fltcon-suspend-v1-2-e77900b2a854@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_032049_178399_592F1DAD 
X-CRM114-Status: GOOD (  12.11  )
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

Hi Peter,

On Mon, 2025-01-20 at 22:34 +0000, Peter Griffin wrote:
> gs101 needs it's own suspend/resume callbacks to use the newly
> added eint_fltcon_offset for saving & restoring fltcon0 & fltcon1
> registers. It also differs to previous SoCs in that fltcon1
> register doesn't always exist for each bank.
>=20
> exynosautov920 also has dedicated logic for using eint_con_offset
> and eint_mask_offset for saving & restoring it's registers.
>=20
> Refactor the existing platform specific suspend/resume callback
> so that each SoC variant has their own callback containing the
> SoC specific logic.
>=20
> Additionally we now call drvdata->suspend() & drvdata->resume()
> from within the loop that iterates the banks in
> samsung_pinctrl_suspend() and samsung_pinctrl_resume().

Maybe split this patch in two:
* first to do the refactoring plus adding exynosautov920_pinctrl_suspend()
  and exynosautov920_pinctrl_resume()
* second to add gs101_pinctrl_suspend() / gs101_pinctrl_resume()

This way, it's obvious which part is the bugfix and which part is the
preparation and I believe it'd be easier to read.

Cheers,
Andre'


