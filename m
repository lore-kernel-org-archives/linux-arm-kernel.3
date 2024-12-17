Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DA4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJ8xar4h5rk9ad9pw56nXrCo7RziMoyia/Xag/oqRJk=; b=u7mMEqRwhzBt/fu6+NXOXjtybW
	/q3z1Cs1itpSTW8uvmF1+9Gtendc4440Phi6vahkyz5ImykBultqFkMmzYDYjIa8ooMQCSMy1yShm
	7G/BNfI5RN6MEeV9ZjhpWUjgyi8nrgieUODWm29lp/0l0hoWFcDj9knu9YeAL3GR73koOppTY7trD
	qNPNxj4xr7OWkmaFbsHHnpubeNMjq9uCYlAk2QbntzzJ+2WN1slAPuobojUNfqwTXsC57IXK5UErG
	B3u9nwxRJrOZAi7/iDWv94om/7w84l+uipxJ+j07sAoHikel25wKQocLUGAGlrj+2F2Jzl16MiWpI
	S5mKr96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYFT-0000000DgZe-2pqP;
	Tue, 17 Dec 2024 14:08:31 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYEE-0000000DgGn-0eE7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:07:15 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso5470326e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 06:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734444432; x=1735049232; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ8xar4h5rk9ad9pw56nXrCo7RziMoyia/Xag/oqRJk=;
        b=yJV2dtlfKoYrSuB8LPoEhZQ6McyuIkW/rUh0W0QEoq2KlZy5Ldneb/2LksQ0gcDOpi
         zOzCIkx8Fb1phYplWXS6g2IdOT71zvUEsQVDrGoDUDuXieAcHT8z+h/do1OjkD3pWFy6
         V9/aNtFXMdL4ZBOFty+JTA562OpeTR9x9PI+gMcwJsQD0BVTR1Hcnk/b2I9DhIxbpEcx
         zWi6+SN0VjGU5pLs2rq1D1m2kHF+Urjp6vjSgOdlS1lgcNH4idtelSnhV+hywXjLYzj9
         SGhW/JcyOXu2C05YBRXs3tYaJuW6CX+9pOvvsPzRBvOLfBt9e6d1YZ4WHucCRIK1XTn7
         ZEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734444432; x=1735049232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ8xar4h5rk9ad9pw56nXrCo7RziMoyia/Xag/oqRJk=;
        b=ZaItw8tdJa8pBHFfa3xBQ6uE8f1GarqjPm582yYRHBxQnX1qpFq+Wk3MW90xDcYAsD
         Lh1hiI9vWkB4uB03dbby2/CsaZX6BwlgjBSCxs8WWMNPpWBHJoM1vNsjLZe6jJJQWJ+e
         Y02scjxBWy728wCM99YIramUiyYq4nJqI+/aS9439ZmTG0mEiMpCnlGMUWVQZgvvOvBN
         TsqyJsqG10bOgek/FVId9W+zkbaSIenoUNSX2VRc5HXLYyJrFyQcHhmFdfxyHOkuwKJh
         hRXsti+JKauu8889lvwe71FYbZiHeFqHapKPKgdVtVLa1HgGSZ1rucmFrXL6DTqwPoee
         kFcw==
X-Gm-Message-State: AOJu0YzQ9PrqlWp4HrPuu3Up+hA5OqzvwRmMBhkhqc3vHb8kG0E7Vy4x
	lUoIM2leE/wWw/IIBc7b86Y/dRaPVsieu31JO3bisJ4FnbCJpVDyfCMmIjvZcApQisejILfQDnq
	1NU8fy6+rex8TWvrjRSVyMbhg0u4grCAGSCqAfg==
X-Gm-Gg: ASbGncvQwza7LpG5cHvyAkHS1awIR5FBVYoUwlztVqQP8gCMJdNQW+GIY7W3fByP3XN
	nwqcEO2OLYZXJOE9YWggJ/E7Vv/+TYA1rmSj/yA==
X-Google-Smtp-Source: AGHT+IHZjPHjo4Swh+bqa4UnyeL5dWjKS+tvSH7lJWm3TCu3xkZDTEkEtpQJJwyqbndJ5XwyTn9A1top8YhlHpFm1kc=
X-Received: by 2002:a05:6512:124c:b0:540:2311:28c5 with SMTP id
 2adb3069b0e04-54099b72020mr5875156e87.57.1734444431628; Tue, 17 Dec 2024
 06:07:11 -0800 (PST)
MIME-Version: 1.0
References: <20241206221618.3453159-1-zmw12306@gmail.com>
In-Reply-To: <20241206221618.3453159-1-zmw12306@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 15:07:00 +0100
Message-ID: <CACRpkdZrkt7R+NzjQmo60M9sMom_f4SRU8+g+=UEq7hqG9pKJw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: nomadik: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_060714_189573_18D10F5D 
X-CRM114-Status: UNSURE (   9.92  )
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

On Fri, Dec 6, 2024 at 11:13=E2=80=AFPM Mingwei Zheng <zmw12306@gmail.com> =
wrote:

> Add check for the return value of clk_enable() to catch the potential
> error.
> Disable success clks in the error handling.
> Change return type of nmk_gpio_glitch_slpm_init casade.
>
> Fixes: 3a19805920f1 ("pinctrl: nomadik: move all Nomadik drivers to subdi=
r")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>

Oh I took out v1 and applied this instead, I didn't see the bug
but luckily you did!

Yours,
Linus Walleij

