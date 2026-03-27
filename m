Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FC210BA45E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 23:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bex1hO3WMYeSCxBiwiXbZfxoHtDMi+nquBUcT0rGf8=; b=dTebmijez/p1RL/TRY29mwBU51
	YFecfN3zFqSd18QFDACwAQQsxUU/mklXcPY6SrjlQTHTLu8qcKIsU+C+BpfKF9EyxfAs75fQvIcRu
	OC8BsxYYgNR1rIc7/zfYSK+KtZ4aet0sXiu7BTxcBzwL5nsaAh6sXliE/3N3+yUVMLdS/Ox+AXLuW
	F0oQtZ+jhJ4A9Taqv3qoiJZylmuah9VaVA6BaGLrxLzzYfiujQWYsk0uNYtrOOB/3glJajk1Kzu6m
	ilCtRG7XuAWZrbl/X6Q/PsJAjnDwIY0dNGzzPVZA+u/Im4G1hlrE3QEbWdEkgZAnNA9uzvXZSwPS8
	ucxtoVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Gph-00000008KWZ-07hU;
	Fri, 27 Mar 2026 23:43:17 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Gpa-00000008KTr-1NZ3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 23:43:11 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fjHJX1ZkHz9tcZ;
	Sat, 28 Mar 2026 00:43:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bex1hO3WMYeSCxBiwiXbZfxoHtDMi+nquBUcT0rGf8=;
	b=hYxLEwowig8hDfdkmUVqZ1MFWBvzh4FdAYalK9wZGK7cCs7kO5LyTINCflFzggBGde9a/S
	Cti44lp1Ui6P9PrdM5k+ScaIivXk20z4vPhB8I3gY8aMNJVwlikUR3nocH+Syf7CFYCHsM
	7e36/fq5RwClRyxbQeeG5JrKN8l1Lp4XZsA7woovcGCr+AZ3oNM3L2tFOwaOOrw/3Inh9Y
	O8yNpVKHlrzrmVK8RQzGzQ4VId6dzlcQJR7NXNEsVQpO7k8lt+ONeEuhd0LY9bIB6z3Dp6
	I95euIFf4qv7/NmlqnljZtKfCWjNqoPJYltnDA2inuSFGvimK2HMDpDVWWbnVQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bex1hO3WMYeSCxBiwiXbZfxoHtDMi+nquBUcT0rGf8=;
	b=fLvx8Es6HS5jyDv3GRC/YvU7sKLQ4NKMg7WubinyrDPUsRn0i0YIj3B1SE0nj6Zb/XkYd+
	VPBo3LuoL169iKI0rDtlPhlC1FWCLCLm1HouYVVAxt2+1xhrRIeRgKg/jOO9mm/aKfr5ZO
	frgrAkoQ8OGfPcMZmfl+JIobtq6tMCGxIlCqZnfvAsA9uGkx3l14pxQqf5I+hLVVsSIoiB
	Wf3RQ6A3Ju6xylekwFlS0U3BRTr6RhiiVYkvDh7Ebm/WUUw5H+VAjPHruL9bQYXMeTXQAp
	4quxBXhd2+NrMja1ZjSph7e3q7/wf+Q7MNownypWSDpmCTI9/bl+shcI1bOHzg==
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
Subject: [PATCH 6/6] ARM: dts: renesas: rskrza1: Drop superfluous cells
Date: Sat, 28 Mar 2026 00:42:11 +0100
Message-ID: <20260327234244.91707-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: sab3p9wxckwoyiwimqizp6zzbfxu98oi
X-MBO-RS-ID: 0148749e24aab6b26ac
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_164310_507492_37E63635 
X-CRM114-Status: UNSURE (   9.15  )
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

Drop superfluous address-cells and size-cells to fix DTC warning:
"
arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts:32.17-72.4: Warning (avoid_unnecessary_addr_size): /flash@18000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
"

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
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
index 91178fb9e7210..3306bc9b7bc37 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
@@ -36,8 +36,6 @@ flash@18000000 {
 		power-domains = <&cpg_clocks>;
 		bank-width = <4>;
 		device-width = <1>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.53.0


