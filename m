Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AB6C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88AiON8knVFtAm4gGlYsfQZYlJxkn1/VFztoyFrvZWY=; b=rjYVOXd/sSREOBRMRZ0yJ6WcCf
	VSwUbpfV6HFPomtRnUQIYvSUqfmbXq8NNaluBHdgj6zBebz2rVMPj9GlZ8h5vUSWfF8O/UrQgPCsL
	HhMqstFvbUMPZawpXqu4Jz7GBFE+OsT+VJ0UV0iceFSchvN2Nbun/kwrvDl2rn16OCJFWD4Yg+zwT
	NFjsE7ekmyeRJFqpqd20aBvebXa6d0UnLAb9U1jAMqyerSHMv/g3TVIEThqZEYm4nx0F6j5hs5Tq7
	ixNQwLc0ImtIgpenf3yVS/9u7oaNTWCGsMST5fYm4fe9QtzJLjHteHvQlUWHfUEBfsJllSmT6Q0rJ
	CY3rQstg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z5z-0000000EeDX-00G0;
	Thu, 24 Apr 2025 16:06:39 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xLM-0000000EKql-04fT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:25 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so802935f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504063; x=1746108863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88AiON8knVFtAm4gGlYsfQZYlJxkn1/VFztoyFrvZWY=;
        b=CmmrmVY3qkKTI3OAMpS+vUxLzS85xfhzVIBQsZr1Ce0mHIq86eHSHGxWV33MIrkNtF
         Ool26aA6PSH/vLDgT7ZGelgoe1FAUkOP9OnCTCrRfdGvA4RnwAzwQ4KV7E1gwnn0U0ar
         J08G7ykTlqm9iMUs+/TpwoTLyQXk/bhA8eKOdyKNNe7XTNOTELL7PMyk3QyZIFqPK7Nx
         lbQWp4vAOZW2V2m+Ih4avZrISv6MU5CtGqWdOV2asU5H6KSckgqZCi/DdCqQ+xOBUyBu
         Ttjt75tbDLa530kSGtnTfvFiVf6wChmJP691iEhLsU1Zf2cmzLqlDm+VHrj5LejVhAun
         FPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504063; x=1746108863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88AiON8knVFtAm4gGlYsfQZYlJxkn1/VFztoyFrvZWY=;
        b=CQ0nM2cC0vPJ+qiJH6z7dschFNgU7mxpGAiMi5RinIKMLJyUkxyaEyGjV5Xpgt3j2L
         NNnPE37wqFKytyR/XoIEdQWM12fJdeTQggZ11JD9QULmJdvbwgXbT6Fa+Bc5IUGQNmF+
         K8dfrnqXDeFluJtTEPbj5Lf/CfNHGcWw+DBA/aFySFvnGjSGeSsU7v0vpTCE6YsTsC+o
         dImKAYvtiYE8E2yVU9/wK7aD6D9ESrTmFfqA1BFKVPozWZESgBFSEEVUPtQQNI86C7zM
         zQfGA4rOJ8aWPfL2f5/Dsu0ez0lgvKfeMrHJVijlupCHBer25o2ZcRalEshFFvXtOJ96
         orVw==
X-Forwarded-Encrypted: i=1; AJvYcCVfJ/nxohltaXiN+Ro6aStO20wUb2J4YhUsh798mRLv6JjW5S38Ih6wm7mxXsptXQO+RLdLIfaafHTNX5y/liIq@lists.infradead.org
X-Gm-Message-State: AOJu0YwLv15Mj+gK9Cs8MfLFqYtJ567IxGuVPbqSMC15gryFjVQIfUci
	CIKRZniMqh5xWxprRoJGLGH2L09DjQxo7leUN6pCnuabw2ax2VbCK1iBqY2U18w=
X-Gm-Gg: ASbGnct3wU6JleJbEEUSNd01+L4LhGBXhZWNFcYJUIOIRSchuOd/ygYrItYtacegARZ
	KitieSfPf/b0XHL/lE5ETOaJUhDePOT7pIWeAKqxu/apWy2NqKqWh+RqfPs+tw4AvhRgSb5Gp3g
	WYOQQ3czo33Auhc8UjzY7jQT1SHivNDl3SsPFfXXvv9XiMzBuP5YmfGZEwxJ9xTo88Kh8uH5BUH
	la5LuMQ2FTFUsAE0Jel5UW9XYW0PPjN8Fx3GnGy3DxtV4zPeUmfVGcX8bJK+iajEi8yE0b6IS/8
	pBs7PvZkuK9XDCMZdUZOMy2Qs0emvvvuieYutw2OxrYKTaYRDZud3uL8FDBZ2/9dQus/NcFtaK/
	GnZ9l3tBAfsjlbYJG
X-Google-Smtp-Source: AGHT+IE6SiBau6EY9Mh/ltJdHWfjy1fT3q7qjVfQcBmH9UUhGIZ598Z7cZVBqAGGCWYaKx9pVYAqXA==
X-Received: by 2002:a05:6000:43d6:10b0:3a0:7017:61f6 with SMTP id ffacd0b85a97d-3a07017626dmr1028260f8f.14.1745504062675;
        Thu, 24 Apr 2025 07:14:22 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:22 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>
Subject: [RFC PATCH 28/34] gunyah: Add RPC to enable demand paging
Date: Thu, 24 Apr 2025 15:13:35 +0100
Message-Id: <20250424141341.841734-29-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071424_058945_E82DA866 
X-CRM114-Status: GOOD (  14.97  )
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

From: Elliot Berman <quic_eberman@quicinc.com>

