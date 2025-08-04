Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6388C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 15:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=391okEZQgkiN5U3wf1kx/JWnB4oK+nQqVxWPh/vDhgM=; b=OJZpkqhuGPB0mFsD/JDCwOBh9H
	iLIvPty/OhKUqJL6Tp6y/vDPYQm/qIeGU97KKoaRsAF9+/iEXJFttBgEP5/QD5dFz8vU/9a0EMTIh
	NayRMby+UcFvFiZUfgjSTHtVA42tSpVL3gBmj/8aXXpqrVESv+UrkfDi+yvAJYuzjavMTrSvDSR/c
	zautSrOwx6d8TdfdKTHe73gBB0H14vwlu7sIge+LZKCPVxwMorrFpMUWda7sfV/Ioi9lFoflyCAOl
	R48CndoYagcjKWy9V8zZ03HjJ43LdvxLSZK7vBYds1G2ebSDdTyJVpG3qn0EjaIVCi6ykIWOkFRJD
	oLzQoMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixZh-0000000Aw2F-3nCf;
	Mon, 04 Aug 2025 15:58:09 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixPr-0000000AsEI-3AIM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 15:48:01 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-af933e84619so53814666b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322478; x=1754927278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=391okEZQgkiN5U3wf1kx/JWnB4oK+nQqVxWPh/vDhgM=;
        b=mj9pKttJqUtx5hPK9RDWGnoOWqSU8nQlgCm1mehafnv7A45yAYo/py4bbV/cEipKu9
         YGCDGuiVNnXWFP/ocQZdyapJtEV75Lna8d3p8z0pMYP+pkH9b8UN+yZzyjNrhqt8Hce9
         MhGUQarx95jVd7EnS6i/dOoLrFlusnV5x2kGUb/0LStRdxhZu43N+2Oa9TUlzGA0nWqw
         tZZby89y3WudVl4Txwv+o7MwDp1JAOfKbYs6XjR3NkfJkSPxUQnEqfEOjBfCZAhxDkau
         TRh7IrDid9m0Oh/on/QEAn+XoOjQZUGrEQcZaS7kqQuqjQpitb6uQ4/rl5PfX53ybLOJ
         Sukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322478; x=1754927278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=391okEZQgkiN5U3wf1kx/JWnB4oK+nQqVxWPh/vDhgM=;
        b=oMbjBbkedxyUnLsELoZ1hDu+HFlwRt8z73Fegileni9pHjtvvyGZZQQZHT5qoHxRk+
         8uNvv36ehmkuFHQUWDzidXYBUEhXybmsnwttnvOP9ishFwjcSUH4s8Nmy2j2KwOT6MYD
         t7LUSb/M/6PoZQIodcEmSM+EQC7V/9SlCJCBptcKlGVr9UWgq9KN5Yp9+b5uOC6juBx6
         LufUWstH2f6zr1kuwoek/M0iB/4Dxe4ykLg7m7L4ieMsOFb5OtjfI5D5Lv1kgnMDewBc
         +H2+e3Si6vtO4F05tFn1DPBPAjLzx4z38FpRa3fIl8KJBLORa/oqZbCGu3baWuSMKFu6
         BRWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4sZJ19byNZJAJE4m4Gj9pd2abVBqOXMWLfO4y5P8ZUK1O32M1dAd2a8tpnJkPJe7/x7kiwsm3yXKWfUf7jX4q@lists.infradead.org
X-Gm-Message-State: AOJu0YyDbPr4Fyh289SVMYiMnOcDDn2ypgBEjBKU7QB8MhZuyvj8Knj2
	t1hFPve8x+bM5ETzilbCVTg8GEO9o2KkQtD6ZpMEWVNIyKpw6+LXzCzd
X-Gm-Gg: ASbGnctT0bwxACs3Ra8u7SmXiE6xciwAj7kekFcVFmLsgUvPazohR4juggesYQlwSQC
	NvILBLO5hwuFXZ7SwvpXp32C2PmYg5TtnIFRtpCRVUuUxLbLpN+XAfQJ6MFwdvtGIsJrdcZEJoz
	8h9KxzxqfFLu0q4U5NsjA7mxbAGGRbK9NoaAb0YL6f+xuaWykuxr4D7NajLFpBeXT1s1lLB8vfC
	SlTGWLGBg6+Al9W58nlwAkJ2oBhB7N0TnYnVcm/cKEgW9/CH0o2d+gvtE4rQuoS/CeAtZuXh2F3
	UHdqE78VI2m74Xo/Y+8P8oxzlJ/sc+ZmQPme2kKVTR41AuEtxML0sQppINuenglsMYK3T3dFlP4
	/FwUqEn1SJGSDRxZBxH1i1v10aNDUYC+VBPZ6Lz+2rNyRaXZUbDFPwatvhNdSDzGZL8Yw
X-Google-Smtp-Source: AGHT+IFuz9oveW+b87s9798g44D9ohpUR7KqQc0AdJN3W/p3dphpR2bNuov/UrcGKhKrQIUxymTgYA==
X-Received: by 2002:a17:907:98b:b0:ae3:617a:c52 with SMTP id a640c23a62f3a-af93ffd4788mr430320266b.2.1754322477478;
        Mon, 04 Aug 2025 08:47:57 -0700 (PDT)
Received: from localhost.localdomain (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e8306sm757276466b.83.2025.08.04.08.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:47:57 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: alexandre.belloni@bootlin.com,
	michal.simek@amd.com,
	srinivas.neeli@xilinx.com
Cc: linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v1 0/1] rtc: zynqmp: ensure correct RTC calibration
Date: Mon,  4 Aug 2025 15:47:49 +0000
Message-Id: <20250804154750.28249-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_084759_791779_25FB1318 
X-CRM114-Status: GOOD (  10.62  )
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

We've observed intermittent failures with the current implementation on our
Xilinx hardware. These issues were not present prior to the commit
referenced by the Fixes tag, using the same hardware setup. The problem
appears to be identical to the one described here:
https://adaptivesupport.amd.com/s/article/000036886?language=en_US

Instead of explicitly writing 0x7FFF to the calibration register using
devmem, the patch now resets the register.

Ivan Vera (1):  rtc: zynqmp: ensure correct RTC calibration

 drivers/rtc/rtc-zynqmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)


base-commit: 260f6f4fda93c8485c8037865c941b42b9cba5d2
-- 
2.39.5


