Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAACC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 23:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGCg6n2Q6WZLrimz+DtE8iD6q+LYJzZzjnV1WXJIGMU=; b=BaBqaO0W8H/QmMhAoxKwXQWXBR
	WyhhQ0WX7hFXr28gX68UjOg0+HMXDpRQSpJ2L4/XD65wSGEb2PBu8GvVOA+LCDl2G7XRk4XTdh/O7
	18zWOGhZody+hJNcatzCBwnY5sCjwKeUnFGZUceeNDjmS0MLbjCIoQ2SvXZI93BThLDQoKBTOcnkQ
	cpKRdX4QOUHrqo3BiuDtBC4S4x62EaKdMLHfD5Et1tQLmhjEoxqSBNomMGcPrFrm5PJOcDooyq3I+
	s25b2fRvL07NrWMDmzK1WDDaJuwVZKmUuu1k8TJ9eRvTCvkDzX7BqKjefQDXprBQA6dka1f1BvED3
	/exOHIyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmhnn-0000000FTVI-26Na;
	Mon, 24 Feb 2025 23:23:55 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmhmI-0000000FTFC-3WDM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 23:22:24 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id A89DB203CDE5;
	Mon, 24 Feb 2025 15:22:19 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A89DB203CDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740439339;
	bh=PGCg6n2Q6WZLrimz+DtE8iD6q+LYJzZzjnV1WXJIGMU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=A67uPgO/+1Vash+VgNUVaceBsg/GexArtBCVuHxE8ACpVzrz2pN98+Xcn6Tv24C9f
	 Ksrr6XADjWe9pi9xFXy/83nYiZhMNz2DH0BEiPr4KgD7WAl80TTo69rmmi5IhDvZrK
	 FcuHnJztFWfI3aKDOM/9KD7bnAJWekyXirTS3SBU=
Message-ID: <14a199d8-1cf3-49bc-8e0d-92d9c8407b4f@linux.microsoft.com>
Date: Mon, 24 Feb 2025 15:22:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v4 1/6] arm64: hyperv: Use SMCCC to detect
 hypervisor presence
From: Roman Kisel <romank@linux.microsoft.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com,
 bhelgaas@google.com, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dexuan Cui <decui@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 "H. Peter Anvin" <hpa@zytor.com>, krzk+dt@kernel.org,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Ingo Molnar <mingo@redhat.com>, Rob Herring <robh@kernel.org>,
 ssengar@linux.microsoft.com, Thomas Gleixner <tglx@linutronix.de>,
 Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
 <20250212014321.1108840-2-romank@linux.microsoft.com>
 <1b14e3de-4d3e-420c-819c-31ffb2d448bd@app.fastmail.com>
 <593c22ca-6544-423d-84ee-7a06c6b8b5b9@linux.microsoft.com>
 <97887849-faa8-429b-862b-daf6faf89481@app.fastmail.com>
 <6e4685fe-68e9-43bd-96c5-b871edb1b971@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <6e4685fe-68e9-43bd-96c5-b871edb1b971@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_152222_922843_9243B1FB 
X-CRM114-Status: GOOD (  18.26  )
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

Hi Arnd,

[...]

>> I would suggest moving the UUID values into a variable next
>> to the caller like
>>
>> #define ARM_SMCCC_VENDOR_HYP_UID_KVM \
>>      UUID_INIT(0x28b46fb6, 0x2ec5, 0x11e9, 0xa9, 0xca, 0x4b, 0x56, 
>> 0x4d, 0x00, 0x3a, 0x74)
>>
>> and then just pass that into arm_smccc_hyp_present(). (please
>> double-check the endianess of the definition here, I probably
>> got it wrong myself).

I worked out a variation [1] of the change that you said looked good.

Here, there is a helper macro for creating uuid_t's when checking
for the hypervisor running via SMCCC to avoid using the bare UUID_INIT. 
Valiadted with KVM/arm64 and Hyper-V/arm64. Do you think this is a
better approach than converting by hand?

If that looks too heavy, maybe could leave out converting the expected
register values to UUID, and pass the expected register values to
arm_smccc_hyp_present directly. That way, instead of

bool arm_smccc_hyp_present(const uuid_t *hyp_uuid);