Add Gunyah Resource Manager RPC to enable demand paging for a virtual
machine. Resource manager needs to be informed of private memory regions
which will be demand paged and the location where the DTB memory parcel
should live in the guest's address space.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 drivers/virt/gunyah/rsc_mgr_rpc.c | 71 +++++++++++++++++++++++++++++++
 include/linux/gunyah_rsc_mgr.h    | 12 ++++++
 2 files changed, 83 insertions(+)

diff --git a/drivers/virt/gunyah/rsc_mgr_rpc.c b/drivers/virt/gunyah/rsc_mgr_rpc.c
index ec187d116dd7..7fccd871cc0b 100644
--- a/drivers/virt/gunyah/rsc_mgr_rpc.c
+++ b/drivers/virt/gunyah/rsc_mgr_rpc.c
@@ -106,6 +106,23 @@ struct gunyah_rm_vm_config_image_req {
 	__le64 dtb_size;
 } __packed;
 
+/* Call: VM_SET_DEMAND_PAGING */
+struct gunyah_rm_vm_set_demand_paging_req {
+	__le16 vmid;
+	__le16 _padding;
+	__le32 range_count;
+	DECLARE_FLEX_ARRAY(struct gunyah_rm_mem_entry, ranges);
+} __packed;
+
+/* Call: VM_SET_ADDRESS_LAYOUT */
+struct gunyah_rm_vm_set_address_layout_req {
+	__le16 vmid;
+	__le16 _padding;
+	__le32 range_id;
+	__le64 range_base;
+	__le64 range_size;
+} __packed;
+
 /*
  * Several RM calls take only a VMID as a parameter and give only standard
  * response back. Deduplicate boilerplate code by using this common call.
@@ -467,3 +484,57 @@ int gunyah_rm_get_hyp_resources(struct gunyah_rm *rm, u16 vmid,
 	return 0;
 }
 ALLOW_ERROR_INJECTION(gunyah_rm_get_hyp_resources, ERRNO);
+
+/**
+ * gunyah_rm_vm_set_demand_paging() - Enable demand paging of memory regions
+ * @rm: Handle to a Gunyah resource manager
+ * @vmid: VMID of the other VM
+ * @count: Number of demand paged memory regions
+ * @entries: Array of the regions
+ */
+int gunyah_rm_vm_set_demand_paging(struct gunyah_rm *rm, u16 vmid, u32 count,
+				   struct gunyah_rm_mem_entry *entries)
+{
+	struct gunyah_rm_vm_set_demand_paging_req *req __free(kfree) = NULL;
+	size_t req_size;
+
+	req_size = struct_size(req, ranges, count);
+	if (req_size == SIZE_MAX)
+		return -EINVAL;
+
+	req = kzalloc(req_size, GFP_KERNEL);
+	if (!req)
+		return -ENOMEM;
+
+	req->vmid = cpu_to_le16(vmid);
+	req->range_count = cpu_to_le32(count);
+	memcpy(req->ranges, entries, sizeof(*entries) * count);
+
+	return gunyah_rm_call(rm, GUNYAH_RM_RPC_VM_SET_DEMAND_PAGING, req,
+			      req_size, NULL, NULL);
+}
+ALLOW_ERROR_INJECTION(gunyah_rm_vm_set_demand_paging, ERRNO);
+
+/**
+ * gunyah_rm_vm_set_address_layout() - Set the start address of images
+ * @rm: Handle to a Gunyah resource manager
+ * @vmid: VMID of the other VM
+ * @range_id: Which image to set
+ * @base_address: Base address
+ * @size: Size
+ */
+int gunyah_rm_vm_set_address_layout(struct gunyah_rm *rm, u16 vmid,
+				    enum gunyah_rm_range_id range_id,
+				    u64 base_address, u64 size)
+{
+	struct gunyah_rm_vm_set_address_layout_req req = {
+		.vmid = cpu_to_le16(vmid),
+		.range_id = cpu_to_le32(range_id),
+		.range_base = cpu_to_le64(base_address),
+		.range_size = cpu_to_le64(size),
+	};
+
+	return gunyah_rm_call(rm, GUNYAH_RM_RPC_VM_SET_ADDRESS_LAYOUT, &req,
+			      sizeof(req), NULL, NULL);
+}
+ALLOW_ERROR_INJECTION(gunyah_rm_vm_set_address_layout, ERRNO);
diff --git a/include/linux/gunyah_rsc_mgr.h b/include/linux/gunyah_rsc_mgr.h
index fb3feee73490..f16e64af9273 100644
--- a/include/linux/gunyah_rsc_mgr.h
+++ b/include/linux/gunyah_rsc_mgr.h
@@ -152,6 +152,18 @@ gunyah_rm_alloc_resource(struct gunyah_rm *rm,
 			 struct gunyah_rm_hyp_resource *hyp_resource);
 void gunyah_rm_free_resource(struct gunyah_resource *ghrsc);
 
+int gunyah_rm_vm_set_demand_paging(struct gunyah_rm *rm, u16 vmid, u32 count,
+				   struct gunyah_rm_mem_entry *mem_entries);
+enum gunyah_rm_range_id {
+	GUNYAH_RM_RANGE_ID_IMAGE = 0,
+	GUNYAH_RM_RANGE_ID_FIRMWARE = 1,
+};
+
+int gunyah_rm_vm_set_address_layout(struct gunyah_rm *rm, u16 vmid,
+				    enum gunyah_rm_range_id range_id,
+				    u64 base_address, u64 size);
+
+
 int gunyah_rm_call(struct gunyah_rm *rsc_mgr, u32 message_id,
 		   const void *req_buf, size_t req_buf_size, void **resp_buf,
 		   size_t *resp_buf_size);
-- 
2.39.5


