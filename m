Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3477CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnx5Tp560S/h00zHw7AF+ZWXuzVRsTvpYdbuKDqUzGM=; b=IK6+924MCe0uD4WnHnIyFPf1F+
	qCc9BXyaG0RHj3Af+W3mFdMNN0+9CAFqXaQ5TyHPHsgvD2cWpF1QiZYJLX6rR5aYieCPZOYotHl0a
	JzpZDoFPmgrtJhuI32EAkG8qefGCpdhbbY2aau99hHgt+ySnclAGp0AN7jPNfFHi/gV25/X9Sj4Li
	AXIw76oewpsO9Z+/uEh7+dSSq0OxkRHV2BDOOgifVuwxiQ2R44xxkr2BlOc2ZOIqygf2IvbGZsrjj
	mXo1po+RtldBx450gd01eLlBFB9T0IZeC6Agqwy/1utHdU3tjYTZuOXbExm5ygrwt1Jg8fi3640qj
	XPHHvJRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwbA-00000005fvu-4Byi;
	Tue, 09 Jun 2026 13:34:33 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwb6-00000005fup-1fQU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:34:31 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-46019b190b6so4157412f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 06:34:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781012066; cv=none;
        d=google.com; s=arc-20240605;
        b=gLE280+CIzCsa+9ENyagOfS7wOHlHZH5ZsIIUfWktvnYpOqAUpe/h5UH/tw4Gm3cjS
         PaJq9IJEZw5cl5z+VgqK5MsbFwMbVudoEMWfUv6AvgLcrqDKr6RbnF5fnqWIooBJGkA3
         RBbR3B+PPYSe8GruM59E4H5cF5J+7+LrN+h4z/BOxIfHY7hGW/zPFO3DfX0M2lxIw76q
         Ial+ZI7A4RXOsQVQlRFWBivqfyFTYlTxm/VM4EGF7PzA3pnR7uNAgWXF2ysIVhOJXGAl
         vOISrZrCeM+eKf6o2AKby2a8tVT2U2yd697awn4LGWyjLf+1jlYeryZpLmHDM5siy/ld
         Qv2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dnx5Tp560S/h00zHw7AF+ZWXuzVRsTvpYdbuKDqUzGM=;
        fh=mHscCnFM/tKhShSGJyhgby0Wsmbm7CpsZ1VpnH6SdO8=;
        b=TJkoPzXZh2selzPj8kGuJ7q9F6G6bgLzNyktzCQuURNHV9PqdnUBxJJ6c1Tz5wTCvd
         7eDcJYOTrppL2uPKbb77EsTNcaLLHVG3byT4dEtMJ8M9WPpN1PT/HdnA6FogaEiKlxts
         1ijmuwCDIbOfmq8p7ZynahR4vx5gaDRpg/VN4/kTOvc/O9Vg6qgoyqBEbJBZwA/4xw3d
         UkM4aUsk9oolpI4TShinQ5PojuUak6Fxy+e0RB9hTSWhWydyVc6F5EyBU93u9Ly9KOft
         cItH99QHtpQLZ5VfjsZXEBYIqTT95M+eK0xXJWFh7+neOVswCc6TzgpxcLmqPpc9Lq/Z
         8Vtw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1781012066; x=1781616866; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dnx5Tp560S/h00zHw7AF+ZWXuzVRsTvpYdbuKDqUzGM=;
        b=USr9C621iTsM6aJJyufEr9yhE0ReZ0YF5H5sJFr70qcSlgJm5KUGIrTfguj6ajxTsV
         51jYx4SmNkXfB8M1IrKjfeZzSmUM+z5YSs0uH8OXwgBFmP29FjGIxeEIKohFHCXE0P4a
         qDuYCiq4J0yjWKNFZzM7uCyPMtwB/aGuGDqaLbT5Y9bAPVDe2Dl77qxs3dvAixbojhjG
         kav5iit0U22jT327r5zeHtpjdVQai4bzzntNWH8FAYhwf1lk4ODEIupmaoCCMqF/31vd
         LNw+9JfidGipJBuRhprsYPfzAlsOEMijBZqc7MXo3b4djVhrWhPfxlrx6WgvRIE7LrEI
         51Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012066; x=1781616866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnx5Tp560S/h00zHw7AF+ZWXuzVRsTvpYdbuKDqUzGM=;
        b=MXb6izr9UAl/ghPjgI2w4XNi5gMXhYaQW5EmoW+PuK1GXW0/bvmS1R7M5dZMrN7g4O
         GI88o80D4b+8dj1+q0dAD/kuhElKrMzwb9l8dr4vBGqB+CRo/ZA7rqQHoXw7sJgQAhNz
         cOCdEzm+bfPLyGyl7gs9grEik85fr47KPYCFTVGKAVAgyPiybtQAEMCt7Rnjgss+1xyc
         2EA79kgJZyHKEPO9wj8Rn5XzbELVyIKVomIuF16Ohhi435LQFmPbrnhlOZ9vab0DX6Uk
         f9pKq40ZPz/uCuORnqmnc6E0zizG7r2719ykEL7SUWX2ThLAeSxQZrxjnhGCX0vmAMOP
         b8Zw==
