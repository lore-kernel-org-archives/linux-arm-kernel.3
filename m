Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6234C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRAfoNJnV/FXYtma8sgiRLfOSsyrmnj+IEspkpPkyMM=; b=GrIVuGSYCeH+o2Lz9jh7IJsvZD
	/FXgmEKjsK0KVXpZGkVidmLXQfLBnsUhscSQtl8i/EXuwIetbm4TdKMk8bNaPxNP6g/qQQfKL+KSh
	33XSb5a6wJhgGKFThpGEpw96ooFHktfwCBhweKTf7Gi228lg0x8118VJQvTU8fXNi7Mc3h/BpgCQZ
	7kiCrdUR1WkOzWW56vLnvpuUBMYsRaHvxnDcICJeuiT9S9rNtf20FpIbMOI/Wk5vPMdbVdSyd35l6
	ldikJUpg+8DX/+nYnfN+LWy4zgwjnE+9w8OKGwYsXbrRnlUsRHA0h5/BgKCAEyMUHknekJPgAnUzg
	6uSXmSbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FWy-0000000BQ7o-3Gcx;
	Wed, 09 Sep 2026 10:27:52 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FWg-0000000BPrM-1aus
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:27:36 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 978311D00089;
	Wed,  9 Sep 2026 06:27:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 09 Sep 2026 06:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949653;
	 x=1789036053; bh=WRAfoNJnV/FXYtma8sgiRLfOSsyrmnj+IEspkpPkyMM=; b=
	pMbm41eLkONXLNUxB34upW8UVx14wrFEQ3CZH4hXjIupZnYJjremvJikqeE3xm+s
	VdlOWXlb3uJ8T/twf5DMmZrZ0mwcn9ljlu0bz2PMyru7sI4NWb9NWuGqKXQCy1e/
	wn26zIPHFoV5QG5QKs0DS0yxstXRuY2jyNe0gXlycOX8vYoKf9YucM3L4KFYrL5W
	ERQKcSZE9khe/1POjwaaHF0CqjD9XHSBqzr8GkuznPt59ytBzVwtKCWbSV/8NpeZ
	uLtHDeXxgMHGQuP0eWTRe303SzdZAbkzrUct9xJ4AvjFUIpSj6a7MnPvl9NYKLZ2
	mbL2oa5oscHL9bGmglWThw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949653; x=
	1789036053; bh=WRAfoNJnV/FXYtma8sgiRLfOSsyrmnj+IEspkpPkyMM=; b=s
	OP2yPBCREi4ZWPurvsr0kaUB1u0I+dLTziXP8WvTrUjkOajYBCf3O8PrhT6Glob9
	7kmUXkdNcQFUO3dlF92bbf/G5GwRCBDjObwIqJ4HjZQCgiucLJsks/DWh4kab1nC
	5Wq/iy4GGZnfrGYqWqWUpmbMN4rMug/PHNW6dhGAiyX5eWPrG6FaEC2gsa0bKmwg
	FPXQzNl9zOYN3YmjGBLGlwA/qykSHuoZvXX4vKr+Czeo0cxNvCG1RFXuGiZQ0H5w
	FaEeMxFXp6shFGbqiJQIOCjiFHS55di0nAiaC6KIuwF50IbNuuz87GIWQTcXFEd2
	891db3HqWlIRHkemkaTEA==
X-ME-Sender: <xms:lTShan3CmrG4F3dDzQnmHPuLCJLllwytRC_9FpXowKdS9QhWwralhA>
    <xme:lTShauQtTx2w9drIiYd72z9TC6lNCYgicNYkj9pjTwlIKJswJeeYpLKjquZKcA35u
    g71h1L0MgP14FAfEsaJjrdiiUpKJGcWWfAtpvLaaA_DfKwv5cttu6tH>
