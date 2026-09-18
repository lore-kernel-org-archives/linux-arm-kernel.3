Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CC2C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48Dk3iwNBX2jdzyXIh2OB09+BWpkuBMXHAxnmCdSn4s=; b=BS+MZP1v4garO5fnL7/EKfjF/4
	LTL1lKN4Xya2kaGor8VV35y5h9QjDqWlAta3do6tazhXONQGeB4FdMpa7bd9ylBE0eTDGT/WeriYP
	j9CJib5+3XmyYgecEFbJdS7og2vk3u4QKoT4jru5OiOKmPtsLG4cv8Uk8u8LzQHRe+ObV6fuki9ze
	da2TQEdjDUnTzD4SZaVh4EzEaZ22A/rAVwHxF22aX1ZyArrxNdkNVipyySxJxPKvQXcJ+LgFfVtgt
	gNO6JF0GjOkkGrssxkfKmbNNSYGBywdUU4a5/E+NXC3auX4yqL4tUvcISXeooZzLDLa032SXV5aT8
	B3OXhvRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tyx-0000000DojD-2JrD;
	Fri, 18 Sep 2026 08:30:07 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tyv-0000000Doij-1kOP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:30:06 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-85469b35611so311624b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 01:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789720204; cv=none;
        d=google.com; s=arc-20260327;
        b=h0UD5ayyw/FO1EOkV8R26Ds89D58po9+Vi9Uqi210NZoGMUOiN3hSIgClUg7A2JgUr
         UhmiKsW/5JRiIKbqsfbZdGRoxgaGxILK2Sph9lrWdkx/b1ZyXMuLb+8ejQLXesZ3437y
         TGdD23S1My9KDt0r7/bHqLNf4Jqxs9O0Mg0Q1zDu167gMhSs2M7rYPvqkcB7GMFcl254
         Bepug/QJ4FB4L8snwgt+tHttBfD6A/l2EHseTZzlgrj0sfCrhb/ms6HvUqKFUU4/u0iv
         mn5a5Bj27QXtrEV7+JWI2F7ePVQNNhpbq2L85JwQUpAfE5823RiX2qJE76/RxMAu7KA/
         9TCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=48Dk3iwNBX2jdzyXIh2OB09+BWpkuBMXHAxnmCdSn4s=;
        fh=7VfapR26ZS9hGCsP4r7FepSwpCtUjmAKOllQbISZAj4=;
        b=EJqTbx0Iga4ODOUya3QvvgfU1VmcfnnBFK+eTg0Bs/A6rlvW14NwtgDTR5haw/PwdI
         ULuImlAl8j6Cy7qSypfYZQxZv6rj+PSMqGQZWQPWNj+pOzBbtI2XhBq/Wg0WNsIM9nkZ
         K+P0n2Z3wl2b2WSGE8ConLpV/qaabsCJI/CwRnQgmgCjJX2Le5gYy37BM5/+3rfm09/4
         Ioy0yJXO2i/LFXzeKmmeEaUQdUUcGnep3JbLgcEBN+vVaPZOS9PaKUraTnHZJX32Oqts
         vuAxGlXQWeEXXulbPoPqsMdl/ycaQ8gW6Tf2iidbfCvzY6FW08b781V8Kpaf7kTgSKy4
         lTVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789720204; x=1790325004; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=48Dk3iwNBX2jdzyXIh2OB09+BWpkuBMXHAxnmCdSn4s=;
        b=DkcBIBKR9pb3D0USjUpPSrXALpgjEHDZv4IIjjj9erHZUOCAUAAWptqTbrZgyNGyvx
         zg/JMEp2Et2QBLTELtp8wfctq4gAxDAewlb7dLO9Bumj9pJTptNCRx48HavRs6TQNdCj
         vrAO2aJdFgqwgU+QXIRNTMYqTYni2Fgms9tMs0jHhs8waRIhddUmvld0GwOMGUw6p0Qd
         WD+J0FT0vF/2x/xpb+0c1yUDSOfKkeaEGixz4wQN//z2AGdxrQTYrOkqRoFGeeyCVfM+
         hOJ5ZetTm0oXRonbCmxXfeyTCqx6N2QFC4+MmS9sQ/X0/b9BPFa4HnRobh90LYFp/8Y9
         /Igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720204; x=1790325004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48Dk3iwNBX2jdzyXIh2OB09+BWpkuBMXHAxnmCdSn4s=;
        b=UVQDcgznKjP1D7x+NSOzrEj/hfZQDnTESi5dlN1L7HAcIhmJFX20g7nZRG2HW8q47+
         g6CmmGuzlHjAZiOKDYiVcdSTC8FBWbofyK7Sstzfw0bnLseoj5n6VSkH4dPy12mkjgLW
         qJ3/I9iSMcjQOiRRadz0954JO5cDp1Vb6oByqHCLboLf+AimEZkCC6a2G7OkyQUcAd0x
         p2NJCOjF3Sdf03vh8u2+Ryn6WbjElDFsE+WZH2yx6B2qRw4bsHdvwXr3bXoMPiToi+Hw
         4XDbGigBg2K0n1xKj9dSwZTyThsM0ueIrzOwf33hWPJZg4u3KO/wXjaxvw+5eNpUFXkc
         FEbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMX83QWZ9ZElMfDx9hwTEBW/SerU6vvhJdKC0QopQNydhOZYM48L+Gv9c1ZFU35uPIzCPNQvv/XWLFyZ88IYDT@lists.infradead.org
