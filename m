Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E143DC02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x6wdS63I7iHxelb/E+SvOq6HbYS9FkarZVemmOHTtbY=; b=Dx44rrDcjPe9UY
	LjIbiqy+GpDKJOxgCbrAoJ+V4oQExUaHM6jZEE58VNybRm3w7K2hHoXH1ejoi+Bpo+FMgkI2eWx1e
	pZcBEYklL1LgDXj4aTa7IgP8CoY0hTvSFN2gzrB3RqWZD4Nr3Sf/Dpuy5WF/wf4C9S24MSAmBe5aF
	0TOVOsiSfM6nagdCOzG22PvFHTgzeXWF7o2hVoiOykmtYW8pmrtsCHspkv98nPrTq6xKe+67M6E6Z
	ITZQt/ftFZDruC23EPUVU/H2H/Dgf9wFI9oqWGG24CNY7hhVJODu6rhPAHOTE9ZRfAGTV7iAqvR1z
	DP930XCCXV5WtaWfALLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnsW-00000009jK3-1cWK;
	Tue, 14 Jan 2025 20:51:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnji-00000009hq5-2W0I;
	Tue, 14 Jan 2025 20:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=x6wdS63I7iHxelb/E+SvOq6HbYS9FkarZVemmOHTtbY=; b=LNVroRuMPh4eukRsidVZKE/J+M
	sgHV1PoCrtYjj1gLCKVi5CPaIw8ySNoDrhRP6sC7/kLuTJlq6Aw4KVnSIYryFjRZSdnL2BI31qScT
	1IYWee05WZ4L3iN0mLxSrvgj987HSPOk2kZavVq8mIwXLqZcWHnq53P4wTyHpqSAHzVFIu+cO7p8l
	ZkK9xiqPwI2GhQQSPQRdJBNxK9KIHpq1WC5iwSBn0yJDXp3T2MWTlx27cbg1hNZ69fxQkhJ0Wbls8
	bXaKbZqT2ou9PdPjTFYSFJz1CmcmdnsNOoGvjBXDB0lioCXRXiTz6sTPJHccQIx7Ed83eUonuIK7p
	LVXOJvxw==;
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnje-0000000AcX0-3Dlb;
	Tue, 14 Jan 2025 20:42:05 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id EB5D911400D1;
	Tue, 14 Jan 2025 15:41:58 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 14 Jan 2025 15:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1736887318; x=1736973718; bh=x6wdS63I7iHxelb/E+SvOq6HbYS9Fkar
	ZVemmOHTtbY=; b=Teqv9AqnoHU2b/ZfHDmcu3QdSaoJxH8ugHPqnbyxIMBShcwv
	Lf2GEsXZukuS9aUclO3QhWHoKvIzbcij/syxWl/4aQI0ZhpNHWXobLO5hcW5ShK9
	rVBWetAzpiHUUjUJoJuYWIMiTL/WY3l7LkgmZiTge+glzhlm89d/ygR/afLsnG7u
	SZIkx818drjhQOczxXPZRNjaunM5awjv2mwbxXjwBZp1CKFSF19tv6oHQnPmFRnu
	g4kWaBM0wy4tq7jyIY29KeVOLG8JPH5Nbz99b10I8yYvmhF7D62o6orTByR1ScZS
	Tba54HlxHnD+bqVmKjgr+OYMELe8rlbc+aTwVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1736887318; x=1736973718; bh=x6wdS63I7iHxelb/E+SvOq6HbYS9
	FkarZVemmOHTtbY=; b=tf2j1Nh0libscBgGxLeSHwVa4wSGqR3zyUOhelkXgYpn
	AM/zuLgmrSrQKhQ38X5yQz6/NXCTaKSFf/BuclcebU4us1a42zc4VSJ10ag2JF7r
	WK4YtF36eJyQH04oHPWkB4LfhhKOAjcYkEcjEzH9JT1iOszYi/b0/NeJOzDMZQKN
	EID4mYT2SW0ku4m6Lh/BwUGrjjiVI/wVFG7HR0aFaFcI4yLF83nTFooAAR+NO5yQ
	Gb7cX4mos/IHAOxzB13/ODi2QQdtsI5Fu5vYj3I4Gm39OIlXFxeXg6meYqJji4gB
	jPLwrgkICd/ju68HrS4i3QsyNIbniILAm3X+178SXg==
