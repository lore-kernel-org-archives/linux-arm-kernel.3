Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6CBC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 10:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgEmQPsTMSukLECA6PYoxAhOxF/9eSkMwkJFG9w+Jwg=; b=gr08DoTG5xGuqnLr9RikS9586l
	3hEAMoje8ZERGh9emIEvrKA/NlpLlcXD8pPnJWc2xspwlWVQHijPJSQfykvicK8wh5WuuE2kMd/xI
	Xd0+aTEBHDRZpMJjGSh27FUTJMjkHlZfaGQvdR6LrpCEhwtooA5mO//C9lb5Dx0ns/A3yRlwxCSTK
	DDdCadTKgUmJDGgMBU25+c1AT8p6Xjt3SwwQw9h36pCGZLTcF1A1FXBGqiPuxyfaTJdJtTtrEO1/H
	wp5rigV20J6roFUvmEwSlV9/cVuJSTZ5cBlJxl6sglP4ncDuLax0b1NuPK/swriLy7AhIgnZywJkh
	KjmQ9IlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVxB-00000000JSY-3J5I;
	Thu, 15 May 2025 10:36:41 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVgH-00000000HDq-1QX7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 10:19:14 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7423fadbe77so741481b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 03:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747304352; x=1747909152; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgEmQPsTMSukLECA6PYoxAhOxF/9eSkMwkJFG9w+Jwg=;
        b=NHfFhvcFWjV55IhReB9Zerhkx8kZbv3QkEw8DZD0UM1EIa0EZFdRaVMfGeVZtQWD2X
         axJ6mHnsuceHXmKypcR+WbTXkqZjU/yZZMybkcvEA5C7h9JxWOvyxSbuFyHYOqwpRPIX
         prIC4NKBXRdw5MQxusQD5rQAPQpS5OYCbHPTPyPde++f7nfYLyPsKyUYFlZoqaqhwdcu
         PE9wgjY1UhJJ5MqSDOhR6WgDosiTu/wLh/uCc1uCINlO5N6s9sL+fDOLLB7RHafRQjnI
         SqCazVe51sXdrUd0w4Tr3f+4CJ3MQYvhMH8LOQRYSAuoSpyCEc2Q8g29P5FaTLOnzgUo
         o10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747304352; x=1747909152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgEmQPsTMSukLECA6PYoxAhOxF/9eSkMwkJFG9w+Jwg=;
        b=em17TOaViN9A76vzcjltpveABYwdqQtuFY+/y23kYVNdyu1JSmSKx6njg+ZAbfEoLX
         W66ddUE3g+8V+F788A0j8LRpTgA4E2VD/vM5f1lskj1V0IBT4OUgCk5qkcJzv1RPRxAh
         tzrusbORuMFAbT1AYkzPyLQXnTqi29Clx91JKU6++YvT/dCug5imTixo401A9LynTMPE
         uqs3YyrGTKW9OuUaz2TwrXTFe38j9WqvBN5NoeSPpzVFNRyaC9M3NiPct6dEzw1B79jz
         K3y34QPEQ1px3R6uJgX915Y2SJ+/kyOcCJXFQNU1/Z14D+K440egKPfmt6nPVQT1a5Q0
         aWfw==
X-Forwarded-Encrypted: i=1; AJvYcCXbAHmoP+6kkUXve8Ywkh9rvJf+Lw5th8afwbAD+0Hb3eyDi8K5YTlZkIa2kFDWiG98pVcQPgqrnZRGt/AzN/Yo@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn6Tv6H6h5sP/5/jLABf60P+RNWE8VMde99y8ex34QC2vsEMA0
	I6L5m77wtHBnIrra81Q1SD77QApo40RSs1IGzijWsN1WQFCzptX450Zmx1AJ09yk6SbTISJaDlt
	yAlRlfzCxcBXOR+ko6hHgkhHZFGM=
X-Gm-Gg: ASbGnctmD1YiqkbkgNVbijdLRS1gNpV58KvxTYnLbvjjYNsyUcV4pL2TnlRbptwsULF
	DeUGk3INLmTDT7OWpJuu3H7tXPznPmA9mmjeldTe1Ci5zYMhvovo/4JhzpbTWqGxYACEsY0NzHT
	gvhvvYACQJmxrOWdz3g5zWpS9qxxYahQ==
X-Google-Smtp-Source: AGHT+IEsIUOtHqCyd3RUFAmp28tpSkSzHX7erUjCawa8T/wazwsdJ3+WuKQBWkKpBGFc9cg7xp3+86p/M24KmPAv1WQ=
X-Received: by 2002:a17:902:da81:b0:22f:b6d6:2737 with SMTP id
 d9443c01a7336-231b5e51d4emr26927485ad.10.1747304351996; Thu, 15 May 2025
 03:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250515051900.2353627-1-shengjiu.wang@nxp.com> <20250515051900.2353627-2-shengjiu.wang@nxp.com>
In-Reply-To: <20250515051900.2353627-2-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 15 May 2025 13:21:00 +0300
X-Gm-Features: AX0GCFtYRGBFzwrIv-5BkoOX-4f7j8QWlxzR2F9_CR7P2Wf-QEkia7AjZk42Z20
Message-ID: <CAEnQRZBJgJpyE-K6fn3_s61-Q7j=mXk5FGMggpaBhnH62w+ACQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: imx94: Add micfil and mqs device nodes
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, carlos.song@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_031913_377751_D6A53CE3 
X-CRM114-Status: GOOD (  13.14  )
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

On Thu, May 15, 2025 at 8:21=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Add micfil and mqs device nodes
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx94.dtsi | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/d=
ts/freescale/imx94.dtsi
> index 3661ea48d7d2..77297dde5c95 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -108,6 +108,16 @@ scmi_misc: protocol@84 {
>                 };
>         };
>
> +       mqs1: mqs1 {
> +               compatible =3D "fsl,imx943-aonmix-mqs";
> +               status =3D "disabled";
> +       };
> +
> +       mqs2: mqs2 {
> +               compatible =3D "fsl,imx943-wakeupmix-mqs";
> +               status =3D "disabled";
> +       };

Node names should be somehow generic.

So here, we need to have something like:

mqs1: mqs@<ip_addr>

similar for mqs2.

