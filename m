Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89054C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 12:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qv+EG7MngiG1wf6ZlDGOACwuZ6/qljnKXWIF+vWzmyE=; b=sIwnWfK7t2E+FFgu9/wIcs/Bfh
	Rd8+bwBHD1wIe/Gcwa1TaW/AUkQhvX+PEtUHfjBz3m3mKBdhzEvFSBsX/AbuqUbzCS9fcNcl5VSfR
	9cKuTl9DFA4bN7b0OEURUafbq8eTvS9gmJ6D+ZkWlQna6mdDMj2RBeErrHnp4FwUOxACc2BdYeWdR
	d+cwN21d7BXbex3XFjkg66FCgO9dmwfwvkV4zIJplHCXYgICamvWUDxAbLewuAwvXS9ofeRgZSiiB
	TTOxlwcaXoqbEI+X+sVNuRbP/nydEzFLknr9yQBms0wxN15irDI1uXKqmT4bBVywcbbmUKBpcpDSH
	i9H46zAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2H3-0000000BaDG-346X;
	Thu, 20 Aug 2026 12:53:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2H0-0000000BaCt-2saL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 12:53:36 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so12762725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1787230412; x=1787835212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qv+EG7MngiG1wf6ZlDGOACwuZ6/qljnKXWIF+vWzmyE=;
        b=q/SWaKDZ/2+kKp1XeJAzBX+FPWM1jQkuIkLQjGhKcouCmo3f0sTWVlbWVrSJGNXygj
         5txQb+2PBQSehFgy5CiiHZyBpfn0pi42Bj2J7QaaQWZ+bwfn3gtVFp059wWByeES7B3W
         WvjC/VxvFhPqI+hd6FXnfr1t/AybJ8S38wFM7eQbbQuOt7c+PD9aWAqM3jJL47j7fO22
         ZvUZm6r6K0ejzdSTnpWz1X+BgMpVokOqCNVSeQdQ05y2hfb6IpAI8zjKqitexeQNgEsR
         x/5O+ePiAeQ1XJl2RTMWK/Oo0U1u4rWmCOKpo4KRgCuTE7X0DkNiSTh2Pwt94llh0qle
         E/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787230412; x=1787835212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qv+EG7MngiG1wf6ZlDGOACwuZ6/qljnKXWIF+vWzmyE=;
        b=T8wIliJQtjTY4DnX7qw/s2s8ehhamlT1oY5oFFcGomQYoVjQHGLcmoiRFHdXZXq62O
         ZOhWUtcuVQ0+WNo2jNYNpGfO9r3cyCmaJjQ18c9jsucwyuhDIcS9lHUHTozsxiY24cx0
         2Ezl3O5DOcG7XpbkJ5nJqidOURDoCqsQmeY1bUx1sCEQ87GlzIvqGieK/E7BE0EP/LnT
         CdkeJpjsff5Jl3TC9mkiJEszISbeWlljbBylr8+oC2lM9NInPd9SrWhSJ3Au7fF9a9d9
         RswncRptUmuEfmpnBqzb/X6gUzgzIJbzbZZABkC9NkZivlDF75LZ51DjmsRJM9L1Og5o
         Cwow==
X-Forwarded-Encrypted: i=1; AHgh+Rp6oSZRERMf9sKa0aG94VtJn+hUs6EKVKUoGwhou41v7A3OA2PqfVLB/jzJztI72eZfU1QkfaYq5WIalIdnluA3@lists.infradead.org
X-Gm-Message-State: AOJu0YxHkr3PzhnIBobUZAxqxRkdHG2NyRrTxhn0iloV9JVWFLFvsyRQ
	Rkp8QjoCfE+Col0uSOPpM2NScjdfRp6pDxDHKbNv3DCd54eo38m2MKerV8AJLAXwxwQ=
X-Gm-Gg: AR+sD13TCDXXq38wI/VdPWdny2mRq43NGJaVBxppSSxgSQ8sVtYMdYiqXoxy+cHKh4d
	yUj6CG8uPv4amGvferY8CjZQja/HUJLX6E2eGTLM1paTWga5YNWbjmimXJnVVl95hcH8o8s0DE4
	avDCvjObpvwXhBGKAOOpwyC1ddpK96933NnZmmd0WlgokrXfZ8HfCImTJrtUgiYgDNrg4JBuu3b
	Ixd5mWGbS7XsVdE3/Kug3tz2FWckYZVWNR2NbMxTENuy3b+2ij6aFCrNUlK/qFIijObGJd5udnb
	4ARdY67N4u/JghDAiCSRxmlQuCOmWJWms4b9Y6niWoT3Jch2ODOerkN/nxV8kM3xOjRESO8Aexo
	FFuPicgRnG47RgVOJKFVDMJvMcJj6Y7QKyX9hXlw9hfOQX3bS+ILaT6I8AvuQ2sqEYL1kk98s9W
	Y5Em5C3aCxf5E6GNfJGIbDgEGpnG6Dl2ImHNBrzMZRjv9IZ+tiElmBNuYbnSrDVm4ltSWWdmBBo
	Fao4OZMLIAFyhMqjTW5TYcO
X-Received: by 2002:a05:600c:528d:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-499aa17d6a0mr239192205e9.6.1787230411698;
        Thu, 20 Aug 2026 05:53:31 -0700 (PDT)
Received: from dev-ag.figment.co.za ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm143998605e9.11.2026.08.20.05.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:53:30 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-watchdog@vger.kernel.org
Cc: xt.hu@cqplus1.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	linux-arm-kernel@lists.infradead.org,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH] watchdog: sunplus: fix sp_wdt_restart spin loop and timeout
Date: Thu, 20 Aug 2026 14:53:04 +0200
Message-ID: <20260820125304.1583383-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_055334_979875_139EFA0D 
X-CRM114-Status: GOOD (  12.18  )
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

sp_wdt_restart() returns immediately after writing WDT_RESUME. The
kernel continues executing and the watchdog kthread could pet the
watchdog before the short timeout expired, preventing reset.

Add a spin loop so no other CPU can pet the watchdog while waiting for
the reset. Set the restart timeout to ~1.5s.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 drivers/watchdog/sunplus_wdt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/sunplus_wdt.c b/drivers/watchdog/sunplus_wdt.c
index e5212f3d2e24..b44dcc307634 100644
--- a/drivers/watchdog/sunplus_wdt.c
+++ b/drivers/watchdog/sunplus_wdt.c
@@ -61,10 +61,16 @@ static int sp_wdt_restart(struct watchdog_device *wdev,
 
 	writel(WDT_STOP, base + WDT_CTRL);
 	writel(WDT_UNLOCK, base + WDT_CTRL);
-	writel(0x0001, base + WDT_CNT);
+	writel(0x20F5, base + WDT_CNT);	/* ~1.5s at 90kHz */
 	writel(WDT_LOCK, base + WDT_CTRL);
 	writel(WDT_RESUME, base + WDT_CTRL);
 
+	/* Spin until the watchdog resets us. This prevents any other CPU
+	 * from petting the watchdog.
+	 */
+	while (1)
+		cpu_relax();
+
 	return 0;
 }
 
-- 
2.53.0


