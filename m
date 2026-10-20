Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34892606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 22:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j2xhE0lG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FZniHScE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hhU02INeiLDlugLYSQ1HT9ECkkZkvz9I+ml1ZnNGcc=; b=j2xhE0lGvrJl6GEAUnrxtPMv9R
	K/29tBrbWjaqvIQwDvIrGAyc4r7ilvyNPboaIgArZwU3SiGykaQ8oWL01WLtg+w7VT4+bU/gUqVY9
	FWQGyj3LXjtz3sXECADugtC8YzOQpGIQ2/huXhHmArj954uMAnUhgZmMu5BeEQu9OIuraOl9XJKcA
	6wAKES/u4GZQzI7eaZb2LUBlUQM/UCZ0DzAHMo5LjE4y1aaEtS27yhwAS+UHzzyK+SGb9/TZo0u0x
	JULj/cFwAmCpw749Ya92/5aLF2wep+UWru0IYnsWNHwoQ2skRiWpysqx17q7DPrSiZPcMrEBHt0TN
	Yyx6UXDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJIJr-0000000AkTw-2YbE;
	Tue, 20 Oct 2026 22:28:31 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJIJm-0000000AkRY-22rL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 22:28:27 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso45463f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 15:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792535304; x=1793140104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hhU02INeiLDlugLYSQ1HT9ECkkZkvz9I+ml1ZnNGcc=;
        b=FZniHScEBlsMf2X2CsuTHDiUqtlb+R+oYdOPzMsrEN8pTCr9D+RK90EC0VyBubI7ba
         Pb1Jf+kYCrcdx7gK8u5u2OT6NyD+0rtUIVM8g4AxYPFXpuNtGyXhT/RibrQvmB10H3gt
         yxYiUWWh+BopKckRurZ/2mhMb2QLGfBtfo/mvY4SS3t7MNlxYTeYv0aeasOBJamUnvrz
         LAKZvT339MzrVxsRxe3woGI+ezRJruFbdvMN9GTomOezN2oH+MYdZLd3p1EfeRfxte4z
         1whRdAnQUy14duEwZ07215kp8kg4r5AL5HaB/W0dJWq9NVj677lUogirgiQpu/M1N1Xz
         sQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792535304; x=1793140104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2hhU02INeiLDlugLYSQ1HT9ECkkZkvz9I+ml1ZnNGcc=;
        b=fQ7WsJuqRfj9PqhXQhu/mbCJ3+8ecdCI+ZFlAidbT3WCH1knzl+eKS8svE+kh3OVGG
         7NZGCcrZoHstQS8SnHRJWCLjUnVtIThsREbK1D/BngQdlNQjzWLm7DId4YqnWRiqjJ3i
         NdujjjAli+ecneqcoQKUfbr7RJ0m9PjsltJgNZsVJsWx75aPaIOwgi/IC1wPhKvCD+hC
         ZxOH5mI52ykcHsGWerVPArLl++v0BKST1Urj+vr7liaX5fN8b1R8FhA8/Q16rXVDz5KO
         oh3neYtYhnS34aQm3X4nEn3PSsl528yXPlHUU7LZlLEWjHh7QiGNt2CAsh+swnRf4+OS
         JKuQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2/Alsbb5AfktUat6rfGxtOCpzPifEczz+A/iVhdx9i1h3NukzDcDf4UCnF6Cb/Y/nDMrc4GVN6aBx0rzUtny2@lists.infradead.org
X-Gm-Message-State: AFq9FYJNcqxiFyH2FFeLJZQuIvq7B9eo4B2xihDOlrZZhBkbGZj71zRI
	idKxOrKA8uaz8x8vWRuu6s/hp+9g8gZ4i+KZsyPqWH551TSiQ2peL8oS
X-Gm-Gg: AYBFou0YsBYrx4+rCEobET3gP5HE7/PffUbwdIOg8AwjJlRdXZzOsYMdWhOVzZiVJ3j
	0Rod05OOobTXI7/gk7IJ7yMnfi2jfRF0dm3fIJueejDvZhUOIKTnT66VSuPt2vT1QZo6cpQSKZx
	jrjCA4YBz+J5xsyDWowrNnHWAdSs2isVZWD+9QgKm60G+kIw7AxsoDLSOlzYC8FT7AxP407WZGb
	zMmD+o2EG1KG7JKeYkZapm0l6O8X+d2gwpsydsali4923tJeB3BnmEJ5Eu3GBxhLDPWFhiUJxR2
	OPhPlSg4DzVzKbRdzD2/9DyQR64Is2HbaH9lQVJKa7HyzK4z9ISAKpStGFhOXXqok8fXk4Qmvl2
	xI4dhC5624J/7Zl0n1Ro4t9kAcWjMAb6SabPUo3imXDpYVJoIdhSY/0MqbK73+/Sg0HnVviu9qC
	hH/dsqN55kHZlD6YDkZl/YfrReskBd1TC6WhGdD/w86ghUZdP+h6GEU/ioA67xbCZI7viXLdiwL
	BNhIU2UXnanDPZTdeVINm+PWnmkbRv/Utwo9IwQDNOv1QTjQQT7aAykk5+Z77po1Y2kqtboJA==
X-Received: by 2002:a05:600c:3b24:b0:4a1:f736:79d1 with SMTP id 5b1f17b1804b1-4a1fdb20d04mr1918375e9.16.1792535304480;
        Tue, 20 Oct 2026 15:28:24 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd629bbsm9661935e9.5.2026.10.20.15.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:28:24 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	vsethi@nvidia.com,
	maz@kernel.org,
	sdonthineni@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v4 2/2] irqchip: gic-v3: only select HAVE_ARM_SMCCC_DISCOVERY on arm64
Date: Tue, 20 Oct 2026 23:28:17 +0100
Message-ID: <20261020222817.1231643-3-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020222817.1231643-1-julianbraha@gmail.com>
References: <20261020222817.1231643-1-julianbraha@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_152826_541871_38EB9A5E 
X-CRM114-Status: GOOD (  13.27  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ARM_PSCI_FW is always enabled for arm64, and the GICv3 driver only
uses HAVE_ARM_SMCCC_DISCOVERY to identify the NVIDIA T241, which is
arm64 anyway.

For ARM_GIC_V3, let's only select HAVE_ARM_SMCCC_DISCOVERY on arm64.

Fixes: 35727af2b15d ("irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
---
Changes since v3:
- reorder patches to prevent build failure for 32bit ARM without PSCI

Link to v3:
https://lore.kernel.org/all/20261014123539.2259230-1-julianbraha@gmail.com/

Changes since v2:
- split out changes into two patches

Link to v2:
https://lore.kernel.org/all/20260823180832.1246363-1-julianbraha@gmail.com/

Changes since v1:
- remove select and dependency on ARM_PSCI_FW,
- make the HAVE_ARM_SMCCC_DISCOVERY 'select' conditional on arm64

Link to v1: https://lore.kernel.org/all/20260801212235.2692694-1-julianbraha@gmail.com/
---
 drivers/irqchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 136bab41f801..ca915fca0ef5 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -37,7 +37,7 @@ config ARM_GIC_V3
 	bool
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
-	select HAVE_ARM_SMCCC_DISCOVERY
+	select HAVE_ARM_SMCCC_DISCOVERY if ARM64
 	select IRQ_MSI_IOMMU
 
 config ARM_GIC_ITS_PARENT
-- 
2.55.0


