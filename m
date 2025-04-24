Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245D2C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXvNlcutyMXVdoUVJkL/Ta8/a2mdxRJrpPZQuCyEfUg=; b=RnUf5k0XlVViTGH87AYjjmr/gc
	1wr+vhtOgGvvXgRli5PdmDBokz4CnV/twPkUWk0O66rgwQC9HQVO9eJajeKB+79Pi8NVpQWW1NWHB
	4/9lZwsyvgRBiEkaL6Q+OxLNi6hWNu0ybys9wwqGGXF27sdt8NnutpWMcJ8McY72QCC1p4dTW7Yj0
	Q/EbDXEJ4+KE7693QDYK0bMKg9WC5BuZ/uJCA8r03xtddIXy2/H/kpc8Xn5LK8MnXfMASp98mPjLE
	H62MV4WuCope6mV+2cKlKbUbF1sNDWkVOgYcYQRFxyo+YH79PVAXwR+3ULUBSE4DmWlR4poGuta9n
	DeWUovZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6B-0000000EeUy-0VF3;
	Thu, 24 Apr 2025 16:06:51 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xLS-0000000EKsk-1wK1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:31 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3913958ebf2so866934f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504069; x=1746108869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXvNlcutyMXVdoUVJkL/Ta8/a2mdxRJrpPZQuCyEfUg=;
        b=QqUZH9exN+zoMJZ+82llDUoUNXT3ceIezkKLV2Ou7zoNw8AiPgB51nhcniKthR6MFp
         VBsSpL2P+4YL/at93+nbVK2yE70NXOOXAjoD+kbc4qkHmS+bWE0BLuSt09LMjlduHQN4
         3FCQu257n6dbLPxZ0rvBSLcxyFz/EQUgZDQ2ruBlalhl+w+HXtf7ZzgBx1/uVSk+ThXF
         WQAK2Ua7zjnyUFXExBQkGS3ZNmsmihVedNy0KC/FXviK5VdbJ2NbleDA9Ypi5hYxt7f1
         lcZa0gawmCWG/LGSkvt+e9dpgx1O/HH8yHlx/U5vHPGGcf/Mx9vKlzwabY/Cd/mm4Nan
         7ZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504069; x=1746108869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXvNlcutyMXVdoUVJkL/Ta8/a2mdxRJrpPZQuCyEfUg=;
        b=sAf7NO2gHxCnp6wCYxjPv4Ep+zp9PIZ7yE01wWnE+9pmjT1fTWIU6ORYInnJk+hAS3
         x1hLT85MSyPqdwTYmAPS0s6iRtcvqQ4wwy4zgSIpseyjRB//W/uZaaiw+7sCmgG8xodW
         R8RP24hssZVBNvoVv3y8EJACxNRjdbLjhStCU5g5xwYlDbXzkeUrRdqW9SQH5Nww4jfR
         gchj0FiXY2WR8p9/DEhThLSfwQwu9QdOwwEQLTVOLx0f7UpfeKsQUjxR/qwyUEAF9aHD
         7UWXUDtZx2TyB1Y/Y2mzaJuJK4WXXiT4sElntpKeqp49ayYKSH4O3l4MazBV3Kq6l1AF
         AOug==
X-Forwarded-Encrypted: i=1; AJvYcCXTjtezcCLpeixHRZlsdn2drcBpNhOQAaJlHwU7ZIvnVkBpaQk11mesK/WjpQFw8x30cg8eTghMZlscDDVXtvcF@lists.infradead.org
X-Gm-Message-State: AOJu0YzALnNZfVdNSDXcVGzRwmcl9nJ/wJRIgbTdYDrmXwq5f5qmdqUw
	ZaQIkdhEWhWBrWV5uQXMd/Xgq52IKbaCqjkSvl+BRKP4fNlAFzpS/2inPbzVsMQ=
X-Gm-Gg: ASbGncvmkDLQ8Uk7c6HWJGR+4yX1CwMAY86OGq8n0kP5hqY7Iwx+Pa79yIjwi+YWwq7
	j4pMPUw0t2NmgbyrSfu3XxznvrNxScfy/ELwJYNbQBoM8Qi2Rpoo2Df1Wu2bYK9hDRRA4pusNQU
	DMjVM3KDaK0ZIaQMnQ8syE3XISOVaLeDef1QQ7xXkMt1T1Eq0TjS86PUhvaiZ+8kuuwCUmTQUfC
	osts9gr2BvAfO5Gv9TcJHgPgKj2ZwTr43PRP5BqhGp33+mOgT6Zz0hbCT4LmXpl7h5oNYu2IR9t
	Z4XASvKpxPRnROWVpYVl9sba89oJOqSErNOaKdE9oJJf9R2BovE0ATFmxwQ0xNI0tCuti7vsEIe
	6iPiY19nldrvRNFzI
X-Google-Smtp-Source: AGHT+IH0tCAHy+56/cv4ZEG1Nkj43NDfif06A0s6QNH24+K7YCAgJ/1BfT2MGE/c41oOF+y78aq+Lw==
X-Received: by 2002:a5d:4092:0:b0:39a:c80b:8288 with SMTP id ffacd0b85a97d-3a06cf635f7mr2018268f8f.33.1745504069033;
        Thu, 24 Apr 2025 07:14:29 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:28 -0700 (PDT)
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
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [RFC PATCH 33/34] KVM: gunyah: Implement irqfd interface
Date: Thu, 24 Apr 2025 15:13:40 +0100
Message-Id: <20250424141341.841734-34-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071430_510673_D4681F67 
X-CRM114-Status: GOOD (  18.47  )
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

