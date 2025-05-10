Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE69C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 17:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjgGUfr6X08qxQK3zfVrb3aTo/x2kOH4Dzdn/sVCI8Y=; b=NSrZvC0Otwh5h7IO7zrGTM5h9r
	mX0Vpd22VYKpHBWwhL4aHDBaiYF1fTC5/HjaBavwBZ/jmkE5fV7XqqrbHmDMMT9NOaaTP3pyqbyvy
	WLtLlRvKp8EUjb6GrMYFZlCjTVgLkvbbTJUmzKgDsSeIvc9cl8K7hWLcAv25eiHUh2GJcKYXeBh+E
	SaH4Md1GBRG1mS/zjA3iCnYICWOEgZjIyR5jfgHhtL7mbRPIggHwPh/2XDHvlCBI3ia4IXmrx0uNu
	q2/mfM4WA19rHLUPxpzHWcJqz/Xdi7zjjeh1Uxw5zuVCicBcWaGmxkaSUEQuJ534tIhuIWjlJkqrM
	XGAJqnYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDoTx-00000006Eq6-1zJY;
	Sat, 10 May 2025 17:59:29 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDoRt-00000006EeV-3LGY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 17:57:22 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso28658051fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746899839; x=1747504639; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjgGUfr6X08qxQK3zfVrb3aTo/x2kOH4Dzdn/sVCI8Y=;
        b=JGWX0mSmfe/0L0KUgEGptyUAsNcLr5Tjv40J797xBGSQYOJjFWh/7lgoFuF5NRq6ul
         3PBpfgmO34JvU30sjZnfEOg6scHu7Ft6lZF9w/k2ehWcESUmGAM1DgErFUsXP3E/iaYR
         2kQ0P0q8VW9IqBzBb6uMj4oQf72Izx0UbclzQXatL4LlPVBy2ckLJF46JDoVXYUl16oL
         YNCcF+IcNW4Ds2av25+Hr+GmRPIkthMUqLS9dz1Z3AobxU/3lu9vwbMMUgpwSxgwzEWm
         68uOxoqF17uepP1argwbGQgnMefb2Gxv8Cb2vTDubMqin4Xmmp2ygGr7O9S+RUHiBHkW
         GUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746899839; x=1747504639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjgGUfr6X08qxQK3zfVrb3aTo/x2kOH4Dzdn/sVCI8Y=;
        b=jONUDfGCuSXZydXVy7bQakzj2IBBe+W9nHNPu5Kx2cE2gonNHCmXDI2B1bBcZ+23qG
         tbW98fcu1qQ+69xzERAXmWoxOtluUu3HBtx1bFjRgsM385ZSkbns4wP3DVqAOq6ww3Wf
         VkCn4czHfH8fMJwUNcvt8vzO1a8qdY2ecuIfUdtQ81wEsrYr3OCCPyYC3YeKs4K382dz
         DimCMgE4qsDQWJLNsid2c/Fju7ycy3xYbSVfI75w7IMkHErEBuSKagEB9Pch+QX+xf1A
         NfNIO/G8oHnM5UN3iDdniaxNIyhS+XYQhtdVPOUtyZCliXtw9tTk9oS0uRCQn2bq+AVg
         +3EA==
X-Forwarded-Encrypted: i=1; AJvYcCUQXcZFmS7aID5ayYoFMBPXi1LK65LmqZa53Dirn7Rt0vum51TMix0pg+EdRAKa8CPjAQdOJCptreeliuKadCEB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywozx4Z/6mCFLZjMg2UTzj6oz3htY2zPkfxOITQT1a1zmCgBS1e
	YQWVQuuvNmtIrkTKmyF2eBcYu+G03kU9qYPZvYRs54Or8fEsbD5sfE4jAbcxGO1+Xvesy0Uipqq
	sKI4AvSOGjvEWCh8JveoS/A2KDR0=
X-Gm-Gg: ASbGncsM7zE7lRtU3WxwfoypVeBkULzdUesKmN2gpNqdBpHdpBb4X8/44lfFN3b0WaL
	dydU0LrkcbxHvlwiqA8wGwc2UDihTSjsjEQdbB3d/iiJ2ZDj0A0Cuq99IkVYktu5vOfbpDcSoif
	G/U0dQAHMMA5lqHfYhlQf4YJQue7HLTVHDuilfdwaISwHMSTc5dcSsCy//JCpN1nHS
X-Google-Smtp-Source: AGHT+IF3Z7tQbN2UvUVUBVdgIrJ9vuxONRjESM/OBLUWaAOZrCvSkzujqqR6dmG4HVeFUAwt4imd8+AAeDimdibevQg=
X-Received: by 2002:a05:651c:30c6:b0:30c:7a7:e874 with SMTP id
 38308e7fff4ca-326c4569ba6mr34455471fa.11.1746899838943; Sat, 10 May 2025
 10:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250510011806.13470-1-benato.denis96@gmail.com> <20250510011806.13470-2-benato.denis96@gmail.com>
In-Reply-To: <20250510011806.13470-2-benato.denis96@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 10 May 2025 14:57:07 -0300
X-Gm-Features: AX0GCFu_Mc34XZBVrE6yFFGghE4cYWVtNs10oUnBiwd7enOu-iz8bicOZ1AybT8
Message-ID: <CAOMZO5A1oRcUuNVcr_kcKz0SZqGc-AHzLR+__gRQEaV__xKbsw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: imx_v4_v5_defconfig: define CONFIG_ARCH_NXP
To: Denis Benato <benato.denis96@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_105721_838143_AE810042 
X-CRM114-Status: UNSURE (   8.83  )
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

On Fri, May 9, 2025 at 10:18=E2=80=AFPM Denis Benato <benato.denis96@gmail.=
com> wrote:
>
> Define CONFIG_ARCH_NXP so that CONFIG_ARCH_MXC won't be disabled
> as it depends on CONFIG_ARCH_NXP.

This is not correct.

$ make imx_v4_v5_defconfig
#
# configuration written to .config
#
$ cat .config | grep CONFIG_ARCH_MXC
CONFIG_ARCH_MXC=3Dy

CONFIG_ARCH_NXP is an arm64 option.

