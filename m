Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BEFC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 18:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mI5zeet+gBSiudx0x2vL4qWV0S+lI4JZhzArM16nmM0=; b=lCoaAEaiqN5A4+rcuIYxuTyTmX
	HjqHcQ2LQ30+t7HuJAp7FPrQaDheqxcJSFJ78Fd8twduiy9JVGnqHPPo6mEMSEkAQ9hCwIs1tFC+H
	bDRJK0uCVvzcnfcgYIqpzEh18dWpxmsAmNIaMzb3oTF9qpXSzl97FIqdexXSzs9O837kLd9Y4MzRQ
	OwGFhse+ZxJbAW8xyiMFteY0AtSUgHP+pnxEL4b0yfGlFzg0Tk7yYq2ZlfBPwAXy1thEXuZJkozJR
	SNhGUWumJPXxaYX+NzvOz1LlQQkHZtAWeuhUhDF2iM3dMSOHEpOqkDslrn20h506c5uS4PWG6BFk8
	7uYejqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuwGz-000000031IE-01OU;
	Fri, 14 Aug 2026 18:04:53 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuwGw-000000031Hj-2HfL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 18:04:52 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-81ed2a06b9eso12002787b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 11:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1786730689; x=1787335489; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mI5zeet+gBSiudx0x2vL4qWV0S+lI4JZhzArM16nmM0=;
        b=ZbCJQ2IDk1ApjUNorgPFsgoa6QIlFuNOB84ZnQ2B7lJ25ComlmRvVZriFD8QrrQCGw
         XCACXu9a+kedvm9/6UtGefSu/10777NKV060wsl6TdtQE16TqSqeuBH3EUtza0xXl7HN
         fYo6H6E/jHOVoCquOIZV78zCJTcaALOr4lCQbEM7IV2LpaJ5HrXjay8BNFcEGBoNP2tM
         NoD+02bospZSltoyDP7BoBJXnE8hymVZ/Gcu9HcZ0fe6I7xw9UWK61e2awgX6+dUA+/n
         IviPvee0vWs5QybNnRa8u3AFL2wfi7++wRq65B1HQL2/FiB+27uXgufBZffyocNkp9Ii
         jhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786730689; x=1787335489;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mI5zeet+gBSiudx0x2vL4qWV0S+lI4JZhzArM16nmM0=;
        b=eJgl+BDZv4+A9sIm4REMTxRaOrXrfDZlBpTNJ+UYxQt8Ads2gXbTCH43lX2WAm4Y1j
         IBvdqK6lV56hnuyK3XD3UbVo2Qr0Uduw9AIZSYfJTqHDQBeo7tpdvl5yxgiTls+d+J4L
         2ybEs0j4TdAEJdht6rEuohaom8Q0hTNHplawFB21XR9zdh2ZsjDY6j2VuWf8U1D+ljaG
         3/5dIHpLj1hEV4SSG6hSuEnlLe/QsSfHJVUVnWxFY8V0HgOWvgzpcLWKrjvyc7JShmWe
         QSyJS4kOay3fkScsejfyg2E7knqmt4VQ+X6xRl3TCjXshVGSI+VZaGKNd6bVWctb1Idl
         cSmQ==
X-Gm-Message-State: AOJu0YwdDBSyk7lwSxp2wLaquEp++OFeS9RmEXods5v08x38DmrrHvTV
	Nd53jkUAubdx6ICyprV7fn6SMELJnYpmErkaPhfi9o5I0l3Z947i2XMXEkZ3+VECy90=
