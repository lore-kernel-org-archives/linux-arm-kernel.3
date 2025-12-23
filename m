Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467F0E6F084
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 12:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XA7347+QYCBWw9CqEBlEl7aFZAF+AwSB+q4FGCY9RTw=; b=lXWrBEj7HtgmbwACtVUobUw9LI
	iSU2t9X56OYt798eWNga367Qb/wQeXdd6rUWRwqMboVIyl1y2TmcrwNYkXI2w40J4DcD+ATi5P0aF
	LxYBmQ5M5kd2xPDxpw2pGu253enq/N5R0Ndmfqd7XGvgmzaUiAilnq7LnrvP1Vkc7EEiR885KbHXZ
	SaO2BxX2DPOQU/4CqqtLLJR6P1bacH1RYpBcUFeK8ZNgtOM6F3T5PC0kWVND5exjynrxI45+u+EiH
	eoaoOpj7RUt8MpWNXD3l1LSAZcOL99sBbU535Z1XJ9KLS/6evcBpCnOCTTbWf61NWaoWA+8OQU0MB
	fbrS8WCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1Ci-0000000FOst-2kFh;
	Tue, 23 Dec 2025 12:09:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1AF-0000000FLoc-2IsF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 23 Dec 2025 12:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=XA7347+QYCBWw9CqEBlEl7aFZAF+AwSB+q4FGCY9RTw=; b=TQEyw5GuphQM9HfFwtylZhUNQN
	KJ9Vwkk+wS2fA3Py8EQ8GQi3womoOv6wXPI8pCoCizeYHSB6I9Kg/uVVJ9fsZN6yVZ6AJXv/UKczX
	rjt7Y+DF+jCrZ+s3t///jGTvAmpap7ihY0tSkBTdOOtMhf39rvliSRzLwkAd8tY9/a5no1gdy3mKn
	8SuvLrwNFT/vaCf6yo16XtC2MvcrlPWnod+zsWBSHsyLIg6G50HkJlVE9BYaosb+zXZASvM/BUdlB
	MORfavU55U2vun3K4YwJOollzRhWxj5cTQEU+R8ClJ97oKJJXqCP59iLdCjx5Gib/l7mk1B6f8T9o
	p3K9URFw==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Ik-0000000GhWe-2kyY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 11:11:40 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso4952745b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 04:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766491607; x=1767096407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XA7347+QYCBWw9CqEBlEl7aFZAF+AwSB+q4FGCY9RTw=;
        b=OsGXX8ZfLTJvvDmf/aLPVgfeAzBrC3m5dgi6DX/jQE7xOySN/0mN2YcNri852U1cB0
         esHD2fJND4uL/+ObTjCPX+ZGTNJma0IY1RUfe0ZpbNiNvAVCIjDTF+WfSo5UaF+YoFZC
         jhi5rU3tY5Ai/2XSIyh+39Nu4RhZngkzTqY7jCcLhHpyJdfsCNuMGLcARhn2xFn8tZfn
         90CM4PBMJkorMp2KOgLH3phbuYYAhC1Fkb0dVJv3Nr3oNmjXrjyj/G4woZojoOXg2rFl
         ztpbs+a2LN0JKRJTH42vKrOzjoLT7tMl/9QPZdXADuG4jkHprHoDYkzJAHYNeJI2IJ9V
         A9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766491607; x=1767096407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XA7347+QYCBWw9CqEBlEl7aFZAF+AwSB+q4FGCY9RTw=;
        b=ifiER4EsdV+Ke9hrmdfMfvRd3CgzGwFyxwsGCtoICwPAJCmUvEGMjMNFz/4rpDUHHG
         17J2rdVv53wwtszKExGCyvV3cy4mgjWSFHGUfe4M2lHTnw1k2TuibpJNd1xQReNYDH2P
         AsWEkw6QyAU8VWfQR9Y71jmMU7RSv1VycXyJDJCpTdrJwO6XxbMH4Vz+gv8SPwY9gQ1q
         mKIwvvfy3b5/BrJIwaOvqWmuF8tElTLQl2MgU5vTo5LaJ4Gtqb+XJ3ATkJ2YktwOTecl
         ofBfOzj69xFOeqzzkqFMPgKRx2iWBmeCxyHLE1yjP+pAsRbwgvleO82SnSj+ADLdELdM
         mbgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNhWQbq4MGmWHTeRRX/T0dGSn68HNI6OF6v3CcvzSz3kvcRC6nJTLAUncRQB966HSduiIiSWiX+pll5ITsMuG2@lists.infradead.org
