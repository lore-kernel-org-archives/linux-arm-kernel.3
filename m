Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FE0C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TdxIn0BZ6mG5tW5oexMUWl9FnSMl6rOPl062FM+q3lY=; b=KYdW/zL3LHbrDE2ysCvQM/JZAM
	L/14poKYzB5KfezSpcGQ7m6Z+SHGOOav9Naf50Qfr6SyV4r54cGyQrqwQEyv4UOQywl8v9kiwta+z
	yU88/V++RNmYl40XavQpjfJeEDPNtgaLWUeRiVDXg1l+bfpU3REMA88KZ6BH+avSWOkdEWVXu7dEj
	9QsRqLoeoxxJUQBMT6O27fH5qZf5BbqJesh2SMqMywDj8S2Vhd+xuAf+f1RjbZ/9tx180i59aDDYO
	Abhb6a1OwqzoS4PzSX+3soXcATBMb5zFpch3qkzQApXhsyJhqXsUqr3W0+Z9MAbAf29yXBnJG2e4N
	Ss27dryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4I8C-0000000BlOv-2YZd;
	Wed, 09 Sep 2026 13:14:28 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4I86-0000000BlMs-1WqA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:14:23 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso50909855ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 06:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788959661; x=1789564461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdxIn0BZ6mG5tW5oexMUWl9FnSMl6rOPl062FM+q3lY=;
        b=WhjpqvWakJYRFFdItsul4Aam1bLk94uyUbD6zZmUt0DFAZMquT8b5SMwBeSsqzj1j1
         OUObVAYOmfZ72uhgfO0oaCx+9Ri4kvgB+8rKouGx50JmnObUZYl9Cj3gV59hKrkIvqTr
         ecbj9v9TdzgfMOKycPKuKhLrYUYmMqeIkLTZd6IvYbNk5/K+Pihld7/eE6vpqsdQZ7R4
         5b+tkwIVF39vYET11eNhfC6zgJ5b6TWElVtDlVBN6kCMUrUIrmSkmrO/CwocPmiBvDTF
         NkiDmPqTH48AAlZNVnQj3HOhuCVHL5gCKKhJItMyaiOOMjOfzg++qdtoPinSQfN5MBXb
         un2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959661; x=1789564461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdxIn0BZ6mG5tW5oexMUWl9FnSMl6rOPl062FM+q3lY=;
        b=mhcGykm7zb+5X2lR7suHyfrqgGT8gIuiMjjVrfd7wDNh/SA3aefXaRNjmqMktME7/m
         eJAEBc+RK8WdPYJutGn2mtY9qH6sPP6blDMHzIksqlnblKk+jkiUxU+FeW2dITOwuErb
         EsfmVrBsBKIdMtBVpKwdSCYQmZYUOeBEViCXBrDLwu+cgCIfhNRVl7I/3bGfQyFBGLQl
         EorP9JQm8RY3VrSn3Th4GLHHvLx8HMwevu0YlcBZRjWGQzl+J7S1Jlr1XxZ9vl1uO5xk
         TcR/7rn62GvdfdDAOqp/XBNQ/lUJJPiFyCPtB1D2IXoC6GWoRzzSZM5UAcFnMVJ2KxAT
         esjw==
X-Forwarded-Encrypted: i=1; AKwUvBwwcbDb0mxlgWMihvDELX3ePn6DuV6hHiIF6RE2n2BzzIbt6ACo5aE+ut4uypEfxgISWlG5ilNEbcxoY5Iry9gR@lists.infradead.org
X-Gm-Message-State: AFuF++mscgVKNeydduLPJw4AafZNr1Vd24mOsOVQ51jt0d2vrnkNk9Q5
	GNAf+D5hhHXgPMz7tHnYoL4OQ4oxbUOonKfpcki5gSNppPBtaKUFabo5
X-Gm-Gg: AYBFou1cWcPvkvNLUUrK/Cmby3GXVC2wKS0X+IQy98Pj3WG4/xRfrufUBmk9hEhwhE5
	51HJTFDcyKYrAhCyYPvOLcrXS5plN4pgH0apcVzxHuqm5N1keaL/6b4Xj1533EFtf2Hn8i478Uy
	5QpJcPljk84ndEDTMbxZhlMydLBq4P59UwDJ0PZjWg8WRwX0AAMy7h+Kp3vb8ECcXC4nCnl2tDZ
	qnb7zGNPxnbeDrnf0ff7DDI201NTVRz/Wfcgno9LFykKzryePeeHx8B5V4j1vEKuR7BYxbiZ/XA
	RssTPb5022CnhWvPF9WF98WSnsie8PKN2miHMjZich2u+ncR+RIlvUYwPF6zcq4hkumPRjQ3VmV
	CmPJVQTA4InIWWROvZsPDwGk3w/r2m55KU0Zx47Sb+dzIgpUPTJdWQKbUvfE0pO1OgtD+U6e+Pn
	rncb5aa36XlXwob8qK/MQg8pkDt11R4i4MwYxzliHjLtPF5aKU6zxMBJofi88CpylyhS0=
X-Received: by 2002:a17:903:2c9:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2db12147668mr533464705ad.0.1788959660640;
        Wed, 09 Sep 2026 06:14:20 -0700 (PDT)
Received: from zynq-vm.. ([101.71.232.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae8af3sm72283255ad.80.2026.09.09.06.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:14:20 -0700 (PDT)
From: shaopeijie@gmail.com
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	michal.simek@amd.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peijie Shao <shaopeijie@gmail.com>
Subject: [PATCH] clk: clocking-wizard: Fix overflow in clockout0 divisor calculation
Date: Wed,  9 Sep 2026 21:14:12 +0800
Message-Id: <20260909131412.3051635-1-shaopeijie@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_061422_425826_CBDCADD9 
X-CRM114-Status: GOOD (  12.73  )
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

From: Peijie Shao <shaopeijie@gmail.com>

On 32-bit platforms (e.g., Zynq 7000 series), parent_rate * 1000
may overflow, leading to incorrect divisor calculation.

The issue was first found on Zynq7020 with "parent_rate=1GHz"
and "xlnx,nr-outputs=2".

Cast parent_rate to u64 and use the ULL version of DIV_ROUND*
instead.

Signed-off-by: Peijie Shao <shaopeijie@gmail.com>
---
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index edf8c0eaca27..5abbc6b83b72 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -881,10 +881,10 @@ static int clk_wzrd_dynamic_reconfig_f(struct clk_hw *hw, unsigned long rate,
 	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
 	void __iomem *div_addr = divider->base + divider->offset;
 
-	rate_div = DIV_ROUND_DOWN_ULL(parent_rate * 1000, rate);
+	rate_div = DIV_ROUND_DOWN_ULL((u64)parent_rate * 1000, rate);
 	clockout0_div = rate_div / 1000;
 
-	pre = DIV_ROUND_CLOSEST((parent_rate * 1000), rate);
+	pre = DIV_ROUND_CLOSEST_ULL((u64)parent_rate * 1000, rate);
 	f = (u32)(pre - (clockout0_div * 1000));
 	f = f & WZRD_CLKOUT_FRAC_MASK;
 	f = f << WZRD_CLKOUT_DIVIDE_WIDTH;
-- 
2.43.5


