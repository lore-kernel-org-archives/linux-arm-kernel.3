Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A51FCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 08:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w54rylpqvZxOtu6vBLjzygbQwC+AQb1+S0Muy+S1djc=; b=DlyGRZamrtq4D7iQTsVMV5JMjP
	A12wYc7SWSqgH+mCw4ud3Yp/N63x/HOKFEmCgef0a0la4HJTq+NFynte+f52W7yIIvid4aYd/XYyz
	iiHuSgyix2NIAkWrTP42sOnoldh1+BOZdqmM0/oH5mj6gl3ivvFdV29HyVRpAP/l2XUToM7Szck9j
	9vkdOmtwxSmOj3FzrA63fGe444wYZ0LhWY3kPaYZ/kUcslQs7t4abZFVPy40dS81iI0ctD2p4Gpk8
	U2EEu0GMfGftQO5//z50oqFb69mKhAT4OL9HCuQ8OgAoHePWkzVx8sLCkIGRUGOTTL3etinRnNW/i
	sJNnnMJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHeCH-00000002nFx-0vmP;
	Sat, 08 Nov 2025 08:21:21 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHeCB-00000002nBK-25P1;
	Sat, 08 Nov 2025 08:21:18 +0000
Received: from localhost.localdomain (unknown [223.166.92.44])
	by APP-03 (Coremail) with SMTP id rQCowAA3texL_Q5p20b2AQ--.57722S2;
	Sat, 08 Nov 2025 16:20:36 +0800 (CST)
From: gaohan@iscas.ac.cn
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Han Gao <gaohan@iscas.ac.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Drew Fustini <fustini@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guodong Xu <guodong@riscstar.com>,
	Haylen Chu <heylenay@4d2.org>,
	Joel Stanley <joel@jms.id.au>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH 0/3] riscv: soc: re-organized allwinner
Date: Sat,  8 Nov 2025 16:20:22 +0800
Message-ID: <cover.1762588494.git.gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAA3texL_Q5p20b2AQ--.57722S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYC7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2js
	IEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
	6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72
	CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7
	M4IIrI8v6xkF7I0E8cxan2IY04v7M4kE6xkIj40Ew7xC0wCF04k20xvY0x0EwIxGrwCF54
	CYxVCY1x0262kKe7AKxVW8ZVWrXwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUJManU
	UUUU=
X-Originating-IP: [223.166.92.44]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_002115_927268_C3D67318 
X-CRM114-Status: UNSURE (   4.73  )
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

From: Han Gao <gaohan@iscas.ac.cn>

Allwinner currently offers d1(s)/v821/v861/v881 on RISC-V,
using different IPs.

d1(s): Xuantie C906
v821: Andes A27 + XuanTie E907
v861/v881: XuanTie C907

Han Gao (3):
  riscv: soc: re-organized allwinner menu
  riscv: soc: allwinner: d1: use the ARCH_SUNXI_XUANTIE
  riscv: defconfig: enable SUNXI_XUANTIE and SUNXI_ANDES

 arch/riscv/Kconfig.socs                | 22 +++++++++++++++++-----
 arch/riscv/boot/dts/allwinner/Makefile | 20 ++++++++++----------
 arch/riscv/configs/defconfig           |  2 ++
 3 files changed, 29 insertions(+), 15 deletions(-)

-- 
2.47.3


