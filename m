Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337CEC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 04:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q0RPsG5ANJXum6qiiDCl2HWvCcb2vrljQ6NDoFmQS7k=; b=rkN9NtGxd2qZSWVOE8TWE4f1+H
	Oft7J+GcW4FngG8qHrkTld6iHQS5xR1t5lxB+8og3f5SjcOVVAjjeihCZ4IQd4MNIXkvha4R18usc
	aDa3rmAPStb5GaWopBvni4lfN5O9uMcB81chKLaHHHrX5n6MO/Xidlw6ujfRbWsZxVYRtWeOxwZVi
	aXMcctm4KHBxHf0g2KCk4OSsldPxJEH1CKaPh1gTCUB8re50smHhbNX/2QI043oktMJsdbA3XY13M
	A9RW/PeL5wHU9p86XB+krwJvd6wR8BtZ2LWo6j/Ce7wlWByL7vaOtBUdzEJVleX6ial8kqtcZlXZY
	/ZauR5GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bR7-00000001M5B-40jo;
	Sun, 13 Sep 2026 04:03:25 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bR5-00000001M4p-2zGd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 04:03:24 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-52fb76ef1d0so13285111cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 21:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272202; x=1789877002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q0RPsG5ANJXum6qiiDCl2HWvCcb2vrljQ6NDoFmQS7k=;
        b=ewGP2ZAR3lbBoQOFKi86RyykTO5xRVGbaQaD1CENuGIsbRNkMSeW/8AO94398RGBlA
         v8rtfqQ9dqEwUqTGV7l1Gfs5hMEQ7Q2WM+GcAToag/1/z97wAfwfqIhYccyrlB7ELZDa
         VKRPF3vByUdnCs5E7t5qpdSxuSENqeT3XFs7tFgL0d6r6BCm/CmeMuV/YZRW/+HNrHkX
         lSICg15ih98f8+XoeobQwYRa5O8AiLs44ygXxPKu0m5rWOqu5TZZGE4QdY7TzNy95dKc
         vkFBQTpf4m+HRkyr13N5stjIc1o/6skmfzpAks5L7+wl5cZxH+h5vNp9zqB22Jek+t7z
         V40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272202; x=1789877002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0RPsG5ANJXum6qiiDCl2HWvCcb2vrljQ6NDoFmQS7k=;
        b=OxQjpsAJ3HiiR3i6a6IBBndMinDEV7izhziu8HHYOlswpnrB1kLi7aapgnwnqA9HNG
         ujaXKF8vrSS4ZdlLaRgGnki+EbRQbQ9rpI8ccdzVuIBCT3pos3if1yBCz2gtwQf71X17
         dgboFpceIO53W7Z5lY2qwKp9pa2jSHyi51BkqwKN7Ph9qx016yVewoZXjfOXp4vlcb4R
         WAgGLyFKQWLF1eslAmIYb3VemqHw2s3GdacPlVLnhvIrQCSyW6VhaXbLqCzQapS7lQOl
         D2F8IX9Ho4ctL31n+/GHJFdH0AW1JZL984ao3ahOi4X69IH7MoSqDpSQHZxZ3JsAwGjB
         /vzg==
X-Gm-Message-State: AFuF++lwLrGJUqRHA5ru9u3KNfWHkeUuRNTbgr2fG+pC52TvReKEDmzq
	Hq1yv5Wa4EO+btWIi7a1wfFC31I1JOzRf4JSP+TpUGIjGWLjb3zIzaw=
X-Gm-Gg: AYBFou0iROA4SOFwTSAgpgbKBdMoS73w1DSQwzK5crZ2Dl68CmJem/NSCTm/8uD2Foh
	BPrugW3uZjQhBpJfvh+Hgmt2wvt8Vzcsjna0YED6k41jmidY8lihm5gKIC5N8c8WnfbzehF2IrQ
	2KnAuNFuyy6Ppmo9FvgOD+57Yl7EqCT3XA90D8TsDqWiFqEQteHlKaNmA+PU9MBvc2h5iyCYUhe
	JGd7NsGvwo4rWFcyBZooNT+MdCsQxdRl9OBRNPxJjOrwS8lhsUD3EGTgHq6mllcOBfBJZvTLsQV
	JFl8hGiQqX1O2Ec7O58KN0ij6SyWvseZVdwsLLYE6X8OOlQABrr4rgYcHmtOiSopShNvbq/yRD5
	n+JnDEK0hVG0BW6zYWGl8wgPCrd0nIoRSgzBgPanFY2rcAxE/VGjj0NR52vEA9bazywWHNkfuz4
	i0V5WJttbxnOMMRYshMqTNSEcQdKFGhlL9CpwJEHgcGpV/TINVrL+XpHjDetCetyO/iTlIFDJlY
	/b7ip/dKp2Jg3Hj74dgyK7mOVjcwbXdsGhrTQ+8lfFFSdNYPUPMIDpztAMBfyXzUzyrbCY0CUPk
	jvWW80gWtyIACXM8xyNuIUElLdcKQivWgg==
X-Received: by 2002:a05:622a:507:b0:527:631:8d6 with SMTP id d75a77b69052e-530c859b38fmr160895371cf.25.1789272202056;
        Sat, 12 Sep 2026 21:03:22 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca460a32sm62329021cf.9.2026.09.12.21.03.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 21:03:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] pinctrl: single: free the IRQ on domain creation failure
Date: Sun, 13 Sep 2026 00:03:12 -0400
Message-ID: <20260913040312.21966-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_210323_786736_826DB776 
X-CRM114-Status: GOOD (  13.03  )
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

pcs_irq_init_chained_handler() requests a shared IRQ on affected SoCs, but
its domain creation failure path only removes a chained handler. That does
not release the action installed by request_irq(). The probe can continue
without interrupt support while leaving the shared IRQ action registered.

Use pcs_irq_free() to undo the appropriate type of handler registration.
At this point pcs->domain is NULL, so the helper only releases the parent
IRQ handler. Then mark the IRQ invalid, as the other initialization error
paths already do, to prevent another release from a later probe unwind or
remove.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 3e6cee1786a1 ("pinctrl: single: Add support for wake-up interrupts")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/pinctrl/pinctrl-single.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 4d5f85b7e..e0eb7240a 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1628,7 +1628,8 @@ static int pcs_irq_init_chained_handler(struct pcs_device *pcs,
 					       &pcs_irqdomain_ops,
 					       pcs_soc);
 	if (!pcs->domain) {
-		irq_set_chained_handler(pcs_soc->irq, NULL);
+		pcs_irq_free(pcs);
+		pcs_soc->irq = -1;
 		return -EINVAL;
 	}
 

