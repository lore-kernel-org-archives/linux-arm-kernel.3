Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB89FC5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 09:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G8dxy1bvw4F4ogJCbhIvSHrgPeuDdkx54rPLG+xIkQ4=; b=jLkXA2wkjRgAV/l/5tXq7C+IRv
	RHTaKPSphnsf/FpQ8RNMlMoGrEK1cQl9ohXWlNqlmQMqA4+zEHxI5wLYBbVNMvsYkfNDZvtJDdif3
	UdbtA5GOog6xI5c1nqH8zhNUlnLCnbx/8AIykDW8u9cut+Qc0m2MpNoKw1eUulNm60NdIjMrH/9NV
	hJCukI3efOFGqPq0JGn/dD4bxGSStMw0qdwYIsuVy+OnbyId0+7T8iU/K/cE0Znv+liLy4gX7h0HO
	McUCdBQKidB7SQGogoh4fF4K2MqysATShD0GPgkNfHKhKUWCqnT+rxi/fVFW9QOUakzk6PD2FqjZX
	2EvjeS9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcq6-00000009RK2-3Wwp;
	Wed, 19 Aug 2026 09:44:06 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcq3-00000009RIg-0voo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 09:44:05 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 6ABBD1D000B9;
	Wed, 19 Aug 2026 05:43:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 19 Aug 2026 05:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1787132639; x=1787219039; bh=G8
	dxy1bvw4F4ogJCbhIvSHrgPeuDdkx54rPLG+xIkQ4=; b=pogD0cbo4BfT/bFmTA
	VdeHIZQM83qZhoSiYZCd95KTqz/2mO4aYEvKbncI857KSV9pakY6SCtyvKEZFWds
	K314iyHVMfJXLYagdrUyUdelLKv8btdRsYVK0AV33umX0oZEzIoq+jjD29bckVxP
	Bk7bycfzHMZzfm5kbLMazy8cUPK8qX5rbVGN0eLrMWcuUXG1zZ8GfSKRSHcs97IG
	Vf++6SZn9bLpMQsRPFuxHFZhINhGy42zRXE9GYwcIQM0wMQUFbLal5FOw9oqxCkZ
	2T97vpams5aEOCk0wqvn5BjObMzDsGgS6dqISqfpJFr4CL8cxRYuqW8LHLj9uykl
	7Ovw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1787132639; x=1787219039; bh=G8dxy1bvw4F4ogJCbhIvSHrgPeuD
	dkx54rPLG+xIkQ4=; b=XEBz4Ovy2ZspS42Um5pCX1URKpZ3KOTzeq04Y9UoOHyL
	uUonVsHQrPp6Po7u2ryJFnpKGmQCvAouOIbSI8pTtypUd8Gs4VbQIDKCOonrX+Nv
	33uWZooA8Jn1C1yFyJfXG6Uy33u7c3H1bNt5FT6Sxvi3ZB9eq6RDv2iqO7ylrta/
	0ohUTBbLStlZ+LVBVdBdEyOamulh/ZdtqHAPmcwxbEnxjbGrKlM28fUe2+on019W
	F+6Obs1vGc7uuMrzY284+fX2wKdpUsHCNVG4FdS6/HRtVQ/aU0VGOHZSFDH6YWPp
	iQ0hqQnQxn5UUHOZrVeBtqvkn/5+6BCnVbhyfOaIOA==
X-ME-Sender: <xms:3nqFaoqHkDfcg4AiPTN4vLdtHC7pkmrGeAwNrNRQ6bfN1aj8rWQ8kw>
    <xme:3nqFaqccud70u3YVhhKRkbK0t2SySB2nm-8Gbno6wudZV0KnMwFqvF4tNnb3JiuoC
    6FlM9_Is2OT0Ssw4uos63UvDgWf1f52qkggG8m0pSj57hy926CqHQ>
