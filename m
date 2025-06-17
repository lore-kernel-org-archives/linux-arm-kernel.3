Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE21C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 06:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJ2FyUuH2iGaYPiXopgaL47b9lLdapWgHeOr0nIXqfM=; b=xaz7P/hfVK0OoNRktkLYkSWzi0
	kkMoakyW5pViQGz7ucAl37FrEJd0Rt33Ma8qN0QAgv9zG6MVS6XsS5UL4Cp4ro5mYbIZHLy0uTw71
	H66alo2FaAbx2jOpoyLJn0F7oT3JaCht6DY8NhH9ndAgAmDiP7xELDKgTrfL+NbF+62Us4qT21Ass
	XrlUHamiVFCD35HgdbfmJvv7dpL6H0ba1HNF85cfUyXuOi7zX1e8SSBeUYl/T93ajXbmn8bqfriAZ
	mBXsi+/2405ElHdAL7y1JvA/1klpvLG4rnfPfLLYxrXqwMejtQWbIt85mTL9hX5UlZYKa7b+rmiB8
	yymIc9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPiW-00000006Lcd-3RhQ;
	Tue, 17 Jun 2025 06:22:44 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPaq-00000006KtT-2t6R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 06:14:50 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ad883afdf0cso1044105666b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 23:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750140887; x=1750745687; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJ2FyUuH2iGaYPiXopgaL47b9lLdapWgHeOr0nIXqfM=;
        b=kgWzZmOlXiVRCWyvx72XIIV0EqvOOC0aFZ3rQCJnIjsa6jv5BYqNBe3O2N6/xVoRjs
         t93T6Ofhvw7fDDIDn2m10iNibIUFez/IngCVV8y/o0i2mwOIRSTK1wmSCIBdP2yedj73
         AREqChiOa9rAQg2EAB+0EmGFksSbCjozsoL+P/5FBR7FNs80Ozno/fRGSmgv/WxDlgke
         uEc3f2pzTuCa+zzFEcPsopJFUE6TZ6Y4+ovUGd/X6hFPcZOp4UWW100PRiebd90byzyX
         sVwZ1rLBRedbkqzQDQ5iS+7zbfpygoCZRaYC/301WMJJJsizgiShqcR68NMby+RY5hGJ
         ZsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750140887; x=1750745687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJ2FyUuH2iGaYPiXopgaL47b9lLdapWgHeOr0nIXqfM=;
        b=UE6ilo0e+VrEGar3Q040FMdWAgyANCBgWM0mssK4qoCG5YRx9p6uQ9VWHeXd0Zvgv6
         1P09NpT6VeU7zFTPCV4cnKD4u74Q85N+G/HemihPMeu6WaUQl+enj+pLsK+PGZD6o+dJ
         7LrekM7hz/Dg3CXhKL82WSqtcFRNmcguIf1t7raw6c88+SSAzb7wLyLXTzbgCtgpVsm7
         RrYYD4OT+7oBDiUGUdGqA6s05Ra0EX15uZ5LbQ9tcNVGiTo8UUb0zf3vSjPSy99YPbEm
         4/JOOk20zCKNfp/+GFI7LS1QdMeszE9dBxXS87JBhGfU0h3B2CBXT7+fZHxuUD6TUwp2
         bdJA==
X-Forwarded-Encrypted: i=1; AJvYcCWfe+D20JX9zoU6ZKfX8uA4BhGkdpJRa4UCjeEFjl/qTIHs7ULvkME+tHZFVMYB/Xay1MdPMQ667LEJJa24uDak@lists.infradead.org
X-Gm-Message-State: AOJu0YwQSGij23sNMTdpQ26DAELCunIJrZI9rgU0pl/76tsF3VBuNyzr
	vnAwwaqou8B7s+W5zQAin4kd5ztICBq/ihS1yx0JG7t6L5ii1PlfpaRPCA49IxoLOE9T3zbC7F8
	FEHzyNXYltLQ1ZOmbIKG7YGgUUDaMr28DMFto
X-Gm-Gg: ASbGncti2AeQA2v6f/geB0LldSIelRvXMR+1+ieZRtqiw62GT9WnLOjFXmn9n7UF/bi
	t9BBh8IoQyIENE5Oht027GPQFxSrO7/8Lzf3nxdYnNy6uV4v184PFZWybPcaLOf/ENNo50aaXEB
	cX32/ixicO66Bnk3lWFPucC8rIauYKVS0iygzQk9AWSHsslQ==
X-Google-Smtp-Source: AGHT+IHOYbW+DNql++jlrrcwXmFTIiRwCsQ3lxIsGZgoUOkZpXugY4zi2KHuf6qJTRnaYtHQ0xCr1EcaBJ51NTm1JKk=
X-Received: by 2002:a17:907:3f21:b0:ad5:1bfd:30d2 with SMTP id
 a640c23a62f3a-adfad54ab92mr1148941566b.55.1750140886834; Mon, 16 Jun 2025
 23:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <87cyb3nm45.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cyb3nm45.wl-kuninori.morimoto.gx@renesas.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jun 2025 09:14:10 +0300
X-Gm-Features: AX0GCFuoT80D1QF0Bk0MZyK0Alu_RCxIGLkUBnvuwMiwWRqvASSR_wCiSojfB4E
Message-ID: <CAHp75VdeCyHdSdYvke0RVs_qtrhqbn_z1VFM22TCuNe2h8hFMQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm: orion5x: use string choices helper
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Alexander Clouter <alex@digriz.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_231448_759219_89821B75 
X-CRM114-Status: UNSURE (   8.48  )
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

On Tue, Jun 17, 2025 at 5:22=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> It updates format to keep "online/offline".
>
> -       sprintf(buf, "%s\n",     ...? "online" : "offline");
> +       sprintf(buf, "%sline\n", ..., str_on_off(...));
>                         ^^^^

With all the respect to Andrew and his review, this is still NAK, but
now from me. Add the respective helper to the string_choices.h, the
proposed change is harder to read and it makes things confusing.

--=20
With Best Regards,
Andy Shevchenko

