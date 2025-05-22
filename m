Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95F3C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 07:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Pm7W9V2mmyzuHBQiDodlGveixXiKksfY8Pj8Y9T4Ts=; b=ucG1WNaKFPtkeELe0BnQX3PXOe
	+q6fL9VA5vt1LhQ6bww4R5UyRuAJ7QfjBw97zDappkQfJ+xuIL5eLKIEdEoQAQiHeKSbxpJctWjT3
	V3lvEpjIMUgt2ACBFxg7k30Ly49JaSmrAjclH7dZVvstA9tE8/yillwKj3PR3UUuoHL02XQ/mWE8m
	XAW4pwOcZPCOiqOmHRm52LTU+GxeCElWnXaRNGRnpR0pG9Q+j6foyIfYW8fpa51aK6rkHWCteq6W7
	29oYeD6h3Lta85V0pWIqhhQvWMYdoznBzHNxPd9K/IpAX3B2gYCSZVzQi3iSlXZTFgAwINiIoAOhc
	JkjGkDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0Ow-000000008ht-1i0E;
	Thu, 22 May 2025 07:31:38 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0Ms-000000008Xk-0T7m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 07:29:31 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-52d9a275c27so4984249e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 00:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898967; x=1748503767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Pm7W9V2mmyzuHBQiDodlGveixXiKksfY8Pj8Y9T4Ts=;
        b=E8j1BiW8kJGBlbyquI+OrinKZ20J5a+ihJZ8Mo1b2WWJiJRmWx3fJhZiQYV/jKZR7W
         w8KjP0YmS3JvGJugUxg+wNo5pNf1O3yFI7Ejcac/BFpY/8T2YCiKau+EtrSvFR2OdVON
         LfE0ThA9ZZARgVhyjvfXsZC8q4n0EXAOaiguxqzFLizF5BUWY5/+FtxxSK5hkFgODdBI
         MgWAV5mWrOFZ/y6FTFUL/k3QuYxnSXIzKx4kJOs/D9AI8BoL+rTcMTQOInKcDLFiUjm+
         30AoPgKJ3EIgR1JoY84kX+BCMqmzUs3PeLzkovhOUFHcGUkM52liLUEe+TuJAU+yJkks
         Nz2w==
X-Forwarded-Encrypted: i=1; AJvYcCVVn9Dqp/Fms30aL/uMSzuY+uksOS2We2S8As3m+vqPLpqAqM4BQAsBLtQsjmrHUYUj+k/nYqcZZ2YhLsEkzyz7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+Q3C/dgvIUOS2t0GxzXa+yjEVIn5dHX8FW5fPNmkekoYqj1a6
	l0+NsavR77aIpeVwzI4o7Ydxxtbo3OA6MFUAyXacUbquz9x/MYMMNXnPnh/JJTvA
X-Gm-Gg: ASbGncvLWBPhzfXwKO1nq+AKKKUUFBkomXr8KlZDSvTgjbsfWEL6O8BDRY8eIu/JYtj
	lms9c/+wV8sCef7Lb/2C75muwOfpGEx/SVHzz2uV6QHi4C6BhdKHS4Mvwo1H9O1PlE99rrvtt1/
	AEq7REZducF9k7fFhZudAUEN6o+2ONplqDb8F0Oy5uCeoXg6IRAMvvC7jtM6SptmGbnStdOcq3y
	tQEaoEfko9TMOvHrrXTb7/zEaPhwIkMKU1nVS6mgtDTbtFikxEG2fcr4JpybuAFl/jh8Q3hNx9k
	M9z+8rq66C3FIuRysBAUwODoOB74ImAkCLop2eyQMyRz6pP4wNvU9qXRtMBCkQnuuJsSQdfQ+uE
	sx4awW2cD7TxNbLidNQ==
X-Google-Smtp-Source: AGHT+IGDcSENBU7fsC40L4ihERAcEiEuoysYX2w7nvMPz6HK1adR6Ud5LF+Wy3Yv3jUDcUQ9u9cKEA==
X-Received: by 2002:a05:6122:1d48:b0:520:5185:1c71 with SMTP id 71dfb90a1353d-52dba91cb1amr22565343e0c.7.1747898967255;
        Thu, 22 May 2025 00:29:27 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4f374sm11338458e0c.34.2025.05.22.00.29.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:29:27 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-52d9a275c27so4984235e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 00:29:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9dWJ4PIJnKnpWkiIMT8RIs+KfUfatVhmkzQAPpU4vdOsV4BFt/vCSMXoHmCVJfEKIZBQ4N9azfHAphOSW9QY7@lists.infradead.org
X-Received: by 2002:a05:6102:14a1:b0:4df:a58d:9db2 with SMTP id
 ada2fe7eead31-4dfa6b586f8mr25153206137.9.1747898486254; Thu, 22 May 2025
 00:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250521174152.1339379-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250521174152.1339379-1-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 09:21:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgb92D5Vp0NpfboAW6YJnmkFTtWj0wCL7QDM55xkzGEA@mail.gmail.com>
X-Gm-Features: AX0GCFsqKFm6qJMA3hsMqbJWzZuzklg0ynX2aADj_Q8qeZ9nB2XXIFQN5G6rIkM
Message-ID: <CAMuHMdUgb92D5Vp0NpfboAW6YJnmkFTtWj0wCL7QDM55xkzGEA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] floppy: Remove unused CROSS_64K() macro from arch/ code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andreas Larsson <andreas@gaisler.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_002930_151001_942E146E 
X-CRM114-Status: GOOD (  19.51  )
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

Hi Andy,

Thanks for your patch!

On Wed, 21 May 2025 at 19:42, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Since the commit 3d86739c6343 ("floppy: always use the track buffer")
> the CROSS_64K() is not used by the driver, remove the leftovers.

"CROSS_64KB" (also in the subject; "git grep" found no users at all ;-)

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