X-ME-Received: <xmr:3nqFaol21CgE_iDqrPXCooVqCNOMuFYyPIGS4Qd8Or5r_Na9ZMfwvzaFgpliNo4DY5q3Jgcl0CFAcY0LDOYWSNYH9uqcZ_nV6pDu9Q>
X-ME-Proxy-Cause: dmFkZTEPfYnyGtIFwE+jLUl++h1B0Id3zsGtTrGerwUGe0iM50gDTu1HkwkqVDqeoFCzP4
    2V2C/oGc6sp+g8MBhg36y0zm5pDCKsBI4+0o+itdK7nn6vaMw7GeDouTr/g+nE834CgUHM
    1Ll4bhN4yBhCG6IxERtFDIHKOudrrgRldMCH3QLY+jyHOtB5nqGEOVfUpKUpfRm4z3Xexg
    FfeZrEI8N7Xdn1LNx9Qh8Tbf83o3ffI6dGI+lLXmPdscRqwbrvwPnUh/mpsrYXJBSIZMyb
    M3nQCsg0oLnaQOkGQydNb0e+BKVpUvGdgj/e12B3NH/NYQwbLB6hX4XaLc+XshDFxITsXy
    GxsydLNsfTEXHpxtMS/nxRaj4MOv8jq6S22APTuFM9AMRCzghJhd6CH8VgYizRvqogLoOX
    fkQuoW2ZhM5DBXW2t2MRkxcGfA7hS4V8yl6ClxGu5g7NSz+o9SpWyNBtl24NcYm4oehJoz
    HcPW4OHckWfaaa6dZwx3vA42r76jdIw/hfROlVAxfT7P/wEqyzKGeUQT5F4XlMgW4Cyz5O
    Ngu8KewzIpWxVT2ck0k+867Y2PRKyKjaBzOu2FWJ+1A2psQV9s6SMKP2eoMaOw3VEYCxW3
    8hf0EGqLWTOtD7cAYnC2P+fRtViU0MGd7vtbqyBtsarfAYVUG9HhdcF99Kdw
X-ME-Proxy: <xmx:3nqFapbL74sBC44ialZstIPpUVzNOQfF_WdDGbOalYULubwxe_FPgw>
    <xmx:3nqFal4J1Q5A11_4Al1sMyni3hRuE9387EJ4pe0O_t-LYPMkSE1zjA>
    <xmx:3nqFarBCxgg2QRrApKcEjBvbpKbxbYH6ET7TW8-WUJ2i2BoqCgIpwQ>
    <xmx:3nqFar-SLcAWqOggthX7Fy23Q42grRedeXmm3TxzrwVaMQ2vjV-7Sg>
    <xmx:33qFatsNEq-nUqrWEWWFkwozVTIWu1sURRtGURTiuCg__ENeD74mEkyp>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Aug 2026 05:43:58 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 19 Aug 2026 11:43:43 +0200
Subject: [PATCH] arm64: dts: apple: t602x: Add identity dma-ranges mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-arm64-dts-apple-t6021-dma-ranges-v1-1-a00e109640f6@jannau.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2N0QrCMAwAf2Xk2UBbRzr9FdlDtJkG3CzJEGHs3
 60+Hhx3G7iYisO528Dkra6vpUE8dHB78HIX1NIYUkgUhnhCtpl6LKsj1/oUXCmkiGVmtJ/ueJ0
 oU07DMfcMLVNNJv38F5dx37/7gnYAcgAAAA==
X-Change-ID: 20260819-arm64-dts-apple-t6021-dma-ranges-bf676728374a
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=jIVm9jmB6LtdksOtq1LbIxXUgWuIi51D3+VNabMcUaw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzWqjsr1KN0P/3i6r7k/vbEzmLN10F/SudkOm3sO1tx3
 l9s0q1dHaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACZyTZjhf2rUi94+/22X5URk
 P54VSngfPHmu19THPzbu37PDbJEGZwPD/5x11y7X6NxPvOcbW87/bPVLi3Xn29LYXj59/NXBxfp
 IGzMA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_024403_710389_FF01F2EC 
X-CRM114-Status: GOOD (  11.12  )
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

From: Hector Martin <marcan@marcan.st>

Without this, the OF core ends up limiting all DMA masks to the default
32-bit, since that runs before drivers set up the proper DMA mask.

Skipping the highest page because it is impossible to express a full
64-bit range in the DT.

Fixes: a8f20eb60788 ("arm64: dts: apple: Add initial t6020/t6021/t6022 DTs")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Janne Grunau <j@jannau.net>
---
Add overlooked "/soc" "dma-ranges" property for t6020 and t6021 missed
in the initial addition of the M2 Pro/Max/Ultra device trees. They are
present in t6022.dtsi.
---
 arch/arm64/boot/dts/apple/t6021.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6021.dtsi b/arch/arm64/boot/dts/apple/t6021.dtsi
index 62907ad6a546..1da3c42f6f88 100644
--- a/arch/arm64/boot/dts/apple/t6021.dtsi
+++ b/arch/arm64/boot/dts/apple/t6021.dtsi
@@ -28,6 +28,8 @@ soc {
 
 		ranges;
 		nonposted-mmio;
+		/* Required to get >32-bit DMA via DARTs */
+		dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
 
 		// filled via templated includes at the end of the file
 	};

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260819-arm64-dts-apple-t6021-dma-ranges-bf676728374a

Best regards,
-- 
Janne Grunau <j@jannau.net>


