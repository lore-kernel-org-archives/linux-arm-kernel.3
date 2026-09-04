Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9011C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOMrL5pgvFhwSvByI+4qlT7MXoUJL5NjWpFqsiJ9Hnw=; b=2lAKyP9CjLB/gXB12+WUmr8WY1
	OS+1qcRgUTg0k4q/XYNRVMFDfkvvhH0n+62aLs/CrAJ5Ze6KKUVMsB+EvYZTISFOm4wh7YQLDogvr
	Zh657rZHnLojjlian7MBlQ/FAFQmTyx2DsBEpm8lDJEjKHuOs7IfB7/wF2uXnRAGr2yrpZ15xs0TB
	bSmfP9Rm46ultPZioI1bWDum9J8ovrHpBzWcgjVjccUVei0OZWt4xiVhj6vXKx7VNE4Vo1SwBO2QH
	wVP0p0+kaVP4F6IKlqzTf/62sp98bqoYcBqzwqr2WvtAv1Y7hnClY7+2m3zIopCyMhuzes321ohzu
	c+ykfiNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ud5-00000002L5q-22UR;
	Fri, 04 Sep 2026 14:10:55 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ud3-00000002L3v-0wl7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:10:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso8798135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788531051; x=1789135851; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOMrL5pgvFhwSvByI+4qlT7MXoUJL5NjWpFqsiJ9Hnw=;
        b=eKX9zoQ5yERqZcjTcUYwGTpKbg0EB5GL277xyX+Vwu5gRKwhNLnGbvUkpNqp4rxe8+
         NZLYPXpBqEJB4wQ45LdsywHUrcCJBvSDlN2RXZmeRzyjY/+SZv2o44X4Dh73vj/0kG3l
         /Aev/vkt+rc86EqNJCxlY7tLKop7zuCrbvjuI+iH5APTqVVrScVcGw12Ym7vZl/MFGnM
         KE+3BnDDyi/geLe8y/QlJs1l5QYOlZ6Nl/xGAqBrjOwvLvLUAEGsb21ltCTCjlIKx2OZ
         qJ4VIRkCYV9FY0EYlFvwy6qdZWVESgp+7UsRR8jj2te+VBKCmOMgFHtHpQLbZyuzXafT
         7cKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531051; x=1789135851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOMrL5pgvFhwSvByI+4qlT7MXoUJL5NjWpFqsiJ9Hnw=;
        b=PiL3lIJCE9xXgdk7gEW4Z39geOzIy/YxXDE65n+3rykn7zP74O7F3JvBxzowslsheW
         RvXYshb59JfjeBQ5fYHu8mNavqCWUUOgouTN5i6m2w+yxiiM72WJwy7e8RIGrIf80QqA
         UNAsxoNiYyhMWd/e8mTA6JB/szUvrpKYvYtiOPV+iNitKsIp80nHOzKvjqLvGFmR+ZqF
         dUF1EDAjZ61NmUbWwElFeOSbsE/UFmmxamiOoTrNl/AysGZyq3nmaV9uEChXjTBaqDp1
         U4sAgOvJDQMWima3dBVVLtRPX3GK95ZaOjPWX+xSMqNPGkumvjGN3VJw/c+4S37wyOEq
         etYA==
X-Forwarded-Encrypted: i=1; AKwUvBzYnzZqtSQbAPqZdSnWPILuKAD/q2mrl0KyM+eVssX73aHKCLlC/E0p68GTltUwKThvYlg2z2eljybQQxKCALJI@lists.infradead.org
X-Gm-Message-State: AFuF++kwtDL60ciYuyRx+HB7He556JKSoe+bUiwZu9jYuVFlLXrir6OG
	RX8n4W3kSz6kQ9+fRD4XEzfK3md+mXVNw14xbiNKfp/Vd6wkRrYUdPdMoU3luxLnPHQ=
X-Gm-Gg: AYBFou1ba+w3mJqDn7i9sm6U3+PG2Z/Azi69+6Ijhbn/zJo6Cz2nbr1BAy8opgl8IBb
	eEGp+eyoiH/jyRPlq+ymK6rz30Ue14m9GzE6V/91hILi1iPL08epNYHng6NFQ4keJdaeWJcjT7e
	KF1V+3Kv5XKyh8ApJrORPiVfECKyzplDVxwFFDlAAy3BPahL5aNslq3RCzC5ZgvNODtcvr4k1qc
	Fh8Ex9U1mMt9+LQ2Vsn6gfiyLgQAljySshA2Tu1F/iRrEQh6dxmv/X0lOvWpdnFrROtrU0WvcE7
	tNQDDRibbQxdMOtrOr3lpG5Ev36GANsW5vt8v6aA8GiYCuMJM0pv/e3XATAOKSLVrdizg98+Lk4
	W0S80TPDf8GE5RqRjZ9gzAtgQZyC8ozbryQwiMPS2g0MV+QEOv7tXarq/Z1t7aaPRyzhvdF5hBJ
	XWMgde/gLE4WzwCAMBO2UNkErhGsjZCrEcI/L49k//qLRblP0ahyPzfRFhrhqRC0z23mA597lUS
	CO0bA==
X-Received: by 2002:a05:600c:3511:b0:49c:fa20:cc01 with SMTP id 5b1f17b1804b1-49cfa20ccddmr48051785e9.24.1788531051262;
        Fri, 04 Sep 2026 07:10:51 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm138287045e9.0.2026.09.04.07.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:10:50 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 04 Sep 2026 15:10:43 +0100
Subject: [PATCH 4/4] dma: xgene-dmac: use named initializers for
 acpi_device_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi-dma-v1-4-0fcc63d65d4b@thegoodpenguin.co.uk>
References: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
In-Reply-To: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531042; l=1006;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=6+l3T16YqBoRlbABnst1+TqgdnjDEqIeHNaVG4pj+9I=;
 b=1/UGTl9qld09cFRhCKZNZevEkztnHBWqKduXD1tX9YhzELe4Wk3gFziz0npmX7vUgzAuy4qFd
 fw3G4nKijjXCWmhBWW9yq9WNMTDI/f+Md4KBbsec71lteOOf2SQDUnU
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_071053_287687_665BEF16 
X-CRM114-Status: GOOD (  14.12  )
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

Use a designated initializer for the acpi_device_id fields
which makes the code more readable and consistent with how
lists are initialized in the rest of the kernel code base.
Also drop explicitly setting fields to 0 where it is redundant.

While we are at it - unify the list terminator to have
a single space between the brackets and no trailing
comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/dma/xgene-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index fa1173e49900..8d1c58ca0d48 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -1800,8 +1800,8 @@ static void xgene_dma_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_dma_acpi_match_ptr[] = {
-	{"APMC0D43", 0},
-	{},
+	{ .id = "APMC0D43" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_dma_acpi_match_ptr);
 #endif

-- 
2.43.0


