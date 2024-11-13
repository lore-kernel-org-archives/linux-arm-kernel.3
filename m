Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB71D637A3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 18:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+naAnEhlYo0y7mD9BWzUkdNhpan/DMW2MuKIQuEKRk=; b=s+QaI0BVx+c+pY8/Mp/50m4Mzl
	2CvdgP6dJqojywOpIoOEYj21fgS9Jc9G3hI0iyb6vnGv1fStgieDH0qDiRxehM/nVNXJi2tM5UIuz
	wtOEGi26CixxyFgzbLRJw1oaAjh6y+Sc+n9FskAhy/nNyQ46U87yNAxQA+zrCscgeqdaj2CitWRQO
	4pKfsy66W57IdKjaZA/V6+9Wz3D0fqv37rTGBvwmeBbjE5K/Dh4DPuN0d9l9CRmUIkBTzbAYZ8B0x
	NvM6BrQWiGKwOK6NGRvGXeTKdy3M2UZLda9jdQFnrC7SZzH0Xr++t7mAyEli4l7yB5X/u82Aw7la5
	FwmRHsAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBHep-00000007dit-0HYc;
	Wed, 13 Nov 2024 17:59:59 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBHcr-00000007dLJ-1SHP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 17:57:58 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso100880131fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 09:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731520674; x=1732125474; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+naAnEhlYo0y7mD9BWzUkdNhpan/DMW2MuKIQuEKRk=;
        b=mIV2/Ayy4p9wxaUpF3mP+0hGAdaJpB8IQ9UiNnvvAIRJiEx5sBtiSZKmaVE4LRVrbb
         agr4hChqPVeSJP+JpdUUhRuGv6nJBBWgtRr9doV4S4LqhNl9oCZU4w+5cvTXICLPbIIi
         Wb4cx3YB7qUfpMPvpKkxv0Nc8RsoGJulWQLw9WARRecyEvG7yk4xhxTFl46/2cBsfV1I
         UEM7TbvAFwJT832Y1FWMt5/ua7UbEGFcEj0KTWIHsFb7mHkfQz1zFHr2J5u1R68JN9m7
         NxmtGTfGhp2oxXqyHxDFhucoZPlR2M5Hv3AauH2yEfNKh8sRjALF06N5874HZObp3HTY
         P1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731520674; x=1732125474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+naAnEhlYo0y7mD9BWzUkdNhpan/DMW2MuKIQuEKRk=;
        b=d/WdmyImKkL0KqUU4wROMCGFuA5BJuHD0L8Rii5lCiEeO1sW0DCmOBxsR/ntmEYMpF
         KfTbJdX9sYljiD420XjsEwr5HMSo6MZkvEgD9XJp1bo5Aw100xdZ+7HPHKfnI2BURsid
         JolEEhRTsuRxvQHl9IvdZ4yzbgFkhenEOJDPxF54CVwBN2u2fzJBXVbfG/XTnvS6Nt6O
         C7daSuTMa4Lq5Lx59VteuLr7cMFC/wNrSlHLomDNgkxuwrUon5FyLPTd6lNJTlovT7m1
         eVfjZb8d+RXFWARf+I2aWLjOmnNPont7efr5skZxdhz5XhyPANj1/1LLKWo16gY0vHTG
         UkIA==
X-Forwarded-Encrypted: i=1; AJvYcCVpNm1UOhMs7tgwsol7e8gWGBs8qR3b0MP8N8zxjkOdpBE300MVWv4H2JX6g0rR7q4FO0xc2r6DzXE9zCfH3C55@lists.infradead.org
X-Gm-Message-State: AOJu0YzL4p8Ah7dw2Jl7jaVRV1pKYmC1ConpJRwXL5iGeyUrGsGuex5D
	1ISu/Tt1US8SC/i0H69KyiCFp+ff9xYVoA0q1DrYqBG32E8yXmkWVoFvJN8ViSnLoNaqePmw4V7
	uVG78Q/cv4YPnXOSaPzFkTB3Qso0=
X-Google-Smtp-Source: AGHT+IG+aC5tPt2yrdBuMhr6qpWwFd7aP0+osiz15sDwB3XQBCFR0oq0kfKom9cIQROfLPtslJmNhaeftR6G8xMCBkM=
X-Received: by 2002:a2e:b8cc:0:b0:2fa:fcf0:7c2a with SMTP id
 38308e7fff4ca-2ff202079b4mr141052341fa.24.1731520674006; Wed, 13 Nov 2024
 09:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20241023185841.1183706-1-festevam@gmail.com> <20241024-pep-proud-d714705c9ddf@spud>
 <CAOMZO5BSZ4YAZ7Lqa3eGP9Wx=Ed7cgug==_UZqc7F57=XCJv3A@mail.gmail.com>
In-Reply-To: <CAOMZO5BSZ4YAZ7Lqa3eGP9Wx=Ed7cgug==_UZqc7F57=XCJv3A@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 Nov 2024 14:57:42 -0300
Message-ID: <CAOMZO5AgQxd2_gkcPSdhfSDArEEkBVvo_yAW3hdHVXtHH5FyAg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: fsl,imxgpt: Fix the fsl,imx7d-gpt fallback
To: robh@kernel.org
Cc: tglx@linutronix.de, daniel.lezcano@linaro.org, krzk+dt@kernel.org, 
	Conor Dooley <conor@kernel.org>, conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_095757_404480_05D059F3 
X-CRM114-Status: UNSURE (   6.04  )
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

Rob,

On Tue, Nov 5, 2024 at 7:48=E2=80=AFAM Fabio Estevam <festevam@gmail.com> w=
rote:

> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Can you apply this series via your tree?

A gentle ping.

