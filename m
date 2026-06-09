Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E156CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 20:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TDMeu/0l4ulNBI66h+9oStI7zqLu5iFs2eBbwDUKPkM=; b=4I3+F1I2KhV6PZBIT2AgFBN2Fo
	fe/+kPvPvrMoEJOgKUK4y+zZ8qmMf/1AHE2O5aVDeBMMTC+vdQNYoyIy0j4sgzm2U5H+Igsyal2L+
	YbKfPt4lR8AxSvXDXDw01Ock77XF0K7s0PPgc3B9UpYSxa01i7L76zcVvqMsPB+S8iWAE2LUMnAVw
	fqav1RwzdZGoydIqyVVAikUoD+Gd5TKI8LOHrxJkdOLXd1urjXIESWIUd1Twbp9XcYG/rqcjjG49w
	yRSKLPBQbqos3qQrKddMo0q1fvUZYwgxJYj0ccuSChnFJnec8MSalL9k2ruAgYYVkKhs5p7WdiDgN
	3D635o6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2kX-00000006LCs-03LB;
	Tue, 09 Jun 2026 20:08:37 +0000
Received: from mail-dy1-x1343.google.com ([2607:f8b0:4864:20::1343])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2kT-00000006LC2-3Mdk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 20:08:36 +0000
Received: by mail-dy1-x1343.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso150427eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 13:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781035713; x=1781640513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TDMeu/0l4ulNBI66h+9oStI7zqLu5iFs2eBbwDUKPkM=;
        b=BnrATBJ7zBjTbleQmfwqrmGmMG5TuPTkqw8d1NYxOGX74/V+Ek4nGOOJGhNznv1Bj5
         3lIG+qwIk1WqsfxK18dFVpPqlXP8u+YGIMqGsfnZb107eeggKS7nBjIqbszg+zWmq5N1
         bZejAPHWuOTF8xoGtHuuL3GDhJ1WJGkDMQlEpjGX6s6UnDe9rkwyS9QI/ynjriNzUKyO
         QZWMXCvgHH8oj9Zl4A2kUaquUmv1xcsFhXZvjXFZ0o28IIQAMHQZ8sQmTTy3r4r6A4M0
         yOQ1i9ZyUb1tz4gl3zjjJniyjzP9c/DAsOBylirdbbsGYd+aYxeOeYsM6aBcpjt+0A+e
         ZHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781035713; x=1781640513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDMeu/0l4ulNBI66h+9oStI7zqLu5iFs2eBbwDUKPkM=;
        b=o0K2Y1ZkKunPz8TQ2nhbX1/dfbXkm+ceyn/NYoeFx9206jD6csxzMqyUb9+fBN4rjY
         iahdPcshRqghhvIHms2KsfXggI1sUOh55KDJUeG/de4p8fYHQINAO/MIYncaM9xdNxNN
         vjQ28zOJhEUFYjZY/+M0NE9y5OphN3fnOqcRuvbESn0+My6pBlUHBDP4nGEUPrOwqliv
         /5fILnfFYo1e98hxnDasySkLK8PtGBBgokAiV93HU+eAuPekx9ba9zLQh23kQv4KHAtn
         gV+KZPXe0G9LJQeYrdTEepQLyKJbN4vX6C8pnKd1j3HfeNlQzfMqWoHtQrdAt7iQGBMq
         ND4g==
X-Gm-Message-State: AOJu0YwHFhXKawqjg5wIXIMxTLALyE8Sjbpak/F/bSn1/x0jnISeBr1J
	MalK0pUH2mCpXlUN0la3k80LhWj7zHyFufAC2CKvEIuHLBfV8ossbzn6FXipj6YB
X-Gm-Gg: Acq92OHRTqYdy8h5v+q4kRNSBVpVXCkwROvnT592FttfqS14DKeGCewD5iTmMHA3+ZY
	mHZMrHmG0OiiLSFsXj+5xtyrrbEnSotOzd572P/eB5xXk8wNOb/tEOtGGPZc6MxF/Hh8nbcmIJZ
	bE8SQdS4PQAUC1GKLEE7v7uDi6UvVLTPsKvfHL+CZt/aIjkKzzSmz/8yNqluinOF7lQ9jOikvb4
	RpPEhvy+6qT2JV7pC7+fNOOhxYaRzaEcSd0epiGzz3PvzAAD4lVcGvjueHSsiJ+0Fc3ukjOWvSa
	T6m5yAsrXBvAQ7Asv7/FCV4RCPoEu7icXsJLAUtEZC2TDQ+Cddm7vVE0gNa7FtbYLkkxlbq6iRI
	SG8W1Hj/RyuIWOOBNigyq0DU04z2qGzABUIStr+dpEBJNDJQPw2HkUGqPTk3VgziMZyfx9tJu9b
	I8Gc4YzV5wr64h4EwSjOYQU4EHNTIGD0sSA3O1DtfQgiohWCrrQrIcSPTXklZvmvr7QvrLIgdbn
	VViZvojYcoHiXsi8gXlsvOosR9gi2Rp59eeJHKymkFSHm9ZMXuBTEY1fH/VGcn9xsJsITHZMWc7
	qwZHzXEZnEHXyCx4ubNJ/zsoaeBg
X-Received: by 2002:a05:7300:3216:b0:2c8:6361:ab2e with SMTP id 5a478bee46e88-3077af39140mr13727790eec.8.1781035712537;
        Tue, 09 Jun 2026 13:08:32 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df191d0sm32816921eec.21.2026.06.09.13.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:08:31 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ARM/PCI: remove stale CONFIG_PCI_HOST_ITE8152 reference
Date: Tue,  9 Jun 2026 13:08:21 -0700
Message-ID: <20260609200823.171938-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_130833_840710_BAC1DBB1 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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

The IT8152 driver was removed in commit 6da5238fa384 ("ARM: 8993/1:
remove it8152 PCI controller driver"), but a reference to its config
symbol remained in arch/arm/kernel/bios32.c. Remove it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/kernel/bios32.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
index ac0e890510da..eff8d9e3c14c 100644
--- a/arch/arm/kernel/bios32.c
+++ b/arch/arm/kernel/bios32.c
@@ -528,12 +528,10 @@ void pci_common_init_dev(struct device *parent, struct hw_pci *hw)
 	}
 }
 
-#ifndef CONFIG_PCI_HOST_ITE8152
 void pcibios_set_master(struct pci_dev *dev)
 {
 	/* No special bus mastering setup handling */
 }
-#endif
 
 char * __init pcibios_setup(char *str)
 {
-- 
2.43.0


