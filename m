Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1377910F287C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 23:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYJeCF0nQl7zb6MrpSRiPjdvriFm9do248PLZ8Dx1kY=; b=wf4nKF+HBAcDu4G/xMxx78FKF3
	3E3cwQGpD6q6HNsyH2GMdRL7wQSgGjY4z0eUCJke+ZVZpaTAr5u0dGzh/HeCIuapeeqlqdMyqf4Z6
	BgQ/fmzS49wWiLZmqbaYacuiDLetSDPXSkHzr0iEGqXetbFREi4JyCgVRcL/ZElHE4+S2lCZlxn4I
	crMGUuKjthM+L2FuFNE2AfRlZp0alxPlC5IDBMSkU6poUmeRfYVItX0nSQj0Eu/9SKBv82Ccvh6B2
	w4OxPBPI6jtXdUwdAW4bAmmbZdSNDlbGjZPt0X9PKR1Hk9IVSXK/09K5E6I8iMjKzLTkQ2NlxgG/L
	79/rnPJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Gpg-00000008KVN-0Mvw;
	Fri, 27 Mar 2026 23:43:16 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6GpS-00000008KQA-3kw4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 23:43:04 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fjHJN6Klrz9swL;
	Sat, 28 Mar 2026 00:43:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AYJeCF0nQl7zb6MrpSRiPjdvriFm9do248PLZ8Dx1kY=;
	b=h2zIHxoddhXiROdSWkj1sd/PxanJr89alb6KUZuHSZ6+T6VH0G1ZwFXsy4lMA7USc1gqSQ
	WhAQem6P1qFe6eHSq2XkhPB6b4kDHRy1iBxV6AbxFpRo6O5aFky+llMs8qJnD9AofLp+sF
	Xl5DgldfdCkATTXleJ93H3W7Ok2XmK8kztf95ftjJL1zI3G2QSSF2rrltn4Azy6wKeIdou
	d68ZujTrDd+H9WhncSGFhlygv8BGpcnyM0UEhPqFCyGTFYflg1f0AnsB1dBbgDuKoiKwR+
	BZlNWWRUOOOyacLKstxUKnjawADihByOP0qzSubOUIzOo6hvpuT8dP8FMQdJJQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=pvdm50wL;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AYJeCF0nQl7zb6MrpSRiPjdvriFm9do248PLZ8Dx1kY=;
	b=pvdm50wL9FtQT+RoI4OHp5SgIqEjO1KOLeJx5BuSVN77BTj5mXBUPtZPZasL+PIx5vofde
	heX+ET+eQpUxaI59FBYqc2H6pwLB/SG45R8W6pWeKinpbMe9EguF/LlndASuQmHrMuqpvw
	mT7TDftROD4Aq006gbyPu+1flcjf0U7DzdClRVHFZ+z8OxABRrvV0d279yJ5Jegjgb8WBI
	fWNbLHBBxssIapLBJ7qW/xhDTGptDnOareHFD716un4gLd9ZTMjtMlLU1mpaC+pDJTgSOe
	2snLPgpr+Jg1faQy7pw0o8IuAdzCeoG8bDMSrG8TsGvzB2Jo39KfaSIFQI8xbg==
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
Subject: [PATCH 3/6] ARM: dts: renesas: r8a7792: Add missing unit to bus node
Date: Sat, 28 Mar 2026 00:42:08 +0100
Message-ID: <20260327234244.91707-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: jp5rmwcdfn34synzjd7jw6hkjcg6xh8k
X-MBO-RS-ID: edf64275894b926e806
X-Rspamd-Queue-Id: 4fjHJN6Klrz9swL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_164303_075927_A4A9B3DA 
X-CRM114-Status: GOOD (  11.47  )
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

Add missing unit to bus node to fix the following DTC warning:
"
arch/arm/boot/dts/renesas/r8a7792.dtsi:89.12-94.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
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
 arch/arm/boot/dts/renesas/r8a7792.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7792.dtsi b/arch/arm/boot/dts/renesas/r8a7792.dtsi
index 9e0de69ac3a3a..fbdbcff1cbed4 100644
--- a/arch/arm/boot/dts/renesas/r8a7792.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7792.dtsi
@@ -86,7 +86,7 @@ extal_clk: extal {
 		bootph-all;
 	};
 
-	lbsc: bus {
+	lbsc: bus@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.53.0


