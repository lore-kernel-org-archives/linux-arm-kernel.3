Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B08CCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQTKJScatLYjbszW8Nmlz+tuTFmWhnW9yYaJmefda44=; b=ZdMWX2J3f9dKc+I1Zs55Inzw0B
	/KC1YMxSrqpnXqqANbtoZDuda3InRucJrkVEPWm4c56kzE3h20qmqR45OKODMDriS5VTa0p0nCY00
	P+PzMkW3OgY8KbMXQ1NEKHAiswRy91e6m7MFU3Cft1CXraRc9swyHgTQJiKO0xmoeeOnQqOT58U6c
	DPqxPBx4Sq2BBQCEEJRusUl3Zt38ucoDI1KPKJEVO46f6mn/IPTfC7wBtXKOBwYPzvNI+mBVWhFEz
	4GzbvyccmMTJCHPZeB6pe2PxN+4qLvDSwMKlNvpZMw8UotULrlhbiLpsawzk6Ddjz/kClvZv8579g
	FoY/feMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVT8-0000000EqIu-1FWa;
	Mon, 27 Oct 2025 22:13:38 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVT6-0000000EqHu-0j7a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:13:37 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-586883eb9fbso6419658e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603214; x=1762208014; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQTKJScatLYjbszW8Nmlz+tuTFmWhnW9yYaJmefda44=;
        b=RHi69pyXEGFTZQSXDd7i3Pe+g9vydOEYbYHDTZxitWMHYOlAF9dNBfBaZKjfaCL5Xc
         ULPJd4O8RJa0OGY7lfFaSNk+jocu8hUn4wkHUtuxvyI1iU9pVDyk+87ZM4ThsKJ/taan
         Wu5FwIXZqWyRFkGWEYlAfRLlhCgnwxP7m82MwmFnMv2dydI+b2I6eKF2DNJACR9xeaXw
         fOtVHNqHf+f9ja7TyzY6odKHtqXKpd+a4p7qWoGpzwJiKWge0xDKLNgXZ5v9TZGGhMqC
         glcoTvH1fw02bs4z33d5nowHMqQCQXdB1hCClyKur5vy/z4WPIYw1z5TSWFeLth4G5H5
         ZrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603214; x=1762208014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQTKJScatLYjbszW8Nmlz+tuTFmWhnW9yYaJmefda44=;
        b=s/0staaSc28LsYOa93Gp4IsMmf6tCPmp5m6Zyj5LZLUtA01fpwaHd7XgHj5MxSMW1X
         W0APNUWRs+5Gq4AZAt3rBahwHHkmi+lsLnfIutg1OCoPhxzQqMuZ89RJbzE6headeDLr
         oBAUfMlLF+A3GDS+/UEyhvXCU7FUt5ZUMpVSDQ7lDoliYV7Pa7GAlyauzQCf27ZeJSAJ
         ItXNkpIJsBQ0Lfg3NMH64h7uu6lR4NtaT3L0sC2Bf2tNSpqCH9kLtpjhLiVTSTn2ZNSF
         XuSUfNd8pxnsXpBdUDcBK5b0DiEbXipt8Xz3Y8iTiW0WFeYMynTvdAmVMX8qhMRs6I8N
         eTgg==
X-Forwarded-Encrypted: i=1; AJvYcCXmSKpEFED1n3msfaViQxo3v18gZP7p0aabFMpwf/MLoVhgJw9lie+MNCFLex5pncQfceps2RHAd2rIXiXKw8Uo@lists.infradead.org
X-Gm-Message-State: AOJu0YwVSelZSfdxXjQZSeNL9aVXBiAq0dVgwS0f7tX9rojUdnxvRDsL
	XNSV+rwAGKO64rdowIXFhN/sxfXQdsLQ0KNObHhxhgSMZyhVJusEVobS61LBqz2RTmEKJPv++cW
	diD/vOQi/ILo1m+qqQScHEpYaxl+2AKXMZmkNkJT5Yg==
X-Gm-Gg: ASbGncvDOgAwRjzGL7YF3/PGLm71bFzwNM6g0p8oeC/ZunxULkrjcfYUP1zrRkOl5JF
	sf7dRxA20YebXfTtNE6WfpyzXltYdZSi2mXgYja2wS9z9qLWoV74TEHXh6OmJIPK0FOa7ulRFfQ
	ItsPp2RggxiS8OT8fZQJ6S9FTmc+XkfhIn4bEnisC+wj745LtRVX2bkGBeTZNxkYv41WWUegqa7
	bK3TuzfQAgf726KVRT23TlQf9yPu5Mmg/VOzL/4GHs4B8XlriJnCuT6GRdXdxtMwdFD/JC/YcX2
	MjDP2g==
X-Google-Smtp-Source: AGHT+IGiyuhAd/g3j8DFK8VW5m7bOjesol+1DXV+h5pePcwa0TlxwvPOrfmVLR7Li8szmQf8I82fLHqa33iH+2F8eRE=
X-Received: by 2002:a05:6512:ea1:b0:586:8a68:9c4d with SMTP id
 2adb3069b0e04-5930e9dd17cmr516262e87.52.1761603214129; Mon, 27 Oct 2025
 15:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-8-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-8-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:13:23 +0100
X-Gm-Features: AWmQ_bnPVCXY1Dpjano01hZ_Z8pqJmAtt3_jZEXugTZ4oHs4-VjsvtZbv--6EHg
Message-ID: <CACRpkda1d+WquYsUq-ntWRC0J37w6=UBcSSAwL_nroS4_h_dZw@mail.gmail.com>
Subject: Re: [PATCH v4 07/12] pinctrl: stm32: Drop useless spinlock save and restore
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_151336_214641_4EF24CE8 
X-CRM114-Status: UNSURE (   8.69  )
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

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> There is no need to acquire a spinlock to only read a register for
> debugfs reporting.
> Drop such useless spinlock save and restore.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

