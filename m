Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C34BC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 03:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vbGv9Ay3qpuxm51qgM04ITtEt/JYCrgxQbnESo1G1Ss=; b=xch8rwJV626RGMPbltDHHD9CpE
	r9POJ8vcwpyYkM7lJ58LUQZeF1XCM+ZkwMJXMT8dfC2F0GVVtP1X6y/jU9lqjH8isxxIzUItUkaxf
	dggMQU1yO7wwiheCEW8zCWeFX9VbH47Eth7ZgHzoKYDCEvOML3FyoaLODM4X2bI21WxHacye/EMpw
	D3jmKEoaQDhzAspne3pijm9k9TsHXWTtxhk2PLDZXUZ8yBTfyIcDp/wPWPwMpO8N4KNitmFxhVj69
	O6gwPzJnxIWAvBECUwqph9up0f3pMCk3qC+YgDA2jRBuk8Rn2Qh3FNqlm+oky/oVGG8yAtg/Ov8yB
	FimbDLUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u89zP-0000000Fs8m-1QFM;
	Fri, 25 Apr 2025 03:44:35 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u89u0-0000000Frk7-0HJY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 03:39:02 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ZkJQ059dxz8xGx;
	Fri, 25 Apr 2025 11:35:20 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 1CD1B1401E9;
	Fri, 25 Apr 2025 11:38:51 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 25 Apr 2025 11:38:50 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <acme@kernel.org>, <namhyung@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
	<mark.rutland@arm.com>, <jolsa@kernel.org>, <john.g.garry@oracle.com>,
	<james.clark@linaro.org>, <leo.yan@linux.dev>, <irogers@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>
CC: <jonathan.cameron@huawei.com>, <hejunhao3@huawei.com>,
	<linuxarm@huawei.com>, <wangyushan12@huawei.com>, <caijingtao@huawei.com>,
	<xueshan2@huawei.com>, <prime.zeng@hisilicon.com>, <yangyicong@hisilicon.com>
Subject: [PATCH v2 0/3] Add support for SPE Data Source packet on HiSilicon HIP12
Date: Fri, 25 Apr 2025 11:38:42 +0800
Message-ID: <20250425033845.57671-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_203900_276133_9CDE79FB 
X-CRM114-Status: UNSURE (   8.10  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Add support for Data Source packet on HIP12. Support counting L2 HITM for c2c
statistic since it was missing.

Change since v2:
- split the kernel/userspace changes into different patch
- revise some mem_snoop decoding according to the discussion
- count missing L2 HITM for c2c statistic
Link: https://lore.kernel.org/linux-perf-users/20250408122809.37884-1-yangyicong@huawei.com/

Yicong Yang (3):
  arm64: cputype: Add cputype definition for HIP12
  perf arm-spe: Add support for SPE Data Source packet on HiSilicon
    HIP12
  perf mem: Count L2 HITM for c2c statistic

 arch/arm64/include/asm/cputype.h              |  2 +
 tools/arch/arm64/include/asm/cputype.h        |  2 +
 .../util/arm-spe-decoder/arm-spe-decoder.h    | 17 ++++
 tools/perf/util/arm-spe.c                     | 96 +++++++++++++++++++
 tools/perf/util/mem-events.c                  |  5 +-
 5 files changed, 121 insertions(+), 1 deletion(-)

-- 
2.24.0


