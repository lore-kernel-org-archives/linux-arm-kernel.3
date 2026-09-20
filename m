Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC3FC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 03:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5EtVq5GXV3tD4/mNUjVB1pKsFudEkGkDnXlc2r6jLzY=; b=RQLpBNPJ9Mqe2C
	1cUjLGRV2dTM/batKvl1y/7HVv7XMCdHq8Sbhr4cR0UfXWzQr1tDg9D85IcvkaidjoEbIMHhLI4aw
	O+114G3+LZEJV0J3X6d5lStlt2vx6tMPU8Tg0+Fq0ucqYul7+pRhaMQQdSIzlboVRLgnTOVsMfOQO
	+nxMos8bysU/51rlpCPH5UODVW73FnhPYTTugXcrv+0czw2x9iqFmEU2zeIcKXyE73Tjt+AISpODj
	Y8qcKuYYzqMu464f/AllSSDJth3Nik/xzYmsrKO7zdsCAkINN6cNZh9Vl94GufAqg1m5NevKpSxbU
	vCqwxIniz3oehtp4SaUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x884m-0000000Gn97-21wp;
	Sun, 20 Sep 2026 03:18:48 +0000
Received: from out-40.mta0.migadu.com ([2001:41d0:1004:224b::28] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x884h-0000000Gn4E-1Qyz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 03:18:44 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=vM1h2IEpNOC/A2qB1FfARCsAhtN479Y/HyUIKeMHG6k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789874321; v=1; x=1790479121;
 b=F2fraA1dx3qaY6HRbIqmJ4G1RvfyG6ryi8CTEXfgBkchZH3fq0V9Erqpw0wS4fMvqvQlMzXI
 OV3H3wDoSb9Dx6Ifyw7KwxWV24rmiW2mzLCj7vdIu0RWlpucu/IOM+hkzXG8a3Yh54jIOj74xex
 NuX9xPLh9ld0GjA008T+FXX8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id c54495dbf87a1f9f;
	Sun, 20 Sep 2026 03:18:30 +0000
X-Mizu-Trace-ID: c54495dbf87a1f9f
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Subject: [PATCH RFC 0/3] riscv: Add explicit die-level CPU topology
Date: Sun, 20 Sep 2026 11:18:01 +0800
Message-Id: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCQAwAv1JyNhCXUlivgg/wKj3YNFsj0i1JL
 Urp3131OAMzK7iYisOhWsFkUdc8FtjvKuDbdRwEtS8MgUJDkWo0dV6wV8E5T/mRhzdaYmSimBq
 pO4kBSjyZJH39xhc4n47Q/qU/u7vw/F3Ctn0AhUKEwn8AAAA=
X-Change-ID: 20260904-riscv-die-topology-rfc-c009f6e4be92
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2811;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=vM1h2IEpNOC/A2qB1FfARCsAhtN479Y/HyUIKeMHG6k=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnrA2rf16yXPsr1c5Owe8Qb/aCSDWZXO6SW2x+4pVufb
 7Xnmn1YRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwESc6hgZns1KTuyX82luTG9y
 rZmhKLy76sHKM+/ye/yOy6lEyCotYPhfIv6nuyivTWH6a/ftzUdSQo+YN+/dsvbLtNn2Ki+THSo
 5AA==
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_201843_556771_B2AD8F6B 
X-CRM114-Status: GOOD (  10.26  )
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

The generic arch_topology model has no die level. Systems with multiple
dies in one package must flatten their clusters or report each die as a
separate package, losing the die or package boundary.

This RFC adds a die ID and sibling mask to arch_topology, parses optional
dieN nodes in DT cpu-map, and exposes die topology through sysfs on RISC-V.
Clusters can be numbered independently within each die.

The RISC-V sysfs behavior is:

  - An explicit dieN node supplies a non-negative die ID within its package
    and a die sibling mask. RISC-V exposes die_id, die_cpus, and
    die_cpus_list.
  - A DT without dieN keeps die_id at -1 and creates no die sysfs files.
    Package and cluster parsing is unchanged.
  - ACPI die discovery is not implemented. The ACPI and fallback paths
    also leave die_id at -1 and create no die sysfs files.

The DT parser is shared by arm64 and RISC-V, so both record dieN nodes
internally. Only RISC-V exposes the die sysfs files in this series. If you
think I should enable this for arm64 as well, please let me know.

The sysfs visibility hook defaults to visible on other architectures,
including powerpc configurations that report die_id as -1. Their existing
sysfs behavior is unchanged.

The dieN hierarchy is a proposed extension to the DT cpu-map binding.
This RFC does not include a schema update. I'd like feedback on the
topology model and sysfs interface before sending the binding update.

Does placing dieN between socket and cluster make sense? I'd also
appreciate feedback on keeping unspecified dies at -1 and on the sysfs
visibility hook.

Tested with W=1 builds of the affected objects for RISC-V, arm64, and ARM,
and with a complete RISC-V Image build. On a 32-CPU QEMU virt guest, a DT
describing one package with two dies, four clusters per die, and four
cores per cluster exposed the expected IDs and masks and updated them
across CPU offline/online. The same guest with a legacy DT exposed no die
sysfs files while retaining package and cluster topology.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
Troy Mitchell (3):
      arch_topology: Add a die level to CPU topology
      arch_topology: Parse die nodes in /cpu-map
      riscv: topology: Expose explicit CPU die topology

 arch/riscv/include/asm/topology.h |  4 +++
 drivers/base/arch_topology.c      | 68 +++++++++++++++++++++++++++++++--------
 drivers/base/topology.c           | 28 +++++++++++++++-
 include/linux/arch_topology.h     |  2 ++
 include/linux/topology.h          |  3 ++
 5 files changed, 91 insertions(+), 14 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260904-riscv-die-topology-rfc-c009f6e4be92

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>


