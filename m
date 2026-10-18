Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0518FCCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 12:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GpPqZvPlIP3fXy4tW9d7V+mx955z5cVsFSY/eblWfwA=; b=QSTnUlhjWfKGnXlOyzX8r+Psaz
	KkGUVyesHBFqr82YdKDp7w9H5B13nxNQU52edRdHGhj6H+erSLkDrjIIuwpFr+txzhd6uGbDjktTL
	FLcALLzDyBmLMemJ7tgA9qGpXElqSTbFpnerRhsj4EeTB+QqEE8z+QEO+0thC6NKYgsbp2CBXff6y
	hUTlB8ypPRO9ces5wzRKKe2QSLVgNBwA1y/JWxVmrcmCFipcH20jvttKIrNBiJPexHbEM/TjOFIUZ
	Yw2KVqfASH6QKOMjW0JbLOdCWu7kEwPGrzQafpzIipv/AIjPPcXmW4t/9N7reQot8MUtlZFyNyVDx
	gD/fMadA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQ4K-00000005qhR-3W8T;
	Sun, 18 Oct 2026 12:32:52 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQ4H-00000005qen-0zmn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 12:32:52 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso14182245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 05:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326765; x=1792931565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GpPqZvPlIP3fXy4tW9d7V+mx955z5cVsFSY/eblWfwA=;
        b=HkmukWB6lSpJ7MgWUJnL4yBKD0CV87adFIQzRv2j0HX2geVcDnlpAc5sJl8GiPTdNb
         3cqL7znPSgFjOwamA6H6RSHZothHUEvNw/smsVMmRhRxi2Wam/MCN1MEXqxgROFj7CaH
         GZH+CAJ9tnW8x3lF2ljQsfuuFTcW9DVoiErQNGhpm1i9JbzxCLdWA+6rLn3lhDTeVtTi
         XoVakt+ZcDlNCg9nH9Fnu+til0tkbCUGlOehWhki2lvkO4XW70sOreLoaSpcQtxSEu/z
         ptJj8rmPs7WR3cCq8WJn49JuI7Dl+Zu+EIsnNHjm0QEho5MbuqvSVo4zJInQp6WwpAD+
         Y4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326765; x=1792931565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpPqZvPlIP3fXy4tW9d7V+mx955z5cVsFSY/eblWfwA=;
        b=ppZ6OOQqLZ7yIjO+cRxIOY5J+Y3Cn86fjMY10MYnznaQHqUpJKVKK2vP/7bYGoZnt0
         U5UwCT/rS/FVRkFjYDwa2nKCSdyERcdMcoHIcEzIiylqfwuRIe+tWWEtNuWGeDoMqbyP
         rrE5dSTpIo6QA0AFr4dMxLFuN4b2qJ6OXjhjjPO1PVBjqy3yfy4GDqdtKetJKhFuUGuH
         w2Fy7tMayYvURm6/ccpTZKgDJ1egqSS9xXSQWmGBna0+Fqe8kwe2TsZ/prYooDoZcQNT
         y6iJpc5ycf9K50zECpMB8ktvTMhizVA23RN+RjHt7rcFJfn40mjBWd93b6gr3lrGT1Ks
         k0AA==
X-Forwarded-Encrypted: i=1; AKwUvBxAAEib3wYlO07HAfrOQQ48jvA1Jgli2ffK5xsXiPC1LCjk+5/hsXejS8F8S0MHxC9RHSkY5d+Wt4/Lq45guQ+R@lists.infradead.org
X-Gm-Message-State: AFq9FYJTGZyYHp1I2dKkulbDmQRNbZLNBCLm+4TBTJLNyqQtQ6zmFfSM
	M8CIjDhDCtg6m2eGozihXRvGOfT8Crzet3YPErIVt6FTGgu1gvNhijUZwNvGgQ==
X-Gm-Gg: AYBFou2ub1KhL5/Eyo/GupfluCI4ARw17mx/VwsaZg9fmm5ZD9DR6MLT1vhK5h/nlOq
	woN7FP3/guLPP680qDC/e8eSKeoXuj0GFNlOTy4KvLzTZod83/C296KS3KCjpu8A9hRXJnRVT9V
	DpBRhS8I8+NCCkHXDdsawIH75qpo2Ts69Evz1n3QTToJQLvqE3y2UPKyBBGyAhe6zWnHIBvtBsO
	QoVqCMbjGl/xreJca/GxpiNxxzMBc6q6mmrd5/TWDwPf2VLE1ny2DjhezbplAlV604cKYkQq7Rp
	OauJGlbTzxKOh4bpFIlQN924GkXLulueocOu9ZZcX/5cB5edRvW7coo7fHrxJmSDTnhdB4LJygx
	qZ91t2hhOQwV9IVXJsUQQ6/Cmn2tGCLFh68Z61mR1j1J22O+bxSGkCaA3a2pOjefXiwR6fxUgqf
	1yN8mGcc/ttNX6Xm29wUHeF8XqQAa7ANiu0iPe71YWkUHefyt7FUinodDy/0gE1oomYTWG5JHK5
	NeEI50C+gSjExXqJh5MTy20JJcCi68NWuhjCrOSkQRuUUuh2N7e3rOpAqt6W08LHwyaOPoAEiSY
	+mBFBbWJC2AGzzrLabM3ag==
X-Received: by 2002:a05:600c:6992:b0:4a1:d7c3:d3d with SMTP id 5b1f17b1804b1-4a1d7c30dd2mr96288465e9.10.1792326765173;
        Sun, 18 Oct 2026 05:32:45 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:44 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/4] arm64: dts: Mark Variscite i.MX9 I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:23 +0200
Message-ID: <cover.1792326585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_053251_155744_57D9CA7E 
X-CRM114-Status: UNSURE (   9.25  )
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

The I2C recovery GPIOs on VAR-SOM-MX91 and VAR-SOM-MX93, including their
Symphony carrier boards, are missing the open-drain flag.

This series adds GPIO_OPEN_DRAIN to the SCL and SDA GPIO specifiers to
match the I2C bus requirements and avoid the warning emitted when the
I2C core enforces open-drain operation on SCL.

Stefano Radaelli (4):
  arm64: dts: imx91-var-som: Mark I2C recovery GPIOs as open drain
  arm64: dts: imx91-var-som-symphony: Mark I2C recovery GPIOs as open
    drain
  arm64: dts: imx93-var-som: Mark I2C recovery GPIOs as open drain
  arm64: dts: imx93-var-som-symphony: Mark I2C recovery GPIOs as open
    drain

 arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts | 4 ++--
 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi         | 4 ++--
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++----
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi         | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)


base-commit: 31f9ec9f38735f42e1f0ba57347c420e56b99824
-- 
2.47.3


