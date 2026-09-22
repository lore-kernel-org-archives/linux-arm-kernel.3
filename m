Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5E4C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHgvoHnJIwe3nC5S4OY8z28uWVR9gAOlu7YWol56jKc=; b=IoLZIjC5bFoy+1n26D3Z+fxw8Q
	bwbJJTdaljG3nzJxKo9oFFzvneiapWzBkd1Ses+n68UXwbxLARNKqRRKgEZEIuWrIj9ofO0d9Z872
	XN1zt+QNCvLn4rTz1ER6UVztpBAcLbJYI7kiRI41TCNYhrFUQn0mKMTYkEHiPkHfQmYy/GLNVZci1
	178VSnSByDCSd3jp1BE9kvgsv7aH7IPQ9az5QgZ1vt+FORfclMVb3+X0n4/KNnI4u8dut/qZ/sbe3
	/+Welv71y2OyPKfecowi9Ckn+YuGPeRTMxzlonYEMACCY4PY3ih7AiQHUUpd5/z/fXnXj5jBK0yQ5
	O2EzEkYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wP7-00000004pLw-41QL;
	Tue, 22 Sep 2026 09:03:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wP6-00000004pKz-1Mmj;
	Tue, 22 Sep 2026 09:03:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 16E0440C4A;
	Tue, 22 Sep 2026 09:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542831F000FF;
	Tue, 22 Sep 2026 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067788;
	bh=pHgvoHnJIwe3nC5S4OY8z28uWVR9gAOlu7YWol56jKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l+JOE4ryLKIP3w9q5Wm7pSG1JLgmDJMTih9bWxagWnLP0XhQLvugLdVxdO/i7BZ1b
	 uvX39GjRiLtbNCtIwl6kbzM07pHvNRM7sLWrfKdwu5cRDBDhhUW14JQEPxQgJCJcpo
	 zteqI1bXRF1+ErMo/W206HGKtuTl5xYGFoYzr8R+VyzOeETVbKARobUvCKiqV/1H5G
	 ZG2bS7BFom8VmX+m2cO+RlPZM8u/HRlPHtdDSKYxDCuUCo7GUN/ZasJtPMbhOvS5BW
	 mJMwC/BAeODqKEf4NJtp6Oe/JkjP/uh/PV3O0rpjhB5shaJzPxmBPBVxFXQ+Q6GbJt
	 r1KqQABQ7lA/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/9] crash_core: serialize crash header preparation
 against hotplug
To: m.szyprowski@samsung.com, "Wandun Chen" <chenwandun1@gmail.com>, baoquan.he@linux.dev, robh@kernel.org, rppt@kernel.org
Cc: devicetree@vger.kernel.org, ruirui.yang@linux.dev, linux-arm-kernel@lists.infradead.org, alex@ghiti.fr, pjw@kernel.org, tglx@kernel.org, aou@eecs.berkeley.edu, bp@alien8.de, hpa@zytor.com, akpm@linux-foundation.org, mingo@redhat.com, linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, saravanak@kernel.org, x86@kernel.org, will@kernel.org, kexec@lists.infradead.org, linux-riscv@lists.infradead.org, linux-mm@kvack.org, chenhuacai@kernel.org, iommu@lists.linux.dev, mark.rutland@arm.com, loongarch@lists.linux.dev, robin.murphy@arm.com, kernel@xen0n.name, pratyush@kernel.org, catalin.marinas@arm.com, palmer@dabbelt.com, conor+dt@kernel.org, pasha.tatashin@soleen.com
In-Reply-To: <20260922084256.1515554-4-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
 <20260922084256.1515554-4-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:03:05 +0000
Message-Id: <20260922090306.542831F000FF@smtp.kernel.org>
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
> crash_prepare_headers() counts memory ranges before populating the
> allocated crash_mem array. The weak implementation used by ARM64,
> RISC-V and LoongArch walks memblock.memory, while x86 performs the same
> two-pass operation over system RAM resources. Concurrent memory hotplug
> can change range source between the two walks and make the populate
> pass overflow cmem->ranges.
>=20
> Take device_hotplug_lock when preparing crash headers during
> kexec_file_load(). The x86 memory hotplug path already takes
> device_hotplug_lock, so call __crash_prepare_headers() directly
> to avoid recursive locking.
>=20
> Sashiko reported this issue in [1].
>=20
> Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
> Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
> Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
> Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system =
call")
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922084256.1515=
554-1-chenwandun1@gmail.com?part=3D3


