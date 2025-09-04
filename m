Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EECACA101C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjsXB9GtSA0/12ALFU2tSMLdb8CpX05g3C10AjxVTEw=; b=NP88t+n4Mi1rCBqLrorawDPsYi
	5Hgr8sgiZLHhh4SIO/+CCcv4IeiBTFL4Wh2zidkvZyV+l2qr26AhtbxFXndiRuHxpQSYMXNwzWv0I
	7NZCMFKx/D6liq3Desu53kMVmnR304gjDjwkZXyWctxFtcINwf66aoGtLA/VGuMdoKPai/hrIjzKc
	RD97Wa5SXkL3/JGDhoYnwihh2wKNIlP0FBHMA9OsAb2HqPltMurbiKP6R58x27ojOw5pKmjj/k0Wj
	8dCGVsdIxL/d43BSmsRBxW8UyDEw2/9JY6QE11hlCv+n/i0L/WI0VuT6ItE3PmUx6ApVsMExX5KMi
	Vhn7whGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0x-0000000Fy82-0w6z;
	Fri, 05 Sep 2025 02:17:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEzh-0000000DioT-3eZQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Sep 2025 18:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FjsXB9GtSA0/12ALFU2tSMLdb8CpX05g3C10AjxVTEw=; b=ZjQ4g/bG/ai6IiSJglyqG2RwyJ
	Yb7KK3ov4cqcNIU3BAscHM6YFUHA9oEKMQ3wFZY8AG+cVvc2mZVoqE973JBf9cWyp46rY5W24sFpN
	/BNebgRKyHWLK/sFnSVHVVr0v5hpZITvStXBSb1aPgHjZHJNkYD8KbWvdGXF/GK+ArmD7YvAnWZIR
	B28jkTzOKlup0Z0i6wWMRs467caV95nxWs6BlSi7XukD3wJ77WAlfVYOzIhqJe/e/jhq1tni4lhVP
	0RjXJoB8cSRyyw7RvQupaYQ+HG4j0W58ALeWXEZlJvSXiWlpGhIIXDtm0isIFCeF6ZgHVLUPw7q9M
	Ye1ZaU1w==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEze-00000004P8f-0CeY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757011623; bh=BxCKEq0uM/EJgswLUSDnW7GxriZ/hFzCcltp3NmjuDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kdT30CI40M7OAK9KXsgUtvwVyhaL/NjiHARXGDTA4aDCNvQhRgJ91X2Ie4cQk2I7Q
	 ceIlL2QP+xdFVv8B3DNAe9gat8guCy2tgRsu7gA/kW4uaG+yRVa7fJptVJafKPK2Xl
	 JVEwVXpbX0p1sW5B3NPnFtMJ9CNPxgbb+x7TBUbdP1BKr2h3kwJqmDO1mlli7luenJ
	 Q0o81rYr1kcQEgEn2sKrU3G8ARfbHFptMtzgcxyZ0xVDBcU6zPWGpFNfFF9ryH9Agg
	 eup23eHAQBC2C2GGOSO31B7VIlPXTvdkMrE+zhdT4JllGI/qjVR9ICWChtacyNIim6
	 NWeORgV21Pr3w==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 36B263D2186;
	Thu,  4 Sep 2025 18:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757011623; bh=BxCKEq0uM/EJgswLUSDnW7GxriZ/hFzCcltp3NmjuDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kdT30CI40M7OAK9KXsgUtvwVyhaL/NjiHARXGDTA4aDCNvQhRgJ91X2Ie4cQk2I7Q
	 ceIlL2QP+xdFVv8B3DNAe9gat8guCy2tgRsu7gA/kW4uaG+yRVa7fJptVJafKPK2Xl
	 JVEwVXpbX0p1sW5B3NPnFtMJ9CNPxgbb+x7TBUbdP1BKr2h3kwJqmDO1mlli7luenJ
	 Q0o81rYr1kcQEgEn2sKrU3G8ARfbHFptMtzgcxyZ0xVDBcU6zPWGpFNfFF9ryH9Agg
	 eup23eHAQBC2C2GGOSO31B7VIlPXTvdkMrE+zhdT4JllGI/qjVR9ICWChtacyNIim6
	 NWeORgV21Pr3w==
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/7] ARM: dts: lpc32xx: Correct SD/MMC controller device node name
Date: Thu,  4 Sep 2025 21:46:44 +0300
Message-ID: <20250904184647.397104-5-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904184647.397104-1-vz@mleia.com>
References: <20250904184647.397104-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250904_184703_272661_597A05A5 
X-CRM114-Status: GOOD (  10.83  )
/bin/ln: failed to access 'reaver_cache/texts/20250904_184703_272661_597A05A5': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_184703_272661_597A05A5 
X-CRM114-Status: GOOD (  11.09  )
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

Change the PL180 SD/MMC controller device node name to the expected
'mmc' one.

The change removes a reported warning:

    sd@20098000: $nodename:0: 'sd@20098000' does not match '^mmc(@.*)?$'

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 761432673c39..c8b9d70e9362 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -224,7 +224,7 @@ i2s0: i2s@20094000 {
 				status = "disabled";
 			};
 
-			sd: sd@20098000 {
+			sd: mmc@20098000 {
 				compatible = "arm,pl18x", "arm,primecell";
 				reg = <0x20098000 0x1000>;
 				interrupts = <15 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.49.0


