Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A1BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57BKhrzrww/oj2bQTyT2tJUOOogiCFZ1vx7aZ99NI/s=; b=43gMG6BigYOX5k8Cvv9TjOzxCB
	a/gHnxt2OjaSTn4OkbcRXEgCWP6yjZBOkZeaviSq7KkaJpofQo7TTNUtEhE1Emo+pGvGZxRcjtiYk
	6TrLyKNdRiPavYg+G93U3vhHXINC9Dppji7M5GE8afYAvqADqS3YSdScjQDADT3Yhj5Xbsk+FlwZD
	hlpOVPwIx2VKCjYHfuj24WgUAeFV7ChIOQUWUTAKUjhUqKWu89TU8pAyC9fa5IK2YYY4XssQS5Ofn
	HzjYWSM0dVWVnvru4VXmI9tsJiBx1x80atgIZ2x62rLZqRv1DkHOGBe82L1+JMWxREuF5DD57xJEh
	I5IFbhdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOv58-0000000FBdM-023o;
	Mon, 18 May 2026 10:20:18 +0000
Received: from jpms-ob02-os7.noc.sony.co.jp ([2001:cf8:acf:41::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOv54-0000000FBZG-2uAp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1779099615; x=1810635615;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=57BKhrzrww/oj2bQTyT2tJUOOogiCFZ1vx7aZ99NI/s=;
  b=ah/vDZ3azGK7/OJLjd4gC9TYmHsKGKqf5K5eeiLS149UKTXb/sOer7ve
   c3blPVbe5ffK8/dPs0WgNju7gNr1fQ4WiI5u0h/F13Zfk5MP1O4biUedV
   Z8I1AL14YZtdabBfyQ+kwVik+AXF+Zr09ezLNQ7J2oUpdAfYqQCmdCX7J
   bWnQLrMzFbl3d+/uP3feF6BwdNIFKySS/Tirb4SELtq6ng+DXXfLAAUCy
   wr8BwhW9WA6fM9rS3wt0G6RO8VspktzaNCEv3XW+Jz3usgGFL3fRKHAaN
   nxHr7nnqLmBcu9KFoLn6Lv7/NIIeBFP4xAGLFJlTs2QLBWC/aaJG3mME/
   Q==;
X-CSE-ConnectionGUID: eJ7VhhBlTgOqf+CyIiS/jA==
X-CSE-MsgGUID: 0dvVNZGXTt6NSMxl4gCr7Q==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:20:04 +0900
X-CSE-ConnectionGUID: 4jQSlB5ITpKgajH3gphI2g==
X-CSE-MsgGUID: spYUaIejTPeTbctKBbAqhA==
X-IronPort-AV: E=Sophos;i="6.23,241,1770562800"; 
   d="scan'208";a="56041670"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 18 May 2026 19:20:04 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Mon, 18 May 2026 19:19:58 +0900
Subject: [PATCH v5 2/4] kernel: param: initialize module_kset in a
 pure_initcall
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-acpi_mod_name-v5-2-705ccc430885@sony.com>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
In-Reply-To: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Mike Leach <mike.leach@arm.com>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>, 
 linux-modules@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Sumit Gupta <sumitg@nvidia.com>
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=50TjhgnVmYRUF6Xy+gJCwmaxbDzOViHP9xJuJuhoEVo=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhiyu5xdWZa8Xc9j/a/HiLfnr7GZMC0mpaJOM53hY9ts7L
 vfTnPfBHaUsDGJcDLJiiiylStW/9q4IWtJz5rUizBxWJpAhDFycAjCRAGlGhp35Qbwq4genvz/c
 eqls3p7zR5wUv7ScuuN55aj5/X/+XJYMf+X3CN8/0yHf2HpXsvXSPRsfwZ+H1wVz7Up/0GhxY2f
 iTUYA
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_032014_973637_B4F46340 
X-CRM114-Status: GOOD (  14.59  )
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

Commit "driver core: platform: set mod_name in driver registration" will set
struct device_driver's mod_name member for platform driver registration. For a
driver to be registered with its mod_name set, module_kset needs to be
initialized, which currently happens in a subsys_initcall in param_sysfs_init().
The tegra cbb drivers register themselves before module_kset init, in a
core_initcall. This works currently because lookup_or_create_module_kobject(),
which dereferences module_kset via kset_find_obj(), is not called if mod_name
is not set, which is the case now.

So in preparation for the commit "driver core: platform: set mod_name in driver registration",
move module_kset init to pure_initcall level, ensuring it happens before tegra
cbb driver registration.

Suggested-by: Gary Guo <gary@garyguo.net>
Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
Patch 4 depends on this patch
---
 kernel/params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/params.c b/kernel/params.c
index 74d620bc2521..ac088d4b09a9 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -957,7 +957,7 @@ static int __init param_sysfs_init(void)
 
 	return 0;
 }
-subsys_initcall(param_sysfs_init);
+pure_initcall(param_sysfs_init);
 
 /*
  * param_sysfs_builtin_init - add sysfs version and parameter

-- 
2.43.0


