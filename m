Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1B9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZvoRx3LWghOyRri9YeEOvOEAna0uN78ZVktRLFXYMI=; b=EoVIojwFrkKiSSFtapM+ynJof+
	2iN47uYQN91hsgDqIvnJ1KDZ0KSWh/ZL8dUNIhFbPo5fwpbAcMXM+OvfrjRS1W8iPrRAOHHp8ROX+
	JZozAzT9aHpUM2fTOdA2iZEiq/qa5d2fMwgh+ESmiTXjgWsi5o83Tz+Ufk77BdnzwcskLxE61x115
	5E80qUx5yvkGW9NqzHJNWiH76N0vSPeKpAwvHO/CzldvOqMrOkqC6Amp19Iuq2I374IqExEpe67Mt
	N4EbsuuV0xTa6cIT0+5sxol0Z9XCVGtVn8+Ftj/Fw/DEp7tQvgWH8CMg1VEZYys2qFayVFiocCVE+
	gjZTQnRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy1v-00000000N34-2F9i;
	Tue, 25 Feb 2025 16:43:35 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwtH-000000004so-2rSL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 15:30:36 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30a29f4bd43so51441711fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 07:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740497434; x=1741102234; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZvoRx3LWghOyRri9YeEOvOEAna0uN78ZVktRLFXYMI=;
        b=AsPbDrsjvlRD6H9q8TJksmxd1ntgTag62q5L6hEqptvTGBwYZZ4nuLIjyFWcwDVw+D
         JTxsrBY17IYvBKXdpNoNfQjTN8KgbnjGmtbWlApg80daVE127esDfjVvHSW5FVqzl/Rz
         SDNkUOnaQjHD5NQaMvT32z/Fc3LxKWXnOlHH7QcXPbZGhjdRmSben2YuZHUkxoDcK9oW
         nC+oWtK74zm+03o0lS9kS32FYvZ3d7jldZWmV5C+6n4z4Mfb9xtNAEB8mgYa6aVDVpVJ
         dW1s8xycbani0syXeA2v6S067osyhEgUooaJ0JFjgELj7VPChtk1JVyuiTm6lcurxnRT
         tLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740497434; x=1741102234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZvoRx3LWghOyRri9YeEOvOEAna0uN78ZVktRLFXYMI=;
        b=adfp+sz9O+djOWeDyoKmAkFInIG8iVYrR2TJRRn/yBUrvTQZqvSY3TpnXASbA8hY98
         Kji7qtS/HoLY8xoxhVSMmYXBtC9lZ4xsfxhymlK98klIXDZN3ZYeZzC80L2vsEvqLbGz
         4VrfHKfpea5SKwAp5Wd0X8PHIcq3o2tfT4OwRNXe71TcESYH1GF47xq/DlTE3eKoOqoi
         ItU37dVhXXoQQp7M/I4ijJcMWO28Ohqh9ZtlOggHJ0+c+G38LToXMeKUYCJyubAnhxhR
         fs2om9Dc0mYU59Mbkl/UsgP7Nu+xqT8PvmwKQrBwYtL0qDKHGWAtKRT72iPI2TYZUU+Y
         x7UA==
X-Forwarded-Encrypted: i=1; AJvYcCUw3PBoSo3Ok5XBUCbRZtONWldm7QxMQPDtFu12R8sA5vvdNKSWt0kBP2Im7lM5dcegsNStHxSVo8uTcOeefaeP@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq5wn+O5vkm7pZxpcxMRzjFLx05DukRerLVgZLG00ZWwei/VbK
	TkXoX4VUFMfenRzBGTH1cR6EYY4l7A6Pactnel3nnqQkqpWh8TkeJuUTaj6jMxaFU9RpVxiA1k0
	dVFQBXBs9H2u9ECacloZxH5ZwOt2YKxqCSv+NYw==
X-Gm-Gg: ASbGncuo/aKwHCGzNrce8oKAAwQXnpfBOGWlRJXh4S3D7Al63cQjwY7fmf+9990CWy+
	4LZtOwlcFeF1wtorE3cSvg0jZBfCDAsXI9x71VJV5DpWKbSpewgIcHkjD2rc25xHzvFcls1tUcG
	rYip8lYPc=
X-Google-Smtp-Source: AGHT+IGFXegurDG7lCQGwjctZe6kA1aZ2LxHO53zl2+s+c5S54l/LOVcZM7eOHAjUU2OvbrcJzo4zZrQdDsm0JVRQzY=
X-Received: by 2002:a2e:b1c9:0:b0:308:f860:7e8 with SMTP id
 38308e7fff4ca-30a598f3c83mr63050471fa.20.1740497434087; Tue, 25 Feb 2025
 07:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20250220180427.3382482-1-vincenzo.frascino@arm.com> <20250220180427.3382482-9-vincenzo.frascino@arm.com>
In-Reply-To: <20250220180427.3382482-9-vincenzo.frascino@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 16:30:23 +0100
X-Gm-Features: AWEUYZkbRv6lFysazE5St1NwoDBha8QHCc1cLTLmu4UeK1RG-qYEVGEW9J5fQjM
Message-ID: <CACRpkdb=3s=Own-eFhtk5xMj=b1+y7+1pyhEvJcJvwLM1UO2xw@mail.gmail.com>
Subject: Re: [PATCH v6 08/10] arm64: dts: morello: Add support for soc dts
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_073035_717365_EA39EA48 
X-CRM114-Status: GOOD (  11.06  )
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

On Thu, Feb 20, 2025 at 7:05=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> The Morello architecture is an experimental extension to Armv8.2-A,
> which extends the AArch64 state with the principles proposed in
> version 7 of the Capability Hardware Enhanced RISC Instructions
> (CHERI) ISA.
>
> Introduce Morello SoC dts.
>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

