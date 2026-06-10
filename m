Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961CBCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 03:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QCY5Uiymy7Lwj+bl9lGJdGEWJ7fAXjtQf2ir7UED5Co=; b=RwoVYEo3tcudiNiYFdamfdtt6v
	MsVRLf6WtOxTgPqdIem0L9ZttPYk7JQZrFcEoBAwWi8sFIvLwYzPkrj1z300z0nbfsC913YL4o0z5
	kvA001qlcp4he+1f9Z7tE5Kzkmmvn/gnmZd1yml6Jp428i/fiCQ2wSJN/fYhnodag9Pe9lwPaR11B
	v/hnGQmyBpYgXRYIlGdSJ3JAJaAnIs4O5Z8XT94wsbzFaB+32b7zQm1E/Og9Tmga5H37xIenbleE8
	SvOtRTmJGx3kFAYc6RvKQOCGS88tDcwB/1hUh+F2kkMPEaaEjmtd39hN+bUYEOKpoJ2+L6QorbZQI
	h+2qnqKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9em-00000006kSZ-0P0y;
	Wed, 10 Jun 2026 03:31:08 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9ej-00000006kSD-0e7U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 03:31:06 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8423f420455so2648137b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 20:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781062264; x=1781667064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QCY5Uiymy7Lwj+bl9lGJdGEWJ7fAXjtQf2ir7UED5Co=;
        b=YsxTc5QbgHpEotg9xOgjFvNzOD4RyHzA/Kp8jXNnU6Tw0dwuvPMqZDP+uEF2X+WYYp
         qMZZvXCoMtbnlv32EWtGeKz0txHHFkjs2PhO3pcei4LPxDGWbiFHHg4ANaIREyZmWQrH
         t1zdv86H/igcFyThNQG4JR1t4PcA3w3GNVAuvS+BDCEXijs6WdFEvsps/od7liYnxxM/
         kGwJmwLrJIpurCu29Nj8qAVhmu4ZaCvgWTk9d7XYVA3HQlGDcVVyGFaTveuWxKeDJLbR
         WKJu87YWAl38va9xlzwj6DwD3HOWX5/Y3LgBvUuFcXkehqug6+A6sw8aNLZ4K2axDMuT
         HDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781062264; x=1781667064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCY5Uiymy7Lwj+bl9lGJdGEWJ7fAXjtQf2ir7UED5Co=;
        b=EvPX51526RCLmeHnbT64pMyVqVuwaUKOxrbEy6UyxDYSF5ZwqcmenF+QeeILlQuqOT
         C+cwDUGwNG0QEZ9qEIIdv8zUmICwpKlkIGAtv5H5GNd9HV3xV83Piau5D4MfCg1AMjpC
         CnjqfARGBpk8u8JR1XaR9LyT9D8AE/vbX98eL8uz64AY2gXmgilaMLLhvTvoq1YCRWAo
         IT+xyubufx+9SCj4NoubISuPMKq8+tFjJCfgndZ0or2nzTv+HsunWU8TNCtk/HH5Hvxz
         B+U1ZiF4sJo5+LBNl2ObZeUE9AbSgTVHOXiU7sRckvC3PiteCCxOl1K5ZqaJ1puNuJZc
         TUQA==
X-Forwarded-Encrypted: i=1; AFNElJ/etwkHtP1f3FnTK8PTjWKyT2tixlFaMEBCBuWNap5RbHOstOlvw4c1Tes6dqX+pZh7eiGC8CQaJLJmeRaIWZ78@lists.infradead.org
X-Gm-Message-State: AOJu0YzFJRhLns+/A+RDgI2RGJFiew6UuLMShho9TKyhLYDLaaaXROd7
	O8AQy7PM/BeXCs2E+dC0hkSdyK8f/hl6BWR5kMW2k+dcgy3OtboJuRUb
