Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F90C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 06:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZx0v6I2hXvNUX2y8yhSiIo588YdK8i8Accx3bbYV7I=; b=GV2MdZ98bcTVMkzfxGdenU4V0s
	ExErzRG5FgTF8O7mBz2vEuGe9PKDGaNWn15QuKgHxHDrDLqCnXfVuM8hM8Ao7v8xMmK6VMTqa67WN
	xeS6VmuXxgat7m+XuihkGUdDcurxvqPI5c3sJyX7JCtcrVi+qb6LfLI5WlGeC/PFjdoz/5XeBv7iI
	5NITyBlYgt4j6qE6Bdq+IrRsRX2kUTcnzMeIUxYAwjeQ9euGbcRygVkHEHdauFO93+3R2uLXqO9ab
	QXnsyzGx8MMKQEJBVPIMSg4RcvAojH3vDWXw8223690iMYYDvdHKNziO7hALc/rZVaRH9LuFPcmil
	w+qcXTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPpM-00000006MGE-0ttG;
	Tue, 17 Jun 2025 06:29:48 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPgb-00000006LN9-3aFJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 06:20:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo10283205a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 23:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750141244; x=1750746044; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZx0v6I2hXvNUX2y8yhSiIo588YdK8i8Accx3bbYV7I=;
        b=bi5ogs2DUjiYzLCR0uCBNTPwjDm0f3KDEbqvHJGJu7W9yClPqEmmaw9YKLt7i9dR4d
         hJUJWnP8Wsa51107bpSwZtx/zAaEoRyUFQRYuD5GSsQzux+Mw4BfRpRXq3PGmuRuw/Fh
         UJyu2xsrxGR8LThg58x/Cy9oJKURpRRLrMAzdc/CTTm71Fre1PCcCnxMX9PVXsHqdnCL
         hftNXEYO7jv+fXhcMaP+1lV0ov40a0W0YnE/FRWlFLKk/32TsgxmPpSMrijVgLjZn7Yv
         ydmPxaB3VdtLG6WMUwEFqQgQ2QOqRDz8Fu4CnGVtHlf80iK4wBrNC9wZlEbsCGCFDV2Q
         59Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750141244; x=1750746044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZx0v6I2hXvNUX2y8yhSiIo588YdK8i8Accx3bbYV7I=;
        b=c4+/u8abSUiZlxw6d9KPUXjv7dt5WPmSnFQg+NKyX+9dLZPzPcKQEIcrfpHoaghXUT
         YnYw8KCeNTOKNNXT7LCGvG+7qc9HuyEy53LsSr7O1oFROKcnV9Hhk7UZrKENZQtSur5A
         b0LiLj7GGY7cbJDFxRKz2l5446rHGnItvvWR45WXLxxMnM3VBvzy6YuO8lBapEV9fE21
         i1463e/FZxpLxutBkemkJuJg7uR+06+7vhzSSxBEVeBoZ315BF1hLzJIwMNLhv13xr+b
         hZmftSBI4bJJ3uh72fNUp5dxmaPAS7Vws+3ZrG6h1aIM98qjnJsCLuB+b/JE6oiyC9gM
         UyZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpVgNcufmJnbGlp4k+xpVIeWasHERLY6rB5Wu1bRVFRuWCYviXMaRob5q56KTC3bhVjQ/7Q/z7+1WvaIEbw+gF@lists.infradead.org
X-Gm-Message-State: AOJu0YxlNeZt6tNiaUCbFl/ynVE633iwV0QhV1+fFV35GMMeEBFh+1MK
	8mtbQbOBWJ3JZ/ZR6AFvizAE4T749UVMtH9CiPzPl2xQ0dyDmA8LgtpchvaGFPmXYMQk1N1n+oh
	hbOliIa1LidH3yYXAD64aijJDrB7K19Hp6rL/Atk=
X-Gm-Gg: ASbGncsCgWArfdBShuAo0j8OJJRLJwhuCHU8P7jzUpACxBuWIB3eR8P2hZ2PmKc564+
	Roe6lZB/4S6U2hUOQLNS0v1SAy1m0Z/XsfYSGeL1VrAurrZqIsczBPHVJyqi7k5xVgGg8eY/6Vc
	zEROrasLdbuxKfumHH2Ahfs7RMWksCHdS4erlc8U/Tk/JHYQ==
X-Google-Smtp-Source: AGHT+IHXWTUoWOnT4fBsDLxbeF8NSdUmF89j/Fdhp0XoRowx7qdnm7FOPk+dpwfsSztz7JNdahJSwCFb9703Z9mcAeE=
X-Received: by 2002:a17:907:2d26:b0:ad2:4b33:ae70 with SMTP id
 a640c23a62f3a-adfad43868bmr1260623566b.31.1750141244144; Mon, 16 Jun 2025
 23:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <87plf3nsdh.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87plf3nsdh.wl-kuninori.morimoto.gx@renesas.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jun 2025 09:20:08 +0300
X-Gm-Features: AX0GCFuappv-c--LTpLEjirvokpvk4kjtvo5xwKQvdBEtdpGIG5hc3HdI5tHdl0
Message-ID: <CAHp75Vds2E7fb1FBzJt4G9LzKP_d51y8dWnryJZJC=N2Cke47A@mail.gmail.com>
Subject: Re: [PATCH] arm: omap1: use string choices helper
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Tony Lindgren <tony@atomide.com>, 
	Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_232045_889433_2D168FB4 
X-CRM114-Status: UNSURE (   6.63  )
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

On Tue, Jun 17, 2025 at 3:06=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:

Missing commit message.

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Otherwise, in contrast to the other patch, this is a good change.
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

