Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8080DC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZ47DVQmyZYVdJhDE2+Awlch6+GR0MpCzXRi8vv+3B0=; b=aN4Mvb0d+OwW88m4/HWDPqdh6l
	iuh5pFLtgLPkyp3m1f0FY59kTRHHBMcRB3DLnJEfxlu+uLEHys+4+iUZmkDVef2aEeEmgWbFSJMED
	oeS9clElSq0c3Aizg7lAA8jVFNY+uadrSPnHFklyz606I0P5QOHH+cMw9+RAiHIru50nGHuyEqvrb
	XvM3tXYneX8KfflTxN7tn6fHLJAG3ztFhh0yIaqlcV8Nywf4ormi5G1g3u5WAoucinsWcqp1b2Ze2
	Wa4TQYbK2O62QFouHDKmGMOxOsdnYiDEZ/GZjswhOYLQ9Gu9DV9Z1pveV+xOAxYJ9lsc3NIeepDWK
	IqBUYgBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KYT-0000000Ce3y-0wWc;
	Thu, 17 Sep 2026 22:26:09 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KYN-0000000Ce1L-04LN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:26:04 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso1080765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789683961; x=1790288761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZ47DVQmyZYVdJhDE2+Awlch6+GR0MpCzXRi8vv+3B0=;
        b=F77f+jrIsAKDj4+qfrpK5019dSUoLxWm+jCNFHXF+oBcuevUXQN9vW0qV2hX1EFyBT
         mzTVA+o40pL2eulGskpjUYA22GzXZfULmCGSM3ZXtpSgx0TfyJB+NBzp/FwddPmOjAWs
         7WYA+gcJ2HDxxnIJYjZWrjmSiwmPEqHsNqil/WKJE+9U0RB1kZbrXouUTpEEYuwf3xx1
         hi0p2dCa5Sf5B7QssOYL9dgzE7bF8SKUhbp/oyE2R9SLeSiTXwiWPdqADbDRZza9w5V2
         IBilBkKZJqzXmsU842Tw7gSrPxwdh8XCvuU2RnnFLE3DVxAF3YfWKHhNb2Dbs+h2DAz4
         6uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683961; x=1790288761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZ47DVQmyZYVdJhDE2+Awlch6+GR0MpCzXRi8vv+3B0=;
        b=cZPzXHTgDL/owTHowbGlSq0FaL8ng4bxrEv7Zn6r6/7WJdhCF8dYbcWgSlofg1WEs5
         KXNp+TUofgIeiYbtwiHVHsmOkTuY4a3ZhO1CcapEEy0hYoiG/I9LImMei9vZ2lDP+nzF
         Wem6230MBOnRABLSjryKajc4cFXx8rje19bxWKkOP5KL77lcmWunBZxVkS9zjA6xBeBR
         VzYAtHEUAPpiyg1ixOAXsshxs1na82616puS24+QX+x3zxUdXEd1CNWY/bW8DAKt9Z4q
         TFeIfWCzhGD1MlKcoIgucA3YyaoiFLoIhAAgxMkc60w1Z/xQLSuSbdgCQi0HKo5dHoCg
         QIGg==
X-Forwarded-Encrypted: i=1; AKwUvBx7+L8LI5JPl393Wlx3WZZvq1+ZRxUGMKbbNlO63ZLRB5cTC+QNzDcTfK5O3uafq1O9jINzsUGa+xYOiU0WScKp@lists.infradead.org
X-Gm-Message-State: AFuF++m8vBBEXRmdUwYku10VGb9Rj7QO3bVaFc6Mim4r3W/d/5r//EdN
	nDvIq18N86oF1f7Gf1mKSUTMjqgkx2d6GfF+2J1CrYOmSkgKXthg3aNA
X-Gm-Gg: AYBFou0s5k/Po/facX1E4eC0pisyOuzWoJpHDYXbWYqZ4IVXVH9h5rjh6wKDddAF+ov
	dQUymp0DVGt/6Qf5uayDRsJDGvZHaT8C1GGdFtaN5K/Kij6NYvXwR2zUJ0gyA/CYt/eczdsnyOf
	GCcjthc+BvmXmzZFa9JgWS+Hpp4R+KrX1LOPNgopWM8xPqIWQtM2BO7kHpaB0p1u9YIo4t/D3OE
	7WqDRR4kW9BHOwcVc8NOqBq+7dBY9bLXkNkFpcet0ll3n0FsHD9cFXX3bbibjKyN8kh3DMTQ1tL
	jxeUomU9VhzQH0ycTmdKziADGagiDWVqiMdy6pU6Syz/WDo+o7Oc06CHZzZuPFxPQA8K6Row9IK
	16IY5OAgm95PnBPfxyi0qq6CY19xAWYVg5cSX8bVC9PpPZW2all1Nyr6tu1ake6SDuhGyjRW2ib
	4/+YrnfVLvUirnX+xG30EMm+gPQsQwvYN8/jyj93gYy9YyLZkMSJvvqB7+P5vUw57yHOBKiiSBx
	CPggCvOE7Za8gdwfPSk7b7eI74uzhGakd1nmPOYf9vn4GQCX5E2Mltg4zL7WxQxZHIlUXaQ0BpB
	gNp70H7ICMAq9bRzmLciuA==
X-Received: by 2002:a05:600c:4e53:b0:49e:715e:ec1f with SMTP id 5b1f17b1804b1-49fc5757378mr3630865e9.30.1789683961158;
        Thu, 17 Sep 2026 15:26:01 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm5583835e9.1.2026.09.17.15.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:26:00 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>,
	Francesco Ferraro <francesco.f@variscite.com>
Subject: [PATCH v3 1/3] arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
Date: Fri, 18 Sep 2026 00:25:43 +0200
Message-ID: <f155648a50185df5d273f697f10fcd7efb154364.1789683864.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789683864.git.stefano.r@variscite.com>
References: <cover.1789683864.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_152603_090653_516BB6F0 
X-CRM114-Status: GOOD (  11.60  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Configure SAI3 to operate in synchronous RX mode, so that the trasmit
path uses the receive bit clock and frame sync signals.

Remove the TX_SYNC and TX_BCLK pinmux entries, as these signals are not
used in this configuration.

Co-developed-by: Francesco Ferraro <francesco.f@variscite.com>
Signed-off-by: Francesco Ferraro <francesco.f@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index 2324063f8fd9..c7a9eb23e5e8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -305,6 +305,7 @@ &sai3 {
 	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <1536000>;
 	fsl,sai-mclk-direction-output;
+	fsl,sai-synchronous-rx;
 	status = "okay";
 };
 
@@ -446,8 +447,6 @@ pinctrl_sai3: sai3grp {
 			MX8MM_IOMUXC_SAI3_RXFS_SAI3_RX_SYNC		0xd6
 			MX8MM_IOMUXC_SAI3_RXC_SAI3_RX_BCLK		0xd6
 			MX8MM_IOMUXC_SAI3_RXD_SAI3_RX_DATA0		0xd6
-			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC		0xd6
-			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK		0xd6
 			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0		0xd6
 			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK		0xd6
 		>;
-- 
2.47.3


