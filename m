Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9C8CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 01:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDmST7kAhWIJHCguqYIGPuaIfAHg6uPk1l3Ttc4Z6Hk=; b=ult8YJ06UkeDm9IknL+3vFueIo
	UAX81DIgUO/RxGahuTmaq7FiihkwoVDjOFeuFtia0exJz1dnN69thDOIsb70PDtpSTV7RnUGPrGLj
	Cbj+r6oBo+v7GAdekWc61ZooXci1kBvfzcZ8DKgqha0edqbXGhraRoXzjDoMjen6R1vXxEymh+GgU
	qfrQ0qIfOYTnxjTQgFwdn1oXvwd62G4Zomc1ROMykkITLnRaeUGK5JexMTiRm5D2/RkvHwDk/URFt
	yPYwrgXLsHDDMMKKvtYQW/0IPiMKEy6pOvVnx0OcIQ/fS6oiYnToo1uTGdUpZIuaC/zoso0r17WRg
	Cih08Yfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGnd9-0000000EJjp-1DGM;
	Wed, 14 Oct 2026 01:18:07 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGnd1-0000000EJjM-403V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 01:18:01 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so493896a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 18:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791940678; cv=none;
        d=google.com; s=arc-20260327;
        b=CtB8QQdl7nOcFgiKqKGAKYQ9TbDT8rRUy7e5KtFUrDrTH3VFkkyySaeC0JlLbpqaFO
         GZcO5EwBCfux4IU4J1w/nsNHgto5kS1H5Fi6WF+yMnFDV2l3TGkX2SzGbhXmym3J84Ov
         btEiD7qgOwX882Y5KjVcm9FMgL3q+f35m+EYsVmi0YRy/JqGb36WzXbH0nQHWSejLkFl
         cwnkFSjGcQtsp5vw13vW2qFreGVx6kamn0bcdZwO3BOy7LgVOJBUmsCDa73KVfxhDFad
         InQHKBAqUoCeDWPAta77PqklKLU0LyW37vKWnG1DISCcI8dF+ReVjpmDJPA0yv0IRhZw
         W2iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jDmST7kAhWIJHCguqYIGPuaIfAHg6uPk1l3Ttc4Z6Hk=;
        fh=EoHrofvgmL+nBet4+zohWZjhQgYLLLvTrT981EimBug=;
        b=dqG57A5PI9EEPLzxgI0g9QdDa3Yuac1Z5z3xfSOjqTD2pF+/I2enrX0801zyz5kVIt
         5sjpc3ZdG0nV6MuOBdapIFyYswD3I68C3m1/77CPUx5EvgFjOzu/ycvkGchdt6rMLAld
         UdSMQzEPsvCJq0EUbGigAbJ4ejfzPEz5IePe6qlo4coQnJUa+KmRprxKkJyRVkzfn2fW
         4Jzr9tCoqeYk+Z8fUsJV4DSQioK+iK5eRDo8aMLSC3f9Rf/d4uruHYRpp8VtKhhOe5wc
         BnF9bklBgQ9U7ScjtmM9Oag9Q3afgPRVvFRuibtWG1nlrTd4lVe24VZU26XC++WZxkWu
         rgTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791940678; x=1792545478; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDmST7kAhWIJHCguqYIGPuaIfAHg6uPk1l3Ttc4Z6Hk=;
        b=qVAedho4DSJPBCNWikm0Q+mYKXtBrbQjT6O0TFoXd6LzMGT1QVeH7bN+L61qqr+qS4
         UKIDgLqg2ISzQ80+NwZJEWq2+6BkQVfA1ZvkJFmkiKzlH9JATxJbJaOfQ92/vATd9LId
         uCf7rp2jX2xV0LIDie+PtFfKYgFCg9fpL/HqJBn3dgGGpoCMHVkKZAt+yuEkMPV61a8J
         IHVXYdwx+B3CaD0WsTIkWzVpBGtCU66+vY/i4nfjxBL7kzVzgoXwySovzGyjDMFAQ8e4
         fhvnWde8ui/LDZAtp5cY1wD/0s2MXEdjA5/35BQ+kfqlFdgsUKhAA5xH6yaEkL5jhbee
         Iz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791940678; x=1792545478;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jDmST7kAhWIJHCguqYIGPuaIfAHg6uPk1l3Ttc4Z6Hk=;
        b=kKECB+r4jjBBgCcNb/N55blER0MTHroLFuN4Qks/ACdqSSrdvTCgnRTib0KdzmxmQX
         2zdGm2htSB9EGsLwLaUJcJ3qozLEpz/yBjo5tQNTIksdOYkuIF/iC02mk2PYH24qwZkr
         WRUeyrZKLw+nE9Ju3axX7rKB4FEnKggikwanK8dYqOIFw/2KP3hyWrPlnfBQYJGj8j8b
         Nf4e9Kv1hKK8CNP2MVZfDWVtWGsUbJYw8/nMhCIcPZqLIm4zcYXmHRwqFAtfOw6TqKF1
         04mNMjNjYgZMjBCnekz9ZK+F98s+ANezBSqp1MHufTfF9CFbLA7gPrAF7vBKVTU0iPQX
         wP8A==
X-Forwarded-Encrypted: i=1; AKwUvBxRikjs51V3WtOqKB5hoqf8qEiORAWoFZsQx3G6W61BzskStjdjYF8lHGPx9wcEnOlERblU3DRPcOXPjbtGu740@lists.infradead.org
X-Gm-Message-State: AFq9FYIy/i9jEYemlEwOVMxSpVicXiHHTMbAQ7966Tr8VEtLNvMt5WfV
	AWRgz3Hs+OuKagJ9SRkCoW6whIwlYWEAwY9lLsckuTmWQBzvUiAvJlmLTfbTOh6bXZUAH/UozDs
	hEpLOtEFGWNTnyc1IlpuspnMSsU13UkI=
