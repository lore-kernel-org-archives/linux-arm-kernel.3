Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCCCCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 17:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hR9EM2z6sHnGhlsEZZ88mJGrfMpYr2YCoYJvLqYoDdQ=; b=Jie2uof17Vz6k1CSBX5tb2hwtB
	FbIIPu9iAi2G2/SeiM9pKmXB91HIbxn3/W0RYVUDL0XpOxm78L1977psErkXwlUfypxnuMsoN4Mzi
	A4al6NxYD0+RlaVDz5T8mpWWQT4tnUTXvCsGbRPnuWxAE18LgSaintZFdSA5BuPjKcxlIw1ecB7IN
	V2xeZTRsBy69uIvk9PiAyqzQ4+yp86cDZr6ANrR2eafPTUZdZ1Y+uLouyZd5m5fBU3fXaMAImwsjS
	O4lhrSMlhauQDZ7GGy4uMEuIn0N/u4Z9g6hHHUHdOxNwX5OwRIPLmUqSxbQmiCOztvsbG7sc7+QBH
	/vC6XSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL32o-0000000GXg7-1SHe;
	Mon, 17 Nov 2025 17:29:38 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL32m-0000000GXfi-2Qs3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:29:37 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-297f35be2ffso64814375ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 09:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763400576; x=1764005376; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hR9EM2z6sHnGhlsEZZ88mJGrfMpYr2YCoYJvLqYoDdQ=;
        b=OxSTD8suIpGAaMKZ2P8l65CppsmBDZfQtDxb6ZPlEuedUovfrIKdwfcRzh23zaCYo/
         2GuDsL3uaRAZN54rs6dg8hZbqXPnhyln+ytqxig49ejOWpN8Ie8zLpG7m86jcEd+Iiet
         xSAOYVDtUVS5u7PakSrcxdsviPoYgtAHB0K9708VYsdUf1fsv46o+ibOBg/lcMBdqKXi
         +p547Xu9WDoUqmFvi2nV39VKDvCjSejP0CIHS0RQKjSfjj+Q+QDQM76Amz8K9eIpdOSL
         mAyLsmIoViThZGo2uudvH7Jv3ksgc7aPTjRt1lBFYOL/2FGSRxYB+PfcE5Qcwoh4bENv
         CHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400576; x=1764005376;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hR9EM2z6sHnGhlsEZZ88mJGrfMpYr2YCoYJvLqYoDdQ=;
        b=DLjZkHwsUZdlEnZM+fmv67cMJ+7gWT2eKrtk5z6YxzLdy1iM3VXHaIBRivDuwx6JFj
         b/h6tRyU829qJnZ/sT2ksYPb1/wETtCn2oMSfHQCTNPFhnMMReZTeOkU6e2zkjV0/xu2
         Ym84C2HfpRD8sjtsoCC40LR+p+m+Db6281afecmnYuRditi7w4yA3DMncno7AlrjYkif
         4EVOlL/hMY3hVR7MnJtWxSWl6XrfLJnfCv85q48lhORztL1wnSAG+gvfqLwneEVKJyr2
         j5g9cPsSmDWDI9/TSSLhPBu9qa59NKkKa637rYbSsJECOOCDS8eEv2ia8Y7HUU5ZZQE7
         GIKg==
X-Forwarded-Encrypted: i=1; AJvYcCVtDzK39rt020bRZh3bFBZ2l+ii4Vhm4AMrbCWB86ehUG+q1eqiZwFxQqEKUc61t3U61uxiugTqmCSvTKx6WXze@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdek54DG+M4CfKgqTLNxPwImcHqzvZR5TVsPPixVORffdFGaT9
	oB3zpH1ITesDygzzAt2mM0LrO9OQCpUI3pcnaZWC75momo6omkqEdkYHl0kR9962+ME=
X-Gm-Gg: ASbGncsw0Ne57svE1jdr8VsmhfISz179369LxnYNcLbq+GDayyi7snZ2zSIhNwLlKis
	JiJctIyKp9TbJbaD7Y2MMUk7bLW+9+AtE/EHbpCBCRrUFXRu0yy7DKaDa0i1H7/5BXqSfA8Ai9r
	CfDgOLoOwMRo0vjwvfizOKBVSX0i12KyvNyh6xq+ULD0f3+SNR17nRvpOB+Up4sm0xWn5CB9pSR
	P9iRucitGKLTnfX5neD22IrJ7MY96Dyc0mV6kcv34o1QmLaa8Hl7T4osy1VUcpm6WPm0IawxoCb
	OTf8b+ZbbfXdWP0EVcOH9w0IlVqh4dU8b93c3+BxqTpe4wxDk469s2BV3MsQq4WFHe9WX5QsANq
	St0ufTLYtlF6SMhbYCVMXq9PFK0esbwgT/uQzk18uN/0ZhBgs/Lqs8diPduU068T2W27Iw1nsUQ
	==
X-Google-Smtp-Source: AGHT+IF9V/dBvlwYAdM9IAYen85Y0K9dLfQidM8wPheh0H+XYjGDt3ZMEs/v4nT38ZUHffpu7c/I9Q==
X-Received: by 2002:a17:902:dacb:b0:298:33c9:ed99 with SMTP id d9443c01a7336-2986a7414e3mr169566815ad.30.1763400575878;
        Mon, 17 Nov 2025 09:29:35 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bed23sm146031965ad.87.2025.11.17.09.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:29:35 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc/defconfig: OMAP updates for v6.19
Date: Mon, 17 Nov 2025 09:29:35 -0800
Message-ID: <7hv7j8k1og.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_092936_614883_AB1F75B1 
X-CRM114-Status: UNSURE (   6.04  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/defconfig-signed

for you to fetch changes up to 393f40ef96628f603b40e97b6da9847d20a904c0:

  ARM: multi_v7_defconfig: Enable TI PRU Ethernet driver (2025-11-17 08:53:20 -0800)

----------------------------------------------------------------
multi_v7_defconfig: Enable TI PRU Ethernet driver

----------------------------------------------------------------
Parvathi Pudi (1):
      ARM: multi_v7_defconfig: Enable TI PRU Ethernet driver

 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

