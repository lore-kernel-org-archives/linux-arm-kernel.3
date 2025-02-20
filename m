Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C245C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Mhxc0Zvns6Yn1JJtRPi3TJJp5srNdU12f0u9NFGaDA=; b=N87dorOC44emhqxpo9j3tvhf/e
	MCWVdLGq1TLtpM01DjlSTj9cQ8Id3boqSE7x0jRrMbqdoDYyc+uNlKsCvSU7MIDdQRrEpM61cgR4g
	WPbt26A5s7jsX8zQ8p9981G47xF4mVpVHIvZ2aQ2bXQNJz9sOjrZZmUHIw9Jo0VI5ljFtqltgMJ69
	+wHgkchbEWvGON7A1vvi+bXrh8KoQiOZkYNAiKmnBgkRj4XGZw/PS3lzs7wA3iS42JSoOiS85qhwT
	bY1S0b140f80KT0e2B3iSiiOrqw3Jl9ITfeAv7SnKs4DWcDHL8EIriRSZY0JRCLNJt6hixBJd6Eq9
	BYWKfeSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5XZ-00000000kjs-4A3u;
	Thu, 20 Feb 2025 12:20:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5V9-00000000k75-11NW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:18:00 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-220e6028214so16490315ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 04:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740053878; x=1740658678; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Mhxc0Zvns6Yn1JJtRPi3TJJp5srNdU12f0u9NFGaDA=;
        b=eMnxITGhe3GsTlGTiTR2v5hV6eHguecai1Dda9MJ6Mr0e3NNW4tYC+MrpteBa1hsBT
         Gkh6f27gfkbxTiaX5tUNFlcksfJccAMcNA2pHdDj36xjjYZbEhdrGm3JKHJ/A5Ie/H7e
         JA5mZDDvSvNsWK4dFwQuBOJVRhg/PW+t1FZyGu/A4tylO7Bb4/PNIAYqMyac92tJ1vpz
         w3rR/bgz9kGJQjmxuc4oYPhJcEaKiz9TBMHJFszVFtiUifU+jIzRXCqbo5uGald79TjR
         LrPPD+oE7z0T1tDSZHO7QmPAAA9ejrBatfgGrPyIDBNlYza7TCL4QnBigh/uqHv6NGGI
         ElHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740053878; x=1740658678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Mhxc0Zvns6Yn1JJtRPi3TJJp5srNdU12f0u9NFGaDA=;
        b=B2aEHfXYCIvfmjBfzwjWPsPe9rQ4zJeacTcTOqx4BHwWHVxFqxCSAF2B3rwpFDjwVR
         u9V9BnCVFBJKbFNhTi9Oj4GICxA27oFGw8UBb57YojUVAy+cMItqIb6dpXRyalbaVpTE
         SM4Q6QqJwaP3MorEh6uWs/HWPHp7MmPsO2mnCbi13+rUZSgOvzvzMKD3iuSejUrNmVR0
         H/WZERS7A3vAqpDNX/UYr9iFvwcsZeyAfH9CXmHM7Nsci5gGg+Lkr1hDGKFSeTiVitOy
         4dKG4JwVmb+s9tjqc04drux9avlyrHiLVV0M5zpD5Th93k8bmNHozkoDZazwp/+gpWjJ
         doag==
X-Forwarded-Encrypted: i=1; AJvYcCVgeCH5LWvtMgIIaSD7278JSMO8egVgl0dyAhRDfNyJC8Ei9tFUaV7AzaK0rs2S9f7FKS0H0hYhEjBiGRDEVn4y@lists.infradead.org
X-Gm-Message-State: AOJu0YxxjpBm8AMyjFJp+MYW6uCdAPVaoorE2k+k3Iw7+fbWgjJU05eV
	s4p8z+l2YQx9t38NV5atiaN07CdmxWNUplX3OFNR+a/8HmCLUTK5DkaYYPKWyvQ=
X-Gm-Gg: ASbGnct/6z1mxYd/wbJnIohe3ExfABVzGPdnD6VfMZY5sdpB69w30FC0JaGRQt50ZRn
	TBsq1d8DDlyqAsdJnQFWaUiXw1HlgYa5lIfbXCcqLi3caS9byNPUreYdpLOJIMUqv1hPS/EoJpe
	4yRT3jgweQpI6bPDz6dnSIU7TuO7G9OHVUg3vk6PosBEQ9LsfwU9RWfYBvgJBqw+JBYMOboR72H
	JgzklB0rVNJZ3ZQpd2uWB2cos1wkqZwXM5PDGIqABUugr550F6j+CgSmK6oAganz9VK31dW6C/x
	QLCsPiZ0Tpuinl3fOb6TQKWqnMrlsXg94a6k1MaIyUKKgLm8CA==
X-Google-Smtp-Source: AGHT+IGDJ50LQRWaa3WO9QsRF4eufVt9fyhtOZXwrn91dXqUgW/zlEdNiAcm4tKuEZGfurYEc02gAQ==
X-Received: by 2002:a17:902:e806:b0:21f:81f4:21b8 with SMTP id d9443c01a7336-221906a6c10mr37088815ad.50.1740053878554;
        Thu, 20 Feb 2025 04:17:58 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-221040434d9sm87773895ad.196.2025.02.20.04.17.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 20 Feb 2025 04:17:58 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v4 0/2] Fix dwc_pcie pmu driver issues
Date: Thu, 20 Feb 2025 20:17:14 +0800
Message-Id: <20250220121716.50324-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_041759_281251_284D9642 
X-CRM114-Status: UNSURE (   7.61  )
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

v1:
Only sent the patch titled "fix duplicate pci_dev devices".

v2:
1. New patch: "fix the incorrect reference count".
2. The "fix duplicate pci_dev devices" change is made in two places:
One is to remove the modification of the PMU name. The other is to change
"for_each_pci_dev" to "pci_get_domain_bus_and_slot".

v3:
patch[1]: Remove the logic of "fixing the reference count".
patch[2]: When pr_err, also output the sbdf.

v4:
patch[2]: Restore "platform_dwc_pcie" to "dwc_pcie_pmu".


Yunhui Cui (2):
  perf/dwc_pcie: fix some unreleased resources
  perf/dwc_pcie: fix duplicate pci_dev devices

 drivers/perf/dwc_pcie_pmu.c | 51 ++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 17 deletions(-)

-- 
2.39.2


