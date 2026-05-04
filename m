Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648C4FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 22:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7FtyYayRHdvmA+wM6bGR8rUqY27QswE8bRLIQ06qZs=; b=v696Lel6PhcqB782/M3jd7M1GL
	rwtDOWDADBY82J1RyH2WCOLVB20p0wwBkPT6qOUkRm05pobXW6AqiNycBKFn5PP4kTLBz2XoB+mXu
	Nvxdq2ZhDMYxUivBTLjjzQH8bxO6Cw3i2XQst+U3bLn35+V6A7Ni4TYLBd6nZWcV5LsfQzQ+xhC+c
	SCWyutCrZfF7oG1Bt+pRSnBHqTLur0XnJ7ehNmrqZgIemafZLVhl0jAtoq+ua+kb21MiwI/VW0tGm
	ZVMzB96i7J/2AjNa1BRFXtlH4N7Him0kZuN+b4T6Lh4AWoYcIdcN5hfvkWH1V1UAju2o1TEvNqq+R
	x271ZeTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2E3-0000000EXZM-0wMZ;
	Mon, 04 May 2026 22:57:19 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2E1-0000000EXYK-0iu2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 22:57:18 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g8cV32w79z9tyC;
	Tue,  5 May 2026 00:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L7FtyYayRHdvmA+wM6bGR8rUqY27QswE8bRLIQ06qZs=;
	b=SHHnGGn+lFCMQhVgGFN5e0ACR4cODtNWuwnVIcgKMcah9FGg7Yqntgf+dK1pHv5ZdOsw5t
	7c8kq7yvCpuVyaSoFpqdFsz+7rKqUROmaT2aAkZbbpKHDD9AL25AV3dkG3nioHYAmE8lP5
	UmCW9IMoeGfk/T+AaFFkxt/k4ZVDrqhUBppD5gFnaXnfImrsUqtt1Kz9xb35rXc7baAtFJ
	HFIcoGADLE2W3tGkS8ah/Lbw4kJCULrArJYM8YPZFX9j9g/6tOA3FlS06B72lbHQIWNYs+
	oEsht74jlpAb9wJnT102unPK7jjAS1cQKrMljuNgVIaPlIy4UfcgxrxzJ94Fmw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=hxRn17UV;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L7FtyYayRHdvmA+wM6bGR8rUqY27QswE8bRLIQ06qZs=;
	b=hxRn17UVN+/bJcP32+5icClip4TdqFPhdNVG7uLmPNkt9bPTxrgfEBJJGT4Ot6g5GKewkf
	YAcJUiToTfSsKOVaP1GIDDcG99DRvu0sUCNBrmTiZ4W9Y7TLdyoNL32H6MtMyI4BRDsdO0
	hWOsr6hLOcafMKZA08J83P2181n0DA5j1VBxQLGxALwHklI2aAGxX/3NUO3u49YxfeySSX
	GYph8lZft5P52lcY5n/xFbGCLQu/A7G+ZP42Lf5Y/hPKjIVbDoA2rV1TA7hdIbvwr7V8jt
	JhHk3ctMOBCrORE6vy6TYYeFCnjciY+cdnnqMdk+fUWUKT6cb2F8jxErSx+uMg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: renesas: ebisu: Rename clk-multiplier to clock-controller
Date: Tue,  5 May 2026 00:56:52 +0200
Message-ID: <20260504225704.115125-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 02567093473d0a7a46e
X-MBO-RS-META: 6ypiz17pr7xcpwhpr6nwf7mm5nzs6zzc
X-Rspamd-Queue-Id: 4g8cV32w79z9tyC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_155717_354684_6D8689E1 
X-CRM114-Status: GOOD (  10.99  )
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

Use standard clock-controller node name for the CS2000-CP.
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/ebisu.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index ba564aa098661..add60324e0e4a 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -512,7 +512,7 @@ ak4613: codec@10 {
 		asahi-kasei,out6-single-end;
 	};
 
-	cs2000: clk-multiplier@4f {
+	cs2000: clock-controller@4f {
 		#clock-cells = <0>;
 		compatible = "cirrus,cs2000-cp";
 		reg = <0x4f>;
-- 
2.53.0


