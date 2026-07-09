Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE81C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5ss7vtgFZzZH7j5PPKNgnRxv3EGS+90GapGuoUV2n0=; b=jEtxIIhY6PFgUqv/qBummipHba
	RcrnuU0eopJa6IwUEvmhOLqeXb1QC89QsL50K19D/dRjmkXNUG8JOhXVKUc6J6P7u9/JoH7ov+vTv
	EcmWyIysXNgvbu/PNWATlVZ7sThgXJkcbBDUoMhKuQHD5ToyR7rI8rle1Z75ua3FSljXoOB/XdKNi
	TS9yZ6hC2MrFqfCl9iv3D3R7wQOrjW3yw2FfboGCC2JGCye4/p5t1lirLrt3slObyePsz7nvw69BH
	4kQHCaVFyF/JCidI/jzdWQreQjQd82qFY+DzTIz3orMiCqrZ+AQAGb7x0MGAQ517oeUXZBV+zaNld
	31HZE2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoaI-00000002WFv-3N78;
	Thu, 09 Jul 2026 13:14:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoaH-00000002WFD-3lGK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:14:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D9E1D41444
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 13:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF8D1F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 13:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783602870;
	bh=G5ss7vtgFZzZH7j5PPKNgnRxv3EGS+90GapGuoUV2n0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hOBeV6NmI2/VWwdkKKCzhTr9V70OgiAzV6e+danD/PAs1pFdtoOapcND61wJePEab
	 hb5TGVOkfYD30VrpcjGoWFvVzuMMbitc92qU3yas4Xe46xPlO0DnSzCi3nWbZ1joUy
	 P2TRFPUHlNe6Akh09MvOurF9DWUAGuaskq2ZdT9dPigAi5VHYB1D/L7zAQRfEdUxu1
	 QxhaQja0OvmDonAr9lYsDsjVhVvPKdOtS9+A47zLPsQWGgi1Hoy6DUf8x87tkfxANC
	 B9aZavCk2B+P7VcRYD293mU9GMEZ0MbRPF5PS9NnWv089taHyXTp8+ejfkHH72+uaa
	 FPg5KCkjzB7bA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeae350e0aso2033076e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 06:14:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrmM/i7qpIzEXDxmdGc6otFBV9DxNUFW4an85k5nW6M6E8LV1bUVItSCsaY2ULWH+0AQ1987u4rh7mUibISSDH0@lists.infradead.org
X-Gm-Message-State: AOJu0YwnzEa7aS1mb6UNRp3b2Ir47lsme5XrYXNDNMFxpAwnwR8ku4h/
	Xh/oqY8E42aPxMDzsRR0TAxusS0HZNkORJfboco7He9v/1Gr5diy1B29M2vRYk1uVLlkhGKF8il
	JsjWHB2KqSO++65pmBwvkgCpVxobY49I=
X-Received: by 2002:a05:6512:10cf:b0:5ae:b130:1e1 with SMTP id
 2adb3069b0e04-5b011444080mr1822805e87.28.1783602869579; Thu, 09 Jul 2026
 06:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260705001931.74149-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260705001931.74149-1-pengpeng@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Jul 2026 15:14:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLndZn-4Rgfm9S3ZB47D1eX7cGDbtKkc6mNFMxHErrqt7Q@mail.gmail.com>
X-Gm-Features: AUfX_myRqVpIkgJPekvGUSUV1D_ZMRcchbDmPbnIZZ_0Vm28P0syyO4R0Fvlacc
Message-ID: <CAD++jLndZn-4Rgfm9S3ZB47D1eX7cGDbtKkc6mNFMxHErrqt7Q@mail.gmail.com>
Subject: Re: [PATCH] net: xscale: ixp4xx: add missing MODULE_DEVICE_TABLE()
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Imre Kaloz <kaloz@openwrt.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Jul 5, 2026 at 2:19=E2=80=AFAM Pengpeng Hou <pengpeng@iscas.ac.cn> =
wrote:

> The driver has a match table for the of bus wired into its driver
> structure, but the table is not exported with MODULE_DEVICE_TABLE().
>
> Add the missing MODULE_DEVICE_TABLE() entry so module alias information
> is generated for automatic module loading.
>
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the driver registration structure, and the missing module alias
> publication.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

