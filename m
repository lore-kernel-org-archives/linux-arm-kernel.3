Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A606C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 21:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ultvd+YwB2CCLSLTdZwfLPvD251NBr4TYb3rtNreqUc=; b=nwgBpFqsDjJ3EnrclsDP+ukLOH
	ReFDjbjoGAISjCmU911fk4zKc6Qorivuu4SXAOt+yrBZNxQW0sCqMlZ0zfcl+8GPerqXJ671EEMxA
	oMeLdsFHoC8m6cPV64m3NDM7K2vEmJLIXy9wZOdxsKZyibZDR+IkN22XuZaP5kdQwju/Om8E4/d8X
	wnJ+IGfjfHzTYCXKxLW/rL0n+seDn1mjMI4IHKSMH/EABBbTNDs1jzBwF/KJ+gZaESyTppPXgQHs9
	L8pMWwwZ7Ggk0YjElztjjCiL9FPJzxOsf9mX+l3EXytX0w146VReaXblg9Jgi492Gk4LkNIUdQmcg
	7C0/aqLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucdX-00000001cpf-1NUE;
	Thu, 13 Aug 2026 21:06:51 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucdU-00000001cpD-0ZYX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 21:06:49 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso1100609a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 14:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1786655206; x=1787260006; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ultvd+YwB2CCLSLTdZwfLPvD251NBr4TYb3rtNreqUc=;
        b=N55rYgaru7vDN38ABJftjG7q91R9WA6Vgv6G3QtORq6gqQARQ2ZcKgziAj8FnRZTGW
         XUmydBjjQWdk40mJny7rcuqAGXRvdPYL/b3qKA9DxDschdupz2b/y7TzRYJrSt2DK7PK
         vvV/Dw2gfb1iFRXwyRn3sPj/Vrv9/ZtjIrmD35T4iYaSBbCzPhuE7ky6O+YVWgOQP0jS
         TOJ7bo7ZWL4N5Ty84xp0vL4DfVYtl9b69XPx/BTNISslD15Q4Jaw8hiltMCbuan5opgI
         Gkjg/OCeAISb+s0a7uu9PY9GcSYoF4TC2tFSBDWhYgvpmHiOnNuSTfDt374oZqPHklxz
         LzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786655206; x=1787260006;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ultvd+YwB2CCLSLTdZwfLPvD251NBr4TYb3rtNreqUc=;
        b=TEcdIupVxZVOq6qaha4iLTE4Up335x5tDmOikfRra9diaLF6OX6wg2660Asn78V1TS
         EvfAZvoGj8Vmqlud8EGkwL+lhqlELrVttCri/qonInUKsvT9n6PHpWBax5Opaj3h1Zz/
         P7/hqoB2ahFDiBO97kukw4eOLH8IShjtIQ+XcWiqTHO4rYZKe/Z0IE+DM7elexUpyYxJ
         IeC2cqzbG2beo0ZWfP8WOMwc6MCcDPsxq4iF4WBtH67BnGuAqHDLVv0QJnIHU+m4I73g
         PugbzxDWQWAFjsMyqCFKZL2/RdIGDPie9qijpG0TZLKAP6wX+R5/WDSOSakosqbRJoI0
         H1Eg==
X-Gm-Message-State: AOJu0YzmLtc4BtshpDkC08bF5PV/aRSAcqkwX/5v2RApJ5shXFUV13UQ
	YLMlL31QrE3ryERBePpXAhJr4yEeNGJgLprsXXzKTsIIIZN1syZHWnmGOqkqxJLnr2w=
X-Gm-Gg: AR+sD11mPTxwtJ3VIRqBNoyH97DwXpsD2UhdAnuAeuVmh8tr7ac5P3gB+KhdN9+UiGU
	8BkpTKqGptEmMnF+dSrZW2ufkEaqKuTQJHV3a7tKgupY2IKwOMZ5w7V6pCQF7GLRoiHmbIpKKK5
	dknPaimGXGhw71YMzMHYHAJkpGh7bxFEfCK553tl4dhjgqmdtVBPNXB8QLNW4OdSgwyO0LBas5A
	MqtjcFSndW57jLhalzLTrLYrYzSBTN9bqYbAD/ghE2b0r59TrjtvO15KicEFUSDFRq/z+yi1H6m
	KWUhd8IZdmqpFMiEcGTmixyveL9DxJi6Zso52nlphKkzS26soGjW6qJWlfmNeV67wc4giD3Cw9o
	ewHxCysjpOfoEokq59CRtYXAsEGouz3QDpi3k/E4YTNzk6a//FjYR8UsZrWMMl2t4PeH6CY9PKK
	tREy+U6vHjt4CiBAgiyqyj5iJXzd8ldS8tdiP8TykAXNdPeqSFYgOGum63ulQiXu4=
X-Received: by 2002:a17:90a:e7c8:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-3931f5b9ec6mr4934140a91.16.1786655206294;
        Thu, 13 Aug 2026 14:06:46 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebf732526sm9841832eec.19.2026.08.13.14.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 14:06:45 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 13 Aug 2026 14:06:40 -0700
Subject: [PATCH] i2c: xiic: restore runtime PM teardown in remove to fix
 clk WARN flood
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-i2c-xiic-restore-runtime-pm-teardown-v1-1-0e7dfb206790@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQrCMAyA4VcZORtoK4j4KuKhTaNGWDuSbg7G3
 t2qx+/y/xsYq7DBZdhAeRGTWjr8YQB6xvJglNwNwYWTO/sjSiBcRQiVrVVl1Lk0GRmnERtHzfV
 dMGcXk88pkAvQU5PyXdbf5nr72+b0YmrfNuz7BzsuC02IAAAA
X-Change-ID: 20260813-i2c-xiic-restore-runtime-pm-teardown-dd0ab1db2c02
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786655204; l=1608;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=+Iyoqht06orAWWu+u7sHJGc4N1C/gzIr5LzUDuiY8Bc=;
 b=aZPjAYgXpSdHMLsS5PSsc0LoM9SiqlcTXDl56EtQPLQhYYNTWWCUoXuF4aTG3wyNCHQg0xcQ/
 UbKAg7bvJgxBmyzrDURg6yFE93cZkVoIsmJ3HkhI3eAvhqCeGMUFeD6
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_140648_198386_F246E7C2 
X-CRM114-Status: GOOD (  10.69  )
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
---
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
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


