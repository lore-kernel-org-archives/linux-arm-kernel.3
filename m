Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BA7CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 01:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aDFFhZlnzsy41ndmGt6OQYFcCCEw2Vt6HJxHarrRTzY=; b=YDV4bBBhsiGRAsqm7A75SmKdhs
	4Jubj2uSIDAzuTSl2bGZkSUeRB3tIFW3NggxkxwUcvDwK0Qpp4s5z48wdeLZPPA9aD3OPXjYfQL80
	aaQOynAbwXA8C5XJO/BbCQ7J0afvXDzCqvYRvKdjIIbrkZDr7Mq2ZehKV/CqnYy7qve5OEm5Ueoj7
	ZCcFGEN2eNzwZkVf0+xvj3yCG3vjnq0YVbP7ieM8S1SvyCMi0+GHj9tlgrDXN1wa/83JenUykH9xq
	LFPhFC3a4oHoyIj5HiZcq/3oru1mPCuELp7v/MwctcXOICH9z4olEYIdMpdGkybBog+T4CCklKqPH
	GpdMLlXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sEe-0000000C4D7-3gzM;
	Tue, 23 Sep 2025 01:54:28 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sEc-0000000C4Cn-0dPC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 01:54:27 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-323266cdf64so4201609a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 18:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758592465; x=1759197265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aDFFhZlnzsy41ndmGt6OQYFcCCEw2Vt6HJxHarrRTzY=;
        b=NP3eK+hL7sRmF0z9t+csrw1SEtO/vw8QJYEj9iDpb3ZtY5tjKWD1ySX61Oo2vuBNNk
         Y4Z5iG2m5VxqFN9jBgoy04DlFXP6CHKuxYxGANGjTxf/RQoJsXaC9iKShhHu3JZjqlYG
         tWHEONud8e//eQc+J/VR6kn+tE3iLSMNbPO+TqVGzKHsUoWzcUiujVUjRdKuN+Jm3WM8
         2arA2tj2Og1x7ft8ZFaHJdH7MJ1vX7nLbPoBcQ5sErzCeXYDL699TMrOm/PfjLRcJyDz
         Xc45WGe7soTI7852qFkH1mZZL61Cv3otBBqX5HQMgEeulktf9zX6kUeJ+sbd8isDMGFm
         7lTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758592465; x=1759197265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aDFFhZlnzsy41ndmGt6OQYFcCCEw2Vt6HJxHarrRTzY=;
        b=YitXJA8zVFNuagY4DTgK3y9m+exwFF3AQ6q7yrKPKUh4SFmwYHgVcZFoLL2cdIt1PI
         Laexhp9uzdJId3PHgAAPVYx6IRtVYPLSZ4HERlQaPyW2furBCIg8gezhTq0DUkTg94nH
         fvEv9uTVrlmO3pi6nCs7f5V4QMWpUcqmL/oeK6BwXnwpwnG6Of10GZPJolBy9Vv72Z6A
         hO2VYZHz5GX/4qz/i2lV69zWyoQc8ZBjsnusY5+yzOC4RwsvViZsYQOC990ffPf+wwDM
         Taf4YJ2+XQcFBZhm5eBKv9aGOLZ6ol1jyxjKBYgUk55YlzUUVeXngeKZfpPOwvEwqCiX
         bmXw==
X-Forwarded-Encrypted: i=1; AJvYcCXHUt4ufd9/TLKTWX36c5ENSnpcP8FrD3n/u92QbUhSUaQs/e2Ezqs921oJvFAC3Bag7Bq1vWBNnH3fVDOJmvlY@lists.infradead.org
X-Gm-Message-State: AOJu0YxPCKdgiASCHKAVYh3/HuHyFF6zAwYCg3PVMvOH0SSnriJcqNvC
	abQ6RAzCgZ6ErfJnsH912Nj7bDZMGnHeGmxBDcrfqHKJ0w27CqDyGmz9KShN3x1HnCw=
X-Gm-Gg: ASbGncvDb+yKLZC5/DDz0eXv/ZeQqdRVdNrxeeMh4Vmh9evBXTNRAXZkTAJuBzNSgpf
	jyDAE67CmoshpfCLTLrTpi1K8nHMGPtaQaw/bN4lpLnSsCQwDt07wtUMiRC1if223ZZdGxHYgeV
	1XsHDXbS7mEmQnhj+EjFi+xkQlrSwDL3PrF2j/uEeVF00jsYO/Z8138xbqRU88sH7/EK6q8smBe
	Pwh6jZFf5l5eA9bNjiZCbHxkLXvd7x55hcN1uz9upFuLwFHZd+51mOFzQ+wKK41BDZ2+aZ9uyiC
	lD9HNP22qvv/OV0v/SvM8RLYiIOBCL2iviVWJVtLEHT8ma3KQnHFynVmzXRqVQusTJk36vmdhUE
	jFk0iX6nFCSDCDAMrNJOnPuh4PvJOsfwu27gJ7zb3sdwN2GBOljOIMg==
X-Google-Smtp-Source: AGHT+IF3wdg1xqu2ITvjzMmM1K1iJJ66E+kaUzvqT3Dn7T77NFDGuicqLfU2zWU07DUh0NNcErEILg==
X-Received: by 2002:a17:90b:4b0b:b0:332:6356:86b6 with SMTP id 98e67ed59e1d1-332a952a625mr966000a91.9.1758592465023;
        Mon, 22 Sep 2025 18:54:25 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed268813bsm17503265a91.1.2025.09.22.18.54.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Sep 2025 18:54:24 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	sudeep.holla@arm.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	mario.limonciello@amd.com,
	cuiyunhui@bytedance.com,
	beata.michalska@arm.com,
	sumitg@nvidia.com,
	ptsm@linux.microsoft.com,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/1] Add support for parse_acpi_topology() on RISC-V
Date: Tue, 23 Sep 2025 09:54:08 +0800
Message-Id: <20250923015409.15983-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_185426_195195_26805980 
X-CRM114-Status: UNSURE (   8.43  )
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

v1->v2:
Place the struct cpu_smt_info{} in drivers/base/arch_topology.c instead of arch_topology.h

v2->v3:
Modify the return values of acpi_pptt_cpu_is_thread()

v3->v4:
Introduce arch_cpu_is_threaded(): if acpi_pptt_cpu_is_thread() fails, try
to get the CPU's thread attribute from the arch.

Yunhui Cui (1):
  arch_topology: move parse_acpi_topology() to common code

 arch/arm64/include/asm/topology.h |   3 +
 arch/arm64/kernel/topology.c      | 101 ------------------------------
 drivers/base/arch_topology.c      |  96 +++++++++++++++++++++++++++-
 include/linux/arch_topology.h     |   5 ++
 4 files changed, 103 insertions(+), 102 deletions(-)

-- 
2.39.5