X-Forwarded-Encrypted: i=1; AFNElJ9Ifr5a0mYhnmEIrXB/hP5fXra8isqK/B0MrRIyZwXI3nv2ygCobCsMf2A/CF8Rc7N8SMxP/7shBZZmOoS0ojG7@lists.infradead.org
X-Gm-Message-State: AOJu0YymydnGH9kBKWWXUVotelj/BXR7vcvP62Yh4I//AZ3t2lsyKsMW
	5xywv+hZRoQCA5xKC/nekYXb4+VqCbTi4Ulhp0nUBOp8gqOzO1haBIyBTxTriV69jOr0fnys5q1
	TGY2cx3OVU37LeztbYN+Y0T5njZ9P+tFKlxvkKL9ycg==
X-Gm-Gg: Acq92OGwT4FEztciRoSzjpq+Q5xAjocq4nMJ0l585BL60JJneCvrDdyXnAhEc7U5Rm3
	/ZwiFCP77KAu5gu0epOKmeinLbPnJm3OUCTf8cwPhBNo0iSIIALqI+QI2xsVa/yloPcwaRPZChY
	/riSsmh/mxlG2uM0jmIi6/nhTuYU9iiiWl2g2mC9iqGu1i+w1ecAOXF473rizKnSQGiKf+acGZl
	n4pOBlWO5o4ARldOjejRLGvq4MuXOmbWLSpGZHa3jsjWZiic5nSdZbcxuPAoO93J7esz5mj84Yi
	NOucApD+4WjyDOu/MjnSSdZspxPAR4aJZmPrX5hTMzuyJ/7luGEwEHRT+JCLi7FY0EhF0r7y3SK
	eyXDaUEim8A8u0A==
X-Received: by 2002:a5d:4d4c:0:b0:43d:50c:6f33 with SMTP id
 ffacd0b85a97d-4603060b001mr23218990f8f.26.1781012066371; Tue, 09 Jun 2026
 06:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780409151.git.gregoire.layet@9elements.com>
 <cover.1780929570.git.gregoire.layet@9elements.com> <63654bb5-c246-41c4-bb7e-5bfa23e59f2e@lunn.ch>
In-Reply-To: <63654bb5-c246-41c4-bb7e-5bfa23e59f2e@lunn.ch>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 9 Jun 2026 15:34:15 +0200
X-Gm-Features: AVVi8Cea43-8TO0qQAyqeIGR0QvD_re8rhGrQhZ5B93W67dWApUxz4ngQN1Zqg0
Message-ID: <CAFi2wKYOAotiezepDqaR5PZDqDaPKKDfAEnpx5EHC0mL39hy6w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] soc: aspeed: Add BMC and host driver for PCIe BMC device
To: Andrew Lunn <andrew@lunn.ch>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, jacky_chou@aspeedtech.com, 
	yh_chung@aspeedtech.com, ninad@linux.ibm.com, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_063428_848976_AC300F1E 
X-CRM114-Status: GOOD (  18.27  )
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

> From the replies i got the host can access anything on the LPC bus of the
> aspeed.

The PCI-to-LPC bridge only decodes some addresses.
In fact, only the following are accessible over PCIe :
- LPC Channel 4, which only supports the KCS protocol
- The 2 VUARTs
- SuperIO-style Mailbox

Regarding the KCS interface over the LPC channel 4,
the BMC driver in this series does not set this up.
It just needs to be activated in the DTS.
Then the host can just start the ipmi_si driver with the correct address.
This is the intended usage for IPMI management and is part of the normal
trust model of a BMC-managed system.

Here is a summary dump of the PCI BAR1 from the host.
The BAR0 is only used to expose a BMC DRAM region for shared memory access.
This v2 removed the memory mapping so BAR0 is not exposed to userspace.
The BAR1 is used for the PCI-to-LPC bridge.

Offset          Size        Contents
--------        --------    ------------------------------------
0x0000-0x00B7   184 B       Blank (0xFF)
0x00B8-0x00BF   8 B         SuperIO Index/Data port, mailbox config only
0x00C0-0x0E87   3528 B      Blank (some no decode 0xFF and some reading 0x00)
0x0E88-0x0E8F   8 B         LPC KCS4
0x0E90-0x0FDF   336 B       Blank (0xFF)
0x0FE0-0x0FFF   32 B        VUART1
0x1000-0x2FFFF  188 KiB     Blank (some no decode 0xFF and some reading 0x00)
0x30000-0x3FFFF 64 KiB      Inert region: 256 times repeating reset-default
                            values, not affected by mailbox activation,
                            not accessed by this driver
                            The datasheet doesn't explain what this is.

So, the host does not have arbitrary LPC bus access,
it can only access a small subset of it.
The relevant peripherals must be explicitly enabled the PCI bridge
to be activated on the BMC to be accessed over PCIe.

Only the specific interfaces listed above are exposed,
and each one must be enabled by the BMC.

The security implications are limited.
The host side attack surface is bounded by what the BMC chooses to expose.

> TPMs are often there, but does a BMC have a TPM?
The AST2600 chip doesn't have a TPM.
The Asus IPMI card doesn't have a TPM module either.
If a similar PCIe add-in IPMI card has a TPM module,
it will be accessible to the BMC via the LPC bus.

But this will not be bridged to BAR1 by default
as only the above-listed interfaces are exposed.

However, the host could access the TPM with some specific BMC side
configuration of the PCIe BMC Device (PBMC).
That would be a deliberate BMC side firmware decision or bug.
This driver doesn't expose a BMC TPM.

