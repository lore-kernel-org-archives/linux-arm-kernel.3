Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C049C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 22:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SoZljfqV8Y76xmxQUUDqkab4/v2p6BHdmrbK5iG/0+g=; b=G+md2VnKKhofsjJQ7TAh6RptWz
	7eSCJ4bo2KFni2hLehdzTnefHcJoUU3Ppt7wxHVlALS37g6VkICJ15DllgF0yZssqFXfuS9G2kPA5
	72dHhS/l/sXrh4rbGJDO9jB78pO5QisjDUAfcNeHijOHCHr7SA4EZA8S5ViL59MakczeGliKitx9R
	y75dALvNwKnvUTynetSTPAnR87Yodng4uGm5hl8ZgsQf6VNoWOxk/LT4J5IdBt20rcy3l8Crye5jP
	cMJS5m6xJRnobocySfSkQN5/BsJOKdWvIbGLwNWKmn4rwS1NWKyz0XcxmBy8thB8TGNwDWNFmgvnR
	lvn1b8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXozU-00000009sb0-0doj;
	Tue, 14 Jan 2025 22:02:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnk4-00000009hwQ-3MN6;
	Tue, 14 Jan 2025 20:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SoZljfqV8Y76xmxQUUDqkab4/v2p6BHdmrbK5iG/0+g=; b=pcPwtETkheJbp1BOXsfIorpzQn
	c7yAZfKVAl9ENEfZSjuJ0A1dYDPfGUkV9Nfy4CTtNwf+ndhWbexbmrf3N1pKnwJrd9e74KdPEafmc
	UOjmypd2+umD4gughbrN69oE1t+LeVERZIjXB0W380YAoXKz+Nf+z13EkKpXvHeGP27G4ogI2ytQ0
	J82NUdNhtxmSrVTSjAO4MMxx/JyTKEJuH1YfhD6vmcZ1IOVQ88StcBMqpGzAcVNwOJhONp3mdRDDx
	eeTfNSWo5dGyoVV9agrT6HIPXGvykATezVZet7+kV5Yf18iqFgxKQrvwu2KRH5idjK+kvJuULGJof
	sFBaM9DA==;
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnjq-0000000AcXr-3yxE;
	Tue, 14 Jan 2025 20:42:25 +0000
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3E80D25400FF;
	Tue, 14 Jan 2025 15:42:11 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 14 Jan 2025 15:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1736887331; x=1736973731; bh=SoZljfqV8Y
	76xmxQUUDqkab4/v2p6BHdmrbK5iG/0+g=; b=IAKGZc3athbt3hkSGEEWqMY7ze
	mRmr7xsvi+z5vfd4Dyr0vRzQ2GGlYCcw84PUlMvxW8DaNNmw3wBRor1f0F53qaQd
	tHeAPBUuBZcY6Y6STHHI/kGkIAgzqTorwThm7bTMErrdXttKRKmafSTbyk/nl6py
	FBoaTwMT584P+XAj9Q5jdiiaRhcVU1i18N4MMf+sh1G68koVQop8MIe7fhJe9MEk
	OzlMBI2QDety9Jrwp17pPArOswDD6duSaRN2bzUVOima8JIx7fjsbH5mVT8vQCeX
	dB8cW7+ZHZIqPoxRL8CZshzdpehthwupK+h67nIAag0mRbyhtW8PWsuTosGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736887331; x=
	1736973731; bh=SoZljfqV8Y76xmxQUUDqkab4/v2p6BHdmrbK5iG/0+g=; b=I
	iUpBfISPzKBT9yT6zKuwlNp0GG58m7pSzuKPBqLqZajDBABVXrnH5Ej7rfNVibxS
	pTdzrR0R0sdoKDWOiNUXhAq9KWKByoCFXzsp9+y9lQ/zIqsZoeNQ7nCesgLzfjba
	DdzMIThDLkz5tzQzl2M0TqL/SVBVLCG5EmqDC9XdOhD7YgnMeSVA4MecxFIyP3md
	5sHqSjtVuO+22UKXeUlmSTU2R1MwetSUHCLv6A/dWNrZGQQT3BRsFrBcOGMn7i5/
	+0/vM1GFLMlc7rGJ0G4J5WxgFAIfCPWOp+Ya9pkHS5R3ZpjUFoJVi/hXD7ypKipx
	lfQbCq/pVe2nDY9sO9DSQ==
