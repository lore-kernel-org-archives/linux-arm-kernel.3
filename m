Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77078C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fkw6jo/oeFh6qnWXDp6jlBdNEq901uF/wqE5/ZMg0xQ=; b=akOidYJECvlC3sAAl/ep9gOrPb
	QtUxLQv4yW9/iSse5MEli7MVxMw97gMnksHafwzPnrf5EQObbkh7u3w4Bem35DMcpDBlbWPiN6lbD
	hOMAuRJMWIcwIlNMzBFS4aM+ph86ueDrcTrCcZkJlWEIUVFMITmdqpV5Y0g+TFrHu8ZWP3+ZjWrTt
	GKQ9gtCkJt96kRWP0uU4vRnLX5IIxbepHH8UJ17DvsAfYzhPOPvjrAUzpw+WXIZt4MEYRvzJ9c5Mt
	EXnt5Jnnw1rLXt/I9Lb0RAHjWkacDZPmv5evWaeic4w6EzbAUVfTc9hcMxiC0mlASC3wIRUGmpWRZ
	Y1bVxW7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z66-0000000EeOS-3aQh;
	Thu, 24 Apr 2025 16:06:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xLO-0000000EKrS-2uua
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:27 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so878189f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504065; x=1746108865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fkw6jo/oeFh6qnWXDp6jlBdNEq901uF/wqE5/ZMg0xQ=;
        b=lfZ/E5uKgadFQj6K/WPQL0fQDUC1JalhkxJGIBlDo+3nW9xMRCzKyxGnKoPhKy6QIa
         lXBWx2xY2YwdtqNXxWmufm1KMXjxQtpKWAjsM595T9gXJfdZhDfnCaTKhQlLeVOLMUoW
         WygrsI+XSU6pY1IGzU38LrLmmjEHhBZ8sxd8NjekymHhALfDmhawz7IGVm7G/J5Gk8Ww
         0E5ffALuXkJxoDJVb2HxqZeWhbRVzwMVcOPt6qRsFTbrSN5F5oPb/UW4izEmynqFvNhm
         qJGAOKgdctikzVR7vW/z/M7AfzGJQ6ARqUJrx/LZm4ts9l0ybCVqqkq9WV1zQZuPhbmw
         ZEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504065; x=1746108865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fkw6jo/oeFh6qnWXDp6jlBdNEq901uF/wqE5/ZMg0xQ=;
        b=s/2ugRB14qjdwP/Hyy6mnRPAHEcvJQfU/O2M2EYQltSr5yCswxY0+acVch5j1ZCsno
         t+YiNm6ipX2fCTSOMaoKqFNnrtuoAqC4UtUxgPoh1JxD2NvBhBDUq3b/uk3h7p0r/mO/
         mRKZaYJd8tAV/MoJeL5m+8UaI37TdK8WVZEMrnc1+zyy81A1iN/fAjw48mCDdGIHWjvL
         QbKgTNtUVIFhtlMbdmcJp4o3l3FqEfrwAwVfRpBe+LFQ+GxVjwdnBH7l7E4SOI6A7jer
         OmSYEcPwl5q8DxtmyUFvxfv1o6XuF100d+CJBLf8nZS4eRaYxHS/ojsE/m38FYXv6qB4
         /Tsw==
X-Forwarded-Encrypted: i=1; AJvYcCVjrv+x8alNoJ+kC2vjo6+2dgli4K5rnw5IR3rNRgVYagMaIJ2TurymFEZXYDzX/DRaKQXHbfXDbq8zcwOZEWb8@lists.infradead.org
X-Gm-Message-State: AOJu0YzeSM1ifG3+ILPrje7zUVbuNpu4+evZTHSxs2PTYkI4L2fKmyR8
	Yyic/E1VNO1DT20M+JhQBvF/4lTavzgUmgoc77ZDH0UB8qMtLLcgA4L3J2Z2vYk=
X-Gm-Gg: ASbGncsP1gQo5kF2Bbr8wy0uTycBdznX8NPUElUm6vYmusxZDR/pLxrd31BtA6j2RY5
	ilSC3erj8mTeNbV9MkaJR86xPx5chTnfjIAIj/Ig/998qt753cVLDFXqUyK4lncC+DicSjZcMJd
	fz7mGccI3yhsPBcd/onOypnQyufB6CjtCR8k5Yj4qMn/KVZShkDbDGVPy4CvjQlXJGo0KOmcqCA
	h6n55sr3V4yZwSHH8PogxCQjXtjZSNG48PnaKLtZzqNGWDtOHX4MxiZYkL7ZicWxRfi2wX/I4Wu
	efhRgYPKuRHUpfuteEavyTIImIuAvS98qvl8KURYcVYu3WVlHAjX+2ga9VP0IDRBBc1lFR5YqEK
	+4BRL/lay6Bxp2if3
