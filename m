Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F79EE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 14:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joWVG6YN6QwtMFozXajr6ob38hx5tuGFB2YqQJWxAV8=; b=rEvnooIF+rs32clvJyALfHrjf1
	VZa0U47JCsZd3rylnqOBh6M+Qv/0GIGX1B+Yueyh83nv1Ch2tKopJHck2w4X/yy4dhG5CfZ6VGzIU
	fdYXuyJIOCST0KGxStd/MGgi/lZVW1iOuSgMFiK+IHPdbvb2+CXQZ7hB0JoyUxwYOWESmrOd7NqqP
	dnPKfUJCrpRQdtU1HPCC3gAYWtn060dbA2RpCUDBf3SWPJo65nMffZ21D3IH+XbGQoGuCWLAUXzNi
	QvTekoGXYgep2k/dzKg27HedLLtaU8etIp0/1fwnlD5b44V8CskoFALHE2I3BsInh5fNTYDHSbK4I
	lEms0HEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNlt-0000000F9lg-1Ze7;
	Wed, 11 Dec 2024 14:33:01 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNkZ-0000000F9BL-0EkV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 14:31:41 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5401c52000fso3384950e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 06:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733927497; x=1734532297; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joWVG6YN6QwtMFozXajr6ob38hx5tuGFB2YqQJWxAV8=;
        b=H4smFOc+6iD4VG7gDcwIri3mCopxGfzxQl6SZV1R7qA5Ouuhc9fiqgpfhMRQM8dEk/
         uXtLrLpXsWOk7VIu880X3UCl4hJguLdGDx1O5mmazpxa+Y6Gm6gphyrtn418tfclVBBA
         ux3FYEVpY5gj6TOn+5KyD9UUp3ab1N2TsM4R3dSQI1z1+B+wNU53lwhjnnrEw8XiViUx
         IEUIfQUJ8xj10AhLcSmT4mrG3IShKgnYw//m4KfF2MsCOyaZnQdAACd0YaXnIjEAVblz
         EErpuFgW9DqVrHk7YH873/8aUCZu/3Qv0/2PHUa52DE08cUdepZLta4e1guQzKEf3rxq
         gE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733927497; x=1734532297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=joWVG6YN6QwtMFozXajr6ob38hx5tuGFB2YqQJWxAV8=;
        b=w5jqpVF05eJk6dF+UazxBqN6pRMLP1RvfZ9cyuzn4MexRjfz3Lt5VGFz40ALXMJJBp
         XQsv3PQxaj9MqBGQmvcSBLAMAex5JPM2mdssyDoWN2pFx3unZvxCLMmqwhDPcfU/Nmlk
         72xMX4yKB72fSCDnjxLAjxqH5qKBNLUyq+0VvZjrUAWa4xN7IbCkJNYRlFGN43UKwWIA
         ZqKo/2a30ZmbMz2qzSdALQFZdJSZQ2k34U9pJVFHyiEtQ5j1YRJIcCANMf53DYEG7Qrh
         rP2cbp9r0e4SEenACFwiRoij3AIfcM+sI6eVymIXUiemqXuNCQ/9K1G86wvlj0otqKcd
         i+og==
X-Forwarded-Encrypted: i=1; AJvYcCXf6DFw1m1MInEhI6tWMFCo2yvk7vDmb9tIWtzk40IHpnEKpCWlmlFfY73o18xw5Q2ZGxEIUI2ZjP2e/WiUwkPe@lists.infradead.org
X-Gm-Message-State: AOJu0YxtjGPG6HeJ9tDHqPiDSKqUUac9UXofM6cMGbwn8UfxZ/4jzR5s
	dtCV7RqaR4i4SZXyUMQjP5g60TLLkEypMP9qrW1G0y5YkcW72ETEk4QEzZj1MlEkdwmD+09jOOi
	B7S+qM4WGCrJhrEHpUQVYVkkfAYglQXCvMAKqBvwCI5dlgSav
X-Gm-Gg: ASbGncvfGet0TUBHwVeq6swlp7AC9CyqUXpEuukiIsr1ZKdMrZj5nUbBfy+imsriozV
	WBPPL7DW2aSWKnSmbN33z0rKmfXhpoHj3yg==
X-Google-Smtp-Source: AGHT+IHhJBv1eQWShQpfw9LCRRpH2r8wN7wS8bE66kjHN+lCkD0sEsOjQXTbJhT/aLj/ehPesnm+dGREvL7jpex48dI=
X-Received: by 2002:a05:6512:1592:b0:53f:22f5:afdb with SMTP id
 2adb3069b0e04-5402a6055f8mr981790e87.35.1733927497423; Wed, 11 Dec 2024
 06:31:37 -0800 (PST)
MIME-Version: 1.0
References: <20241210160556.2341497-1-arnd@kernel.org> <20241210160556.2341497-4-arnd@kernel.org>
 <CACRpkdZoRbJ4DwRpZQMKbEAvzg4AAdp4B+94SFLm1ssiQmjUwQ@mail.gmail.com> <Z1mYufbtXpeEwTAq@shell.armlinux.org.uk>
In-Reply-To: <Z1mYufbtXpeEwTAq@shell.armlinux.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Dec 2024 15:31:26 +0100
Message-ID: <CACRpkdb0g4zGQ-xu3yW=rRmz0zOVYnr-c-KaTSr155YvbrAv8A@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: drop CONFIG_HIGHPTE support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-rt-devel@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Matthew Wilcox <willy@infradead.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_063139_927018_DB394E84 
X-CRM114-Status: GOOD (  23.34  )
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

On Wed, Dec 11, 2024 at 2:51=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Wed, Dec 11, 2024 at 02:32:51PM +0100, Linus Walleij wrote:
> > On Tue, Dec 10, 2024 at 5:06=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
> >
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > CONFIG_HIGHPTE was added in linux-2.6.32, a few years before 64-bit
> > > support. At the time it made sense, as the CONFIG_ARM_LPAE option all=
owed
> > > systems with 16GB of memory that made lowmem a particularly scarce
> > > resource, and the HIGHPTE implementation gave feature parity with 32-=
bit
> > > x86 and frv machines.
> > >
> > > Since Arm is the last architecture remaining that uses this, and almo=
st
> > > no 32-bit machines support more than 4GB of RAM, the cost of continui=
ng
> > > to maintain HIGHPTE seems unjustified, so remove it here to allow
> > > simplifying the generic page table handling.
> > >
> > > Link: https://lore.kernel.org/lkml/20241204103042.1904639-8-arnd@kern=
el.org/T/#u
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > I'm in favor of this if the x86 patch goes in. We need to get rid
> > of highmem anyway and this will need to happen sooner or later
> > either way.
>
> Well... I use highmem routinely.

Oh I don't mean we should get rid of it without any replacement. Certainly
systems with big physical memories need to be usable.

I am pursuing two ideas (inspired by Arnd and MM people):

1. The easy option - "densemem", on systems with a "hole" in the physical
    memory making the 1:1 linear phys-to-virt map run out too soon and
    overconsume virual memory, actually collect the physical memory on low
    virtual addresses by elaborate phys-to-virt virt-to-phys and page
    numbering that isn't 1:1.

2. The hard option - 4G-by-4G splitting, making the kernel and userspace
    virtual memory spaces separate as it is in hardware on S/390, so the
    kernel can use a while 4G of memory for its needs. I banged my head
    against this a fair amount of time, so I might be incompetent to do it,
    but I still try.

Yours,
Linus Walleij

