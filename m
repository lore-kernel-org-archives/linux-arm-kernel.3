Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26974C55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikyK81vNhw9fQ/WymsHi/zfFdK4H+pRaLUJBwYpjqYw=; b=QmxaINNElnG39gcvd3bgKbU2uh
	M7l4F6t5+PcvEqwus71xB4bBh4eKpMFnQeykMP+K5auutXFZbR1yt04hSEW7JCyGhlGi/48HNRs26
	NI1IAexXvjyYeaUEYu488EphO+3LsuO4PoeiylL1WLdAYIKrSXDpOqRyLRzGzYzyoeSD9BOS1J8gp
	hxSriP4TOKvG1Uopc9seK/SKcSqY2cUIN/ZhDHA5uy+E1tCSQZIigfXE9HDEU5h4yKpMa9PNvjV+g
	KhTPuSQ6W3W9K2Z2TPvnGwOubazdVqnt88Warylnxig3+QkBj1i6/zT6NLmyyW8ZGG4uo0p7AfjiG
	Ur56Yo2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDMw-00000001hIz-38Sd;
	Tue, 04 Aug 2026 11:31:38 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDMu-00000001hHu-0RDS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:31:37 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cee9b74ee1so35048145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 04:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785843094; cv=none;
        d=google.com; s=arc-20260327;
        b=YWPwPnA3ElfYFSDtUlXtMw1mEJooYwePA/2E26HW4Pchs7vEy10Z6LnDiq5ZVuuCsW
         wowQ0AzT6r8qO3Mlvc8BcLCCJH+FfNe6Uqrb4zG3ipl1siZJ2WGkI4ezrj52GP5Agrzk
         mZISYUl+vqzPK59pY3Yung3mfF1peTYXx6Z6oAOPQ9IYJ0/6abxAaU4OSLh92SLXK53k
         kPnToTtB3Vd/znx7zx+C3tUSzm1wqMdsZsfzRS+sU/Ds9vLePxgPTVSEJFcu22IUpcSZ
         /aLEKbjbfurnS2wWciDJjvjr68Db9wuoKs+mnvWiaYk0YQkxHRObUaa4EZfcuCZLhDpQ
         h01w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ikyK81vNhw9fQ/WymsHi/zfFdK4H+pRaLUJBwYpjqYw=;
        fh=MRBxeOIuvNrnEfeMNcLarU/6GpcLIYp/Tdu2Kh9enpQ=;
        b=inxYHsDIWitlzsAoW5242QB30DiCxlyam/rE57dTr3Y46wfGhi6zz5s5VWTWIrK+J/
         kzznyI50W3v7Hp4+IG693/2RsU5NQ0caDbY2NxGIPo94CDiDhX0wq30kHlNKeUzJspOH
         DZ6C1R1GULXkdCwXkVYdtZ5sYZdbwuNLSxPdFmlWTuwJo9gLv7mLefuDHPg8lUkiKnJn
         B3QGQkjYB2Wt3pogiCpTJMy3degksg5//IN8sySPzCrB/M15LOm8Xv+1J4KZcbA8P/qT
         KWbt4mekkLlHRiJ6pYVnPPGj0Ort5fW6bNoEDmzQ+xTpaVGnWx9hEh/S5DBLLNrQK8nM
         RaYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nearthlab.com; s=google; t=1785843094; x=1786447894; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikyK81vNhw9fQ/WymsHi/zfFdK4H+pRaLUJBwYpjqYw=;
        b=CxjG/LX52adD0VMjRxFTnHueGzYbdxAIJUxJI1q2H9/e7g77UIJvesfYmqp310KzCv
         elyKoWtCgnJXoSbK19sb1fUMfj+yvVGKsbnejzbbBF4Y8Bl//G+DVhXLHDMokU1b/TNk
         sTOSRnuVsvlrKLj4Ro3N8zhKXxWKQ7CzbOOEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785843094; x=1786447894;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ikyK81vNhw9fQ/WymsHi/zfFdK4H+pRaLUJBwYpjqYw=;
        b=tFQ5CQxvSoqs6rrHwR8KUVWi8ubVhRFmx4dJ2CMdG3tNQ1lY8lH/iA7q5T/g61mJ9t
         TOhL6dA7khwU9JLhxXG7rHxRHm7CnDrpytjPx9Q1pCTb5ZxDzcnRuun95D6ePW0dPvsd
         FXZJ3I4zUW6+hWQvBO8MRnFfbviUvlxvjRZF51L/1CAFpecDEg/aNTBdX2NvL9l4qQB9
         f0YRiZeYFKIffxVNyOtjf/5DbNAEnuhiZ4hD9NjkX7nM3fJHM1UWVr/VNW0qI+epxZ12
         Suw9fezUFOnNRm7OZ1NbxyH4CgbVaZk8PVC/TJVABMbs2EWN+NWb+6eRz2QHvR/IGWeJ
         dmtQ==
X-Forwarded-Encrypted: i=1; AHgh+RrR+Cug2mqCZSoh14TwaePbYi6HGWds9HugQX4uN/4640fMNrBosHxuXj9wbBOZRWsAlc7KjlJWmxjllBYs3n4R@lists.infradead.org
X-Gm-Message-State: AOJu0YzRQcL272sj9EOW/WPzKA4FohpS4jjoPdBJnNbxq4aoXWROudrw
	E3TU0L+M6wADvHMFtEsmNBqTMk2NrXiJ0zz+Ua1MsMkutE864CAA9bWsHRjSfjahW0EdREWhSos
	x2Fk/yedL+fFOlLHJpDPgGcPybSlowqFu4jj0BATImQ==
