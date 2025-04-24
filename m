Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EBEC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iugp3VZMso7R61paVQ20sor9LWthQ+vE2iyUDGP7wsk=; b=3sYmTx/T/jX0gVkcKcqON3Sjd4
	H1L5vD1Xtm5Okc3EKktdFCTekGhkM4B3X90dcsf/ZJQEATwt95kIQn+bv5zRj159ehA78szcgnYr4
	PgpSmM0PKp6x6KSS+KxD85DIGqjYBXBa7yipNF0SxqS+dlyA/pm/Jig2D87X+7slRnQbjcUULfyE5
	5wUMn2+CsR95SNRnvyUSufBROqY9MuTOc+vom21zT+sMN5oFj3sdJX6ZqMzowZLJvZ22KgquWKVwo
	eKusNnMXpdKcvV32ExP9MO6v8RG9UbSWM90HpYDcQJr0fDItHx20NWg9wOHkonkESXj64MbCr+OZH
	EJeHW1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z5M-0000000EdKq-2941;
	Thu, 24 Apr 2025 16:06:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xL1-0000000EKiZ-3YqT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso6357435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504042; x=1746108842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iugp3VZMso7R61paVQ20sor9LWthQ+vE2iyUDGP7wsk=;
        b=HT6b6lwIe4y1XmkCGSX5AI/ixHWHchIIjpC7HVjji6tZmGPN8ElInEZ7/0mvSOsPNy
         +z5hSHpAOdwgsX3qxpoLWIfWLTjqDo0v395QfcwAFBRozCXB4yFP/nhTKZHbzT/6F/Wh
         HZUCf2PA8WQWKlFx8siv99b/0r4OKgUyi8mkOas//veuB+FFf4ucaNaDfeYSai7IPuAO
         KGfHwlFMi3q0c0MLGnDSRII08PtM0H9NOWozTA0C/pvHdC529BPihJ0oWzYOQtzGo+hq
         2txj8H3DUAYb5qtccXxctWGYDMQBJwd1g7XNfh1smQD5RoGP+KPvbZHxH/gg2IoC7q3B
         s9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504042; x=1746108842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iugp3VZMso7R61paVQ20sor9LWthQ+vE2iyUDGP7wsk=;
        b=aZ+2Bw7a3qPVY6zbcynJc2Xw2+6vtWCvT/rX8uNR3yvc/CmGeXvr2/tKjwhJRYdGlY
         npKRQILEhTekIp2cQtP9n8slls/++LNFdwBgc87I6s6X/PyIS36s4z7G0/usmas10rTp
         1aPrOXcG6dPyDroktboyuebKuCgIBn6Qb/AKjAUKh6gzJOPvnHiqG0L44l7J5OAvhSmi
         3yCuI7XO15kJZxcqYXyCUli2stBg/kFsESmHMDmwnuTI7NtubhC7DuWDgiAVIK8RpELX
         NKHZFtOqbDd3DqZH91UDX216hPsNxseTwaX631P09q/CSVJK8zlveOp4CgmUqXh1L/wB
         vHrw==
X-Forwarded-Encrypted: i=1; AJvYcCUy+AAjheYL/KWpqXmfZxsKolb9xT1mWNtFAiV7Ze3VtmFjuTYspeeyLi48VXlJomwuGqumhJviZXyx+VWEioya@lists.infradead.org
X-Gm-Message-State: AOJu0YyanFrrBT4Gr7xwDonKTdfBSdzqCwU5Y/o58MJveJVH/UW54VZs
	2WZ9+pG3hlEHCPxo8CLqmIjP2tIt6ai5CbI53vSugDEIHNr1+YQu8UqfRuPT6tU=
X-Gm-Gg: ASbGncsOgQ0BPuuvuyoifIRqadhsgjdMrUyYlcA0wvQyCYdDdb3mLdQD9OhSXHt1jBn
	vmmamt/lrC8kq8ac5GlhqyTpHHHSPgtpn3sME5eIyZKY/0k7PZKXuXSilUdVGzfV4EmbMfSuz7e
	b+s9RKAuIoxWo7sl13hSPAx9nrW1niFefmEti+QSw+vvXELot2zoWHpAUgmOQzkbJ0wQV4bgmL0
	omLhEc2+I2/EExwjBq4zugCehuK2Eg3MmaFFiWHUwdDP7yRLyKSHvXFgClIAwsZRmi8vJ72ZMi/
	n3rDh6ZhH1s3FVQub7KaTfr5Ab4h52SdwB1hvt20Y+YnrbrY0rXJX+OTj2PzBBaEVo7TyVF0tGf
	RvwTE/+b82FTvL2l6