Enables support for injecting interrupts into guest vCPUs via KVM's
irqfd interface. Irqfds are requested from userspace via KVM_IRQFD
ioctl. kvm_arch_irqfd_init() implementation, in Gunyah, then creates
a resource ticket for the irqfd. The userspace must also create a
devicetree node to create a doorbell with the corresponding label.
Later after VM configuration (in gunyah_vm_start()), the resource ticket
will be populated and the irqfd instance will be bound to its
corresponding doorbell (identified with a capability id). When userspace
asserts the irq line, irqfd->set_irq() callback is called to inject an
interrupt into the guest via a hypercall.

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/kvm/gunyah.c | 100 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/kvm/gunyah.c b/arch/arm64/kvm/gunyah.c
index df922be2429e..23b9128bf5b1 100644
--- a/arch/arm64/kvm/gunyah.c
+++ b/arch/arm64/kvm/gunyah.c
@@ -29,6 +29,14 @@
 #define WRITE_TAG (1 << 0)
 #define SHARE_TAG (1 << 1)
 
+struct gunyah_irqfd {
+	struct gunyah_vm *ghvm;
+	struct gunyah_resource *ghrsc;
+	struct gunyah_vm_resource_ticket ticket;
+	struct kvm_kernel_irqfd irqfd;
+	bool level;
+};
+
 static int gunyah_vm_start(struct gunyah_vm *ghvm);
 
 static enum kvm_mode kvm_mode = KVM_MODE_DEFAULT;
@@ -852,6 +860,98 @@ static int gunyah_start_paging(struct gunyah_vm *ghvm)
 	return ret;
 }
 
+static bool gunyah_irqfd_populate(struct gunyah_vm_resource_ticket *ticket,
+				  struct gunyah_resource *ghrsc)
+{
+	struct gunyah_irqfd *irqfd =
+		container_of(ticket, struct gunyah_irqfd, ticket);
+	int ret;
+
+	if (irqfd->ghrsc) {
+		pr_warn("irqfd%d already got a Gunyah resource", irqfd->ticket.label);
+		return false;
+	}
+
+	irqfd->ghrsc = ghrsc;
+	if (irqfd->level) {
+		/* Configure the bell to trigger when bit 0 is asserted (see
+		 * irq_wakeup) and for bell to automatically clear bit 0 once
+		 * received by the VM (ack_mask).  need to make sure bit 0 is cleared right away,
+		 * otherwise the line will never be deasserted. Emulating edge
+		 * trigger interrupt does not need to set either mask
+		 * because irq is listed only once per gunyah_hypercall_bell_send
+		 */
+		ret = gunyah_hypercall_bell_set_mask(irqfd->ghrsc->capid, 1, 1);
+		if (ret)
+			pr_warn("irq %d couldn't be set as level triggered."
+				"Might cause IRQ storm if asserted\n",
+				irqfd->ticket.label);
+	}
+
+	return true;
+}
+
+static void gunyah_irqfd_unpopulate(struct gunyah_vm_resource_ticket *ticket,
+				    struct gunyah_resource *ghrsc)
+{
+}
+
+static int gunyah_set_irq(struct kvm_kernel_irqfd *kvm_irqfd)
+{
+	int ret;
+	struct gunyah_irqfd *irqfd =
+		container_of(kvm_irqfd, struct gunyah_irqfd, irqfd);
+
+	if (irqfd->ghrsc) {
+		if (gunyah_hypercall_bell_send(irqfd->ghrsc->capid, 1, NULL)) {
+			pr_err_ratelimited("Failed to inject interrupt %d: %d\n",
+					irqfd->ticket.label, ret);
+			return -1;
+		}
+	} else {
+		pr_err_ratelimited("Premature injection of interrupt\n");
+		return -1;
+	}
+
+	return 1;
+}
+
+struct kvm_kernel_irqfd *kvm_arch_irqfd_alloc(void)
+{
+	struct gunyah_irqfd *irqfd;
+
+	irqfd = kzalloc(sizeof(struct gunyah_irqfd), GFP_KERNEL);
+	if (!irqfd)
+		return NULL;
+
+	return &irqfd->irqfd;
+}
+
+void kvm_arch_irqfd_free(struct kvm_kernel_irqfd *kvm_irqfd)
+{
+	struct gunyah_irqfd *irqfd = container_of(kvm_irqfd, struct gunyah_irqfd, irqfd);
+
+	gunyah_vm_remove_resource_ticket(irqfd->ghvm, &irqfd->ticket);
+	kfree(irqfd);
+}
+
+int kvm_arch_irqfd_init(struct kvm_kernel_irqfd *kvm_irqfd)
+{
+	struct gunyah_vm *ghvm = container_of(kvm_irqfd->kvm, struct gunyah_vm, kvm);
+	struct gunyah_irqfd *irqfd = container_of(kvm_irqfd, struct gunyah_irqfd, irqfd);
+
+	kvm_irqfd->set_irq = gunyah_set_irq;
+
+	irqfd->ghvm = ghvm;
+
+	irqfd->ticket.resource_type = GUNYAH_RESOURCE_TYPE_BELL_TX;
+	irqfd->ticket.label = kvm_irqfd->gsi;
+	irqfd->ticket.populate = gunyah_irqfd_populate;
+	irqfd->ticket.unpopulate = gunyah_irqfd_unpopulate;
+
+	return gunyah_vm_add_resource_ticket(ghvm, &irqfd->ticket);
+}
+
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 {
 	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-- 
2.39.5


