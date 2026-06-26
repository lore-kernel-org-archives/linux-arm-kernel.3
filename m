Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F234CDE00E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 08:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYGUQ3BK82lNxZT2T8m+B+M94mEtALcyUvit8Pk1ycM=; b=N/MTqknTmo5uQubFLwAuNwL83C
	YtPjB0iZRuY7fQgZNQJrSDoGbEn8Fn+gQeZGl8ZhID/lRurpcAowsBGDzRa9w+d5rM3MQ1aXbXtD1
	epYL/WW/t7JkjQ00EpA89HEDg1gatHEO5X2ZBmJVLoLv4O42/MCiMN9WRJyGabm9tWNgbWeFIQIqF
	E5MUJdmcle5ZDyf3XtxhlNNO8tnoQ5nAYdAxK0Mwk+1aMWW2ZddXobdOjfrpb3OTmpH7P7YOX/2OL
	hWyAND9E51DxfbaJiwiLxaZKSIEFDaliel93ouwhiGXxMQP2+rC+W47wKIU+qEOYe3BJ1bivUkhfH
	Et8waxVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1qJ-0000000AqEZ-27bc;
	Fri, 26 Jun 2026 08:23:19 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1q5-0000000Aq5o-0ySz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 08:23:06 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c7cfa17fedso7331115ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 01:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782462184; x=1783066984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYGUQ3BK82lNxZT2T8m+B+M94mEtALcyUvit8Pk1ycM=;
        b=Jmo2pUjwi88qMHUJ5qKuc0bavBncCld9kljDlWMz7eskrjNVnDs9vJbq2v82fThtfS
         6LxqErBQs+MHyknagyjrGS3+084+7pKEgyZ+cjX6HAI8Q6sSX2UxxyVp6xXZCgG6XUQB
         KITLIwBPxrSnusjMxpv5gNShIgGhmmEa5XZWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462184; x=1783066984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xYGUQ3BK82lNxZT2T8m+B+M94mEtALcyUvit8Pk1ycM=;
        b=iPm4FUomt59vyCgC6gJSfoDMrL+QdCatIRV7Th9N4KEOAKmFVgdVZTsDaX8hMgX3bi
         L/Y/xVMcnQHpk40cX8enVkSZzYhHbkuZyJbRCY0GKzsgQBDPuG25ZNyH72q1aT94s+vf
         PGj+895Mh8j3OgtChOIEZgZTIvdlryGqn4BMH8SLM3BTMfeCLAm0LCotdUqmMymChHTU
         hcrzM2UjJGAiDEF9EYsfr+fjyKOd5mcAvkNOTkPqP3nzkVpM4tcWWUY7YrN0suH9ehGp
         YOkv48sbht4MeR66OzrEvHRr7Osh8530gyYxxVleTXAOUgw1bRHrxea/hSeM+UEr+e0T
         9XGw==
X-Forwarded-Encrypted: i=1; AHgh+RqACr0P1jkGP+7206H3/bg9ArsvvmRmzsnYsdSKdupaPB9i0e0PVC5nvjtNPURuECAfd46BZBdO+zfNckNN4RZ5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3a9H8rFipR3A2FC+M02fFKHiZjCE+cxaC064A5Y9LyfBL0+F4
	Lecz3upKClz3HiQ6rmyUS79I4NSDVJkrZVQKDcBiK5B2ZJXUZ2f4vK2PCnBo7SMqDw==
X-Gm-Gg: AfdE7cn/KyBgUeDwwgsYDHzVW911ceTthKl5t2U/d/zylB0j4W27wGe8t7x6I4FUHB5
	ybp3WXa6NnVziZHbu2lzEnEIjkzgo+LkVjBEIXmukMvoZxZ8tUPqWgQy3C70ygzcXdE27MtN8Uz
	c6SY+v9rcMJPZOTvZI29j9JYwQ+FqBbwTePVuFGOwE+NVFjXeHjGIDwjVizVio40b15PDhrQpow
	LMyeECb1UZbFxmKb6NpNTcA1/bsgAgr5vzXL7ntnjq7d6cUeE/GqBlipv/1D56Ce5zbYdCMvO4J
	qH09un0YEX0NoQrC0MVx8D3eJxbf10+Xqrhc4LESrjENpaZhWsYseEh7pzN2aB2t2HmxYW8Fk/v
	KxMefE0r2GVPBk6o93Lyo3sEnJAU+JderMW9uvtpQTHVQJJ7G6td0DZ8mQgOzFXRAU61iiIQVIv
	z92drRaSCKMkI1Eyfnx2/qsIyB4rUqWnAM6Lze9gFcudiorzZQisJXmWLeK08MQLSXzHCYQDY=
X-Received: by 2002:a17:902:d2c8:b0:2c7:e823:6834 with SMTP id d9443c01a7336-2c7fc657e3dmr59806355ad.8.1782462184290;
        Fri, 26 Jun 2026 01:23:04 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:201d:8:2593:3e55:e36c:f47d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64dcc30sm34619185ad.66.2026.06.26.01.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:23:03 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Fei Shao <fshao@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/2] usb: mtu3: condition PHY wakeup for host mode and runtime suspend
Date: Fri, 26 Jun 2026 16:21:52 +0800
Message-ID: <20260626082218.2750459-3-fshao@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260626082218.2750459-1-fshao@chromium.org>
References: <20260626082218.2750459-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_012305_265987_A0190F17 
X-CRM114-Status: GOOD (  11.00  )
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

Host bus activity during gadget mode system suspend can trigger
unexpected system wakeups via interrupts because PHY wakeup is enabled
unconditionally.

Improve the suspend flow by conditioning PHY wakeup setup on
device_may_wakeup() and restricting it to host mode or runtime suspend
to ensure proper wakeup handling in gadget mode.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/usb/mtu3/mtu3_plat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index cc8a864dbd63..b4f4c776adb9 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -544,7 +544,8 @@ static int mtu3_suspend_common(struct device *dev, pm_message_t msg)
 
 	ssusb_phy_power_off(ssusb);
 	clk_bulk_disable_unprepare(BULK_CLKS_CNT, ssusb->clks);
-	ssusb_wakeup_set(ssusb, true);
+	if (device_may_wakeup(dev) && (ssusb->is_host || PMSG_IS_AUTO(msg)))
+		ssusb_wakeup_set(ssusb, true);
 	return 0;
 
 sleep_err:
-- 
2.55.0.rc0.799.gd6f94ed593-goog


