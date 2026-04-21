Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8C0F327A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 06:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f1rqbhKZQGPjKM6rafuitMg1brZYqWCZ8SEDj4DxtvI=; b=gLMjdYUS4CAHQ2
	AmNg7dQ3ZfDquYN9klRxp0BaMIw4wD5hs5qzox2dJIBQqMSqBWJa9V3YrlR7KF1+hiKlgegtFmkbk
	FCj9pHLig9QjH0EJ62b/Tn0lq3QsAJWeXF3woRc9x9g2xBiJhrdz0KCHXR/nHGqDJHjfad2Waww7j
	ROtcY+Iw+oJyTqXRxR0C5dFKs8+quuzmFMwR8cpBaR4dG5GgLeGwhPgK59St1ktWFj2HFy2Rd0XUe
	ss7r8I5L030AkgJ8JeZwtFO3ho8ft3QidiXxiK9PVD0TRcGJW2teEnpEVEhda2IX3WVPDo/EvadrY
	Sb+ALT3XXo6GL5+jxa6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4CS-000000084Ew-2Jgj;
	Tue, 21 Apr 2026 06:03:08 +0000
Received: from jpms-ob02.noc.sony.co.jp ([2001:cf8:ace:41::5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4CQ-000000084Dv-0Kqd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 06:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1776751387; x=1808287387;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=f1rqbhKZQGPjKM6rafuitMg1brZYqWCZ8SEDj4DxtvI=;
  b=PLOM6i+pb/Wc/VAXUNvrt/ZQg9f1EBdtCYUNg16ImvasGJ/yy5Hwc5Vh
   VAdID/NiTzQgYc3V8MdlthfNP3TsH3IYkejnRHwdYIyWWyuxx88XFlls5
   oZMlt/CGGsOs/GUMMRPPol5hdMOwPABNlFsdcTxHyXHsHKEHbE20Gk+KR
   pdz6I+X9QD7Me/AjRRDEtBHThrkweD0iwx8PCU8s4DPwSGgjWrOvdflMz
   KB1CRJRd43E0pdi8nhqwIaCXKCyKpbHWB58M3+IdRoflh9atH6IC4kXBb
   LCfJr1eMa+TiJZqBJxxhmDT6jQWLFqg7Oaadv2ukhzwGc1TBOSrZqCdmP
   g==;
X-CSE-ConnectionGUID: VhygkFTGT/GsBaHxkuQY3Q==
X-CSE-MsgGUID: SiO/P9WCQzuiNBbPjVI6dw==
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::7])
  by jpms-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 15:03:01 +0900
X-CSE-ConnectionGUID: oHqa5c0bQkmnd/FbkksCDg==
X-CSE-MsgGUID: sNkWM31oRXWC9d+MIiZeAA==
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="603010287"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02.noc.sony.co.jp with ESMTP; 21 Apr 2026 15:03:00 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Subject: [PATCH v2 0/2] Enable sysfs module symlink for more built-in
 drivers
Date: Tue, 21 Apr 2026 15:02:33 +0900
Message-Id: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPkS52kC/3WNwQ6CMBAFf4Xs2RpasIgn/8MQUtpF1oSWtNhIS
 P9dwLPHSebNWyGgJwxwy1bwGCmQsxuIUwZ6UPaJjMzGIHIh85JLpvRE7ehMa9WIrJflRVUSi6L
 qYNtMHnv6HL1H8+Pw7l6o5z2yGwOF2fnlOIx89/61I2c546o0tezNVer6HpxdztqN0KSUvkNPr
 ey7AAAA
X-Change-ID: 20260416-acpi_mod_name-f645a76e337b
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4296;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=cq5j1N/tLVr7JQQAEFQwE+5Pc1i9Ewpt4Q5nOJ0PQwE=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhsznwoLVX6tvxWSsms4lb2Ccqn75as0Sc76jr5d9/8bMf
 Kemy3RXRykLgxgXg6yYIkupUvWvvSuClvScea0IM4eVCWQIAxenAExEUYuRYeaLwgCVNWcj9pwL
 CPLuevnPLLzETm5r0/JXT5zXp0e48DL8FeE59tqltJRZpLEgw8M7bc4cmW8Lj6h/uMfdcdbnb/0
 OJgA=
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_230306_354143_9D4E4EAB 
X-CRM114-Status: GOOD (  16.96  )
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

Patch 2 depends on patch 1, without which arm64 defconfig fails to boot with
patch 2.

Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
Changes in v2:
- Drop acpi patch, send platform instead (Rafael)
- Link to v1: https://patch.msgid.link/20260416-acpi_mod_name-v1-0-1a4d96fd86c9@sony.com

To: Kay Sievers <kay.sievers@vrfy.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>
To: James Clark <james.clark@linaro.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
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
Cc: driver-core@lists.linux.dev
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: rust-for-linux@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
Shashank Balaji (2):
      kernel: param: handle NULL module_kset in lookup_or_create_module_kobject()
      driver core: platform: set mod_name in driver registration

 Documentation/driver-api/driver-model/platform.rst |  3 ++-
 drivers/base/platform.c                            | 21 ++++++++++++++-------
 drivers/hwtracing/coresight/coresight-catu.c       |  3 ++-
 drivers/hwtracing/coresight/coresight-core.c       |  5 +++--
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |  2 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |  2 +-
 drivers/hwtracing/coresight/coresight-replicator.c |  2 +-
 drivers/hwtracing/coresight/coresight-stm.c        |  3 ++-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  3 ++-
 drivers/hwtracing/coresight/coresight-tnoc.c       |  3 ++-
 drivers/hwtracing/coresight/coresight-tpdm.c       |  2 +-
 drivers/hwtracing/coresight/coresight-tpiu.c       |  3 ++-
 include/linux/coresight.h                          |  3 ++-
 include/linux/platform_device.h                    | 17 +++++++++--------
 kernel/params.c                                    |  3 +++
 rust/kernel/platform.rs                            |  4 +++-
 16 files changed, 50 insertions(+), 29 deletions(-)
---
base-commit: b4e07588e743c989499ca24d49e752c074924a9a
change-id: 20260416-acpi_mod_name-f645a76e337b

Best regards,
--  
Shashank Balaji <shashank.mahadasyam@sony.com>


