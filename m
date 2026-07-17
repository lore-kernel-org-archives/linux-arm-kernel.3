Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C05C4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 06:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bB0hJT3PmFV6VVnpy+wEn02P0C7IyJ+v1DOMySWTkaM=; b=Lx/bHDZQVbzthZa3cFOVgdBorX
	jOxIsP6b1R+DvEu9bk1GHqF8R0CyyOnC6QSwKDlwZZREBgCLvFLneK6xSqdpuylnX9JZpd3ZuGRKY
	LDElPln/NpXYYvVlgCzKCUpBfcj1MGuR/6rUkyYEV9Zk7UxHDECEGMZGVWGjvykfb1BWv4cMiZ0oJ
	tRRCX8TDqB5d2WmLqp+KcWPtMB9+GqcJPZ20wi+zOtVcmL3w5fxVUrEeyIUCKqi2pVZZaUlHCB3YI
	F4mTcp5tn7vJsLDMuMf9/wwuOqlTHl4+eaEQR2I1tc1qSYNvCgz82AXjDKH74IDUGFiUZVXXiTrR0
	SrtHa1tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcY3-00000001LK0-1SUX;
	Fri, 17 Jul 2026 06:59:51 +0000
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcY0-00000001LI9-1H6a;
	Fri, 17 Jul 2026 06:59:49 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 5D9F813002DE;
	Fri, 17 Jul 2026 02:59:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 17 Jul 2026 02:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784271587; x=
	1784275187; bh=bB0hJT3PmFV6VVnpy+wEn02P0C7IyJ+v1DOMySWTkaM=; b=m
	nNopGWtRx/TZ3ipyS7ZgadLWztrAY88a9a9t9bP5NNNakIIaKlRrisvr4IfshX1N
	rtkkYeSxJL/blDwfHo4kLbZrNGNNExHLg8meez0V1UqmryqsP5SejSH+Rnlcnr0h
	jf1l/v3FNy0iXEe0eSwFYsISdFJCiUVmlwL9A/jav5h2mxBiUi+KyQMXiCVTc1d1
	lNFRPurLvYseJTgfNcZccP8icpAMyps1IFOoMcvKZjTj19Dva3aY204HBXfRYRpk
	jABXhaAguliYopWjACTl9ee8jFgmJ9renRRSsEyLeX144AegPXKr29erNxKYFdGQ
	3AsukKMrsi3RFsSKfKkWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784271587; x=1784275187; bh=b
	B0hJT3PmFV6VVnpy+wEn02P0C7IyJ+v1DOMySWTkaM=; b=DNp8sgxOisMqXWP0d
	gh2o5DqMVCCpuCG19v+Psr6hDgBpObq2UgYBGItf8+ZxAJEVhyfWqPxYZXink3rO
	He7OGIzmH6/vdsXhfilfBdT0ipzJ+PxnttsfiImAGWAOn004ss37UjgrK8VvpMtv
	ycKjBc3+3wZjH2mB94UKIgLqN9kDKY3DOCv/E7Or/k+rvPcCS8cy8IeLC24xNoX6
	Z8/GmwygtMbC1fkVjx8+/At6sm6McKp7KPr6EZQSAYM9p8OonoTdvC2vVx16PXIO
	hSXCO+OTGO0u4E4TjhrlFImuJCXgW1Liwb/zjM5QYswb5bVf3l/97dHYNEC5wIIE
	JxKxw==
X-ME-Sender: <xms:49JZav7m4g3e5ZGmJvp6KRmLFuquZLJhiBQAtUbYdH0na_ym0VzZEQ>
    <xme:49JZaqft_66k2PJxS63uNWEgj97vuFOLdL8tgp_4isX1oAWNAjcYHvn9r5Xsjw9Gi
    4TDOmQvYxSc0RQ0FqiG37qshGGYQJuuGGS66HnCqP0Thg35suxt1Q>
