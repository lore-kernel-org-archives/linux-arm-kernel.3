Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF11D32D9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAEz9R5gfcpiBNt1GmCxLILxc4CQ5mFZMgBqMHvnru8=; b=Aw5woeMxZ4heXAjRTJ0GFbYJpA
	xDPmFozUFC2pk8T+nWtHYRjOIs0P1baQTftoOo3KjxDl3TPyT6Piy2VQ7qbGNp4TXt+hwfTILBJ6v
	AYxczwEeVTIoEaw2tUNVgyXtaJhjyl9ZwFrLzyE3GA6Ly9pzzeewX9cSSl6AJo/bTVGmjmJyHYu0K
	xFdPvIeHj8E+qCuERjVBlR1yhPycXqgxhTmUl8Rc9rae7kpy39zarjDlmzdzYx4ZaMCS3MUF2U3+2
	VM5oYHynGCTckg/Kfu/k5AqTtgwrOYzVTyteS+mFiW7KRfVUSFxf2AqEamDBBoZNqRMibuacGJTXn
	775DSdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApLy-00000003H9U-3H7e;
	Tue, 12 Nov 2024 11:46:38 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoPO-000000036Nf-0Yvh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:46:09 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso49236041fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731408364; x=1732013164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAEz9R5gfcpiBNt1GmCxLILxc4CQ5mFZMgBqMHvnru8=;
        b=PCUudB/rnLvCE6okqZ2aIUy/HwQXK1X4uqz0IWhGyaHTpfRkPgOZFmtz/AQc0u6LG4
         AwJREfyHa0q38rE1/l/cskvYCdfJNlAU3YY1oNUBtSCZeHy//MId1jddm4OK/GtA8k/4
         ehBdm0HsFBaIqClcNINdUd67RrUrE5O6QkIVEI0eoIcOE21xcnSrLsynTUQgUq6Fhf+d
         9XY+ldImnR+qAdGXVzfvj+3gHmySthNrAWOVq0Xhc4tZ7mPnXzm/MhxKxI1OdyhJZyC/
         Hu5m0FADRz1vTmkb8TB/IvBK8JnlslmnezqTUgKHJRBbgZVFsotPQIbcpjj8i6CLEifL
         uw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731408364; x=1732013164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAEz9R5gfcpiBNt1GmCxLILxc4CQ5mFZMgBqMHvnru8=;
        b=LQczGVeq7pDAX9bLSjQRzNUFsZu3RE31vs/Yh9TXqgSNvMkAGvPg2kmHsFggnxfMWR
         GrknwG6/aLEgOG941fxPO+STLqKtry7ubuRO3a3XLBN1hmhDKKPRbIfYxHxpsrlHuJpe
         1KsQHCqib3AGjHJtHFpN4zc2zIdSPT+kCo3dP5GM3xVm4fetr086tSCSlDWUvibce6ZN
         QRHJ0KhTiWglIvfPFI5CMwG1mA17o1tUXJCYpdABr09HAKbhXQzCYlBcrh311MfmcTIk
         U8Ag8lArUhNYqnKgc4+BbigcVIFXtC2nUtV38kKZEKD/zAp3q+sOEpR1ArWR4Gmny2oN
         P1Dg==
X-Gm-Message-State: AOJu0YwOR3MX7fDvCPXhRkAR0XvbGY8gIXigReba7mRUZIVT+QtTAH1M
	VhWhmL4WJutN9undGXFgEOk9FvmSqTELZQPbCf8VtUqidqNCl67y5w4U2Q==
X-Google-Smtp-Source: AGHT+IHBB4DPUVtm+FLBTRqXsnW38EwF15U9RATpu419YLuwwqUPdIVShBX/5mzRbrzE2fpotGJwZw==
X-Received: by 2002:a2e:ab0d:0:b0:2fa:d84a:bd93 with SMTP id 38308e7fff4ca-2ff20244bebmr76495831fa.32.1731408363964;
        Tue, 12 Nov 2024 02:46:03 -0800 (PST)
Received: from foxbook (bff246.neoplus.adsl.tpnet.pl. [83.28.43.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff17991867sm19522581fa.83.2024.11.12.02.46.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 12 Nov 2024 02:46:02 -0800 (PST)
Date: Tue, 12 Nov 2024 11:45:56 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, Linus Walleij
 <linus.walleij@linaro.org>
Subject: Re: cacheflush completely broken, suspecting PAN+LPAE
Message-ID: <20241112114556.11abb7c2@foxbook>
In-Reply-To: <ZzMsMFNSHLOKEeEW@shell.armlinux.org.uk>
References: <20241111233817.2f824c19@foxbook>
	<ZzMsMFNSHLOKEeEW@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_024606_227866_0AF00094 
X-CRM114-Status: GOOD (  16.07  )
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

Hi,

On Tue, 12 Nov 2024 10:21:36 +0000, Russell King (Oracle) wrote:
> On Mon, Nov 11, 2024 at 11:38:17PM +0100, Micha=C5=82 Pecio wrote:
> > Hi,
> > So I guess it looks like there is a problem with this feature,
> > perhaps a missing "permit user accesss" somewhere? =20
>=20
> That's exactly the reason - user access needs to be enabled before
> calling flush_icache_user_range() so that the cache operation
> instructions don't fault. The patch below should fix this.

Thanks, I will test it later this day.

By the way, do you know why it wasn't broken without LPAE? It looks
like either those specific coprocessor operations somehow bypass the
protection, or maybe all of PAN is a big, expensive no-op...

> Please ensure that you copy me with ARM related bugs in future.

OK, will do.

Regards,
Michal

