Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D05CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 08:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0a7WddgUQ/5f5obr2F/RzKsHSRjgorUSTkuUO5qnKs=; b=R/su5+z7xRUw4+JIC/ZInLDy62
	ISgCMEZvPPKcFpqnXqDvgdvOHI1zTVed71VrsnXLSI6B+RXEeCY1Ayh7P6ZmdI3y2/z3xn2EXEgqk
	ICedkLqCznbniNMg/m9rGf7NV6U1/Xakta0x0M+sj+Rs3Vt2+wXuH8EgvVwrrTgZH1UHpeubLqu6n
	FEaGboEx2T947I1rdnW6ML+oKuumgCsguvoD+4/QoWAndsVY/e+QdOtCCTZVvY2H1HDGhjIUGa9iH
	fDP1N8TPMDv1UHndJ7liBfuk6NjuVZqG2Mr1b54+qmqGSvabEBOehSitvtv4oFyANQ4BoaCknucWu
	tK4xsctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwaZ-00000005v3i-3XwY;
	Tue, 23 Jun 2026 08:34:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwaY-00000005v3N-0Osl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 08:34:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E9C9434DD
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 08:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6166D1F000E9
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 08:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782203673;
	bh=Y0a7WddgUQ/5f5obr2F/RzKsHSRjgorUSTkuUO5qnKs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Kt2HkJH49eUMpNp44hmnOsa/cj6zhemVuoKImAOY34KH6f9vjiJzR4lc64xOMI395
	 pROr+wwCuXnTUxcAUy96A3/+dC8P5yx/s1evQTV0qPDP47yl1XE+oTBdKF4+v6kJdD
	 x91TxytHaTJPncL654CBHV/3vxCbzT0KwOic99hwZ2ys+w++j9Zg+H2rwzYT8Torku
	 1dNDaZoDAMYqiCvp0U2xdynE0G4rqJnfeUBtJBBoFbQx5CTs2VhtWrK0hx/DUz6hDI
	 j6+KqqA7WF4tuITdQAiyAMzgZu2/0RAzFvojQakjwCzfGglcDjEqb+ULCi9n5SbeZg
	 5TdZbr0BUDOrQ==
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-139aff562e1so3084245c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 01:34:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/TfDTFpHrLqPnJ9ytRvn7SxnbnvRfI5d3fWv/YttYxCLZSqneAQ1TWMjuA8cXEeA4aJCDZL3O0BCKAi6lYbe1c@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh9XJIzdDvYRzyKo7uloFJVHNI1dXhc4XSGOWt2ExJoBdrB0Si
	Aoh9+aYaB4rZzrLn/anvEzAHBXooXQVJzuRDSc/hmOyNtpPM8CtCiRqN3FnoOOY4uO8XayxjJ/V
	yVrFdgpBrQnM4iNdP4vKQinzcB4B+A+9aSoeUakl28w==
X-Received: by 2002:a05:7022:439d:b0:139:90ab:36c8 with SMTP id
 a92af1059eb24-139c6ebeb63mr1076352c88.1.1782203672876; Tue, 23 Jun 2026
 01:34:32 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 01:34:28 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 01:34:28 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260623030736.1421537-4-sherry.sun@oss.nxp.com>
MIME-Version: 1.0
References: <20260623030736.1421537-1-sherry.sun@oss.nxp.com> <20260623030736.1421537-4-sherry.sun@oss.nxp.com>
Date: Tue, 23 Jun 2026 01:34:28 -0700
X-Gmail-Original-Message-ID: <CAMRc=McH-x5Td=60pMNUOmT-rZ3Xz4PvvKFK=8CMwESMOm4iag@mail.gmail.com>
X-Gm-Features: AVVi8CdbY5Iy4YQ3Oz-eyh9mfYSh4JWVxu6-pYJlwg1EFWjmAS3iyrKv35O8gr4
Message-ID: <CAMRc=McH-x5Td=60pMNUOmT-rZ3Xz4PvvKFK=8CMwESMOm4iag@mail.gmail.com>
Subject: Re: [PATCH V2 3/8] Bluetooth: btnxpuart: Add M.2 Bluetooth device
 support using pwrseq
To: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, sherry.sun@nxp.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	amitkumar.karwar@nxp.com, neeraj.sanjaykale@nxp.com, marcel@holtmann.org, 
	luiz.dentz@gmail.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	bhelgaas@google.com, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 23 Jun 2026 05:07:30 +0200, "Sherry Sun (OSS)"
<sherry.sun@oss.nxp.com> said:
> From: Sherry Sun <sherry.sun@nxp.com>
>
> Power supply to the M.2 Bluetooth device attached to the host using M.2
> connector is controlled using the 'uart' pwrseq device. So add support for
> getting the pwrseq device if the OF graph link is present. Once obtained,
> pwrseq_power_on() is called to power up the M.2 Bluetooth card. The power
> sequencer descriptor is obtained via devm_pwrseq_get(), so the power-off
> and cleanup are handled automatically when the device is unbound.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

