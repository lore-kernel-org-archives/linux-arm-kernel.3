Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F70C5ACD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEop5HcfowkDeNq3FT2Q1c6RiGCFxpFvlXH/k0dA9E8=; b=0cAqcpm7ZQAJDVdaHWRgoAHMT4
	4jWq0trOFd75aFKcLqloLX6uV1ts8KngrfIXyka/mLbcgOGDvCjPh9ITqDNlIQGSl3mneV0GBc/b9
	vCf4iTzSmTRWpVdgfUiJgCkSRmJ69b41cM94WsJZGOtyatDdoS8701jhKChO/toKe9OLB00fim0ws
	vQAjetRyHCo7BVjUmK7W3dtsbbLn2i1P7zPapPfXvIUTHifkiYB2zgHXlCbHQrVFZa4XpPc9J0srN
	skAZuvW4NPda45rxncjAeHnprHmevIPPS5PfO0+k567GcvgIh3pSG1uoNxtKlLTQcn1+F0Zuk1O2n
	UVQ4LxVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfq-00000008SDs-00Zd;
	Fri, 07 Aug 2026 16:43:58 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfn-00000008S91-2egO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:43:56 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4994aebe932so35530535e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786121033; x=1786725833; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEop5HcfowkDeNq3FT2Q1c6RiGCFxpFvlXH/k0dA9E8=;
        b=cK64ex5SwFsNEXnJm9NSoZOGeLPwHBg7mCRZiUPx54tA5Nr3cpfIy6953Yt0GO/KyS
         YUsT/JZ2JMUYKDlkfjHh6a5/BPPwZLWm4LcEnIPlZVha+t2fwXE+t97Zy33NGHRaYf+e
         D2SVLjQDRBiI7si3SIAWvva0OjBaQOJuS4dcnms6KMtHIvjAGcoYxSdVlicU7XHzNgZk
         jxxEwVDaa373sTHLyeg2uFi6fN4MuL22Q91EA47fJhbl7GS3fDyoBel+k/tC34lolFeT
         jJprz0VcnMmo6e0sMFAoGlGjGvpuTyimRcft19wrBuL6KH2/i5xe1yRM3o2SFptVqxw1
         gGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121033; x=1786725833;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEop5HcfowkDeNq3FT2Q1c6RiGCFxpFvlXH/k0dA9E8=;
        b=A35Qk6RtJWUuDX4PZEUIJgy12cXqafOu88cuHolC2bAWBIVPHjuqyRYHfqoaupLUzi
         IFoj1jZyYh7vmV+m8tmX0EC7mfRInjV7Ay12//PL6lgfmpJvDZij7f7U2tPNiGVj+0eT
         2hwi2LkvMiVDS7vZRgI3KLY50iIREIJ/klbzPXdtPBiCpTfGXqj+wD4Qc5vstOZVgyha
         aDel2i4pZwNfFqP9TjITO1NFP3ctYDPfZU+GI2IUkS0zeI80D8w/Cyln4UKeGBVPC0iM
         /p+0FM5qGcPi57pbfhSv4CxV337U9pOstVqQ/lPpNhV7vsbdfP0CtA0aXPXZbeS8GmtK
         OwNA==
X-Forwarded-Encrypted: i=1; AHgh+RpXSt97gKcBlfxRy+eMAa86F5lMKWWAefJwwwoFk5ZmlbHyloP1IvcHZgbnHwU5NAskuA86I2WzJvqAYsoBI+bN@lists.infradead.org
X-Gm-Message-State: AOJu0YzkMoUTJPTPgaHbu66X0fnSN7bmJ0EmdOMeTaJouo5F2JUn/Hgn
	0pSa+9h6ipxGeznxJjhfZisg0WlHefNaqy6bE7rPjrouk8U3pBFTh+45cTUKNFLRQUvTOxyisNK
	QvloTidGSCIw/6BI+qtzinzeFJ4QmqA==
X-Received: from wmbhi12.prod.google.com ([2002:a05:600c:534c:b0:498:124b:1aa0])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:2e54:b0:495:4e1d:82df with SMTP id 5b1f17b1804b1-4994e7c1445mr233498895e9.10.1786121033123;
 Fri, 07 Aug 2026 09:43:53 -0700 (PDT)
Date: Fri,  7 Aug 2026 16:43:20 +0000
In-Reply-To: <20260807164322.2970811-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260807164322.2970811-12-sebastianene@google.com>
Subject: [PATCH v2 10/13] KVM: arm64: Restrict host updates to GITS_CTLR
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, fuad.tabba@linux.dev, joey.gouly@arm.com, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org
Cc: kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, sebastianene@google.com, 
	seiden@linux.ibm.com, smostafa@google.com, tglx@kernel.org, 
	vdonnefort@google.com, vladimir.murzin@arm.com, yuzenghui@huawei.com, 
	zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094355_690813_0F0366ED 
X-CRM114-Status: GOOD (  12.23  )
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

Prevent unpredictable hardware behavior when the host tries to enable
the ITS while it is not in quiescent state.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index 5629e2a070df..b9b71aa18d48 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -403,8 +403,35 @@ static void cwriter_read(struct pkvm_protected_reg *region, u64 offset, u64 *rea
 	*read = readq_relaxed(its->base + GITS_CWRITER);
 }
 
+static void ctlr_read(struct pkvm_protected_reg *region, u64 offset, u64 *read)
+{
+	struct its_priv_state *its = region->priv;
+	*read = readl_relaxed(its->base + GITS_CTLR);
+}
+
+static void ctlr_write(struct pkvm_protected_reg *region, u64 offset, u64 value)
+{
+	struct its_priv_state *its = region->priv;
+	bool is_quiescent, is_enabled;
+	u32 ctlr;
+
+	ctlr = readl_relaxed(its->base + GITS_CTLR);
+	is_quiescent = !!(ctlr & GITS_CTLR_QUIESCENT);
+	is_enabled = !!(ctlr & GITS_CTLR_ENABLE);
+
+	/*
+	 * If it's disabled and not in quiescent state and it tries to enable
+	 * it, bail out.
+	 */
+	if (!is_enabled && (value & GITS_CTLR_ENABLE) && !is_quiescent)
+		return;
+
+	writel_relaxed(value, its->base + GITS_CTLR);
+}
+
 static struct its_handler its_handlers[] = {
 	ITS_HANDLER(GITS_CWRITER, sizeof(u64), cwriter_write, cwriter_read),
+	ITS_HANDLER(GITS_CTLR, sizeof(u32), ctlr_write, ctlr_read),
 	{},
 };
 
-- 
2.55.0.654.g21b8a5bc05-goog