we'd have

bool arm_smccc_hyp_present(u32 reg0, u32 reg1, u32 reg2, u32 reg2);


Please let me know what you think!

[1]
---
  arch/arm64/hyperv/mshyperv.c       | 16 +++++---------
  drivers/firmware/smccc/kvm_guest.c | 13 +++++------
  drivers/firmware/smccc/smccc.c     | 19 ++++++++++++++++
  include/linux/arm-smccc.h          | 35 ++++++++++++++++++++++++++++++
  4 files changed, 64 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 16e721d8e5df..b8468bd65ec0 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -43,18 +43,12 @@ static bool hyperv_detect_via_acpi(void)

  static bool hyperv_detect_via_smccc(void)
  {
-	struct arm_smccc_res res = {};
+	uuid_t hyperv_uuid = HYP_UUID_INIT(ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_0,
+		ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_1,
+		ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_2,
+		ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_3);

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
+	return arm_smccc_hyp_present(&hyperv_uuid);
  }

  static int __init hyperv_init(void)
diff --git a/drivers/firmware/smccc/kvm_guest.c 
b/drivers/firmware/smccc/kvm_guest.c
index f3319be20b36..48c3622b2aa6 100644
--- a/drivers/firmware/smccc/kvm_guest.c
+++ b/drivers/firmware/smccc/kvm_guest.c
@@ -14,17 +14,14 @@ static DECLARE_BITMAP(__kvm_arm_hyp_services, 
ARM_SMCCC_KVM_NUM_FUNCS) __ro_afte

  void __init kvm_init_hyp_services(void)
  {
+	uuid_t kvm_uuid = HYP_UUID_INIT(ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_0,
+		ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_1,
+		ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_2,
+		ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3);
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
+	if (!arm_smccc_hyp_present(&kvm_uuid))
  		return;

  	memset(&res, 0, sizeof(res));
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index a74600d9f2d7..0943abb3f4c9 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -67,6 +67,25 @@ s32 arm_smccc_get_soc_id_revision(void)
  }
  EXPORT_SYMBOL_GPL(arm_smccc_get_soc_id_revision);

+bool arm_smccc_hyp_present(const uuid_t *hyp_uuid)
+{
+	struct arm_smccc_res res = {};
+
+	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
+		return false;
+	arm_smccc_1_1_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
+	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
+		return false;
+
+	return ({
+		const uuid_t uuid = HYP_UUID_INIT(res.a0, res.a1, res.a2, res.a3);
+		const bool present = uuid_equal(&uuid, hyp_uuid);
+
+		present;
+	});
+}
+EXPORT_SYMBOL_GPL(arm_smccc_hyp_present);
+
  static int __init smccc_devices_init(void)
  {
  	struct platform_device *pdev;
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 67f6fdf2e7cd..60be36254364 100644
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
@@ -333,6 +338,36 @@ s32 arm_smccc_get_soc_id_version(void);
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
+#define HYP_UUID_INIT(r0, r1, r2, r3) \
+	UUID_INIT( \
+		cpu_to_le32(lower_32_bits(r0)), \
+		cpu_to_le32(lower_32_bits(r1)) & 0xffff, \
+		cpu_to_le32(lower_32_bits(r1)) >> 16, \
+		cpu_to_le32(lower_32_bits(r2)) & 0xff, \
+		(cpu_to_le32(lower_32_bits(r2)) >> 8) & 0xff, \
+		(cpu_to_le32(lower_32_bits(r2)) >> 16) & 0xff, \
+		(cpu_to_le32(lower_32_bits(r2)) >> 24) & 0xff, \
+		cpu_to_le32(lower_32_bits(r3)) & 0xff, \
+		(cpu_to_le32(lower_32_bits(r3)) >> 8) & 0xff, \
+		(cpu_to_le32(lower_32_bits(r3)) >> 16) & 0xff, \
+		(cpu_to_le32(lower_32_bits(r3)) >> 24) & 0xff \
+	)
+
+#endif /* !__ASSEMBLER__ */
+
  /**
   * struct arm_smccc_res - Result from SMC/HVC call
   * @a0-a3 result values from registers 0 to 3


-- 
Thank you,
Roman


