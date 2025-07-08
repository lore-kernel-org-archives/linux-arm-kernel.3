Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86405C71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 01:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgzMhn9PXUw8XaAQ7bqis9LsIzAHvccPSnO/9V1QKUU=; b=OgH3UCykkB7+Y7IeWMzfN4hbGM
	BQl5MuF8f/OQIO//UZNEAgvnykMbyoQymegbpGWHBufHzst2pcVi4onQ1AenRE4dUvjEDOd6VZF+5
	sfijv1JdZXeqKwmdAZ/SSEh/g10310gKc9/a+5BFGFD6/jjyyd1wfTT+/kpcsTPX6wynqqeCCy40V
	HeuOj6l5FoxoSF6RUqhwxhJ/kGDhDC/OdeflrPkGekNhONcU3egF2VMC62p3kaQ5bh2gmsD1FNB2R
	nMkID2y0zBEjDAruRrALeLc3JncV3jWQZ+92whaMW+RjGh4g9RWa6lSsFpXfP7WLm/cau1z3t1exU
	B3qt84QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxLn-00000003znY-29Cq;
	Tue, 08 Jul 2025 01:42:27 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxJT-00000003zYL-07At
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 01:40:04 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-553b9eb2299so3900764e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 18:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751938801; x=1752543601; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgzMhn9PXUw8XaAQ7bqis9LsIzAHvccPSnO/9V1QKUU=;
        b=cBEOZqtjUPndbWxmLq2iZEl9e2Z0bxxeBDhurqQM/bPDVenG8WtVOSAF28rcvzNUfT
         I59TNXnIm1mtX7fxWsoJf584+4lim4EmNVVMMWCC3PMzDR6VnxPDIgWi8YfTHBVbNoM7
         aQpUbR6IR6AkvfdLN2kpxlgQ8YhK2TNYBKO0vqYafQWBZk5XE9ZZaWWOx/10igbcWav3
         aoaZsqXS9eXDJalMvinHkwxAcbNOay6AEe4S/UHfajyS7G7Z0FU4QB2JTNNNQ/L6GulS
         R3dGYzZ+9GUiWs2qGFhL+UFkSuoin55IDWOlUwHXbFY/q87njNa1jaxtTLbsVRfbm5W/
         KAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751938801; x=1752543601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgzMhn9PXUw8XaAQ7bqis9LsIzAHvccPSnO/9V1QKUU=;
        b=gRoZhLB9+3WKaPBoraPoS8EVxyfn8Cxit/5CbDMZnFgvS46+vXjt71cim9bWhhcXE8
         iMi78y8Xum8iW49Vlu5suds633t6Qjnx/BLkoaQRLDyxAPdY6KO42ym1hMynEfNiqDnU
         6XPq8QrXXtrmIeH07bKAsD7TYWyeu5nliG646tkZ4+F5swzMfULmREk0+fy8R2ScsCQ6
         wAyQbLoBhRSxiJo+YyY4B/0cLi9TESyJ7xzPC8YwnXsHqFK8k/Q4/Q+ysu2QLk9dzJil
         4lGZU/6eCoHIidSOdDixg2Vu8YEZ/cW/YQ0/FAjooVRfxbWv8B0xfA4epITj8d+PIvx4
         MtoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrlb8S1HmjDu9fFgPXv6AIo9TntmEIouWP2xb5fmP4AiVQlYXNIrelxRbaUPtVsQ4nKCN31i11LpWXuvTgk7me@lists.infradead.org
X-Gm-Message-State: AOJu0YzbH+Y0rBr4gTegt2UQS2c0/N/3miDQCSAL5fNDF7OyAWxgm9Xo
	U7E9pRmbENFI/D/m1crMac0oDKaUN1aaxiXd5SlFXUihTpQIM6Y89FD0clSDWhjj7erzqm0pJcF
	flMC7UJ7RKFcCwprrRSZnd9CrVUWHlQE=
X-Gm-Gg: ASbGnctnOFAF6A9XWjnuzZLg8HSs8TADY3xOnQYdEPP5k5UjLh0pjrC9C3rGOsO7yId
	9hyWgf4hmMbSvQ4xK1Dt6hgW0sr5bZ34u6xRLlgmBgZFJIQFFYBGiYN6Fw2kD6NbzUSJ+2H7A5X
	fo4nVD5guhDdv1pkySG4UpcfXDFu5KSuYq8Af16L02f53t40F+A9KCUV2hfqSMbAwyfqyxHS0S2
	00=
X-Google-Smtp-Source: AGHT+IHygg0TywmldncFMonK90kHL8Dr5llLxOm3DhG+XHvJuPfci4yTlbVuoguyFC6BCZkSLwEJ56H4J2PHxXgxdT0=
X-Received: by 2002:a05:6512:340d:b0:553:2969:1d54 with SMTP id
 2adb3069b0e04-557f89b1acbmr264901e87.8.1751938800572; Mon, 07 Jul 2025
 18:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250707234628.164151-1-laurentiumihalcea111@gmail.com> <20250707234628.164151-3-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250707234628.164151-3-laurentiumihalcea111@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 7 Jul 2025 22:39:49 -0300
X-Gm-Features: Ac12FXyFWnyJ-B08lFE9ya2aqIPGseDa9aDMsZwjLGBKAWhJik9-kphabCMJ-sQ
Message-ID: <CAOMZO5DfuRKYHkC8e4mNzetY204UdPDBHzUVy4M9pyjKpx401w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: defconfig: enable i.MX AIPSTZ driver
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Mark Brown <broonie@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_184003_065638_6C98E256 
X-CRM114-Status: UNSURE (   8.56  )
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

On Mon, Jul 7, 2025 at 8:46=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Enable the config (CONFIG_IMX_AIPSTZ) for the i.MX AIPSTZ driver, which
> is required for platforms using the AIPSTZ bridge (e.g. i.MX8MP).

Shouldn't this be enabled via a select in Kconfig instead?

