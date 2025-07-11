Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8235C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4q8ecDX3sUGA1MLG8h4tOnFmYn0XuYJcSIMOO9sLLY=; b=C2JlVJHQriCvA2d5a4drQS61pi
	fK7sX/d8OzVEUEV4L9tc51j/T4MVhYS23xuyMbkpkggWySb3uWJj5c8vzLTiaNS8Z4udSpA2Jw9Uw
	NR1uGa3evjlmWf6kplPLi/u0O4MOLKUIowg4llsy3guyaDD6I+K7/9Y6C2j0Ad92Qel+/JkNj56aY
	4aKG4CM1c+3LhrffIGFxBKAIQD3f2PFU4ccfzjWPrSukRDEyzD5KnsACOKyc70eymPiaqmxjHTKcR
	14/4evS2/dJ3iNSQ47pr3J+yERaOQn7mimRReCgaA5h/WK/SmkdOgi9g+cwbug5S9ka2b0SvmYd5g
	6NMx2K9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIKE-0000000FUPb-2OQJ;
	Fri, 11 Jul 2025 18:18:22 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIHI-0000000FU8k-1QBP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:15:21 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-32b43c5c04fso30156031fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 11:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752257719; x=1752862519; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4q8ecDX3sUGA1MLG8h4tOnFmYn0XuYJcSIMOO9sLLY=;
        b=yPjvlBHxMxK7MgS8SsU8ipp8kqkFHQu9s/CKjIg+Cvxhj78GTWyAmV+bVY0ZTcrmQW
         XZNu/Ym4niUM/mCqRFry82MsGOUot/EnIWTrs0mKQDAuWO+A1s8z7bcCHsVzYqa71p3a
         PYT3hH64VphDysyCoG0Dn6b95mh2uBc7t2oFvkF1BOOzciLbFOJ5t6HubrpuTpDVg+hM
         ep4RCObb+ZNij8mHB+sKGzzuS+2AZK/IO5DU0M9WoK9+gBP8vcNtpszC/4Tjkn5Hy9Qy
         Ew36JaadnlaJfiqFJdy+7TZdBdZzDFdkBYPXhZPOccVTOJeeGNxi7oCG0c4Qtsyd+OCO
         hrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752257719; x=1752862519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4q8ecDX3sUGA1MLG8h4tOnFmYn0XuYJcSIMOO9sLLY=;
        b=inNA664CwFW0sG/z8jf1TxaTNrB6OEGTs5TxMrs1hZeNRXZUQpAj8zQL0yvD8OPxpa
         BrDwfyKjwaNqnFUIviJgnyHlCxN1dh5VOcnFd5Am69aDyN2tS5tRpvHGbx276rlrG1QD
         tEl+krVAnn728PJ83M9Cwjaq9UIvrKde7P5QjQZS/E3vDP41aW5oyZW/a8o38f/t2xBf
         wBLaAIjHsLddM3VE0YI04n47xaNyWYAHKYGxChy/u5NX9zBdHxkPdcNWrilr7iV83/go
         nDuxDSA09Xht1/DCzELqe035xme11eyG4NHCgL8OBiRqiU6yjjT2a1Btq5kkp0GIfNbd
         eGJA==
X-Forwarded-Encrypted: i=1; AJvYcCW6Q8HwkqChsXsthTrt9erd5hkU6Qvy0DkdQPiATWRm4FoW/Z7MVjCy8wmso7sjnV4YsoNzPlQMA2DqwzzwKl10@lists.infradead.org
X-Gm-Message-State: AOJu0YzHQusI6xtTCmR5aQOcwva0ZiRaMTeegfhQgdIACE8+B0rH4+Re
	4yKOFRxscxVnH5tZP3vxIGYyQ1nyvom0OdNeceMeY3iTT9Rz7O7Qn0Yxk7jr5MuMQogYqibiNb7
	feos7F3ACLNHCG2As0K/ACYLc5mV8lpQeEEWeXASwKg==
X-Gm-Gg: ASbGncvHy0aniGMJEu4boKrt0mabSAL0Y3J3CdIn8ZRuKuZ9QUNyFrko5H5404OMpmB
	d1xCCNsQeJrbuvvHWET2md8lGvfmmEC3uHCGy6+2Q1boSXwPBCezJKOBKZnWfCYBd4b1zTUpwGu
	kp/3ARx+COx508gNXqLeQdwu7JI0bymjnC3U8/7GWn7fx93+svHF+84PaJznpc/F02AfIcxcpn7
	VYG7iSoPFyGqz2q6A==
X-Google-Smtp-Source: AGHT+IFtq0bcfpLwnjm7lAoyNxi5hVnB1TfQxkFuJUC5AXv/cwm7YJlwpXzO1clCMxtNVbmVPeTDx2oSZPEXUcqu/sw=
X-Received: by 2002:a05:651c:b0c:b0:32b:968d:2019 with SMTP id
 38308e7fff4ca-330522ae9a3mr17428231fa.18.1752257718550; Fri, 11 Jul 2025
 11:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250707165155.581579-1-paulk@sys-base.io> <20250707165155.581579-2-paulk@sys-base.io>
 <20250708003236.059ba94d@minigeek.lan>
In-Reply-To: <20250708003236.059ba94d@minigeek.lan>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:15:07 +0200
X-Gm-Features: Ac12FXytqUPkCHhoaHentXWpf1pNxNpNZTLS_vr2xp21e1XJ93lgB-y8FM3uD_g
Message-ID: <CACRpkdZjbGLiZYLYxz5UoMXyuhv7vBipy7YRkhMYUfZLgXr_ag@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] Revert "pinctrl: sunxi: Fix a100 emac pin function name"
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_111520_382280_74EFB13E 
X-CRM114-Status: GOOD (  11.72  )
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

On Tue, Jul 8, 2025 at 1:35=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:

> > Fixes: d4775ba60b55 ("pinctrl: sunxi: Fix a100 emac pin function name")
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
>
> many thanks for sending this, it looks good to me now. I just wonder if
> the original patch can be still backed out, I think it would be still
> time before the v6.17 PR?

Yeah I just dropped the patch :)

Yours,
Linus Walleij

