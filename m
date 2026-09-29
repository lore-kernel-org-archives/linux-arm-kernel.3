Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484D6CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JfjX+iF5/bHLkaIyZ2oMiJBRftIn0tQQUD5mOQ33a9o=; b=nCalF5Ku+MM7oK
	4Bmnmudk6y0iDIyK7cCNRVDw14fENC7ZkBvpALevlbNhsFYatSNDfvfIrSHVh7mrUDcc4+enIbkpN
	vEHaL3oK2uOeYzLNSwA7FR74mymyhTQPHlrvPyAptt7T5rxoJEUoWhqZTRLn7B7JedzDRqVgYPz5d
	e56w/LZFKRYmp9hfp+PBFTB87+sJJ0URaAGWua98TmOJSwn2gcb0Gj3lhcy9D4kkvukrtCvsc8dG6
	pSgKSjOI02qwVBbQ/M0jzIpbs8OHapEkafA2Ka+86OZBkAfKt1AVv2A+67Mw4uLXMt7Y0eKQzPR64
	ClKC1nM82inJEH1DrjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBb9U-000000046zz-2yMW;
	Tue, 29 Sep 2026 16:58:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBb9R-000000046z3-405O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:57:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 458461516;
	Tue, 29 Sep 2026 09:57:52 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 638A73F85F;
	Tue, 29 Sep 2026 09:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790701075; bh=8fXuBMTuT7/ajr1ByNzkN+6WlqLmt7pB0qIvAjl7yUs=;
	h=From:Subject:Date:To:Cc:From;
	b=D3gyaQMkTzjF+zqrbqpopa+65GMPLxMhu+D1ujRmUDG7ojcA6NDLEL+Ib51MN9+rq
	 QAYocfxNcMn8vZErRDPgIrO8+7yg28YRZIVH4usQI/kSrRUaeXbV2De3tgGj8tvVsA
	 ViBqk2MVwNewyUm+TV2MvyYyfQEvbP0QjnAgGUO0=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 0/3] arm64/virt: Add Arm CCA measurement register
 support
Date: Tue, 29 Sep 2026 17:57:46 +0100
Message-Id: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAruu2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNL3cSi3Pjk5MT43CLdRENLkySjVEujZENzJaCGgqLUtMwKsGHRsbW
 1AALSt7FcAAAA
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 thuth@redhat.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2943; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=8fXuBMTuT7/ajr1ByNzkN+6WlqLmt7pB0qIvAjl7yUs=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqu+4QUPDb2QnF/a5utA7oW1E4VdgU7ErT9zJCU
 VfWeKFUbM2JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarvuEAAKCRBt1cPRWsUx
 MyXWC/9eYmpMk5a1yC3S4+KZ+qKJOFsNto/1lpqsbF8A/D2V36i1aCAMWEdX2XsNR2J2jgD1ALt
 P3QdRjM4UhAyoSOuwbT1stx4gY3Ai1sCHHBV5jXgg+4hst8YWTK39b4S9pWs9MqQ5SJahAImtIM
 iOoPQ8OAoFxarJ88ypRyvX93MSpwhzcRYN457V4mwuT62LdZXSVVD7MAkzTpClqjl9J5P7kQAS8
 QK3+wkUlzkckkHH94iqrz9W1X3uLGer7/2cySwFlFIGpuwQWnFWwuNV/L4Ay+x62yYKBjh0EtwW
 ArM4024fwerybc95IOI3Oogp6pEGamptHlYmAEEz14VQ6mhsxljGX4KebsdfS+5PW46CEjdnNXE
 d9nscgXteIizAWbpC1PZsLOWVf/sX9pseWwU/bc3cPyO36+0ZTIGgEJdgFRqVhucMAGcwCiy4sh
 oYpYPDXKtnaHkchtO0VKG7WYD/Byux2Jo/Hl7x5zlPZ/43ibrUXjV8BdmiuZS9L4P3sBM=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_095758_091474_CA48847B 
X-CRM114-Status: GOOD (  11.79  )
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

This series adds support for Arm Confidential Compute Architecture (CCA)
measurement registers in the Linux kernel, enabling guest Realms to
access, extend, and expose measurement values for attestation and runtime
integrity tracking.

The Realm Management Monitor (RMM) defines a set of measurement registers
consisting of a Realm Initial Measurement (RIM) and a number of Realm
Extensible Measurements (REMs). This series introduces the necessary
infrastructure to interact with these registers via the RSI interface
and exposes them to userspace through the TSM measurement framework.

At a high level, the series includes:
 - Helper interfaces for reading and extending measurement
   registers via RSI
 - Definitions for Realm hash algorithms as defined by the 
   RMM specification
 - Integration with the TSM measurement subsystem and sysfs
   exposure for userspace visibility and interaction

After applying this series, measurement registers are exposed under:
    /sys/devices/virtual/misc/arm_cca_guest/measurements/

  Where:
   - rim is read-only (initial measurement)
   - rem[0-3] are read/write (extensible measurements)
   - The hash algorithm reflects the Realm configuration

Patch summary:
 1. arm64: rsi: Add helpers for Arm CCA measurement registers
   - Introduces RSI helper APIs to read and extend RIM/REM registers

 2. arm64: rsi: Add realm hash algorithm defines
   - Adds definitions for SHA-256 and SHA-512 identifiers returned
     by the RMM

 3. virt: arm-cca-guest: Add support for measurement registers
   - Integrates with TSM measurement framework
   - Implements measurement register refresh and extend operations
   - Exposes registers via sysfs using a misc device
   - Dynamically configures hash algorithm and digest size per Realm

This enables a consistent mechanism for attestation-related measurements
in Arm CCA guests and aligns with the kernel TSM measurement abstraction.

This patch based on arm64 tree's for-next/smccc-bus

---
Changes in v2:
- rebase to arm64 tree's for-next/smccc-bus
- Link to v1: https://lore.kernel.org/all/20260413084957.327661-1-sami.mujawar@arm.com/
---

---
Sami Mujawar (3):
      arm64: rsi: Add helpers for Arm CCA measurement register operations
      arm64: rsi: Add realm hash algorithm defines
      virt: arm-cca-guest: Add support for measurement registers

 .../sysfs-devices-virtual-misc-arm_cca_guest       |  38 +++
 drivers/virt/coco/arm-cca-guest/Kconfig            |   1 +
 drivers/virt/coco/arm-cca-guest/main.c             | 282 ++++++++++++++++++++-
 include/linux/arm-rsi-cmds.h                       | 105 +++++++-
 include/linux/arm-smccc-rsi.h                      |   7 +
 5 files changed, 430 insertions(+), 3 deletions(-)
---
base-commit: bce57945f5e7207960b2bd567a6e880f90258ffb
change-id: 20260929-arm_cca_mr-a194b2e92c17

Best regards,
-- 
Sincerely,
Yeoreum Yun


