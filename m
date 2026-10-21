Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1720C606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 23:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XfoQYVFQ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=MFblbEwM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jCgyO2THSSzeTo0gG7Yn5h5tZcIZdnA4VdSYaVd/Des=; b=XfoQYVFQPQxt0u1L/O7jJBmrEr
	ah7BcFO4wusnitFd9tdMlLFenushOtv/aYE+ipZ+Ku9wK0WzyfY/WfI9j7ysKEJfjiKtHDGH5SfUM
	spACiguzm3FmAQt4W7fDmkOL8xPj/hEubJjSC7/glkGjWjavHhifjQU/EK7IDJ4crInsq6+p7/U0h
	y+CwunitI3CdCEUvtX/vl3joNIRXruPwPYZILro8S78O1jSFE3vfTZAa7T9xNQ8SDEpA9ngub75+L
	oqpRpD4paANyuXwp6IJmuD6QAtYSpa27XhQ8CcpcjnWuUX+NmIUVXqA47jt2Gz5lMZQpmSIhFuO/h
	PljEUykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJfNu-0000000D14U-22nq;
	Wed, 21 Oct 2026 23:06:14 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJfNr-0000000D147-3V9J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 23:06:12 +0000
Received: by linux.microsoft.com (Postfix, from userid 1216)
	id 6118620B7166; Wed, 21 Oct 2026 16:06:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6118620B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1792623962;
	bh=jCgyO2THSSzeTo0gG7Yn5h5tZcIZdnA4VdSYaVd/Des=;
	h=From:To:Cc:Subject:Date:From;
	b=MFblbEwMkgUMuJk3LZ7u+Ew2M+fMRN26f1vTBTqQYugaEfkBDXBxeTHIt3WW5Ss+U
	 BVwiS01Bs3wepQXPEB13dRwrkJK/Z5YMqCJid70FXTGPx3GPAuKIeJRo8HOwe0dcrn
	 RlAf1o4tm9Bh0pKv+gskCKvkS6t83N9e4HvgEau0=
From: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
To: linux-efi@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Subject: [PATCH] arm64/efi: only disable the EFI runtime service that faulted
Date: Wed, 21 Oct 2026 19:05:03 -0400
Message-ID: <20261021230503.2075618-1-hamzamahfooz@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_160611_902837_CDB8F781 
X-CRM114-Status: GOOD (  21.31  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the firmware faults while executing an EFI runtime service, arm64
recovers from the exception, returns EFI_ABORTED to the caller and
disables all EFI runtime services for the remainder of the boot.

That is a rather big hammer. For instance, on Microsoft C2141 and C4143
machines, GetTime() faults when it is called by the rtc-efi driver:

  [Firmware Bug]: Unable to handle paging request in EFI runtime service
  WARNING: CPU: 9 PID: 1 at drivers/firmware/efi/runtime-wrappers.c:498 __efi_queue_work+0xe8/0x128
  Hardware name: Microsoft C2141/C2141  , BIOS C2141.BS.0301.AG.01.03 08/21/2024
  Call trace:
   __efi_queue_work+0xe8/0x128
   virt_efi_get_time+0x64/0xc0
   efi_rtc_probe+0x4c/0x188
   platform_probe+0x70/0xd8
   really_probe+0x190/0x3d8
   ...

and as a result, the variable services become unavailable too, which
breaks efivarfs (and with it efibootmgr, fwupd etc.), even though there
is nothing wrong with them.

So, if the faulting call was made via efi_rts_wq, which is the case for
all runtime services apart from ResetSystem() and the non-blocking
variable services, only disable the service that faulted: clear its bit
in efi.runtime_supported_mask, so that callers that check for it via
efi_rt_services_supported() no longer try to use it, and fail any
further calls to it with EFI_DEVICE_ERROR, which is what all runtime
service calls return today once they have been disabled. Otherwise,
and for the ACPI PRM handlers and the LKDTM tests, which have no bit
of their own, keep disabling all runtime services.

Update the LKDTM EFI_RUNTIME_CRASH test accordingly, as the fault it
provokes in GetNextVariableName() now only disables that service.

Signed-off-by: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
---
 arch/arm64/kernel/efi.c                 |  2 +-
 drivers/firmware/efi/runtime-wrappers.c | 85 ++++++++++++++++++++++++-
 drivers/misc/lkdtm/bugs.c               |  4 +-
 include/linux/efi.h                     |  1 +
 4 files changed, 88 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 0ec90fd17..330909d56 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -227,7 +227,7 @@ bool efi_runtime_fixup_exception(struct pt_regs *regs, const char *msg)
 
 	pr_err(FW_BUG "Unable to handle %s in EFI runtime service\n", msg);
 	add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_STILL_OK);
