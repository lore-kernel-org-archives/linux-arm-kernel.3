Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A1FD2F339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwDBqmE8DzZnhS9XuHRGHXbq3OKd36PRfwkAUcwYLh4=; b=xTqvneN45SPn37eVMQ+jyuaeJK
	AYQlrs5yLUHh1KHIzo+4WfX/sDsA3GGCJhP6ogeHjBXfmlTDAJqyjvy0P0p2CidXnBsb3wWX4DMMv
	07/YszfS9tMPsl+bKdkS5nefW24AoZWqczUcwGuMbl+KlbvZx44T/5HJ9f8JNfj2kU3l2iXH9R3Tz
	WwsTj6Ou94zHd4z7acTgi4zjun3giO8NfLvyp9NecNbC1Nn+FFPUL5fMqz8WB2UTCdDi4NHYASbrV
	7B8OJNadSYOORwnOoj4Kn3VLaTptT7ATW+vmysBcE6WVNksNNWi0okowf4ts3qoAgvZunimgw65NG
	UbI62HpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgeO-00000007Q8g-1BMO;
	Tue, 13 Jan 2026 15:49:44 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgeK-00000007Q7S-3cRM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:49:42 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-121b251438eso4041318c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 07:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768319380; x=1768924180; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwDBqmE8DzZnhS9XuHRGHXbq3OKd36PRfwkAUcwYLh4=;
        b=SMmdS2LMZgWswnTapDbtUzDXx9YRmKRZCGD31bDkGcQImrCOD2oKcBErZrWcUfKKkV
         vO4fEndP6PuPJBjoVu47b8fXRGjGLWBjqBz1E67rkeQQODSIh3jrwEYe2c6jPNftn1hK
         fp3qXNikXmn8X2mjAPzdfieQ1ydUTQEgSWSEb7e3hsb4vGwNRhRULMtS4H+ixa8mfWVd
         pWPvpgAL7FbAiFD550ofKE1UYTZr52R93eB22JlC/myDBrhW8XZlZeUF4aWIV76EyVlg
         agMbcWhMKIUEZtzHOhJ8kGSw95EJBFqGiz8Bot6OggbM6cqxsxlBz+KL9NBrTyKLS70v
         P2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768319380; x=1768924180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KwDBqmE8DzZnhS9XuHRGHXbq3OKd36PRfwkAUcwYLh4=;
        b=QNvryyxnTdVRmODRuLX13V/l2FXDe3L0OdnrPKpHpwOx80UE/Jh1vrVcge/Lxeeu2v
         A5iy8gV3ByzvW4owmyRMKF0zZXpjrNKW23wK3oT7gIoUmADG8PmrLZs5Wj/I9k5c61so
         uTS4QFxt6ozWyD8KMeIwj/OXfi+WQ8DTY0r8Bt41mGvxRD+dkQEwMQPAnTfhWPQ/DHDE
         OF5rhQvRgQ1Kn245diDDW6FwnQi0LVnP0enTbvlPnLcoEqi7hP5dj6wy6IaLNjlOiQ6U
         E6OCSoXGSiSmYm5TuPt++HVqSjFVnooAdEwEB4TXINGastMbj35wz6FbD2Izfp3dl7Ql
         E8bg==
X-Forwarded-Encrypted: i=1; AJvYcCW0M0nTckTyiy8/ZpoIXG4AqCIThNjTk6t7KXzEv1bjvj09g473cbohcoRv8tBgq3vyUr5eDyZJo3xSq6jqTAsK@lists.infradead.org
X-Gm-Message-State: AOJu0YwCcE/LHK7GkWB+Qu+my0Hk4pJVIqr1cLySUtLhl8hjy8MGUrru
	VDxiUN59hNJSj3KcZvgTVXPcIZCxoGA/qtwiWbufHdpyGHZuKLF6v7AGF9atJpgFhPxSg+VcK6f
	A7Hrtnu7pRzvBCKtLdhaKtd262jVybFQ=
X-Gm-Gg: AY/fxX7saoofL5lfndprqxo5KhYiuAX1BenzuRwUnl10SBF5E0i3JJrNSTO6pXGPLoz
	AKtrkM8FOuYT/f1a0PQ/6BMyRwfKNYyWgZc4XXfx3zdzOKoTSGCyOMVSFBeGE1CS6Pbl9ZB7Jx5
	cgU2J8xdA0F5N3GNonCEHj81x81Z87WEVlkc5irPPv0XK5dW628RsNaRBvKQ4OMPwRqIqLZiqw4
	WzQD5p3wc0xvQgEvQoZov4vq8pCZP9ZYjbRgPs+rF3/S1UXAOvFOTWbK8rA1dCAQVRy0mPgQUX8
	dmk8QkDMaKMxgUe/O/norPHP2F24ncfeQxczGfA0PSRnSsOU2QRlfnSEpgaZ/cyXjJTuVvsUTNV
	I2Crk2yA2aA==
X-Google-Smtp-Source: AGHT+IGjwuR69qA8lHJxE6iN497KsDTMWZ2U3kZzgncmWwfux7F5qK7HWUrvnZrqKDNyxZj/FyGWFvfT5x9jkoebLmw=
X-Received: by 2002:a05:7022:f111:b0:123:2d00:c074 with SMTP id
 a92af1059eb24-1232d00c1b4mr2953367c88.25.1768319380033; Tue, 13 Jan 2026
 07:49:40 -0800 (PST)
MIME-Version: 1.0
References: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v3-2-45da70f43c98@pengutronix.de>
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v3-2-45da70f43c98@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 17:52:06 +0200
X-Gm-Features: AZwV_Qio2Twao-YGROiITtozUb3Ksp-2XNSe0asye7QZjZsW6UFB1JKtigNETmM
Message-ID: <CAEnQRZAUw8cVb8N4tvVP6scs2dTedRra653WPvpKOWanQ0gNGw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_074940_897070_C6767A96 
X-CRM114-Status: UNSURE (   8.98  )
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

On Tue, Jan 13, 2026 at 4:53=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Some parallel panels have a pixelclk of 24.19 MHz. Add support for
> 241.90 MHz so a by 10 divider can be used to derive the exact pixelclk.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>

