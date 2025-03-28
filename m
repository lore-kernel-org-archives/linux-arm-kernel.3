Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66345C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 15:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wgTq6mwq2QNU5ld1B77ROt1rspCVnEsLzPlOaFMQ5qo=; b=gm6fEC7pVX+LojOWx9LNSYntPx
	Rkq/bQfWM+8z1di5/QrPWqbBBjrtzJ5PQoiIW5NTkNjbTERLBjDAu186I282tSmn2Bmn0IMpM0LrI
	3/w29xU3uZ0QHLv55mGZJdt64Js7I3722eo+uLsan2Kzju/uJN6dyDQ7dYFPcSeMG5AbnU8enFZzH
	5iIHdHFuz/AIxeNwu3OR+MU3kNKd4WfyJp4l1oudCsfmTN1i6S8jdMqV/WTRdkzGOINEa+TkJuPak
	NefyBhu0eFc9JQyXQRJAKIQXY+sSatru32IkIjNgQuw6Vlj5ONobBmOdBlbaoRsBxJG3pq3CtJq5V
	5ThnQsqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBEV-0000000Dhaq-2Dba;
	Fri, 28 Mar 2025 15:02:55 +0000
Received: from out-14.pe-a.jellyfish.systems ([198.54.127.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAZY-0000000DZm3-1hDE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 14:20:37 +0000
Received: from prod-lbout-phx.jellyfish.systems (new-01-3.privateemail.com [66.29.159.56])
	by pe-a.jellyfish.systems (Postfix) with ESMTPA id 4ZPN3G1B6qz3x6g;
	Fri, 28 Mar 2025 14:20:26 +0000 (UTC)
Received: from MTA-10-1.privateemail.com (unknown [10.50.14.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 4ZPN3G0jPQz2Sd0R;
	Fri, 28 Mar 2025 10:20:26 -0400 (EDT)
Received: from mta-10.privateemail.com (localhost [127.0.0.1])
	by mta-10.privateemail.com (Postfix) with ESMTP id 4ZPN3F61XZz3hhd0;
	Fri, 28 Mar 2025 10:20:25 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=framepointer.org;
	s=default; t=1743171625;
	bh=oFKlVEIJkzbevNVbC3MkyLq3MXtcD4FApIeE0ARhv1w=;
	h=From:To:Cc:Subject:Date:From;
	b=b8/dVB7PNLK+P5v9+Otf5pd+f4WzKsBcH5Fc1pg7vrfv3FuxNWsRzF9MMUSp8Lr9p
	 Uo3rNJIyIXwFvuVYOJ6tjoGraigBBFNvBbYKAJcDC4bSWmVrZeBhXh7POz+caem+dl
	 V8sLrKAX+yvaz+3LQGNsdJVQQtMl8svvu/Ipguu/RJn0ZgMeLvl8sU8ZgpVnCvjAzc
	 Fp8eJ3M5IGNaIm3dsnnpKmY9b8a6eiqpjtngmUGbtQxTM7lCZkh7TPIBuwHVHE9ukL
	 ovf1mn7YQsheFgriFLwTbN12UAW0EXfBDNOWWss0zFVUyZ/liWxz6Y2KjYTFr4hg2U
	 S/1y0hfcNn9Qw==
Received: from 65YTFL3.secure.tethers.com (unknown [152.44.190.141])
	by mta-10.privateemail.com (Postfix) with ESMTPA;
	Fri, 28 Mar 2025 10:20:09 -0400 (EDT)
From: Sam Winchenbach <sam.winchenbach@framepointer.org>
To: linux-kernel@vger.kernel.org
Cc: mdf@kernel.org,
	hao.wu@intel.com,
	yilun.xu@intel.com,
	trix@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michal.simek@amd.com,
	linux-fpga@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sam.winchenbach@framepointer.org,
	Sam Winchenbach <swinchenbach@arka.org>
Subject: [PATCH 1/2] dt-bindings: fpga: zynq: Document ICAP on boot
Date: Fri, 28 Mar 2025 10:19:43 -0400
Message-ID: <20250328141944.119504-1-sam.winchenbach@framepointer.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_072036_474068_E6A8429B 
X-CRM114-Status: GOOD (  10.07  )
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

From: Sam Winchenbach <swinchenbach@arka.org>

Documents the ability to enable the ICAP interface on boot.

Signed-off-by: Sam Winchenbach <swinchenbach@arka.org>
---
 .../devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml     | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml
index 04dcadc2c20e9..bb2781ae126ca 100644
--- a/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml
+++ b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml
@@ -31,6 +31,13 @@ properties:
     description:
       Phandle to syscon block which provide access to SLCR registers
 
+  enable-icap-on-load:
+    type: boolean
+    description: If present, the ICAP controller will be enabled when
+      the driver probes. This is useful if the fabric is loaded
+      during the boot process and contains a core, such as the SEM,
+      that requires access to ICAP interface to operate properly.
+
 required:
   - compatible
   - reg
-- 
2.49.0


