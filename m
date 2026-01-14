Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540B3D37E5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsJHSf3/AMwJQdEYVXGOCzU9jiYbWVnUyVT7KumsBhY=; b=bBa7PB7R1rBB7FZ3nASQWc+ub9
	gaJj5zqepHjileNSzxuY45U4hHD5DNCZyoKSR4gTzQORwXtffV+HwPnr2jQlgWOovv+dEBkdadrO3
	4gs+5rHiDt726LMypN7AM9eAqtWdrr7u6TpIY8uLI8BfJP+D57l7Tnhl4kz6IebGQDVVVdbZ5Unej
	BdHHera91O9uRxKufpqA/c6f58mDscV8hpvFaIiXmnqAAXPmFy5rTxzbciQFBn/n5h7OLp7yErH8l
	ornaTRaVgXxJ9hckMBU36QWHZkOiPzjwxSLRgV42kNasjtjNW7qL36ZgPvzPnudqGcAxzCWiDzLfv
	F4T8P2jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3F7-00000009nrM-2RtE;
	Wed, 14 Jan 2026 15:57:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3F4-00000009nqI-3NZj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:57:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00962600BB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 15:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4466C2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768406225;
	bh=xsJHSf3/AMwJQdEYVXGOCzU9jiYbWVnUyVT7KumsBhY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ciM3mmGaLfb4sR3dwp0OsziDDyZMrmjtQv0yE/eWeVkMVjJ4/iDSkJgdMZLah7KNn
	 mrV365T7U4hSIO3tf2+e84SJkaTTPI0DHyWaBigzsSndOjxhHinfBHCZQ7Cw+dNbUH
	 3Cm3GgsF4uh60LnQwgBR7FyBfcfa9TjhtsIvOXcWE8PYDk7MhbDlm97c7t7BWqjEke
	 av0BqCxUCmLGHnjB/lBs7CcOMZqnqbV9gdbpaUCnGJmsUV4MUxq028Ws2mio0/evFj
	 8QgwA5/o/1QBZfV9qnd34rN/IouI1hHcGlay/WXkaVA8+NEOaBFI673UqL11pjvv+1
	 975Y5iTV9nVQQ==
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4507605e19aso5850255b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:57:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWOAwGjZyHGyNd6p3gwLYcBkJ0UY31qOWrYezTtLTDNvSrL8g+npB8bgJlUrUYLECWrd7BCZEhs8jBMkNKk2L5P@lists.infradead.org
X-Gm-Message-State: AOJu0YyQlZy3owPbaPSW7pPMXtjMoXWl9In0Oz8FYL78pcdyVa0PlKGZ
	AHPKHr2Z3dCbvd1VQrDgOeh7vveYRYABv13DZ4KjfO2q0Ip10V/vHBoXFVcaCIAAnRXAsAAVhdJ
	tANnVs2j3QzD+urQqkbHhiHZLS5ij7QQ=
X-Received: by 2002:a05:6808:1798:b0:45a:6d11:9895 with SMTP id
 5614622812f47-45c715f7907mr2183029b6e.64.1768406224737; Wed, 14 Jan 2026
 07:57:04 -0800 (PST)
MIME-Version: 1.0
References: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
In-Reply-To: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 14 Jan 2026 16:56:53 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gqso3q8gUZ3wPq1iG7zOBUu2cWMDZiHqCBU5dgdu_KTQ@mail.gmail.com>
X-Gm-Features: AZwV_QjrZrLf1bCykQ-ryg-5n0xrmuSoINx75tjJllyFFfS_mnMgNK7g8MW_veM
Message-ID: <CAJZ5v0gqso3q8gUZ3wPq1iG7zOBUu2cWMDZiHqCBU5dgdu_KTQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] irqchip/gic-v5: Code first ACPI boot support
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	Jose Marinho <jose.marinho@arm.com>
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

On Thu, Dec 18, 2025 at 11:15=E2=80=AFAM Lorenzo Pieralisi
<lpieralisi@kernel.org> wrote:
>
> The ACPI and ACPI IORT specifications were updated to support bindings
> required to describe GICv5 based systems.
>
> The ACPI specification GICv5 bindings ECR [1] were approved and the
> required changes merged in the ACPICA upstream repository[5].
>
> The Arm IORT specification [2] has been updated to include GICv5 IWB
> specific bindings in revision E.g.
>
> Implement kernel code that - based on the aforementioned bindings - adds
> support for GICv5 ACPI probing.
>
> ACPICA changes supporting the bindings are posted with the series; they
> were cherry-picked from the upcoming ACPICA Linuxised release patches
> and they should _not_ be merged in any upstream branch because the
> full set of Linuxised ACPICA changes will be subsequently posted in
> order to be merged, I added the two ACPICA patches to make the series
> self-contained.

The patches in question have been included in this series:

https://lore.kernel.org/linux-acpi/12822121.O9o76ZdvQC@rafael.j.wysocki/

and are going to be applied shortly.

Thanks!

