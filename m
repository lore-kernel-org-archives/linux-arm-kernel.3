Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7FDC55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QvgfMTGid+rMciEFA6IcKQ8hr90StVRwt8iU/v0xqIw=; b=CWcatjoWXDOWpjKDI3xOIBo0MH
	j2lsOei3TtBIahQvIyINP4bPn0qZxObbTCJQtZzroG2R8HB/RaIatYwcIC6Rz4R/um8J1NZgrtvOs
	1SU14zRm5AjrPBNnGIfkKY+fw6NPFV0rcU5Jj1beLCrShLiM+uKfZTv16q0afOMCTCUXNedx/SZFz
	7+ROa6n7sS9+1t5o62iCJMZlfuVRKelusQG2FSqD/HoEuMTH4QN7wtVhq1WmNG65sScdP8aHi/dSx
	iKUsMq1VhHw3KH/XT2jsnPiwnk+rVS5hzcci8RBzs28k/5vgfCkED/Z+OtT5Z912T4u7IYKcfmqEY
	tsiIvYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqFo-00000004vlX-0yoB;
	Thu, 06 Aug 2026 05:02:52 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqFl-00000004vl8-3ENa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:02:51 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso8756905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785992567; x=1786597367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QvgfMTGid+rMciEFA6IcKQ8hr90StVRwt8iU/v0xqIw=;
        b=WDh28TVHl8C7Wyy6YZ6n3yIoCrj7P0KpWSZ1RHLVdxThIgNSi+feZU5iPPqy3VC9Pf
         C66ywyLKRMy+W9ApfdjppmMdyJX5dpQHnM7+U0sEek2Mjag7t0e71apVfqo0Ho93jV/h
         Mg18Px7KdVRuQqhNszvZeZM6fDoFardnXsG++oHcyGFimbPCY6DzvDqx5NtVXTO2eCkI
         DDAVnvUO//3v1su6fo7OZw6gn71tz/piD4NjM/+72mr+eT27PrT7EWgrlJI8AiovK31L
         Qc7VC69wWi/AbjYRE8a/0R/kNIvz6emt1wg6TGcS9PKQcHUyJR3hgj1kNVFwJG36i/in
         CtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785992567; x=1786597367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QvgfMTGid+rMciEFA6IcKQ8hr90StVRwt8iU/v0xqIw=;
        b=dII/5jGSx4mRbR9hT8aNgNLPZ7CF1ZJybfJrxD1kE0eWD1LSv9urGoWjY1h7lYda/b
         uCdfiwl3WvoVY2hiDM6N1qqtYHQe0XERH6zZ0jO/lafQ5nAlBpDApgkHr0ar1vfFjEpu
         Oa183uCldatyyWYtC26JnJZOL94457su63oH79cOAzTWtyeYALW6xpWAEbv6ajSZGHKi
         YQWVCF4qvxdUcO33mcaPDNrwE4ObV4bQRtJ14kpPYIY0O9P8dS+rBsKnSqEfJclpbQyb
         n9Hde7xzaXt6bu8Al5tcuIgUSl88+AhwF5oa5XCYsH+ctE07Y4NbJ9FJWWfkHOiaRTKF
         FUdQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTLpssW8gYvvy8C7ptgWm8Ls1G7oEqvSx14QmHmWuu7+UmPiqD6yhq38w5pFLgJJDQVA0UMZSxD1dQO/jvNUX+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6HC61DTP9G7lAbNxQtbQu/fYnZ/sL+gg5/6r36Woy6aFTbmQN
	zCTq/zHO7GRoTOgvZiPKU8gvvhK0TK8FeWwEYGd/u3bt38RwPgBNkO5U