X-ME-Received: <xmr:lTShajcknC1_z3070YwZJU9hjsANX2Nu7FpEAZ61AFVfUEPWAQUmCNPbkl0-nDbMBDAYdQ6c_yPn1kjohEUAoBToAiFj_s4DXTPw8Q>
X-ME-Proxy-Cause: dmFkZTGrfMJS/BPnzvFtxFWH7T2NvqB5iRSUYFltsQYoqh91AcAlEZdgxuHZyrYLq3kEOk
    j5wvhkqN1OKl91HrWXzjjavcMXmgvEWC1tfNMr6YyuWRD6//RUDkmVO3/ATEajCWyfZedL
    8sHEPefu4TqdYPDdk53dU84dTpDQmvitB4Jd8BhRBQx2FhHfLph5+6E9Uyo985vYlfK3rV
    DNGLSCjFuasa5/IY8K3MZyQs8cwzlsSAXH1aJt2liMZr6UglJb7lvyAF9z6AbPEzIyhVzl
    HRoRmsqTYvRh/nPj5OrrpEMagZdYAssoR8SKXOADJ0/HyjV/ybNJdeD0QwSSZATBimrjpI
    UCKcJmItRe2NjpHiMUv5a523SN99uxtg6qT/HovKVcWqwmkUptyUKroXMczHil9kEVFS7e
    vFr19Sr1TuA2YJIXEnSgmwErnChntS5z/NVxu35/TVgENcjRuGhTEVOEYpeVcZ9hCQwmWI
    QRmcrix2sUa5YbBB8KJaWyvn87t2XOEpAiY7Drs1iy+Sahe0KV/YBK96MoqDHwv8ZEvbeB
    OD7hp9a2oyyM2sEtqowfYqCdWyXwLXhX/v+e1xQIIlkyqM4PvG67RUEKsUH1dvNppiOrxq
    3/IBOpd7iBnaux568QDkApEehM/fMttjjsHxJTnqzBsyokpxNr16RVRDyM3Q
X-ME-Proxy: <xmx:lTShandbMSsRfa5t6cJGP-kTwc82VzzdyjND5dD92mEjE7FOVLE8Jg>
    <xmx:lTShal0fMzejKH_3JwN2Kd7Cmb_8qrfsTmYHWLhUjYIngl53rzcxsQ>
    <xmx:lTShan-7kvUtMo3ECYjBDUyDGnpS2T9kZHAQbnMaOOaZzaYzz3hT8w>
    <xmx:lTShai4KzS4jJMykE4KM84Wnk5r68GHAjSZnUasyzqH-TFi44vaenA>
    <xmx:lTShal3e2ApTr8kRnDUC3i08HpRmn7dhzwJZKuvQ5hNTF41JoMo60p4v>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:32 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:27:07 +0200
Subject: [PATCH 11/13] arm64: dts: apple: t6032-j575d: Remove unused
 "framebuffer0" label
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-11-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=809; i=j@jannau.net; s=yk2025;
 h=from:subject:message-id; bh=ZYi3ds7um4jbfI8F97PWxe2n/cHfW8BQaw1H/6YJCyY=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJlX3Dk43y3gQc2uur2HV/ZLf/7UTr0wy6tjk8iNf9
 Yrt0UNnO0pZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAEwkeDHDP83yqmZZw2lCfY0y
 iYGyq5v+npibK/D5a0tf/r6yqvzpaxj+GRh0hWRHfRNcnTffUHpVKX/xqtqHfNN3TV1fVGw30YW
 PHwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_032734_887543_A29CC494 
X-CRM114-Status: GOOD (  10.20  )
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

Fixes "[unused-labels] label 'framebuffer0' defined but never
&-referenced" dt-style-check strict mode warning.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6032-j575d.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t6032-j575d.dts b/arch/arm64/boot/dts/apple/t6032-j575d.dts
index 1c4a0fc9bd6f..e83fdb5d8c86 100644
--- a/arch/arm64/boot/dts/apple/t6032-j575d.dts
+++ b/arch/arm64/boot/dts/apple/t6032-j575d.dts
@@ -26,7 +26,7 @@ chosen {
 
 		stdout-path = "serial0";
 
-		framebuffer0: framebuffer@0 {
+		framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */

-- 
2.55.0


