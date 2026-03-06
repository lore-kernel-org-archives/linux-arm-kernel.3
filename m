Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B788F0181F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AZ+efBtOsMjAHU31bDqEFigGkiuWozZAO+FbW1bGcU=; b=pY5/2FY1dNFpJx1iHxEccnescI
	/nIVw8ZuK7Gjh3oyvlJH7H8Ee+vrHvtX1MGFdK5drvH2WEjYJjxaHi9f6q+jhZIo3T1VM+h40Dys7
	MOUJsk7c3oJJ2a8KcM3wxVo5l3cgEqoe8tUurUdBDqCQxKW7y/kOVE3ULt4aQn5s392xJCsDZJT2w
	ML07tJl2WPbsDHcpNtxSwq9Do7Eto7zbTbk5jaHxzzgi3HY1G4A2cF6fzVUgoXTgJ2R6IcjeVM1/L
	YY+LK23Rt2zY6BHwTBUhSGVItRU7JVPu8PJQYaHxzEEe9V1Dd08o8Blu9G9b5tAub3IH66ui5rM6Y
	J1GbKQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyS8y-00000003PyG-0dwK;
	Fri, 06 Mar 2026 10:10:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyS8t-00000003Pxr-3aPE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:10:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 315B8404BE
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Mar 2026 10:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13060C2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Mar 2026 10:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772791847;
	bh=HdPn5c+ILBD8SmjwCyntKaL95cGIXo27SeRX31FftiQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GBYpZwEy3R3HmwylE4GJtsLw5kzM1IGv35fGpJrhj2tRZ0/cYKNzDVslthvjZ0H9a
	 hCNS3c01yh95AP8Q/1vJKqp6JwjKJUokF/SmrPF0jgY6cvdpeYYTNcR3oj29b+RDme
	 apcQMt14z0c8vsWzHbGINLNojEbiKFYvwvc2baTRQam2/iurYxqtYZs/Uf41ODWiwG
	 lahUkOpBy51XjxMyjGQ87oFEqRBtXjbhXSPogxah73jI1rYTvp0GyDAlqsUjfgRjKE
	 tEVuENURcGWOflJg5Nb1PbDao4jtRnZYWDVXBwFl5IGfQdOT3LPpRSGGAQxvOXaMcj
	 hTLcRmPdDQPhg==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ca6595c8aso8820908d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:10:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUQr7n+utc5kji5d65ugxVBah9FMXnl7XblEOVyQOQs9b2PoLDJLyJ3TifoobxFckbb40pzY6Yi/fW9LtRzH1O@lists.infradead.org
X-Gm-Message-State: AOJu0YzPQhytQtMa6Crf78KvBX547QENtuTPoQwbJIPUjH3lkCp6QWOZ
	E9sfTejAAwVeiEjT4DVM6g/rqeIkcT1A5zC41zd69Ah7B37V4zs/sJL3D0lsgBYZhmsCYSs4wRP
	DYHuXSyBbhKuOl6ZwEI+lahyWn+T4CO8=
X-Received: by 2002:a53:ac90:0:b0:649:443f:ab2a with SMTP id
 956f58d0204a3-64d141f5c5dmr1386686d50.37.1772791846401; Fri, 06 Mar 2026
 02:10:46 -0800 (PST)
MIME-Version: 1.0
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
In-Reply-To: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Mar 2026 11:10:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLkueX=qU3OY3z=ANA9pd_irWjdf_Czc6RSctzr0MBftQQ@mail.gmail.com>
X-Gm-Features: AaiRm52Qy20I1-ysB23Xjoyr078pEiHqVFaaz6UX6ocGFd2y23NFBsVi-_yieK0
Message-ID: <CAD++jLkueX=qU3OY3z=ANA9pd_irWjdf_Czc6RSctzr0MBftQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: cdns: add clock-names property
To: Zichar Zhang <zichar.zhang@cixtech.com>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	peter.chen@cixtech.com, fugang.duan@cixtech.com, jank@cadence.com, 
	cix-kernel-upstream@cixtech.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_021049_822553_E914701E 
X-CRM114-Status: GOOD (  10.29  )
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

Hi Zichar,

On Fri, Mar 6, 2026 at 10:32=E2=80=AFAM Zichar Zhang <zichar.zhang@cixtech.=
com> wrote:

> +  clock-names:
> +    description:
> +      Optional name for the GPIO controller input clock.
> +    minItems: 1
> +    maxItems: 1

I think clock-names: true should suffice, but the binding maintainers
can say how
they want it.

I would suggest to also add:

  gpio-ranges:
    minItems: 1
    maxItems: 32

At this point even if you're not using it FTM. This will make it
possible to later
map the GPIOs to the pin controller and control pin configuration from the
GPIO subsystem.

Yours,
Linus Walleij

