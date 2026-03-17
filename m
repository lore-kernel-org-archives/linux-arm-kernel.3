Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF3BFD7078
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQyonz/fROOd+E5ux5wnd2FwnDxCTcUUFUb5qdccPbk=; b=xv4g+3sgR50XJQpEUpHd8kTirc
	LaMZniXv3Jp4igmwjjzQ3VG4evpftzyZu4gkr49wqHvBx8ZLEpgh2oCHdQ2cgSoIjePM1+XOqMant
	K1gpNiyu+/rt+KGUHs23/owkYv/hkTQxUC+d2OUHBUjO0+mhhyRZrEsyhG8f7uHoYsFgUtm7iKwPX
	17IAokiNDbecaNLQGmXM2tsdX/NASsInKVF2NCRIwcAybXJ33R0o/gjPT7ynu3DQtKyrb5gdv283M
	m8l2fJ1RymH1hTmSkygwqq4qdaALU/TJFVoHGeEKKP0RNhz1OycHq62gL08ZBbVhLVm4Wnt+6Ca4N
	gb7hzwzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rub-000000063fK-3Xks;
	Tue, 17 Mar 2026 10:44:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RuZ-000000063ev-1FG5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:44:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10E7240297
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 10:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA672C19425
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 10:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773744269;
	bh=UQyonz/fROOd+E5ux5wnd2FwnDxCTcUUFUb5qdccPbk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A+mRoSiXRnP0rpmp94IIjRt+NqHylOr8sISWSQVsw6FsnP9W4Gy1oFyPwBK0+kEuq
	 YfLXzK/+3b1dFclBnrbc2ImOIsXdkanWgEHrSTR11nomzEdwbZ2MsrKnz7L0qjTSVw
	 PyQWSqVlidOEPJwz1i8qLiBH3MOkd1512mPLL7fdIyQ+0uombK85JScW2GEnHLEXq1
	 ii/+gSwQ7AZdwIxfJaD2EebjNRUlYfVnUmrBr5fCQAGacIXTgVxS9TELk6L6l2pg6K
	 F9OzwUfvdSlqSRKO0bcQ3m8PyQo3ZvX5dzdqs0+spfSqu35ViQI1qzscOxz9lkf0bc
	 GWJmm9fFt5Qdw==
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-463a0e14abfso3403831b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 03:44:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWa078OiPp3saHsuAqi2RQ0UPpY5G6pPoT5DM7En/YNJi9GmVY/OFQyC4xSDy+ijz+HnuGhoXT70H+o5POSDs+@lists.infradead.org
X-Gm-Message-State: AOJu0YwxR/wGSQKRLVW1s5X3pcXW+ZtLIkxUIO23BNh69f7D3qwyl+mU
	Jj7W19JNg7dYbFVUxuuuRjhmwzTyNhM7R9HjcMjaXS3wzVsV4TotrG1JDZ1kDow64AEWB95rM2n
	OfYpEbNC+5Z+mkdEQd5jKLeSNxZpXPYo=
X-Received: by 2002:a05:6808:66c1:b0:464:a1ee:c412 with SMTP id
 5614622812f47-4675754332emr7723340b6e.31.1773744268614; Tue, 17 Mar 2026
 03:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <abkCPU3rxHI49N4_@shikoro> <abkD-VLprcbbEbB1@ashevche-desk.local>
 <abkF0GO01sMcOhvb@shikoro> <abkLEgrZbdb03VWg@ashevche-desk.local>
 <abkLY4AAQuFlTRC7@ashevche-desk.local> <abkT_jpjIki6pvX1@shikoro>
 <abkqEni3phP8dqqw@ashevche-desk.local> <abkuNpwmYGa6qJPZ@shikoro>
In-Reply-To: <abkuNpwmYGa6qJPZ@shikoro>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 17 Mar 2026 11:44:16 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g=_HW7i8-emNdTtw_0Kjqri8qTehHvms52u-w7jqG6bQ@mail.gmail.com>
X-Gm-Features: AaiRm51cRor4ZZDDr_mxj0wmImR4wUCy3F3N-SYcdW3xJYMr5MLA4gbqvDIFXzk
Message-ID: <CAJZ5v0g=_HW7i8-emNdTtw_0Kjqri8qTehHvms52u-w7jqG6bQ@mail.gmail.com>
Subject: Re: [PATCH] device property: Make modifications of fwnode "flags"
 thread safe
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Douglas Anderson <dianders@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Daniel Scally <djrscally@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Saravana Kannan <saravanak@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	devicetree@vger.kernel.org, driver-core@lists.linux.dev, imx@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_034431_396479_29CB9413 
X-CRM114-Status: GOOD (  10.76  )
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

On Tue, Mar 17, 2026 at 11:34=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Like Danilo I am also not sure what lock protects fwnode accesses.
>
> This is basically the question I asked to Doug. If he also don't see
> one, let's take this patch as is.

I don't recall using any lock for this purpose.

IIRC, the original assumption was that device fwnodes wouldn't be
updated once set.

