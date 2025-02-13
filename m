Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE7EC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 23:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hk/UhzyNXmtkIV3ySCx19ki8dNWuqGbbCLmGSDE/xLs=; b=1Og9uO0izV5D0wLkaH8NMmV5hB
	rf/JpHIiNKOQvSU6XoFnxSb915OKNddXkWrgEhkPP+0Rq2UFmzKDyRwic/uTQezIit4t4+v+cME+m
	kSMj6SE65F7W/llNGVA+RyjKlmO5W2gH7QudD6AgZ5GGwYwXV4sDjB7vZSp6fF0GYU7YnoDcJy1bX
	tBu2OQIqB09ruKy4SDEtRZDIxrVNeY+KAl1tCBT64EsblDdfy5gqcTRv02VL2ET1F93SNFh9h3p6L
	2ucEq0Glkpx8hBsQXICksSd1WtgH/6s6zkDVWodZy0kily8RK24DF7D+WJTZrHAY/27hJ4cqQL7iO
	23MY1JGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiibK-0000000Cwun-3LNJ;
	Thu, 13 Feb 2025 23:26:34 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiiYo-0000000CwSb-0V1P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 23:23:59 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7A9B7203F3E8;
	Thu, 13 Feb 2025 15:23:56 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7A9B7203F3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739489036;
	bh=Hk/UhzyNXmtkIV3ySCx19ki8dNWuqGbbCLmGSDE/xLs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aufp7fKvZThXkNOUfRjDldRf0rvzjk9ePefQmU34QNQDzjKEBlugM1QQnoyaGdByr
	 UvcGblhHXCbjBa/k4MpcRsnzZtdKGCD/hDb4AqXA9uZUdtcTEEmtCsn/SbibhrumUh
	 FawOmhzoUKT+be6mPRofqUQ3NjSfwRNz4fTK8QNo=
Message-ID: <593c22ca-6544-423d-84ee-7a06c6b8b5b9@linux.microsoft.com>
Date: Thu, 13 Feb 2025 15:23:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v4 1/6] arm64: hyperv: Use SMCCC to detect
 hypervisor presence
To: Arnd Bergmann <arnd@arndb.de>, bhelgaas@google.com,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Conor Dooley <conor+dt@kernel.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Dexuan Cui <decui@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, "H. Peter Anvin" <hpa@zytor.com>,
 krzk+dt@kernel.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Ingo Molnar <mingo@redhat.com>, Rob Herring <robh@kernel.org>,
 ssengar@linux.microsoft.com, Thomas Gleixner <tglx@linutronix.de>,
 Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org
Cc: benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
 <20250212014321.1108840-2-romank@linux.microsoft.com>
 <1b14e3de-4d3e-420c-819c-31ffb2d448bd@app.fastmail.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <1b14e3de-4d3e-420c-819c-31ffb2d448bd@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_152358_210192_98C965A8 
X-CRM114-Status: GOOD (  31.19  )
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



On 2/11/2025 10:54 PM, Arnd Bergmann wrote:
> On Wed, Feb 12, 2025, at 02:43, Roman Kisel wrote:
>> +static bool hyperv_detect_via_smccc(void)
>> +{
>> +	struct arm_smccc_res res = {};
>> +
>> +	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
>> +		return false;
>> +	arm_smccc_1_1_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
>> +	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
>> +		return false;
>> +
>> +	return res.a0 == ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_0 &&
>> +		res.a1 == ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_1 &&
>> +		res.a2 == ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_2 &&
>> +		res.a3 == ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_3;
>> +}
> 
> I had to double-check that this function is safe to call on
> other hypervisors, at least when they follow the smccc spec.
> 
> Seeing that we have the same helper function checking for
> ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_* and there was another
> patch set adding a copy for gunyah, I wonder if we can
> put this into a drivers/firmware/smccc/smccc.c directly
> the same way we handle soc_id, and make it return a uuid_t,
> or perhaps take a constant uuid_t to compare against.

That would be very neat! I implemented the idea [1], please let me know
what you think. I can use that in the next version of the patch series
if looks good.

There is a function and a macro to make calling
the function easier. As the SMCCC header is used by the assembler, too,
hence I had to add __ASSEBLER__ guardrails. Another option could be to
pass four u32's not to use uuid_t so the header stays a healthy food
for the assembler :) For Gunyah, that would be

ARM_SMCCC_HYP_PRESENT(GUNYAH)

when using the change below.


 From f0d645e900c24f5be045b0f831f1e11494967b7f Mon Sep 17 00:00:00 2001
From: Roman Kisel <romank@linux.microsoft.com>
Date: Thu, 13 Feb 2025 15:10:45 -0800
Subject: [PATCH] drivers, smcc: Introduce arm_smccc_hyp_present