X-Gm-Gg: AYBFou2nWftXbrP+i3hpnVM5ij8f/JS1KiTssanBd9K9QmxcXD2GuLJ7AV6z2D1EkW6
	4YvzlBPg0Pk/ZluwU3vdwXic2NyyQ2PHwNLi0ulJgyIw41fL1G+uSinWwqCsaManh2Orv++0kse
	1/1c3iOFaV87pLYp2d2pgwSERmgLzcyC3rPy0J2Yx7O7c3rI7W4scDs5sORqrHRixsHoGesOCqn
	Q57sJUxkwdu145BxdpPdt9jUi/J9cCHRfqQwCLd2TWKUVnfa4XaEScurDZhWryA/3m8QgqgVWd2
	EAEDIfJoOH4DZ9EGdeilqbuUk9eTWgWRjGHiBPr6ZKFhPCd0jetia/z7nKsgwkCeXpsEnWp6EKH
	7E0CphjJOi2YR28QnAuDoQ8CvE+cJz38MPS3TjQ==
X-Received: by 2002:a17:90b:518f:b0:3a4:b0a1:c7ed with SMTP id
 98e67ed59e1d1-3ab3a90e667mr11772541a91.13.1791940678077; Tue, 13 Oct 2026
 18:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20261013220421.1588051-1-bhelgaas@google.com> <20261013220421.1588051-3-bhelgaas@google.com>
In-Reply-To: <20261013220421.1588051-3-bhelgaas@google.com>
From: Semih Baskan <strst.gs@gmail.com>
Date: Wed, 14 Oct 2026 04:17:46 +0300
X-Gm-Features: AclHuK_e12mFZYv6Pnb8WSqKFNBAW2cZiwmazllPkVxW3EceBwkTGRAJSzPTr38
Message-ID: <CAAsRjRng=D-kP3pakPA=M5k-znYbTj3gz-RGiajnxhS3ymz8sg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] PCI: iproc: Use the EROM outbound window on BCMA
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, 
	Rosen Penev <rosenp@gmail.com>, Rani Hod <rani.hod@gmail.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_181800_002858_28CF0952 
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

On Tue, Oct 13, 2026 at 05:04:21PM -0500, Bjorn Helgaas wrote:
> The PCIe outbound window base on Northstar depends on the PCIe Gen2 core
> revision. Revision 0x01 uses 0x08000000, 0x40000000 and 0x48000000 for
[...]

Thanks for combining them.

Signed-off-by: Semih Baskan <strst.gs@gmail.com>
Tested-by: Semih Baskan <strst.gs@gmail.com>

Tested on an Asus RT-N18U (BCM47081, PCIe core rev 0x01) with both
patches on OpenWrt's 6.18.55, which carries 767012397976 as a backport,
driver built in. bcma0:7 enumerates the BCM4360 with the same window,
BARs and IRQ as OpenWrt's current image (an earlier version of this
patch), and bcma0:8/9 print the two expected warnings (DT 0x20000000
and 0x28000000 against EROM 0x40000000 and 0x48000000). I did not
build it as a module.

For the commit log, here is a version that describes the bcma and
platform side, in case it helps:

    PCI: iproc: Use the EROM outbound window on BCMA

    The PCIe outbound window base on Northstar depends on the PCIe Gen2
    core revision. Revision 0x01 uses 0x08000000, 0x40000000 and
    0x48000000 for controllers 0 to 2, revision 0x07 (NS-B0) uses
    0x08000000, 0x20000000 and 0x28000000. Broadcom's own driver branches
    on the core revision for this reason. The enumeration ROM reports the
    base for the revision present, and bcma provides it as addr_s[0].

    Commit 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers
    fully"), in v7.1, gave the controllers in bcm-ns.dtsi a ranges
    property with the revision 0x07 values. bcm-ns.dtsi is shared by
    every Northstar SoC. The DT ranges cause two problems for this
    driver:

      1) devm_pci_alloc_host_bridge() parses and requests the DT ranges,
         then the driver adds the EROM window and requests the list a
         second time, so every controller fails to probe with -EBUSY.

      2) The DT window itself is only correct on revision 0x07. On
         revision 0x01, controllers 1 and 2 get an address the hardware
         does not decode, and the first MMIO access to a BAR takes an
         imprecise external abort.

    The window comes from the EROM and the interrupt from bcma. Allocate
    the bridge with pci_alloc_host_bridge() and free it through a devm
    action, so the PCI core no longer parses and requests the DT ranges,
    and request only the EROM window. The driver still reads the DT
    ranges for one check: if the DT describes a memory window that
    differs from the EROM one, it prints a warning, so a wrong dts shows
    up instead of being ignored. The driver works whether or not the DT
    describes a window.

    The same commit also added compatible = "brcm,iproc-pcie", so these
    nodes now match pcie-iproc-platform. With CONFIG_PCIE_IPROC_PLATFORM
    enabled, the default on ARCH_BCM_IPROC, that driver binds them first.
    It takes the DT window as it is, so that path needs a separate fix
    either way. This patch fixes configurations with PCIE_IPROC_PLATFORM
    disabled, such as OpenWrt's.

    Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")
    Cc: stable@vger.kernel.org

