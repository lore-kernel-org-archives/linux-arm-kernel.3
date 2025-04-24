Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ABBC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Hk5UBQTvuxPsQW0619Tu3I4qsqkftwTtmBE5Ybb85g=; b=uA4KLCzUqXvH2SrqJRTWNSDJjz
	xg9WqTll5SgLyH75uLxB4K4ZlOXmbdvwqElOfEqwNrurrAe08Osy0mnMKsscqwhe5tXv5pyrqslcl
	9eJw3or6SxH7NyQ4t9tMy3cdWQnx2fcHRIX0T2L3q1PJXOY5zHrVYMUSpx8keFW0zMyK0Gn31QuLj
	LhJjw4DIkeQZtwACITeiQUSFct+8qNn3J1SWpxJW9rERg6jelv/Kfl+hdc4KgxAb/lHfukXkawzad
	eyOwiw7iPcRlRFE8dnviglBowGPkN0wBDFBwjalrHc2xqV1VBqmpodtVLax7YIrNsAbcAX/v/rmzh
	ToswZT9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z4x-0000000Eclu-1VMD;
	Thu, 24 Apr 2025 16:05:35 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xKo-0000000EKcV-206K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:13:51 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-39ee651e419so653746f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504029; x=1746108829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Hk5UBQTvuxPsQW0619Tu3I4qsqkftwTtmBE5Ybb85g=;
        b=maJtcSq/huOrCpOD42TMXQRcpqCOuFolmblm8e0EIxdrN9RsEo96Y7NHHkZv7i3Yy5
         A5AndgqVyA/gpr9AFK8h6ibnwTnebYCXP5r0Fpi5bb28Cv8p7a3XNF1Bl/SFQPAsWSPK
         C0z4vByzpBqX/06pcMzCBawBJgsXDfSM6f+Jcsfb0FdMvKZobbcrNZ6qlOE5TPN1h5zm
         6FtTmfH/V8IWC6xZaXvVGqi4zxnVoACJe7gZcmtThTcmb+Hqun0FDIHyzE01u8llZEyC
         74vFDgnOcNgsGiob/hNV8T6Mg8UzeJ/8Cfd99HLFuK5KmAOnYfszBOlqXtwO/K4U2O5X
         dwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504029; x=1746108829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Hk5UBQTvuxPsQW0619Tu3I4qsqkftwTtmBE5Ybb85g=;
        b=MGag2oYO6V5EWKWuFV5ocnje+/eZR9x+kRmOMRMWSZPOes1qRm+9H0B39gMjxrqwbr
         Yj4IK9MxJ8RPgLNsVUygxjjFhE6EdfI/56cqnx6FROcyCO8GHwPol6pOx2vLSzaWqIyT
         +TWCxr3jeLqYz+eX5AcxnH7hKhoZKEtTk7AbYNCtTezv+LzRGtHgnqd+XC6L3mdnFArn
         1TYG2F2bgFkXHz3kEm5qOyufZZBKqpleu01pZzCgrHhBiM/nRw9eHgHWSCLUUCxtn5Om
         uiXncJ0BBPNrqtK6+rC41e41tFJ7cSY0MclVz76Ky5vxmULehiAk9YhM9YHZSRjFXkID
         cTPg==
X-Forwarded-Encrypted: i=1; AJvYcCWnRIUA63Eq5setufYTfuLQbYF///AnXyvcxfX0s33tMZKIFZlOkdcNr801sg5a7T2E9YYk/gWLLs/+7pLT+lRK@lists.infradead.org
X-Gm-Message-State: AOJu0YytkjikD0O12xyFKkw36J8pUp7QwiuO0TSmU9Gzi1nF5TB07yjN
	5jWOzz9TIGI/1aC8gn/+ZDaUxhCnYG7UTShFMjTlCoNEhRYAHKd76hI4KraikMY=
X-Gm-Gg: ASbGnctWItVNklSkHxwnaPEFWULfKi6GYIhojQKePlSgepMT8PQWJl4gitt6vF+KdZE
	yKUgwBucKe2j7OIUznWl3ci5ckmO0a5HYw3J3mv1QBnkCfUr6bOD0kaf6q6j0Dyc0bVSxP2xvF/
	V2NSSDRk2uSBHpmF2uVnYjqTS0JTGPm1VuR3SmL5vbiBIELTG1QXjhH94gD0oT9dMCyskj9Hgk5
	eFBXtDO/bzx7X/jKPT5cmdvcg8xzyYBcO8pqH22I6zz5ebX3vQHMG7yO2PD0DdbzFfHv9gVo1l/
	aQ8ZRZTnEAdKFSd3C9n9Tphv6ThZEO060ozxw8Ij1GWwShszQMpuKaCUD51CtuCciUme0ItMju2
	DG3G2I4VvdHGQNYHHV/GxhqbqDb8=
X-Google-Smtp-Source: AGHT+IEX65fw+AuwIbm8DfCqVPIwMLBPu7X4mEmOAObvmlxgMqJT5rSe8ZZGCXBt4CgJFkEQIJbeNw==
X-Received: by 2002:a05:6000:1a85:b0:391:39fb:59c8 with SMTP id ffacd0b85a97d-3a06cf61418mr2487543f8f.25.1745504029007;
        Thu, 24 Apr 2025 07:13:49 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:48 -0700 (PDT)
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
Subject: [RFC PATCH 03/34] KVM: irqfd: Allow KVM backends to override IRQ injection via set_irq callback
Date: Thu, 24 Apr 2025 15:13:10 +0100
Message-Id: <20250424141341.841734-4-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071350_517237_44D3F3CA 
X-CRM114-Status: GOOD (  15.00  )
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

Some KVM backends, such as Gunyah, require custom mechanisms to inject
interrupts into the guest. For example, Gunyah performs IRQ injection
through a hypercall to the underlying hypervisor.

To support such use case, this patch introduces a new optional callback
field `set_irq` in `struct kvm_kernel_irqfd`. If this callback is set,
irqfd injection will use the provided function instead of calling
kvm_set_irq() directly.

The default behavior is unchanged for existing users that do not override
the `set_irq` field.

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 include/linux/kvm_irqfd.h | 1 +
 virt/kvm/eventfd.c        | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/linux/kvm_irqfd.h b/include/linux/kvm_irqfd.h
index e8d21d443c58..7d54bc12c4bf 100644
--- a/include/linux/kvm_irqfd.h
+++ b/include/linux/kvm_irqfd.h
@@ -46,6 +46,7 @@ struct kvm_kernel_irqfd {
 	/* Used for level IRQ fast-path */
 	int gsi;
 	struct work_struct inject;
+	int (*set_irq)(struct kvm_kernel_irqfd *);
 	/* The resampler used by this irqfd (resampler-only) */
 	struct kvm_kernel_irqfd_resampler *resampler;
 	/* Eventfd notified on resample (resampler-only) */
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 5f3776a1b960..d6702225e7f2 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -63,6 +63,11 @@ irqfd_inject(struct work_struct *work)
 		container_of(work, struct kvm_kernel_irqfd, inject);
 	struct kvm *kvm = irqfd->kvm;
 
+	if (irqfd->set_irq) {
+		irqfd->set_irq(irqfd);
+		return;
+	}
+
 	if (!irqfd->resampler) {
 		kvm_set_irq(kvm, KVM_USERSPACE_IRQ_SOURCE_ID, irqfd->gsi, 1,
 				false);
-- 
2.39.5


