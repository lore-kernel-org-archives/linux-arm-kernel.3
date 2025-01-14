Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D81C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/AGE8pJh7GgNRDEtM0gaQGj3X0ZPhDFL8vEdG1DJNQ=; b=Pu9B3S/iv2Tnmsuc5KHk8N7b0Y
	8OwTdBt+09rc75EpWxjoN7cN8ybODLxdK7jkkY6k9zKkCS+fJTF7Pdj7Ck1Nshd2xt/5OjwJg57MF
	WL2ifZMTrqqjYrRnitP9LSntoITcMxr5KD9CYBY6Q8oaUx4XUT8+AHA0GzlkgVltTeANdkDIqV5iT
	7HMVLW1YMKDEr+kCOqHiIycBBMbKmRnBcKTOvbacqqOON7mojOCPVAstnwk/PUFTI/ueiu6cT/C9T
	NHqpjg79ISb9zx41goxsapwTdEGYwj9PqSi+aVnIa3wOszh91pSNBpBHVzGlvrD9++5Wu2NBpK0tR
	FfZfX4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnsZ-00000009jMb-00VV;
	Tue, 14 Jan 2025 20:51:15 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnju-00000009hu8-24gW;
	Tue, 14 Jan 2025 20:42:19 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id D7F9611400D1;
	Tue, 14 Jan 2025 15:42:16 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 14 Jan 2025 15:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1736887336; x=1736973736; bh=l/AGE8pJh7
	GgNRDEtM0gaQGj3X0ZPhDFL8vEdG1DJNQ=; b=L8UK+qNtsmAFZQ+3hTNYAXZIpB
	Qr13KJDajs03XLtUJ5I+ZEH0mOVmXZ3rsNRiNEWx+547dJ8K30+6aOuZYIoPAofL
	VXNFcJEUV/fPhXRue16Yqgb+VhoM8VJXH3JovgIFMPL0Mg6euHE6Pog9n8jt8Vtm
	DO1sLrPvlNBFeXEWZ5HnPzd/ZjjAtQBMRaOfBfS9lNLtG53P3uKB2ur4rXTOKn6X
	qrdjomrCEeY0zr9E5TB9wNEFjEW3CTWE2fUZWHXlj8SREE9Uhnt9JrJEdR/Yc8DQ
	1FXmCuryCrUZTv4NbBmVFP728Vht4AwZ6pcOfuJYckNrpFhpHy2Bz8sBXl+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736887336; x=
	1736973736; bh=l/AGE8pJh7GgNRDEtM0gaQGj3X0ZPhDFL8vEdG1DJNQ=; b=T
	j/+nmxTF/xg51kX7Zt5H8xXFAixMs0vIuoGDDzf0bNzFF6QfwPx+wyhEPb8qBqKk
	3YnAbrOPq6rK5uSYl7oCtB6bcPSvYdPf8L8ooOYw4PwkM8WkVhrdo2qElr1ieXIQ
	hrWUWrbBLyjeqyrqhf6zQVG703aUCfLIrR5yLC/rq7suim71bS5nuB+wLT3KL7En
	QnhgBBgDLBXugDc4uX2KFSZXk73Slme9IVDBdrj01GJcFy4NtzExpdcR+LnAPZ0r
	0ZoQWHyegmG8vP1dXTDxG9kUw/jFQiWJvP4h/MQ10mc2XO5UXIPeeT1W7fJ//EWx
	gYSxKSBmJzRmxTfMSFyOw==
X-ME-Sender: <xms:J8yGZ8BPPFyZZgY0VeFT-K8Rx8m5zEuE-L_GQ1ekgVmyDV9lJPEe4g>
    <xme:J8yGZ-iQSsLljrFuX004ql6q_iYcQmCNBy4qY7A9oQjLKdjTzgveI6ldAVbi4kWIL
    GxoocCjxxGxa4VILUY>
