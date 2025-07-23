Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE31C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 11:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1YmU1ykvA77GIulXJEMJLdju3jM88FFVo/Kazht9VA=; b=Hdir16oe1ST9GRZqUj0IONbbpc
	LnFQDjO7N70cWhdlPaewm1U85emFajJtX2xCR5TZittl+Z0YMEWHfUhR5sKPMG9FoY8HdPKWBGcxB
	Mj3wuES8SPzxAX2Flo3QwoYzhgcwUczL5z+q+o2Cu3EiGbKiNAoccbTAwz5K60zTS0T9XNgQXer6v
	ZOeUIv4YiDj6tevKdfi7bWGVvH5xNFH5YnV9p8hdQTxWGuJCWSDRcYmjZCMg2s814LXjD/oqDqI1e
	j0VGyUJJ1oncPzXkro7sYxsa2X4fOpUNwDX6gf2BDNqQhUlyHP0scJ/NKohPOEr/mMqDSk/7JeacP
	e9osayFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXbh-00000004noK-4BvN;
	Wed, 23 Jul 2025 11:25:58 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXZF-00000004ndK-1lRY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 11:23:26 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-32b43c5c04fso8656221fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 04:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753269803; x=1753874603; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1YmU1ykvA77GIulXJEMJLdju3jM88FFVo/Kazht9VA=;
        b=RXXkjm7TCTgyZNLBVFVEtz9V9Y6bA8GerU7R7Mxkd8IXmtN2EhWC44EYLLItcziV5N
         GFzsUxjkc149w81xUubqWmKCXo2J5Ei134gGuyXXG9LDwjAL9AszcoXNxDAVzAzTebuJ
         ieRYWy0AKabS4XMUkZlgZlxO5ez3XRbzqhKE2ep5UhoOquC+bYbF2L8gmVoenJjd7Rgn
         Rzx32OxTuPZxJlR9Tp21MB+7DA5rv1xjA/JzZ6UwVs48XV8WpQ+y3aYFQiEektgpmICA
         iRm+4woigEy/ZUtJv2pBjd/l/oRHZ0XLjR3w0Lp+PfOfLRPVdoD0fFy3wAbkPVSj9KDM
         rpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753269803; x=1753874603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1YmU1ykvA77GIulXJEMJLdju3jM88FFVo/Kazht9VA=;
        b=v2Oq1rkRnkUPJNs7CemU+gtxBCHCvMFxFNgRIHJ5heDPflKtTVeBF4331AeAoZRK99
         XTqYvsS0xx6rpN7u72RFeWJ69rucYN8lgcqJIyS+wG0sQtuP3URCHAaBVaJPL9sYwfef
         q8zybRp2nX6FD8eiS35uYUx9dmwmE0Pjb7cqJKmTHy63pHzgGBs4/7iMF3kCW7RnKtb0
         ZrYbu9G8dDN/6ALGqa7MH7arpNanbfL7fvRZGIm9BqF/MZXS/9FcgZAFEmT5pW43lujC
         IA9Uc5wMCWY77/qCZfapf4pOALwxw/9vYzo2O3fkUMYRdsCUhOqbCVRbFC9Tdoy+lHCl
         YSeA==
X-Forwarded-Encrypted: i=1; AJvYcCWcjEVuGKZkVAb7KBlw9WV5OMCTEMxi3MAjXZr6YrpImVNIzFgFQrRWxUfOy1g7tyuPAWZAdX7mb7Eu+2VJEyMh@lists.infradead.org
X-Gm-Message-State: AOJu0YwvLPr97L+jw7OOJmjZMZOS9pSUc0Yak2NTMEH/WE1dka21srHC
	5PlGn0FKDz+Poof02lz6iuORm7rIX6/oaXMj59B7x44ObyCIJ5WCk5voUemYj0wcZdYBM0BGsN2
	HsuVoMlSSCMToNt06UnmgInTMhmbdmqlzyATu/CCKsw==
X-Gm-Gg: ASbGncuJTc19ggYZAL6lv2zfPJuzAk4ftxUOrWHWeN9pLbYs3Qv654O7Tahh4mozLJX
	VpGhxMF18rGfLUeKt4cL0FF3UAZLda2k608QMFza1oqvxzl8urC//TyOaKXuxfZPuLT7rwPWqdS
	7wJzIy5F7VZ7s/hV7O+GsiiWbsftTk6PlhPTTkXLd5daPm9BZq/uQiB6J/msh4L2gnx7bJHkNI8
	A4G4pM=
X-Google-Smtp-Source: AGHT+IGJe5Uxr9HPFMmzv6FKaMGGq0DeXYb8MEs6LCeEdkH2Ux3eyASfDB2156qvlMRtXLw+FwseABeguK4wIAj2U48=
X-Received: by 2002:a2e:bc1c:0:b0:32b:4441:e1d0 with SMTP id
 38308e7fff4ca-330dfb33727mr8322611fa.6.1753269802839; Wed, 23 Jul 2025
 04:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com> <20250715034320.2553837-8-jacky_chou@aspeedtech.com>
In-Reply-To: <20250715034320.2553837-8-jacky_chou@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Jul 2025 13:23:11 +0200
X-Gm-Features: Ac12FXzMES-g3RTrhXb0FNTMk2mTyN5VcSrw3I_gOJGbbpbB-aPDVFXKwi-6bIg
Message-ID: <CACRpkdarn16N9637dL=Qo8X8o==7T=wBfHdXPczU=Rv3b270KQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] pinctrl: aspeed-g6: Add PCIe RC PERST pin group
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, p.zabel@pengutronix.de, 
	BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_042325_465296_B4A82909 
X-CRM114-Status: UNSURE (   8.80  )
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

On Tue, Jul 15, 2025 at 5:43=E2=80=AFAM Jacky Chou <jacky_chou@aspeedtech.c=
om> wrote:

> The PCIe RC PERST uses SSPRST# as PERST#  and enable this pin
> to output.
>
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>

This patch 7/10 applied to the pinctrl tree, why not.

Yours,
Linus Walleij