X-Gm-Gg: Acq92OG0uRcNcfTB2oNBlGaIjv8FFVrHZiae07Doa3vfBPPrsiwh0YXjbX8owyEkrAn
	GZ1xHpOA9U81zIkGdYQ+MdsAr5UAynZo32GQHHH9sCt1rLkQfCkcUg7b/pKmesyVfxW5F8hevqX
	FgddEZN3w9DLcQCef8WvDGZEO7mTZeL6TD93evFIFOuR1YGyvukrBC3PTWx49SK7MUpn81Vd5DI
	t1WiQNh8SvbUocxycw6Ci0V9FGMnToJS4A0VkoyCbE1NZCxU5e8kbOAnr9UFfIt5oCdYVLH0C1s
	TcGA7jjwiQkqog7uqHprj+QEt31rV9mm4YIad9ZQ/1MzGr0xjbE/55CUiaEokxCpT0wAFbbkx/8
	CIn+T52AsNVw0FZFB6KIy7CRH1hH7axhQ+pYvVyCK13ZOIa03M30S00dDiHCRjxLg2YxCVAM46L
	RUufv4JS5Tsrf31ackPzU8TqgabXj69sAR+ZXZV7R4r7QwZzS1+3LUOHAMvfdxG+1Q7w9SlaEHr
	+tE47+zgkzLfVaRRIDw4tK1hJrTeg8UsB0CiSCpDPQL6axqH1WvSA==
X-Received: by 2002:a05:6a00:1d8b:b0:842:670d:f6ff with SMTP id d2e1a72fcca58-842b0fffad4mr23039121b3a.44.1781062263958;
        Tue, 09 Jun 2026 20:31:03 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e1e5bsm22455084b3a.46.2026.06.09.20.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 20:31:03 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH] bus: vexpress-config: fix device_node refcount leak in vexpress_syscfg_probe()
Date: Wed, 10 Jun 2026 13:30:54 +1000
Message-ID: <20260610033054.2117363-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_203105_203179_E81D0648 
X-CRM114-Status: GOOD (  16.19  )
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

vexpress_syscfg_probe() iterates the "arm,vexpress,config-bus"
compatible nodes and, for each one, takes a reference to the bridge
phandle via of_parse_phandle():

	bridge_np = of_parse_phandle(node, "arm,vexpress,config-bridge", 0);

bridge_np is only compared against pdev->dev.parent->of_node and is
never released - neither on the "continue" path when it does not match,
nor on the path that calls of_platform_populate() and falls through to
the next loop iteration. Each matching iteration leaks one device_node
reference; the leak repeats on every probe (driver bind/unbind, module
reload, or EPROBE_DEFER retry).

This is a regression of commit 557e37c05f28 ("bus: vexpress-config: add
missing of_node_put after calling of_parse_phandle"), which fixed the
equivalent leak in the predecessor function vexpress_config_populate().
Commit a5a38765ac79 ("bus: vexpress-config: simplify config bus
probing") removed that function and inlined the loop into the probe
routine, but did not carry over the of_node_put().

Use the __free(device_node) cleanup attribute on bridge_np so the
reference is released automatically at the end of each loop iteration.

Found by static analysis tool CodeQL.

Fixes: a5a38765ac79 ("bus: vexpress-config: simplify config bus probing")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/bus/vexpress-config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/vexpress-config.c b/drivers/bus/vexpress-config.c
index 64ee920721ee7..cc247483d3823 100644
--- a/drivers/bus/vexpress-config.c
+++ b/drivers/bus/vexpress-config.c
@@ -390,9 +390,9 @@ static int vexpress_syscfg_probe(struct platform_device *pdev)
 	}
 
 	for_each_compatible_node(node, NULL, "arm,vexpress,config-bus") {
-		struct device_node *bridge_np;
+		struct device_node *bridge_np __free(device_node) =
+			of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
 
-		bridge_np = of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
 		if (bridge_np != pdev->dev.parent->of_node)
 			continue;
 

base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.43.0


