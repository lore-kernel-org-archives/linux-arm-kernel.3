Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305B0CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BIW3cS3n8yzrCh58jhXvAPIZMTRPbdX12tJ5K0TKoIs=; b=U9gEaga83sR0hx1jjSQMoxF8Hu
	qPXa2XDCuhXE5UTfdIhMQ/3WsY9HlnuA1HhgwDB6I4qAHD4geijHmgT5EzHhjCICg/ansyzg0AHRX
	f13YLgsakCv+0mvNhhwi+kJ67cSMxPziO3R+Rx9dywlHtk3CFyrzY1Z6fJyQM9lPXXR2km9QjAQa3
	MmMklXrt9/juEqQXX0dmEiYA1un+BF+ZMiQkW1DYobI3WPyFJ/wiSX4VgjuCZ6SCcDLiV/a3V1qcC
	v2CugpBMekcN4JPG3Tcn9U7FS9cPxspEKacJDBae7OwYrZyby4m1JKLdJRhthDKlc9SNU6Za5+NgP
	VxGlk0lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2zx-0000000Fwq5-1nzw;
	Thu, 06 Nov 2025 16:38:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2zv-0000000FwpM-2Ww2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:38:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477632b0621so7522765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762447085; x=1763051885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BIW3cS3n8yzrCh58jhXvAPIZMTRPbdX12tJ5K0TKoIs=;
        b=R17EJ6n+SCYumKilfiP00+/sjd9SBLKAEzbY86CQAK1htnRhybWmKsH8Daatng69xL
         2l2z0qnnhkLOepOJHqyRRUhSjaOLRPzpifRyNLlCyyneP5wNpLMczLGXcnmKlwfJtPeE
         5Ef8256pwZq1NY/z8/3SaYz5j6YB2WzEIjnNHpcd7sHr5VJE4YptMheOjYOpnAvotCQ3
         E6ptz51Myg0v0ZKSdgMrBNSM7MfVHMCUMD1aAE92vNX7nALWHDZrDm/2rNjUYrISFE70
         bNMQUFJUAApZrq/RzuQcBJOQPd9+wDho4HUF3geJPKk2t9EKjt+9BHgW1j9HAUPBhlAo
         wMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762447085; x=1763051885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIW3cS3n8yzrCh58jhXvAPIZMTRPbdX12tJ5K0TKoIs=;
        b=pWK7I6Jw/2VMZHOUvwdz5Y0xLHS3W7SgLGuXerLHQsJKy6E3Ajz255/0z28RLDg28F
         f6YQIXFnHwPgSa5ZqY/lHFv2ATGjqc+UxYdH0cuz/nr1ebXcFExevFm1mJvpUoFRJBIF
         2+UuPkLCw0h8KWatKApvVvRj0BLWnYJLDYd4xt0k7lnlSdYrb+dJX5REvmLZJDqenFyO
         /OEhWF3BvN2YdA12TZi1sORuW86pXUVPXRnRBVUGs+IGFZtI0w5iToCn2iLMVtTRDb6x
         3kVnb7Z35Db6IGpMu54UyAC1tTR2/dof+76jZCclY0f5Ce+hW44CFkkGEhIcRTiSJI9b
         fFsA==
X-Forwarded-Encrypted: i=1; AJvYcCVsdKka67XiXAhPF93aJbGtHKjEu7dJaO0EP+YaXdXOYEz0a8bk/C+C34jmssEVgFTLlHDlcAmvqq634yp3E1vD@lists.infradead.org
X-Gm-Message-State: AOJu0YwtfmaMKO0drvCM+n1SDV9Df4JfKXzIvoh8X47hGrfsVAZ5sfVO
	ec5UaePale9H1/e+oOOBd/2Zh7j4y0KTSGM5rAvcy9qVcNglKW6DDP+cF/95FdYXEuc=
X-Gm-Gg: ASbGncsRw24xp9gR1ZIgo/6aEbfPFTqak3eZFxYm3MCvFj6ZLW5SClomYVuY+WDK2KX
	Z7BcvXuYrKkDZH8eTMF6lHNiYqMOTi3tFYNYRq6yx54lxdW6I++RsXLhHAvSi21LYx++EXoFOUd
	O5J7hhltcGwRy3VThFQkmAJvUIl4sN8sSpLHMEB/QIodLSzvgEthX1w8n4qRZfoXOpfcYttTrTE
	VIQm4m1CNYeeWVn5UVrdYkyXlTjmn+GTdqgAbFcoSvUgi2aBM9JVHsoZ1hewROLFHh6U1rrNUUI
	HmEy7owVFIT/kFpRtpdOeWTCzjkC3eBvRFDbTjY5t2hSkUnPla5AOIHEZKRuuw6e5Cv+wwiZgNA
	TCQExoX3ZpR+/jQxBJfZ1FdDw1LFRpu9HN/hPnz6W9A3z03pp7r4nB3kvO2xWFXQgxFlFL0ZPu+
	sZBQZd4yW/O7zRkJl/OVcl9zg=
X-Google-Smtp-Source: AGHT+IEjgkNrSWOVJ0pFSgXHlp3nXPxcUMJ0BCl/+QeBwIyxvF9R3B+0c4btthob/ZR/dpqpdOq8fw==
X-Received: by 2002:a05:600c:310c:b0:45d:f83b:96aa with SMTP id 5b1f17b1804b1-4775cdac841mr68114705e9.7.1762447084572;
        Thu, 06 Nov 2025 08:38:04 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477625e88fasm72581015e9.15.2025.11.06.08.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:38:04 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH] crypto: atmel-i2c - add WQ_PERCPU to alloc_workqueue users
Date: Thu,  6 Nov 2025 17:37:58 +0100
Message-ID: <20251106163758.340886-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_083807_668410_95C9BE35 
X-CRM114-Status: GOOD (  16.57  )
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

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistency cannot be addressed without refactoring the API.

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

This change adds a new WQ_PERCPU flag to explicitly request
alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/crypto/atmel-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index a895e4289efa..9688d116d07e 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -402,7 +402,7 @@ EXPORT_SYMBOL(atmel_i2c_probe);
 
 static int __init atmel_i2c_init(void)
 {
-	atmel_wq = alloc_workqueue("atmel_wq", 0, 0);
+	atmel_wq = alloc_workqueue("atmel_wq", WQ_PERCPU, 0);
 	return atmel_wq ? 0 : -ENOMEM;
 }
 
-- 
2.51.1


