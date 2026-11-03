Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C51606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O2VeN/5k;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aa6MOMUB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iV25/DxKsnhun2yvINfOyLlr7WgOgBvCKI0Z9NP64MY=; b=O2VeN/5kQ+hwfg
	rqLnhebT0PAiSU6/u0vTloIE5/xnMl9EK5RHtKXa2LwcRv5dDRfbXIxbJvjeZFbur3AQncW2qKnCC
	MwjrzPcSxlUzHT1QmIDYdmXqDjJQK/eefQwSldDz4wgAGJwcItS3S9MTsDcMXrZn1Jeohlk9sM2kt
	G+SEhcVhfxupgwy6RKnTCevu+u/qNEFtI3wgQ8f8Xs7gAze97WP19EdWSnAwGOBjYXACWfiL8m1os
	odf3kISwINiKBv81/0dWOv8/QUmFiCBnEy9soohUJntEvh8LEJWqySbrnZF/jobSvzHqJRY+Zhf8O
	cs9Wcrk2tUEZw207GDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOITm-00000003K6z-1lQn;
	Tue, 03 Nov 2026 17:39:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOITj-00000003K5R-1t0d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:39:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BBE5F6061B;
	Tue,  3 Nov 2026 17:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D272F1F00A18;
	Tue,  3 Nov 2026 17:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793727562;
	bh=iV25/DxKsnhun2yvINfOyLlr7WgOgBvCKI0Z9NP64MY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aa6MOMUBf7iSGSrxcNlAfcSxSSBoSw+ekqQszz/BLj2hawXhy3YxCAMvLGLC+CD2z
	 YgH4eqs7q3y73yMW4JczrzA5kswETdXlN1D+mrva48LdPm7a8bP+7PacOo1Q5tH8BV
	 n3xvgm8xIxPdRkxHu6LhBU2MpVURqMYar/cm4OtrATpP1LBppqEEXMuwVz+Y5h/9w3
	 ACJE7ClLvBnnpI1fys0HkbrIKU+ZaQnwycgbsFw3oy25rPzNgoBgOOnzLoE6pApPIf
	 moIhlnr9brm4IvbOaRDfh6aZNMMGHSdFZK7ftx5QAMHKPcDuguwwZXg/KlrYJ/P7OV
	 A0oLi1Waq+5BA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Jamie Nguyen <jamien@nvidia.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dat Mach <dmach@nvidia.com>
Subject: [PATCH 2/2] ACPI: FFH: Support FF-A direct request 2 calls
Date: Tue,  3 Nov 2026 17:39:07 +0000
Message-ID: <20261103173907.1996118-3-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103173907.1996118-1-sudeep.holla@kernel.org>
References: <20261103173907.1996118-1-sudeep.holla@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Arm Functional Fixed Hardware specification v1.3 defines FFH
OperationRegion offset 2 for issuing FFA_MSG_SEND_DIRECT_REQ2 calls.
The arm64 FFH handler currently supports only generic 32-bit and 64-bit
SMCCC calls, so it cannot implement this standardized interface.

Add a standalone FF-A path using the existing SMCCC conduit. Negotiate
FF-A v1.2, discover the sender endpoint with FFA_ID_GET, and use either
the receiver supplied by firmware or resolve a unique receiver from the
service UUID with FFA_PARTITION_INFO_GET_REGS.

Convert the ACPI ToUUID representation to the FF-A register encoding,
construct the direct request, resume interrupted or yielded calls with
FFA_RUN, and return the defined FFH status codes to AML.

Register-based partition discovery avoids RX/TX buffer ownership and
keeps the FFH implementation independent of the Arm FF-A transport
driver.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/acpi/arm64/ffh.c | 227 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 227 insertions(+)

diff --git a/drivers/acpi/arm64/ffh.c b/drivers/acpi/arm64/ffh.c
index 04380bab193d..3f8cecc8ab22 100644
--- a/drivers/acpi/arm64/ffh.c
+++ b/drivers/acpi/arm64/ffh.c
@@ -1,7 +1,22 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/acpi.h>
+#include <linux/arm_ffa.h>
 #include <linux/arm-smccc.h>
