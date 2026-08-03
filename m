Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1877C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 17:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ggw6RNSbRfKcNoKstdM8y3wKuc7rtFdrEqUHCmYX1Cw=; b=P2zeOoHpGmEDX+uD8EWRpqvYir
	5FZRMdmSz/h7MObQVX6vJYxFO2l1lIpLqCKOAYFLKLDQjOdea/6ji5sH3A8oTJZVlPFMdJE3vlSET
	rTOLoq8zUoGVSwEkRLcEvK8uW2SWEhooZqlDp1oLU+nQGLC2O0g6teF1aQ034MtDBdt5UpBpycruV
	nq3RfmAqyxyvWOIKAcNS4QOHkLgUX7h2Kai2wBD5cpb41e4yBIw5IZBhGcUIfYQsbZP2P2yeWUPcX
	vrL+4qHNMCmTOyk2/Q5buNBWGNpHkwo/pQY3iiJhfMR/8C54fpELnZwI70j531LDz9T4V7NQ1ReMv
	bD7oz4qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwbi-00000000Fbr-1Ep1;
	Mon, 03 Aug 2026 17:37:46 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwbe-00000000FbU-2oEs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 17:37:45 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-383cb94f742so3687220a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 10:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785778661; x=1786383461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ggw6RNSbRfKcNoKstdM8y3wKuc7rtFdrEqUHCmYX1Cw=;
        b=HUzCkJClGiuV7kEijDTswgBmSb/tWRDMvsw0H3XzGAPtWVV5KC+XH2bZHpMzQxcAMT
         tqUXZ355T3U7Xe0sCQ3RvNUOnxL9MLB1cXPKKPKCtaaKeMOT59erI8OwgduGFthb9fyQ
         NRT9ixC0nSDsh75JjYRwqimaeLtDNfVIGtdxpU9XtG1rkDpuGi0YJQH4jNOr9jOiXOkG
         0FuhaunwqLUhKSPxDlzYPTHWwNvfsP2IPM38XRh4Yu+5jo1pvrYlGcLyjTodb5V+mpxv
         kNTU2qco7xQ2T6GXS4iqXST+553iQDDx/BtOD7hJ4vzgFIi380ReVLzv5eyGmbKvdSmL
         tO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785778661; x=1786383461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ggw6RNSbRfKcNoKstdM8y3wKuc7rtFdrEqUHCmYX1Cw=;
        b=sdJGhTowMifKwrnOcz6+twza1vG1JUAOUUaDhAXCsykLo3SiTyd9k7uhV2dbSim15j
         IlvJwGUTLPVFgObb0W70F2qn0UE7X8YWiQoK3O49IBIdX79DtkjlR9Vki4uq5DE2n4tr
         sg/zk8rsxszN0JF34AFGpC5aJEDDU89iagwlzMoGMCsVzOSM8TB2bhm5fPB2ZoUCaHf6
         gI8c6g4v6Eki6IM5OVWdeGGl0V+/hq8ieimkr1gt/AwFYkM2vuatTv4Mtzpwj2Hxzwzi
         NCYStrn2p6TLk44JGU8XfXiBELsF7SRbzBjVW8eQ/NZZPkEBNJ8aHR2uT2QImqRy/hqg
         hiHg==
X-Gm-Message-State: AOJu0YwVNnTBqyyI6iT3MQgwQ1lH3lBMYIu+jA/1jIOm+ZxL0hKNp8tb
	DeU0TNDKWkbzynLPSNX8YRoG0cxuNGDzdw9/XO1r2jFIj85hyE2kiVzo
X-Gm-Gg: AR+sD104whrizomrj9qzdnfVHEcSoSsLdlMsXbjLUV3zi5IbpW2i1ZlHGGp7XadtMqe
	1GgCvaDfbFiYVElhvrX5shtNKtXpKTutZNcsMh4STR5aeiuO76XJTEMLGs6vEqUmmjfMtREipQt
	x7ZYm39uCa8TxaGc/EiOMN0ZACbrgcxEg3WYTrFx3faj1/oGFogU1AQhaCeQzJYX0xxUYifpD3D
	+w/HlaI35iv+nJCS2gxPnUvYxfb9P6wQSWzMd4iPPf79NS/PVOOD+SbznvkqvpokaNeVvQ49xGD
	fc5Opb2WFmBQlvg10okU3zqFGXNoI3dt3ZvKBoa4lMYBlmBHFY5CpiSAojRgG2Fc14qUigYn4V6
	4Flg4hvBiFybTuqLP/WAbzUk6Vq1yYPZrwrBHYPKO44tO5Fu+IcSuwycfeGT2dUie36uUV2iGmf
	zMSchhrEBZq2v7jKWwv2dlCAajdrLYk/XNQfbNkvp9Bx6B3RI/9Oy5teboBL3T1qhHg0U=
X-Received: by 2002:a17:90b:2ccf:b0:38f:57f0:1f4b with SMTP id 98e67ed59e1d1-38fbc576496mr8815875a91.35.1785778661240;
        Mon, 03 Aug 2026 10:37:41 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm65612331eec.28.2026.08.03.10.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:37:40 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: [PATCH 0/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
Date: Mon,  3 Aug 2026 14:34:28 -0300
Message-ID: <20260803173705.2268792-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_103742_708563_12A7190C 
X-CRM114-Status: GOOD (  11.39  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

This patch adds the device tree overlay for the Toradex Capacitive Touch
Display 10.1" LVDS V2 through the DSI to LVDS bridge on the Aquila
Development Carrier board with the Aquila AM69 SoM.

This change depends on two other patch series, and should be applied after
them: 

- https://lore.kernel.org/linux-arm-kernel/20260623195741.495734-1-leoreis.costa@gmail.com/T/#t

  Adds the Toradex Capacitive Touch Display 10.1" LVDS V2 overlays for the
  Verdin AM62. This series is required because it adds the panel bindings for
  the display. It is currently in linux-next.

- https://lore.kernel.org/all/20260602115123.1324474-9-ivitro@gmail.com/

    Adds the other device tree overlays for the Aquila AM69. It is currently in
    linux-next. This is required for the changes to apply cleanly.

Leonardo Costa (1):
  arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to LVDS adapter with
    the 10.1" V2 display

 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 153 ++++++++++++++++++
 2 files changed, 158 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso


