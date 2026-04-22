Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C64F9B5F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:References:In-Reply-To
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pkPs3Vc6paRjccGHW+dfs6voI0geE6f+u37jCbP6Uo=; b=4v3OSggI0jnnjtMwFWfEyKdUE2
	buH9Spv8mOyhAER733sxpGDNL2YoUgYSzdbJFXx8ng5rTp4v+w3DlCdvnetmVjXp6xV3xJ3g5IPot
	tVlMCViyc5S1RSnUpZAbU92uXkTL+bXg+iKPp4YDcwh5/MgGBycsmzG05ZNH4HPOgmdx0IdF3LjAh
	yicUlQRkL7uJjuC8wMtwBlNM06q7HFb5zjyY1LFTcClhL5FhEO5rWxB4HziIqBnJt4hVZdvyvQ4+i
	R7Q+nVIbWmlF0Qn+WNx4O/m+fWgyMCKgtKiXvTKgHRa2yRBe5anHrsP6IrA1ZNrsgLNs3RXaX7FIB
	mCqZ8xXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUD0-00000009t2L-3IxQ;
	Wed, 22 Apr 2026 09:49:26 +0000
Received: from jpms-ob02-os7.noc.sony.co.jp ([2001:cf8:acf:41::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUCu-00000009t0P-2Ark
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 09:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1776851360; x=1808387360;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:in-reply-to:references:to:cc;
  bh=9pkPs3Vc6paRjccGHW+dfs6voI0geE6f+u37jCbP6Uo=;
  b=fumsD8LAYH8WyDzdwwA17qNVBmVjufUaoMI3+n/5c0rfb7SWTX9SnuuA
   kcMSZ25f/SSEEUVMNh3TV6zfvkqcp7mEDYoAcCAGN90zG8WWONfZDrjWC
   DPK5ZhgdxWHgIANCli3i21LF7Uz3sIqCWf68NNJBnDUDXnNuihuALEn5g
   qLfm4q37Ek6UV6oAxS+7dhlC7tV2WeUf6eJjCjRIEmJLRXzTgovTB1R04
   gStytIeRsjq0OqD7r3mU6TbdgYFW/oW+nc6v8u75lstohGDc1rDn1aLXE
   VOYkuWp3MAQVgjQuz1oSgaU1NKZC1O7rrHNa/75ruKKaZ08bmkPPOGkbh
   g==;
X-CSE-ConnectionGUID: k8my68O9RKuJfq8789LHEQ==
X-CSE-MsgGUID: wBw8+8RgQYue9sLkPFuAnw==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 18:49:14 +0900
X-CSE-ConnectionGUID: GBF2ZWP0TpeP2oXg7nUOEQ==
X-CSE-MsgGUID: b0ydDtKiSKCjtrykRa7W3Q==
X-IronPort-AV: E=Sophos;i="6.23,192,1770562800"; 
   d="scan'208";a="51446125"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 22 Apr 2026 18:49:13 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Subject: [PATCH v3 0/4] Enable sysfs module symlink for more built-in
 drivers
Date: Wed, 22 Apr 2026 18:49:02 +0900
Message-Id: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI6Z6GkC/3WN0Q6CIBhGX8VxHU3AMLvqPVpzCD9Jm+DAWM757
 oHduLYuz/ad8y0ogDcQ0KVYkIdognE2ATsUSPbCPgAblRjRkvKyIhwLOZp2cKq1YgCseXUSNQf
 G6g4lZ/SgzXvr3e5fDq/uCXLKkbzoTZicn7fDSPLuXzsSXGIiKtVwrc5cNtfg7HyUbkA5HelOp
 uRXpkmGmumGkVIJxXbyuq4fC4SJz/gAAAA=
X-Change-ID: 20260416-acpi_mod_name-f645a76e337b
In-Reply-To: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
References: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=4781;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=GmzcpVaW54kBYM6ZNlSdGdXppvRENvMzYTTYU+OtJCg=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhswXM6fLrX8v6BaSdzKn8GzPj74bYVsWpS8RMPkifqmFe
 bf/8806HaUsDGJcDLJiiiylStW/9q4IWtJz5rUizBxWJpAhDFycAjAR3oMM/9M/3JbctTpeakV2
 hOv0xa4CzJqzt5+pP7usMctY61NaczYjwzeOGE8GwSr1NdJNZUpS7z4vttCRCYsIzasuvmO75Pt
 JNgA=
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_024920_808793_9D7C1BBA 
X-CRM114-Status: GOOD (  17.02  )
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

struct device_driver's mod_name is not set by a number of bus' driver registration
functions. Without that, built-in drivers don't have the module symlink in sysfs.
We want this to go from unbound driver name -> module name -> kernel config name.
This is useful on embedded platforms to minimize kernel config, reduce kernel size,
and reduce boot time.

In order to achieve this, mod_name has to be set to KBUILD_MODNAME, and this has
to be done for all buses which don't yet do this.

Here are some treewide stats:
- 110 registration functions across all bus types
- 20 of them set mod_name
- Remaining 90 do not set mod_name:
    1. 36 functions under pattern 1:
        They have a __register function + register macro. KBUILD_MODNAME needs to
        be passed and the function needs to take mod_name as input.
    2. 42 functions under pattern 2:
        These have no macro wrapper. They need a double-underscore rename + macro
        wrapper to make them similar to pattern 1.
    3. Remaining 12 do not have such a clean registration interface. More analysis
       is required.

We plan to start with pattern 1, since it's the easiest category of changes.
Within that, for now we're only sending the platform patch. If we get the go-ahead
on that, we'll send the remaining ones.

Patch 3 depends on patches 1 and 2.

Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
Changes in v3:
- Initialize module_kset on-demand (Greg)
- Make coresight driver registration happen through a macro (Greg)
- Split up the patch adding mod_name to platform driver registrations (Greg)
- Link to v2: https://patch.msgid.link/20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com

Changes in v2:
- Drop acpi patch, send platform instead (Rafael)
- Link to v1: https://patch.msgid.link/20260416-acpi_mod_name-v1-0-1a4d96fd86c9@sony.com

To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>
To: James Clark <james.clark@linaro.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Richard Cochran <richardcochran@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: driver-core@lists.linux.dev
Cc: rust-for-linux@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Rahul Bukte <rahul.bukte@sony.com>
Cc: Daniel Palmer <daniel.palmer@sony.com>
Cc: Tim Bird <tim.bird@sony.com>

---
Shashank Balaji (4):
      kernel: param: initialize module_kset on-demand
      coresight: pass THIS_MODULE implicitly through a macro
      driver core: platform: set mod_name in driver registration
      docs: driver-api: add mod_name argument to __platform_register_drivers()

 Documentation/driver-api/driver-model/platform.rst |  3 +-
 drivers/base/platform.c                            | 21 +++++++----
 drivers/hwtracing/coresight/coresight-catu.c       |  2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  9 ++---
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |  3 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |  3 +-
 drivers/hwtracing/coresight/coresight-replicator.c |  3 +-
 drivers/hwtracing/coresight/coresight-stm.c        |  2 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       |  2 +-
 drivers/hwtracing/coresight/coresight-tpdm.c       |  3 +-
 drivers/hwtracing/coresight/coresight-tpiu.c       |  2 +-
 include/linux/coresight.h                          |  7 ++--
 include/linux/platform_device.h                    | 17 ++++-----
 kernel/params.c                                    | 41 +++++++++++++---------
 rust/kernel/platform.rs                            |  4 ++-
 16 files changed, 72 insertions(+), 52 deletions(-)
---
base-commit: 6596a02b207886e9e00bb0161c7fd59fea53c081
change-id: 20260416-acpi_mod_name-f645a76e337b

Best regards,
--  
Shashank Balaji <shashank.mahadasyam@sony.com>


