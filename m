Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358B8C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 05:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRVSkTsx0i3rWvPyUmqwcUQ+HYyR1vrgtIB8BQv6fdU=; b=ELaiStG7Mu2FbqrnwXDQFJqZIq
	AFUjdLqC0ZRP2gRFwFBsa7RbYsyT5o+9IpSQT7PuI5GSSAmyorMsSYPJ2olug1sTcDFKf7h9xT6iL
	UZ0BWfK1t/LB1eFg8k5viA8WiU6HkMWBUFwTP+mMau1ujqz5j79BmdU4Xq4QQpdinpMxUuyxjwDB1
	EM0m45FqxkoaRezJrHQlksJmPvjZClLV/84zOgmOVFR+nYk4Ua5wubpBVjoEfStzoM8S163cW/ZWE
	11xCkRMvYm4RBYrRgOFoIOcSp6CyFBngjL3QI9cCMDoNpE08G67uemUYAIq6aBfYwwdnDH6WTnS+6
	WV6ZodKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74r2-0000000AccQ-1NrQ;
	Thu, 17 Sep 2026 05:40:16 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74qz-0000000AcbY-2MJq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 05:40:14 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-85469a34907so512210b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 22:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789623612; cv=none;
        d=google.com; s=arc-20260327;
        b=QISpJmP+j9RCgpeLJ+EesOfZzbvB7OuCmMX1ycXTmuHA5kC5TPXq3p6W3lJvVgme03
         mVrZvPH+rHRfb6R+Jo7Bsec1uAexJDoVFJmPmNx9jQ7+T/j0gdUw6y1YyVTBfJAcc3EI
         nGN1JDZR4aQiIIz3wtlJ3A+GdTFtvQDHY5ChBd0oldWibC4TsWdyr21KxhgJsmiu8+eS
         nchsYW/SlluynfpC0UYw6rL3hgEIZw051Qj1OQaZ8GsSalA4NRD2QMLKJ43Dk6lDz7ZC
         0kYt2adR1vhoE4k6Qb8Km6OF1ffIFqocHgmw4W2/k4B0Xw0rIq8bnGTQWfvHMAQibArt
         9I9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dRVSkTsx0i3rWvPyUmqwcUQ+HYyR1vrgtIB8BQv6fdU=;
        fh=dYQMUGnrxFbCvV7KJqUn1ZtI+b+FpHbCrjMOwAA5Tf4=;
        b=IJMQmuE5QkK5nnBcfCgMQ1+7AQBxIQMT0CjcRG7lUBwdH9K/2c4Hnm4b4865sWecxK
         8eKmlahAAMaIEPmmrS7ZeeZJnW6/hD10aZacyf8XPU+TXSZ+nzwDq9VXQSbYi+IDQ4IO
         411ytLu82UlO/xLVuvqubcflSx4DV9lHj4vQKQ2B+YI3tX7N1qhAtpkaNzv3mLcskY1K
         oXQfIQ/SwI8285Ayja5nHlS0dpMYpyzoavUaTIuYY3SY2NnYi9LpVBugx6T7aGFtXUwm
         TBZ8HWHPMAY/aRGwTWmeCAIEdwY1d6JO3mJOrcFzxnx2D+tUzLKQGwIUNPXylFRI9eIN
         snxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623612; x=1790228412; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dRVSkTsx0i3rWvPyUmqwcUQ+HYyR1vrgtIB8BQv6fdU=;
        b=FkGsHrv+Pmfb5tJgKePiYmY1XWDGxpnGTG7EwFevtFKsUy7k0hmK2bnxSjEXCAXO1v
         5r3vwiWntEd2LD8admm8Oos31eFjLSYjq9/DvxOONd0RSLZhGwFTmjq6INZ/TdN4L1Rb
         eQ7kqK6U+eBKhRDGW5cnSnWrmiQOdOQvjJNJQ5qQsTq27mBMJLlWJZz1eMtBjDZu9Wa5
         NyacNoWDHlM3gnefrfaqbxJ0VSKpvoOsWmMPC/kOkngyxCk9ymBEquZRIbAOfeuwxtAO
         JYpfSijUoOL7MY0r+M6aYtsxs/191ZzFqt5T+kQQSktXCpgYGaR+bWHC6voERu/eP6gb
         oJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623612; x=1790228412;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dRVSkTsx0i3rWvPyUmqwcUQ+HYyR1vrgtIB8BQv6fdU=;
        b=IKcIFkHJQJ5Os0RJEgJKtWoGaTryQgevz1L2yN0NKZT+JZZ86SdCw/GN8kptmyYpQD
         g9/NX0Sb06+pq6ytCBmPTUWlYEoSKOZ7HvcpqDCx+j7y3cNsgFtMp56mKKSakYstA4iL
         M4aNUJTptioeiyzK4jQDaAv+9cKKHXr6XjW/CROMitgz1saKdLfkcI8wOHRAqD1yNhm6
         c1YsWyEqM3y2jBlxHI7nEPyszknlU1G96JOqguZ1UniSkxUjZQoTmJNzOQZebFBl6clM
         lwgirTRYylUZ9fPFW9H4WM4ihNyT8ZYQ/O8jDLSoelhjCnTJgyGcj56jsIUcFjHTJT/c
         hlIw==
X-Forwarded-Encrypted: i=1; AKwUvBx1RoQ//sEElr21p2wXdPRw+o+VDdz70BKGlJ731wxG/ak7tIJ8mKUtJjNx8ix84A7y7RBNVO8Wwr40EF+zymAJ@lists.infradead.org
X-Gm-Message-State: AFuF++liIYiPARgc0QqrD3QwcHLks7ATGT8MPVRsksMD2volT7jgWEpV
	BPHJAXW9OblRVJOhRVDAbQ30+/X8Emrm+MbKKKwqa3/ZpznIbs/0o09JmnKfiMwGwFiYrJA2xW+
	YWZActudieajBhaqrjocBV9e/dGIi3g0=
