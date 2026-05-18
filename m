Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6F1CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hl/m7s8+gdhaAEkK8F8CgPM1JiiK905rKoY3T49KXgs=; b=ea8WiXNBpft8udLMAYK5jewFfO
	Nbu2Ud+S4lLTCReSde4kqQ0cfkao1oHoD4ikD40sL6Pq4v8iuoIJvNFt0rghNT9+0G8tt6OJ3fZYI
	ZBBURL1vH3aKKZfZcZW+vdNNmCTdFmh/C/jgzkveieAol38lksdBnOjBWZPRxrO+X/68zFLsj9uu4
	XB4k6lUwXyvTYzJgKkrp/bQVl3ZtlOkPBRPmHR1lpDfmD646bfKG/D8DHNUaGSKaT6zsI908J2gjw
	D2sFjBEkrxDOG7C0fy/YOIp7qpXKTZx3Wben2WAHtVIynJPG9YFOJvBK63aajFHpiSJHCD40bSNUI
	5m2EHmwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvcB-0000000FKhj-1gaQ;
	Mon, 18 May 2026 10:54:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvc8-0000000FKgN-1sg5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:54:25 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4891b0786beso15096725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 03:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779101662; x=1779706462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hl/m7s8+gdhaAEkK8F8CgPM1JiiK905rKoY3T49KXgs=;
        b=gs3KWbJ6KrQUNjarRbT615ZBqhNDWfNK1QButBe43d0G8ZzATI5VB97KsDEoop/R19
         ji0KKw0B0nzErdQ7nZNh6ctcctiCDyRXKFaft773DjGEiIjcaAHWUOYBD07WCsyUI9tJ
         DZ1dOWjC9TBIWiGTJDV9SuL0D7TOn3tB5ISnvysMec/Xj1qfjyzThDdcm5R+aDeXT5hi
         AMCbXKWSLwV7TEzSiHqkpKMejHPypl8p4Y4ZE4caLQzMqQBRhtZZS7FY0rc8TFBt1xOf
         bQ92toL4CwVdJkihpSaR1LilUDYBkVqSwST+HaNfzfMIbFY+N5ZnyHTh/i2js/PjoqDV
         mXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101662; x=1779706462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hl/m7s8+gdhaAEkK8F8CgPM1JiiK905rKoY3T49KXgs=;
        b=ofrYWY84Z/27f5cxSpIs9MOT0pMYRasbN62sR1jmEWG/nNN7custoNOdxBwKwQHA6H
         QPifSzFRpY6mBA/57UuDxrfDjqqk/b4y+jjt7HD83vjN3kNRhdLWWiDDdqPyyzcGj8Q4
         0fLKBG12x8G2KhbXwTDi8E/Y+3KMSnMMEB45mK2RhRWJ5MTploFyuCCj1gxE5bCpZ8Ru
         ZyNBIS7n98ST80UpC/C63clfJMDn58hQQwU/G5Kk27Ymi70sQFiulOjxtIzf+12wj9UU
         eXW10arzB1k/QjfMAjjJREdU9c/q4Ebsp7H0HJNI7talQaEMnNReIQiGpCsKHOig6eRN
         f2+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9l5Ww+aAbYAU8QmcQasZiU0nDmYWcQDjAqFOnejSJs3+iYuCn8LYnUBv0wUE5Q3YuePjgFQOFB7TzSCf4kDMyV@lists.infradead.org
X-Gm-Message-State: AOJu0YyjrJmWZw9NXNCcVdQrwkp1fbhYI9VXzjUb8Oh2qfPtImr4qkn9
	jbnI8KrUoqwZNYp/tzCzoT8oTtXI8Q0P7qUTtaz76prpgHS7oLuyt7FnZR08
