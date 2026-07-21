Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E82C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 20:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzRxQvPwzEBTlATkVCaj62V6KcKKHvmr0KtL0Tzs39U=; b=yUS4LYHC0U2GN9qXzL7ll79v4I
	ZnjriY/PAfHZ+6PyckVDSy5fUUf+p5Q7Sgk0m3ZCjLvfTi1N/ulp0qzc5N5Ik26x1bWptWk1sGzq7
	aCAs8XD4kb9hEq2LrCAKOteSpySOTKWrEvN+Jg2/Xvk1XLjtyxhLlRHyqrU9QzpvwcXc7i7aSzBBZ
	eb0swcpC0f3cGKV0Myf/txx7HEO+HoKHEAxrUYXwWfuSaPiAmov6zxlAkCi9H7yM8qZGPrgc/EgMl
	4vg3UYq05tzb9h22MRMqP8G7BBKoL925wzRUm42oRT/VOa4L0uM8dth+Al82ZkOWJ0HDjXZv+4MN0
	KEQ6+1zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGou-0000000ALbU-0JYw;
	Tue, 21 Jul 2026 20:12:04 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGor-0000000ALZP-3g1F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 20:12:03 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id B733920B7169;
	Tue, 21 Jul 2026 13:11:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B733920B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1784664708;
	bh=NzRxQvPwzEBTlATkVCaj62V6KcKKHvmr0KtL0Tzs39U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UfS1Atu3Wowgk10zeXgEIgTu37K9NoSb2lkAiXA2hScmc7MkfNud5qkK4vQjfvtPy
	 WLdQIrtHXwNX30i++mrUegeXIpIbuJk4Bx/cbCpzUZgfeep1jGy/iTekgr+zLu/ONc
	 zt8EUnUg7PyXvRDx/HkPWQLnHEyK1Y203XgfnECk=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	mhklinux@outlook.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	arnd@arndb.de,
	thuth@redhat.com,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v3 1/6] arm64: rsi: Add RSI host call structure and helper function
Date: Tue, 21 Jul 2026 13:11:43 -0700
Message-ID: <20260721201148.1441143-2-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260721201148.1441143-1-kameroncarr@linux.microsoft.com>
References: <20260721201148.1441143-1-kameroncarr@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_131201_967882_F7280AC1 
X-CRM114-Status: GOOD (  12.13  )
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

Add struct rsi_host_call to rsi_smc.h, which represents the host call
data structure used by the Realm Management Monitor (RMM) for the
RSI_HOST_CALL interface. The structure contains a 16-bit immediate field
and 31 general-purpose register values, aligned to 256 bytes as required
by the CCA RMM specification.

Add rsi_host_call() static inline wrapper in rsi_cmds.h that invokes
SMC_RSI_HOST_CALL with the physical address of the host call structure.
This will be used by Hyper-V guest code to route hypercalls through the
RSI interface when running inside an Arm CCA Realm.

Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
---
 arch/arm64/include/asm/rsi_cmds.h | 22 ++++++++++++++++++++++
 arch/arm64/include/asm/rsi_smc.h  |  7 +++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/include/asm/rsi_cmds.h b/arch/arm64/include/asm/rsi_cmds.h
index 2c8763876dfb7..9daf8008e5da2 100644
--- a/arch/arm64/include/asm/rsi_cmds.h
+++ b/arch/arm64/include/asm/rsi_cmds.h
@@ -88,6 +88,28 @@ static inline long rsi_set_addr_range_state(phys_addr_t start,
 	return res.a0;
 }
 
+/**
+ * rsi_host_call - Make a Host call.
+ * @host_call_struct: IPA of host call structure
+ *
+ * This call will fail if the IPA of the host call structure:
+ * * is not aligned to 256 bytes,
+ * * is not protected / encrypted,
+ * * is RIPAS_EMPTY
+ *
+ * Returns:
+ *  On success, returns RSI_SUCCESS.
+ *  Otherwise, returns an error code.
+ */
+static inline unsigned long rsi_host_call(phys_addr_t host_call_struct)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(SMC_RSI_HOST_CALL, host_call_struct, 0, 0, 0, 0, 0, 0,
+		      &res);
+	return res.a0;
+}
+
 /**
  * rsi_attestation_token_init - Initialise the operation to retrieve an
  * attestation token.
diff --git a/arch/arm64/include/asm/rsi_smc.h b/arch/arm64/include/asm/rsi_smc.h
index e19253f96c940..9cc57b5be0c02 100644
--- a/arch/arm64/include/asm/rsi_smc.h
+++ b/arch/arm64/include/asm/rsi_smc.h
@@ -142,6 +142,13 @@ struct realm_config {
 	 */
 } __aligned(0x1000);
 
+struct rsi_host_call {
+	u16 immediate;
+	u8 _padding[6];
+	u64 gprs[31];
+} __aligned(256);
+static_assert(sizeof(struct rsi_host_call) == 256);
+
 #endif /* __ASSEMBLER__ */
 
 /*
-- 
2.45.4


