Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A24FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 02:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dNZSXPaU7SwRa36y6sq2F/bVDLBSOQWDoZdmR4n+V4=; b=sTLE/VrKc1JEO7X1FCLAYrBpY0
	sjjRvannCsrlm9pjFwHsRhNP/bPGOTMK2lOlVXN82G2o/pkFJDVemaLgM2/54XzXRo0+2U67I3kL4
	+Q3W4iJo/JoR5tRq1luuWiQfmUgUmis/pbWjs9u/bd1CZpfD0A5XZeAC8Hy7JntgwVkjAQGGYDYkQ
	5dZc+56WMTm/+MAKw1ZIERAHbEZzxAt/PF2LB/G1P39bSNfokd7ALY8tkNETILJGgeqwRzygVUE3H
	JfzkoV10N8qhs7B89S9QWrfIuDsbQl65RL1JpJMP6sBvB7gVuHfVJ7rjIvvnp+Jh9HU0ChnFSMzpz
	wr0kZqrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBvQ-0000000G4G7-02Kl;
	Mon, 27 Apr 2026 02:42:20 +0000
Received: from jpms-ob01-os7.noc.sony.co.jp ([2001:cf8:acf:41::7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBvK-0000000G4CB-3KZt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 02:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1777257735; x=1808793735;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=9dNZSXPaU7SwRa36y6sq2F/bVDLBSOQWDoZdmR4n+V4=;
  b=eat6IDD1siQzd687/Jsf0bK4nklNc29Q4jPfDE0rD8DwpnwGwRy6OT99
   OjwgaXjH2/nuB13avYYz4J7pBa48ydtt36UlDZuA6kDuOMKUgohioUQXI
   7/q89WyVBACOhlSUP9a/OZA+2WzI5Pm4V10s085rgU6ckQRY98GPtGuQR
   P0wg6DEjYjfeL3KQOU1Y2ibJZaL9tvsJXspmU89SUYXeWCE+Nc56baAWy
   DHDY0G7Xi3UOpzu/f2NYcqZnzbrimreV1nCDTMFlZdEoADB5K12lQceRG
   zqTFgAK3mlJ2Exq30ijUfM72o7oI6fM/menSZ+zqBnwL7GGmBIk90WvVU
   A==;
X-CSE-ConnectionGUID: pCfZhu1zQ82fj1vjb9dKww==
X-CSE-MsgGUID: J/FJwCsAS0qcaWJPI2ZX+w==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 11:42:06 +0900
X-CSE-ConnectionGUID: lBeFfeEhTdCwKS4pXM/ITA==
X-CSE-MsgGUID: 4YLeYhxMRa2Yx4TTtDP+/g==
X-IronPort-AV: E=Sophos;i="6.23,201,1770562800"; 
   d="scan'208";a="52275261"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 27 Apr 2026 11:42:05 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Mon, 27 Apr 2026 11:41:24 +0900
Subject: [PATCH v4 4/4] docs: driver-api: add mod_name argument to
 __platform_register_drivers()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-acpi_mod_name-v4-4-22b42240c9bf@sony.com>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
In-Reply-To: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>, 
 linux-modules@vger.kernel.org
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=Ntxs4LrM9nMix70BKY/iLLvKQ7C8YsLHb8BjcRBYfF0=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhsx3Z37dP5picffdXU5/nzP2lrWFZ/60ahV/nu7mI7aK/
 cZZ928bOkpZGMS4GGTFFFlKlap/7V0RtKTnzGtFmDmsTCBDGLg4BWAiVjKMDJMEdF50TzXKPv9U
 TVJjv4b/9lrv4CvbMmqLLvH9zhC/8JqRYTLXfx+7IA9NltunV3Jzzgq5qj/X4WDjH9tf3l9O7fU
 w5AUA
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_194215_085492_25D7E083 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

Sync the function signature of __platform_register_driver() between the code and
the doc.

Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
 Documentation/driver-api/driver-model/platform.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/driver-model/platform.rst b/Documentation/driver-api/driver-model/platform.rst
index cf5ff48d3115..9673470bded2 100644
--- a/Documentation/driver-api/driver-model/platform.rst
+++ b/Documentation/driver-api/driver-model/platform.rst
@@ -70,7 +70,8 @@ Kernel modules can be composed of several platform drivers. The platform core
 provides helpers to register and unregister an array of drivers::
 
 	int __platform_register_drivers(struct platform_driver * const *drivers,
-				      unsigned int count, struct module *owner);
+				      unsigned int count, struct module *owner,
+				      const char *mod_name);
 	void platform_unregister_drivers(struct platform_driver * const *drivers,
 					 unsigned int count);
 

-- 
2.43.0


