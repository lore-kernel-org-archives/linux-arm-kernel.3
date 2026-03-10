Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56DCFD2D71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEWbELOsDpdm123yqs/nC4AQmYY2qHXqVI/qysPxPqQ=; b=kSwCXWpMbmxF4OnkVSR62deW0+
	c85sJB0A1IwGrQMWvThtrUfRwaaOy4+TB9XmYR4pzcCUIullICXrQ+0gM8LsiLuOVoj83vgXFBuyQ
	YzqMSeCT6B3yFvmUGToGbfTGIjo9J3Y4kt0C07ilnawKglKjD3DBJhTUIGW1EHL27JuaeO1DeT/o1
	pR92zDbvueuEzZt3zSfSS8rRiB6zZbDUH7U+n1wF0f3yvSVBRLJ4DSE22QMyfV4Z8PM9xyom/iCFa
	pun2z1o2clqUhMhpiWR6Kg7+ZFfRiW9XxOp1B4MtHtgkzHp50VZtSW1OFFNjz+Q7fCPZqtPijeFz0
	Bc52yCvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwXE-00000009WJu-2Nq7;
	Tue, 10 Mar 2026 12:50:04 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwX9-00000009WBe-13Qj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:50:00 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-485375aa56eso19334135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 05:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773146997; x=1773751797; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VEWbELOsDpdm123yqs/nC4AQmYY2qHXqVI/qysPxPqQ=;
        b=IW8OtlBYVjJu5cFJvt2aFfDbDQ3FZBDRBRW9W16OsJuLynNG0UOTFHe7T91RRq9Tdu
         sFKHonqnnJgHMPH+gT2VUTU1+D/WnThBiPwGQqMigDJ4g0bRAg0FfQzpdDvnr/lp+HjD
         RYQI2vsQKzNK3d4N3NcFUbOfklbSeHy156tiZ0y+eJbC2c6q8vb2eBXCTQI+z7EdhYZr
         RHsK0yiGmxyFzhXBy0GQZhojmQAxRC+5J7KcaJZXUW8mqv1e52CcHJPSDdgilwQE3Nwj
         qsdLU+pbe6Tnop5RVBvrhbpuKfSsAJTB+VZmDhWYp7caordf5CFrKKoojyuVHH/8WVgb
         oW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146997; x=1773751797;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VEWbELOsDpdm123yqs/nC4AQmYY2qHXqVI/qysPxPqQ=;
        b=IxLju62pbExOtNw57MYprZ2KrNClgNQp6rnuBTv0jw3eh96H2JrPFDCmCDWqqLuFV4
         vOhlOeI4eYDAJZMTMi2Ht5950wOeMma7aaNNFJ5U6UCx2BmSiCWzyhkpEVfZM2QP5nel
         /ysBTJRQolCn8Xalnj+boej9AS2JbG/G8Gx2Bx86mYtnn1NVZdUOVoctg9+9IZIMKUKW
         ZAL6awRuliUX6OVghyXcRG3jIAaUOwk/AxDfbbYOjmdsDG7ufUdfG3CAk+wrQujFGOv2
         SWnvsvwVZhCM06Dehx9LTCIO5+O4Hxl8qvFmDNkzaP+pqlJW1ZBY1fgiFCGE/GEYMSYg
         24UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX1gVr5A4Xlq2aATEzR+9xqZTZPGVoifQ09m/pv1/YgR2iFyr/l/A7R4k7vmWNnaoNL5sBEmbweuHBcpZg1M4M@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr7FgBNXtcYgag2DwR7LKM92fgTYYoDjYm7KJ0m2Jzlgr2JWHV
	eMTq1SvSbgSDvIfRaIw3tlI0hQYnfMiskcDcXahCa78XQmf0ryAKOSOmDQaxi2AmZFEvbJD4e3V
	RgE3KkhvrKx3L/5ApZI1Lx2BMZxwz+A==
X-Received: from wmpj41.prod.google.com ([2002:a05:600c:48a9:b0:485:3a2f:2f7e])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cb:b0:485:3dfc:57c with SMTP id 5b1f17b1804b1-4853dfc073cmr92510315e9.21.1773146996957;
 Tue, 10 Mar 2026 05:49:56 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:49:31 +0000
In-Reply-To: <20260310124933.830025-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260310124933.830025-13-sebastianene@google.com>
Subject: [PATCH 12/14] KVM: arm64: Restrict host updates to GITS_CBASER
From: Sebastian Ene <sebastianene@google.com>
To: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: catalin.marinas@arm.com, dbrazdil@google.com, joey.gouly@arm.com, 
	kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	perlarsen@google.com, qperret@google.com, rananta@google.com, 
	sebastianene@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_054959_321863_30EF2DFD 
X-CRM114-Status: GOOD (  12.28  )
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

Prevent the host from updating the ITS command queue base address
(GITS_CBASER) while the ITS is enabled or not in a quiescent state.
This enforcement prevents unpredictable hardware behavior and ensures
the host cannot update the hardware with a new queue address behind the
hypervisor's back, which would bypass the command queue shadowing
mechanism.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index 539d2ee3b58e..9715f15cd432 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -291,6 +291,30 @@ static void ctlr_write(struct its_priv_state *its, u64 offset, u64 value)
 	writeq_relaxed(value, its->base + GITS_CTLR);
 }
 
+static void cbaser_write(struct its_priv_state *its, u64 offset, u64 value)
+{
+	u64 ctlr = readq_relaxed(its->base + GITS_CTLR);
+	int num_pages;
+
+	if ((ctlr & GITS_CTLR_ENABLE) ||
+	    !(ctlr & GITS_CTLR_QUIESCENT))
+		return;
+
+	num_pages = its->shadow->cmdq_len / SZ_4K;
+	value &= ~GENMASK(7, 0) | ~GENMASK_ULL(51, 12);
+
+	value |= (num_pages - 1) & GENMASK(7, 0);
+	value |= __hyp_pa(its->cmd_hyp_base) & GENMASK_ULL(51, 12);
+
+	its->cmd_host_cwriter = its->cmd_host_base;
+	writeq_relaxed(value, its->base + GITS_CBASER);
+}
+
+static void cbaser_read(struct its_priv_state *its, u64 offset, u64 *read)
+{
+	*read = readq_relaxed(its->base + GITS_CBASER);
+}
+
 #define ITS_HANDLER(off, sz, write_cb, read_cb)	\
 {							\
 	.offset = (off),				\
@@ -302,6 +326,7 @@ static void ctlr_write(struct its_priv_state *its, u64 offset, u64 value)
 static struct its_handler its_handlers[] = {
 	ITS_HANDLER(GITS_CWRITER, sizeof(u64), cwriter_write, cwriter_read),
 	ITS_HANDLER(GITS_CTLR, sizeof(u64), ctlr_write, ctlr_read),
+	ITS_HANDLER(GITS_CBASER, sizeof(u64), cbaser_write, cbaser_read),
 	{},
 };
 
-- 
2.53.0.473.g4a7958ca14-goog


