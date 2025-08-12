Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0805CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNSs6KOwqyOQOFmsrg8IFO4ZjDR6oQrd/gvk1o5f7v4=; b=GSsHo+IV7FBQP6o3EHDJoHNlv+
	Pt1U2DW9k53MeDqJP1B28QAdzceHsBmVGtYk+KQuDK7dtaIoF6JWUFWO40GdMV44biTvkAPlKk7fP
	R/C+GjNVi5oqlO6Y0qjO1cZ3INqCtAW+vRFpQg3bnQMYIeAlhy3Vj0p6wyiUUbpF1qVTxQB82xtCi
	gEUsOJcwUURfVUktzYDWLPU9NT093mKVuInGhb2Ee13g995pCmU0yZJaA99eOBBesBnlZ81Er4kuR
	eZwcebuthYcCLqtyv8Ef+VBcjp6evhy1toNR5JUzLpPI3igeVHFR3qSKiys58cTZk2xDxPtgWAkOj
	h/te0+gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulri3-0000000BHhJ-34pT;
	Tue, 12 Aug 2025 16:18:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ully5-0000000ATgu-1kwn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 10:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754993456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iNSs6KOwqyOQOFmsrg8IFO4ZjDR6oQrd/gvk1o5f7v4=;
	b=fvyDhTryV8uT5bIceLs2yM2YK8m89yXMmBdbpewHNhuubTdIX3pbB9iYeB9Eb2VsHqTtw3
	/8uNvMHT1ojMT3DSX+4AyrjRSvesPiyvhmZoI+4Lr83IXjZ9hGaPyt6d7lG8Z9WOkfps8h
	6ZQBqN0RH9/ECAUBRPohSDIMNZ4lIRc=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-oVUPB6RXPv6hke6gU151Pg-1; Tue, 12 Aug 2025 06:10:52 -0400
X-MC-Unique: oVUPB6RXPv6hke6gU151Pg-1
X-Mimecast-MFC-AGG-ID: oVUPB6RXPv6hke6gU151Pg_1754993451
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-75e28bcec3bso10171009b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 03:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754993451; x=1755598251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNSs6KOwqyOQOFmsrg8IFO4ZjDR6oQrd/gvk1o5f7v4=;
        b=YNGEIjBNt0CySnqnaOWBZcizMY+CJUY/it99TjWXFUV+8Gb7u0SYeIGrmW/MA5FlM3
         U5sAXykyoZ82dIIz+bX1Pfnz190FNJRUpdw1MBdCqWDT3wsmOSO+NvFmeEJA41ACo4pZ
         3CrMujk6f/3x2Tm3wDVF6HTfAXyFAnllzotC8VBXXoVP2A/QtfAjfly1u1+zoEoFFMoZ
         INvO63UcArAlCqzVnJI+jbJZnJHvBA2X0kxpgLDzbWenD6v8umQvuwmDvA1su2lJduJQ
         0n3yUDmWQXCcwFs/Sc2ij67VeGUBaQFjSLq0CQB3USEqpSm2p9cBvfAwr3YVuG4ZvDvc
         xdXw==
X-Forwarded-Encrypted: i=1; AJvYcCUKBeRZ8Fl4HX4T04FPwjVNc6DCwpCXsQtDndKNawl8d3i9l6NZ3uwugmo6XZ9w992ZybvbQQXb4ZJSh7ghRyo/@lists.infradead.org
X-Gm-Message-State: AOJu0YxHsFJssgcNYDNpLULxqo0lzck2zMUxm0vNylkRGJbozSeUWoav
	pUaGf7S4x6IJyFMDifRaTv4I4mU6kq1JsiAZMtnBV+MsFm4GiHYuufBqCq9MdDwKPCOtjr+l0sv
	u2yitbU3N2VAxvXLzBDti7KluAjXg17c+0KhAj+pX3jBbd+1PLB6Wl6BwegPxqJVhIEWRd9Zuyr
	ZXTGnfVG31t2Ymiw==
X-Gm-Gg: ASbGncsRi4CCipCitv6eFTBq/zZbrVzeaoBV1HmR4Hs5ySwS8MMJmX9IHBUiBlBAtJA
	dCN+IFycwFWE41yPeGlqiDF7C7n6u18fjl9QFGZyfK4F73jqIcYsY+EDsiyS58EFwDydk0nqS0p
	f0dscjDOXnC1NqRDBaZ9jvqsNBQK0wGUL+hxer+lmum52Lm+wU9a58ZtMJ4MrIcKIAFQotRzUK8
	haXo1ZPRCPRELrMulpHfkM8twtTC6J5YH199411X358AaNabaDyoDYlB4iTe3oZZuto2nLSkc9O
	lUmnbveUFd77IDA7pDDvmMm4exMFe2E=
