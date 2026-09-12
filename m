Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE27EC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 05:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJxa2A/3rOOORvzNhRcBlzIBKMNk6f1s0vIeCYqnmPc=; b=XQxs/bQk2qGS2aDYW1W3NwqyMl
	seG5fvtZugh9MUxJZQGPlZVhSb+i1K90ffnJLWeggAOILCaCQJN9cI9uv1tLRu+6NN35DemJshu67
	WIAqKEp+nHxulCoYmmKPSReDAtdIvv+1qBbj8JfyESH2a17TPawtnNK9ojjeudqFjwEDnXqgCrd8g
	aHQcS3zcIxRvsC/fQH9iAelH1E1/kudxutThJSAhxIbuTbaLnz1KOFihy77MlSmxPubndB40Rtr4k
	ojDVLVZ8SdrFRVWgyUNyMboE4G2TRw79GV/NdEYmo0AjYOt3/gfATOANtwDnQ4qbeIskOZJdiHElz
	sIHMbftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5FQC-00000000Wme-2Nol;
	Sat, 12 Sep 2026 04:33:00 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5FQ9-00000000WmG-3EIk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 04:32:58 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469e211a3so195975b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 21:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789187576; cv=none;
        d=google.com; s=arc-20260327;
        b=nA9vdr9FjvD+9GbeZ5ZomqYB/Ve0WvyqEcVKusHPVzL+N/e11exEhn4KsMvIBECafH
         MAOLW5ijWZMXdYYWfKAvUD8S0E+n5fqymH6XK7bIdhvp5vW7Np8LiTPihEX5u11oLyya
         z67rZvNrkHdUJ4mhgnBeMubzfGS9lsup6/cFCoWxSqC0oDXhIqYQkES1iuASXpk+pQbj
         XbJWRvUCvEFBOnLQalqLF36UofbK9luyCOZzETKUSZWx315923SRJQ3+tchEGJYl2+gk
         ncsEpWBwjXDoaifTrEIs3DLPvlFQDHcSjNzeOBj1XtS5mLEZin/qeAnNYvzjhCKrKU4u
         1hpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vJxa2A/3rOOORvzNhRcBlzIBKMNk6f1s0vIeCYqnmPc=;
        fh=1/uzxZ+j6ceQ+Ef9wNLi9PXKTm6bozhVnMCvhL+r0VE=;
        b=UknQ3WfOmtqKq79UFcFCPKsn1Nbxv8yGu86MZRNqv5lt/glKY94KN35uqbPDf7J401
         yr7umf2sO/rOgHoX0jVGsMAi99WUwofcwYckRpA8dFuAQdY7UhOzMCui0IVyI33WrpCm
         jVJPnYWBqPgyL1r9h9BUA1KTBrP2aaw6JQTOhNfxz+BIuxbI4r6xc2P3YVo58gb9Aw23
         AAWDy54SX+k2jH686NapcNWa3uuqdLUzeCBIxT5Hnm+kEpJt/Ho6drfg9KcU0hPVoer4
         fBD2x/ib5OCPLdijQr8JloMqdA9XuUpXzy0h3aKYlhN9k37q8OkDuTA4m3GxalYuEaJI
         gt7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789187576; x=1789792376; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vJxa2A/3rOOORvzNhRcBlzIBKMNk6f1s0vIeCYqnmPc=;
        b=bl0w68qAEPA0JWZiBH03usaB4S+uCvQJMqQhI1vGQM9wkbFuyG14AsVvVDpiRnnEfl
         mye1x60lcZyKryxdAbRji/repW/L+Yo8yurHVC699lUWpwNtAIJ7jz6vd6gJaAx8YHCv
         qRQEmFPvarlLQj2WRRgnwIRuurhWUG1cADk57P/GKct0XrLbNX1q3qlBI5B5xOBMPAEl
         d4i6XJfhxnT55PgE8c4HKk0Ib3H/oY89cZ2zU0E8AXnH7FwJgfW8DGbe9RoIAzLvAy1W
         aKM5YDrF71nJVNh0HgLZBi1lwREsZ4nwLnpq77wGf8kXSjOnHsZKpygWPJ5rRQ2KJZm5
         Mtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789187576; x=1789792376;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJxa2A/3rOOORvzNhRcBlzIBKMNk6f1s0vIeCYqnmPc=;
        b=sNpE7Uc/oyx8H3+MgPzQPsMNqzdP9frrR95Xuxblns0ux0POAJ+cSIJfZF3XETzE1e
         f7mYcaNGtaF5zYc7+b8JU5N1EoX6sXgtZU5algQkKa9doJbKkNIMHO4nXMkD/UeXKdAC
         LlulNMotnt9J5r5SV1Bkks4+Sm/AVLbED54Q/ZtYbg4f5rS/6KQG4BZN7CRP5CEH64Tl
         Y2MDHo2cmAl4SB/rBqc0p8vZoHCX6QDbUQT3D2v8fKgwkfk6tTe0JbhR1RAgHjGJsAHT
         w2Pq7wFb4z6g8PxQUwrFFYlSB8svGBupNIhQ0kTNWyxuM4tVhm4m1JfSN9546J8cQmuT
         haYA==