X-ME-Sender: <xms:E8yGZ_j7IlxLrfXjd34wKzUYtithnOt_MYecT_MfeaIN8unmzo8mGw>
    <xme:E8yGZ8A03Elwj1quJsVtJYfR5hfs2eGd9spsr6mQ-ThDUbt6u4ha53OL_ia3e4A_Q
    EeXdfl2WFx4ISUa8zk>
X-ME-Received: <xmr:E8yGZ_FNh2JRLuE24yEj99RqS_R_D3jlCBAeIeuGiksqaYVTBoV7_lO4HBEwFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeen
    ucfhrhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthhhush
    drnhgrmhgvqeenucggtffrrghtthgvrhhnpeefffevkeegffejheejfeefudehffdvleef
    gfelkeehgffgueejffektefhgeefvdenucffohhmrghinheprhgvughhrghtrdgtohhmpd
    hgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepuhifuhestghovghlrggtrghnthhhuhhsrd
    hnrghmvgdpnhgspghrtghpthhtohepfeejpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtph
    htthhopehufihusegtohgvlhgrtggrnhhthhhushdrnhgrmhgvpdhrtghpthhtohepjhho
    nhgrthhhrghnhhesnhhvihguihgrrdgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfh
    grihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehhvghinhhrihgt
    hhdrshgthhhutghhrghrughtsegtrghnohhnihgtrghlrdgtohhmpdhrtghpthhtohepth
    honhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvhes
    lhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehtrhgvughinhhgse
    hnvhhiughirgdrtghomhdprhgtphhtthhopegrnhhuphessghrrghinhhfrghulhhtrdho
    rhhg
X-ME-Proxy: <xmx:FMyGZ8QhsqC4rulaQQ1Aa6jDtki7bsIRyEly7GnmFj6CQ-R_rWz4IA>
    <xmx:FMyGZ8w8IstiWH5mJUgk1U5Us_CS5tr7yDg3mKW6kv7Y9UACQv1G4g>
    <xmx:FMyGZy7HKbVf8qSEvl6NERCLJ3Bssdr-SNDbRcGHhdOJ3l3ZsGr1nQ>
    <xmx:FMyGZxy0wqD_ZKbT-P7jdqFXDV_l1yDJHtzdX6nsQ-qsxCyoCU4yvw>
    <xmx:FsyGZ2n2BgBlb2k_ztDznT66FATWySyZ7bhJ-RRz7vOyUskQ5qYN7RJL>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 15:41:54 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
Subject: [PATCH v4 0/4] defconfig: drop RT_GROUP_SCHED=y
Date: Wed, 15 Jan 2025 04:41:19 +0800
Message-Id: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO/LhmcC/33OTWrDMBAF4KsErTtBksc/6arQTe8QSlCksSWIr
 TByRELw3Suni2TTbgYezPt4d5GIAyXxvrkLphxSiFMJ+LYR1ptpIAiuZKGlRtnoFvpwBQ7JZuD
 5MHC8nA/JenLgNEmFR8LOGVHqZ6by+6D33yX3HEeYPZN5gnUllVI7bLc1lovQwWekk7Fmmv0lf
 dH1YxhNOG1tHFfThzRHvj3WZr3Kv06nq7+HZQ0SCN3RkMa+JfVirsNy9YR2Sv4DVQXCrqG2ptp
 Q416hZVl+ALc/HAZNAQAA
