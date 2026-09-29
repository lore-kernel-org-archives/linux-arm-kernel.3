Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9CBCA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T1qvv+WBQk97TqMLFAiiMPDCR04SnZ5MGolPSxFRq8k=; b=Cq5MXtEHhPQ0nJDKz8SQC+6eF9
	PNL0ezgIkjho73r7L1GJWitrjzM8KUzPY/KIgcHJWd+DqH9FSiroWy+8maGzgEZmYRduvNZB6D8Ty
	N9+J9UgTzMj3p5wYbPFmRCnM6l+VaJ/2IvSvWyu3UIelcHRXvntAYfb8cle964ih/Dx34WYnILmiw
	TN839df3l4pGif4g34J0E0Nm9XA9Icl5ngw2DypBvS7B23wocFtqPFRKd2KfTHvEtYxX1mcSU3X+X
	Tox+qNdwFRkKngjKgEH40n6UfHajNjSqSokIKPZ66xPS8ndW6MHpuT4oOyEC/ijs6xGt5+RUBUmuX
	bI3TmQSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTyk-00000002woE-1tfX;
	Tue, 29 Sep 2026 09:18:26 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTyh-00000002wnR-1HIj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:18:24 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d3920so29428875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 02:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790673501; x=1791278301; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1qvv+WBQk97TqMLFAiiMPDCR04SnZ5MGolPSxFRq8k=;
        b=ftxLeQNrHNneWgrEJhMdKxkxYVm8dki+BEEz7z2S2LblPySbT9o4Akmrl0C6Jf0eb7
         blhH7y4o0vqcd/BSR5RlAumQovu01dPXUjS+uSQi8t/ZpAUJaZWk7N5m4/pwCzYu/h+Z
         e5Mqmnf6CUSCHxsREAJdx9mYqh5dN4Fl0xEwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673501; x=1791278301;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T1qvv+WBQk97TqMLFAiiMPDCR04SnZ5MGolPSxFRq8k=;
        b=WJga7u/iTFLiejFUAgW3Jwy+9sRZIgk/xfIABuuUv9N+OiRacMk/reHiD1KPlwlP+8
         xMxC3Jz+3LXax2GAhAnZwi3d0HnLtXZEl5OovoGqH+uZ+EXV6MR0fFPoEK/a5szUN8Q2
         SffdktPfWYmD3gw8qesuyQ2ybxNNvQGhbPW0YVBOzlE38bDR0ojGjmSWj7282lSuZnGi
         SPy/+dJTJpkbBUBsqA4hzz5EJWmz1342y/S3KWFqsBgC0uQ4MrCjqhlrtG3fAN1pN8D2
         PrnWY6D0ZeK+cYPs24ZS7s6OZxDqXimeLjVqXYggDinSHN5Kw5+CXC/LZKylAMdyUrPB
         OVpg==
X-Forwarded-Encrypted: i=1; AKwUvByeleiWLSYylhCr9+PdV4nCF8rNymLsBLwQg6iXb8Xsum6QsBB3HO7/EZHxc4Xhrn/WVInERaQ95KX0k9PjeeB8@lists.infradead.org
X-Gm-Message-State: AFuF++nfh4rMwMeh2Arh9Wn8EG9I4RosCCw1C2LbNrgaTQIZIpxDGefY
	+IQrLB5661Fpq1Mj8/9fMx54vpCOuJ50wf5SstMCdnmNT+vga3Qcg5KtQ1+vYdRwef8=
X-Gm-Gg: AYBFou0vaEQN9zWid/tCvs4D3vVtJZHEEOygET5JFt8wkBVM+la0x3yiVZte1be2YM8
	PH8v53t9Lq11eKWuVoE/wSvAFC2pFyyDHObJyiqvHOKZHZVW3K8ONiPe/5RPpXm4m7+g2Ge2Iex
	G75/VIqR+CmVqDMKqTvp551bGJLtC1I+RZBfKZgM30tMsRNuVhf7kwN9W+Jpu1J9QD97RQrHs0O
	ynTCPv4b1fWdQGUOBV4lW5ti/TzTHgqd3Cjyf7RUDjtnZ8IPIn90pg01q7KmbfIskczs7JVTc1l
	NR3ejPm3RMWGYeayPNf1h/YuSFc4HVsrQSQUoFmtxs+PM0zHCTxqWlyXcUS7TToaD0h0RnnEz98
	4g8pB+GDm6UFuATkeOLjgGUoXO92oqpCbkQkb+gm2idkf1ajqfcdvcoaWvXR6sHVlx1swNShLpN
	NIKqsx7PhSwyFUgOfiPSeAgBKtIigrg1xbmAPUnWezbeGQUD0PczCQueK8Og3d3QYrtP/Mqq6uy
	kcRcUqevNFZlOk=
X-Received: by 2002:a05:600c:8b71:b0:4a0:328:43df with SMTP id 5b1f17b1804b1-4a0032847fcmr81130085e9.21.1790673501052;
        Tue, 29 Sep 2026 02:18:21 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b150sm59178575e9.7.2026.09.29.02.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:18:20 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v2 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Tue, 29 Sep 2026 12:18:08 +0300
Message-ID: <20260929091811.3735201-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_021823_362071_CD2B6E7F 
X-CRM114-Status: GOOD (  11.94  )
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

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

new in v2:

  - add the tag from Conor Dooley <conor.dooley@microchip.com>;

  - it should be clarified that "draeger" vendor prefix is added in
    my previous Draeger M48 patch series;

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  23 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  23 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 369 ++++++++++++++++++
 .../boot/dts/nxp/imx/imx6qp-draeger-m48.dts   |  78 ++++
 6 files changed, 497 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts

-- 
2.47.3


