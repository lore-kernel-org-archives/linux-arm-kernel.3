Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162C0C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 12:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=; b=p/wFgVwlQXK7r/Znn4Lc9XRy7P
	FOXnVnAsrtSMmfLUGwtqRZe1e/qmfvPzYFBKq0PhIhw0M44aXCa19jnObe6ddsp3val5nPw5c1JGz
	6ClJbmn3G3ADf9civFMJtADgKyTLUAKoVolpssfuxNR27y1GlLh65ztTwwbwWf4uPaHzI1RduxqPA
	I4uMu+AWFc7nDGMBt6fRdT+If1hKPJg7tG705nBkLWzTxUpxCXMI0V3kIy1rIBQ9JFKUsWrHa3ddA
	Xoy74LygR3IkSQ49us3oonjFArCrljoSr4pd8DeJT0UYQq6R1SaJYb6JB+u7X6AwRR882ciKOq6xJ
	Tdz1RxyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8IE-00000002PF5-3lWn;
	Sat, 18 Jan 2025 12:51:14 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88R-00000002N9r-0hh1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:41:08 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so4404258a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204066; x=1737808866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=r2RP4OiEfmIivz3jDHnp9nIV8EP8BG/iNj/QkEnv1ypgutXjY092ISllU/oj8H3SAn
         Br1dS42iJYx5+637acAiyGqrdM5oKRzXrrw7ok24btHYu2K1wLC0wV6gZrlRg8bsqIGc
         POl7w/0KcnkAFiVv5RJyRcuXd2zN4Af68YQH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204066; x=1737808866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=VKd/HX0PDNZTJ2bUopmcC3/n//zqpT6eZedyfJnwUvmzlde0wHotLh1RJfKXxdut/+
         ZRQICzR2CADR3mHvwDFycLV2DJQfti/g3SS46FsWY49eCvqZ5+zaaj9AN6PgntaweAVN
         8/ucHN9fOMd+o31DmNVuS9n/LoutNjc7s7okF3XNQ7GWjBSXJEwOUOkuSJook7uGs8QH
         lf+B+/tytqNCQJvFV4++1aYRWjvwzgCj/aTAJdIeUeRmuHw87uJX5TokRilnjs9WL1X+
         3psUAfY7T8Ox+oP2XJMwsBCDcvyhVb6esDgvu83LDoPNdVsmvGrbouaGH7B1lUC4jRVE
         Hteg==
X-Forwarded-Encrypted: i=1; AJvYcCVybBeeGnZbwRtule/bmZDAjb2JN1bg1O9XQnJAoEd9wbMgq2s2gdy+1f+E8WGcgI2MSs5iJhm2dOUiTWG2OihE@lists.infradead.org
X-Gm-Message-State: AOJu0YwD+0M0Xd+abj8YP3UMB4I4bYgHrAUKIQbxT16Ov4o4MuIAHG/A
	jqoOSqEn5fJD3bETH/V55XnWU1q9yA4Q7RWrunNXJ5HBEKeesWjWrOnVD1kRqP4=
X-Gm-Gg: ASbGnct5HlSlEjgYwiyk1pQ514bKxcoES5XPtS2QUyCiYXK6sKLPEJLVwKWRhWXE14W
	k/w/faZ18YnDG9ilWp6SojIZgHe0BdNNrmwJ4b727crVeHmgUg7hREOQbLRatUJblOUhBzWk2zi
	hOEVBqvWFlJC1o6NrIDdd9js243iFZqApkLbt4ub1y5B0u/YARHVURlkfftBZe36f5EA7+tlbx3
	WHcRaglDw4DOSPzfP7RzaJnxXi42aMpyqMhm23g7r6l/iHmaKzU3nwROeTULK5WfE2oW/HDkLim
	BPquUiEE8iPc/P5lEznf4Xk4f8C6e/6Q/G8AM5S07xmx3TUnS9AigpFB/+EmcB/yNOBU7k+eiI1
	6IvRm2Ja5/f6NOTr4k6vtZHzVSk7KJdLpjdH8
X-Google-Smtp-Source: AGHT+IFd8SJOuPnbNHYayMQ2pJl2dtTRvVnOeDARGIr6v9/DddrHyT5J/QNi2xGLWBTU+gDaqVLJPQ==
X-Received: by 2002:a05:6402:849:b0:5d9:857e:b259 with SMTP id 4fb4d7f45d1cf-5db7db2becemr12516818a12.31.1737204065870;
        Sat, 18 Jan 2025 04:41:05 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:05 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 07/23] arm64: dts: imx8mn: add anatop clocks
Date: Sat, 18 Jan 2025 13:39:50 +0100
Message-ID: <20250118124044.157308-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044107_202266_64FE6A5E 
X-CRM114-Status: UNSURE (   9.08  )
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..49be492b5687 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -606,6 +606,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


