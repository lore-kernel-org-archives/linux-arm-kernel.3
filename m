Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D61AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 14:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QDlYysWEDC9bsdNUriekyMCwXLSh3PKSI3dkxy/uoG0=; b=sNQiR3gyliz4neG2CHZZcGa/Uf
	BgQeGLFKA6zgAJC1ktJH+TNwLZP8ui2ny6GY06RgsNOUJKUH/tOQ7c84VuI3ULDwKxKyXb93osMcO
	0f0AXvVVhO22VZDLSEh7SIle9/jTz/HwVU0WgpAsfpPEEABdQ0G1dkSp3bdB1nz6/4H4Awpj9jJw0
	efN3Yo1okYrb16Nx/k4X25XimMt8pO4XykepQFzanEopArx5V7txRt6uAmhWTx8ZunFGTTokyWOjB
	VISRajNtYY9E4L19xNtNjEuD9KaxfOujdPU8veVrgpm9VaFaRn/TWpw1gZxGbMKsmng/bjVuTgcwv
	1TeSoMWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhqZQ-00000006Cvu-3GCA;
	Fri, 01 Aug 2025 14:17:16 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhqTx-00000006C6z-04nC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 14:11:38 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-76a3818eb9bso888335b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754057496; x=1754662296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QDlYysWEDC9bsdNUriekyMCwXLSh3PKSI3dkxy/uoG0=;
        b=CtEItzpS8ePYcWfHjmm+zwC0Moi0elZDIxgciziGHx1bkOAheXU7e7AfL32rWp9sxa
         XpYc2n+G0MWpFyQQ7dJo3EAmwKMvApbj7rDFPlyOonBSgcFmoAYBC+909fRhb/Tw3kWW
         nUcjUf8wICX1MSaMeUWf6f0/aLolf//wwdEvOZRd07ByAIgVEdqw+WC/bJ3tNzgjSXfy
         Zu/ejQELcQZrGhFH0XuJd+s4aO63z9xqe6ZC6EkRaeblvHurhjaRYafX+KK0k1BVameA
         UZU5FFAkvXn7RUN1kdybXZFvvx0JZRYyr3prhItPAAD4syPWXYNhdBgiDDbidf9SOSdZ
         pnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754057496; x=1754662296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDlYysWEDC9bsdNUriekyMCwXLSh3PKSI3dkxy/uoG0=;
        b=i6B/NXbqMUlGjL6R7zAiUMbd8aF+FeEebrWsTc14A44+X7iJ7LYuDyr+xPTV/21dri
         Cg1+mCEBM5cEInQBV6vAc9c8ah5LtbMbXlW6Mdbph0sWMxIdYBaoGJdW6F2G/vvPIvyq
         rcnMSpIzL6SfSzedH64ESxAcBeByJ6PxWMwT73F2oFlWBf9B9Y5tjVEQI86ZOCFf19Xe
         VSvVWo4OIrYAB+KnzzelSrwHc8PoX1dnyfdbfyVGKKoC7Mn2znabbkZcEbjNiS1AG0E3
         auNgEXacmNSU/GjBtWpLRctjFTcoIc2kB1b2UBFSpeDVki/GNojyz+OhnBZmOJpoY1hP
         qK5A==
X-Forwarded-Encrypted: i=1; AJvYcCX2vwxyQH2wJ3kOqDZjR2vTQwxYwm56Pw+prmWCi5jLfNkNXb3TcF+09AEw8QDmlzUpDdW+d/a3Hj9CtSCGJdcQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzayxFL/HnJ3UkyGXF1MxJfkiCvk47Zelq10VJiTYFBlCAbRFGz
	M9wHWCFEDITwrMMw+JTwT7WHBXY39P5w+/pQOwEkddZ7mw/ozbIZ+eca
