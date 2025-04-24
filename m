Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E16FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3i+gLyWtr6XPiioNUTryX7U5TAHJs0bj5+QGltLz/R0=; b=E995lRdKbK0jlUb30g7mbmNPA5
	aYJ5meeTzXuDUwSXV1AgFJEjvipvoL3bxDIRHhK1WSTvVA6mQm8qvn10GIVt426Pp47BeUr7z0O2Y
	7cGR5NP2j60omKBbJDfG4NY38iOXKFgl+lHcexc8A4IbXgeJmOPAhPY0COOknWKRKIxZORdzngIZ2
	TBb9ubWj1uzo5Ujh2vwCKI7pSIgBtzVOJIFti1FKcpuEg1cFcYqo2IlaGKjUOr/rxemvgWwlqtvyu
	nyhPF/fb9/ECueIpUA8njuLHcduwOv649vq9KQP78X2899UK1ji7TSmNjjlzKzicY2BDBxn4qo6UL
	OD+qAGlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6C-0000000EeXD-0AUP;
	Thu, 24 Apr 2025 16:06:52 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xLT-0000000EKtQ-2irs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:32 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso841012f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504070; x=1746108870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3i+gLyWtr6XPiioNUTryX7U5TAHJs0bj5+QGltLz/R0=;
        b=g+r/Wf66mfKdpDOfgANZcEX1sSMYWhHBCO2OMaLbwXrGZ5Oai263W3487UBSlfDK82
         VpVyvsdVs8ZbKULUZSRsKsH3fLWfC20VVD7lxD5ZXl8fRGmOvmlX8DqWjdzWNTiBtZq9
         28ljmx+GVspYVMPmaWNIDxv+4tM2zkg0i7a3fpGf7KT4671WHLauQKlLECvxZbpJt3wN
         wqop/zzrCwQSyRQHtw7G2JzW6dVQZLUI6G/ZaTe81Kf1rdqZeukrjCUTFFkaJA+eEHwn
         GqL/cOyhfyzLk2bDsN89bFzlt6S/GsM+ZTNTPHcvFVXyBw7wzgjhRO4RLYLqO1DKOJYh
         xF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504070; x=1746108870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3i+gLyWtr6XPiioNUTryX7U5TAHJs0bj5+QGltLz/R0=;
        b=nX5DUXUelFnPCEoXThryHdxTMU5oy29DV771B+Kz/m22cuuPJyddMfNVLPtjZyzjJ1
         SPVGvTvK1AzwZ+5svXa7ihnH5ebFj5sKneyKJl4IoPM+Ns4yp8OjP8Y7bR7sauUsoGtI
         23JncI6CQjOr9IefsU1RQfieng6asvK3cDfCQUnWTfVQZZcwOGkisD/YEEsTuLt1GWmW
         hQZSu5lStHPe6Ay4hIa5VL4gbmqFod88wwq0x0gkTSfa51gu17Wp9tDH1C2+JcWHWOTx
         ic4W2FydaajskfWme0ZzviWvIJPkLw26m4Eil7fvWnaAqTFNkKz43Rn8rhrbQEH5mTBz
         SeWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8oIW57pfu3a9qVbT4jwSiMvIWdJeojfiVHtHHPtd/HyHWCfcSEXl0gUjEF7WtLI0nCVqnPI4cGmQZAhZCSTD1@lists.infradead.org
X-Gm-Message-State: AOJu0YxAqOMzxixBbhmw/21k4Gco2SNJdtuJd93k0prdoTDEbbkly6os
	/EcLDuXsiYigPQrAeaYhYquXb6b90BZxN27i7aMEvR08IzycI8RfPGbs2YRE4qk=
X-Gm-Gg: ASbGnctBnmKzb6B+IGEgAc6HVG7SMJJbAam3MDuxWKdWIF8jI0+XZXE1yq40mZcWhTh
	0aOBfZlEsukM29fS0QvJcczIxnULsuVQiakau/HPzuHxXmlVEaiHj1K05KGb2POl1CS+xMUe1e9
	RF/vEvxneYfHP/E26IyAJ3Y+PC1wn92gkx/MF8/Tw4Eq2W8fZfUfGy3qYv35eVA0yfraCnBqDdh
	ymltfvtUmhQty3Y6O+sJT+mY2JjYaw2+3GLg6kQcXMFh8KccOsQfQ2obWg7SeEX171lF2OTF9gE
	iTaW4JAC8iKOulaS1viJKsHCLZZHOX0roNejSJG2VrD8NUlstEvf5J7U3KBxBwUXy0DY3Z6ZTmd
	OXsg1Te8gAXrTVCKW
X-Google-Smtp-Source: AGHT+IFOk65S5hPF/j31g7Of/aiN0lBptA3ImD/zObUzEDJUJE+zLunCG1fROxNheO7aYYEMJ9HW0A==
X-Received: by 2002:a5d:5f87:0:b0:38d:b325:471f with SMTP id ffacd0b85a97d-3a06cf5ac50mr2557177f8f.15.1745504070317;
        Thu, 24 Apr 2025 07:14:30 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:29 -0700 (PDT)
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
Subject: [RFC PATCH 34/34] KVM: gunyah: enable KVM for Gunyah
Date: Thu, 24 Apr 2025 15:13:41 +0100
Message-Id: <20250424141341.841734-35-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071431_690311_14239B78 
X-CRM114-Status: GOOD (  12.43  )
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

Enable KVM to act as the interface to create and manage Qualcomm's
Gunyah-based virtual machines [1].

[1] https://www.qualcomm.com/developer/blog/2024/08/learn-about-gunyah--qualcomm-s-open-source--lightweight-hypervis

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/kvm/gunyah.c      | 12 ++++++++++++
 drivers/virt/gunyah/gunyah.c |  3 +++
 include/linux/gunyah.h       |  1 +
 3 files changed, 16 insertions(+)

diff --git a/arch/arm64/kvm/gunyah.c b/arch/arm64/kvm/gunyah.c
index 23b9128bf5b1..91f0260ef3f5 100644
--- a/arch/arm64/kvm/gunyah.c
+++ b/arch/arm64/kvm/gunyah.c
@@ -2071,3 +2071,15 @@ void kvm_arch_free_vm(struct kvm *kvm)
 
 	kfree(ghvm);
 }
+
+int kvm_gunyah_init(void)
+{
+	int err;
+
+	err = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	if (err)
+		return err;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvm_gunyah_init);
diff --git a/drivers/virt/gunyah/gunyah.c b/drivers/virt/gunyah/gunyah.c
index 3e795e3ba881..629c812fbac0 100644
--- a/drivers/virt/gunyah/gunyah.c
+++ b/drivers/virt/gunyah/gunyah.c
@@ -28,6 +28,9 @@ static int gunyah_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (!kvm_gunyah_init())
+		pr_info("KVM for Gunyah is available!\n");
+
 	return devm_of_platform_populate(&pdev->dev);
 }
 
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 26fdfa3174da..7d43449c4547 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -421,4 +421,5 @@ enum gunyah_error
 gunyah_hypercall_vcpu_run(u64 capid, unsigned long *resume_data,
 			  struct gunyah_hypercall_vcpu_run_resp *resp);
 
+int kvm_gunyah_init(void);
 #endif
-- 
2.39.5


