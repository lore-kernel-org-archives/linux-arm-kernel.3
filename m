Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2ED1F589B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQZdLQ59S/MbqpK3C/yK6xjmEtEnqnrMolLC2gULXrU=; b=KH0z8jW2LvphYDqTro2CcPEhnR
	2SMYZwv+g7MXSLB/2/MLGbhl4ejOesVV6Cd4AjkMmhcj6i5pZ2EUxYHYoVF04N8LNdmTbOnH8OEcY
	e2AAAubTE6VqnTcyPN4PIwJTFVc06vRojLNFQqqB3/Odiy7JE0VpPkJTF41r2bJUOcbTu1xFxGqjG
	q6Hstuoa+sHqJ5ujdCb+CRGeBx8erEgC+4VFAiFaaIsk1YtSzkSOrIo6+hIuFsT4QecmygwWrpUEC
	0LNePhEnCk0+wKjYAzYsLxRtjR1VM52oDQETtaSQJKBeuSfS3psKvz4fof2pcnYadmGIP3Nba93U2
	1wn0HUug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtP7-0000000BeLX-0Hyd;
	Thu, 23 Apr 2026 12:43:37 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtOy-0000000BeE1-3RYz;
	Thu, 23 Apr 2026 12:43:35 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.18])
	by linux.microsoft.com (Postfix) with ESMTPSA id 686C520B716D;
	Thu, 23 Apr 2026 05:43:21 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 686C520B716D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776948208;
	bh=AQZdLQ59S/MbqpK3C/yK6xjmEtEnqnrMolLC2gULXrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NNQ3LTd5fOkxRO6d4h4FSo33AZnCbrUVpoKOERGdAyh4vOHjNxvzi28PEzhOcKJkB
	 2fn9REvjhoIut5m1/YH3p9loue9OP9qe3rH2HLhD1EJ4KFE5DrFf8h29+/qGAVusXd
	 5I9eo8NBr3Gk3/YNpx4NRc8RbqzDk+Jar1LOWwM4=
From: Naman Jain <namjain@linux.microsoft.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Kelley <mhklinux@outlook.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	vdso@mailbox.org,
	ssengar@linux.microsoft.com
Subject: [PATCH v2 08/15] Drivers: hv: Move hv_call_(get|set)_vp_registers() declarations
Date: Thu, 23 Apr 2026 12:41:58 +0000
Message-ID: <20260423124206.2410879-9-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124206.2410879-1-namjain@linux.microsoft.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_054328_904686_DD4E6CF0 
X-CRM114-Status: UNSURE (   8.51  )
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

Move hv_call_get_vp_registers() and hv_call_set_vp_registers()
declarations from drivers/hv/mshv.h to include/asm-generic/mshyperv.h.

These functions are defined in mshv_common.c and are going to be called
from both drivers/hv/ and arch/x86/hyperv/hv_vtl.c. The latter never
included mshv.h, relying on implicit declaration visibility. Moving the
declarations to the arch-generic Hyper-V header makes them properly
visible to all architecture-specific callers.

Provide static inline stubs returning -EOPNOTSUPP when neither
CONFIG_MSHV_ROOT nor CONFIG_MSHV_VTL is enabled.

Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 drivers/hv/mshv.h              |  8 --------
 include/asm-generic/mshyperv.h | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/hv/mshv.h b/drivers/hv/mshv.h
index d4813df92b9c..0fcb7f9ba6a9 100644
--- a/drivers/hv/mshv.h
+++ b/drivers/hv/mshv.h
@@ -14,14 +14,6 @@
 	memchr_inv(&((STRUCT).MEMBER), \
 		   0, sizeof_field(typeof(STRUCT), MEMBER))
 
-int hv_call_get_vp_registers(u32 vp_index, u64 partition_id, u16 count,
-			     union hv_input_vtl input_vtl,
-			     struct hv_register_assoc *registers);
-
-int hv_call_set_vp_registers(u32 vp_index, u64 partition_id, u16 count,
-			     union hv_input_vtl input_vtl,
-			     struct hv_register_assoc *registers);
-
 int hv_call_get_partition_property(u64 partition_id, u64 property_code,
 				   u64 *property_value);
 
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index 8cdf2a9fbdfb..ef0b9466808c 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -394,6 +394,32 @@ static inline int hv_deposit_memory(u64 partition_id, u64 status)
 	return hv_deposit_memory_node(NUMA_NO_NODE, partition_id, status);
 }
 
+#if IS_ENABLED(CONFIG_MSHV_ROOT) || IS_ENABLED(CONFIG_MSHV_VTL)
+int hv_call_get_vp_registers(u32 vp_index, u64 partition_id, u16 count,
+			     union hv_input_vtl input_vtl,
+			     struct hv_register_assoc *registers);
+
+int hv_call_set_vp_registers(u32 vp_index, u64 partition_id, u16 count,
+			     union hv_input_vtl input_vtl,
+			     struct hv_register_assoc *registers);
+#else
+static inline int hv_call_get_vp_registers(u32 vp_index, u64 partition_id,
+					   u16 count,
+					   union hv_input_vtl input_vtl,
+					   struct hv_register_assoc *registers)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int hv_call_set_vp_registers(u32 vp_index, u64 partition_id,
+					   u16 count,
+					   union hv_input_vtl input_vtl,
+					   struct hv_register_assoc *registers)
+{
+	return -EOPNOTSUPP;
+}
+#endif /* CONFIG_MSHV_ROOT || CONFIG_MSHV_VTL */
+
 #if IS_ENABLED(CONFIG_HYPERV_VTL_MODE)
 u8 __init get_vtl(void);
 void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
-- 
2.43.0


