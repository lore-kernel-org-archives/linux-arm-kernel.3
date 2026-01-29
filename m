Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA3AD46C01
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 02:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2hnqyMVnWmWj8jg1bqTVOUz0c/5S35lK3Rmj22NSpoM=; b=4RVZ2/j9F4qPsiupgEfo16P+R6
	+kkJlFSDXnzxCnCTYL/yv7X3U19yD01Vr+gqYieF6L1l9PlEqxJ+h9z/BzttpQRnMUsc2rge7pnDx
	l4XXAG7SauZSVZYSb3hlGJbRl+cd4uGNrrq94p8zsyBnrT4yWYMLqWS2jiKbOcawxqqBi9vq2f/Zf
	iRcoB9YLGztqHVqjl4lYSbduHKPB+XBITqi+0BH6FdAzwxIWd+ZZiYVjMcQu1ocpOHwjZjrTXOlSK
	cAggOYVrHQ1L/rcQwiPg9/GUGsXs6d5cBEH08GSah1RxNkc+1EpbsZIMIYffuoSL14sohVwF5T4Jx
	u2xaXS9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHmd-0000000H86c-1EOx;
	Thu, 29 Jan 2026 02:29:23 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHma-0000000H86G-3571
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 02:29:21 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-35305538592so351610a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 18:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769653759; x=1770258559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2hnqyMVnWmWj8jg1bqTVOUz0c/5S35lK3Rmj22NSpoM=;
        b=HxU/gVCNlsx8IW4b2irR9k/i9G3b7jV2H9wEb8zr17AV4/6zptzTVElKigpbpUpXyy
         1XYvdQoV86qB/y62fbv/+p8GhtGnByKDQTTRS8lTeuhysU/9UNpe8a9E21VTInult7e3
         Y1+zbq6zPer378ChBA86QYrLT8CVRZrHdSbtTgeWcSvtExPafNLZ8CmPTyuZNpZdxCMx
         KqSWSCAw6lnZk/jU/LjEzcZZX1viXV97GzvkUjdQ1hWgc9t0/YkXE3QXG4nX2SksGQ57
         4lD5TPmqtSFEziwKrqyQ6suORZo+/Amd5y554wlPB5lrv/MPq9qCqfBn1iNxu/i01r9u
         NhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769653759; x=1770258559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hnqyMVnWmWj8jg1bqTVOUz0c/5S35lK3Rmj22NSpoM=;
        b=Ynv094lwsqb2p+QR6WWLhabSL1pmPIqL2exyutSUcghNMekntPRp+U07/DTXGcUBDi
         GyUCBOvU0D0WT2PgQNfDYDlFPW18NoHuyGKc1v5fcuMDiEymSdmH5L2EmuJufhWaw8mT
         LS++uAYGM10dw9kM2+cKeZoOC3HtyY7nA/NLbhxKeg8PjF6qMfrMx3m9GEjRkJ640jLT
         yEBGLCKNv+LDjOR4WpdE37iQSx8KaL1OnEHpni3rbtJkOUiXT3R5KLIbrC3Y18bsGrwM
         Xv0sF4t6MAkIlGp0aKy7rucrW1aRqwNos6mW/4dxuBE8aiUtb+th5UhHBTgXsbaTip11
         Mw6A==
X-Forwarded-Encrypted: i=1; AJvYcCUjjsz+iHFUExfOeRb9ZcJC/3YqatdX7sDmhMQ01hSu3Y4pk+IS/ozHZbntqSD981KWKycn2tbRQLBI7NZTsC3K@lists.infradead.org
X-Gm-Message-State: AOJu0YyoTGluUzg5ENiZsf/nnV127KiLKOB+pzj0dGrfolO7V9lCVBAP
	OBeJXLrDh3MS3ux/zj2qFdUDTTOSKYXx3qO1FHbY2ACyTCfrKDCv0yOv
X-Gm-Gg: AZuq6aIkwbqSQmdc9dY19umYMPJm2CbgYtCsaFix772uNXvR5ufuS7tc6pCAZIdUSbQ
	C0Ej4BjHbRMUz+BTS//hcKGEnR8FtFggrKNrqDVu6t9R732R9gMW1m84cjxhU+D9+D9/6TtwcaV
	fzNlXjTcbVRQOGSPW7yrLQ43yvxRJiXGGWZUKMr1kylZq/6Vux4qQtZ69dKiYJ4bbwU8GgL4//n
	COLnuAiBQkA9Hcd9WraA6etIV/TxjtxrbtDsVvLGsFNw5qKQaUzowfH7psb4Ort/SgD5fYgp1rb
	4isT5WsJyr0onK+z5pdk1yrBYubCxMacjb/KMrqo+1bWijk00+N3jLzu31a3vfZ0L7H9Gf1eP4j
	923MuyHVnKqJx+LcJNDOTiOzw1+Y00Ppy6QDghZMEfGW6EDam4n8iRAN7Umb/vU2qvpX7284kVw
	kCAeNqVp2ScAI5yHi6nJGpCsAVV+mt57MAnROc0DjrF77exfHHxHDCfe4=
X-Received: by 2002:a17:90b:1a81:b0:352:c146:dc39 with SMTP id 98e67ed59e1d1-353fed7b21dmr5803708a91.30.1769653759547;
        Wed, 28 Jan 2026 18:29:19 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f2f0283sm4380542a91.5.2026.01.28.18.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 18:29:19 -0800 (PST)
From: Wig Cheng <onlywig@gmail.com>
To: shawnguo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zaq14760@gmail.com,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH v4 0/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Thu, 29 Jan 2026 10:29:09 +0800
Message-ID: <20260129022910.3942028-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_182920_774175_D89E4ADA 
X-CRM114-Status: UNSURE (   8.36  )
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

Changes in v4:
- Drop invalid property

Changes in v3:
- Misunderstood reviewer's feedback in v1, improved commit message description

Changes in v2:
- Fix Makefile alphabetical ordering
- Move vendor property before status in device tree
- Simplify commit message as suggested by reviewer

Wig Cheng (1):
  arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM

 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 50 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso

-- 
2.43.0


