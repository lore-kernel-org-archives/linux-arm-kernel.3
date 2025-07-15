Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2115DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 16:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mvahs9K3Kwf003Xrbc0oMQlkzIbQnUN8rpvZVnAjj48=; b=M8n5oA1MxZ+mehLtiFEPvKdSrl
	kZo7g6rVH63TKzKpur3+wbOpLDKl6l79LMHe5hERIzE7UVZ7ZTEGmzfOIVJdjLda+e1XyCTUpC62C
	QYs1t16SbPR8M0kv8dKAy5dIdQ/aQY2/ZE1xSB6PO9Xmddrqq7lVvyJlMDCOSh3JHWIX72DhjnOf/
	7Y0nBHp5LyCcm+TcSdzsbW2y70xUuoYAi5NCkRiBGSVVGTopNtjJAT+vz2frmWRoJW7HG9SOsfYZv
	PQVsoeOKGdqAsNE8VMADdXPNddzcfBsl6RUnDFV7ejkA5z7Crz+dwJrIny+8DkTcMaDQ1G8j/nooP
	cFpLZN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiUt-00000005kKz-3mPy;
	Tue, 15 Jul 2025 16:27:15 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubh7P-00000005USZ-0x4n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 14:58:56 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-747fba9f962so4581681b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752591534; x=1753196334; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mvahs9K3Kwf003Xrbc0oMQlkzIbQnUN8rpvZVnAjj48=;
        b=OTVgHedHz7ApKt5vKUKHM/ukVHiU58rBbVL3iYQfYXfIdzCpHf3KW7QEP/kibS+5zS
         2lSW4L0O2HAk0loQijzlEut28AK+AnBSnF/LQDwIcgeNqyEG6h2tdm0lamBn26AFReIh
         n8M9qGOfGe7KoHzYZ8STaWKa1j3IU154fFdsIxmOv9BbYKp5ZthaMOKn8ULF+748gPXG
         GyHSSAsREPE3beGhvwuA7qo2xBNi9sQ475a3RCmguVWrDi2XTalbCi1G2owp4EXLiwZc
         Awy00MZRJJljTqmBTOCqG2Xr35Ph7BXolHfrf/rUitIeMwXdPKfeGmyxtBOwtrpCjbG6
         /uWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752591534; x=1753196334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mvahs9K3Kwf003Xrbc0oMQlkzIbQnUN8rpvZVnAjj48=;
        b=m8Lj7f7DLn1vwqgiCvS4l+Wh5lkie9kTiFKKh14/3MYsA2YufLeUgoYTHwlrxDwyjJ
         rPTz8Ex4EKPaB+DBu30oNzGa3GgneGLSlmZ3ZDNgLrwq/fRp+EmJjPXZNyiWo0exzXJv
         knkCEKfjK0Y31cI/4iWoGSy3FCq22MAFlAra3fEZs3Qcycula5QIEkHndJKhUpq8JsEX
         aeIFVpIE/8vytdwsUF/dYGveSuppaUY5r7MkFleIyr707NS0hBBdye1EGWfDGo6QSs4S
         DcgVg7eA08ygIYG5UlF2UJO88ro/DyB3N/rtwyvmWAdIegi7ExbI3LC60XkhQNEzIAw5
         wfnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9QLrEoFG6aEfkTHYx0crljfelvGEsv6iZ4hTEMBE5dig16wDV3SRjkDfut7vUEsN3fc0I1uuk9SZU+HMjhZ4B@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9cgZB+D84IrH0a4pSLPWbPCq45Is9TJ59qJmazVSkQK/RQEms
	ptrG2Zo7e4PlUnDcVxcZKyHcNibOLGPOY5TeJ/sIZk2bdfErFI3AIPI7OR+d2+ELYeA=
