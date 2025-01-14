Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD6DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iZWF2p7DdTt4UZs/drcsgp85LST9ju/nBZkrLmrFzQ=; b=oLShItbIOc3+0r7+Z3O7Z1VwWD
	CRAS66WP93j1vjYMjWC1GQk74wRa01gC6GI0cl6iOiQz33Udc8WCoOMEfEj81Kt8TeaL0dernSKDF
	wDkB/J/iYiKnC6O952n+CbbsyAoqMnT2wyanV33MCgATN9KFR0K6kTSM36l5R1N16U2aoX/4dNAC2
	SGii8cHX6rWkSd5l5d1pe9LDgKR106ae+axaLNTgojEfhl/L5bOq22D95UDysr4NIFLeFnS2ry/Y3
	VGseHRXHgywIJaxGCrUa7+A8vEK6vyIfwI3cflzXaJK5K1RhGqmSkoO8TudvZDKGQ8IQzOk1QP3wp
	GYwOMH/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnv0-00000009k4m-0iII;
	Tue, 14 Jan 2025 20:53:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnk4-00000009hwS-3gCt;
	Tue, 14 Jan 2025 20:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0iZWF2p7DdTt4UZs/drcsgp85LST9ju/nBZkrLmrFzQ=; b=NjiBbYvkyw/nJCFj+EzAmE5bu5
	Ea6lMlpGRNnja7T+QpkdkUtR2jxTEJh+Xlz+LKXzFiWKYbj07O3w7HS+nnHNhR1rJeb+qB43VT5to
	S+WI2t2M8MQ8+JShcGsgKBNu770rYkHY+nuab7Ws1lfTApBhra1eHgpK9PpRSSWe3QLGRVK7vD8xb
	frT93mZGiTBsbcXmf6NyGwdL51+GICCeXl9aUepKZ1DzoxTRn4rnZpR7CQ7BCEbv6xc9u6eR5yY6L
	BS/zciC25x/an2Gz2W9UFvuwQscJjnRNrhFnr7UzfSKXSHMnrmmA7ipZdOnUSICo2rSmlO6JtTicT
	F1goAI/w==;
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnjz-0000000AcYc-3bGP;
	Tue, 14 Jan 2025 20:42:26 +0000
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E302325400D3;
	Tue, 14 Jan 2025 15:42:21 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 14 Jan 2025 15:42:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1736887341; x=1736973741; bh=0iZWF2p7Dd
	Tt4UZs/drcsgp85LST9ju/nBZkrLmrFzQ=; b=QZ6xuLkN5pAT1+cm6wn4ZjfgK3
	UcJKqYc//8mwUoEKYybP4yc3M0ybRXdRyzfZE9EdygfzSlmC9XERU531YCz/jtVR
	bJnjScooSlL+FEnTpuyc4AqUISgDLwxfF3fkMhSM8e6Df4hwNPg4YFx2lcjrhoMA
	MHwgG0gGf5BQWFQ/PqdjoUb+ZlEbYZ2j1x4HV392HkT6xG764FjdBfULRFPHcUjA
	jV+x0iXjY8LCQxBxM7dGeC1qRu1/+hMZVKYqw9EAgDMHIp7+Rl1XzfldAQlymh6S
	FhrnjzSyZ/tD0l5CV9x/euilBRAU3BzJJLiyWOS1lRodC162G6pgo41ipGbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736887341; x=
	1736973741; bh=0iZWF2p7DdTt4UZs/drcsgp85LST9ju/nBZkrLmrFzQ=; b=a
	8OTIr7E7G+oQlzNO5rrrZuEG1cg66538u+UhaLh3M7zG3axbN3rD8j4UvpLnY09C
	H/sHWpt1f1PeucUUU5zFLMf8PZsY2liCwXjWGjHyhzxXkhf10w6ui6sqp/Fk8tWf
	y6WgNfif6rXUZDJHBhbU1/g0W0ztcrf3ulcTQTRB0fHjy5drfGK0YOPhiag23YrR
	ewR9kBZE0NAZNu2zTWgl/gIuXNxnNv6ydm6G5bajT0C/Dj3xUQv/3NLpvVoyjU6D
	6YOeMsFgq6RsTkacxLS06QQSJNBdFMjIXcFCIK7PdSqOItXG+3c28G482i5eC0eq
	drroWxZqPJzHfvsyyJ0HQ==
X-ME-Sender: <xms:LcyGZ4dSpGBhUsLcU27nD2aA8I5uT1GPkMjXRxmtefl4An69AzXfgA>
    <xme:LcyGZ6OJhjb-vZrhUWy-1msAjflrXrfA5IHzxIW97IahUV6XdOXor1hFsGO0cehjT
    y6rjsqCFBT_b5Sxank>