X-Change-ID: 20240627-fix-riscv-rt_group_sched-d2e014be48da
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Tony Lindgren <tony@atomide.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Celeste Liu <uwu@coelacanthus.name>, Xi Ruoyao <xry111@xry111.site>, 
 Stefan Wahren <wahrenst@gmx.net>, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2984; i=uwu@coelacanthus.name;
 h=from:subject:message-id; bh=cv3jA4lBt73juQxv0ekC6L4lkRU8HB1MI/gw7T+FRhc=;
 b=owJ4nJvAy8zAJeafov85RWVtBeNptSSG9LYzrF3Z/pe2qQhcyZn/MCV2WlTgnZb9bI6XGWaqv
 NWMu1li9KSjlIVBjItBVkyRJa+E5SfnpbPdezu2d8HMYWUCGcLAxSkAE2mMYPhnf5ezRCRmNU9M
 8yb9HuNZh25tn7bKI/6ll/Gjnh18LKWmjAwHNHVXXoyo5D/R+kHNU/Jo6GH+5VxvjMNnC54TvJi
 4v5EdAFPWRmA=
X-Developer-Key: i=uwu@coelacanthus.name; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_204203_431611_982DEC48 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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

For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
needs an RT budget assigned, otherwise the processes in it will not be able to
get RT at all. The problem with RT group scheduling is that it requires the
budget assigned but there's no way we could assign a default budget, since the
values to assign are both upper and lower time limits, are absolute, and need to
be sum up to < 1 for each individal cgroup. That means we cannot really come up
with values that would work by default in the general case.[1]

For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
can only be enabled when all RT processes are in the root cgroup. But it will
lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.

Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
support it.[2]

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[2]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

---
Changes in v4:
- Update Acked-by
- Link to v3: https://lore.kernel.org/r/20240910-fix-riscv-rt_group_sched-v3-0-486e75e5ae6d@gmail.com

Changes in v3:
- Remove Fixes: tag because of it's not suitable.
- Link to v2: https://lore.kernel.org/r/20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com

Changes in v2:
* Remove MIPS and PowerPC patch because of merged.
* Link to v1: https://lore.kernel.org/lkml/20240530111947.549474-8-CoelacanthusHex@gmail.com/T

Celeste Liu (6):
  riscv: defconfig: drop RT_GROUP_SCHED=y
  loongarch: defconfig: drop RT_GROUP_SCHED=y
  sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
  arm: defconfig: drop RT_GROUP_SCHED=y from bcm2855/tegra/omap2plus

 arch/arm/configs/bcm2835_defconfig         | 1 -
 arch/arm/configs/omap2plus_defconfig       | 1 -
 arch/arm/configs/tegra_defconfig           | 1 -
 arch/loongarch/configs/loongson3_defconfig | 1 -
 arch/riscv/configs/defconfig               | 1 -
 arch/sh/configs/sdk7786_defconfig          | 1 -
 arch/sh/configs/urquell_defconfig          | 1 -
 7 files changed, 7 deletions(-)

--
2.45.1

---
Celeste Liu (4):
      riscv: defconfig: drop RT_GROUP_SCHED=y
      loongarch: defconfig: drop RT_GROUP_SCHED=y
      sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
      arm: defconfig: drop RT_GROUP_SCHED=y from bcm2835/tegra/omap2plus

 arch/arm/configs/bcm2835_defconfig         | 1 -
 arch/arm/configs/omap2plus_defconfig       | 1 -
 arch/arm/configs/tegra_defconfig           | 1 -
 arch/loongarch/configs/loongson3_defconfig | 1 -
 arch/riscv/configs/defconfig               | 1 -
 arch/sh/configs/sdk7786_defconfig          | 1 -
 arch/sh/configs/urquell_defconfig          | 1 -
 7 files changed, 7 deletions(-)
---
base-commit: 0e287d31b62bb53ad81d5e59778384a40f8b6f56
change-id: 20240627-fix-riscv-rt_group_sched-d2e014be48da

Best regards,
-- 
Celeste Liu <uwu@coelacanthus.name>