X-Gm-Gg: Acq92OH+2oG+NZYL+Dd6Xl1KKMCNyYvbycMEoBx9EyjNEFtXziHA3cs1YwFI4SxtzF+
	UwkKgIhlRN4y4j9wxNwA+SqDRptF7U4cG7+MVcr7ZwCpKqmzGzMWUv/BmPJifSNoNZJeUQgC3/n
	Dzjb+6ZWVg7h0dELhH587Jc6uJHsPP3/zishefuzuX3JFJklTtDnFl3FfFGR9si/sp/fwlX3x1D
	pRjU8ERvACdox7+4SlaiRwa6CY4NINh69GKhIi+n19vrQsk3IOl8a+ruzBWFtgOP17FLkDNwOjW
	qsgBrbZUmiXC9SSBsk//mB7VB3rgT4/lcmscmOfHERbmoC/H/aEhtlFwnFjMy+dzE3iJtlN0dqf
	AqgfdnU53OUUNGHXC7q8WEy8spMxQmNcGsn+P1b6FurvXPs513+eHmmmxu1LPkT+k6dfXzfSkmH
	i4htLGI8TIJwOYMwlC2+tny+lHmSJ4piXKmSHMJi9gcuHA9w2S44SG+OadRASfoMYQibZ3fljcg
	g9eK9Xtso6xVA==
X-Received: by 2002:a05:600c:c0db:b0:48e:8499:4be0 with SMTP id 5b1f17b1804b1-48fe60ee481mr163456935e9.15.1779101662049;
        Mon, 18 May 2026 03:54:22 -0700 (PDT)
Received: from localhost.localdomain ([151.57.14.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694f2csm249429345e9.4.2026.05.18.03.54.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 03:54:21 -0700 (PDT)
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
To: jonas@kwiboo.se,
	detlev.casanova@collabora.com,
	nicolas.dufresne@collabora.com,
	hverkuil@kernel.org,
	mchehab@kernel.org
Cc: ezequiel@vanguardiasur.com.ar,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rkvdec: fix PM runtime teardown ordering in remove
Date: Mon, 18 May 2026 12:54:13 +0200
Message-ID: <20260518105413.42147-1-pavone.lawyer@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_035424_503704_B452F51E 
X-CRM114-Status: GOOD (  13.41  )
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

From: Jonas Karlman <jonas@kwiboo.se>

The current remove() path calls rkvdec_v4l2_cleanup() and
pm_runtime_disable() before pm_runtime_dont_use_autosuspend(), and
frees the empty IOMMU domain after that. With autosuspend still
armed when the domain goes away, the VDPU381 can be left in a dirty
state across module reload and suspend/resume cycles.

On RK3588 this surfaces as a VP9 inter-prediction bug: from the
second ALTREF frame onward, motion blocks decode with U=V=0 (BT.709
green), while intra and static blocks stay correct. Reordering the
teardown to dont_use_autosuspend() -> iommu_domain_free() ->
pm_runtime_disable() -> v4l2_cleanup() makes the symptom go away.

Tested on a Radxa Rock 5B+ (RK3588, 8 GB LPDDR5) with both the
libva-v4l2-request mpv pipeline and Chromium's V4L2 stateless
decoder. With the fix, 300 random pixel samples on VP9 Profile 0
clips at 1080p and 1440p match a libvpx software reference exactly
(worst delta 0). Without it, the same 1080p sample at frame 4,
pixel (960, 270) reads HW=(0,112,0) vs SW=(204,147,116). HEVC and
H.264 stateless decoding via mpv keep running on hardware with no
fallback.

Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Tested-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 6f5f0422d317..bb95b090a25b 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -2066,12 +2066,13 @@ static void rkvdec_remove(struct platform_device *pdev)
 
 	cancel_delayed_work_sync(&rkvdec->watchdog_work);
 
-	rkvdec_v4l2_cleanup(rkvdec);
-	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	if (rkvdec->empty_domain)
 		iommu_domain_free(rkvdec->empty_domain);
+
+	pm_runtime_disable(&pdev->dev);
+	rkvdec_v4l2_cleanup(rkvdec);
 }
 
 #ifdef CONFIG_PM
-- 
2.45.0


