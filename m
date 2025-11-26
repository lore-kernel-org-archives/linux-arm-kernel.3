Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE60D10391
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lW1MabH8TwyvbabLyjolWKrj+twdSqiGH4BPvNSLuws=; b=4Z7vtUKk+HZumsXkuCdgQgjtlx
	Z+bWq2e3MT49MfbEy33JL/IZ2wN9NE9xHYSQyAKI4h0ePN66XKV4DI/smZYYee8Z2QfzIiGrFWb9W
	yDrItYRM/npou2KJpbDe89zYpJwwX6vY9KeNreNKrIjQnlb0ksGuXW7N8L+rDrjJ+v7Q+pnoipDgO
	eUicTlFmRBSIY2wvYuPu+dxPg/YT+uetgNkfX+UmB3rfkMKW4gNXCF8Wjt8VFBJxNoCadvPiNzTmT
	IOPNhxWrqa6LhOo7A0CpB6VwFhzcBothPys3lwlRNLOQc4AhXKFm9/yBiAW3o5GuMGnGbm44sZYyr
	YEBpHFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAzJ-0000000EcFj-03g3;
	Wed, 26 Nov 2025 08:34:57 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAzD-0000000Ec78-2ArK;
	Wed, 26 Nov 2025 08:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764146042;
	bh=lW1MabH8TwyvbabLyjolWKrj+twdSqiGH4BPvNSLuws=;
	h=From:To:Subject:Date:Message-Id;
	b=cmZAmiYdgkZ0t0LFMAoENMuyc7GJVG8+HxxG2lkqM69RPyDPjahXyab/kuY5BYWwL
	 35r+tfZb48ELh2Hw0CXf4bW/QleL262SiLD/kqf47dsc6rffSbVbsbbDHQyA9hrm3P
	 U3VUkCHvoXFlDJVsn9mLPd1wYSWmJTvukjPLJi3o=
X-QQ-mid: zesmtpgz4t1764146033t0aba92f9
X-QQ-Originating-IP: bmKFoRbntIb+LrnhcHZ68Pi2yQdiUGGadX6Gt3Q2ucY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 26 Nov 2025 16:33:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18429734964785922997
From: Chaoyi Chen <kernel@airkyi.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 1/2] dt-bindings: iommu: rockchip: Add support for multiple interface clocks
Date: Wed, 26 Nov 2025 16:33:44 +0800
Message-Id: <20251126083345.88-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251126083345.88-1-kernel@airkyi.com>
References: <20251126083345.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OUC5DGN0mB58EiYTCXLwCx4O6Mt2SNu9yYmtvI/GNU6dmKmYVAG44rvI
	APUIwVqZbLikZD1oUnGUuMFMvtDvdt2+nhXc8G+tbkgp3uxDs+zoEKwRlAccI4yXE5jHg+8
	hkF8WLgf3vzPiVRgvqDy7Dh4li6Fiulj9XACDqvNLHmPTsYyFafpvk8fnlYbUipQHi3Q7j6
	+fIkQF4DvDbMGr5Irep/GCIDbL5ZwDnNt36q7uPMj1Cwa9NHuDq1vapLKwIhfPIU9LDYR2E
	93zs5yoNHF1Fb18UzTYkIFyU5NsU4HvaiPXR3MnkTM9PQgiJ7BPLMbEwrFakB9BpIkQ+fWC
	XYrDDkWub1S2AE4bJWl4xmL6UgjZUiDtrBrc6f1i2HwpRLquXUupBhGWrzFe/X4PUBxoeV6
	HgavrR1WSO4HheBsnuyIYkZuiNgQNYCZK0nq5IYjLdp7041syLSNSVARLFaRobviut7OEiP
	JKATcAHh7Maqmdm+ToWb2/X5cW9FKWDrK+BvOtwv0Hk6nm5y8JXzJuhJQRNt2mhaB/3FNKL
	HXrWW1LI1kphB7H1z9JcAIrZkP6veYgpd4B9vDm7AI73bvf4UCDXl0whWax6OFwFIrilAtA
	oaI47R/38pcDR9qEmC3/0n509ROYs5VjgoKxoaVoqm32qMCslN+VX23GozGwvedgGZzh5A1
	cKesyFR1obi/d41vuGS8qxhVkQAQyb1lFDlQR6JoauwXAsruE7ochikUGsYEVcgfxAePMz6
	QN4ucblvLBxjy1oH1HfKePvw5MY79I/y/rvGtSs38ijcj43Qfx+Ac1iZ+uyYAbJTIioIHLD
	5g7ulcgiuAqDuEn3LQA8OynxA+WsPpsiUM/oSyzLrdLoyJ3QXxz/xgm0/OIN33tF1JlKYcN
	ZSFfh/i/oiPSNuQYHp+ZC2BQS8GliJw1nqyQyFxtgVD62XWS78CbH9FQHgfIh5Uafs9vZMt
	2x9OVuWg8q3T88hsSfbSAR2u0AGRaFIFOQAKU2lQs6BwrHA==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_003452_428713_B189F6D3 
X-CRM114-Status: UNSURE (   8.86  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The iommu found on RK3576 NPU/RKVDEC may contains more than one
interface clock.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../devicetree/bindings/iommu/rockchip,iommu.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
index 6ce41d11ff5e..11cc22a0b1d3 100644
--- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
@@ -42,14 +42,22 @@ properties:
     minItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: Core clock
       - description: Interface clock
+      - description: Interface clock 1
+      - description: Interface clock 2
+      - description: Interface clock 3
 
   clock-names:
+    minItems: 2
     items:
       - const: aclk
       - const: iface
+      - const: iface_1
+      - const: iface_2
+      - const: iface_3
 
   "#iommu-cells":
     const: 0
-- 
2.51.1


