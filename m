Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD96CDE03C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 08:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jow7ACN8gsAiWPFJ9OLl9hOOG8QGXocDXa4+IufHS5w=; b=zDZtlsIkgvT+L7D1/b+v2anuAB
	Aci+Jiaae8NIUpSPplfs95OcHsm6qtmtqi/eUbiVjnmrbmqFpZes/yVEeL2Zu6vVKS1xNFfTwz7wk
	C5oNy8l0qjFT1GT8QvT//9igFA5uwyRAfzsWS5pmKpOfbhCwlgh7ry6RljqDQAT/HVs3J2T06Ey82
	Z1KjtlOoPwGKuth8on2EKZXLWdJXvWSc+77aIVWu+bysXksvzoDkIYlaOador+QNhkyxuuqefnYw3
	Q1U938HXFwT4+8LVW3pAfhczGoXpB1G4enlMMGfemaHwmPn4+ynoNph5PB4ibSIACTJKAByP/LEYf
	RqlNI1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpWf-0000000BplX-2LmO;
	Fri, 14 Nov 2025 08:51:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpWb-0000000BpkL-1FlC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 08:51:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A5AC44552;
	Fri, 14 Nov 2025 08:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B2DC4CEF5;
	Fri, 14 Nov 2025 08:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763110280;
	bh=55xIhoOmV8clm7ahG6/Y9I43bRUI1+9IozWLQorei9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PI3OILedmZAte/njHsuiubEltqHMxrkruUK/JOX0Td3QyyiCsBsX2L0/F9ciKoHSQ
	 qTCVoFp2mQ52khQfOb+pyQpTdpd9WZJur4muILTvw3Gy5zwKkprSgqxSCd08f8O8ZC
	 H89gqMomBmVGoq6US24EMXpQwv9hqAaV4234jTt2sbxeK7+9P5L9gAek6d8YWYvTU0
	 scHsnpn2JEvfBvk4V0bRYL7GN9eSU/VLKC7LD2QvtGh1qNH3vXxWSO9BcJerob5XCu
	 w7XtSodLzKbhw08SqCRROm+JaYwizj5i/r6Wab13j8Cg0O/7VfvpSQgblfgnroN7KW
	 4/qLXTg1HW7TA==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	ardb@kernel.org,
	mark.rutland@arm.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	shivendra.pratap@oss.qualcomm.com,
	leif.lindholm@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH 1/2] efi/reboot: Add support for EFI_RESET_PLATFORM_SPECIFIC
Date: Fri, 14 Nov 2025 14:20:57 +0530
Message-ID: <20251114085058.2195900-2-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114085058.2195900-1-sumit.garg@kernel.org>
References: <20251114085058.2195900-1-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_005121_387191_42636A17 
X-CRM114-Status: GOOD (  15.23  )
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

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

UEFI specification provides support for EfiResetPlatformSpecific reset
type as follows:

"
ResetSystem:

Calling this interface with ResetType of EfiResetPlatformSpecific
causes a system-wide reset. The exact type of the reset is defined
by the EFI_GUID that follows the Null-terminated Unicode string passed
into ResetData. If the platform does not recognize the EFI_GUID in
ResetData the platform must pick a supported reset type to perform.
The platform may optionally log the parameters from any non-normal
reset that occurs.
"

Lets use the ResetData to pass the platform specific reboot command
issued and leave it's interpretation to UEFI implementation following
the specification.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/firmware/efi/reboot.c | 25 +++++++++++++++----------
 include/linux/efi.h           |  5 +++--
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/efi/reboot.c b/drivers/firmware/efi/reboot.c
index ceae84c19d22..23a2fc68e9c9 100644
--- a/drivers/firmware/efi/reboot.c
+++ b/drivers/firmware/efi/reboot.c
@@ -10,7 +10,7 @@ static struct sys_off_handler *efi_sys_off_handler;
 
 int efi_reboot_quirk_mode = -1;
 
-void efi_reboot(enum reboot_mode reboot_mode, const char *__unused)
+void efi_reboot(enum reboot_mode reboot_mode, const char *data)
 {
 	const char *str[] = { "cold", "warm", "shutdown", "platform" };
 	int efi_mode, cap_reset_mode;
@@ -18,14 +18,18 @@ void efi_reboot(enum reboot_mode reboot_mode, const char *__unused)
 	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_RESET_SYSTEM))
 		return;
 
-	switch (reboot_mode) {
-	case REBOOT_WARM:
-	case REBOOT_SOFT:
-		efi_mode = EFI_RESET_WARM;
-		break;
-	default:
-		efi_mode = EFI_RESET_COLD;
-		break;
+	if (data) {
+		efi_mode = EFI_RESET_PLATFORM_SPECIFIC;
+	} else {
+		switch (reboot_mode) {
+		case REBOOT_WARM:
+		case REBOOT_SOFT:
+			efi_mode = EFI_RESET_WARM;
+			break;
+		default:
+			efi_mode = EFI_RESET_COLD;
+			break;
+		}
 	}
 
 	/*
@@ -43,7 +47,8 @@ void efi_reboot(enum reboot_mode reboot_mode, const char *__unused)
 		efi_mode = cap_reset_mode;
 	}
 
-	efi.reset_system(efi_mode, EFI_SUCCESS, 0, NULL);
+	efi.reset_system(efi_mode, EFI_SUCCESS, sizeof(data),
+			 (efi_char16_t *)data);
 }
 
 bool __weak efi_poweroff_required(void)
diff --git a/include/linux/efi.h b/include/linux/efi.h
index a98cc39e7aaa..5324db1518b6 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -256,6 +256,7 @@ typedef union efi_boot_services efi_boot_services_t;
 #define EFI_RESET_COLD 0
 #define EFI_RESET_WARM 1
 #define EFI_RESET_SHUTDOWN 2
+#define EFI_RESET_PLATFORM_SPECIFIC 3
 
 /*
  * EFI Runtime Services table
@@ -874,7 +875,7 @@ static inline bool efi_enabled(int feature)
 {
 	return test_bit(feature, &efi.flags) != 0;
 }
-extern void efi_reboot(enum reboot_mode reboot_mode, const char *__unused);
+extern void efi_reboot(enum reboot_mode reboot_mode, const char *data);
 
 bool __pure __efi_soft_reserve_enabled(void);
 
@@ -895,7 +896,7 @@ static inline bool efi_enabled(int feature)
 	return false;
 }
 static inline void
-efi_reboot(enum reboot_mode reboot_mode, const char *__unused) {}
+efi_reboot(enum reboot_mode reboot_mode, const char *data) {}
 
 static inline bool efi_soft_reserve_enabled(void)
 {
-- 
2.48.1


