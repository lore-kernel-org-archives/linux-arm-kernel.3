Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0DEC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 10:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2hOyG2nrHECF3VQfVstDdXpYoOnMejT29j+W3a7NumM=; b=aSfC5iVR2UENJqJoSrCo7XbwXv
	WVst9HzDf0wEKMyJD151vplClJOWMGAvIg/ehUpnP81o+7EnvxhxqmEADCN7jtFh6TV5A9eQ3e56X
	Oc+dO8DH9MYK1R8WFBiFSMXmJyjDHQPtY5d48HU+s7AmfD8YLU101TUMHEYgWqNhZvo2sRNB/hG/G
	G+4n5Bldssh3a4QWFHoPQDV4Lv3hGuLes+r0mrjvtGQtfHFGrD0+ML6AyiplIMlAB49rjhZ6iZmNW
	eb3NQh9JQOVeFt259y3A9+XbzGKQXYiV3L7YuorDwE3tSBPLoaAXzTqa1SsxAF3t2SbyG2A0ZrqWi
	1gMo7XKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ke5-00000000lLF-2OPb;
	Sat, 12 Sep 2026 10:07:41 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ke3-00000000lKt-23m3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 10:07:40 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so3830605e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 03:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789207657; x=1789812457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hOyG2nrHECF3VQfVstDdXpYoOnMejT29j+W3a7NumM=;
        b=Y+zpXFGCRCKI9PzK03QuqQLgu8r08bFMzYjS93EP/iFSWCFUK+0icsNmh4GCZdUC1h
         4F3zyzypnCiG+2eFWKcYc3wQnl1viFQWP7MoKbKunaRVleWGk8l4AlX8cyMLUNS88XJ3
         TCWeJIZByOiQt04/0lYuDHe5OHLxkFuRRUsdkmmf+8yHqlIGcPt9tejiLa4kTVq/8z8o
         gXPzl9x9ZXQj4HkEwPFHCRn8aTcCao5YK/Cqk01GOOVjwO3keq/hf3liI63qZNBtxZ8Q
         OjD070jxq7PnkMmZD7p9PH3T883Uzo2mgOQ0py8Ys6d9buuWZO7Ao98aAuVk2jPajE0g
         afqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789207657; x=1789812457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hOyG2nrHECF3VQfVstDdXpYoOnMejT29j+W3a7NumM=;
        b=bRrZ+V/Skx5VbaNeAFIPqggT7KlEoRgPPDsJMxWQP01ptOQxg/NQRNKSNaCgDkdUXc
         wpTJO19K5eJuljms9kjrMGtqjaCKIsshAruD8DqpBL652VKO16GhPkmKRI7QQtdOw0K8
         y0f/zJQm0lIZV+oOFkYhL06HS6G4a+pXBdo66ckQIHu8yo8/Dpgwxx3hkovZ1zUVZKQU
         MVKQR62VN45hWJrvkZO8+TSR9JLX9OA1anSiqLg9hh5oXspRn8QPWEzhyq1XItZ6u3ba
         9vc6rb12E4/VFg7zofn/UCtLDCsislOM9tOLbm874N9EQ3c0VUjpxfcTkIYfqHj/2cuZ
         JIEg==
X-Forwarded-Encrypted: i=1; AKwUvByaKeWZw1UbkWqUFxelES6wfQSdmxS85sbzgA2bK/wwAuzdm8EIkw3QvPWT/li6Dgc7AJUty67vOZ8aAgE803eH@lists.infradead.org
X-Gm-Message-State: AFuF++k0IJ0ilo9DudX3vRqnlSKm68m2Tm9M9KcC3sbdbfiJ1iAPW2sY
	RYQ8CFI3K8wy+HSmlP2O9WvGHZpw42wEcW+Jc5Ji4BKPtkdRMA7XqFlD
