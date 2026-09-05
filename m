Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A04C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 11:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gifpKp+5IUGA4WQodiCfcIPD/2OT99dXfSnF8EVtxEs=; b=XfgyFXK9X7H4Knm82XhGeOfzhN
	6DK0dZgolxRjKsnEDwKlBI4CCI3NYc05AZ6SEskHfxS+ghfOB7Idk0nrZVZTmoNLW+5wq2tKfECf+
	lQgCnII759HaCdRcCEYuq/poiVIbN2sMcWH7E7oV7l0LHSg+RqX4Bh8gFwQjMtEt1bu7wKFlVSXeZ
	tNclOaEsaEa5sWhIzEl3X3S9U35LpF3rRJcaazTHEFtMGZDLOiiGmANaDjEM9vxam7o+xQFzmfCzJ
	//CRoOulOPGHUaWiiU9j/LcE1qWAnDIZmz7tZIJk0nKu6POeDgnry+6SjyZ4a1v6lIyrehwbH+HWm
	p0q7O2dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2oly-000000041zU-0iOb;
	Sat, 05 Sep 2026 11:41:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2olx-000000041zK-2ljO;
	Sat, 05 Sep 2026 11:41:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EC9060209;
	Sat,  5 Sep 2026 11:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFF51F00A3D;
	Sat,  5 Sep 2026 11:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788608483;
	bh=gifpKp+5IUGA4WQodiCfcIPD/2OT99dXfSnF8EVtxEs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SP9btzWReG/xJYvsSXWsDIu1nOJVPRa3uwEDuoAxydkW8CMPwLdmwTBMWJTIVEiki
	 lLptHyBO9lBdRVmXHCu2yz/ycY1PGpJyvh1iyv+GgAtajrPZGY+G5taeqTj+wvtog6
	 r36Ecu/sRvqiOyhSYWJ39M+i81Ke2+07gMZPUCLmOKfsIB+NT/si45b2A2rWo0/Ltn
	 jKvDNqg3hoxZgvJbTkMYSRooma8H5PFu2LD2pQH9vskfq8qR7ffN7lObU+Hm8SR69K
	 7d9eEBRkBhGdmvn2XXHA0TtDtRpYyvuNThreJ9ixlXtx91pzkxrqOo9HERGIbmtzCl
	 0oBuHK3prhxug==
From: Miguel Ojeda <ojeda@kernel.org>
To: gregkh@linuxfoundation.org
Cc: achill@achill.org,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	conor@kernel.org,
	f.fainelli@gmail.com,
	hargar@microsoft.com,
	jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	lkft-triage@lists.linaro.org,
	patches@kernelci.org,
	patches@lists.linux.dev,
	pavel@nabladev.com,
	rwarsow@gmx.de,
	shuah@kernel.org,
	sr@sladewatkins.com,
	stable@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	torvalds@linux-foundation.org,
	Miguel Ojeda <ojeda@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	linux-mm@kvack.org,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org
Subject: Re: [PATCH 6.18 000/552] 6.18.50-rc1 review
Date: Sat,  5 Sep 2026 13:41:11 +0200
Message-ID: <20260905114111.124795-1-ojeda@kernel.org>
In-Reply-To: <20260904045747.813364717@linuxfoundation.org>
References: <20260904045747.813364717@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Fri, 04 Sep 2026 06:52:37 +0200 Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.18.50 release.
> There are 552 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sun, 06 Sep 2026 04:56:59 +0000.
> Anything received after that time might be too late.

Boot-tested under QEMU for Rust x86_64, arm64 and riscv64; built-tested
for loongarch64 and arm32:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

I see the same arm32 build issue:

    mm/page_vma_mapped.c:110:11: error: call to undeclared function 'huge_ptep_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      110 |                 ptent = huge_ptep_get(pvmw->vma->vm_mm, pvmw->address,
          |                         ^

In addition, in UML (x86_64) there is also nearby:

    mm/page_vma_mapped.c:110:9: error: assigning to 'pte_t' from incompatible type 'int'
      110 |                 ptent = huge_ptep_get(pvmw->vma->vm_mm, pvmw->address,
          |                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      111 |                                       pvmw->pte);
          |                                       ~~~~~~~~~~

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: Liam R. Howlett <liam@infradead.org>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>
Cc: Jann Horn <jannh@google.com>
Cc: Lance Yang <lance.yang@linux.dev>
Cc: linux-mm@kvack.org

Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org

Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-um@lists.infradead.org

Thanks!

Cheers,
Miguel