X-Gm-Gg: AR+sD12DU075qVeUKb5kV5vK9eZn2S/u9gcOGgdsXfv4RcxFJ+Kf21C2iJy+bfsMq4J
	2Z44jVx1MAIGxxPxJBlTU0mT31OfuHlBwRRR78QqH5pCkIDmDnzkUyJml7u6TMBFXEwCyOvuuSD
	r/nWTXbvm7Gx6OKr0pWEPwhgUKCgLshjXAy7XeSNTcrEXwwzAS9VMtfakANtnJdqC6IFky+HTDf
	T6LRZvnCUZztj1yu/MOF+v53nEF/9HeRyeKVf1tUmfHN/sXjROlBuETiQcwsc+Y24aqD/7X6Rho
	kUqgBkKQ9C1CJLFmjkKLy6Wo6ncexycq00NWDbxd/9/kLnBMDAzlvYfVTSWTpyTVUOBg3iutmn6
	WHIKiSrIs6TK41AnK9fj9GpNuEfD2CEcWWlCcmAGJw/c1i+QARvOxsEEky78xEHkELXobc0ven5
	HJfk/RCQM28RljnzbjpnpH+/uZCb0zbcutVLYn0ToWdCK+0CBvFN9/KmpSR7AnJbYbVGhN+QLVs
	PiwlVbFyPgKX4iyVxjWbaRz7neW67G9K7aHUAkwMmz3F1dNYovi96yS/2VR/EzR6ziNkCikBeRR
	VQWWC7I1xT+nMZ2vkW8KY/8rB6ngoYbYcoAOtvby2iPEoW8WIQZN4GNtfARJiPsMTQt180yMG0e
	MaiQXMiNLHPxvOXraWRYv
X-Received: by 2002:a05:600c:5694:b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-4994e7bab0emr107043945e9.9.1785992567364;
        Wed, 05 Aug 2026 22:02:47 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-adf9-2301-8c14-6be6-a9e6-a2d4.310.pool.telefonica.de. [2a02:3100:adf9:2301:8c14:6be6:a9e6:a2d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499542188easm28834695e9.6.2026.08.05.22.02.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Aug 2026 22:02:46 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawn.guo@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	Anson Huang <b20788@freescale.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cpufreq: imx6q: fix out-of-bounds write when probed more than once
Date: Thu,  6 Aug 2026 07:02:39 +0200
Message-Id: <20260806050239.90188-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_220249_867774_E2833BF4 
X-CRM114-Status: GOOD (  15.12  )
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

imx6_soc_volt is allocated fresh on every probe, sized to the number of
ARM OPPs:

	imx6_soc_volt = devm_kcalloc(cpu_dev, num, sizeof(*imx6_soc_volt),
				     GFP_KERNEL);

but it is filled through soc_opp_count, which has static storage and is
never reset. A second bind after an unbind keeps indexing from where the
first one stopped, and writes past the end of the new array.

Unbinding and rebinding the driver on qemu's mcimx6ul-evk, under KASAN:

  BUG: KASAN: slab-out-of-bounds in imx6q_cpufreq_probe+0x3b0/0xa34
  Write of size 4 at addr c5e90480 by task binder/73
   imx6q_cpufreq_probe from platform_probe+0x88/0xe4
   platform_probe from really_probe+0x108/0x384
   bind_store from kernfs_fop_write_iter+0x1b4/0x28c

The write lands one u32 past the end of the allocation.

soc_opp_count is only read a few lines below the loop that fills it, so it
never needed static storage. Make it a local.

Fixes: b4573d1d657a ("cpufreq: imx6q: correct VDDSOC/PU voltage scaling when cpufreq is changed")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/cpufreq/imx6q-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
index e93697d3edfd9..fe0453c9623fb 100644
--- a/drivers/cpufreq/imx6q-cpufreq.c
+++ b/drivers/cpufreq/imx6q-cpufreq.c
@@ -55,7 +55,6 @@ static unsigned int max_freq;
 static unsigned int transition_latency;
 
 static u32 *imx6_soc_volt;
-static u32 soc_opp_count;
 
 static int imx6q_set_target(struct cpufreq_policy *policy, unsigned int index)
 {
@@ -330,6 +329,7 @@ static int imx6q_cpufreq_probe(struct platform_device *pdev)
 	const struct property *prop;
 	const __be32 *val;
 	u32 nr, i, j;
+	u32 soc_opp_count = 0;
 
 	cpu_dev = get_cpu_device(0);
 	if (!cpu_dev) {
-- 
2.53.0


