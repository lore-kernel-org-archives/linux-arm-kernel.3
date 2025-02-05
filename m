Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C51C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 16:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=; b=MvIrEB2G4T0hVr+aRiW4OB3gyV
	+n2Hs35lakKoKQz1y/TdMWCqmIt1EMi3baMIB36zWRllPkoArYzzdlMFLy8caInpGxOr8uGWDz9EO
	uZ38e8AlsHbCfWt3iFAN3uluu6yEGRRAW2FKE3+1aPKi3d+FJbz4x9Ypc0Y4SknplyVzKzVbU5USe
	PYEZIt4OKPoUPm3wvjZrpmpgOnJXK3z3+tKSaT4kyu1DHT3Mlpp7QR0AvCltSDKGnl23uMbNyPvc0
	+5BH52y2Bq9TahdXzIOtTJ2iFxz/8sZwYOdtHFcJoq0XBcT6NkJD+b3Im896gPYnou7VNS1JvXS/5
	Bl19K8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfi0c-00000003vR1-047j;
	Wed, 05 Feb 2025 16:12:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhpa-00000003t07-2B6M
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 16:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=; b=SI1+gnOISvhxghplSkG6/OYRLw
	URSirxtdwHQEGS6KnTMEn6coU1qNcJ9nZ3OSEZQHFqU0eytWg4w18i8aPkvgTxycuE1lPJOJ0vUug
	eZ2iRvJMl2LW7FqhYBezZWyCDeEq1Iu/HIOmcPhUQV8wdxtRx8oxT1aSg45K2VHJuWzhgJbCzednV
	bmfpSn6FVGr9M1lVIcXA38taDotRGWrxBUUufnQyked2Jaw/orO+0dPN1nbEYGVp0Zi9qu2d5GBHv
	0RoQfhxMgh0cq5B4qqS1bdk2VpQTpvh67LhwTFnege9aSecJ0/FQFRVkpgh3ZZm1oY7uFCZPA6JUD
	e++4Hzvg==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhpX-0000000GgOR-17fr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 16:00:49 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21f1d4111d4so10179715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 08:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771246; x=1739376046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=Yffj1+cm7XSs6dIq+ltL/1dg/LPVgHBTboLKIEe6NwnNoGz7IPLkwGCbF1dqfzWrs1
         HP3wZELgn1RRDk1m4HNj3VAVwY9OnbtXHdvdcXUmrrwAIoZjfDMT1wynoNau92QL7t7w
         GxiIexbRDahF2gD/u89ghWbGkc5TQfPmmWkxggt25NQ5A47EmFlHc/5l5mhydPE36G0X
         sVNRTRBGqbgsGhatVGXEbmsDjepcGIHKBc+h5tcywYk5c91P77B4/cwllitctlzKTYMi
         9sWhZlB4SkNQs8yXIBMkfo1EDYf1hkL5uffYNSWQTvOmOYkCSpbQwFR+CPrtdSPym73m
         /1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771246; x=1739376046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=D5zwdM8Kb2jvKJwYpxYWr0HhXJtyPWGs9SPGpmVxpQKoUobss93901HmkiGXKhyIt3
         5/hUcMtfLmpHgwjWUNI82W0gPa+l67u7C9xU02gKdAHx6H0z1CWdeRJBREcKOYF+qvNY
         8evmRIi6Q4rnxWaqod6jT6cDssNIWtkD+E9Mj9oYxYPwTe4A0ekOJ9xAMF7Mzm8bKm5r
         62AEUwnljKk+gw9hCX4Smjb/iciq0KGrlF33sNysQ58tRHut5uww9SD/l3SvUK1ptNtf
         H0HvLSFvTQD+H/+fnyxoWyPoXavuwZKKEjpKZrk2nNCwT3/x8vjg9ipSvK/wwlrNmQjF
         WSYg==
X-Forwarded-Encrypted: i=1; AJvYcCWc/ksh0lKrk7kgxlWo1Zn00tZzwY6w5Uz85tr7pNv/Ba9ibdzK2fRRJlbTVu/2/bxWTKWjL2gBubYEvA70fck/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy89iqJsn73KD5AxWXDYmNZN5iaZ3MFzx6xWZSCnmyFJ/OPwArw
	wl26Llwk9HUlaBvKIis7pLDoZL5j80U1LoWiX+M7IBEITvElh6Cofq+odJBjpc0=
X-Gm-Gg: ASbGncsGuzF+f2f0wTG1b7Nmw1rTLLgr0APW/Q0+0UuqFL/5bii6jBeWybJSWPjsdQP
	4aX348VsxeFAmuMHKFYgqtvLboYjIt5PD9x2VC+BbWx+twr5H8ae0/K4WHIy5BcjPnHFVjJlUgF
	v1w8C806Q9FNS6jywIjAnjj1VrFd579MNEu3kXiYEFNbDA5pwHFAuQlUUpGS7qWCh02LciZQmyF
	HJve5ri1aJ8z60Tut962tbViobEc+uTmJc4aq805PKQOusiHPlHT12Li/E2ru4U1b2dkWSP6C8d
	w3YF4lioYblkAbnycmfBdPNTRUUGBxuXcmRLHM9YJiTzIaL6l9Wn5iI=
X-Google-Smtp-Source: AGHT+IG20/n0MlzHXXlDX+eid7Zzs/iscNjRXbzQaZokFNcd/sGA49bK8WlZsq67OCE4wBBbq10xxQ==
X-Received: by 2002:a17:902:d2d1:b0:21d:3bd7:afe8 with SMTP id d9443c01a7336-21f17ed0ee5mr59541815ad.49.1738771245657;
        Wed, 05 Feb 2025 08:00:45 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:45 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 07/11] RISC-V: Select GENERIC_PENDING_IRQ
Date: Wed,  5 Feb 2025 21:29:43 +0530
Message-ID: <20250205155948.81385-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_160047_863015_9BEE9675 
X-CRM114-Status: UNSURE (   9.14  )
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

Enable GENERIC_PENDING_IRQ for RISC-V so that RISC-V irqchips can
support delayed irq mirgration in the interrupt context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..a32f39748775 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -111,6 +111,7 @@ config RISCV
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_PENDING_IRQ if SMP
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
-- 
2.43.0