X-ME-Received: <xmr:49JZagDCwW4bZ3WwmpC9JoaVNQcoCHmUjVcuVhRldtbQw-Jbr6mMyM4GqgthYv3bNzKA1-bu0afOxN6g2WA>
X-ME-Proxy-Cause: dmFkZTGLHoAYSuSv1o2npO99y2j4JkxLBJgWvGtMoWzVR091WtPJ1Xci9p6O9uorqIXytS
    qgiXLBX5pDi0cPzeDICNt6t/BjVh6mt6bhnC1C9CdJS3gO9mNnV/Rt+6btcqroSenMILop
    voSGMzPtXFidDk7Dp2YoPeT50jUo5Q3onDmNotbFDoLJF/D3BCYCo8e2eP7pyPHIz2TSZC
    jsi6aJHydnCg5nKTF+BekS20EeckpNO8KO0n0tfCCCM8qMgu4tlj8ReyNRU5j9Oz6Mh4EJ
    V2sIjpMsj8gCmoVqK3xuHwBHpYYmhbaxejpxfiWeEKyUfqC8zJxs1qeJl6zVpKllXpKBtI
    qpGNbwJnO1qGqSrA8cjy5YTlpfntk5Bff0d6uANOd1uTii2R5XMaX+zeWLVdmK2sAm8TAS
    nQtymLeDn3c7CBER+Y09MMwqH0AdHriOebrd29I/pq+Irx6vQ/YrjxkaGLxKiHMxWfpHaA
    OK3alGrWTqf1HEqn0BFAZxd+egDlqNdLpXTtc2Gbt0KRHnFdmRvG+C6QvNIzyJfw4+hJQA
    5NrBvqBwUQkghcIMkhk7TecGYFy9UqcRQcqCuNyP/LCw78WJ5tuqKDO4DomS00JDL1YPB5
    XahK/0QBsJD5Ik9toHV7UTVmNLFO+9yunbU00FbnwCjRRniGRLRVdi14ka/A
X-ME-Proxy: <xmx:49JZahDYUfS3YTJ5aEefE_os4bitQ1k7-wFFJFK0Om8pBLpPFBxSeQ>
    <xmx:49JZaqZ6sxN18_wxsdz2PfPv8PKCld6Loo4uKixvkRGUGoxoGqPW4A>
    <xmx:49JZamyoCnruzwiX68UjtNkHQAuWSUMNxv3tlk-tMsLGBymE6xBRHw>
    <xmx:49JZatf7aUVExbWcxVSLJzosEjlJMz0PaVMh8ZcQ4AJn6xVHAS1jTA>
    <xmx:49JZav-0Isxq22KmnceO-B_5iyATWYwqsp5AfdSKOc8umf1C5V9oQsLh>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 02:59:42 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	heiko@sntech.de,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	maxime.chevallier@bootlin.com,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH net-next v2 1/2] dt-bindings: net: rockchip-dwmac: allow output clock_in_out for RGMII
Date: Fri, 17 Jul 2026 18:59:32 +1200
Message-ID: <20260717065933.2629501-2-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717065933.2629501-1-gahing@gahingwoo.com>
References: <20260717065933.2629501-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_235948_387232_27B68169 
X-CRM114-Status: UNSURE (   8.81  )
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

The clock_in_out description said RGMII must use "input". That is no
longer true: an RGMII PHY with no crystal can take its 25 MHz reference
from the SoC, in which case clock_in_out is "output". Document it.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845..d5816d6dc 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -89,8 +89,9 @@ properties:
 
   clock_in_out:
     description:
-      For RGMII, it must be "input", means main clock(125MHz)
-      is not sourced from SoC's PLL, but input from PHY.
+      For RGMII, "input" means the 125MHz main clock is input from the
+      PHY, not sourced from the SoC PLL; "output" means the SoC provides
+      a 25MHz reference clock out to a crystal-less PHY.
       For RMII, "input" means PHY provides the reference clock(50MHz),
       "output" means GMAC provides the reference clock.
     $ref: /schemas/types.yaml#/definitions/string
-- 
2.43.0