X-ME-Received: <xmr:J8yGZ_l6MHXkb7K75Z56YeaGrBFnBWYk76l1XLPeq7OzzcUCbNtsaRMkI0pnNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredt
    jeenucfhrhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthh
    hushdrnhgrmhgvqeenucggtffrrghtthgvrhhnpefgkefhjeeiueekgfffuedvheegffdt
    hffghfetveejtdetffeugeejkeduieehveenucffohhmrghinheprhgvughhrghtrdgtoh
    hmpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehufihusegtohgvlhgrtggrnhhthhhushdrnhgrmhgvpdhnsggprh
    gtphhtthhopeeffedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghusghi
    thiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepuhifuhestg
    hovghlrggtrghnthhhuhhsrdhnrghmvgdprhgtphhtthhopehjohhnrghthhgrnhhhsehn
    vhhiughirgdrtghomhdprhgtphhtthhopehflhhorhhirghnrdhfrghinhgvlhhlihessg
    hrohgruggtohhmrdgtohhmpdhrtghpthhtohephhgvihhnrhhitghhrdhstghhuhgthhgr
    rhguthestggrnhhonhhitggrlhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmih
    guvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtoheprghnuhhpsegsrhgrihhnfhgruhhlthdroh
    hrghdprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:J8yGZyx-jwTVnE98BQslgJg8IrgRLe5mRexsgAKl1tAJ7E9KF1neTg>
    <xmx:J8yGZxQFSJHuHrvDQgcIU0QdGyxN72lQs_rbOfnjKaEPPLYWf8DSSw>
    <xmx:J8yGZ9a9kBdXKWM1jziJfYU9oBLUfJqBmsvOGi5t--0b2D-bHzClvQ>
    <xmx:J8yGZ6SpFBu2WG9M-nypt5XZ6tUIG0k0NSfomO7CG8db-W-VP9KAHw>
    <xmx:KMyGZxDHF630JI_6GPEE2KCHBUT1BPaXfGKINgDCuD-5LBjG06KoahJM>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 15:42:14 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
Date: Wed, 15 Jan 2025 04:41:22 +0800
Subject: [PATCH v4 3/4] sh: defconfig: drop RT_GROUP_SCHED=y from
 sdk7786/urquell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-fix-riscv-rt_group_sched-v4-3-607606fe73a5@coelacanthus.name>
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
 linux-tegra@vger.kernel.org, Celeste Liu <uwu@coelacanthus.name>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139; i=uwu@coelacanthus.name;
 h=from:subject:message-id; bh=BhZXBD4LrwRi3kBTuqWLXE3VKHJ0GCDQScQEjxdA+cU=;
 b=owJ4nJvAy8zAJeafov85RWVtBeNptSSG9LYznD2fd8RwHNpoculb9K0DbSGum9JK0po6eNP3r
 XvhzbsqR62jlIVBjItBVkyRJa+E5SfnpbPdezu2d8HMYWUCGcLAxSkAE4mXYPjFdGNfLecKz3NZ
 c/l+va5WTKo7y3prwpVfJ46wr578m4stjOGf0c+3AjpK3ydda3l2lrmxVG7ynlsv1Z/xT9xxwKV
 oxbfTPACIpk1T
X-Developer-Key: i=uwu@coelacanthus.name; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_124218_587711_093A8E9A 
X-CRM114-Status: UNSURE (   9.43  )
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

Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
---
 arch/sh/configs/sdk7786_defconfig | 1 -
 arch/sh/configs/urquell_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/sh/configs/sdk7786_defconfig b/arch/sh/configs/sdk7786_defconfig
index 07894f13441ef622c3af8d8f4b5770c2ab66bcd8..7a6efd5b4a62463381005072a679a8ce022a2ef9 100644
--- a/arch/sh/configs/sdk7786_defconfig
+++ b/arch/sh/configs/sdk7786_defconfig
@@ -17,7 +17,6 @@ CONFIG_CPUSETS=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_MEMCG=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_BLK_CGROUP=y
 CONFIG_RELAY=y
 CONFIG_NAMESPACES=y
diff --git a/arch/sh/configs/urquell_defconfig b/arch/sh/configs/urquell_defconfig
index 00ef62133b04ded8d0b4221f11e0adafde99d386..9cf4a719001ea5ef4b031c1bbbf8098e8af5a2b2 100644
--- a/arch/sh/configs/urquell_defconfig
+++ b/arch/sh/configs/urquell_defconfig
@@ -15,7 +15,6 @@ CONFIG_CPUSETS=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_MEMCG=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y

-- 
2.48.0