X-Gm-Gg: AYBFou20Thv4WxwSAVPDFtSyml3EpE2/gEX92AXTUXDBXmvXNqZ5xnGHaGRM5zRV7G/
	E1N2xtsxDkaotjNTsM6B7tnuPiH57AuiGhD9GbtK0hDmGRS3QgEN4QPrsN61W89EWPnWMNgjUfx
	iFl4mf1qzflRuiA9IYXQXysT60DFRIQ4jvdJKSQXPewyLqhdoYawSPBwFSLtQzLrZspSzDMNI1o
	BVI6zkJbu7Fjsy7fz7L74mozoRgG8uv5qJtq32PDXrQwdUT5IP7gLLgSdOLOe5yThM++8BeQoFa
	WVYh1LnHt0oFojvFqWBvnjjmkEG6mXgLGedJtED1FwNUnhUZWQ1W+YeuseAcZX52Kxqu0Tc1jsQ
	0ZYxA8Sd63TIKGl3cN1tjUF6/AxephSvMP7hitcJWSmGonzn757yjxe2xcceXvkRTCOsjvE0l4o
	+M1WiMZ0HVsH38yHGIHvciDYYEQS1fqkPm4hY8Z64osI4bKqeLPMtb5irwn7+ky/GZRkBbZ6PyD
	4dNT6wgAO4GuNvb3AqvFpBCV0fEm9NjqdjecUoX/W+ZYB5/lOJOnxtOA/FNlscv3lvf7u2M0JW+
	zCWT80CyCs9NMBfGMhjLaFJpjyThJ2ntf3l/zd2PAvboPQBSq0f319JpxQJkcTdRf0zQAqsTZ4I
	OWA==
X-Received: by 2002:a05:600c:c493:b0:49d:2607:4ada with SMTP id 5b1f17b1804b1-49e619bf31cmr157482605e9.14.1789207657237;
        Sat, 12 Sep 2026 03:07:37 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm164341085e9.2.2026.09.12.03.07.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 03:07:36 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Tao Zhang <tao.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ABI: coresight: tpda: Correct the kernel version to 7.0
Date: Sat, 12 Sep 2026 12:07:33 +0200
Message-Id: <20260912100733.86226-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_030739_562781_5E26FABB 
X-CRM114-Status: UNSURE (   9.79  )
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

Nine TPDA sysfs ABI entries name kernel version 6.20. All four commits
introducing these attributes first appeared in v7.0-rc1, after the
release following 6.19 was numbered 7.0.

Correct all nine KernelVersion fields to 7.0.

Fixes: f9cc5b5a9e9a ("coresight: tpda: add sysfs nodes for tpda cross-trigger configuration")
Fixes: 8e1c358a3b0e ("coresight: tpda: add global_flush_req sysfs node")
Fixes: 33f04ead7c49 ("coresight: tpda: add logic to configure TPDA_SYNCR register")
Fixes: a089d585a7f4 ("coresight: tpda: add sysfs node to flush specific port")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 .../testing/sysfs-bus-coresight-devices-tpda   | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index 650431feae45e725d4cdcc5f029a5d2a908ca2ed..0140ac97725e063c89a5d36a2ea5ae918ffb606c 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -1,34 +1,34 @@
 What:		/sys/bus/coresight/devices/<tpda-name>/trig_async_enable
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Enable/disable cross trigger synchronization sequence interface.
 
 What:		/sys/bus/coresight/devices/<tpda-name>/trig_flag_ts_enable
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Enable/disable cross trigger FLAG packet request interface.
 
 What:		/sys/bus/coresight/devices/<tpda-name>/trig_freq_enable
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Enable/disable cross trigger FREQ packet request interface.
 
 What:		/sys/bus/coresight/devices/<tpda-name>/freq_ts_enable
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Enable/disable the timestamp for all FREQ packets.
 
 What:		/sys/bus/coresight/devices/<tpda-name>/cmbchan_mode
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
@@ -36,7 +36,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpda-name>/global_flush_req
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Set global (all ports) flush request bit. The bit remains set until a
@@ -44,7 +44,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpda-name>/syncr_mode
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Set mode the of the syncr counter.
@@ -54,7 +54,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpda-name>/syncr_count
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Set value the of the syncr counter.
@@ -62,7 +62,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpda-name>/port_flush_req
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Configure the bit i to requests a flush operation of port i on the TPDA.
-- 
2.39.5 (Apple Git-154)