X-Gm-Gg: AR+sD10+IbVALUoTGCVrNW41Aqe3+0jynddbSJyWuY4iv4VcqrkiMIZ+ZrVmo20mVEg
	p0TliqJf24PdWdJHUxc9O1M7HBWxzoQlkxu0EPOlzBryufFSL9pqF7Q7/n2n0nYN5IzSJRWS6MY
	kbMbnrsNDiALcJ2gRVWvQi5fCBKiJ4j+05cLactkpBUtJvZcTSKuNrTPBClT0UY5lVmMi2/1C5V
	I2Gjo3ROmqjl9LUEMTLDXE6XOXjicIltgCIgGZnVFTilxDdbGMmyvTNMDjIPD2grcXyKU6Ai4+E
	x9Nfo9FaRh6b5XYHvnOvX8Y65tLLQPsrJP2F7HCBpv+Y3gTcFzzEYEGxyLcbX6juKE4El3+PciU
	LChKik6/oKCcKG9r09doc8ljBCnqjmwmdr4iyQp8ki6CGQbeJ1zeyNye/WBX4ghAuQvsl4MC1/a
	OUQ9Evwate9dMXzdPMFHPwNVmybW57BBooAwpe+l8GTafLnlAlWHe4RpHKj34Bw+DbSEauKmC+K
	5M=
X-Received: by 2002:a05:690c:c3bb:b0:812:be92:6ea6 with SMTP id 00721157ae682-837124e6359mr23590307b3.28.1786730688893;
        Fri, 14 Aug 2026 11:04:48 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-836c38a6f52sm16030937b3.48.2026.08.14.11.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 11:04:47 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Fri, 14 Aug 2026 11:04:45 -0700
Subject: [PATCH v2] i2c: xiic: restore runtime PM teardown in remove to fix
 clk WARN flood
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-i2c-xiic-restore-runtime-pm-teardown-v2-1-7ae5d0c30ff2@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQ6CMBBGr2K6dkw7JqCuvIdh0Z9BxoSWtAUxh
 LtL8QQuX/LlvW8RiSJTErfDIiJNnDj4DfB4ELbT/knAbmOBEit5UWdgtDAzW4iUcogEcfSZe4K
 hh0w6uvD24JzURjmDVqLYVEOkluc982h+nEbzIpuLuyw6LrbP/mNSZfdnclKgQFLtWoOyqq/y7
 mnOXRhOmkWzrusXmG0wgesAAAA=
X-Change-ID: 20260813-i2c-xiic-restore-runtime-pm-teardown-dd0ab1db2c02
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786730686; l=2172;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=GnYmCwQgQCpd5MzyBxd1AugHi3QfIrsoUxrijxoLXTI=;
 b=l9OeeV4dVLTJ+bgHuE/r1D5jfYkVCkfb0Y+shzLfB/PdbNOK6DSZD+rDjM1otPTZRlFd8ZyJK
 UgJGjl2kcC4AleJYd1OTjPXd1CBglegsNByDqcLLtn3wh+XDB+FTlaL
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_110450_605658_E512C5C5 
X-CRM114-Status: GOOD (  12.58  )
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

The devres conversion dropped the remove-time runtime PM trailer
(pm_runtime_disable + pm_runtime_set_suspended +
pm_runtime_dont_use_autosuspend). devm_pm_runtime_enable's release
action then calls pm_runtime_dont_use_autosuspend() while runtime PM
is still enabled, triggering an immediate runtime suspend: the suspend
callback clk_disable()s the clock that the devm_clk_get_enabled()
release is about to clk_disable_unprepare(), and every device teardown
WARNs in clk_core_disable() ("clkN already disabled").

Restore the trailer: with runtime PM disabled and the state forced to
suspended before devres runs, the suspend callback cannot fire and the
clock enable count stays balanced.

Fixes: 50c63491ff26 ("i2c: xiic: switch to devres managed APIs")
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v2:
- Move the Signed-off-by into the commit message proper; v1 had it below
  the '---' cutter line where it would be dropped on apply (Andy).
- Link to v1: https://patch.msgid.link/20260813-i2c-xiic-restore-runtime-pm-teardown-v1-1-0e7dfb206790@nexthop.ai

To: Michal Simek <michal.simek@amd.com>
To: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/i2c/busses/i2c-xiic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 3e7735e1dae0..89636ca36915 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1545,6 +1545,9 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 		xiic_deinit(i2c);
 
 	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 }
 
 static const struct dev_pm_ops xiic_dev_pm_ops = {

---
base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
change-id: 20260813-i2c-xiic-restore-runtime-pm-teardown-dd0ab1db2c02

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>