---
  arch/arm64/hyperv/mshyperv.c       | 18 +----------------
  drivers/firmware/smccc/kvm_guest.c |  9 +--------
  drivers/firmware/smccc/smccc.c     | 24 ++++++++++++++++++++++
  include/linux/arm-smccc.h          | 32 ++++++++++++++++++++++++++++++
  4 files changed, 58 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 16e721d8e5df..0c5babe9e1ff 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -41,22 +41,6 @@ static bool hyperv_detect_via_acpi(void)
  #endif
  }

-static bool hyperv_detect_via_smccc(void)
-{
-	struct arm_smccc_res res = {};
-
-	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
-		return false;
-	arm_smccc_1_1_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
-	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
-		return false;
-
-	return res.a0 == ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_0 &&
-		res.a1 == ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_1 &&
-		res.a2 == ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_2 &&
-		res.a3 == ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_3;
-}
-
  static int __init hyperv_init(void)
  {
  	struct hv_get_vp_registers_output	result;
@@ -69,7 +53,7 @@ static int __init hyperv_init(void)
  	 *
  	 * In such cases, do nothing and return success.
  	 */
-	if (!hyperv_detect_via_acpi() && !hyperv_detect_via_smccc())
+	if (!hyperv_detect_via_acpi() && !ARM_SMCCC_HYP_PRESENT(HYPERV))
  		return 0;

  	/* Setup the guest ID */
diff --git a/drivers/firmware/smccc/kvm_guest.c 
b/drivers/firmware/smccc/kvm_guest.c
index f3319be20b36..ae37476cabc1 100644
--- a/drivers/firmware/smccc/kvm_guest.c
+++ b/drivers/firmware/smccc/kvm_guest.c
@@ -17,14 +17,7 @@ void __init kvm_init_hyp_services(void)
  	struct arm_smccc_res res;
  	u32 val[4];

-	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
-		return;
-
-	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
-	if (res.a0 != ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_0 ||
-	    res.a1 != ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_1 ||
-	    res.a2 != ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_2 ||
-	    res.a3 != ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3)
+	if (!ARM_SMCCC_HYP_PRESENT(KVM))
  		return;

  	memset(&res, 0, sizeof(res));
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index a74600d9f2d7..86f75f44895f 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -67,6 +67,30 @@ s32 arm_smccc_get_soc_id_revision(void)
  }
  EXPORT_SYMBOL_GPL(arm_smccc_get_soc_id_revision);

+bool arm_smccc_hyp_present(const uuid_t *hyp_uuid)
+{
+	struct arm_smccc_res res = {};
+	struct {
+		u32 dwords[4]
+	} __packed res_uuid;
+
+	BUILD_BUG_ON(sizeof(res_uuid) != sizeof(uuid_t));
+
+	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
+		return false;
+	arm_smccc_1_1_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
+	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
+		return false;
+
+	res_uuid.dwords[0] = res.a0;
+	res_uuid.dwords[1] = res.a1;
+	res_uuid.dwords[2] = res.a2;
+	res_uuid.dwords[3] = res.a3;
+
+	return uuid_equal((uuid_t *)&res_uuid, hyp_uuid);
+}
+EXPORT_SYMBOL_GPL(arm_smccc_hyp_present);
+
  static int __init smccc_devices_init(void)
  {
  	struct platform_device *pdev;
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 67f6fdf2e7cd..63925506a0e5 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -7,6 +7,11 @@

  #include <linux/args.h>
  #include <linux/init.h>
+
+#ifndef __ASSEMBLER__
+#include <linux/uuid.h>
+#endif
+
  #include <uapi/linux/const.h>

  /*
@@ -333,6 +338,33 @@ s32 arm_smccc_get_soc_id_version(void);
   */
  s32 arm_smccc_get_soc_id_revision(void);

+#ifndef __ASSEMBLER__
+
+/**
+ * arm_smccc_hyp_present(const uuid_t *hyp_uuid)
+ *
+ * Returns `true` if the hypervisor advertises its presence via SMCCC.
+ *
+ * When the function returns `false`, the caller shall not assume that
+ * there is no hypervisor running. Instead, the caller must fall back to
+ * other approaches if any are available.
+ */
+bool arm_smccc_hyp_present(const uuid_t *hyp_uuid);
+
+#define ARM_SMCCC_HYP_PRESENT(HYP) 								\
+	({															\
+		const u32 uuid_as_dwords[4] = {							\
+			ARM_SMCCC_VENDOR_HYP_UID_ ## HYP ## _REG_0,			\
+			ARM_SMCCC_VENDOR_HYP_UID_ ## HYP ## _REG_1,			\
+			ARM_SMCCC_VENDOR_HYP_UID_ ## HYP ## _REG_2,			\
+			ARM_SMCCC_VENDOR_HYP_UID_ ## HYP ## _REG_3			\
+		};														\
+																\
+		arm_smccc_hyp_present((const uuid_t *)uuid_as_dwords);	\
+	})															\
+
+#endif /* !__ASSEMBLER__ */
+
  /**
   * struct arm_smccc_res - Result from SMC/HVC call
   * @a0-a3 result values from registers 0 to 3
-- 
2.43.0



> 
>        Arnd

-- 
Thank you,
Roman


