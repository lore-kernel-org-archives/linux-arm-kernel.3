Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720A7C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 19:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epJRaVobxvGM+/1VLnT5WJdru54OJK34KQRZKM0LI5E=; b=DCDCd2kcnS4UynHsZWCyNkCO9G
	IzVElw9AJ2VycaHvqUoDawzYDqWp8W/RpFDsp6kTR7iAiXdI91kB7kHw50Du9NqbH6O8ohQf1Mp5j
	JY5zxI0FWHXBXNagWiH3SfuEQEoZQg3ooIHEJNSFWeaqoTbUvGheEICYch1OnvFIYZ9FRQOmrvVks
	AqBJ2uBmoSuA4gq2qoojsuVj+9AnzXFcmgI+GExHLKgnYnNxag9yYA0PUTe3VTGAG0LI+6u2C53/2
	DzMYuHoI0YV11056vkv/k72tv0boSYDL7X2bkPPqrpGZPMRSxLkjWk3jZLIZ+UbOWhvSfJt8HAfLB
	eByvZEFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5TAC-000000016E6-3GOy;
	Sat, 12 Sep 2026 19:13:24 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5TA9-000000016B7-0qss
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 19:13:23 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1473461a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 12:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240400; x=1789845200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epJRaVobxvGM+/1VLnT5WJdru54OJK34KQRZKM0LI5E=;
        b=MlkTeJozARMamTOiIodqZtlGQb3ZvX78YDVMSZKIMlIWOs2olM3ACd9FH/xuV/+tyc
         c3i/RSB3clJHzjw3QQgO2V6vxUYb+fnPtt6zWkfzCF0LEyvmr0+0dbBybw5yE6BNSgBX
         7knVvkB1vBPuI8V+kE7+LH6aLJHB3kcEhF3Zx5wc/rOv2vHwqhvuSJV+U7BMbo0fMmCM
         VcNNQnKNadUF9DENGapXkVYaZRDQPbLcK42q8UEkVQw+fDC04eYDGLaj0efSMe8kM0xR
         ZjRKl3LWi5AhqAHzQFmXH+B0ArcrSauz6fWDOAKa/inR1FwBIbvqVsMSPN+4WbyOzA6b
         b6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240400; x=1789845200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=epJRaVobxvGM+/1VLnT5WJdru54OJK34KQRZKM0LI5E=;
        b=mWGGK1+oZMWWL7wAR04cXaidfgHzi74ZPZwZt9PhTFiNuoRs4gu8S0x3+F5gUjhhfS
         NRETIicZJxXhkP723R6+qnN2TAr5hB46y6VNvbr2ObECaBkIqrS9JDJhaceXpy7K+Art
         84tr2YkoJfYPuNTzS/fA6Cl3IHLT4F7VtOxRf7oSK3FLTWRaYR5yGoNGUhlQy8pQXpcP
         TKzToxTyXGqus1p1UQEN6NTMhsatWQx/xWoPyc0oYcBtnC1wkWcaDw0Gg4kw5x5mNs9y
         eEB+1Z9CcMdrgDvsxCudaIY+uqjq5LQI2YKt3v0GZ0g+BUWwhjn8gldkQlMH7AJL/dKz
         rWWw==
X-Forwarded-Encrypted: i=1; AKwUvBwlxby4ea5TZExTiOsPr/KAbeUZnZ4siqCO0rGgHfBmw6smcIBs9isS0XKnEPdqWS/PZRWOxPgHj9B4zM9GRcF2@lists.infradead.org
X-Gm-Message-State: AFuF++nz0NOLunhZC2OenqSkRrkpgQ7PesvOkCteiuccMYiqQHSDuPCD
	ZoY9AQucibwOS9HEWFk9FpdFxYDJxEZPHKEZglV/NlslrSA/8WBqoz6q
X-Gm-Gg: AYBFou3Fiz6P3JnrckqvTHgSP/QUwdyCHDmO2K5F6a5/KAdpEPrf2ksHdtyl/+Kq8xc
	S7BRwzlBPc1+jQPKnO8Hc2gZi1QFHdVe4CORtIDbUec9E5g9pUcB4gtOtW3wgA0GabU4I8ADYup
	mctWsulKis3uOC3k+b/iu9jZlLuLyGprzKTQa1CBiDMI163j9D68i4bPAYgMCLLIeWcqkQYbMp5
	6oisKCKAxxrroEFY4z69IyZo1ine5Rf9xokdSEh+RYvbpz7RqsUUJhsz3s69WzU6Icr+e5PQJIR
	Z2MXXp0oQVCctyYbNmtj9CUUraGVEywpV1dBc/t3jQopDEZ6Gt58Mr6zZ17i+TBu32oV34DGAhB
	3/sIQR9dBv6f0JA3NG+U+jWqdTpdESeiN0o17ZR5Mdx3yInWGviNzmr9bdc1THfr5ETXP+32EZ0
	DWFv0mm4JN6J35/aekLi5cbj0taDCFHUUQkzT6l//+A30Jvgb0Z5fUMT2fpKYo23vi9BtW
X-Received: by 2002:a17:90b:4cce:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39d9bec4d91mr17930859a91.10.1789240400257;
        Sat, 12 Sep 2026 12:13:20 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:13:19 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	krzk@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH v2 5/5] powercap: intel_rapl: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:55 +0530
Message-ID: <20260912191156.185448-6-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_121321_254854_C65B289D 
X-CRM114-Status: GOOD (  12.73  )
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

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to pr_debug(). The %pe format specifier prints a symbolic error name
(e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls
back gracefully and prints the raw integer value. This makes messages more
readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/powercap/intel_rapl_msr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/powercap/intel_rapl_msr.c b/drivers/powercap/intel_rapl_msr.c
index a34543e66446..46972ee1ff84 100644
--- a/drivers/powercap/intel_rapl_msr.c
+++ b/drivers/powercap/intel_rapl_msr.c
@@ -582,8 +582,8 @@ static int intel_rapl_msr_init(void)
 	rapl_msr_platdev = platform_device_register_data(NULL, "intel_rapl_msr", 0, def,
 							 sizeof(*def));
 	if (IS_ERR(rapl_msr_platdev))
-		pr_debug("intel_rapl_msr device register failed, ret:%ld\n",
-			 PTR_ERR(rapl_msr_platdev));
+		pr_debug("intel_rapl_msr device register failed, ret:%pe\n",
+			 rapl_msr_platdev);
 
 	return 0;
 }
-- 
2.43.0


