Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208CBC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pUwufIkKlgwPmaoI7EtkILOQ2opwehMJ+nCT/MIXFWY=; b=noH7zmXbecaZgBQk73wfnnu0gh
	J1VjXrZy/deuxRvgto7chTr5y5xLpDV/+T42ZfllMRaXboHEpDsrNWBQdT3gjn1TwS/aU9OfPd3cI
	NgMEQWqPP9t9JaKN6MMBlKqWjZzB4M1J6jm3aynbg66ajsFtMMuRtRw3ctvSQXuaUn1twWWcuLJCC
	fW5n+ZaC3Us55vn3ad+gu55RqNBB9j/4ql3Xk88JgEOPaiqPZQ/T0PbSVesr6wk6uBmIJEqSc8aaR
	l22LT7u3/0SvoDXQKh9lslTSyAfmpx+joroVOYD54EjAlmjuMja/4yhbGTE6hoLc0l7gMfjL5XpvB
	GmoQn+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGW6-0000000FGwq-43xU;
	Fri, 11 Jul 2025 16:22:30 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFtM-0000000FAvy-3U47
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 15:42:30 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-73c17c770a7so3030304b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 08:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1752248548; x=1752853348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pUwufIkKlgwPmaoI7EtkILOQ2opwehMJ+nCT/MIXFWY=;
        b=JXqvyuE0A3+9RBsUlpKDLBs8XL/MKjMHYv0Pbt2wuzpLtXGJYMNOmAEDppbkmoom6a
         mrog+UvF8O4Pq8uhR7eiUcwz/ygZUegluHVd6DBN2xjp78xhrDGT5YPtZhkJILeuiCk5
         8+yhUF+nG9l/7s0A/Jbq8PIWOAEbQuB6dGw2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752248548; x=1752853348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUwufIkKlgwPmaoI7EtkILOQ2opwehMJ+nCT/MIXFWY=;
        b=sCV0mmHTtXn3pC0w77KyU9RDLnQQct+zgLpZzpUyozKrnBJ2++eJjArC4WUL7A6ZMi
         TjsAAwbeUK6CNkgLpB0eGhgXohnYu4VhwkvVlDkeXH7jsZk2V/pva/8uU2uX0Dn0w3Le
         tPZzZpBENWoDYK9BpK8fAyDpImCQwLjzV3Q1KvHyejb+xALJhdVTNlEhhe11jjaLmQRC
         c3QsJuoPSlsza7kru6fv6RAwrmErPjtFhM0JdUV4QzN/r38JpCXZJzgx8rgi9YKlwJg5
         hhRYjRWwKOYrh6vn3odwLKg2FwALC2mJPKwkWRfylulKXsSI0SfyjtBH/8zZTaRwnmmd
         Li/w==
X-Forwarded-Encrypted: i=1; AJvYcCXtvlqvj+5joDfk1JMIAOl3QNezzkssC57+12eVOkLPuMf8lzSBk9j8zQ450oBqvqpdPlZLk5hF9AOWBATcLQC2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi4q91lPfBn84qN1tW74K4OJKOJLLHwCwtYs1tGNrnsZQ6Bao0
	ZiL4eqyo+aqkK5dUWTATz2R3CGcijt3sU1WVvJMoMvlqCH/U1dXAUeABkDhUrvsUB+KLRdd6lnr
	Q5Ac=
X-Gm-Gg: ASbGncsM9FLMGItltH3rEeHyFNRJJFha4iZA1hfjPWCZ1x7UdNOFFaHyUFuytFaLNYW
	RRlYjeHBwoWz4YetMnk/sLdloEHrHoUVShx/yKWiYkxifLTCF8rGRMfvf1pvUnHifmA6ewV4rJ5
	vfV8PFlMc+/Nae2n3uYE1X8ua8+NsFrBmJg2n7YbK6jfLZpLgAj3xPuzcP7OmD+Rw8rh3AQ/Z1V
	ZwAaqL/OCsypgYXTViFTVBHDyXFZ35pUfGnHKAKPGStF2pFh+DOMaQSTNyOeOb8r7mTuJO+uV6d
	SN+4XIqkiXop9Fz8nEkQNMlOj7Gj9kSguzduZ2gupDq5Wdf9lNxrHGpsLhrey594cCO/FkTYsTU
	DuedBlgW8zdYrvyoTSdES9pYJCX8d62CiGAA/QL8TD2n/wzMB4xQ1WCca+w==
X-Google-Smtp-Source: AGHT+IHFZKUgGL0wxuQrtMVNJArFfFZ4ZiEznQy74X/s9Jn/0gsJzLOGIMGF63s8wwcASQkDocGp0g==
X-Received: by 2002:a05:6a00:1743:b0:74a:e29c:287d with SMTP id d2e1a72fcca58-74ee244a366mr5107688b3a.11.1752248547651;
        Fri, 11 Jul 2025 08:42:27 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5ccesm5762420b3a.27.2025.07.11.08.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 08:42:27 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	kamal.dasu@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: [PATCH 0/4] mmc: sdhci-brcmstb: rpmb sharing by claiming host for TZOS
Date: Fri, 11 Jul 2025 11:42:16 -0400
Message-Id: <20250711154221.928164-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_084229_068094_81B95FCF 
X-CRM114-Status: GOOD (  13.59  )
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

This patch adds support to claim host for TZOS RPMB access and synchronized
access to the controller hardware using hwspinlock framework.
To achieve this Linux OS and the secure TZOS make use of:
- shared hardware semaphore register
- a set of SDIO shared work registers and
- IPI interrupt registers 

The currently running OS that needs access to the controller puts itself in its
slot of work register and if its next in line it can try to grab the hardware
semaphore and complete its mmc requests. The shared work registers indicate next
in queue to access the controller, and current agent in the queue. Next agent
queue state is changed under the hwspinlock is owned by the current OS accessing
the controller hardware before release the semaphore, send and receive IPI
interrupts between linux and secure world are used to indicate completion of
transaction to the waiting OS. TZOS has its own RPMB driver which accesses
partition when it wants to read/write RPMB frames. Current implementation
assumes Linux and TZOS as the two work agents.

This patchset is an alternative method to initial RFC patch:
[PATCH RFC 0/3] mmc: sdhci-brcmstb: Add rpmb sharing support	
https://lkml.org/lkml/2025/2/6/1711

Kamal Dasu (4):
  dt-bindings: brcmstb-hwspinlock: support for hwspinlock
  hwspinlock: brcmstb hardware semaphore support
  dt-bindings: mmc: add brcmstb share register and hwlocks reference
  mmc: sdhci-brcmstb: rpmb sharing by claiming host for TZOS

 .../hwlock/brcm,brcmstb-hwspinlock.yaml       |  36 +++
 .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |  29 ++-
 drivers/hwspinlock/Kconfig                    |   9 +
 drivers/hwspinlock/Makefile                   |   1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c       |  98 +++++++
 drivers/mmc/host/sdhci-brcmstb.c              | 243 +++++++++++++++++-
 6 files changed, 413 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

-- 
2.34.1