X-Received: by 2002:a05:6a00:460e:b0:74b:4cab:f01d with SMTP id d2e1a72fcca58-76c4615b6a0mr21473768b3a.12.1754993451050;
        Tue, 12 Aug 2025 03:10:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLAmaQr1HIbt/+T8A3Xj7cx8a6v2gYbnrKNkZvVwyFoSL03wtB+5VA+cs4MTHadDVFeK0cFA==
X-Received: by 2002:a05:6a00:460e:b0:74b:4cab:f01d with SMTP id d2e1a72fcca58-76c4615b6a0mr21473742b3a.12.1754993450666;
        Tue, 12 Aug 2025 03:10:50 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bdd2725c9sm26811520b3a.6.2025.08.12.03.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 03:10:50 -0700 (PDT)
Date: Tue, 12 Aug 2025 18:09:12 +0800
From: Coiby Xu <coxu@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, kexec@lists.infradead.org
Subject: Re: [Regression] kdump fails to get DHCP address unless booting with
 pci=nomsi or without nr_cpus=1
Message-ID: <i2l2ujhqjd6akzosvzj4njv2vemsfuvywz4gsnj2nwo3fwyjyz@cfhekxpartf2>
References: <x5dwuzyddiasdkxozpjvh3usd7b5zdgim2ancrcbccfjxq7qwn@i6b24w22sy6s>
 <87bjom8106.ffs@tglx>
 <878qjq80yu.ffs@tglx>
 <86v7mt9ai3.wl-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <86v7mt9ai3.wl-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dRkuBGY_Q1bwJfNjSUS8UKIk1J8EYZ6eNHyAlkQr-QY_1754993451
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_031057_529574_E8C148FB 
X-CRM114-Status: GOOD (  22.22  )
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

On Mon, Aug 11, 2025 at 03:52:04PM +0100, Marc Zyngier wrote:
>On Mon, 11 Aug 2025 14:03:21 +0100,
>Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> On Mon, Aug 11 2025 at 15:02, Thomas Gleixner wrote:
>>
>> CC+ Marc
>>
>> > On Mon, Aug 11 2025 at 11:23, Coiby Xu wrote:
>> >> Recently I met an issue that on certain virtual machines, the kdump
>> >> kernel fails to get DHCP IP address most of times starting from
>> >> 6.11-rc2. git bisection shows commit b5712bf89b4b ("irqchip/gic-v3-its:
>> >> Provide MSI parent for PCI/MSI[-X]") is the 1st bad commit,
>> >>
>> >>      # good: [7d189c77106ed6df09829f7a419e35ada67b2bd0] PCI/MSI: Provide
>> >>      # MSI_FLAG_PCI_MSI_MASK_PARENT
>> >>      git bisect good 7d189c77106ed6df09829f7a419e35ada67b2bd0
>> >>      # good: [48f71d56e2b87839052d2a2ec32fc97a79c3e264] irqchip/gic-v3-its:
>> >>      # Provide MSI parent infrastructure
>> >>      git bisect good 48f71d56e2b87839052d2a2ec32fc97a79c3e264
>> >>      # good: [8c41ccec839c622b2d1be769a95405e4e9a4cb20] irqchip/irq-msi-lib:
>> >>      # Prepare for PCI MSI/MSIX
>> >>      git bisect good 8c41ccec839c622b2d1be769a95405e4e9a4cb20
>> >>      # first bad commit: [b5712bf89b4bbc5bcc9ebde8753ad222f1f68296]
>> >>      # irqchip/gic-v3-its: Provide MSI parent for PCI/MSI[-X]
>> >
>> > There were follow up fixes on this, so isolating this one is not really
>> > conclusive.
>> >
>> > Is the problem still there on v6.16 and v6.17-rc1?
>
>Yeah, there are way too many things that have been addressed since.
>kdump is also a particularly nasty case, as it tends to rely on the
>redistributor tables programmed by the previous kernel.

Thanks for providing a clue. This may also explain explain why I fails
to reproduce this issue against 1st kernel even with the same cmdline of
the kdump kernel.

>
>Also, this says "virtual machines". What's the hypervisor? 

I'll contact the lab administrator. What kinds of info I should collect
to help you narrow down the issue?

> How hard is it to reproduce?

It can be reproduced reliably on certain machines. But as of writing I
haven't reproduced it on other KVM virtual machines on three different
host machines.

>
>Thanks,
>
>	M.
>
>-- 
>Without deviation from the norm, progress is not possible.
>

-- 
Best regards,
Coiby