X-Google-Smtp-Source: AGHT+IFb5JrKaNG2KfYhmzfwfaDb/IjykBP33KVSW9og9BEhgmgsW+e69hlvAOQj6I5jNodxA+AwfQ==
X-Received: by 2002:a05:600c:c092:b0:43c:e2dd:98ea with SMTP id 5b1f17b1804b1-4409c3b1e1amr23970305e9.22.1745504042259;
        Thu, 24 Apr 2025 07:14:02 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:01 -0700 (PDT)
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
	Elliot Berman <quic_eberman@quicinc.com>,
	Alex Elder <elder@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RFC PATCH 13/34] gunyah: Add hypercalls to send and receive messages
Date: Thu, 24 Apr 2025 15:13:20 +0100
Message-Id: <20250424141341.841734-14-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071403_887556_07DFA941 
X-CRM114-Status: GOOD (  14.61  )
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

Add hypercalls to send and receive messages on a Gunyah message queue.

Reviewed-by: Alex Elder <elder@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/gunyah/gunyah_hypercall.c | 55 ++++++++++++++++++++++++++++
 include/linux/gunyah.h               |  8 ++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm64/gunyah/gunyah_hypercall.c b/arch/arm64/gunyah/gunyah_hypercall.c
index d44663334f38..1302e128be6e 100644
--- a/arch/arm64/gunyah/gunyah_hypercall.c
+++ b/arch/arm64/gunyah/gunyah_hypercall.c
@@ -37,6 +37,8 @@ EXPORT_SYMBOL_GPL(arch_is_gunyah_guest);
 
 /* clang-format off */
 #define GUNYAH_HYPERCALL_HYP_IDENTIFY		GUNYAH_HYPERCALL(0x8000)
+#define GUNYAH_HYPERCALL_MSGQ_SEND		GUNYAH_HYPERCALL(0x801B)
+#define GUNYAH_HYPERCALL_MSGQ_RECV		GUNYAH_HYPERCALL(0x801C)
 /* clang-format on */
 
 /**
@@ -58,5 +60,58 @@ void gunyah_hypercall_hyp_identify(
 }
 EXPORT_SYMBOL_GPL(gunyah_hypercall_hyp_identify);
 
+/**
+ * gunyah_hypercall_msgq_send() - Send a buffer on a message queue
+ * @capid: capability ID of the message queue to add message
+ * @size: Size of @buff
+ * @buff: Address of buffer to send
+ * @tx_flags: See GUNYAH_HYPERCALL_MSGQ_TX_FLAGS_*
+ * @ready: If the send was successful, ready is filled with true if more
+ *         messages can be sent on the queue. If false, then the tx IRQ will
+ *         be raised in future when send can succeed.
+ */
+enum gunyah_error gunyah_hypercall_msgq_send(u64 capid, size_t size, void *buff,
+					     u64 tx_flags, bool *ready)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GUNYAH_HYPERCALL_MSGQ_SEND, capid, size,
+			  (uintptr_t)buff, tx_flags, 0, &res);
+
+	if (res.a0 == GUNYAH_ERROR_OK)
+		*ready = !!res.a1;
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_msgq_send);
+
+/**
+ * gunyah_hypercall_msgq_recv() - Send a buffer on a message queue
+ * @capid: capability ID of the message queue to add message
+ * @buff: Address of buffer to copy received data into
+ * @size: Size of @buff
+ * @recv_size: If the receive was successful, recv_size is filled with the
+ *             size of data received. Will be <= size.
+ * @ready: If the receive was successful, ready is filled with true if more
+ *         messages are ready to be received on the queue. If false, then the
+ *         rx IRQ will be raised in future when recv can succeed.
+ */
+enum gunyah_error gunyah_hypercall_msgq_recv(u64 capid, void *buff, size_t size,
+					     size_t *recv_size, bool *ready)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GUNYAH_HYPERCALL_MSGQ_RECV, capid, (uintptr_t)buff,
+			  size, 0, &res);
+
+	if (res.a0 == GUNYAH_ERROR_OK) {
+		*recv_size = res.a1;
+		*ready = !!res.a2;
+	}
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_msgq_recv);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Gunyah Hypervisor Hypercalls");
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 33bcbd22d39f..acd70f982425 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -141,4 +141,12 @@ gunyah_api_version(const struct gunyah_hypercall_hyp_identify_resp *gunyah_api)
 void gunyah_hypercall_hyp_identify(
 	struct gunyah_hypercall_hyp_identify_resp *hyp_identity);
 
+/* Immediately raise RX vIRQ on receiver VM */
+#define GUNYAH_HYPERCALL_MSGQ_TX_FLAGS_PUSH BIT(0)
+
+enum gunyah_error gunyah_hypercall_msgq_send(u64 capid, size_t size, void *buff,
+					     u64 tx_flags, bool *ready);
+enum gunyah_error gunyah_hypercall_msgq_recv(u64 capid, void *buff, size_t size,
+					     size_t *recv_size, bool *ready);
+
 #endif
-- 
2.39.5


