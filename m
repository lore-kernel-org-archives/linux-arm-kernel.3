Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E633CF327AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 06:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5voK61wljPEL9MIXMGk8CLB5JWEHYq4E0HHNP/m5yA=; b=Ke/tBS1FBjcO0G4KUH9YOUmmBA
	Nnq80AQJnl/XU4hXswJzFsIw7QxwrJhnHDD4s3jf2cB5OlRbmmogpR1PHnfoKNfle0tmVsJtHHCxG
	bd/AixKXHmg3kXUTQXrKzuC2cJKnqPgLP3YWFB15+O4pUJ7U+9LPxkmprASPm2J2eDeIYyRqg2x1d
	k9hGPeydV4xKUgEsgdtS68tsZ8XgfbYjcKe7OAZG0/4gdbNsURexhleRbHzHua+hmdcZYvm8Vin6h
	9NQOCKIB7K0HH8MGs57bireSlWCehMV+TtAjC8P+ylv6G3/WNkHyFrSYIQ+nRzcn2/WzA4y6sXT1o
	kpeyVa3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4CW-000000084GN-3Y6x;
	Tue, 21 Apr 2026 06:03:12 +0000
Received: from jpms-ob02.noc.sony.co.jp ([2001:cf8:ace:41::5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4CS-000000084Dv-25In
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 06:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1776751389; x=1808287389;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=M5voK61wljPEL9MIXMGk8CLB5JWEHYq4E0HHNP/m5yA=;
  b=MIzS4K4FnHGhIKHSafcEu/PEEjo7OVVk+ceprYK/NJFg2nMU4HY9SOhF
   p3+m0lU/wqbGiOUDZcJvoIbjeyQdWyxvQQ15A4Mwqd9hlpY6LvUTDZTdX
   muhL+oZa98OExGOarCz6cXVA8A29H47A5I/gQA8jgTsPccSqa+U57zvSh
   nwqHbNbo5nlCeaK1pIABoopNfbbO7LaOVNJp8ENT/0Px+oZefKjyrzTdM
   22R9fBAfDZbO+hKq2/Pvpgc39v9CObhVQ8Z1bG7WbYmpTlIVmSywI2E/b
   YZQBI2oTXz9g8RzXmxXlla251yMxv1GUBPpMR+Z1w29vSx2tsfPKTg8oh
   g==;
X-CSE-ConnectionGUID: 2PrZgkTiRKeRYDjjMoU+RA==
X-CSE-MsgGUID: snKkoDgmRJ+6IREPdXni1g==
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::7])
  by jpms-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 15:03:02 +0900
X-CSE-ConnectionGUID: LTCnBPipSWGuc+TNvzgr2A==
X-CSE-MsgGUID: JCCWmIAIRXOq7fv7kUw5XA==
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="603010295"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02.noc.sony.co.jp with ESMTP; 21 Apr 2026 15:03:01 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Tue, 21 Apr 2026 15:02:34 +0900
Subject: [PATCH v2 1/2] kernel: param: handle NULL module_kset in
 lookup_or_create_module_kobject()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-acpi_mod_name-v2-1-e73f9310dad3@sony.com>
References: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
In-Reply-To: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
To: Kay Sievers <kay.sievers@vrfy.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Shashank Balaji <shashank.mahadasyam@sony.com>, 
 Rahul Bukte <rahul.bukte@sony.com>, Daniel Palmer <daniel.palmer@sony.com>, 
 Tim Bird <tim.bird@sony.com>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=TAodI4xUlrEwxLtFIUjQdPLrsiw6kWJSMaRMWxe/2RQ=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhsznwkKK3M8VPyyJ+fOob7rf792F97YK+ua1sro5tXz3q
 f29acOdjlIWBjEuBlkxRZZSpepfe1cELek581oRZg4rE8gQBi5OAZhI6wFGhhavhQvMf2ayxh3Z
 b3TgadmxWv7ixJPb9/4/9DNDa6ccgzrD/4y+FczS57NEdAJDtM/K+orHPZv5seyNw1tjpQufRea
 F8AEA
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_230308_768657_65BA5432 
X-CRM114-Status: GOOD (  10.21  )
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

module_kset is initialized in a subsys_initcall. If a built-in driver tries to
register before subsys_initcall with its struct device_driver's mod_name set,
then a null module_kset is dereferenced via this call trace:

     [    0.095865] Call trace:
     [    0.095999]  _raw_spin_lock+0x4c/0x6c (P)
     [    0.096150]  kset_find_obj+0x24/0x104
     [    0.096209]  lookup_or_create_module_kobject+0x2c/0xd8
     [    0.096274]  module_add_driver+0xd4/0x138
     [    0.096328]  bus_add_driver+0x16c/0x268
     [    0.096380]  driver_register+0x68/0x100
     [    0.096428]  __platform_driver_register+0x24/0x30
     [    0.096486]  tegra194_cbb_init+0x24/0x30
     [    0.096540]  do_one_initcall+0xdc/0x250
     [    0.096608]  do_initcall_level+0x9c/0xd0
     [    0.096660]  do_initcalls+0x54/0x94
     [    0.096706]  do_basic_setup+0x20/0x2c
     [    0.096753]  kernel_init_freeable+0xc8/0x154
     [    0.096807]  kernel_init+0x20/0x1a0
     [    0.096851]  ret_from_fork+0x10/0x20

So, return null in lookup_or_create_module_kobject() if module_kset is null.
Existing callers handle null already.

Fixes: f30c53a873d0 ("MODULES: add the module name for built in kernel drivers")
Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
This bug is triggered by the next patch on arm64 defconfig: tegra194-cbb tries
to register from a pure_initcall, and with the next patch adding mod_name, this
null deref is hit.
---
 kernel/params.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/params.c b/kernel/params.c
index 74d620bc2521..881c7328c059 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -752,6 +752,9 @@ lookup_or_create_module_kobject(const char *name)
 	struct kobject *kobj;
 	int err;
 
+	if (!module_kset)
+		return NULL;
+
 	kobj = kset_find_obj(module_kset, name);
 	if (kobj)
 		return to_module_kobject(kobj);

-- 
2.43.0


