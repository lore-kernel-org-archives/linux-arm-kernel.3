Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C0CC982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hsnJ4j4rBIXKKH9ChIwWElTHO5VrNa39QD6tMI8Gqk=; b=qc4pa+X+MdgDURnkTcQNM1tGec
	rp+uc8jpM/QXHKypVyf53KL3IQ8MQj8YSW5N2jZekpw7ZSJYDZ2x82COwEdfcEBE2PlK8LoKwQfVu
	8zprQZr2kWiMINJXm1qKnTmPb2hq4yDS5IYqnku+ZrcYoFvXC6yXRViPCPXVCog4m55VUwIW5pha5
	4Ss7CewfaTLYXB1eqEBm752sHAbDS4kXQ3ZteJAAboxcCqhEJb+fv0kg6Fzx8VAwOfCMvKXltR4JL
	yu0jD6wM94cNY5B97QOabJmKhVlmei0wZ0ZSUJCRrWO0sP61W3lJ6sFwK/1WoJM9xuNGn+WCZixoM
	nZWFLGmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wOE-00000004owo-0dUr;
	Tue, 22 Sep 2026 09:02:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wOC-00000004owJ-3HH9;
	Tue, 22 Sep 2026 09:02:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C7A660200;
	Tue, 22 Sep 2026 09:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E505F1F000FF;
	Tue, 22 Sep 2026 09:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067731;
	bh=+hsnJ4j4rBIXKKH9ChIwWElTHO5VrNa39QD6tMI8Gqk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ho1NxTfYbdGdeqfpz5XyJWNcpb+7YT6deUPOb7e/Es4jmHjJWSyriPfAAGuVspsae
	 6LKxXVdN1I2udTK271j3pFm2GMHS0XZV8KVHkUGVtsYFv5r2COfiRTH2Y6ht/kxwzI
	 5S7K5mqn5YCKOuNg/yGFFk0fqstHlUc6g6O3EF7XYzAKKBM6Nc/Wql66LhlQ47+4db
	 cKexdcycBQ4ogjwH9iqe0dPw02bHXTGuz5lPnWXYIFrVHZPotADEAFLZn7OCXa8iEW
	 al36CmxULEHPX1q79eXSdQseKONK2FXJbwliGmrP2a2xZ+pxm9/S+EEg+twlKbQ1yZ
	 0wPGdhtnaVu7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 9/9] crash_core: skip MEMBLOCK_NODUMP regions when
 building vmcore ELF header
To: baoquan.he@linux.dev, m.szyprowski@samsung.com, "Wandun Chen" <chenwandun1@gmail.com>, rppt@kernel.org, robh@kernel.org
Cc: devicetree@vger.kernel.org, linux-mm@kvack.org, chenhuacai@kernel.org, palmer@dabbelt.com, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, conor+dt@kernel.org, kernel@xen0n.name, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, will@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org, iommu@lists.linux.dev, tglx@kernel.org, pasha.tatashin@soleen.com, dave.hansen@linux.intel.com, x86@kernel.org, pjw@kernel.org, bp@alien8.de, mark.rutland@arm.com, ruirui.yang@linux.dev, catalin.marinas@arm.com, hpa@zytor.com, alex@ghiti.fr, pratyush@kernel.org, robin.murphy@arm.com, mingo@redhat.com, kexec@lists.infradead.org, linux-riscv@lists.infradead.org
In-Reply-To: <20260922084256.1515554-10-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
 <20260922084256.1515554-10-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:02:09 +0000
Message-Id: <20260922090209.E505F1F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> From: Wandun Chen <chenwandun@lixiang.com>
>=20
> Reserve regions (for GPU, DSP, ...) carry no data useful for crash
> analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
> reduce vmcore size and capture time. crash_should_skip_region() now also
> returns true for MEMBLOCK_NODUMP.
>=20
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922084256.1515=
554-1-chenwandun1@gmail.com?part=3D9