+#include <linux/delay.h>
+#include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/unaligned.h>
+
+#define FFH_FFA_CALL_FAILED		1
+#define FFH_FFA_SUCCESS			0
+#define FFH_FFA_NOT_SUPPORTED		-1
+#define FFH_FFA_INVALID_PARAMETERS	-2
+#define FFH_FFA_OUT_OF_MEMORY		-3
+#define FFH_FFA_UNSPECIFIED_ERROR	-4
+
+#define FFH_FFA_MIN_LEN			(5 * sizeof(u64))
+#define FFH_FFA_MAX_LEN			(18 * sizeof(u64))
+#define FFH_FFA_UUID_OFFSET		(2 * sizeof(u64))
 
 /*
  * Implements ARM64 specific callbacks to support ACPI FFH Operation Region as
@@ -19,6 +34,216 @@ struct acpi_ffh_data {
 				struct arm_smccc_1_2_regs *res);
 };
 
+static DEFINE_MUTEX(acpi_ffh_ffa_lock);
+static bool acpi_ffh_ffa_version_negotiated;
+static bool acpi_ffh_ffa_initialized;
+static u16 acpi_ffh_ffa_sender_id;
+
+static void acpi_ffh_ffa_invoke(struct acpi_ffh_data *ffh_ctxt,
+				const struct arm_smccc_1_2_regs *args,
+				struct arm_smccc_1_2_regs *res)
+{
+	ffh_ctxt->invoke_ffh64_fn(args, res);
+}
+
+static int acpi_ffh_ffa_features(struct acpi_ffh_data *ffh_ctxt, u32 fid)
+{
+	struct arm_smccc_1_2_regs args = {
+		.a0 = FFA_FEATURES,
+		.a1 = fid,
+	};
+	struct arm_smccc_1_2_regs res;
+
+	acpi_ffh_ffa_invoke(ffh_ctxt, &args, &res);
+	if (res.a0 == FFA_ERROR) {
+		if ((s32)res.a2 == FFA_RET_NOT_SUPPORTED)
+			return -EOPNOTSUPP;
+		return -EINVAL;
+	}
+
+	return res.a0 == FFA_SUCCESS ? 0 : -EIO;
+}
+
+static int acpi_ffh_ffa_init(struct acpi_ffh_data *ffh_ctxt)
+{
+	struct arm_smccc_1_2_regs args = { }, res;
+	u32 version;
+	int ret = 0;
+
+	mutex_lock(&acpi_ffh_ffa_lock);
+	if (acpi_ffh_ffa_initialized)
+		goto out;
+
+	if (!acpi_ffh_ffa_version_negotiated) {
+		args.a0 = FFA_VERSION;
+		args.a1 = FFA_VERSION_1_2;
+		acpi_ffh_ffa_invoke(ffh_ctxt, &args, &res);
+		version = res.a0;
+		if ((s32)version == SMCCC_RET_NOT_SUPPORTED ||
+		    FFA_MAJOR_VERSION(version) != 1 ||
+		    version < FFA_VERSION_1_2) {
+			ret = -EOPNOTSUPP;
+			goto out;
+		}
+		acpi_ffh_ffa_version_negotiated = true;
+	}
+
+	ret = acpi_ffh_ffa_features(ffh_ctxt, FFA_MSG_SEND_DIRECT_REQ2);
+	if (ret)
+		goto out;
+
+	ret = acpi_ffh_ffa_features(ffh_ctxt, FFA_MSG_SEND_DIRECT_RESP2);
+	if (ret)
+		goto out;
+
+	ret = acpi_ffh_ffa_features(ffh_ctxt, FFA_PARTITION_INFO_GET_REGS);
+	if (ret)
+		goto out;
+
+	args = (struct arm_smccc_1_2_regs) { .a0 = FFA_ID_GET };
+	acpi_ffh_ffa_invoke(ffh_ctxt, &args, &res);
+	if (res.a0 == FFA_ERROR) {
+		ret = (s32)res.a2 == FFA_RET_NOT_SUPPORTED ?
+		      -EOPNOTSUPP : -EIO;
+		goto out;
+	}
+	if (res.a0 != FFA_SUCCESS) {
+		ret = -EIO;
+		goto out;
+	}
+
+	acpi_ffh_ffa_sender_id = (u16)res.a2;
+	acpi_ffh_ffa_initialized = true;
+out:
+	mutex_unlock(&acpi_ffh_ffa_lock);
+	return ret;
+}
+
+static void acpi_ffh_ffa_uuid_convert(const u8 *guid, u8 *uuid)
+{
+	/* ACPI ToUUID uses GUID byte order while FF-A uses UUID byte order. */
+	uuid[0] = guid[3];
+	uuid[1] = guid[2];
+	uuid[2] = guid[1];
+	uuid[3] = guid[0];
+	uuid[4] = guid[5];
+	uuid[5] = guid[4];
+	uuid[6] = guid[7];
+	uuid[7] = guid[6];
+	memcpy(uuid + 8, guid + 8, UUID_SIZE - 8);
+}
+
+static int acpi_ffh_ffa_receiver_id(struct acpi_ffh_data *ffh_ctxt,
+				    u64 uuid_lo, u64 uuid_hi, u16 *receiver_id)
+{
+	struct arm_smccc_1_2_regs args = {
+		.a0 = FFA_PARTITION_INFO_GET_REGS,
+		.a1 = uuid_lo,
+		.a2 = uuid_hi,
+	};
+	struct arm_smccc_1_2_regs res;
+	u32 properties;
+
+	acpi_ffh_ffa_invoke(ffh_ctxt, &args, &res);
+	if (res.a0 != FFA_FN64_SUCCESS)
+		return -EINVAL;
+
+	if (FIELD_GET(FFA_PART_INFO_LAST_IDX_MASK, res.a2) ||
+	    FIELD_GET(FFA_PART_INFO_CUR_IDX_MASK, res.a2) ||
+	    FIELD_GET(FFA_PART_INFO_DESC_SIZE_MASK, res.a2) <
+		    FFA_PART_INFO_MIN_DESC_SIZE)
+		return -EINVAL;
+
+	properties = FIELD_GET(FFA_PART_INFO_PROPS_MASK, res.a3);
+	if (!(properties & FFA_PARTITION_DIRECT_REQ2_RECV))
+		return -EINVAL;
+
+	*receiver_id = FIELD_GET(FFA_PART_INFO_ID_MASK, res.a3);
+	return 0;
+}
+
+static int acpi_ffh_ffa_status(int error)
+{
+	switch (error) {
+	case -EOPNOTSUPP:
+		return FFH_FFA_NOT_SUPPORTED;
+	case -EINVAL:
+		return FFH_FFA_INVALID_PARAMETERS;
+	case -ENOMEM:
+		return FFH_FFA_OUT_OF_MEMORY;
+	default:
+		return FFH_FFA_UNSPECIFIED_ERROR;
+	}
+}
+
+static int acpi_ffh_ffa_direct_req2(acpi_integer *value,
+				    struct acpi_ffh_data *ffh_ctxt)
+{
+	struct arm_smccc_1_2_regs args = { }, res;
+	u64 *buf = (u64 *)value;
+	u64 uuid_lo, uuid_hi;
+	u16 receiver_id = (u16)buf[1];
+	uuid_t uuid;
+	size_t len = ffh_ctxt->info.length;
+	int ret;
+
+	if (len < FFH_FFA_MIN_LEN || len > FFH_FFA_MAX_LEN ||
+	    !IS_ALIGNED(len - 4 * sizeof(u64), sizeof(u64))) {
+		buf[0] = FFH_FFA_INVALID_PARAMETERS;
+		return AE_OK;
+	}
+
+	acpi_ffh_ffa_uuid_convert((u8 *)value + FFH_FFA_UUID_OFFSET, uuid.b);
+	if (uuid_is_null(&uuid)) {
+		buf[0] = FFH_FFA_INVALID_PARAMETERS;
+		return AE_OK;
+	}
+
+	ret = acpi_ffh_ffa_init(ffh_ctxt);
+	if (ret) {
+		buf[0] = acpi_ffh_ffa_status(ret);
+		return AE_OK;
+	}
+
+	uuid_lo = get_unaligned_le64(uuid.b);
+	uuid_hi = get_unaligned_le64(uuid.b + sizeof(uuid_lo));
+	if (!receiver_id) {
+		ret = acpi_ffh_ffa_receiver_id(ffh_ctxt, uuid_lo, uuid_hi,
+					       &receiver_id);
+		if (ret) {
+			buf[0] = FFH_FFA_INVALID_PARAMETERS;
+			return AE_OK;
+		}
+	}
+
+	args.a0 = FFA_MSG_SEND_DIRECT_REQ2;
+	args.a1 = ffa_pack_target_info(acpi_ffh_ffa_sender_id, receiver_id);
+	args.a2 = uuid_lo;
+	args.a3 = uuid_hi;
+	memcpy(&args.a4, &buf[4], len - 4 * sizeof(u64));
+
+	acpi_ffh_ffa_invoke(ffh_ctxt, &args, &res);
+	while (res.a0 == FFA_INTERRUPT || res.a0 == FFA_YIELD) {
+		if (res.a0 == FFA_YIELD)
+			fsleep(1000);
+
+		args = (struct arm_smccc_1_2_regs) {
+			.a0 = FFA_RUN,
+			.a1 = res.a1,
+		};
+		acpi_ffh_ffa_invoke(ffh_ctxt, &args, &res);
+	}
+
+	memcpy(buf, &res, len);
+	if (res.a0 == FFA_MSG_SEND_DIRECT_RESP2 || res.a0 == FFA_SUCCESS ||
+	    res.a0 == FFA_FN64_SUCCESS)
+		buf[0] = FFH_FFA_SUCCESS;
+	else
+		buf[0] = FFH_FFA_CALL_FAILED;
+
+	return AE_OK;
+}
+
 int acpi_ffh_address_space_arch_setup(void *handler_ctxt, void **region_ctxt)
 {
 	enum arm_smccc_conduit conduit;
@@ -99,6 +324,8 @@ int acpi_ffh_address_space_arch_handler(acpi_integer *value, void *region_contex
 			ffh_ctxt->invoke_ffh64_fn(r, r);
 			memcpy(value, r, ffh_ctxt->info.length);
 		}
+	} else if (ffh_ctxt->info.offset == 2) {
+		ret = acpi_ffh_ffa_direct_req2(value, ffh_ctxt);
 	} else {
 		ret = AE_ERROR;
 	}
-- 
2.43.0


