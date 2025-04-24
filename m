Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786B2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqI809F7wKcnGZMELURBH0WwNUVNARNAdRqZ1Gwku8c=; b=PJ3YU1mQdHBCbqoIsFXy9DEUxl
	iCgiI/sH69BFg6FPiLQrEO4DxgdQtzqpC4KL9iYq9AAwtKyMlOZDWkIccUWuUkScl0MKRfWYCzu+s
	Ty2BSb3nSIl4iRLSbM1MezzuF5QeYAQG51DpNs3iiVoDIbaIqrlKRgF1WBd1UobM75umESUqucc+T
	AnaaqO4IsDOwflq8SrayCY9fSrqY/JwWkzxehRHww3kYHqE2sY4yuCQD+nf9bYyvjDeWc+Pe6bifA
	xAMciWh8yoepA7hrCCIqOVcC6OIhkw590fkCYCs060fVm1H7//lYijaDKFxFbrP3wx8Tcay3jpD3P
	0sa5PstQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z5w-0000000Ee8c-3Xx0;
	Thu, 24 Apr 2025 16:06:36 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xLK-0000000EKqO-3TaD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:23 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39c0dfba946so793952f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504061; x=1746108861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqI809F7wKcnGZMELURBH0WwNUVNARNAdRqZ1Gwku8c=;
        b=cs7SEn1lKIukjhQv+1GrRLuDLgBBfUfO0qFB1A/L+yCYZDREP1DMo7z02AyVkZep6A
         UczHiwrq7JW+IHnS6y89uOQi1aynn1tHcqHTt6QBsrRGRHTddovCcccDuciLdvDjOD4m
         OpH5O5uqNGwQMTCo0pmfMrfMJvWf9zlvZzXq9Zzj8wyzVOwqJK0fJFnQRqE7gD+QNnoX
         u6GEoNRzPH9v6+fVgu6EUsuRwMosuYKYHE0pKdwCDIHvIi9JkxsIeDXoIJt/dqfvjB7G
         dMM+tClie8jf1E1X29V6LDyIlPLug22x7AD6Xx1PD65yqfHewAcQcpx2GuEMpt/1h0Eb
         ZTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504061; x=1746108861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqI809F7wKcnGZMELURBH0WwNUVNARNAdRqZ1Gwku8c=;
        b=kLaEBrVdWlHlqohBGP8XbLHXS3U/TVpDShVxklFLSsKq0JgG9CK5SU1fS8tYywTv1J
         4IXmdm40PcohLR6t0G6C8wjk81YnHks904JwpncubpjzxcuJGSHQkIqVrw+oUNJZkSfN
         fJWiANvtxj5g06Io+mTJPBDwv7qKFcxinnpHgREUfNMcDOgQtAr731tUfTU33R5Ki5ia
         XPVfdGvbNurIaXqMC3S8q0NBLBKYf9B3OKBFBthU4/GPMlJ4S8do7fx8mt7wNViU1jH0
         ckz24zgknh0JqZNDfa8zde4yD8Mopn/Zkw/5LOjFRRWCKI1osMa93K096QnahkRcb8xt
         6XpA==
X-Forwarded-Encrypted: i=1; AJvYcCWpP/9UMmx7TaNTsb5YnSurUyxpeTc7fYyUz7bcdBb6umFokR1doMfpdpDYQt6aVAAao4iRQOR+R7/A+e1uGovk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7ZEdnt7wmoCm1nbuJd2M4yQVvZYtMzZttgyXQ5MjHf61BoQQh
	pS7SOsO0cy5L++RV6MRr0OQv+Ykb2vKKD9l9r3oY1KdkViKmvQ7hFidKwht3l0U=
X-Gm-Gg: ASbGncsweXkzaE2m8xlLpe7O6ngk4ET7E7s+/bCgXmITKor2eDWJsV2nqE1hXRxCc++
	dDB5ES+WSQu121fUCf+uRsHHG88HT+0bc+9tEDEUS1rNehdHBMYh64muneLtLx8in9m/nI4zVNc
	vjyEsMejK840TzdQAqutit0F1BZxtqI1BfO2iWZsGS/39sUVImfiuJyEmfI1Cjh95V1wUFxEhE1
	X418sAahq/3aaZCcfJQ96jVWH/Wirq8zod6SMLNCNwYDF1heuiRCEI9e1O+Dg51fuhbeGa5mxYU
	uNgt2aUPO4tkO41GNjKcy594GUrq0mrzdHwM/uHS/F8cfNGcanKr64Xv4//Yc3JxrDGJ1pYKyZj
	4zlkDmeM74sx5UAWE
X-Google-Smtp-Source: AGHT+IHu0xINB3AI0ORmGPEOw/RldxQp1Lf0CLnYLBWHSDl9/V/LyKw8BRQRYMCgyV0pnZHvllr1jA==
X-Received: by 2002:a5d:584e:0:b0:39a:c9ac:cd3a with SMTP id ffacd0b85a97d-3a06cfa9c91mr2435184f8f.51.1745504061234;
        Thu, 24 Apr 2025 07:14:21 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:20 -0700 (PDT)
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
Subject: [RFC PATCH 27/34] gunyah: Share guest VM dtb configuration to Gunyah
Date: Thu, 24 Apr 2025 15:13:34 +0100
Message-Id: <20250424141341.841734-28-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071422_878910_8042CFA8 
X-CRM114-Status: GOOD (  19.92  )
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

