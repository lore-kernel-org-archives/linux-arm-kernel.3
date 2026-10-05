Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7815BCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwlAWAAy7BYUoB7+a9T937QVUxmXXORCOGD20YZnv/k=; b=Ho5ayQSS6BX7AHNgpagFfGHYHL
	rtHou+hOj/QNF+2IJHOEXUT3pFkGVf1u9EUDONhOPxMXBOtp+7RPHliwi9iazoxHMoaT1TQ5KAUf8
	Cq24+7z0LG8o6vvqlScKkT7jrXqTcJ9Pepy7+i3qP7X6Jxex1VfniUCvEND+VT+FBJR7h9zEFl+1i
	Tbj91yr8aMhcrgv74W/O3EtUPr7pVJnBU1AULjXhKMz8tW+p1BtGR15mRJRidiyoVcotRsY//Y0RL
	baS09emY/bSS9HjfG8h6L2123ttyHt3OeDEnRQQEH/uHIlM7heVLizOqmlk9aUa0xGBfuSpEjaQAN
	nYywzR1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfQS-0000000G60M-3uoD;
	Mon, 05 Oct 2026 09:56:04 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfQP-0000000G5xP-1B3x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:56:02 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c29703cb470so266549366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 02:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791194160; x=1791798960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JwlAWAAy7BYUoB7+a9T937QVUxmXXORCOGD20YZnv/k=;
        b=JUBqHwQ7QLS6rvNBN2A4TS8DBUyGzXQPUaBwqZOTJNRTJo+Fil+330eoGDO04h33GR
         1jSnoKFnWZKO+GzAloZFrP4JHktJowdcDCPcM8HsDGAVsQMXqGhePTbqqMIaMvEmMO2y
         h4NhAOmVWbNOHSx2AwLEGZRGShwNNlg7NxclwX+Qji+X+1CBIM/14uK9PjddM1K8BwgP
         LwFHwnuKcmL9qwwiAC86vevV9GvzYTQrY9LWm9l4CSqxp0DJryjJmyZBzmNw4mR2OpaA
         r92aTh93jPq8N318s4wUyFRnCcvaGcdeVGSMABFbxG13D3VBfRyIIy87jj6NKyE9zpcN
         wiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194160; x=1791798960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JwlAWAAy7BYUoB7+a9T937QVUxmXXORCOGD20YZnv/k=;
        b=MsZY2Gm+FHYiZCNFmJz88afweqVE4cZPgL++XwuflQ4I+0NGKWM2RE/mOL3tPec8QE
         mhosm+9eIQg9XhsrlJxWHYIC+Q3sbGqWTc0yKCmCLUHpG1EoVT8fjE0a6TGeKuuLnmMK
         klRF8FjYx1ii8S1BGqbzQWUJQ5ocpPYMiWD2Jzo+dnniePILr1buN/glHd0G+fNF+dEK
         phxMCd/GdyTGLXdnyCtK3wa7RkRe86/xstfMSWD5VIAbDq4CnZh05KOQJwlsXTk8PCog
         WrvhWtj3HOycnSyQiPCLnmGs744NndiBs6GX1SZmMyltORdHYl/Gq5wCeuqsukhKBxsX
         bnQw==
X-Forwarded-Encrypted: i=1; AKwUvBze+GpHtyM0vcu4GdjdzP4cdOOZw29Tdof7oyzIbnv2NxZLtS66KqbteTg7rDVR+Ja2R7S5PACXoS1+D7mb8hRx@lists.infradead.org
X-Gm-Message-State: AFuF++mw9Tfs/bNgTzN9YWZI4kCbe8Y475uRcMA4WblV1fbb7IRCoZGe
	0KWblFuy3c6ltOM+pcgY7d/1n1BuWy2PzHXz+TzN+05c6MYHU/8I7yjb
X-Gm-Gg: AYBFou2Hfo8nurxfgOQ66eoRoJYueAMwgkGcV+RRqeA6rSaFfY6Z8Fudp+YZQXpACfu
	jlaz01B94WWvfFUlDhArLydKnwKXEA1DQsXVh5Q2qlwZK6EqOvuBFt+t+kizQeE5EQIGdpHagRI
	SaD+KuUQwzXy6vZ14buOyLIpq2UMEf7sgzAdt+HKuW/PCnEMRPNfPVz3FGVq98VbQiBBJbl/AHy
	XJASM4OlEPT3Zhph1NBjUyHrsqwaSVmTpBW4MCb65OEw0lmX1lUoskH5ZuEBj5tfXgw3tJCOzI6
	57xlw7m36H0x2PompSiONCJXswdNtmhysFrEohzM9VD16cdPR7eDo1pejoG7gK9eFyts6EWxsdu
	10lNc9IV4RHSb/qFoU8HbVHESM7R/Jdo0851sJJ0NucBiUW7Kmy7ZGSL3Ispd/D289CQTDc+LnY
	pkzZC2U1Rx290wYhVysswmPupb1Vbzn2VjqkmRc+yU15UIiDLgHAXECrIhgwhRgwTwu+J5esgTL
	VpI8Mo/qCUMiMNj0fcgoLA2Z1v8LwjLfz5k6qsrqaRFUM5IWyOCa5F9bZMtt3hYOUTIyZmjSo5k
	hWsL1Yl9j/gfuj7S7dEqzvuAhZbjQI4t7E265z0pHZSX1g==
