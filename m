Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1779C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=paag/QjyR3hsRmZHOMJCvt+dxx6Lz4I74syddlVYri0=; b=ztyAzIU6AcsHK0INnTcigbU1cN
	DOtGDzF8YUsk/q9DvFFrE8J3AT6ExSBuAqezBPNXJF+Ehlk3ahU43OTazPj3TMFQJqIuUEkFJmoCS
	O7xMLuMRSHQW6hKTdUhP7XgcuuK9mgBuZU5B4GJeyRb04O9n8yjlcAapw+L24zoJ0P3etn0O16n/I
	oHM7OZ5KF7IAZJjlsDcoTEFgRNK3qibnZ6zdU8Kze3x+ZwZ3L1se59txQg2xLOEQhrHHG3G2vGnSh
	GbL/jDkQemluLkh6RFuQ3Ufahd+/2YemxfavO91ff9neJrR+uo6I1FNhXalwJaIV0kDvVVmSyJi/G
	2GJtkE4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpsKp-0000000DPn6-1dVd;
	Fri, 31 Jul 2026 18:51:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpsKo-0000000DPmT-0x7e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:51:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E02DF434B8;
	Fri, 31 Jul 2026 18:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852E11F00ADB;
	Fri, 31 Jul 2026 18:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785523913;
	bh=paag/QjyR3hsRmZHOMJCvt+dxx6Lz4I74syddlVYri0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ARAiGENxUVrM3FYXcjF2r9D99JtexGHlaMv6rcL7TffzIlPutZBi31fah6jH4iVuR
	 NUsbgxXjI6iP8BjwE0Dxa08BCEUygvrgWZM4ifNgp0haUdmKKm5ie6GOFLlFKxMl60
	 HFGHITZcRkWqffJvTqajT332OTf3TR68FZpiYh+eyUaY2YdIU9mRwwilcY7Czq+Cve
	 SCzXVlGkrYXsQqNULkYQIEg54PYryeK4c3Jq0X/JLnRugA5Hm06ASBwky45mv9RTsa
	 8Jf/Kprr+q2WMZZuzM/XS32GR8k1X+tdfZfTeWU/I6n7JXE+JEqrwLdsizCpqQWY7E
	 C7UZ9/cNUaLYg==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Dev Jain <dev.jain@arm.com>,
	Bradley Morgan <include@grrlz.net>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/7] KVM: arm64: pKVM stage-2 mapping and memcache fixes
Date: Fri, 31 Jul 2026 11:51:46 -0700
Message-ID: <178552142342.30097.13872328812800945380.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717130317.1953574-1-fuad.tabba@linux.dev>
References: <20260717130317.1953574-1-fuad.tabba@linux.dev>
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

On Fri, 17 Jul 2026 14:03:10 +0100, Fuad Tabba wrote:
> Changes since v4 [1]:
>   - Restored the permission-fault and dirty-logging memcache top-ups
>     that v4 dropped. Both fix real bugs.
>   - Patch 1 uses the anonymous bitfield encoding rather than the
>     open-coded mask and helpers. (Marc)
>   - Reshaped the permission-fault top-up to stage the full memcache
>     under pKVM, not just the mapping object. The object-only form still
>     returned -ENOMEM and tripped a WARN under the hypervisor's
>     unconditional min-pages check.
>   - Re-scoped the dirty-logging top-up to its generic, non-pKVM failure
>     mode, now that the permission-fault patch covers pKVM.
>   - Added three adjacent fixes found while going through the series, and
>     a selftest for the block transitions.
>   - Patches 1 and 3 keep Bradley's Signed-off-by from v3; my changes
>     to each are noted in a [tabba: ...] line.
> 
> [...]

Applied to next, thanks!

[1/7] KVM: arm64: Skip cache maintenance for non-cacheable pKVM mappings
      https://git.kernel.org/kvmarm/kvmarm/c/fff4eb33ffa0
[2/7] KVM: arm64: Top up the memcache for pKVM permission faults
      https://git.kernel.org/kvmarm/kvmarm/c/6bf0215c565e
[3/7] KVM: arm64: Top up stage-2 memcache for dirty logging faults
      https://git.kernel.org/kvmarm/kvmarm/c/56fd1fc526e6
[4/7] KVM: arm64: Skip pKVM stage-2 flush when FWB is enabled
      https://git.kernel.org/kvmarm/kvmarm/c/1feb9f6af895
[5/7] KVM: arm64: Don't WARN on pKVM stage-2 map failures
      https://git.kernel.org/kvmarm/kvmarm/c/c24322270169
[6/7] KVM: arm64: Don't advertise eager page splitting under pKVM
      https://git.kernel.org/kvmarm/kvmarm/c/c6f308b4d341
[7/7] KVM: arm64: selftests: Add stage-2 block transition test
      https://git.kernel.org/kvmarm/kvmarm/c/979ae12a2d09

--
Best,
Oliver

