Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4AECF58C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 19:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjmFxQLJqRfhpu5QepR4gD8c5Av7B2fY/fpjXUkiBNo=; b=leg/h82BMiTqF539DnehydlsdX
	mfsh7kliytvHgAO61hCeW67eiSpimCCiu32WO6OLCSfouRdE4TfK/yTvwgVnASBW7LR3wEG4D6W/h
	4UsKDHD6Po5ZDRffOyKIDBaBG6+NBIahglnuJA+J5YKvihXnia9MBN+ysdPF4DLuGcHr2PqOVVOrX
	tXQ7eVbvmLNYU3R8JpR5X8KvTIe4f5snn0fIj+aS9Njnaf3UnsX7y/Cfh5nFw5rCPY1R5kCoYblqB
	6WA/LYn48mM2btUYfkBYPkVipkS6EIYHbq3YvFLcASMqWgizfDSwX+nKvSlQjYu5EATBeAlXDoB12
	gNWFZ+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLneB-00000004w8J-2iqv;
	Wed, 19 Nov 2025 19:15:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLneA-00000004w8C-3dSF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 19:15:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA3E060017;
	Wed, 19 Nov 2025 19:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A919C4CEF5;
	Wed, 19 Nov 2025 19:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763579687;
	bh=HxX0mOWR8tN7HqLIH0w3UEAqiyuJDZdK+LJi5L9t7go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M/Da9KHixPetG/m4oWhtpw/fhh8e/EjAap/WA+euvMaptL9owX6EpJYCY76bAdmCB
	 P7HM4t6xl/goE+D5bpcM0IEUAPcupxrkSIYQJP90HK6Dxb6OWWvH7q7soeRi+B+Xd2
	 9D3y4d70SJS/wVk150zETqekVmcOlZg4UjN1UeHDXEoKThCfFSsNDwGWO8qqUNWiU6
	 tz0EOuIEj2BUuPiILOl5OWsn0RQ+VDyWAsoZt61HgMtIGCV8SdqqV+G+/dC4hjH9kN
	 YasRJ48fHtz2ibtLBS2j0xh8+mhIyJYMHVXfSW0VoG563DkA85QUlaK/Lkx7XTBXQ2
	 AvvdMOpOyrkeQ==
From: Catalin Marinas <cmarinas@kernel.org>
To: ryan.roberts@arm.com,
	cl@gentwo.org,
	will@kernel.org,
	Yang Shi <yang@os.amperecomputing.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v2 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Date: Wed, 19 Nov 2025 19:12:51 +0000
Message-ID: <176357957114.2095636.13353317001365823131.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251023215210.501168-1-yang@os.amperecomputing.com>
References: <20251023215210.501168-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

From: Catalin Marinas <catalin.marinas@arm.com>

On Thu, 23 Oct 2025 14:52:10 -0700, Yang Shi wrote:
> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
> rodata=full"), the direct mapping may be split on some machines instead
> keeping static since boot. It makes more sense to show the direct mapping
> use in /proc/meminfo than before.
> This patch will make /proc/meminfo show the direct mapping use like the
> below (4K base page size):
> DirectMap4K:	   94792 kB
> DirectMap64K:	  134208 kB
> DirectMap2M:	 1173504 kB
> DirectMap32M:	 5636096 kB
> DirectMap1G:	529530880 kB
> 
> [...]

It matches Documentation/filesystems/proc.rst, so I'm fine to align
arm64 with it.

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: mm: show direct mapping use in /proc/meminfo
      https://git.kernel.org/arm64/c/1102778cb023

-- 
Catalin