X-Received: by 2002:a17:907:6d11:b0:c25:2688:8212 with SMTP id a640c23a62f3a-c2e4a6a273emr858285166b.0.1791194159542;
        Mon, 05 Oct 2026 02:55:59 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31562aba16sm50753266b.23.2026.10.05.02.55.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:55:59 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex@shazbot.org>,
	Shuah Khan <shuah@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [RFC PATCH 4/6] dma-buf: Allow dynamic attach without a device
Date: Mon,  5 Oct 2026 09:55:50 +0000
Message-ID: <20261005095552.52748-5-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005095552.52748-1-griffoul@gmail.com>
References: <20260720111259.122911-1-dwmw2@infradead.org>
 <20261005095552.52748-1-griffoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_025601_442849_C37E9F7B 
X-CRM114-Status: GOOD (  21.36  )
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

From: Fred Griffoul <fgriffo@amazon.co.uk>

dma_buf_dynamic_attach() requires a struct device: the device for which
the buffer is mapped for DMA. Exporters may also check it before they
accept the attachment. An importer that does not perform DMA has no
such device. iommufd already attaches with a global placeholder device
for this reason. KVM would need one too, although it only needs to know
where the memory is so that it can map it into a guest.

Allow @dev to be NULL for a dynamic importer. Such an importer learns
where the memory is from get_phys() and builds its own mappings. It
must not map the attachment for DMA, and dma_buf_map_attachment()
refuses an attachment without a device. An exporter that needs a device
to answer can refuse the attachment in its attach op, as it can for any
other reason.

Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 drivers/dma-buf/dma-buf.c      | 15 +++++++++++++--
 include/trace/events/dma_buf.h |  2 +-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index e7010163eb2f..3d43b529a523 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1007,6 +1007,13 @@ dma_buf_pin_on_map(struct dma_buf_attachment *attach)
  * Note that this can fail if the backing storage of @dmabuf is in a place not
  * accessible to @dev, and cannot be moved to a more suitable place. This is
  * indicated with the error code -EBUSY.
+ *
+ * @dev may be NULL for a dynamic importer that is not a DMA master: one that
+ * only asks the exporter where the memory is, through &dma_buf_ops.get_phys,
+ * and builds its own mappings from the answer.  Such an importer must never
+ * call dma_buf_map_attachment(), and an exporter that needs a device to
+ * answer (a peer-to-peer check, say) refuses the attachment in its
+ * &dma_buf_ops.attach.
  */
 struct dma_buf_attachment *
 dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
@@ -1016,7 +1023,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	struct dma_buf_attachment *attach;
 	int ret;
 
-	if (WARN_ON(!dmabuf || !dev))
+	if (WARN_ON(!dmabuf || (!dev && !importer_ops)))
 		return ERR_PTR(-EINVAL);
 
 	attach = kzalloc_obj(*attach);
@@ -1175,6 +1182,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 
 	if (WARN_ON(!attach || !attach->dmabuf))
 		return ERR_PTR(-EINVAL);
+	/* An importer without a device cannot be a DMA master. */
+	if (WARN_ON(!attach->dev))
+		return ERR_PTR(-EINVAL);
 
 	dma_resv_assert_held(attach->dmabuf->resv);
 
@@ -1847,7 +1857,8 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 		attach_count = 0;
 
 		list_for_each_entry(attach_obj, &buf_obj->attachments, node) {
-			seq_printf(s, "\t%s\n", dev_name(attach_obj->dev));
+			seq_printf(s, "\t%s\n", attach_obj->dev ?
+				   dev_name(attach_obj->dev) : "none");
 			attach_count++;
 		}
 		dma_resv_unlock(buf_obj->resv);
diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
index 3bb88d05bcc8..7cabca53b798 100644
--- a/include/trace/events/dma_buf.h
+++ b/include/trace/events/dma_buf.h
@@ -40,7 +40,7 @@ DECLARE_EVENT_CLASS(dma_buf_attach_dev,
 	TP_ARGS(dmabuf, attach, is_dynamic, dev),
 
 	TP_STRUCT__entry(
-		__string(	dev_name,			dev_name(dev))
+		__string(dev_name, dev ? dev_name(dev) : "none")
 		__string(	exp_name,			dmabuf->exp_name)
 		__field(	size_t,				size)
 		__field(	ino_t,				ino)
-- 
2.47.3


