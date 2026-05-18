Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F93CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:References:In-Reply-To
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZOl++/U8mgGRzBj4a+TwuLZWAUpFgNm4L1UTdesaiE=; b=bQBZbk8sVKQKctXP0ZMnqutzum
	sELrQzgJ7nXIRVAtdQOF4ItPfOudWgBG3onJMTZpMKuxntT9pO2MqfmY5qBIusxWYv5NnnO8Hmtj6
	zPciRtuBLC2u0stvEShXW89lF9etyk0bQabo4YKZzqpTQAJzUaJGVRdD9Wnqr97qLBiGvFdLO7NUq
	HUUcPAI4M12vmvRlKEbZSS5wzP04cL3Eyr9133h5FJZ2QVn76eWJR5hrHXjTOVEeuWUYpLCJZNNJD
	MDVRx82srcMk6nQOWruUoT0RSUnxewbv/rkOraUETgULtMs/3K5p84iZDT8Oykh1WwoypGufmTqQp
	LCvVtggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOv53-0000000FBbG-1hrE;
	Mon, 18 May 2026 10:20:13 +0000
Received: from jpms-ob02-os7.noc.sony.co.jp ([2001:cf8:acf:41::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOv4z-0000000FBZG-145f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1779099609; x=1810635609;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:in-reply-to:references:to:cc;
  bh=cZOl++/U8mgGRzBj4a+TwuLZWAUpFgNm4L1UTdesaiE=;
  b=XEToUaVNkIfIqoADhAuN5GLqu++Q/49WkNP8vmOToPMsRSnSV16RTl2M
   umnH5eCWZbrPxV03Xct1QoKpNFLYxS+VQknXHu65wqRNf1g0gK8JStdz9
   7Cz2ZTPgKngbbVJDzUHMHONIkuJrnZ3WMjQyIN5NfH5uqekb0M19G50fr
   gFq1BqHOOgLbAGGyaS2IhupVdfFnONL8Yu2oOcnrrc3WM7SdM7iHP/5/A
   bPubMvwp56kQ8p5rNz2Fttey1mDrr4GvaA38eeUPZ+89iiuupUVp7PXss
   nTpI1p/Y9IXukHHiyqyG4db1Gcf3MoLlumHnuIYefljSda2RfhkIsxN6p
   g==;
X-CSE-ConnectionGUID: uJsddEshRG28PMftYXzX7Q==
X-CSE-MsgGUID: bpyqI7EZRdmLC9moL67+xg==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:20:03 +0900
X-CSE-ConnectionGUID: ZtJ8Ohn+Q/eMmZQya0wKEA==
X-CSE-MsgGUID: DD9c8FoKSYeM1xB6sFyjqA==
X-IronPort-AV: E=Sophos;i="6.23,241,1770562800"; 
   d="scan'208";a="56041664"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 18 May 2026 19:20:02 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Subject: [PATCH v5 0/4] Enable sysfs module symlink for more built-in
 drivers
Date: Mon, 18 May 2026 19:19:56 +0900
Message-Id: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMznCmoC/3XNTQrCMBCG4atI1kbyZ2pceQ8RSZMZjdCmNFosp
 Xc31U0JuPxgnncmkqAPkMhxM5EehpBCbPPYbzfE3W17Axp83kQwoZnimlrXhWsT/bW1DVDUam8
 rDVJWNcmm6wHD+9s7X347veoHuOcSWS7uIT1jP34fDny5+9ceOGWUW+WNRn/QzpxSbMediw1Z0
 oNYYcFLLDKGSqKRnHnrZYHlGosSy4wtPyhANIgaC6zWuCqxyliIOmcVc6Ze43meP4TjS4dyAQA
 A
X-Change-ID: 20260416-acpi_mod_name-f645a76e337b
In-Reply-To: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5952;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=O9LaxrL42z23osWLnzEggWM0DPpmMqp5gkr/0jAvRGA=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhiyu5+evnVP3asuKrfB9fiR5U4v1xrjjqz68mfmiTvTsz
 i8K+m35HaUsDGJcDLJiiiylStW/9q4IWtJz5rUizBxWJpAhDFycAjCRO4yMDAf33V6tsyJwer/j
 u3Qt0+tOEVqPvGfO6tv/6OJNjV1/mUIZGTbZHzB4NnGT7YX1Fct/dUyy41bdqbliX3GrSWDHrV2
 aCYwA
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_032009_556122_6CE0EED9 
X-CRM114-Status: GOOD (  19.72  )
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

Patch 4 depends on patches 1, 2, and 3.

Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
Changes in v5:
- Move tegra cbb driver init to core_initcall and module_kset init to pure_initcall (Gary)
- Rename coresight_init_driver() to coresight_init_driver_with_owner(), and
  declare function prototype before use (Leo)
- Merge doc change patch with code change patch, so that __platform_register_drivers()
  prototype is changed everywhere in the same patch
- Link to v4: https://patch.msgid.link/20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com

Changes in v4:
- Initialize module_kset in do_basic_setup() before do_initcalls() (Gary)
- Add commit body to the documentation patch (Greg)
- Link to v3: https://patch.msgid.link/20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com

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
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Luis Chamberlain <mcgrof@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
To: Daniel Gomez <da.gomez@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
To: Aaron Tomlin <atomlin@atomlin.com>
To: Mike Leach <mike.leach@arm.com>
To: Leo Yan <leo.yan@arm.com>
To: Thierry Reding <thierry.reding@kernel.org>
To: Jonathan Hunter <jonathanh@nvidia.com>
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
Cc: linux-modules@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: Sumit Gupta <sumitg@nvidia.com>

---
Shashank Balaji (4):
      soc/tegra: cbb: Move driver registration from pure_initcall to core_initcall
      kernel: param: initialize module_kset in a pure_initcall
      coresight: pass THIS_MODULE implicitly through a macro
      driver core: platform: set mod_name in driver registration

 Documentation/driver-api/driver-model/platform.rst |  3 ++-
 drivers/base/platform.c                            | 21 ++++++++++++++-------
 drivers/hwtracing/coresight/coresight-catu.c       |  2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  9 +++++----
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |  3 +--
 drivers/hwtracing/coresight/coresight-funnel.c     |  3 +--
 drivers/hwtracing/coresight/coresight-replicator.c |  3 +--
 drivers/hwtracing/coresight/coresight-stm.c        |  2 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       |  2 +-
 drivers/hwtracing/coresight/coresight-tpdm.c       |  3 +--
 drivers/hwtracing/coresight/coresight-tpiu.c       |  2 +-
 drivers/soc/tegra/cbb/tegra194-cbb.c               |  2 +-
 drivers/soc/tegra/cbb/tegra234-cbb.c               |  2 +-
 include/linux/coresight.h                          |  7 +++++--
 include/linux/platform_device.h                    | 17 +++++++++--------
 kernel/params.c                                    |  2 +-
 rust/kernel/platform.rs                            |  4 +++-
 18 files changed, 50 insertions(+), 39 deletions(-)
---
base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
change-id: 20260416-acpi_mod_name-f645a76e337b

Best regards,
--  
Shashank Balaji <shashank.mahadasyam@sony.com>