X-Google-Smtp-Source: AGHT+IELqmSvaP6OfocDnjzMS7mUki3w51itbTq+w393mXtO1Vl290MnI9dSMs1K0cj071gNYf3OVQ==
X-Received: by 2002:a5d:6da2:0:b0:39e:cc0c:9789 with SMTP id ffacd0b85a97d-3a06cf4f2f6mr2251923f8f.11.1745504065280;
        Thu, 24 Apr 2025 07:14:25 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:24 -0700 (PDT)
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
Subject: [RFC PATCH 30/34] gunyah: Add RPC to set VM boot context
Date: Thu, 24 Apr 2025 15:13:37 +0100
Message-Id: <20250424141341.841734-31-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071426_732191_72DDFB7A 
X-CRM114-Status: GOOD (  13.66  )
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

The initial context of a the primary vCPU can be initialized by
performing RM RPC calls.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Reviewed-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 drivers/virt/gunyah/rsc_mgr_rpc.c | 32 +++++++++++++++++++++++++++++++
 include/linux/gunyah_rsc_mgr.h    |  2 ++
 2 files changed, 34 insertions(+)

diff --git a/drivers/virt/gunyah/rsc_mgr_rpc.c b/drivers/virt/gunyah/rsc_mgr_rpc.c
index 7fccd871cc0b..78c4d1d5d42a 100644
--- a/drivers/virt/gunyah/rsc_mgr_rpc.c
+++ b/drivers/virt/gunyah/rsc_mgr_rpc.c
@@ -106,6 +106,15 @@ struct gunyah_rm_vm_config_image_req {
 	__le64 dtb_size;
 } __packed;
 
+/* Call: VM_SET_BOOT_CONTEXT */
+struct gunyah_rm_vm_set_boot_context_req {
+	__le16 vmid;
+	u8 reg_set;
+	u8 reg_index;
+	__le32 _padding;
+	__le64 value;
+} __packed;
+
 /* Call: VM_SET_DEMAND_PAGING */
 struct gunyah_rm_vm_set_demand_paging_req {
 	__le16 vmid;
@@ -447,6 +456,29 @@ int gunyah_rm_vm_init(struct gunyah_rm *rm, u16 vmid)
 }
 ALLOW_ERROR_INJECTION(gunyah_rm_vm_init, ERRNO);
 
+/**
+ * gunyah_rm_vm_set_boot_context() - set the initial boot context of the primary vCPU
+ * @rm: Handle to a Gunyah resource manager
+ * @vmid: VM identifier
+ * @reg_set: See &enum gunyah_vm_boot_context_reg
+ * @reg_index: Which register to set; must be 0 for REG_SET_PC
+ * @value: Value to set in the register
+ */
+int gunyah_rm_vm_set_boot_context(struct gunyah_rm *rm, u16 vmid, u8 reg_set,
+				  u8 reg_index, u64 value)
+{
+	struct gunyah_rm_vm_set_boot_context_req req_payload = {
+		.vmid = cpu_to_le16(vmid),
+		.reg_set = reg_set,
+		.reg_index = reg_index,
+		.value = cpu_to_le64(value),
+	};
+
+	return gunyah_rm_call(rm, GUNYAH_RM_RPC_VM_SET_BOOT_CONTEXT,
+			      &req_payload, sizeof(req_payload), NULL, NULL);
+}
+ALLOW_ERROR_INJECTION(gunyah_rm_vm_set_boot_context, ERRNO);
+
 /**
  * gunyah_rm_get_hyp_resources() - Retrieve hypervisor resources (capabilities) associated with a VM
  * @rm: Handle to a Gunyah resource manager
diff --git a/include/linux/gunyah_rsc_mgr.h b/include/linux/gunyah_rsc_mgr.h
index f16e64af9273..6a07fe25b0ba 100644
--- a/include/linux/gunyah_rsc_mgr.h
+++ b/include/linux/gunyah_rsc_mgr.h
@@ -126,6 +126,8 @@ int gunyah_rm_vm_configure(struct gunyah_rm *rm, u16 vmid,
 			   u32 mem_handle, u64 image_offset, u64 image_size,
 			   u64 dtb_offset, u64 dtb_size);
 int gunyah_rm_vm_init(struct gunyah_rm *rm, u16 vmid);
+int gunyah_rm_vm_set_boot_context(struct gunyah_rm *rm, u16 vmid, u8 reg_set,
+				  u8 reg_index, u64 value);
 
 struct gunyah_rm_hyp_resource {
 	u8 type;
-- 
2.39.5


