Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830B7CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 10:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rHdH/6OzUvgw/Z1d6llxooirf3DGCf2wJCl22Zrk6k=; b=Zm/8B0s3Iw8LnANSjcc+uvsKQ4
	JaZpRu7aP3KQZlsJaE0CdH4obnh2i93gLIXv5yjLCwobAULldg27WXAvrwoHHsZUFWtncJoz6z9c+
	TMtnMayhfXoJXAh0FPJQrf/VRoOJDy6TnD05XuGn1ObxTLFkuC/NzKgJ9PgFaEcj0Bh+jXSubwX5P
	NYxSx3qn1L5g50eBdwUyr5cWH+34asjj8pg7KlzAFGs1Nk6xvbU9wuyWTkUo3QcY42JvtY4f3LVHE
	xhxPihXIU0fQmgYUn1MHToPy/3fKYIgQeM+7Z3IATfD/ZnbFFNe7K5lEnTBRL2iAmiOQKgjCtbXrG
	wNQYsRhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzkY-0000000Ab9g-0MKb;
	Mon, 01 Jun 2026 10:20:02 +0000
Received: from jpms-ob02-os7.noc.sony.co.jp ([2001:cf8:acf:41::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzkU-0000000Ab8o-21Mo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 10:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1780309198; x=1811845198;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0rHdH/6OzUvgw/Z1d6llxooirf3DGCf2wJCl22Zrk6k=;
  b=vXRMUmaZtNOFF5jniDHLf/OoPRtBQP5Gwi2dmYDIZWtu8g0ppTcf9Su2
   bDSwv4zZmA0EBquA4gGPjXutJAX/W8M20LOGAvt+s8dVd8zd7c5r2BsAK
   NwFzuVZ7gWGRhnqdXqmwFhNjXgYxFvPh0mVZa9WE/SpRAQ0zia//YbVLO
   WuJwecO105AIV7sWwFvN05X2ngRlIIRpAcncRuNXzdXXb5k3wdejqgWUX
   3lHyZAOkVusAs0vAEP+Vf3DUPpzCfCkQ8WfSyiiNrf3LeQipWaffFIhIZ
   48nGvQ64beXDWdyE0k0W/KFw/ZGhXOn0C5uvI/S9Y5/FRyTlL+q5m4MYI
   g==;
X-CSE-ConnectionGUID: wgDUJjoSTa+2rwTgbl/fIg==
X-CSE-MsgGUID: y0GQRAflS2y3BV9SdeqmLg==
Received: from unknown (HELO jpmta-ob01-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::6])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 19:19:53 +0900
X-CSE-ConnectionGUID: sNjFdX7LQYSLb2PshMkn2Q==
X-CSE-MsgGUID: WqV8hNo5ShCKx694VddLQw==
X-IronPort-AV: E=Sophos;i="6.24,181,1774278000"; 
   d="scan'208";a="69757146"
Received: from unknown (HELO JPC00244420..) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob01-os7.noc.sony.co.jp with ESMTP; 01 Jun 2026 19:19:52 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: "Gary Guo" <gary@garyguo.net>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Petr Pavlu" <petr.pavlu@suse.com>
Cc: Shashank Balaji <shashank.mahadasyam@sony.com>,
	Rahul Bukte <rahul.bukte@sony.com>,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>,
	linux-modules@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Sumit Gupta <sumitg@nvidia.com>,
	"Suzuki K Poulose" <suzuki.poulose@arm.com>,
	"James Clark" <james.clark@linaro.org>,
	"Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Trevor Gross" <tmgross@umich.edu>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Shuah Khan" <skhan@linuxfoundation.org>,
	"Luis Chamberlain" <mcgrof@kernel.org>,
	"Daniel Gomez" <da.gomez@kernel.org>,
	"Sami Tolvanen" <samitolvanen@google.com>,
	"Aaron Tomlin" <atomlin@atomlin.com>,
	"Mike Leach" <mike.leach@arm.com>,
	"Leo Yan" <leo.yan@arm.com>,
	"Thierry Reding" <thierry.reding@kernel.org>,
	"Jonathan Hunter" <jonathanh@nvidia.com>
Subject: [PATCH v6] kernel: param: initialize module_kset in a pure_initcall
Date: Mon,  1 Jun 2026 19:19:41 +0900
Message-ID: <20260601101942.4002661-1-shashank.mahadasyam@sony.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ahEd4iC-2hqUbMy3@JPC00244420>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_031958_757479_A263AE7F 
X-CRM114-Status: GOOD (  17.70  )
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
Reviewed-by: Gary Guo <gary@garyguo.net>
Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
I'm sending v6 of just this patch to add the comment suggested by Petr and pick
up Gary's Reviewed-by. The rest of the patches are the same as v5.

Danilo, I'm assuming this series goes through driver-core. Could you please pick
up this version of this patch and the v5 of the others?
---
 kernel/params.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/params.c b/kernel/params.c
index 74d620bc2521..a668863a4bb6 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -942,9 +942,9 @@ const struct kobj_type module_ktype = {
 /*
  * param_sysfs_init - create "module" kset
  *
- * This must be done before the initramfs is unpacked and
- * request_module() thus becomes possible, because otherwise the
- * module load would fail in mod_sysfs_init.
+ * This must be done before any driver registration so that when a driver comes
+ * from a built-in module, the driver core can add the module under /sys/module
+ * and create the associated driver symlinks.
  */
 static int __init param_sysfs_init(void)
 {
@@ -957,7 +957,7 @@ static int __init param_sysfs_init(void)
 
 	return 0;
 }
-subsys_initcall(param_sysfs_init);
+pure_initcall(param_sysfs_init);
 
 /*
  * param_sysfs_builtin_init - add sysfs version and parameter
-- 
2.43.0


