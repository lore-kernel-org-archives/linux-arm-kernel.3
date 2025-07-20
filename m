Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253BBC83F3D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 20:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pdUiGWbsgg0CJ4pLUwtMgPfW72vVxz6DKVN1oZBlnk=; b=I07J/lbFhXPHsnkxwR62e7Q9jr
	pUZZwLrZDrqPBeBLMIjuXyChHYTmn+EEHgOq2NXSfmu1+eKkRVJScFaCyXgzveL/uyYKZEpN4OLth
	WTD73x2fjbL6er0LH3CE1XW04PVOCbTGbi9q53Fp+Iat1RsC4v5ixcSZw79RB7Jpbjpnwc0VQ67cw
	/JwRekDL7UVKCLEWhkrfa+JraV0wl9z6U+WjfQa0MXXQgOnQFY9AgfgvmZl6qoN4w5xVEfCQFpGgz
	A/B39sDzQRlll4PhFicxFm/HwyeCWW8rTposc5JNf+bcqwAMAOKQss2RBaghakYuajjIBbObs8aPc
	0NiBTH3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udaDE-0000000Fgqy-2zFj;
	Sun, 20 Jul 2025 20:00:44 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uda42-0000000Fg7k-2sUP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 19:51:15 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-41b6561d3b7so1831752b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 12:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753041074; x=1753645874; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pdUiGWbsgg0CJ4pLUwtMgPfW72vVxz6DKVN1oZBlnk=;
        b=RU93KBUtDRpmcLbfcEzoganHSXJZYfoCWknS2QciFhcHfuirwHmzqbIh1Il+Fv5yzM
         P2/i7K2vYB4DguzqeO818CP43s9lsBudV7dOkYvEhzE15EuyUz1V8thGjBEId2/JI1qa
         L5rPiq1bxf2DP4G0TUfQ94ZoMaAMlg9dp3LiuY2FF9CR8bWkm/W8h/L7Q7EVd4vwuELK
         oQ8f1chPoGtx1D/1bZHMbNjADZRnesA62XDOt9DPI9WSUdfSKqZPOBFpX19bHjZrOeus
         gp966+67A4uV5YPuxYq0aq26akvpndyPwXhUjtOEScvNdU0DJB00BmlgJJtO7EC9yGe1
         b2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753041074; x=1753645874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pdUiGWbsgg0CJ4pLUwtMgPfW72vVxz6DKVN1oZBlnk=;
        b=EGpH3zYp/YTY/aN2tE0y9GYwhAlpNx/B/IXj9q+7rNbqbnkYSlK+fSiC4nwp/YXtTp
         uRegi9U5lNYjK0KBiz1gEC/j566v4q84J3RSALu4DV7yL7VMu4VJxD04ZJNVSnNTdraZ
         6lIBwDWAQOAn3zxfV8HBl+zX2ZpwMiuFtbQo1IqllJCyk74uteJvnbCtlUbG14NEBTBS
         PCNMcmCD0j3Y/ev5F9gGgNRtWvbAutePO8KaEFm4uRlfiP/5TbRoaUsjKrG1/SAfdlTq
         UbBpy76Seu86NtmEAPm8L2waXRQkcjMPfXYm8JJxL+qD0VoUNDllPoQisiTiILHxhXGE
         TP9A==
X-Forwarded-Encrypted: i=1; AJvYcCXDK2DWiKtZUxXbEyIdaROoLkYRe0BEogtWfOhDs/r4ZPu8/Y2JPgWvGir3X3YwOda4k9nc+UwtUoXx7cKtRQcZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwVeje6ivOZTBUiV4MjKiuassCiEUvUHne5c2z2tCMlEXGB00G1
	Et/UcT+sGeQ82dCZgTuMPvfQUqr7Y0U5InnJEhCFGJGXtpe34SVzfsfEBoeGQPCerOqdCac1o+f
	qlV4YHoXe6A/DEoIsQxRafO1tsxOQhCTpG7Ma
X-Gm-Gg: ASbGnctX2jC/mEDVq7Ani7uaVFgLkmop0Eo0X10ukTtjY/arJYOws7X+ac6QJIFDFjh
	x6FDpmynJmh7x/bRK4qzp2fYsX7xH/NvaRGYFQYJi4BDKJXjnd5c5MbgDjs2F1CCIWelHlQ4Urw
	CPVhGLnTE5sR5wT+lEq8M4z6D2hHXdnKa6TJGOzd4aYy2acZfhaI8t4AzeWSAXUh0iSBdoqsKKK
	Nv7q/7xfH/WNb3itjA=
X-Google-Smtp-Source: AGHT+IHt9uAWCHbIYGEdJFOU/DaDUPPXZITgD+rBr+XvH6npb6aGodI/kJwOtF692HkZTJVuU0Kx7GBVi3i4oDGR0Dk=
X-Received: by 2002:a05:6808:2226:b0:41b:f2a0:28f7 with SMTP id
 5614622812f47-41d05756050mr10790464b6e.36.1753041073815; Sun, 20 Jul 2025
 12:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250702011956.47479-1-jammy_huang@aspeedtech.com> <20250702011956.47479-3-jammy_huang@aspeedtech.com>
In-Reply-To: <20250702011956.47479-3-jammy_huang@aspeedtech.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 20 Jul 2025 14:51:02 -0500
X-Gm-Features: Ac12FXwcwYnjAjxqqsPWb8Z6fZqKu8-qloc1mBHuXxX-CpWSK48rSruJh4ba31s
Message-ID: <CABb+yY1kyZdMqcMRUEdqCYByQE=DurfnejtvuQsMf9wfLiij2g@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] mailbox: aspeed: add mailbox driver for AST27XX
 series SoC
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_125114_725463_2D45CACD 
X-CRM114-Status: UNSURE (   8.93  )
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

On Tue, Jul 1, 2025 at 8:19=E2=80=AFPM Jammy Huang <jammy_huang@aspeedtech.=
com> wrote:

.....
> +               /* Read the message data */
> +               for (data_reg =3D mb->rx_regs + IPCR_DATA + mb->msg_size =
* n,
> +                    word_data =3D chan->con_priv,
> +                    num_words =3D (mb->msg_size / sizeof(u32));
> +                    num_words;
> +                    num_words--, data_reg +=3D sizeof(u32), word_data++)
> +                       *word_data =3D readl(data_reg);
> +
Please clean this for loop.

Thanks
-Jassi

