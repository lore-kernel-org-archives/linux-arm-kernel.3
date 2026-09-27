Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D667C98328
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 02:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zx161GO4leyejnwa92HDTsrJTQOft6nH8qorocIvjzU=; b=I8bQfW4iKxOSsMvmpfvSwj0kzv
	RYIkgiGOubKfF1aSV0EOQI154p47D1x5qTpRwjH2COtePTN9V/ACU7ELBH4KHJI+/xf6qosAVmId5
	rWBgig0I0b/ETjFWx91pz1Rx+DOkQbh8TnGfJSXRiyehvXUOmly6akK58AOVtHR7Hat3QGpFGQc4W
	AepkQ61w2flavCDlmuT/yJNySFs0GCUOZbQtYAN1wIeeF5+IDdJSxHXqALNqrgC0DPS4CilYo08+X
	oREKa/QLEpuigcXuy+JrWFcY+8hCchLvxn/nrH5XgXG4POwmSyGwZEOU5xrRpRNg5cNFp2usOsbU9
	zKcaAGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAf4c-0000000FxfQ-2ZTb;
	Sun, 27 Sep 2026 02:57:06 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAf4R-0000000FxZX-2Rx8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 02:56:56 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2dd88a115ebso10873765ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 19:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477815; x=1791082615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zx161GO4leyejnwa92HDTsrJTQOft6nH8qorocIvjzU=;
        b=hIye7C3rexDGDQdK+EnHU+tbnMQhSPbfapqUlw58Njy3dPvwtITxPBZIZYgt6x6oJx
         sY5Bh13TV+NWielI1D5sIS8F27YWX+f0sXXyfEu0Uzju+77s47mFeBVgn3sOUCYXskcg
         fqK649qit3NGm+Lp1fdyrb8TPTKz1XJoKoUVBqEv9iWXKV8UTsc6Qf0V7lLKSr6MB1lD
         d3+H9GFSiIjXW9u9gT63RGkO6h8yNw+eJUOtUbjbkJf0vynK6WSXas5sZpfHQSyE1hYY
         12/2+niDcDA9hOoMCY9TccW0NGt/xbj4DOb7MsK56UqGMy1MQEwcsbETdy39LAaavryR
         OgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477815; x=1791082615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zx161GO4leyejnwa92HDTsrJTQOft6nH8qorocIvjzU=;
        b=yPyKzJcIxrHrDM4C1xBsF0Y/uh9D4GSXoEQa4WyDQyJKVO42VQBQRabhaC7e0Rai4P
         Xh+VhpJpYIQknNX9iL2i/mM8HyKE4Lg8p8L4cqVRvclOD5k+w+wDCQBs4rPTjj1s+7UG
         acDmxWg2Xo4/mw+qRptaoelL82cfaMLvtYHinF6ko7satBa3tDslucwmlvyGFd/lJx73
         QZtwAElT6WhqXes8qYmi5Yn/Pq10BUjGUk/fZ56As5LbLLBmHI7h3eSjOOOA8gaKvjaA
         F0dWQ/DV3UErdKYTgM7p9jmsQvA2RHYcdCh3u6JyNogw5n2e87FA9PZgs9RksImsG1ma
         vOSA==
X-Forwarded-Encrypted: i=1; AKwUvBxb3Y0n3v05aPQtFDeOfoCIqXUJrAFLw+tdasD8DhPQId3W7GwV40h3zuZLJ3vl5G8osjJh6IZzT8RgM6aKP0Wx@lists.infradead.org
X-Gm-Message-State: AFq9FYLlOelGl1vyP2I1S7wuI9JACGoMZbwWTgHfSTysyHrCtHSQiA7w
	ANlYLNZqt+0SVN/P/1NeWdyxPFBorJy9siUnCrYCcmpu3NQCtvi2vBi5KRv03/A2t9so
X-Gm-Gg: AYBFou24q2siEDRvZw1K6yFEru/0Rv9xHLppQrzgIjUeYsdQgfdh2n8Ci6rdk4/3r/n
	JVu2oyyyjPdVB40XmWhYr0SaZ8mIR2Y5MHkN0GLiiea+sQTrvbNLfjzeMkZeu5AKphZ5vJauleO
	hSev/l1aKxIqK/WnkcS+NpVmT/Ol52Xh5H5Hx9hHa7J+/cs0tLN2MerxaPLl3rnfKDoFJoygeqs
	vz7t5a/u891BbLb2xkVSPy1C1jK6FkmwplSQH8IHMfwBgaTA/QH5+YqKKtd+ykFmz7Lf98hoHIO
	kWppFUI6Wmhq6KQ6EZo9JAqNiDYM3iDNVi/UdCoJ0qMO7ioWeLBkChdPVBqMX0DpO8vbViK9YwP
	Q1+5JnaGQMZjGeR5rs6CDWtrp8EJKDCulyVevwxTi1x2nkYLITNfN2RX9n/MNXtkBnRtFfLYWqf
	HfEe+mfcuJ2sh1BHfH/T1WXkkW0Y0r1Bwpk4n6HZc3bU8tjzEdsyPfANk2WjfLKSSUVOyvY2Jui
	4o1
X-Received: by 2002:a17:903:984:b0:2dd:c100:4246 with SMTP id d9443c01a7336-2df7e13c585mr80615525ad.42.1790477814644;
        Sat, 26 Sep 2026 19:56:54 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:52 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware spinlock
Date: Sun, 27 Sep 2026 09:56:26 +0700
Message-Id: <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_195655_632409_699718C6 
X-CRM114-Status: UNSURE (   9.77  )
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

Add the hardware spinlock of the D1 and T113. It goes in
sunxi-d1-t113.dtsi rather than sunxi-d1s-t113.dtsi, as the D1s manual
has no spinlock in its memory map.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
index 3b077dc086..228cc5c074 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
@@ -11,5 +11,14 @@ dsp_wdt: watchdog@1700400 {
 			clock-names = "hosc", "losc";
 			status = "reserved";
 		};
+
+		hwlock: hwlock@3005000 {
+			compatible = "allwinner,sun20i-d1-hwspinlock",
+				     "allwinner,sun6i-a31-hwspinlock";
+			reg = <0x3005000 0x1000>;
+			clocks = <&ccu CLK_BUS_SPINLOCK>;
+			resets = <&ccu RST_BUS_SPINLOCK>;
+			#hwlock-cells = <1>;
+		};
 	};
 };
-- 
2.34.1


