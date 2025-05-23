Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAEDC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 13:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ofzuUgD2JIzTK1lz8qH1gPuOkGPJrKZYXjMipRjVWM=; b=fWSIOQRfcdnlm2C+It3GcTZVFf
	8ZsuBuQA4+qwou9Wj5PgxL9dq/uh9QBz8BlmgqbCipxpEswDug0o6mTFVVXdZt9dBPeWl9K3i+IpB
	uqWpwPkn4I33mWk6YJYGT/oWVoYk8xhyDYzyySNtU/FYuvCG+fpEdot8Y2fK6PPj68OD6zz9wWr8j
	UAkzLBRB2zlT8n/Ub4cnmnKPO05Asy2LVrpAN5Xiv9vNa/fnyNw1fXv515SYOQ+RS17blBzZrNmEP
	BBeRMyVZI7BMEPkrLnUg1NJkIt0kiRESoyXzdDH8ciEftel+E7XJrvF+NkuwcfC+WqJ7UJrs61I8y
	MPUI2e9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISM9-00000003wKl-35Nd;
	Fri, 23 May 2025 13:22:37 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIS5K-00000003tn9-2XGz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:05:15 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-327ff195303so75903961fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748005512; x=1748610312; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ofzuUgD2JIzTK1lz8qH1gPuOkGPJrKZYXjMipRjVWM=;
        b=TTaEK/9lqEcD7mW0i1Nr3TBqa0QzMKeh2NJdNCrquhEM1yfuX7qjRvjvcFBo4SSohy
         yI9hucXp/BC1yJTt2jEU5/bh+cGKTNmyfJ9CwL9JL7+BZ5bfwv6+UjHDXv3fDgAf8SmO
         4wfU3ifDHOpFuKAJKQjdoMbuLaXHZoe1CFQRbV3PCdRDxBUwgOJvRgZjWjPsadiz5Q9T
         xZr3YfT+oxzLOhLGY452U90awBVLjXhwMjMtK+w2SVJB5YZGNijDGocPslYyQMbtUKWO
         vjFGoRo0zhFdPwzXYW2ibmFMV60BFyWBYJR0iwGcIHDXY7ETTPMDggrGP7iiASFkYJ4P
         Dqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748005512; x=1748610312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ofzuUgD2JIzTK1lz8qH1gPuOkGPJrKZYXjMipRjVWM=;
        b=XYM+FXp+JV1T8MnkkCxuQZguQTdcfGhes/TuC5EJXgHk5ILI0ZTYEtCPZET5XIWEnD
         EKkIIFn3rgiTq+VbKobDfD1KskBZ6b6iPjqM6crd7dotAKwYQQ+F7EZ+ksE1GR5BpWVN
         sozGV1EAOrRclaUAM+s0p5sTzi994PkeRqElzOMGrCw7/6FTpcnq75PFe/jwwn1tUG9K
         5RSq6M4XbfePrl7T3m/j3ZQ7rkd5x41mvwr0mb9HGFKyN9KsyoARUD9r0nIqBCOBUGAS
         pzj8C0BKbFEFD4P/D2PD8IWNJ4/aXFFlUZokNOI/USuzohkuzB5GyMS94W/b60kGMUJh
         7Xkg==
X-Forwarded-Encrypted: i=1; AJvYcCV3gStK8VtiYkn9HlrSDuhvhCXKHsPHfcjbV8kaJj9MwKUFlspmMV94JqwsPtUQdF7qxZq0A8vAtHhnSe0jd97g@lists.infradead.org
X-Gm-Message-State: AOJu0YwprrIUUuKoVQ+EcOysQXIoodqYwsAoaZHtTO+voh1hCgFNW80C
	7l/PDHOvnVJY1hDdTp6NXRge1fiXbmTX4hF878ayuDpUveyzV7TFLUtZW6JpCUfuA/5qni5JE4g
	ecBA9DnUnjHWA6raCLrIhMijPGfA+p4E=
X-Gm-Gg: ASbGncuXYlbm4XNsVKysiIanlU5i9Z6BPgEkNAPdC9m0AtDGelqKp4lPDCsM6y/IxTn
	Kgk8hUwr3HP3KF2hwBkVn4NA2zq0ltz+xMWlAGNIrGafHZ8pKK5lKRUqT4eDjKiVm+Q9GWS7RWu
	TPwAI/hyZ93vx49iv3JLSDtieMuSlnJ1VGOofgC/vWDCBIgSIO6mkFzveZULz0G6rE
X-Google-Smtp-Source: AGHT+IGr3CXT6N9oc1FChq+L2zQvwNAD13bnITSFZ0E/+/W3e8EL95eryfIkki8B2q4B/f1OTLeeKFeZTaRvi6X9Tc8=
X-Received: by 2002:a05:651c:1608:b0:30d:62c1:3c0a with SMTP id
 38308e7fff4ca-32950c5a0demr9757581fa.25.1748005512185; Fri, 23 May 2025
 06:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
 <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
 <CAOMZO5D-d7bmBfXKe936W5QjmsukRRX3y0ge+xtizqFx0HPE8A@mail.gmail.com> <CABGWkvpPMry26DP4Wo8WEGhokdkf5GdLd=+O5SqRdh-8JBqt_w@mail.gmail.com>
In-Reply-To: <CABGWkvpPMry26DP4Wo8WEGhokdkf5GdLd=+O5SqRdh-8JBqt_w@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 23 May 2025 10:05:00 -0300
X-Gm-Features: AX0GCFtNxWfmT8UPK_lUQ62v_RjY-1XASOWkmtujernBQbwR9phsII3yQ0Wll2Q
Message-ID: <CAOMZO5DBL0BD_YbByqTHRGq_FkxG9vD_ycXiPTJdQ4WfmKfitA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	michael@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_060514_640879_7CE35279 
X-CRM114-Status: GOOD (  12.23  )
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

Hi Dario,

On Wed, May 21, 2025 at 10:20=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:

> So if you're okay with it, I will remove all references to the LCD
> display =E2=80=94 both from the commit
> message and from the DTS, such as the reset pin, for example.

Yes, that's OK.

> We have two models, one with 128MB and one with 256MB of RAM.
> What's the recommended way to handle both cases?
> Should I define a new DTS file named imx28-amarula-rmm-256mb.dts
> that includes imx28-amarula-rmm.dts and override the reg property of
> the memory node?

Or maybe you can describe 128MB in the dts and let the bootloader run
a fixup on the memory size, adjusting it if needed?