X-Gm-Message-State: AOJu0YzztVB7HvnCJTqkpz8yzx1r+AxKnt/NQmtg/ZDW4uFpqMHheeFg
	YkzsNSCaDvJp7uVcwpg4L2aac6i9r0LR2MqjzXZSCApxtOTJZIp69/VU
X-Gm-Gg: AY/fxX7gikD3CmsMnzFl9aeQlXbjXFistcgGB68DI8gAaQA9cizaRhz4gOoWrk5rXpu
	uaf8YMTHx8bquIKulaXk2N/qiHesT8IKCeJh6Yp6j11y+7ZtYxNEmEgF5LzU13Yskjmkm7OwvZk
	dJ1fUAjYFooqTAyA855yxhUJSVm/JqcS98mQoddSzLVYVsTNxTJhkGSY+iARW2V/409m+QLHy62
	N1eNEcxg1vbU5ml319WOTjcpVqS1h6Z5zBMBnsO4ehlxHFy0dqdxdAiMgJQVs4FAUQfUU91/94l
	F1GMqGorMDj/ycB3nbOrPbrN0qCbi6RGxKwXzplYZUUoyY7S2ZhdC9Iw8UL5Jp39KOJ7BorUdqv
	vcOGwMjjoISeQjbdgHH8SLkJtxdFt6QYg46aHH4RjQ/cI0ycUlUQWNgQs98yrINfkVeReoqyLpY
	igURCaWkmNqOC8JQYkAjCGfzhEjgNxi0Halx0tOM9D
X-Google-Smtp-Source: AGHT+IF4+cdeZ1NC10aAm+KwYgJMNg8RxEb/DoHAzYfPlJtcL9zq4KAq+89VulYJx3AM7dROfEcM3A==
X-Received: by 2002:a05:6a20:6a28:b0:363:b976:8f79 with SMTP id adf61e73a8af0-376a9de5449mr12760926637.43.1766491607081;
        Tue, 23 Dec 2025 04:06:47 -0800 (PST)
Received: from localhost.localdomain ([103.163.65.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a939ea2sm13473139b3a.4.2025.12.23.04.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 04:06:46 -0800 (PST)
From: Lakshmi S <lakshmicar.2023@gmail.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	jassisinghbrar@gmail.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	Lakshmi S <lakshmicar.2023@gmail.com>
Subject: [PATCH] mailbox: cix: fix typo in error message
Date: Tue, 23 Dec 2025 17:36:22 +0530
Message-Id: <20251223120622.4316-1-lakshmicar.2023@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_111138_807667_789CE2CD 
X-CRM114-Status: GOOD (  11.86  )
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

Fix typo "overlow" -> "overflow" in FIFO overflow error message.

Signed-off-by: Lakshmi S <lakshmicar.2023@gmail.com>
---
 drivers/mailbox/cix-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
index 5bb1416c26a5..443620e8ae37 100644
--- a/drivers/mailbox/cix-mailbox.c
+++ b/drivers/mailbox/cix-mailbox.c
@@ -346,7 +346,7 @@ static void cix_mbox_isr_fifo(struct mbox_chan *chan)
 		/* FIFO overflow is generated */
 		if (int_status & CIX_FIFO_OFLOW_INT) {
 			status = cix_mbox_read(priv, CIX_FIFO_STAS);
-			dev_err(priv->dev, "fifo overlow: int_stats %d\n", status);
+			dev_err(priv->dev, "fifo overflow: int_stats %d\n", status);
 			cix_mbox_write(priv, CIX_FIFO_OFLOW_INT, CIX_INT_CLEAR);
 		}
 	}
-- 
2.25.1


