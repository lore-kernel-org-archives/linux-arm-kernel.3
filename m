Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B012D2AB2D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Y3lWwBLaNSuSrYHVXg8RSL1GdlpeH3OKXRkXftMX10=; b=MvvyII4lu3G+cnSNjKKxectjpd
	gp8G6egetkJM7TQwFCzfslvgFkX67HT5l54UnqYRnr2nFoxjHcDuNAe3EIKf0hqX4Q1zdX4k9gfIt
	VohAY9mJfaDeUjG63SDrUR+JUSOMweQda85L8H+/+G8G6VXGF9MqB/AvTz9O3zE8p6PMNv+C66CBt
	V/n8P8FUwtbGwFEUeIKI+/FG5OC6IWiOGazmKNK0r1HP87pq2KYZ4CNWETX88bS3AqXUZfqFKvywT
	SI2nyw31xkuMpJRJp5A7q5zm+T92K4Rk0VI8jP2BnYjDd0hVUbXITpfj+b4evUmZGUBWnsQUb4KUO
	mBbze8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5l1T-0000000ELmv-3Hsj;
	Tue, 29 Oct 2024 12:08:31 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kE2-0000000EDIg-0LgB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 11:17:27 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso48632761fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 04:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730200644; x=1730805444; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Y3lWwBLaNSuSrYHVXg8RSL1GdlpeH3OKXRkXftMX10=;
        b=eSAvrjOhnUIc+aVRSHcdR+bzXJCGaGM7AW2PlxWpn65olJsTOyhiz1Zw81l7/kw6up
         ldCAu9mAqbBfMERdACCAiew4i/GwPg/MhULv4FUY1igQsVoaSnJ3F4WY4B6lQPNJ59a7
         WzP5dxDW7RR5bLO7SSEM+oPV8nbrhZbXV2EA2q13g0CxidjJNVRpDg8F945mlq30JTht
         8/kWWczCkBxU3GmpawGnsHnC/UJJ4oIZYfbIyOL7LyF7H/gkLEt0dd1mEGgCcLRVzJbm
         4T1hUuJEiIIj2iId6Rjloqk0+Q/BI11BwLt+Gm2RswB0+nzyTmchxmUEjxmOC4acxIOF
         53EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730200644; x=1730805444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Y3lWwBLaNSuSrYHVXg8RSL1GdlpeH3OKXRkXftMX10=;
        b=c2iHR8CK1nWK4RNuMUTKPGevbzXpHCa2Qg+ezw6PZNBM5cbXK0wHBItxQKX/d8KASu
         5SAfV40+xQ91RcSiqM6uZNecIdAbCLT15pJ4nsR0UBPm9qgKfaPV+W37KlVai8CQpF/k
         y5QpgQbbZXqsdfYHR1E0Ub8NKtrJTLgZOjGmrZ5J71QdQ9JFmnyfz48YR87Z0fNdBl9t
         A36C5rGBq58abP+DXfeZ9m35IEeSadYmrC/X1Q79JRiplOt4AnvEE+EdmKU8hXVcWOmu
         bic+7PzZrGmlveRcWiHp8WvG+dUPkTSCJVqSMwY6coOREEJu5vn/lIXQSODGBPwkVMt9
         9iIg==
X-Forwarded-Encrypted: i=1; AJvYcCXCvf1E54yAxiS4qNUada0FvqaojqzOK9P7vNUIPxYeufHPuv0JwM/BqNsAL5wTiCb0cmrm52gf7AgneSWKhAt8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9ZcZViw9oScX+4JgEJQiwqVOM3OsetJohkfdJTURbS0yjNNJs
	POfGtoOihjEv/BplbIUxZsMLYpfIH9A5C8d+wmM7zZQONBGChn1gdCRch1aaaiP081ds5uwkmqM
	gIiyUwvwig4wqXv7529fkTnv88Kw=
X-Google-Smtp-Source: AGHT+IGsU6uHMBv+O6e4BbQ7UJDSfYHHZAkZqCwn67mMrBXMiocwqn/285jyQOio3gIiF1T/G3/0V4DT4isdy5AAHHY=
X-Received: by 2002:a2e:f12:0:b0:2fa:dc24:a346 with SMTP id
 38308e7fff4ca-2fcbdfbab66mr39852531fa.21.1730200643976; Tue, 29 Oct 2024
 04:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20241028180844.154349-1-festevam@gmail.com> <20241028180844.154349-2-festevam@gmail.com>
 <20241028194728.0655edd3@akair> <CAOMZO5APJM57_ixBiRFZSZex3AiawA=mtqMszdGezVoajaXYhA@mail.gmail.com>
 <4addc413-dd13-4867-8c49-45539af7b45b@pengutronix.de>
In-Reply-To: <4addc413-dd13-4867-8c49-45539af7b45b@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 29 Oct 2024 08:17:11 -0300
Message-ID: <CAOMZO5Bu5U=MGq3gzOjaeWuhnowJ-TN=ktCtw_eXDO2Q6Kxbmw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6sx: Remove fsl,imx6sx-lcdif fallback
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Andreas Kemnade <andreas@kemnade.info>, shawnguo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>, Marek Vasut <marex@denx.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_041726_144706_4377C90C 
X-CRM114-Status: UNSURE (   7.78  )
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

Hi Ahmad,

On Tue, Oct 29, 2024 at 6:50=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix.=
de> wrote:

> With an eye towards improving device tree stability, I think it's more
> appropriate to adjust the binding to have three compatibles instead.

Yes, this makes sense. I will adjust the bindings accordingly.

Thanks

