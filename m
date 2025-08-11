Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E29CC87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 13:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfZyZFuXCAASWa8RfHFZrIBwIRCnH8nSJMQS5YlAXNI=; b=1XHyl7BkObxjJ3oc0L6iYqWQLS
	Q8WPUhgtJ1jmHyy34vvWl3+SDXJByqDQunh49R7D3+n3rvOOs1LKJ2ELTv+cK+QFRK+tFvTs1zgCj
	NC0TbMoOl+5I2B0lWIitFfki2yDrQGvXqyM7fgjn4JVWDFVlvuJC9TbTcbAfIwgxO9qSe+pg5Pxxy
	9xKu++RG4PgLQEVXHrds+ln8k8RywdVeIZCpxaby0kUWdz+Uu0uo78fGUOMowNQWPqMnQBP06SSSG
	LNUz1EWOxUNozf/5JKZLDQXmD3QFcyzVahtkrq79auKzEMAr74JP0TSiPYeTuNWLCIs/o62wOsc2F
	TUWLyv7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSPS-00000007nDQ-44K9;
	Mon, 11 Aug 2025 13:17:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSFd-00000007lUM-2O4n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:07:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B1C744B4F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 13:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE76CC4CEED
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 13:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754917664;
	bh=5Z2uz0t2/VXIOmspWJH+xwmPwCRPe8q6/e2tyOBrGCc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V29lB6gS4agJhXF1GdVgq0avhf/8dhWe0xkVpzC18QxyLWIk39EP9y07qiZiPPadN
	 hL9UJ7E0oiKXOukSaWiH0h169KRK7bE7d1KYzg56MHxXzNMkuA55+ZNg/JipcFbYaT
	 TzsYpUzIay4UmWpc9fRkF9RxQniyBvZ3mqnuYD3C2wOKUa3RBvAxryj2JZ1IM8jSri
	 JHLCZ4QK7KASMLazYsAG3bO61mV711GmtEtwJdzZ/XPR+z+Kud5Kss5OnXVvKo8K5W
	 yjuWzxrAKkXZXYVB710rvSrvuQBnCf4rzu3ZSRVlw41QkKDOJ4dbSwnAo4rhJgadlb
	 INQC9G97XjZqA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-615d0b11621so9318196a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:07:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXRqx6z8Fc3bh5/skVwdz0qVuuDGHUQG7WReWyGWfqWIxkDuE+B2O7UX6HbM1Ab1asBQBWxsRbAdfGssxqHEOnK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7wI4tGrGEesxCLjl9pzJtJ1ztktsfQFR2mQWQamomiLLkTHRh
	qJ08mwIqZ4aBUC+4iWvMV9LC8Cd8Lrzpzmtfrn6ZGzc0BpqUquASfRQn034u8/ULGFziTyb4aX8
	p5A2QBsD02jgOAdDH/sUPLMx0s6hoRA==
X-Google-Smtp-Source: AGHT+IH0Jtu3zpqJ6aT6QeliyExaVNlY8+dlNVIs2rZVOSEssgBRkewOJVjUu8sHKIo9QSGuuYURdxqjt1keqshX6mM=
X-Received: by 2002:a17:907:9709:b0:af9:383e:45ab with SMTP id
 a640c23a62f3a-af9c6e254eamr1367138966b.2.1754917663483; Mon, 11 Aug 2025
 06:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250801200728.3252036-2-robh@kernel.org> <175490917553.10504.5537940155167451079.b4-ty@kernel.org>
In-Reply-To: <175490917553.10504.5537940155167451079.b4-ty@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 11 Aug 2025 08:07:31 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL_jiOZcydPF6LXVKu6_z6Bp32g+wXWkNgrLocrg-xgrg@mail.gmail.com>
X-Gm-Features: Ac12FXxZ4YdwCRaVqztVa4prfTmPnxtwEewmpaR37yVm5AHopCS2vYWaGni7MeU
Message-ID: <CAL_JsqL_jiOZcydPF6LXVKu6_z6Bp32g+wXWkNgrLocrg-xgrg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: Add missing "#address-cells" to
 interrupt controllers
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_060745_638058_D2645303 
X-CRM114-Status: GOOD (  12.28  )
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

On Mon, Aug 11, 2025 at 5:46=E2=80=AFAM Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
>
> On Fri, 01 Aug 2025 15:07:27 -0500, Rob Herring (Arm) wrote:
> > An interrupt-controller node which is the parent provider for
> > "interrupt-map" needs an "#address-cells" property. This fixes
> > "interrupt_map" warnings in new dtc.
> >
> >
>
> Applied, thanks!
>
> [1/1] dt-bindings: PCI: Add missing "#address-cells" to interrupt control=
lers
>       commit: ddb81c5c911227f0c2ef4cc94a106ebfb3cb2d56

Please read the commit message.

I've already applied this to my tree.

Rob

