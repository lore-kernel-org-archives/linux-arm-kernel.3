Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B8ECCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 20:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZEYp0wwdbVO5FwvBARexBlR01VmAiUyIuBTdS4/y2k=; b=Zas7KTATt6NqognKIdq+pofsVC
	E4bowtMbE3PNLJbYKMqlR6a7e7suE/f6bwm3fJVDmIFVH7jIHpiWWKFW7loQOjNVVwp364RwdgkQO
	RM7gCuBPBR7pXPiUx3ugEvngGAPb7ArOZlHSSfgZ2WNdL0t/BEnQtW1oPQS7d+I1U4FEK5IMj6xFH
	9rVLzYLFrkf2SVrxEvDo1ncVIXdYaTVclcdEQb8gdtLfNeEU4k5bLFc5ore0QfggTaJ9MDqNt33kY
	hZRGeGmjv4qz1DCLtRH5Bwy9iGrRmxb77iyf90MHtacGhaRJgBn9Ueg8VrPcr9E57LuWi4Cw2DKtz
	I4JJFy+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwx6-0000000EzgZ-0a92;
	Mon, 20 Oct 2025 20:58:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwx2-0000000Ezfm-1lEW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 20:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=TZEYp0wwdbVO5FwvBARexBlR01VmAiUyIuBTdS4/y2k=; b=UUE9xnYsLFH/QrV3putAZP4MUh
	2PkiW2DaOX3JwA6hZt6fEEfAmGKF27Er18EcPm7rXWnjWx3nzqy+rcEOStfEYQTY2AiTCw7XpmGjL
	JgihfT6Av+kEFi9wY0w8ztYlqZHH1x/SndrdNCorGZrIbREDTvW0DXhIKB3uC1ZbWXliMAggqmF9u
	dkoMzEYK6soF+rwQ0UwEk3v7dzSDcT4XcGcogylL5n/vf4t18k+okgLb6NoNmO6rUdskaCvwTH99J
	tyBZRxDN5/N1a1iDyXNWBchFvYercOg/54UydIeTHtv3cCaWAMwt0E8uF6nMalZgm7AiEsOv/P+ft
	nKjgMgsQ==;
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwwy-00000001l6G-23pN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 20:57:55 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-363f137bbf8so43382821fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 13:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760993824; x=1761598624; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZEYp0wwdbVO5FwvBARexBlR01VmAiUyIuBTdS4/y2k=;
        b=Wk6UT5s+AV3x2zT/rRMANf/L7QXPlLOvTKyYM/e0cBU4XQe35Zb3Je6Dt3wR53pVrP
         LoNmhLtKLfIfS72RhkcjW414+l/khDFjf4z0hohJQ4GKntZVWkdoGGOdLuajSqnPiqkx
         tGmz89ez36XgZUzixLGZKFooQq9UWgmmvAIJwh29D66hSy+bjw8EeEqL84KL9B8aOgB9
         47nQX6+HcA+QDhvlcc2mJpmt5EsTGWajSeoNaltt6FLsIK0zSdR4fDk1XzFO+XM8m68+
         cmhgC585038jVPnrD+riiQShIukdo3j8Y+icuyLvvPIaU4irFSBM7essLMnDR1FlvRPT
         xPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993824; x=1761598624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZEYp0wwdbVO5FwvBARexBlR01VmAiUyIuBTdS4/y2k=;
        b=Us42kTKxok/UNkwW5/cpouM/4JEtdDwne9VUUcTndzTahbQSVq8/9CgUBrkmj0t0O7
         GiJK6rUpi+vcbtrIcuN/10xwNLldo5nGfD/vBP4+iT01BgOvIGgppu4RgBNVeRvqJRQu
         Agi5ZN6uABstg+Jlodt5fS2X5b7RydmVEmS3UOp+iLZfndS2HwXfaqIw456z0AjzdkXR
         sAgiA4ZEcnIyvMNwNS23KayHEQJw8Vp4NMJOBC7UF4GKSvOkeX/g03Axn+jD84KzPDC8
         EXasyImKFWdQ+cGmGgLB3amroBQre3yc3hDsyHcqBVuqWpZIsMPehHcRYcJtstYgzDPX
         zKtA==
X-Forwarded-Encrypted: i=1; AJvYcCXluZo6exhhhNQku+jAULRa8IzAhLhA93jlfn+2UbuNt8IQkRdr2ae9T6xenOTrj3qK64bHQbN+dwA8ClZf6bO0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy1RdVfc9bj81/+I60vTtLKWZlh6LS6x6D7f2UQbliNnG3aTby
	VzoK1bQ1799NuJjVh1GU+n/M9xXElxGGAObeKkMdIAdpTuV/drp5Z+ah7QZQZWDtckAmWyNQg18
	fco8RN4JnADKbumAuDeH/RsaxQ40PUJaZYv/dJKBafg==
X-Gm-Gg: ASbGncsVZqIoJzTmoIw+/MJn1MH+UnLYDqSHJPtIlmPbdsod7c4TIRS0J+TmUvM0GxX
	fuXpEnMgwcenb1ZqC/p758Ija80IULhz92aR+LJpm1So7HjnOsbusLwBQKdj1Utzs3I6OAwDuak
	uC7Njh3Qtxi3uxGkkfIXGUuXZiQEsKlj8XHH8xnOD7tRwHcshujc+RFr7kkMOkuzZ7EYS72lthf
	1wGpmUy6NxLRSNEoqcIJNZyx1+IrHq75xoXNw3xAlhvIjFl0sRbLRvl3XUPtDh6oOZdV7c=
X-Google-Smtp-Source: AGHT+IHW/3fH8VK8UvrQO2N1p8h2n0H3HlH4UW/gOsTzZ7h7xtAZlPnMvG79X4+aymc2cjxzZ7sc3DkXHSmcaHjBQ1s=
X-Received: by 2002:a2e:be25:0:b0:375:d1e4:21d4 with SMTP id
 38308e7fff4ca-37797a9f7cemr47365901fa.44.1760993824327; Mon, 20 Oct 2025
 13:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251013191218.4136673-1-robh@kernel.org>
In-Reply-To: <20251013191218.4136673-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 22:56:52 +0200
X-Gm-Features: AS18NWCeioy3mWv3ZhVPApAQA3XGSmMWhoG9OZEUlcYBSQV8TD2OC05OSxkf5sA
Message-ID: <CACRpkda6y0anNZ0dCHf_OQp-2q1g9LfXWqWD7mS44L1rYsZKDg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert actions,s900-pinctrl to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_215753_783071_36E56CF0 
X-CRM114-Status: UNSURE (   7.16  )
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

On Mon, Oct 13, 2025 at 9:12=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Convert the actions,s900-pinctrl binding to DT schema format. It's a
> straight-forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

No comments for a week so patch applied.

Yours,
Linus Walleij

