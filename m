Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABAEC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 07:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifb7s8N7ASNPOB9E6is5k4+Ad3fbrf35zj+T/SPZtk4=; b=rG8LoyOFx7hOVOP5O5UhZassDp
	fbI58b+K2Op+ndzm4J3VA3zCEiVYyq/9Ayn8Hbp9MpUP7vQuLu2xItHE2MTw1m8RtwA8DgsqrkrSt
	iq2FblDruJyzY4lutCghucJ9hSOKq2F+Uy4u2/KTGNHTbI4HcdZecqiTwyg+CQG38Q2cUgPqHZ9wk
	JZ69zR8N3kFwSXNr14qxXTgPQlHMAQ0kNcja8KbV9WY5Eul077eAViIsLQ1Iqs176al1fTtvWYZm8
	ehgUqo8Xbvye6Embz8F82tnCdL6nQH8n2xlV2LFHAMeVghiLtNjIsR+uQnk5S55ZNzbGCZVmGQxfR
	4RIuR3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjbG-00000007IYo-2Uf8;
	Wed, 05 Mar 2025 07:55:30 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjQX-00000007Gu0-2ref
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 07:44:26 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5496bc2e261so2967776e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 23:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160664; x=1741765464; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifb7s8N7ASNPOB9E6is5k4+Ad3fbrf35zj+T/SPZtk4=;
        b=UQQLp8L0o1uyUG2YEwccZrRtwDvUw267TZAb3YdosSX6XBjDuL/7Gysw64t8rP6hKn
         BAHWWxx3qw1KoJUhdATCuV/3tEvok+j07ZcPHjn4VXc4U7FlynMq3C78Qx3n7CRJ0LpW
         2AXhlngE/3ZcL7tpag0KKABr/kseZicOwkgYdp68tpvxG9BKLHEKbbHyP1HHvnLvXSPC
         UCcuUJeaYXrRy4FEhAFAS3plAAauoBXh8Eo7ebHcUhPOD4Sxch5ILTUfnnjlKGqoB/vY
         2OZpunESQc/oeCTBB1GtHTA/7A1Q1WFI2XVBU4hfKIvuTVUjWXScTAxxQ4Uv/lLTvR+c
         FUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160664; x=1741765464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifb7s8N7ASNPOB9E6is5k4+Ad3fbrf35zj+T/SPZtk4=;
        b=MhBrgqZ9e6k11+0s+ysIfmMWQmppkLS0YyMhsWzgC4lrB/QEr/gcdrXJQyArGexWUd
         610nT+BeQGqghqXO9siMr9Ai5hx1mRpCBxY20W5RIItoxJbWdtKEY8WR4XuhyS198+sh
         UPDYJup8W8p1VaJQMeApML3s70b0zatGhAwz76xuvhAR7ehpc+RAf8uMC8lX6iCa7ZPS
         t7kNWc/58c9jE0QeZkjOJZU7DC1pOUY4NAUO2Zb8ljMt7RzXAAu6MDZWF8xfTbcs/ZuW
         DaKUwp1POUcS5FaoZOPSWFOaIJ7oQ1qeetNJTxpXFdiDpSdc1x2HKoru07uVvqEDQtDt
         Tnzg==
X-Forwarded-Encrypted: i=1; AJvYcCVcfXf3t63yh2oDx2NKhe2Fn39b3lQQViM7zONtH0wjRJD2IVHmc5Lvs233fGLEHmWGgAF+rRvf45U514YWwldU@lists.infradead.org
X-Gm-Message-State: AOJu0YydLE7dseYYU4bP+B4bq1fhsDJIFZLaCDfhiJ0Mhw1iMcVfjNsX
	/wkDxrhXmKimIsJ2GWNQNBp7q2X7t2HzR0X/SPvBYhdX/kBx19b6JXgDdacpY6hiyQU2Og49+go
	TfEvspNR+AS7ejcITEQ+TjX0suSvG7rhEPG+ZVA==
X-Gm-Gg: ASbGnctN5VYYf3oc8JRO1wepIcgTWTdeDYWpnj6E6ZA/FGPQpr2Bwnaezun3jmim9/l
	/XCFI433pDwWwyMmmebN9UUn4J0h5vj5gKvB9odC/nlXS7SVX3gMRaA5VjA9TyY/red9yLDxGgK
	MD4bu0XhoE29Q9YQgZCMx7meY4OQ==
X-Google-Smtp-Source: AGHT+IH72H1//brTKp7UPeHSY9eMogpG7qFDF82B9TGbZP/N55c5XfFJ3ZljeOaJZN/Ekrf02VMjpTK3YP2YKnwg58U=
X-Received: by 2002:a05:6512:2308:b0:545:bf4:4bd4 with SMTP id
 2adb3069b0e04-5497d332250mr683605e87.7.1741160663833; Tue, 04 Mar 2025
 23:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
In-Reply-To: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 5 Mar 2025 08:44:12 +0100
X-Gm-Features: AQ5f1Jr31kdFtNesf13pMh4snaXBkelieuVeF0YyE3rSN-OSc3IL0WrT8xClu-o
Message-ID: <CACRpkda_QjBpfyA1ig2cC+pn8Xf0Rk8Ox+pecQkbcbYY+8N7Cw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] ASoC: samsung: GPIO descriptor conversion
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_234425_719901_AB5B961F 
X-CRM114-Status: UNSURE (   8.22  )
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

On Wed, Mar 5, 2025 at 8:39=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:

> This drops unused includes and converts one Samsung
> codec to use GPIO descriptors.

Oh I see it was already applied (I don't read my mail fast enough
in the mornings), no worries I can send an incremental
fix instead.

Yours,
Linus Walleij