-	clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
+	efi_runtime_disable_faulting_service();
 
 	regs->regs[0]	= EFI_ABORTED;
 	regs->regs[30]	= efi_rt_stack_top[-1];
diff --git a/drivers/firmware/efi/runtime-wrappers.c b/drivers/firmware/efi/runtime-wrappers.c
index eea4f32e6..221196c95 100644
--- a/drivers/firmware/efi/runtime-wrappers.c
+++ b/drivers/firmware/efi/runtime-wrappers.c
@@ -132,6 +132,82 @@ struct efi_runtime_work efi_rts_work;
  */
 static bool efi_rts_abandoned;
 
+/*
+ * The EFI runtime services that are called via efi_rts_wq, and their bits in
+ * efi.runtime_supported_mask.
+ */
+static const struct {
+	unsigned int	mask;
+	const char	*name;
+} efi_rts_services[] = {
+	[EFI_GET_TIME]			= { EFI_RT_SUPPORTED_GET_TIME,
+					    "GetTime" },
+	[EFI_SET_TIME]			= { EFI_RT_SUPPORTED_SET_TIME,
+					    "SetTime" },
+	[EFI_GET_WAKEUP_TIME]		= { EFI_RT_SUPPORTED_GET_WAKEUP_TIME,
+					    "GetWakeupTime" },
+	[EFI_SET_WAKEUP_TIME]		= { EFI_RT_SUPPORTED_SET_WAKEUP_TIME,
+					    "SetWakeupTime" },
+	[EFI_GET_VARIABLE]		= { EFI_RT_SUPPORTED_GET_VARIABLE,
+					    "GetVariable" },
+	[EFI_GET_NEXT_VARIABLE]		= { EFI_RT_SUPPORTED_GET_NEXT_VARIABLE_NAME,
+					    "GetNextVariableName" },
+	[EFI_SET_VARIABLE]		= { EFI_RT_SUPPORTED_SET_VARIABLE,
+					    "SetVariable" },
+	[EFI_QUERY_VARIABLE_INFO]	= { EFI_RT_SUPPORTED_QUERY_VARIABLE_INFO,
+					    "QueryVariableInfo" },
+	[EFI_GET_NEXT_HIGH_MONO_COUNT]	= { EFI_RT_SUPPORTED_GET_NEXT_HIGH_MONOTONIC_COUNT,
+					    "GetNextHighMonotonicCount" },
+	[EFI_UPDATE_CAPSULE]		= { EFI_RT_SUPPORTED_UPDATE_CAPSULE,
+					    "UpdateCapsule" },
+	[EFI_QUERY_CAPSULE_CAPS]	= { EFI_RT_SUPPORTED_QUERY_CAPSULE_CAPABILITIES,
+					    "QueryCapsuleCapabilities" },
+};
+
+/*
+ * The EFI runtime services that have been disabled because they faulted. This
+ * is tracked separately from efi.runtime_supported_mask, so that services that
+ * the firmware reports as unsupported can still be called.
+ */
+static unsigned int efi_rts_faulted;
+
+static unsigned int efi_rts_mask(enum efi_rts_ids id)
+{
+	return id < ARRAY_SIZE(efi_rts_services) ? efi_rts_services[id].mask : 0;
+}
+
+static bool efi_rts_service_faulted(enum efi_rts_ids id)
+{
+	return efi_rts_faulted & efi_rts_mask(id);
+}
+
+/**
+ * efi_runtime_disable_faulting_service() - disable a faulting runtime service
+ *
+ * Called by architecture code after it has recovered from an exception taken
+ * by the firmware while executing an EFI runtime service. If the call was made
+ * via efi_rts_wq, only the service that faulted is disabled, so that the other
+ * ones remain usable. Otherwise, all EFI runtime services are disabled.
+ */
+void efi_runtime_disable_faulting_service(void)
+{
+	enum efi_rts_ids id = efi_rts_work.efi_rts_id;
+	unsigned int mask = 0;
+
+	if (current_work() == &efi_rts_work.work)
+		mask = efi_rts_mask(id);
+
+	if (!mask) {
+		pr_err("Disabling EFI runtime services\n");
+		clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
+		return;
+	}
+
+	pr_err("Disabling EFI runtime service %s()\n", efi_rts_services[id].name);
+	efi_rts_faulted |= mask;
+	efi.runtime_supported_mask &= ~mask;
+}
+
 /*
  * efi_queue_work:	Queue EFI runtime service call and wait for completion
  * @_rts:		EFI runtime service function identifier
@@ -388,6 +464,9 @@ static efi_status_t __efi_queue_work(enum efi_rts_ids id,
 		return EFI_DEVICE_ERROR;
 	}
 
+	if (efi_rts_service_faulted(id))
+		return EFI_DEVICE_ERROR;
+
 	efi_rts_work.efi_rts_id = id;
 	efi_rts_work.args = args;
 	efi_rts_work.caller = __builtin_return_address(0);
@@ -520,7 +599,8 @@ virt_efi_set_variable_nb(efi_char16_t *name, efi_guid_t *vendor, u32 attr,
 	if (down_trylock(&efi_runtime_lock))
 		return EFI_NOT_READY;
 
-	if (!efi_enabled(EFI_RUNTIME_SERVICES)) {
+	if (!efi_enabled(EFI_RUNTIME_SERVICES) ||
+	    efi_rts_service_faulted(EFI_SET_VARIABLE)) {
 		up(&efi_runtime_lock);
 		return EFI_DEVICE_ERROR;
 	}
@@ -564,7 +644,8 @@ virt_efi_query_variable_info_nb(u32 attr, u64 *storage_space,
 	if (down_trylock(&efi_runtime_lock))
 		return EFI_NOT_READY;
 
-	if (!efi_enabled(EFI_RUNTIME_SERVICES)) {
+	if (!efi_enabled(EFI_RUNTIME_SERVICES) ||
+	    efi_rts_service_faulted(EFI_QUERY_VARIABLE_INFO)) {
 		up(&efi_runtime_lock);
 		return EFI_DEVICE_ERROR;
 	}
diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 8ed368ea3..fec6eaca2 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -836,7 +836,9 @@ static void __maybe_unused lkdtm_EFI_RUNTIME_CRASH(void)
 	 */
 	status = efi.get_next_variable(&size, L"", &(efi_guid_t){});
 
-	if (status != EFI_ABORTED || efi_enabled(EFI_RUNTIME_SERVICES))
+	if (status != EFI_ABORTED ||
+	    (efi_enabled(EFI_RUNTIME_SERVICES) &&
+	     efi_rt_services_supported(EFI_RT_SUPPORTED_GET_NEXT_VARIABLE_NAME)))
 		pr_err("FAIL: EFI GetNextVariable() did not abort (%#lx)\n",
 		       status);
 }
diff --git a/include/linux/efi.h b/include/linux/efi.h
index cc1df1577..12d3e4a07 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -1139,6 +1139,7 @@ extern unsigned long efi_call_virt_save_flags(void);
 
 void efi_runtime_assert_lock_held(void);
 efi_status_t efi_runtime_set_enable_flag(bool enable);
+void efi_runtime_disable_faulting_service(void);
 
 enum efi_secureboot_mode {
 	efi_secureboot_mode_unset,
-- 
2.56.0