X-Gm-Gg: ASbGncu+O/gZk+8wHnXgekfVKsmI02PKUzRu+O+6kKpSarGJQobVZPCG6WkxzhDrhN8
	lY2j80/wTw3g7UwUFWIeBoN5BMdQubB/yIdAyMT7AJETaFjaJiA/j3KRHENC+sTDQB4hQCxZXda
	6RVMpd0O6NaOYktWsUgr+aXlHnNH+uaM7oRmt1RbRA4C1HMXPRy7vInMhmYIj4qF7ewlQ9qCGiT
	vr+u4eXFQTPCO06ZhihWnX5ZdztDasuFMiSqQ6bAOmXVkNID7PH1pfh1p4VPe1As33pWDb9MaUz
	MPjsuAK+7o5SPoBoYkVtwhNbnNctEbWw3b86jaeI5rLyrzbhMuxRgkEAx2IPjFzoT5ZysuFN/cD
	GgDe7LAbR+7jPD5ueldS5n/fHYd+s0w==
X-Google-Smtp-Source: AGHT+IGWqmTNcmPppTn41XmZxoBqwnqg0u0bN/W4bU7UhI4lYpV4O4cn1UsFVwKVvFBue7Ekoyiq4A==
X-Received: by 2002:a05:6a00:ad0:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-75584eb932emr5340905b3a.10.1752591533903;
        Tue, 15 Jul 2025 07:58:53 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b6fbsm12327709b3a.84.2025.07.15.07.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 07:58:53 -0700 (PDT)
Date: Tue, 15 Jul 2025 20:28:42 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org,
	linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] Remove unused EFI runtime APIs
Message-ID: <aHZsohPoxLYML___@sunil-laptop>
References: <20250714060843.4029171-5-ardb+git@google.com>
 <422e2a72-972f-41f4-a0b3-d69a6cb0c2e2@canonical.com>
 <CAMj1kXEXpBF8hPaVMU0sDgNysYT66MDRmr3JHO4Lg1sJB_Yteg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEXpBF8hPaVMU0sDgNysYT66MDRmr3JHO4Lg1sJB_Yteg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_075855_275760_1BDF1F4B 
X-CRM114-Status: GOOD (  34.27  )
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

On Tue, Jul 15, 2025 at 01:29:15PM +1000, Ard Biesheuvel wrote:
> On Mon, 14 Jul 2025 at 18:11, Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
> >
> > On 7/14/25 08:08, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Using EFI runtime services to program the RTC to wake up the system is
> > > supported in theory, but rarely works in practice. Fortunately, this
> > > functionality is rarely [if ever] used to begin with so we can just drop
> > > it. (Note that the EFI rtc driver is not used by x86, which programs the
> > > CMOS rtc directly)
> >
> > The main problem I see with firmware offering access to the RTC via UEFI
> > services is that two different drivers, the firmware one and the Linux
> > one might be trying to access the same busses or registers which might
> > lead to unexpected results.
> >
> > Recently there was a discussion in the RISC-V technical group for the
> > server platform specification where the same issue was discussed
> > concerning SetTime().
> >
> > As a UEFI firmware should not care which operating system is booted, it
> > should be up to the OS to disable EFI access to the RTC if it has native
> > access.
> >
> > Could we disable all the EFI services for the RTC in Linux dynamically
> > when an RTC driver is successfully probed?
> >
> 
> I don't think this would be the right way to do it.
> 
> It also depends on whether ACPI or DT is being used to describe the
> platform to the OS.
> 
> ACPI does not support describing the RTC device, so it should provide
> the EFI services.
> 
Hi Ard,
IIUC, TAD is defined for this purpose, right? 
https://uefi.org/specs/ACPI/6.6/09_ACPI_Defined_Devices_and_Device_Specific_Objects.html#time-and-alarm-device

> DT can describe the RTC device directly, so I think it is acceptable
> for such firmware to mark all RTC routines unsupported in the RT_PROP
> table, and just expose the RTC device directly.
> 
> The OS shouldn't have to reason about these things: it is up to the
> platform to describe itself unambiguously.

I agree. But I think even with ACPI, EFI GetTime/SetTime can return
unsupported if there is a TAD exposed with proper _GRT/_SRT and _GCP.

Thanks,
Sunil

