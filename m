Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F500CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KQcSNDmKTezvsQvsnROQYZUeQT8pZqDnSHqZSPctCj8=; b=u3g8n1Db7ti/rWUKNoq9lInSQ0
	rN21yvZDREnp9G74T69pg0HrV5TMAEWeYFtuVEctXnKC47USdOHsZAlRJp6b273JCQXW/irgqLUdf
	tpgkwrImVlfdpX0XZ9qLqzt7zYAhrA5MZXvOgks4pJqXlKVgupjL1bJciKvxrcre8GqKYGfW1+tKG
	BlcdLqQv6HGmyXKKEF0lBai2cnKMdslIQmLp+mKDbo9zjnbousTGICqHRE8X6/5PbcZaEtXIQu7Oo
	WhUjUAYEp08arNDczo1l4xS4qLS71jx6ARw19EQiWo71409yiEjBbLRB7ZVSEMcqDBrJtIOalOc5U
	Js5PqHLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFJn-00000001C1u-0kYM;
	Mon, 28 Sep 2026 17:39:11 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFJl-00000001C1H-0hjG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:39:10 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398a147688bso2428622a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790617148; x=1791221948; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KQcSNDmKTezvsQvsnROQYZUeQT8pZqDnSHqZSPctCj8=;
        b=IInf23cPO1XmFgoL9BxnT2Ia4K3FBPdS0rQqn4HbnLsBRDW/k+CeJ6/0/LEins5eF6
         Cc9oQM77HV2xilqtaltCc5+Hl3+cWODkLCEKQkxBxteznPspldl0CRoOZs02mgV3TZ1c
         RqTpNiVuAFk5V01ZZALkdVqdN/smAa6WV8RCmgZ/CUsf+uLKiQ7vPX/Gm/K/j6oxIq1c
         /zBzA3fyF+kLUqmUCp6KtciEJLmAEhCW8h61g30r9oSOfR/NMZolNVEKPIBrixAaVzs6
         mLv24o6Zh/ki0Xgu1cUiOGZD6MQhpKLxioqXLHvgmhdgbz03lISurmEJL2K+5hddpEwF
         AoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617148; x=1791221948;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KQcSNDmKTezvsQvsnROQYZUeQT8pZqDnSHqZSPctCj8=;
        b=j1g4gfXE0Hs2xEWK3Sc64MpmG6NbGX3WDOsWMRSDHC1fCaPsfKgrjgA4xCk7fTOe00
         BM/Q6vtGn46giSeaMlzFcRgw+4UxdIxjBFvZcALtXLzFCeMKgP8QDwJw7QUdp5JK/cbn
         VZnrB8HLv8RFnabvdCR8SfkJsFRw3VIBI05k///GvxAjVdu6TVr0wYH5ugVuj3gCBayr
         LkjMlSDLkCM2nR2pJRxPXGcgyLxigEr0eU6dwN7G1fg6y6DjBHYNqgW11IYhoPKPz50e
         NFO3TPH13XbfVgzohjtZz/IFZCuo6NCYNEbZXuk1x6beq7KIO7rtIA7i1h4YSlDHUp+Q
         Ulig==
X-Forwarded-Encrypted: i=1; AKwUvBzfltB+y16kKkKP5LzzVJ+5793h2dbIY7ecjGf4fb12fvnhDuaLbAk3isc1S/Lnc4XGckq3UDcCahhXCwJFPEtU@lists.infradead.org
X-Gm-Message-State: AFq9FYJHVwyefOa4re0pIr6CuVSBnvWPIlZZkhqw31DLBPoOg2DECNOP
	+lL8sdBCzWcstV+cyiNgTerAhdU7UjZKsExKTmkS/GbCxs11chixG8QDkqKHG9UIknuMhB2MOHR
	Cydt8
X-Gm-Gg: AYBFou0uVFyKOIwi142nb6MebVUADRXap+0CrghNU2xSbFIS6jY3yoBHOGkoJjJXgy5
	XSy5QOeI3cZhJo2vGGG97BfxjdqdfoEtw81mCIY3A8+IEzsFB0WIDc7Hr+MzcP059tMvhheJ14Q
	f2z1yDt4YkVtvSlYDAGHLGU3I/ardFZq0eXfnKhKL6EGChNKq0SeoGOBowrV/DluDqP15uvTLOC
	JgWlzHcMyq0axTeYXpBWR/g8ANxRm8Vk9VfxgN6909AxBNfMVE6UI+NsI+bwC5SIlUy3HuNr3e3
	wvNcK4kRlQniQh33vVoA3bbEKgkPc5DKx92MZBaXTTpI3+KnU7wTqnGl8RRilxj63eitahmA8Ek
	zSzgSUpZYhE5RlgvpgUrxmGApPPpbVpN9RDUp3AalFTgkHzv3SjE8Qoe5VT3CD+XxhWBMw7QAJF
	eCu4RHqORp9ztNSSyuWfB0VunEd8ZrnDshhYZdKuXokflpO+wtC0zDx/7NaVLNy3sOhrE=
X-Received: by 2002:a17:90b:4b86:b0:3a0:ea9b:1e38 with SMTP id 98e67ed59e1d1-3a0ea9b31d0mr5816499a91.27.1790617148332;
        Mon, 28 Sep 2026 10:39:08 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3a4986e964asm515286a91.15.2026.09.28.10.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:39:07 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm: soc: OMAP fixes for v7.4
Date: Mon, 28 Sep 2026 10:39:07 -0700
Message-ID: <7hzex19sxw.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_103909_210542_FC98344B 
X-CRM114-Status: UNSURE (   8.87  )
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.4/soc-signed

for you to fetch changes up to d1e94aea2b15f076d3f95b309fbb372a8fe2e9f0:

  ARM: OMAP2+: remove unused ctrl_module_wkup_44xx.h header (2026-09-21 09:01:49 -0700)

----------------------------------------------------------------
arm: soc: OMAP fixes for v7.4
- remove unused ctrl_module_wkup_44xx.h header
- Replace __ASSEMBLY__ with __ASSEMBLER__

----------------------------------------------------------------
Ethan Nelson-Moore (1):
      ARM: OMAP2+: remove unused ctrl_module_wkup_44xx.h header

Thomas Huth (1):
      ARM: OMAP2+: Replace __ASSEMBLY__ with __ASSEMBLER__

 arch/arm/mach-omap2/control.h               |  8 ++++----
 arch/arm/mach-omap2/ctrl_module_wkup_44xx.h | 89 -----------------------------------------------------------------------------------------
 arch/arm/mach-omap2/soc.h                   |  4 ++--
 arch/arm/mach-omap2/sram.h                  |  4 ++--
 4 files changed, 8 insertions(+), 97 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/ctrl_module_wkup_44xx.h