X-Gm-Message-State: AFuF++lFTMXJwnqta40LN9r/3mu/50fC6VmDiSLoMwW9eGGA8EHo01vW
	pIKSPL7co0ifMIPsH0GRf33GPQyDROwhU0FcdCI5pKfp+R0TyBuo2BBJpx3vDm2gR6hBup8w3BA
	r0/ZxKe3qK0L7lbNPlYx4/Hn9oAIcBw8=
X-Gm-Gg: AYBFou17d94xR6jSbLeGyLMrdsc78aCrV6y3d4ZysjdJ5iNzK0w9wFzgRPvGhmZsqF7
	yuv1Km/drM83b52A8jOxNKkeAD504Rl4UOHxh3ojDvUcBTUMY8OKGLRyVrMk05kbsLkrYBlETjh
	yMFRAlu8SJ+J7MjIkwr+yHXj4xcINWlpq93hu7i5QXuPJhs9ectTQ++cqhhkdJo30/z0DBxBuFa
	mTjEXbGRTXQbiZlxZL7XRABzPZD7rOaeCVFug7JV5yxgf2g+javSSVLtdfarTwczvAzNN5NGf7V
	2Bm0cWL0FSlO44oduFyaCHlnzFeNcTAllwuQ+uwzPUD70HiOuG5xKVNY1aYWaTmOXzWVDpEXnZv
	pI4ShkR++HR/jtpWoUskUuUtmyIiQc3+dTUM=
X-Received: by 2002:a05:6a00:1f06:b0:857:73e2:9108 with SMTP id
 d2e1a72fcca58-874ddbffd9bmr3487891b3a.24.1789720204444; Fri, 18 Sep 2026
 01:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260917183602.GA1036092@bhelgaas> <7c2a8582-280e-471a-b4b0-037b2cda6ad8@app.fastmail.com>
In-Reply-To: <7c2a8582-280e-471a-b4b0-037b2cda6ad8@app.fastmail.com>
From: Semih Baskan <strst.gs@gmail.com>
Date: Fri, 18 Sep 2026 11:29:53 +0300
X-Gm-Features: AcwNN1Vmx2igfjBEkpa8Vuj31sAw9NZLYiN87fYoRwyCYEORDw-WFA-KB1pOT20
Message-ID: <CAAsRjRnV-RTddO6h2XCUz2N5pB0pS8i_-_2XRcD=WOTA7AAFZQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, bhelgaas@google.com, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rosen Penev <rosenp@gmail.com>, rani.hod@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_013005_463436_A2675271 
X-CRM114-Status: GOOD (  19.62  )
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

On Thu, Sep 17, 2026 at 10:27:54PM +0200, Arnd Bergmann wrote:
> Would it be help to change the probe order so the bcma driver
> always comes before the platform driver?

Only where the DT window matches the EROM one, because that is where
the platform driver backs out.

In the tree as it is, the platform driver binds first.
bcma_bus_register() populates the axi node's children before it
registers the cores (drivers/bcma/main.c), and with both drivers built
in the two PCIe drivers are already registered by then (both are
device_initcall and drivers/pci links before drivers/bcma), so the pcie
platform devices are bound as soon as they are created. The order of the
two objects in drivers/pci/controller/Makefile does not change that.

I tried both orders on an RT-N18U (BCM47081, revision 0x01) with both
drivers built in, on an OpenWrt 6.18 kernel with pcie-iproc-bcma.c as
in this patch and no wifi driver built.

With the platform driver first, the board did not come up, on two
flashes. The same tree built with only the BCMA driver boots it.

With of_platform_default_populate() moved after
bcma_register_devices() as a test, it boots. pcie-iproc-bcma takes the
first controller and enumerates the BCM4360 as before. The platform
driver then probes the same node and fails in
devm_pci_alloc_host_bridge(), which it reports as -ENOMEM:

  iproc-pcie 18012000.pcie: resource collision: [mem
0x08000000-0x0fffffff] conflicts with PCIe MEM space [mem
0x08000000-0x0fffffff]

On the second and third controllers the DT window is
0x20000000/0x28000000 and the EROM one 0x40000000/0x48000000, so the
platform driver's request goes through and its probe carries on with
the DT window until the link check, which fails because nothing is
connected to those two on this board. That is as far as this board can
show.

On the first controller the DT window and the EROM one are the same,
so the window plays no part in the no-boot. With PCIE_IPROC_BCMA not
set at all the board did not come up either. Clearing
has_apb_err_disable for IPROC_PCIE_PAXB, one line, makes that
platform-only kernel boot and enumerate the BCM4360; nothing else
differs between the two builds. The flag makes the driver read and
write APB_ERR_EN (0xf40) around every config access to bus 1 and
above (538928fd6ce8). In the bcma-first build the platform driver
never reached bus 1. The PAXB_BCMA register table has no such
register, and 404349c5c806 ("PCI: iproc: Add BCMA type") describes
the BCMA-based NS as a legacy PAXB with some registers missing. On
Rafa=C5=82's BCM47094 (revision 0x07) the platform driver as shipped
enumerates both BCM4366s. I could not see what the access to 0xf40
does on revision 0x01, only that the board comes up without it.

Best regards,
Semih