X-Forwarded-Encrypted: i=1; AKwUvByAaLu5FmbKeIop2JDQN8XT7GlGhR1wKh6+8wslB6y5Y5YlX38Eixyh9LKfqk0LK3YS11m4Wf16p1PuTzcLaEaR@lists.infradead.org
X-Gm-Message-State: AFuF++m+tVTnYEoTYS4rhRoYY1gnOtij7X/RqtMxp472RSjDgnOcmo/Z
	+wBI5pUkS2lGt+30fZqEuRqWGBIuP5RmAmVvuztf0bkLpuHf8/yuG1mwwY9THP0iq2JL63n3Dts
	dtitcSUQwjDMS62DkwOQcMdbMmK2QY7U=
X-Gm-Gg: AYBFou1oeJg1KqYwngHyHBSlJH9nLwR0r8sbxukTwBTYpmidRwi7zBujYf+VNEM83Xl
	BiAcWj5if8k93to0p0wrIlYXO6vI30Uipgk2cMnRWos1DHFpDjX+m6S/GKJRN2nvbqvguM8yAWA
	XkwSGrB2YDJ1Ld68n09iVziztnRA9M1QOClCMp5Go+IfbZrKgsOtXQc70uvcfVf80z++SHRTOhV
	NK4ucyK2apu51v7pPuzqG68zS4ARhMiVgthFkyGrXh+bWGo/Z7xdqLUBWYrqHvAj7zWzmogCU/8
	EkGHYNbzQ6VvhtOkuPSipqlOtPkMS078yTP43F7nWgQM2B5yfawWPd30yziS8S017FCdJHCDVoc
	uhabMU1d+Ip8ol/WNtsJBFZeqf3cL3vNWPgFkMP+ShTwdfBHf
X-Received: by 2002:a05:6a00:9286:b0:869:9298:ba59 with SMTP id
 d2e1a72fcca58-86cc58b3feemr1893927b3a.0.1789187575535; Fri, 11 Sep 2026
 21:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260807160526.379-1-strst.gs@gmail.com> <20260911191429.GA549927@bhelgaas>
In-Reply-To: <20260911191429.GA549927@bhelgaas>
From: Semih Baskan <strst.gs@gmail.com>
Date: Sat, 12 Sep 2026 07:32:44 +0300
X-Gm-Features: AcwNN1UPlx4zHiHBwu2SiU3dxKzddih3M0ikGVdRzc6FKwE8r_Mspr0-EsTYEe4
Message-ID: <CAAsRjR=F7_7M-_tC_u1WRxB4Toj8nbcQh0WeXuNhzCQAs=vbuA@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: iproc: Use the EROM outbound window on BCMA
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, rafal@milecki.pl, 
	florian.fainelli@broadcom.com, arnd@arndb.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rosenp@gmail.com, rani.hod@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_213257_840745_C5E3C9DD 
X-CRM114-Status: GOOD (  19.42  )
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

On Fri, Sep 11, 2026 at 02:14:29PM -0500, Bjorn Helgaas wrote:
> If the EROM supplies the information the driver needs, why does this
> BCMA driver use DT at all?
>
> AFAICS, pcie-iproc-bcma.c doesn't use any of the information from DT.

It doesn't. need_ob_cfg is set only in pcie-iproc-platform.c, so the
windows devm_pci_alloc_host_bridge() parses never reach
iproc_pcie_map_ranges() here; the applied patch only had to get them
out of the way of the EROM window.

The follow-up keeps bridge->dev.parent set by hand, because the wifi
nodes under pcie_bridge0 in bcm4709-netgear-r8000.dts are resolved
through the root bus, and frees the bridge itself on the error paths
and in remove(). The one DT dependency left is the IRQ, and that goes
through bcma_core_irq(), not through this driver.

The follow-up is in reply to this mail: pci_alloc_host_bridge(), nothing
from DT requested or handed to the PCI core, request_resource() and
release_resource() instead of devm since pcie->mem sits inside the
bridge allocation. The ranges property is still read, but only to
compare it with the EROM and warn. That is the warning Arnd asked for
before v2: the same property feeds the platform driver on the same
nodes, and on core revision 0x01 it is wrong, which only a BCMA boot
can notice. If you would rather the driver did not open the DT at all,
that check is one separate function and comes out cleanly.
Both shapes are tested on the RT-N18U (core revision 0x01): the warning
lines match the applied version, /proc/iomem and the enumerated devices
are unchanged.

One thing changes with it. With PCIE_IPROC_PLATFORM and PCIE_IPROC_BCMA
both enabled, a core revision 0x01 board now gets a second probe from
this driver: the DT window sits elsewhere there, so the collision that
stopped it before is gone. Revision 0x07 still collides. That
configuration does not work on revision 0x01 either way, since the DT
window there is one the hardware does not decode, and Rafa=C5=82's DT commi=
t
was tested with the platform driver, so I take that as the intended
path on mainline. It is in the commit log.

If it is better squashed into 552aa843e4c5 while that is still on the
topic branch, I can send it that way instead.

Best regards,
Semih