X-ME-Received: <xmr:LcyGZ5hklUqMjovwqjSeo1U37rCpSnh_fR3QBoZjW2uLqHfIIQfRA_iEukS_-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredt
    jeenucfhrhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthh
    hushdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeegfeekfeelteeufeekleeukeegffef
    keetveffffethfevheevjeektdelueegteenucffohhmrghinhepghhithhhuhgsrdgtoh
    hmpdhrvgguhhgrthdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehufihusegtohgvlhgrtggrnhhthhhushdrnhgrmhgvpdhnsggprh
    gtphhtthhopeefhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghusghi
    thiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepuhifuhestg
    hovghlrggtrghnthhhuhhsrdhnrghmvgdprhgtphhtthhopehjohhnrghthhgrnhhhsehn
    vhhiughirgdrtghomhdprhgtphhtthhopehflhhorhhirghnrdhfrghinhgvlhhlihessg
    hrohgruggtohhmrdgtohhmpdhrtghpthhtohephhgvihhnrhhitghhrdhstghhuhgthhgr
    rhguthestggrnhhonhhitggrlhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmih
    guvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepthhrvgguihhnghesnhhvihguihgrrdgtoh
    hmpdhrtghpthhtoheprghnuhhpsegsrhgrihhnfhgruhhlthdrohhrgh
X-ME-Proxy: <xmx:LcyGZ9_Q_8qzTjPMhOKcejGlvHlTIMC_6qZgGAFnYV5yO6xLViwfjA>
    <xmx:LcyGZ0sNbHCXXfpj1x7cHlCIRnVvwqXFemfY6wlpXQ3qrV9vxePNug>
    <xmx:LcyGZ0Gn_b0OU2q5vplJKUr_nOD0e2oWDI-E7zGNfUCObukIi2ficQ>
    <xmx:LcyGZzMuzskXX7cDrhQPOc_JIWq1xnJNh0krIgzGLMIdtQJRUrUOdQ>
    <xmx:LcyGZziLCuWeY3Ks6N51TPcevuBObLJX5fbtXXFZpc7HWnumn7K7qoWY>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 15:42:20 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
Date: Wed, 15 Jan 2025 04:41:23 +0800
Subject: [PATCH v4 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-fix-riscv-rt_group_sched-v4-4-607606fe73a5@coelacanthus.name>
References: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
In-Reply-To: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
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
 linux-tegra@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>, 
 Thierry Reding <treding@nvidia.com>, Celeste Liu <uwu@coelacanthus.name>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3034; i=uwu@coelacanthus.name;
 h=from:subject:message-id; bh=FD1/1Qa4M60bWS/VL5WGmaGZ5+Z9xkiSLJsG1Uy3KWw=;
 b=owJ4nJvAy8zAJeafov85RWVtBeNptSSG9LYzXHLFi27K+J2ZHz412+f0Dang54s+PZiXrRvfZ
 Mzq7eFZld5RysIgxsUgK6bIklfC8pPz0tnuvR3bu2DmsDKBDGHg4hSAiZwKYPgftqP47j7Xd8HJ
 nxstvriK7bd9n/3oW4KK9qknWza/vBH1hOF/NJsix3WlLcsedN04JFMQH3F0/rRIpYj0J/MeWk4
 6tv8qCwAph01E
X-Developer-Key: i=uwu@coelacanthus.name; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_204224_440788_0613FC69 
X-CRM114-Status: UNSURE (   9.61  )
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

Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
with systemd") said it's because of recommendation from systemd. But
systemd changed their recommendation later.[1]

For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
needs an RT budget assigned, otherwise the processes in it will not be able to
get RT at all. The problem with RT group scheduling is that it requires the
budget assigned but there's no way we could assign a default budget, since the
values to assign are both upper and lower time limits, are absolute, and need to
be sum up to < 1 for each individal cgroup. That means we cannot really come up
with values that would work by default in the general case.[2]

For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
can only be enabled when all RT processes are in the root cgroup. But it will
lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.

Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
support it.

[1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1be321c31d5299f69f
[2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700

Tested-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Kevin Hilman <khilman@baylibre.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
---
 arch/arm/configs/bcm2835_defconfig   | 1 -
 arch/arm/configs/omap2plus_defconfig | 1 -
 arch/arm/configs/tegra_defconfig     | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index b5f0bd8dd536990a0726e73a6855d25c1286a768..27dc3bf6b124c2012b7a1a768f2f900f49903cd1 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -7,7 +7,6 @@ CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=18
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
 CONFIG_CGROUP_DEVICE=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 3a166c2f02bd80634fee3bd8c4579fdbad84ccfa..9cb265c8d4144ea9a41f02640dbc8a06b710323b 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -13,7 +13,6 @@ CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
 CONFIG_CGROUP_DEVICE=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index d2a094ad360cefefbc3bd35226c5d23eadce42c1..3a9bda2bf422b14085c60b39a2c3df86fe0994bb 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -6,7 +6,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_DEBUG=y

-- 
2.48.0