X-Gm-Gg: AYBFou3+sq6jEvUC/j8KvPI15Q7UV2yc/l3cb+b8jk+xw0VIzNykc+R+gCTp8wLE/U7
	UzqEqx+1U05HyGvcx9lctVCi/xFQ1CbFC5Wu1hvje2KdRsl56Jkgwf0h0gK6ijfCI3qAIAnCmQH
	lbIFsjV+k9qRFuXUy5e/FvQyQpR1bRv5thQ/q0ejA7IpZWHg+eZBRfQNIHsvoXIfAWEnUUlNLN5
	vWEK/VWld+9U4lWHTiub1QILN1Zf7xjoU4dcBX0n8CuUz2H4Rz7et7O5hXOSoF95pUXMGGZXJZs
	cPgqfeYmCupljsuaYgSjuXAN3+Ww7enVZAR8DxitybUxQBLiADIhEjtcslO+MEQoGNFEqmZLxae
	8ZeW3lptXB5ypwB6g0kDEJycoou6Z9kWaI3qYR0eOReHys5w=
X-Received: by 2002:a05:6a00:409b:b0:871:eea6:95f4 with SMTP id
 d2e1a72fcca58-8723cc3aa6cmr11213709b3a.19.1789623612257; Wed, 16 Sep 2026
 22:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAAsRjRmur6jr6mOt4ifSc7DA3k7z31qZ5AWwoJ2qK8qV26eqpg@mail.gmail.com>
 <20260916200110.GA979975@bhelgaas>
In-Reply-To: <20260916200110.GA979975@bhelgaas>
From: Semih Baskan <strst.gs@gmail.com>
Date: Thu, 17 Sep 2026 08:40:00 +0300
X-Gm-Features: AcwNN1X0y2YkcHZ7xCn81vOGhjIWs635iTXuJ_dZikcVuf3mTmvFXFqWo8jhClY
Message-ID: <CAAsRjR=1iL+Nw0+0erVH2t8igpobXBfcqijz4vzMO7cW=ryHPw@mail.gmail.com>
Subject: Re: [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, rjui@broadcom.com, 
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	rafal@milecki.pl, zajec5@gmail.com, florian.fainelli@broadcom.com, 
	arnd@arndb.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rosenp@gmail.com, rani.hod@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_224013_615998_D3055659 
X-CRM114-Status: GOOD (  16.87  )
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

On Wed, Sep 16, 2026 at 03:01:10PM -0500, Bjorn Helgaas wrote:
> If bcma finds both of these devices via EROM, why do they need a
> "brcm,iproc-pcie" compatible?  If we omitted that compatible, what
> would break?

bcma does not need it. pcie-iproc-platform does.

bcma attaches a child node to a core by comparing the node's reg with
the core's base address, in bcma_of_find_child_device(), and the only
compatible it looks at is the bus's own "brcm,bus-axi". The PCI
devices below then find their nodes by devfn under the core's node,
through pci_set_bus_of_node() and of_pci_find_child_device(). The wifi
nodes in bcm4709-netgear-r8000.dts go back to 5d1f2d2c2530 ("ARM: dts:
BCM5301X: Set 5 GHz wireless frequency limits on Netgear R8000") in
2017, which added pcie0 and pcie1 to the dtsi with reg and nothing
else. The core IRQs have come from the axi node's interrupt-map since
1f80de6863ca ("ARM: BCM5301X: add IRQ numbers for PCIe controller") in
2015.

The only code that matches the compatible is the pcie-iproc-platform
match table. The compatible is also what makes
of_platform_default_populate() create a platform device for the node.
Without one the node would be skipped and the platform driver would
never bind it. That driver reads the ranges, bus-range and the pcie
node's own interrupt-map, through devm_pci_alloc_host_bridge() and
of_irq_parse_and_map_pci(). The BCMA driver does not depend on any of
them. It has taken its window from the EROM since it was added,
552aa843e4c5 made it drop the DT one, and its interrupt comes from
bcma. With the follow-up it reads ranges only to compare them with the
EROM window.

What would break is a build with PCIE_IPROC_PLATFORM and without
PCIE_IPROC_BCMA. No in-tree defconfig sets either symbol. Both default
to y under ARCH_BCM_5301X, so multi_v7_defconfig builds both and would
still get PCIe through bcma. OpenWrt builds only the BCMA one.

The dtbs_check warnings in 767012397976's log would not come back. The
schema behind them, pci-bus.yaml in that log and pci-bus-common.yaml
in current dtschema, is selected by the node name, "^pcie?@", and
requires device_type, ranges and the cell sizes, not a compatible. I
checked with dt-validate from dtschema 2026.6: a pcie@12000 node with
reg and the cell sizes only gives the same two warnings, and the same
node with device_type and ranges added and still no compatible gives
none.

> Sorry to be dense, I'm probably asking dumb questions because I'm not
> a DT expert.  I just imagine DT as being a substitute for native
> enumeration protocols (e.g., PCI, ACPI, EROM), and as specific to a
> piece of hardware, so this single DT that describes enumerable devices
> with incompatible addresses doesn't fit my simple mental model.

The bcma binding reads the same way. bindings/bus/brcm,bus-axi.txt
says the cores are detected by bcma with the memory ranges they use.
The child nodes are there for what cannot be detected, IRQ numbers in
particular, and for cores that do extra things, such as ChipCommon and
its GPIO chip. Under that binding a pcie node is attached to a core
the EROM found, by reg.

Best regards,
Semih