X-Gm-Gg: AR+sD13Rt0c5E/s4d8dkZc4mo3WRVKQxpyhtOY5ZWA+HQrLaZRLXQyFYxhIB6d1YMiA
	xdfdGhGivDgWAfzVXwOuBti2/uQOql0M+6DWtJF+H33jEHq4H5ij8umxh2PsX/NeNLKXRQQOY2B
	hf8Fn+Gjt3Ns3r/TEnSVS6lIGSBRcyxiqcdQ60A0PFVvgJq9JOcsqqeCW78uU+hUAguPx0T6wrT
	PWJpakM4+tkizVDK2fFFVOtXMVCY6KlcYF3Mq1QMJVGkpdkgNPtEwOI8Cqv9Tsard7rdj8c5l+e
	LIFIXYxu/mnqBj3xfvVCyft8OKUDRkFrhZcSUP7X/FWx1w==
X-Received: by 2002:a17:903:37c3:b0:2c9:97a8:afe8 with SMTP id
 d9443c01a7336-2d052705a26mr142576805ad.43.1785843094543; Tue, 04 Aug 2026
 04:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260730072215.2090974-1-sangwoo.han@nearthlab.com> <20260803222210.GA1804081@bhelgaas>
In-Reply-To: <20260803222210.GA1804081@bhelgaas>
From: =?UTF-8?B?SGFuIC8g7ZWc7IOB7JqwU2FuZ3dvbw==?= <sangwoo.han@nearthlab.com>
Date: Tue, 4 Aug 2026 20:31:23 +0900
X-Gm-Features: AUfX_mzEuP4Tb22Xa_OIMjVltEgUFeTXgGyru4eORL1jW4C_uHyVBMxCJPDb8r0
Message-ID: <CAFg7d9YX3dXYHFvhXX6VBR_Wd5QzAD77Rgugso5sYD-SwANnLQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: brcmstb: Reserve only the MSI vectors that are
 handed out
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: jim2101024@gmail.com, florian.fainelli@broadcom.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com, 
	bcm-kernel-feedback-list@broadcom.com, robh@kernel.org, 
	linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_043136_154157_03C64CDF 
X-CRM114-Status: GOOD (  23.55  )
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

> Several other PCI controller drivers have similar code.

I agree - eleven of them look like they can have the same problem.

> I think we should fix them all at once (or explain why they don't need
> similar fixes).  Might be worth a little helper so they all work the
> same way (e.g., some use order_base_2(), others use get_count_order(),
> which seems like a pointless difference).

I am working on a related fix for drivers/irqchip/irq-bcm2712-mip.c,
which I can test here.  I would rather not send changes to drivers I
cannot test, though, so I am leaving the eleven to whoever has the boards.
What I looked at is in the appendix, in case it is useful to them.

Two things seem more useful from where I am sitting.

 - The failure is silent.  Appendix A describes the symptom, so that
   anyone who hits it later can find this thread.

 - The contract is not written down.  It changed in 4615fbc3788d, where
   irq_domain_free_irqs_hierarchy() started freeing one vector at a time.

order_base_2() and get_count_order() give the same answer for any
nr_irqs >= 1, so consolidating those two is just cleanup.  Where a shared
helper should live I am not sure either.

Thanks,
Sangwoo


Appendix A - the symptom
========================

A PCIe device whose driver is unbound and rebound a few times, or whose
module is reloaded, ends up with fewer MSI vectors than it asked for.  It
does not recover until reboot.

Two things have to be true for it to happen: the device uses multi-MSI,
and the vector count it asks for is not a power of two.  Devices that ask
for a power of two are unaffected, and so is anything on MSI-X.

I have only seen the reduced-vector case.  A driver that insists on the
full count would fail to probe instead, but I have not seen that happen.


Appendix B - how I sorted the drivers
=====================================

I went through drivers/pci/controller/ while working out what my own fix
had to do, so this is that rather than a full audit.  Twenty of the
drivers own an MSI hwirq pool.  I asked three things about each:

 - does .alloc reserve a rounded-up block, or a single slot
 - does the core hand .free one vector at a time
 - can nr_irqs > 1 reach the driver at all

Eleven answer yes to all three:

  dwc/pcie-designware-host.c   pci-aardvark.c        pcie-apple.c
  pcie-aspeed.c                pcie-iproc-msi.c      pcie-mediatek-gen3.c
  pcie-rcar-host.c             pcie-rzg3s-host.c     pcie-xilinx-dma-pl.c
  pcie-xilinx-nwl.c            pci-hyperv.c

The other nine:

 - five reserve a single slot, so nothing rounds up:
   mobiveil/pcie-mobiveil-host.c, pci-xgene-msi.c, pcie-altera-msi.c,
   pcie-mediatek.c, plda/pcie-plda-host.c

 - vmd.c keeps a per-vector refcount instead of a bitmap

 - pci-tegra.c and pcie-xilinx.c reserve a rounded-up block, but neither
   lists MSI_FLAG_MULTI_PCI_MSI in msi_parent_ops.supported_flags

 - pcie-brcmstb.c is the one you applied

