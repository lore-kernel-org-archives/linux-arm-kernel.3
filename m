Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B115CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 19:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnqWEtnpelR8+OUCiqlImK5vhv5hkXxU66b+sjHg1ws=; b=VeLyRsg31XjSwsb1+/NfO1VZa5
	izx1PxcPBS4mIWBx7mwgQku21GkRR6XOLwNQWcP/ehbZSY0pry4Gxv6iPCp3DwskBTpzhyeJcRlLX
	zKwiL11I9oG4TaJqpwB5ODZDgUeiCi+7xexAbmEV4xnYoDLJi1Ko6fTX8ncu5YeWeasV7KhDs2/Cb
	uS8sYJjxLHY2PGENJ3WX1niuvjOe7cEf+MMauuBsDZbye9B1iLWRPX5m0zuz2+9E3g5ui5yQcM6nN
	wL4CWvPnbC45h0qVXE3Fvj5oNpdgBukKi9ktZ5i2x8mzBdjvGi/AIwDmqWnIEM0jSiE0UONadlYXR
	KJGgP5nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waIjD-00000001kcW-3PxE;
	Thu, 18 Jun 2026 19:48:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waIjD-00000001kcP-0YXg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 19:48:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4047E601E2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 19:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEAB1F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 19:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781812122;
	bh=wnqWEtnpelR8+OUCiqlImK5vhv5hkXxU66b+sjHg1ws=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MCqOCmnxjnO0+Fzim01JPQMuriRmk5n9oEDc12/wQpTNUX7fsxDCq7hbxq8OhI8h5
	 vAuwiRN9MiQFqjz78OhlCE7f6IbJDvB1jodh54W/8A6W2UzhVQQkoDBp4jf7KrD6oy
	 fXeahOe3TlAihTOapWkSoppfLWLZu1sSWbR/rxBCkOUPxR9sOb1jPVdH0X/oaiRFds
	 3Dta/3ShnNp4IwCJNCI+1zI0ACWq4gjLvF9ZJ2Pzt44GWuHX3JCK2PoKDWwQ+Z30nI
	 rxAkAp9uikmXXCZ4PceGrtEzRsr1tNsZpSiqIj6OV9/7a3rz6zLvm/n1u0yEIvq6De
	 ojxaNMwYuqToA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ad4b60f6d5so1317826e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 12:48:41 -0700 (PDT)
X-Gm-Message-State: AOJu0YwX8Qv7VlfKwwyuL7fZxB965BfTkNw20J7iOKmBjrTlcPllTtIt
	krXm06n/GQNfArLRj/9aFAZP3KqDi7LFtUeDmEy3aGAzTW39prpwcM2zwbC+olUXH9Mpe8UvZwj
	vABSDIaUi/mywCm/YOOF3yioyxQ2+tnY=
X-Received: by 2002:a05:6512:6711:b0:5ad:5456:8eff with SMTP id
 2adb3069b0e04-5ad577242acmr74407e87.50.1781812120760; Thu, 18 Jun 2026
 12:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260618141730.3243303-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260618141730.3243303-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 18 Jun 2026 21:48:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLmqEaDpy-MF43vtOqYfyPfTJEe3CJVAvzm5bq3qy07mJA@mail.gmail.com>
X-Gm-Features: AVVi8Cd1EKp1-PSBupcREVemgEFtD3ARXicbWsv63Ro17PrpLnsggB_Vnf3WG3c
Message-ID: <CAD++jLmqEaDpy-MF43vtOqYfyPfTJEe3CJVAvzm5bq3qy07mJA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] i2c: nomadik: Use generic definitions for bus frequencies
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>
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

On Thu, Jun 18, 2026 at 4:17=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Since we have generic definitions for bus frequencies, let's use them.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Oh, neat.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

