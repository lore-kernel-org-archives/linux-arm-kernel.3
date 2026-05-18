Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E256CD4F55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNRQ31g1BKh9xMFz1czeGZGptMasxgt/rCDZtMGdZYw=; b=cxDeVOYkP3O3qLc/QB9AKUkk89
	Fv1ndqL3Kc1VOOj+zdU54xrTlsoPR522npJY5BEGVrswsfVIgvNGg5mFfzovzSO3QjJ+Aiv9HM9rB
	u5jd+Bu8IxuELW9sbREoUEi2zwk1jKwWSYork8PZ3y/5sWJofs4YJipAX3zRjrf5G3nJEZS5qwzn4
	yC9oYUWYpJCzP/gm2PHFkyxjhPR+Z7VDk5kmSWTaVOCLUl+t62oD7hBZaM5OQPF5CVx5r4m/cHxiX
	iYjrvhp97IownNlcRt47elIQq+Xu0ukzjCzYTnPy4EOKBCgyHC6TKi8XSHttKfxZqndbLJHnlGZlZ
	uB8MEWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOv57-0000000FBd7-3f6N;
	Mon, 18 May 2026 10:20:17 +0000
Received: from jpms-ob02-os7.noc.sony.co.jp ([2001:cf8:acf:41::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOv52-0000000FBZG-3P3I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1779099613; x=1810635613;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=pNRQ31g1BKh9xMFz1czeGZGptMasxgt/rCDZtMGdZYw=;
  b=vpQYok0lAkhav++1yL+5avq2XZogqQZezThttGVJ/RPj0JEelXPPyQvH
   l2/p8pknW3swsSozzbkV41BYq76A9iKcE644NPZHSUvFNxFv1JowsDEpM
   orUJpheQn9C+SJfm2JSmchr/BY9gsqUSaTjcSinVsTIo9xukKAcpplOd0
   kxgROHv8t9OFJtuX0afZg3uh+OqYGC6LVh+IqLo3AXLbrn2vM/73ZuLmw
   NRHFC9wswXXlRclb5lZpJy+zaoXUUGg40uH5DilgZjn4sPqw07gXOTjzC
   umIAVS+Nb3WAbuImXn8sxWhaswV6iFWpEUbh5CmbAH7DiOpeN8T0vlLpF
   A==;
X-CSE-ConnectionGUID: ptkdQHzTSGmrHka7n6CK3g==
X-CSE-MsgGUID: q3iPJvEDTyKbOAbH//esGQ==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:20:04 +0900
X-CSE-ConnectionGUID: eNQHig6rTSyeNFsq5eNCUA==
X-CSE-MsgGUID: bJzPrHHERBWQt31IwEhhsw==
X-IronPort-AV: E=Sophos;i="6.23,241,1770562800"; 
   d="scan'208";a="56041668"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 18 May 2026 19:20:03 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Mon, 18 May 2026 19:19:57 +0900
Subject: [PATCH v5 1/4] soc/tegra: cbb: Move driver registration from
 pure_initcall to core_initcall
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-acpi_mod_name-v5-1-705ccc430885@sony.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2338;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=cb8qj4xhg343NbZdyo6rpt+QT8xtsS/YnAvcGC2vlak=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhiyu5xfqvy0NverW9HcJ0/+jbb/frg7dt2Tnlxm6R3Qf1
 ehr+fDv6ShlYRDjYpAVU2QpVar+tXdF0JKeM68VYeawMoEMYeDiFICJ/FRh+Ml4ZabnJgHe1ruZ
 66Rfir73lW7Y/ehHoIfvgbd5bt4z/wQw/E/Mmq3LedrX7smVb8HzxcRfmQT6WPgLH3r16UWy0bK
 UhywA
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_032013_100937_A6B5FE5A 
X-CRM114-Status: GOOD (  13.91  )
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
pure_initcall. This works currently because lookup_or_create_module_kobject(),
which dereferences module_kset via kset_find_obj(), is not called if mod_name
is not set, which is the case now.

So in preparation for the commit "driver core: platform: set mod_name in driver registration",
move tegra cbb driver registration to core_initcall level, and commit
"kernel: param: initialize module_kset in a pure_initcall" will move module_kset
init to pure_initcall level, ensuring module_kset init happens before tegra cbb
driver registration.

Suggested-by: Gary Guo <gary@garyguo.net>
Acked-by: Sumit Gupta <sumitg@nvidia.com>
Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
Patch 4 depends on this patch
---
 drivers/soc/tegra/cbb/tegra194-cbb.c | 2 +-
 drivers/soc/tegra/cbb/tegra234-cbb.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
index ab75d50cc85c..2f69e104c838 100644
--- a/drivers/soc/tegra/cbb/tegra194-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
@@ -2342,7 +2342,7 @@ static int __init tegra194_cbb_init(void)
 {
 	return platform_driver_register(&tegra194_cbb_driver);
 }
-pure_initcall(tegra194_cbb_init);
+core_initcall(tegra194_cbb_init);
 
 static void __exit tegra194_cbb_exit(void)
 {
diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index fb26f085f691..785072fa4e85 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -1774,7 +1774,7 @@ static int __init tegra234_cbb_init(void)
 {
 	return platform_driver_register(&tegra234_cbb_driver);
 }
-pure_initcall(tegra234_cbb_init);
+core_initcall(tegra234_cbb_init);
 
 static void __exit tegra234_cbb_exit(void)
 {

-- 
2.43.0


