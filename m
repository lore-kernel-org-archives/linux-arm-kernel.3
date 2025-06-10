Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75099C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 00:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7hVPdAAjB/xqyWhZ1EbQv9ByTMZgaoTVHsW9l2uYC0=; b=i7X/1sCdpI2hWM9KoGZBROXO6f
	vZYrqyaSnH1otQ7WowTjumyvGlNyB/8RQPaI/vUMYDnIvrE0zhbmlJn2pYN0rH11syhtHjuboVO7c
	8RQD2UjAvkyD+IajlcisPJRXzJZOC0RDzffB77nX22FFXBBbx7d7GL+QhmAy5cRIfBZnBQnnt57Zl
	Ln80Tz47slSKbJyjABj0BqHYQwRHDXMdIMhGp3oxBjtJhBW+1EENymd1NJalxXLDdpz7y/nwwMClX
	SJ60aQRb51fn8l6Imdf+yMOHbsPwnszrkR9TvDWrn7JgVHGbw7qXFYQ4bR1K+b3dqXU3t0U/Qw3pP
	nQoME5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8w7-00000008RIH-3hGl;
	Wed, 11 Jun 2025 00:03:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8lM-00000008QGA-2LoI
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 23:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=N7hVPdAAjB/xqyWhZ1EbQv9ByTMZgaoTVHsW9l2uYC0=; b=TKkWiwdB0GdLyju/BsCHqyiRmX
	l2r5nH/Mfu17DYaACfpe5rJkn2DOjw909W9Qj4iOMr4PjfJPKEBxZtfh6ZrMcCv3ETi0NuebF1C0j
	Ywf9mhc6SgdbKpVuDJ2GlMscasxeVUZ5w63EFb8R60Tdpe6OR2fLTlICLCs7rANZHoxNpaThcY7At
	HSWVdyU/WLato26J7yL+SymL/Ia314famzMyrbxg1J/f8pK6RL5R47FTsi98X0FW2BpqSf3tzRxe5
	azAqEsP7ZMWpKTcyUfKa/g1vY5OX0pXy+MQAgWW7Szk/vtShDgQ7ofa1D5sL5ikOYJiBxg8jJpN2n
	DuzsaZkg==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8lK-0000000227E-1uKt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 23:52:16 +0000
Received: by linux.microsoft.com (Postfix, from userid 1032)
	id 61C5A2115180; Tue, 10 Jun 2025 16:52:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 61C5A2115180
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1749599529;
	bh=N7hVPdAAjB/xqyWhZ1EbQv9ByTMZgaoTVHsW9l2uYC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=auAOTSOHG4T6VJOzF8nplNmsgLj+MnowWVh2+4m2n6/JHzQRe8VeIHSDhFgcbXzVn
	 n0m7GouL959m0GQ+FEhQ4NwcR5Rr8MPu3x6UalBb3+BujZ/b/fIs6t+HX0MH1QXHeB
	 0TpdWOu6HjQqjutygkhILaQ0asqVqixQz5M3V8rQ=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	bhelgaas@google.com,
	jinankjain@linux.microsoft.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	x86@kernel.org,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>
Subject: [PATCH 2/4] Drivers: hv: Use nested hypercall for post message and signal event
Date: Tue, 10 Jun 2025 16:52:04 -0700
Message-Id: <1749599526-19963-3-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1749599526-19963-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1749599526-19963-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_005214_769045_B6F226F7 
X-CRM114-Status: GOOD (  11.17  )
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

When running nested, these hypercalls must be sent to the L0 hypervisor
or vmbus will fail.

Add ARM64 stubs for the nested hypercall helpers to not break
compilation (nested is still only supported in x86).

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
---
 arch/arm64/include/asm/mshyperv.h | 10 ++++++++++
 drivers/hv/connection.c           |  3 +++
 drivers/hv/hv.c                   |  3 +++
 3 files changed, 16 insertions(+)

diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
index b721d3134ab6..893d6a2e8dab 100644
--- a/arch/arm64/include/asm/mshyperv.h
+++ b/arch/arm64/include/asm/mshyperv.h
@@ -53,6 +53,16 @@ static inline u64 hv_get_non_nested_msr(unsigned int reg)
 	return hv_get_msr(reg);
 }
 
+static inline u64 hv_do_nested_hypercall(u64 control, void *input, void *output)
+{
+	return U64_MAX;
+}
+
+static inline u64 hv_do_fast_nested_hypercall8(u64 control, u64 input1)
+{
+	return U64_MAX;
+}
+
 /* SMCCC hypercall parameters */
 #define HV_SMCCC_FUNC_NUMBER	1
 #define HV_FUNC_ID	ARM_SMCCC_CALL_VAL(			\
diff --git a/drivers/hv/connection.c b/drivers/hv/connection.c
index be490c598785..992022bc770c 100644
--- a/drivers/hv/connection.c
+++ b/drivers/hv/connection.c
@@ -518,6 +518,9 @@ void vmbus_set_event(struct vmbus_channel *channel)
 					 channel->sig_event, 0);
 		else
 			WARN_ON_ONCE(1);
+	} else if (hv_nested) {
+		hv_do_fast_nested_hypercall8(HVCALL_SIGNAL_EVENT,
+					     channel->sig_event);
 	} else {
 		hv_do_fast_hypercall8(HVCALL_SIGNAL_EVENT, channel->sig_event);
 	}
diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
index 308c8f279df8..99b73e779bf0 100644
--- a/drivers/hv/hv.c
+++ b/drivers/hv/hv.c
@@ -84,6 +84,9 @@ int hv_post_message(union hv_connection_id connection_id,
 						   sizeof(*aligned_msg));
 		else
 			status = HV_STATUS_INVALID_PARAMETER;
+	} else if (hv_nested) {
+		status = hv_do_nested_hypercall(HVCALL_POST_MESSAGE,
+						aligned_msg, NULL);
 	} else {
 		status = hv_do_hypercall(HVCALL_POST_MESSAGE,
 					 aligned_msg, NULL);
-- 
2.34.1