X-ME-Sender: <xms:IsyGZ1t3Yn6qnH04zPLAsVx000nqjRNfc3f5-430jHs1ZFLNvN6BSg>
    <xme:IsyGZ-evAoE-ou6IJQWvHR2XLisQXzveprsua1AWjVD5kDnLVFs6OC9d057HsC8A3
    TlWL7cYohqB6YawfEU>
X-ME-Received: <xmr:IsyGZ4zHgsprho57NuJk5bkjPslGOoc638dlfvw6LGi9Y29u84mB6SXHglIA0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredt
    jeenucfhrhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthh
    hushdrnhgrmhgvqeenucggtffrrghtthgvrhhnpefgkefhjeeiueekgfffuedvheegffdt
    hffghfetveejtdetffeugeejkeduieehveenucffohhmrghinheprhgvughhrghtrdgtoh
    hmpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
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
X-ME-Proxy: <xmx:IsyGZ8Mq6lokQUjMTkf5-oN1B3OjLrif_hdRo8RWedxw9y2gQ0zNSw>
    <xmx:IsyGZ18rJ9o3HDa-BLd2mBSJkEgf9Vct2BQnF-I4X2lQEp6DFaoDRQ>
    <xmx:IsyGZ8VtH_K_PNRI-CBYupcKeQBpkiXGpfeJRrvxKzwkocRIYmQ39w>
    <xmx:IsyGZ2dMOs59DD0HY4fv4nk5vTi9e65KEo-dFcTw6QYTVuC4HDqciw>
    <xmx:I8yGZ0dcWMV8HEOX3jZUxo-Yz2Htf9bMhBbuTGkwnP730D5XQQGCshfI>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 15:42:09 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
Date: Wed, 15 Jan 2025 04:41:21 +0800
Subject: [PATCH v4 2/4] loongarch: defconfig: drop RT_GROUP_SCHED=y
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-fix-riscv-rt_group_sched-v4-2-607606fe73a5@coelacanthus.name>
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
 linux-tegra@vger.kernel.org, Xi Ruoyao <xry111@xry111.site>, 
 Celeste Liu <uwu@coelacanthus.name>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728; i=uwu@coelacanthus.name;
 h=from:subject:message-id; bh=faYQjbUe+IZ6IbLVoFWLES94wJ4yKdbIyLHK1P3reTU=;
 b=owJ4nJvAy8zAJeafov85RWVtBeNptSSG9LYzHNpGz3RdNkcq+138urdnco6HmLJOMKeQx8/dB
 x+9M/n57GhHKQuDGBeDrJgiS14Jy0/OS2e793Zs74KZw8oEMoSBi1MAJnIth5HhTFFkrOksz5Be
 jqCyI7OyWK2EubUnagjfyV8kYSe7ROMtw3+f+83SDSq+R6Y+//vmimFTUov/35ffOJ3jLvsv+PF
 vwT8+AA0oSNQ=
X-Developer-Key: i=uwu@coelacanthus.name; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_204222_732446_50A86BD9 
X-CRM114-Status: UNSURE (   9.31  )
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

Reviewed-by: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
---
 arch/loongarch/configs/loongson3_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 4dffc90192f7816074c3bd4b55c12159d5757676..4387bcec8f484173e5367456a69f6a7f03595d46 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -24,7 +24,6 @@ CONFIG_NUMA_BALANCING=y
 CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_RDMA=y
 CONFIG_CGROUP_FREEZER=y

-- 
2.48.0


