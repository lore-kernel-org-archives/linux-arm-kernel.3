Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33172CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMt8f1svkhZE33FXRLY0yAkh9fTWrIdcWz2YobDS3hs=; b=kRDIQ1YH5vzpmZzxP4tXq2SQPK
	D0xjOhW/zJBIpzTmRq+eVWOALi0m5KFZit54UjVsyeOUI9nu9II/QmrdKjMurdROi5NBDrj18okhm
	DK00NBPo0gwJMZcOe1O+jLWlAOWPtQUTBvbKb4yA6YdELUxbbv7QqQz4ZBJSSxSUMddBhzQK2kUmE
	LpOwmTwRPowk7CyTBZXAKx8mlx18oHyG44q2KpEtQ+HPivcPYR3PlHEKJ7p66aVuJlzfsTFauGaV6
	deebFCVej0MIT2OZaNVKQTQmElU9vvMTj7lW8F/nHB11bX8Rjgb2H+XoXPwHJvGw7D0KnnTEm6Y6g
	ydjAXZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQAN-0000000HIcx-2JDI;
	Tue, 02 Sep 2025 12:31:15 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNrN-0000000GZ1q-0f1L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 10:03:30 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-336badc713dso23904451fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 03:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756807407; x=1757412207; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMt8f1svkhZE33FXRLY0yAkh9fTWrIdcWz2YobDS3hs=;
        b=Bd2j3HPazUwU4pBafKWie91ob/XHEoFV8sUT4Tki9jvh0YUPDabggGpIZ4NnAOd5sY
         iQNy+JmL58LsWuJK01qDj/2VGoSNWd0mggqs9KbsXsmYFZ/347uDWdOBy3VElMufAVxn
         edY2jpVEpp1CftB6yqe1X722aR+pZYFXDMzoRYP/TW81R/X7Vh97/JtGnMV3jTlNX4sY
         3cakWUuj0EJ6kom/JZFq4pVwJY/lnPvMOOkPtfSDVKwZGtMtzz7Em94den+8+tLpSea2
         2DKPwNe4M6h7gBZxcJI4qPsijGD20NYnTDuVxaX9EDJUPMKFgqtaUPALaHcrKUkgZglm
         aZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756807407; x=1757412207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMt8f1svkhZE33FXRLY0yAkh9fTWrIdcWz2YobDS3hs=;
        b=nC7+SenyrrHVWqmdU72BJmMBpgbdwio0nPxipnYsKgXHnPTBZWAu9ALdv5pef1XKlV
         NfN5OXMTzcslI/U0h0lGFC2K6oyjpmt/BgnIhBgp678wQArRlSFwXalOAqM2KFfnHudv
         ESSCrjxVnsaySMHMadSL1+BZLGe0GYmnvT/3+b7McKBRxzEUk09BjLfG04YMTlOhSvhL
         ufryNCpbEWUqj/1s2XdzGgmladQX8yxYvRCyww+bYNU9XZ9z4emCdZWO0gN9wV3ezKj5
         j1a3XoW/+jiUIh7K3jbvNNK4SwYewpweCAxqUC7qYnPS4LFMPcvietLnZWbRoeo0pKJC
         Ybrg==
X-Forwarded-Encrypted: i=1; AJvYcCWXZCtcUbhbsA9KYMaVT623DrR4KFFjn4LaMiM4ff0b68HjgZwzND7snBuDdGfhDADcqzHC3W+A3vYZXfuYzx6f@lists.infradead.org
X-Gm-Message-State: AOJu0YyEYJm0GbTyrBah9gt4X2wHiK2H0cyWj6785E8uOQsymWSBTxFY
	+F9U/yy0yQlb/w41aUfLS9B7CK8Z9NCEWXzDzTNZ8NX0FSmf5j3B46sNNYVD75rlZbuUtQ/4U4N
	JT8u2A5vVmpTMXr8i0nGLSV1TlWGkkXWcqzI5+4lD4Q==
X-Gm-Gg: ASbGnctncKr27bT5SEq8M+ltxiQyv/t0gZHO68rzaDSOVzaON4Nj4EWz2OuQmMeIvgA
	BPCYLkFxltWbCUHWe8WDC20Ko8xYbR9FUQI5MrBq0D/skJO73yN9+rCOjrFazSTnfvAHL9wzn+r
	rxPji06n4IgrFqUki2SEP7kx1F9+YUMYhnXDsYY1RZmrKT7PQ7/JqC5Ex64LSJP/T0TasARCrsr
	22QYMMZQwE7niEOjA==
X-Google-Smtp-Source: AGHT+IFdHvcUVxSylVwD2vnKLU9FQTJFLwj42u6Z7wlm3bxT33e3D2bu+wc3U3jlI6g8xaBcDAr/McPTMKQVI/EszFU=
X-Received: by 2002:a2e:b8d4:0:b0:336:7121:525a with SMTP id
 38308e7fff4ca-336cab0981bmr32752001fa.25.1756807407065; Tue, 02 Sep 2025
 03:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-gpio-mmio-mfd-conv-v1-0-68c5c958cf80@linaro.org> <20250811-gpio-mmio-mfd-conv-v1-1-68c5c958cf80@linaro.org>
In-Reply-To: <20250811-gpio-mmio-mfd-conv-v1-1-68c5c958cf80@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Sep 2025 12:03:15 +0200
X-Gm-Features: Ac12FXx83c_FhzzXPFUThYNZRpQMbuI8Pyqd_lvAWb4e0eyemL5lMdz-E0s3cCM
Message-ID: <CACRpkdbLoa518Nu6UqFcqgx5fvqv9Uj5o_etybO+sxZpDQ3_Mw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mfd: vexpress-sysreg: check the return value of devm_gpiochip_add_data()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Pawel Moll <pawel.moll@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_030329_203154_BA6D0E4A 
X-CRM114-Status: GOOD (  12.05  )
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

On Mon, Aug 11, 2025 at 3:36=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Commit 974cc7b93441 ("mfd: vexpress: Define the device as MFD cells")
> removed the return value check from the call to gpiochip_add_data() (or
> rather gpiochip_add() back then and later converted to devres) with no
> explanation. This function however can still fail, so check the return
> value and bail-out if it does.
>
> Cc: stable@vger.kernel.org
> Fixes: 974cc7b93441 ("mfd: vexpress: Define the device as MFD cells")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

