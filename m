Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C37C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQ4rrrkQyrsJSu1Oydj2YpRuvmf+BczNVPtiyO2iXYo=; b=LHuXuBJjYNC14Jnd7M4cuN4E1S
	Irtn25NoKH7iL9sfUqrZ0M4r1TCVGctrqwdG620w7R6fKeI5MvgtShSZZBH92mxoZavqWDXvrLwVl
	1U8L2Ws/AEcbn6LqqzcSzrwxmd+AQLZ1aRiPrOAI8jvXWxGOJeP/OT5XTvwgyzrIwzST1kUB1L8yz
	lxkGLyi+JeJDOAgPVl7MYN30umbw0JFjPqVrahkF+KbehrM5ZHLEnDm9QSC3QeFLigliqsgjbCf0s
	qdPPTha6piVxgSc7fR0r2CVQOceLF8RBXd9ZGS0VRdNfI8DTyPbuzL9/Z3ohZ7nIx/Zj/7ZB0KU59
	0191aA6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgrI-0000000G08p-1SzZ;
	Wed, 07 May 2025 15:38:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgEs-0000000FsMM-1kGn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:59:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC125629FA
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 May 2025 14:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87109C4CEF8
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 May 2025 14:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746629953;
	bh=pQ4rrrkQyrsJSu1Oydj2YpRuvmf+BczNVPtiyO2iXYo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=srkAq+G/plKXRbPA7r1NVl/rDfBXptP5g0zOJ6Iob9WADODh2Cujg1vDrWruUhHhq
	 BN4FI1t51ZqMMX9v6aEQUvQ+1HhtmktmsmoJctLoI2rszqQaHOnWNQ7TJOhwL/xw8F
	 0GbWU1zxeVqH7pwVHoOs4ns1L886GVneLZZbSrxphuOQfqdZxgC5Qj5+HhK/aYwYr1
	 WdWtgbZYmA0yARdJcUcngxazCTaxO38T+Gsm//LdOCsTn0MF6xw/QukNcM0tThkJp7
	 SCInTNnsuaEeeaPrSFQW/7AX8pGTR72c0Fd9D6gH/ZtTYAFuN/5IQH9h3Z+MJK+IKk
	 9ZDcKPT0CmicQ==
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f6a92f234dso5029847b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:59:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVgOYVnUHQmaV2C/mwgC2UCpBuWwftuQB+/9PWs7SN+X7xXnNfs5svqu9DxrIvBwqXEib6JVZohZ+TI/ePbKsr@lists.infradead.org
X-Gm-Message-State: AOJu0YxR3cVnH9zfoFWp5dDPSRkd9kSu19TnvRJjmUfATzJ0euVUolMR
	354SFrzFz0iOZvdiSU4MnwWCZIoqK+G5FgLOUCU9vJtIarRQCX9O+uPNhvyg4iWziouuwbQDHeL
	d4hoa+C8I9IU4zAXZIL3cH/HGFQo=
X-Google-Smtp-Source: AGHT+IG2jGg4Gw+mtrHimLnBHtTZnvgaDxMj6vzJiI/LGSl3ouIsD5werw44EnBCTNLYLshLXj8g6uQd4mXH4v505pU=
X-Received: by 2002:a05:6871:29a:b0:2d4:ce45:6985 with SMTP id
 586e51a60fabf-2db5be28b4dmr2084181fac.11.1746629940117; Wed, 07 May 2025
 07:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250502140119.2578909-1-sudeep.holla@arm.com> <20250507-crouching-lovely-wrasse-f85e90@sudeepholla>
In-Reply-To: <20250507-crouching-lovely-wrasse-f85e90@sudeepholla>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 7 May 2025 16:58:48 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jhQwbQqbDOz2ADeZWvBzA71XdLxhRJzCYL28fMM2DBiA@mail.gmail.com>
X-Gm-Features: ATxdqUGCI4AILRNC-HP-Tp3AOF4fDO-fl4F8YA3AQMgVbwTj7A5RwxA6JJAusF4
Message-ID: <CAJZ5v0jhQwbQqbDOz2ADeZWvBzA71XdLxhRJzCYL28fMM2DBiA@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: psci: Avoid initializing faux device if no DT
 idle states are present
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Jon Hunter <jonathanh@nvidia.com>
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

Hi Sudeep,

On Wed, May 7, 2025 at 3:56=E2=80=AFPM Sudeep Holla <sudeep.holla@arm.com> =
wrote:
>
> Hi Rafael,
>
> On Fri, May 02, 2025 at 03:01:19PM +0100, Sudeep Holla wrote:
> > Commit af5376a77e87 ("cpuidle: psci: Transition to the faux device inte=
rface")
> > transitioned the PSCI cpuidle driver from using a platform device to th=
e
> > faux device framework. However, unlike platform devices, the faux devic=
e
> > infrastructure logs an error when the probe function fails, even if the
> > failure is intentional or expected.
> >
> > To prevent unnecessary error logs, we can skip creating the faux device
> > entirely if there are no PSCI idle states defined in the device tree.
> > Introduce a check for DT idle states during initialization and avoid
> > setting up the device if none are found.
> >
> > This ensures cleaner logs and avoids misleading probe failure messages
> > when PSCI idle support is intentionally not described in DT.
> >
>
> As you pointed out in another similar fix that exist only in the linux-ne=
xt,
> I have also missed to point out that fact here. This is only present in
> the next. Let me know if you want me to drop the commit hash reference
> and repost it with -next prefix which I generally do and somehow clearly
> missed here. Sorry for that.

No worries.

The cpuidle branch hasn't changed, so this is applicable with no changes.

Applied now, thanks!

