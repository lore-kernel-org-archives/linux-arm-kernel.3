Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F47CC55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 06:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wKhyMQrWu8wbOkY8L+PT3L5GzBtcKEJdYmE407RmSq8=; b=XBZCtBPjwIQfwUft2Lf1bSNcIO
	4eziQUk025L2my0wAmtDwNcaSP+sY8/87pqv0N3K8y29i6WpHIMf/DyAp0rEYHhX8M08Cq+dyu/qO
	nuVlbvEJQkwiflLuz2hUvc+u28UovSu966u2MrNgeAIxu+BUyg6DuTGwnTzBwfgBkzNDO+FHL82yU
	lTn3UuEgZ3qruuLONFvOzWWEAZHYTDGK/mZqd7HmpeGPhLJnS5n/j4r5vy94yzBmAZJ9dUhdJzNbE
	yjzjDCO3+mHrmqRx01zeTVPXjtF/ul7KbjIS4pg8RQAkKqVka1BHYP8ou9/tKUWRCIwcRrmQEQwpv
	kOwYI+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsaQJ-000000095in-3OSd;
	Sat, 08 Aug 2026 06:20:47 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsaQH-000000095iN-3OGe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 06:20:46 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso299419a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 23:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786170045; x=1786774845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKhyMQrWu8wbOkY8L+PT3L5GzBtcKEJdYmE407RmSq8=;
        b=UftvrF5Vn+OdqhHcThdMflZWb/jXeVH5+G6ifKoKtSzP3Wsb1OgiNGRDNuHHa5rEun
         x6KayTSwnWrM40llFP356Yk8cgd3heabEfteH0nOWK5XTt1QTXXjzNo8V8XhOo0TECI0
         knZObjObl4WbNnWTv5hthkBEhCBpltjFEgNRznVkDQILXr/j4u9DmkRIp1oWBiapBS8Q
         0zEuUQF35m357NkaO1Fng1CUsMKhgKoEY8iNiXTyqjuXXhiM2yOjg8YTXLzlU5PWN0mg
         qw00f3VfVyFMP8rlm2Tw4TQSaNvs2O9PYZqVuGJMQxEL7cNX9otBdgmpWW4ltWAIQqi4
         4Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786170045; x=1786774845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKhyMQrWu8wbOkY8L+PT3L5GzBtcKEJdYmE407RmSq8=;
        b=TquwZGH/hRWnSOfTrf1wp30EFshc7Qr/elE1ClvlL68f7S1peHJyK3xYaJxtrfR6hf
         OH5laYtis2fFSURgwbUICICQ5yLnjEP1FhBf4VEaTyp5zDoIqc5qJ3Y67NZj5eTwHZtU
         WQqWiIku1z/VY3tfXtXONoeldD3XKmQba8LWPWCoJESOOwNaZfOJXGrQN2gIhZVgZRv8
         oHXwD8vhGqsIEGIZLpzPfWT01GcLPdD8rbrjUy2F2y8Zj31cg5mIfvHO+t1hOtTnGe3B
         ADrR12PqToYeuXPUedzqu/w5XIHYIaMc/fDqBmcHinbdwmBtTsq8pbx4RYfXfEbWMYi0
         7yXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqS/1jKRtOVA7zIbOKDqa9L0XQ8kAcA1K5GGF9xcJNfwW6RtwTKDgeJqcx/ukRDtwQ4CDhKl/buwEW+eMrlnX+r@lists.infradead.org
X-Gm-Message-State: AOJu0YwVQkgYbhbqpkeFSRQVrPMrR0U7eInQiASkmu0/DRs3nePGA18W
	ZjYRgXbgIdq0Avf6+yFZB7M60G7ME2MBJGnVxKaEoRKLBIe6Pg1nzpG1
X-Gm-Gg: AR+sD11hW8aCSGb1Tp2PabL9GSS/jX6sTZMi9dhDZ0z2WmN/MdCYJ0aMHouNmOVuweU
	+0uoLezaoXdnF2oyINGkm+2HyLjRxtDSsHHvVoPNiU8ZfMydwCMg/gQdENU2apPOFKeUzbGDdlA
	VgVQIUdfdoyK52pUz93APmpK2BQPT0VohgwhvTy25tAV+GowYuQ7dZ0Th64k39Q3m1Dkv1V9heq
	n4lKTjNg1N0af5MXlOvWuK/Yr5Zu8J1i5cdour3nJn1u+VnGtGw3l1L/DbyPNDdZXLuKM4yVBHf
	PvP+XIYf65nBIgejHcXTxO+6NODNL7/sruJyXIVIHoptpDF2KzMT9X31ejUfZ20dMGJBU2pqXcs
	hgmiCgMhMoTpbDU7PEUAWqECu7UXic4T9331kZeDFSzWKhkIOQNKTtKHlYpwrFL6xvqpm0vYAew
	ZNN5sr7AbaswXG06MqeYwK8MiG/tGtsjlVsNTHVzs90wNTidTs+G0=
X-Received: by 2002:a17:90b:3a10:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-39261fbc353mr9787630a91.6.1786170044921;
        Fri, 07 Aug 2026 23:20:44 -0700 (PDT)
Received: from lgs.. ([152.32.133.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6dab4sm4996353a91.3.2026.08.07.23.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 23:20:44 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] bus: sunxi-rsb: fix usage_count leak when autosuspend_delay is negative
Date: Sat,  8 Aug 2026 14:20:29 +0800
Message-ID: <20260808062029.2597581-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_232045_874062_97C99457 
X-CRM114-Status: GOOD (  10.73  )
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

sunxi_rsb_probe() calls pm_runtime_use_autosuspend(), but
sunxi_rsb_remove() does not call the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during driver teardown, this reference is not dropped and usage_count
remains unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() call before disabling
runtime PM.

This issue was found by manual code inspection.

Fixes: 4a0dbc12e618 ("bus: sunxi-rsb: Implement runtime power management")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/bus/sunxi-rsb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index daf0ea563e47..cd4c857756cf 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -815,6 +815,7 @@ static void sunxi_rsb_remove(struct platform_device *pdev)
 	struct sunxi_rsb *rsb = platform_get_drvdata(pdev);
 
 	device_for_each_child(rsb->dev, NULL, sunxi_rsb_remove_devices);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	sunxi_rsb_hw_exit(rsb);
 }
-- 
2.43.0


