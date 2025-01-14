Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74ACE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+TEiYNlY062v675yUdgWXwYQfH2PLhBA2LiyUaadgQ=; b=KrXFEkor40h5aZzW1ihV49AyBH
	oBJVEiFeoDkGcOSmjUyX0Kb9z1EueWTs6JVZ51CWw6aQSD7O6P9sAHFPU3/1T8FZ+jsU2fTktxJYA
	zLKdXuStNsoc1fJgDtnW+pwE2WqYvaZZXxJtJ6IJnBiTHBbJmcC4itJYlIWxKYiRaF6lBIY258QCi
	hK6oomFGENvFWxZAfrRVkLfJ1teC5ed4ewqhhuJiltX3lrSelh46t715ietWgq9r7QjqbxuHCZfl+
	1T3KIM3i/7us3jrOy5cdHAjnDLvnqfZ9QLAtD74/zWRg8gU7cgy0QxQOW6XEa2BQXQKpaQ0IsXcBZ
	eO8PdJbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnsX-00000009jKp-2i1M;
	Tue, 14 Jan 2025 20:51:13 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnji-00000009hq4-3ARj;
	Tue, 14 Jan 2025 20:42:08 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id D475411400CB;
	Tue, 14 Jan 2025 15:42:04 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 14 Jan 2025 15:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1736887324; x=1736973724; bh=G+TEiYNlY0
	62v675yUdgWXwYQfH2PLhBA2LiyUaadgQ=; b=YH57aj+O9WFA8KiXGhA56PD/El
	vs4vYkqg7DqvUCa4QySoCLF6fJKn5ea+yGjGIrt1kWUs6z4buWBIpDmlZr1Bdbxb
	Ub5DxUiheG/vg0ALwk0RGxm3aLc3xwJirIwg+MEq9IYCsGeNMw0r9PWNCVivNCu/
	ZS/zo2g8pha4mSOj/5zdFLRsqDCoCAK0jaRtcvhJd+LRDe/5pOVq2h5/vdtdcDAl
	jQ8AMClnfWTAaHjaV5HqLwVadK1ptSb+199bFbRw0+h3CeRJhmX2Sl90V9dp/To1
	2YssGh8+PguoDlSnkFKQh03gMyYOAmWbLKF8HhUbfqAfW+tQRyHLsItQJACw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736887324; x=
	1736973724; bh=G+TEiYNlY062v675yUdgWXwYQfH2PLhBA2LiyUaadgQ=; b=U
	dI02B+9OgXBAO8VPZlBm+qO13y2UuJ5WxSOIw/vUR3XD6JD9YMopBUKGSmJ1BR13
	jY1uISp4uhco6wQlC2rXiSb9qGe1ge5c+FZN/+uhWHiHIjKj4KDEwC916ZSGZX1r
	SCfot0KxGRu6Ux+0hgbx9CLeAivvthda5nnYnp1E07v2wczK78+3DNM/rqj1Yg67
	pIadtl3ul7QNq9p/Zs9STu0psK0LzFM5ShleTLcV84xt/6xunCHmra0NfgeNOxA4
	FqyBHslHpEYBHxqW8kzIbmdkBf1lQbVE9eEDSOi8Es3L8iu5Jgff+b6FlREC9d9r
	r6cmdEbBTH7PXRnKnyNvQ==
X-ME-Sender: <xms:G8yGZ8ovRi-XB40q05ejGxFKEVaijHM5xESImxMnPlJwRVW8Onhkjg>
    <xme:G8yGZyrx_7F2nCe8sj7wgOjJbP7VAMXXYnvCn_ZtabJwNGANz0BR9X1L7dNdlgJ1m
    Fmvh96v9ozxNjLydFY>
X-ME-Received: <xmr:G8yGZxPDvXL0goYwtJLEMQJIuaLqZs2knTQkVd8VrEsYkYgcFXkX1wPGjWbWlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedgudeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredt
    jeenucfhrhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthh
    hushdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeegfeekfeelteeufeekleeukeegffef
    keetveffffethfevheevjeektdelueegteenucffohhmrghinhepghhithhhuhgsrdgtoh
    hmpdhrvgguhhgrthdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehufihusegtohgvlhgrtggrnhhthhhushdrnhgrmhgvpdhnsggprh
    gtphhtthhopeefgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghusghi
    thiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepuhifuhestg
    hovghlrggtrghnthhhuhhsrdhnrghmvgdprhgtphhtthhopehjohhnrghthhgrnhhhsehn
    vhhiughirgdrtghomhdprhgtphhtthhopehflhhorhhirghnrdhfrghinhgvlhhlihessg
    hrohgruggtohhmrdgtohhmpdhrtghpthhtohephhgvihhnrhhitghhrdhstghhuhgthhgr
    rhguthestggrnhhonhhitggrlhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmih
    guvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtoheprghnuhhpsegsrhgrihhnfhgruhhlthdroh
    hrghdprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:G8yGZz6NduzkIgRFd7Z9G0sC-BJdoMB_M50PKK3diBl6OFZakadBhQ>
    <xmx:G8yGZ76by2bMD_Sogun2RI1gqcs5MkkoH2l40gN87skOineY-8ZX5w>
    <xmx:G8yGZzigrIqC8QeBRkt1H98bgrNOLkBvaVorZaPjsi2q-lGgqUptVA>
    <xmx:G8yGZ14ZsNmq8Fh8nUbliIVr_m70fHr1rqjNbr7GRnLObLly7YmHwQ>
    <xmx:HMyGZwZlazZrL1DGG-6d2_VenzsEYQ_8S9pQw3HTuh3Dnve29aVo3Zmk>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 15:42:02 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
Date: Wed, 15 Jan 2025 04:41:20 +0800
Subject: [PATCH v4 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-fix-riscv-rt_group_sched-v4-1-607606fe73a5@coelacanthus.name>
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
 linux-tegra@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Celeste Liu <uwu@coelacanthus.name>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987; i=uwu@coelacanthus.name;
 h=from:subject:message-id; bh=WkvIObUchYpAilmJK89a2+ds4ehlRbbV+Uqcck4hmYI=;
 b=owJ4nJvAy8zAJeafov85RWVtBeNptSSG9LYz7JZzu3m/esxYasXrc/3aJMUnP55MOzQjsTiBq
 Seg9WqipkpHKQuDGBeDrJgiS14Jy0/OS2e793Zs74KZw8oEMoSBi1MAJpLfz/BXtuPp5Qf6PQtd
 TGe9Tzi5LWZZ3vVca522z6+Y+d6kPv8RyMjw+ofpP9fk2b+37mTferiEddNnkwnxn94lXNFfr20
 fd2kKMwBcoU0m
X-Developer-Key: i=uwu@coelacanthus.name; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_124206_851052_B1C70EDA 
X-CRM114-Status: GOOD (  10.01  )
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

Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
introduced it because of Docker, but Docker has removed this requirement
since [1] (2023-04-19).

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
support it.[3]

[1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
[2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

Acked-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Acked-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
---
 arch/riscv/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index b4a37345703eb35757419aa5a2b057c82ed22fda..46b8fb30726858a945a24097773174961c2f4d10 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -10,7 +10,6 @@ CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_HUGETLB=y

-- 
2.48.0


