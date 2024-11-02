Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574BEE677EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 08:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h8f4dWec77U0oSAZ6eSzsVZbgWnhbkE3ElWrbp4Lhl8=; b=iuz99ijW4OUpzKMn3WCA4zsmVa
	ZTUi5hUSYPjR7MYWR2SQm0b8o1iMU1dDX+9OIFN7jfEk+p8aDe3b45Dji5KzT2Cq+0eT8hQszM4jF
	FjDy1bZ4aksSIwXCvInpPEOsvIbAmToygs+kVQcDCHhqQ2k15k9Wc1Myixy/ZGQ6PeMofeQxGiV45
	7EduNvj6KhSJ/yS8kvXLJD33IWCOdDi+YWnQxcbgtZn4GmI+ue63G+XDzhBmU1PGMnA8IdV0DBS3M
	bDaLUWQSfW1o2/wZ4SMNwbfF2sG3MGt6joKJA1Qlfzr/v13qEWiUh2SDIX39UY+bd3KswT6t0ZM+c
	MgAP/c4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t798R-00000009HBX-0WIW;
	Sat, 02 Nov 2024 08:05:27 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t796k-00000009H6O-3dmc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 08:03:44 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7ee4c57b037so1593687a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 01:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1730534621; x=1731139421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h8f4dWec77U0oSAZ6eSzsVZbgWnhbkE3ElWrbp4Lhl8=;
        b=rPd0CIVSPtSqME+iyOxYnVzeMvF2mbh2s3jqJMATNdz5MwMndKWbnK28VNJisHdLyz
         owO3aW2oBKNacmKJUt+yCmLX2XxJspvZpv4Zj9K9StWTvpdNfQ4ewD3hS8YcfLAXC7vV
         Zbt+OOztuNid7mp3XfdZaUsuTjiPoFqN63lnq7HDuEL5MrUCMGYTN7X+zEcOYPeUfcAl
         Lum3/rGAXPXnXnBppVywL0X8wJLb/rRov7M7Cj9noFEkv0Lq+v2k+JbrsZGxKjmm1Y1F
         i26nYkrQagfl/bPp4tcLo3+8V48xImrI+gCkMRUoNM2hDZEwUQr8yjNHvWmSWgwcTSAa
         Wfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730534621; x=1731139421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8f4dWec77U0oSAZ6eSzsVZbgWnhbkE3ElWrbp4Lhl8=;
        b=QEhhQsUzKIuCWALQEHFidRRC1IR/mEHL1L5Re/rcTWUBtFTrOzTo5A8aZeTHVayb+c
         iTT0madUcne9yw1z079TTKnQL0z4GiSpMOwvd1iqHfHaZrrE6hI5omtW2boaxUsuc8GS
         dCqyfN7H2MXhKpO35pXwrIjyHLsQRippDf+tjkOPlqCGN1/Bj5WMjvQ0KMcigwZk1ox/
         IDTtXfQFH32njDt7RQzGW79o15/pfNWSzrW2L/aoGKu8C+1dAWpv7v4BQDwALigmz2kB
         ZspTS5K14SvvaBTsbfeJSvwMU5DEU6nlYaM7nX7FC+Ni9WnWUM3mrH11jLx8eWuh9vWs
         wQvg==
X-Forwarded-Encrypted: i=1; AJvYcCUzhxKjoJbKf7ZNOnXYhO8y9y9hSoOpguKMvGgszZ4PWjL0PmzAFapZDHtzU1233oHXGPpEEN2AMXlyMAnNDWTS@lists.infradead.org
X-Gm-Message-State: AOJu0YzIdfKfgdTZ3IpMwf+/V7KqYBX7aJH5mSqgz+saDFaeSdfGspRy
	0UU040uCreHJNxw4KV6E1LeayjixdJHtJdAgZ2oDLxMANpzLuWa6UWvW9/3E57k=
X-Google-Smtp-Source: AGHT+IF3H7cZ+HJeD4ziQiiBOLpjlYgccAMsJGr1Z3V0OvddcCn5wSC2MXrIesJ+VZMbFq+fQHF8Ww==
X-Received: by 2002:a17:90b:53c5:b0:2e2:9077:a3b4 with SMTP id 98e67ed59e1d1-2e94c29d0f2mr8712323a91.7.1730534620753;
        Sat, 02 Nov 2024 01:03:40 -0700 (PDT)
Received: from localhost.localdomain (133-32-133-31.east.xps.vectant.ne.jp. [133.32.133.31])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92c54e6a3sm4415306a91.1.2024.11.02.01.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 01:03:40 -0700 (PDT)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	michal.simek@amd.com,
	hans.verkuil@cisco.com,
	hyun.kwon@xilinx.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] media: platform: xilinx: Balance refcount to prevent memory leak
Date: Sat,  2 Nov 2024 17:03:27 +0900
Message-Id: <20241102080327.463134-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_010343_196018_6AE3BD01 
X-CRM114-Status: GOOD (  14.34  )
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

In xtpg_parse_of(), the refcount of the device node "ports" is not
decremented after loop. This commit makes sure that of_node_put() is
called on the device node when leaving the function.

Fixes: a5562f65b137 ("[media] v4l: xilinx: Add Test Pattern Generator driver")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/media/platform/xilinx/xilinx-tpg.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index e05e528ffc6f..bb3ca16dd47b 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -718,7 +718,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 
 	ports = of_get_child_by_name(node, "ports");
 	if (ports == NULL)
-		ports = node;
+		ports = of_node_get(node);
 
 	for_each_child_of_node(ports, port) {
 		const struct xvip_video_format *format;
@@ -731,6 +731,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		if (IS_ERR(format)) {
 			dev_err(dev, "invalid format in DT");
 			of_node_put(port);
+			of_node_put(ports);
 			return PTR_ERR(format);
 		}
 
@@ -740,6 +741,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		} else if (xtpg->vip_format != format) {
 			dev_err(dev, "in/out format mismatch in DT");
 			of_node_put(port);
+			of_node_put(ports);
 			return -EINVAL;
 		}
 
@@ -753,6 +755,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		/* Count the number of ports. */
 		nports++;
 	}
+	of_node_put(ports);
 
 	if (nports != 1 && nports != 2) {
 		dev_err(dev, "invalid number of ports %u\n", nports);
-- 
2.34.1


