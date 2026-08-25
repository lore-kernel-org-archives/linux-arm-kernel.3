Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B30FC61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 16:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ciR/u9tm8v91mV1qIMjYjeAr+PlO8ixQr317hkKdwYg=; b=2/gmVE3E7O5yaftxC2oXJ3OYJV
	79KFX2voIKFZC8Hayy8YKRV4MmDcq/rpwmPEmcCaMBYgI0CQo2OY+lB5MI48SzF37ZbPia5WgEz1o
	nJ07ac5TOKOORlMx+FIY7+mxv46xKy2XXQFVu/rSL3VM0oE+AfhrIdU1VI9l0X4d/ZxuuQDpP0D5g
	ceD/z9n3RRL4GQEkzvB3mabpQdef3qaE+AQMAuvPmY5l8ccYSpkycpU1hYeco243CyYjeg25slHDf
	0FzjB8atu6+S8SkGD1rNXsbIL06YPCEKrlMYx5abIT4u012ROv+oxDwS4clXX8cwl0aULU5e+vXa/
	RyIuu+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuEM-000000018Ai-04en;
	Tue, 25 Aug 2026 16:42:35 +0000
Received: from out-129.mta1.migadu.com ([2001:41d0:203:375::81] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuEI-0000000189A-23JN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 16:42:32 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=m4Ir8Cavv78G8+hX1oUwWO13M0HehJctD/4dIgHdMAc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787676145; v=1; x=1788280945;
 b=oXzYqLhFaBc18cwa1SLhpAo7QhuxWELEZC2ZEVZO2nElJqnUdjqzLQuyODS4k7u9JXOHXxzW
 xe1/jv68a0SprmKRoGo9YY969KeeziGKL9TmHR89D5qO9vMQP0Wzww75wlY7ADlDs03c9Yml4uw
 Wr79I1WdT5mnEJ8L6loVAV9A=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.local (2a01:4b00:ad36:1d00:3a05:25ff:fe33:35a9)
	by smtp.migadu.com with ESMTPS id 78016a66fb8f874d;
	Tue, 25 Aug 2026 16:42:25 +0000
X-Mizu-Trace-ID: 78016a66fb8f874d
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v4 0/2] arm64: Clamp ID overrides and gate the GMID_EL1 read
Date: Tue, 25 Aug 2026 17:42:17 +0100
Message-Id: <20260825164219.3347229-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_094231_230607_F474C696 
X-CRM114-Status: GOOD (  11.46  )
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

Hi folks,

Changes since v3 [1]:
  - Gate on __read_sysreg_by_encoding() and drop the helper's argument,
    so the command-line override is not open-coded in the header.
    (Catalin)
  - Pick up Suzuki's override clamp as patch 1, rather than adding a
    raw-presence check to the gate. (Will)

Patch 2 fixes a GMID_EL1 read that traps to EL2 when the kernel has
disabled MTE, panicking the host under pKVM on a CPU that is offlined
and brought back online. It gates the read on
__read_sysreg_by_encoding().

That needs patch 1, Suzuki's override clamp [2]. Without it
__read_sysreg_by_encoding() applies the command-line override raw, so
id_aa64pfr1.mte=2 on a CPU without FEAT_MTE2 makes the gate true and the
kernel reads a GMID_EL1 that is not there. On the boot CPU that read
comes before init_cpu_ftr_reg() strips the unsafe override, so the gate
cannot rely on it.

Tested on QEMU under pKVM. With -machine virt,mte=on, offlining and
onlining CPU1 with arm64.nomte panics an unpatched v7.2 in
__cpuinfo_store_cpu() and does not with the series. Without tag memory,
where QEMU implements no GMID_EL1, id_aa64pfr1.mte=2 covers the
force-up case.

Based on Linux 7.2 (8d3ae59288f1e).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260824184155.2644646-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/afc5bd00-28ca-413b-b047-ee53589c285d@arm.com/

Fuad Tabba (1):
  arm64: Don't read GMID_EL1 when MTE is disabled

Suzuki K Poulose (1):
  arm64: Apply overrides to CPU local capabilities

 arch/arm64/include/asm/cpufeature.h |  9 ++++++
 arch/arm64/kernel/cpufeature.c      | 48 +++++++++++++++++++++--------
 arch/arm64/kernel/cpuinfo.c         |  2 +-
 3 files changed, 46 insertions(+), 13 deletions(-)

-- 
2.39.5


