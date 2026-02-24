Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F696EFB816
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 08:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3q7I3HDbIZE2ViLYMXs13uKtcpqu5vabX2yCdjCgLA=; b=oTZf18eS7KjDBZ4N+6nUTYC6oT
	wdhJLbMQ+ZsoojDr2zziGPmtOrjz5EvenbmFBb+ItLcjm0eW+Zgqzc8odsjWTZju0HbfNzijkaM/E
	ECtv1JM3TIaCFkkOa/RD6HMW4D7InuVBkJ20vVbpHRBZ1bWxAGz4fjWwxhqdMVxftU3OuUj+lUShV
	O+pazudK2JwEWNsA0NxgFigVKrgNHFRCOi1kHWB80Eaoiryk8GoqZpB3T8DaAT5wx0Tck9vF5QrY+
	ddQAo9DHRpXvdaNaX69DqscAzZR1up3jfBgbh3lZFyELoIvgvib+lTV/cIeVA6oGciQFd8mywoJo9
	YC/i4Q1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuo4q-00000001fFD-3Iq3;
	Tue, 24 Feb 2026 08:47:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuo4o-00000001fEe-3Koi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 08:47:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D34A443A1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 08:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F89DC2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 08:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771922850;
	bh=i3q7I3HDbIZE2ViLYMXs13uKtcpqu5vabX2yCdjCgLA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iYiAZt1id1XT0Nc/u2cnzyYF1vFxlrrnblR4MexnicOGKbXsUmmW9KRaC7pnzJoe3
	 n9pVlQRnZfK1cRZ5q7IdsvA7RgA8QqJ+Vwe4ve2T8wlGtOyZ/H8ipozSExf7n/Cvzt
	 KxjobDZg/mFMEqS3/USm071G43KZOdQY9+rPhtQpVHxnQn7VAUNSGtM4jtMrBJW/f4
	 fwZGYYT0eLUzh1NZ1BWZsvEkPUZlVcubUz08mPsAZ1BIS7KC+K7pXFfp6PsKujbQb2
	 hlCA5BF3BZkB8EbhBll//X+vtF4ZeRpEmeCY3wjPFXnF0QoFfrxY+wbVfbkb8CMkxe
	 Hi4Pr3r3Adgkw==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79802e2c989so47375097b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 00:47:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2gE20kMB0pwRqMSt74Hc72E5CwOeGea/TtJo/HrUaHBz/BKCUQJ3W3pHqa7M+VcvPsrQCtvneqWRecYFx7XYR@lists.infradead.org
X-Gm-Message-State: AOJu0YyWoM9RVt3EmiBYpfYAX3IpxpXy2Si+HOiaUzOEhp4vW9CeXlK+
	cHpoJMmkTJz7V+eI0mhcgnBZd9QpkK90VH0TAqAmBDE2xFxntwAf+aboPAnv2sNwy6XGFI0eFXt
	jdZZlgza0tPUxx/7FWDka39GAVstFcb0=
X-Received: by 2002:a05:690c:4b85:b0:794:7210:61dc with SMTP id
 00721157ae682-79829190d22mr81325537b3.66.1771922849602; Tue, 24 Feb 2026
 00:47:29 -0800 (PST)
MIME-Version: 1.0
References: <20260212-am62l-padconf-v1-1-0bb6f066fabd@ti.com>
In-Reply-To: <20260212-am62l-padconf-v1-1-0bb6f066fabd@ti.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:47:18 +0100
X-Gmail-Original-Message-ID: <CAD++jLnY5Dar4qvBcSiUBgPaDR94b4-ONtuZEaO75Uv5=6foKg@mail.gmail.com>
X-Gm-Features: AaiRm53pigVbE7s4jmjKR7_vFmD2hgbe0l7bXfTTEFLsTkiHi2nSHctBg71UP-c
Message-ID: <CAD++jLnY5Dar4qvBcSiUBgPaDR94b4-ONtuZEaO75Uv5=6foKg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-single: add ti,am62l-padconf compatible string
To: Kendall Willis <k-willis@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, bb@ti.com, 
	vishalm@ti.com, d-gole@ti.com, vigneshr@ti.com, sebin.francis@ti.com, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_004730_857060_73C9AEE3 
X-CRM114-Status: UNSURE (   9.40  )
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

On Thu, Feb 12, 2026 at 10:38=E2=80=AFPM Kendall Willis <k-willis@ti.com> w=
rote:

> From: Vignesh Raghavendra <vigneshr@ti.com>
>
> Add "ti,am62l-padconf" compatible string for the AM62L SoC, which
> requires register configurations to be restored during system resume
> after suspend to RAM (RTC only + DDR mode). This reuses the j7200
> configuration which includes the PCS_CONTEXT_LOSS_OFF flag needed for
> proper restoration.
>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Kendall Willis <k-willis@ti.com>

Patch applied!

Yours,
Linus Walleij

