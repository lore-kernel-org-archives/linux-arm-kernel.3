Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6958FC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 13:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJw+hlbauIF+Woszu8rX7v1wJgbD5TwAMaCcWAZytfQ=; b=z2AbpbOhJ4Yyo8
	Yn+SAA6ymN3FsLKpPmhCMQaoU4ZiZ1J8B6v5sJcVmbB+WKUSKquDJW1lk/rAJg4v1sKTSQ6+3ttly
	t+cBd2+B40XIWm8gn+KPuaXWOG2X9sD/X4CGaavvjZhfY1Y5mZOKXWl3aG7KHpgEmKCr1f790OMVt
	jWYtJGOrsyZ/mhUQOdNF3D59ePkctbsAGtEAzIPzQdjlO3a/GNSm6aCNz9JN3OuvxWvYDU89Pdc7f
	+Pk5xegodkA4yBim3Q/oF8hPBfavZ0Rt3Hq8DU8BZ3tqKtw0x3hviil2GnCcO3tRHUvNUAJFWLLEv
	6QygnaxttxUhiIhmlFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0O6-00000009Gkx-1IyX;
	Mon, 19 May 2025 13:18:38 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0GW-00000009Fdv-3IaC;
	Mon, 19 May 2025 13:10:50 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54d98aa5981so6430746e87.0;
        Mon, 19 May 2025 06:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747660244; x=1748265044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJw+hlbauIF+Woszu8rX7v1wJgbD5TwAMaCcWAZytfQ=;
        b=xIcC1EqaTBJy7onp9kFm2E+inwLn3iQploLv4S+XZSixYovLf1tCw0PSlQcsnmkCD/
         tKmqLmHjYufhAN8sSBXtaE+kRhbteUFKhAPFbbszc1G9yz6S9qVpwViIVpKq8lvZMh8j
         D2BTfN1CsBNzvEB4YRfARzhb8nOo1IxwZoeC4V4q8cvURsMbHi21o+Ya+MM+AE4a6qNK
         GBCAF7JzPEKOPyxAz9jpZ5e9A92tJPEP7jdrNU0rKwyNfUH2G/4nyTqqclCIrRotI/Qy
         gwQhqei8rnvVMz4P0IGxUQ1T/sEcZsXf9eqhVtFIZdT6+nDqdvIeGvQ/vyPOb2vY6cOX
         XOMg==
X-Forwarded-Encrypted: i=1; AJvYcCVeQcEdN+h+h/tBhTWidsBgLGdPj9sytYAFsx8Y/pwj2gVmmMIK0EWRovtWm0yzVqb3L75pdzMWO7TPJJW216Et@lists.infradead.org, AJvYcCWugPv4qYEW3DBbTwmi2zAXWgr04V+6tTbJmGxm4vDWO8gPss/YCrw0exhh/dWzE8if6MAa7+iPncNai/c=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLymbA5j/C1DWs1R7dhTJyiBHilXAV6lUoZ5mhrXBOQaahyeU6
	NWAupvy1vKMeo50KOBrAnRUZqjidyntIOZ34GWVflC7CSnl5Qcmu6fDzoklac6+kyRo=
X-Gm-Gg: ASbGncsicm3tAqHTiTa/aFS+SAq7TEcXmWBfw336ADGEbi2PQ95sWoiikEoJcASc/VB
	K5Xk97ka+JUOn1sbLQVb/tBdjxHuVc3QObOXhfH4SGUnUpagIVYpZPxPigs1NhVQKh5bKERoXEe
	EUiA0BpHxl4LqCnTf8l/7B3BuxhsEpia6UY3hu+y7bkn82W2eyTyrCVruL54zwYeeBsqxf8n1/c
	QzlZc6YRySyEjToYF/8Hua5AJ7jF0kIV6vt2GWFTdETtBOL5S3EP5sTR0bwgHwZ15sa1Gun8y68
	JHRh7vO+cJGVDFB6QCXjN4TPVv1iXtMPtR8Lmfe39/DzXtATs5LMlblvoG7azVsTyI7zVXIJSB8
	bT//7yax8
X-Google-Smtp-Source: AGHT+IFkCZoSNCLEbvoei4RPwvmq0j8sJKQHZzyXq0M6+aYXJw3L2QqhkUeXcdPSTPUGSUrzwHlLxg==
X-Received: by 2002:a05:6512:6805:b0:54b:ed9:2d06 with SMTP id 2adb3069b0e04-550e722b18bmr3192428e87.44.1747660243452;
        Mon, 19 May 2025 06:10:43 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f89asm1834551e87.232.2025.05.19.06.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 06:10:43 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-327ff195303so36011471fa.1;
        Mon, 19 May 2025 06:10:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWhlTpEqd3ZvWmM7l3N0eXXjzn8Y8HCOjbvVxJXcRmY+9yUMulfCaADrUljyoc+9xqhQATO1dgH96j27DZMW+k@lists.infradead.org, AJvYcCWLA0AQNPAOnj4T1Vrhhh+dDT0I2rrLSjc166G5cuHTAXwWqEGrMyCBcvJ14rJ+bRh9j9QaD1FVCtksxuo=@lists.infradead.org
X-Received: by 2002:a05:651c:421b:b0:30b:a20d:1c06 with SMTP id
 38308e7fff4ca-328075fafd4mr32090081fa.0.1747660242500; Mon, 19 May 2025
 06:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com> <20250519121512.5657-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250519121512.5657-8-wsa+renesas@sang-engineering.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 21:10:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v65FnoVMaoHYWWsWCcPZe-khw0G=jkt4MotnJemf2xPN+A@mail.gmail.com>
X-Gm-Features: AX0GCFsxXp0f6XTIbmnJnSjvW3P0HJFBLSxCw1t28jUvhSs6_4fuwFkzC0zig3Y
Message-ID: <CAGb2v65FnoVMaoHYWWsWCcPZe-khw0G=jkt4MotnJemf2xPN+A@mail.gmail.com>
Subject: Re: [PATCH 7/7] riscv: dts: allwinner: use proper node names for GPIO
 based I2C busses
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_061048_826069_8992EDCC 
X-CRM114-Status: UNSURE (   9.86  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, May 19, 2025 at 8:15=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> There shall not be a '-' before the number.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

If you want the SoC maintainers to take it directly,

Acked-by: Chen-Yu Tsai <wens@csie.org>

Or I can take it after the upcoming merge window.