Gunyah Resource Manager sets up a virtual machine based on a device tree
which lives in guest memory. Resource manager requires this memory to be
provided as a memory parcel for it to read and manipulate. Construct a
memory parcel, lend it to the virtual machine, and inform resource
manager about the device tree location (the memory parcel ID and offset
into the memory parcel).

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/kvm/gunyah.c | 27 ++++++++++++++++++++++++---
 include/linux/gunyah.h  | 10 ++++++++++
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/gunyah.c b/arch/arm64/kvm/gunyah.c
index ef0971146b56..687f2beea4e7 100644
--- a/arch/arm64/kvm/gunyah.c
+++ b/arch/arm64/kvm/gunyah.c
@@ -699,8 +699,7 @@ static int gunyah_reclaim_memory_parcel(struct gunyah_vm *ghvm,
 	if (parcel->mem_handle != GUNYAH_MEM_HANDLE_INVAL) {
 		ret = gunyah_rm_mem_reclaim(ghvm->rm, parcel);
 		if (ret) {
-			dev_err(ghvm->parent, "Failed to reclaim parcel: %d\n",
-				ret);
+			pr_err("Failed to reclaim parcel: %d\n", ret);
 			/* We can't reclaim the pages -- hold onto the pages
 			 * forever because we don't know what state the memory
 			 * is in
@@ -1574,6 +1573,7 @@ static void gunyah_vm_stop(struct gunyah_vm *ghvm)
 
 static int gunyah_vm_start(struct gunyah_vm *ghvm)
 {
+	struct kvm *kvm = &ghvm->kvm;
 	struct gunyah_rm_hyp_resources *resources;
 	struct gunyah_resource *ghrsc;
 	int i, n, ret;
@@ -1597,7 +1597,18 @@ static int gunyah_vm_start(struct gunyah_vm *ghvm)
 	ghvm->vmid = ret;
 	ghvm->vm_status = GUNYAH_RM_VM_STATUS_LOAD;
 
-	ret = gunyah_rm_vm_configure(ghvm->rm, ghvm->vmid, ghvm->auth, 0, 0, 0, 0, 0);
+	ghvm->dtb.parcel_start = gpa_to_gfn(kvm->dtb.guest_phys_addr);
+	ghvm->dtb.parcel_pages = gpa_to_gfn(kvm->dtb.size);
+	ret = gunyah_share_memory_parcel(ghvm, &ghvm->dtb.parcel,
+					 ghvm->dtb.parcel_start,
+					 ghvm->dtb.parcel_pages);
+	if (ret) {
+		pr_warn("Failed to allocate parcel for DTB: %d\n", ret);
+		goto err;
+	}
+
+	ret = gunyah_rm_vm_configure(ghvm->rm, ghvm->vmid, ghvm->auth,
+			ghvm->dtb.parcel.mem_handle, 0, 0, 0, kvm->dtb.size);
 	if (ret) {
 		pr_warn("Failed to configure VM: %d\n", ret);
 		goto err;
@@ -1698,6 +1709,16 @@ static void gunyah_destroy_vm(struct gunyah_vm *ghvm)
 	if (ghvm->vm_status == GUNYAH_RM_VM_STATUS_RUNNING)
 		gunyah_vm_stop(ghvm);
 
+	if (ghvm->vm_status == GUNYAH_RM_VM_STATUS_LOAD ||
+	    ghvm->vm_status == GUNYAH_RM_VM_STATUS_READY ||
+	    ghvm->vm_status == GUNYAH_RM_VM_STATUS_INIT_FAILED) {
+		ret = gunyah_reclaim_memory_parcel(ghvm, &ghvm->dtb.parcel,
+						 ghvm->dtb.parcel_start,
+						 ghvm->dtb.parcel_pages);
+		if (ret)
+			pr_err("Failed to reclaim DTB parcel: %d\n", ret);
+	}
+
 	gunyah_vm_remove_resource_ticket(ghvm, &ghvm->addrspace_ticket);
 	gunyah_vm_remove_resource_ticket(ghvm, &ghvm->host_shared_extent_ticket);
 	gunyah_vm_remove_resource_ticket(ghvm, &ghvm->host_private_extent_ticket);
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 1d363ab8967a..72aafc813664 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -94,6 +94,12 @@ struct gunyah_vm_resource_ticket {
  * @resource_tickets: List of &struct gunyah_vm_resource_ticket
  * @auth: Authentication mechanism to be used by resource manager when
  *        launching the VM
+ * @dtb: For tracking dtb configuration when launching the VM
+ * @dtb.parcel_start: Guest frame number where the memory parcel that we lent to
+ *                    VM (DTB could start in middle of folio; we lend entire
+ *                    folio; parcel_start is start of the folio)
+ * @dtb.parcel_pages: Number of pages lent for the memory parcel
+ * @dtb.parcel: Data for resource manager to lend the parcel
  */
 struct gunyah_vm {
 	u16 vmid;
@@ -113,6 +119,10 @@ struct gunyah_vm {
 	struct gunyah_vm_resource_ticket host_shared_extent_ticket;
 	struct gunyah_vm_resource_ticket guest_private_extent_ticket;
 	struct gunyah_vm_resource_ticket guest_shared_extent_ticket;
+	struct {
+		gfn_t parcel_start, parcel_pages;
+		struct gunyah_rm_mem_parcel parcel;
+	} dtb;
 };
 
 /**
-- 
2.39.5