X-Gm-Gg: ASbGncsN2yzIN36DZ7QjXBDKe0RIRUDnPrirpceQdiSc7gEs8Pzk/zo3fyrBBv9JZu8
	JIXEdKG08W3V4PkzA6xYNgiXcvqGDyAqAZ2KJP5wpJpGTUrBo22DogZrWWbzsPSHPl5ap90y4LD
	ANRxbslLXYvow535nql1DXD525UBA/U9o+05kF0ipXdVdMJo85+X6Vu6T9CVhlhkLlFFHXENPbM
	QPZRYDh0yRSK0T8zU6lM3xxhTf5I9zVyOUZt6lOVjj2Xm0rE7G55XTJGEVg+IqI16BM/zer/t9W
	YlVnYs9YExNnZTX1dLJeh0aFSC8PP6qtNfzRVCcHNFoX359cUL//gpOymK+vxpt17vDqmFBZ0Co
	I7Tfrcg3vy0UCNhrLs1LGR9jNg0VKEW6jJfFVO6vDeZSmim31vJ06MLYAl22+a8PSqeq0w2yR5r
	iX4gyIrdy2
X-Google-Smtp-Source: AGHT+IGgtdwqNeqGthVbBLzr/jwmqUMgf3GK98QWSEdaavZ7/9GNEF8oAglRAXDDwnehneDYPluCUA==
X-Received: by 2002:a05:6a20:6a1b:b0:232:1668:848d with SMTP id adf61e73a8af0-23dc0e445aemr19952336637.27.1754057495754;
        Fri, 01 Aug 2025 07:11:35 -0700 (PDT)
Received: from pk-pc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bb0db0fsm3849984a12.61.2025.08.01.07.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 07:11:35 -0700 (PDT)
From: "P.K. Lee" <pkleequanta@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	patrick@stwcx.xyz
Cc: Jerry.Lin@quantatw.com,
	Jason-Hsu@quantatw.com,
	yang.chen@quantatw.com,
	p.k.lee@quantatw.com
Subject: [PATCH v10 0/2] Add Meta (Facebook) Ventura BMC (AST2600)
Date: Fri,  1 Aug 2025 22:11:29 +0800
Message-ID: <20250801141131.2238599-1-pkleequanta@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_071137_062174_A0C3C49C 
X-CRM114-Status: GOOD (  14.46  )
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

Add Linux device tree entry related to Meta (Facebook) Ventura specific
devices connected to the BMC (AST2600) SoC. The purpose of Ventura is to
detect liquid leakage from all compute trays, switch trays and rack
sensors within the rack, log the events, and take necessary actions
accordingly.

---
v1:
    1. Create ventura dts file.
    2. Add commit msg.
    3. Use format-patch to generate patch.
    4. Add subject prefixes matching the subsystem.
---
v2:
    1. Modify email content.
---
v3:
    1. Add mail list.
---
v4:
    1. Apply git send-email --thread option.
    2. Sort nodes in the dts alphanumerically.
---
v5:
    1. Run scripts/checkpatch.pl and fix reported warnings.
    2. Remove unnecessary 88E6393X CONFIG FRU.
---
v6:
    1. Add a new stage for the DTS change.
    2. Run scripts/checkpatch.pl and fix reported error.
    3. Fix the issue in a separate patch.
---
v7:
    1. Fix broken indentation in the device tree file.
    2. Sort nodes alphabetically, then by address if equal.
    3. Rename fan sensor nodes from 'hwmon' to 'fan-controller'.
---
v8:
    1. This patch series has significant changes compared to
       previous versions, and quite some time has passed since the last
       submission.Therefore, previously received Acked-by/Reviewed-by/Tested-by
       tags are not included in this version.
       If needed, tags can be added again after review of thisnew version.
---
v9:
    1. Reordered the node sequence under i2c5.
    2. Added a description of the platform's intended use to the commit
       messages.
    3. Added 3 GPIO expanders to i2c10 and defined the necessary GPIO
       line names.
---
v10:
    1. Added IRQ support in GPIO expanders under i2c10 to handle edge-triggered
       events.
    2. Reordered the nodes.
---
P.K. Lee (2):
  dt-bindings: arm:aspeed add Meta Ventura board
  ARM: dts: aspeed: ventura: add Meta Ventura BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-ventura.dts    | 1578 +++++++++++++++++
 3 files changed, 1580 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts

-- 
2.43.0


