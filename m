Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED73FCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EC33gfOxrVx9yOb0T2q7v5jSsm2pb0hI95/MIeDFncQ=; b=ZLPn0/PQwo1gSssyfboby3U2Ad
	DLmYRhaL8yQiu/+A+q/SzH2zchKUzpXOd8K9xOeFSMQNUhJ2g2i4O0fj9yUXNmjmfPnCnfXYggS9p
	opZl7Af0ZbIxiY54T6xwW5ozyNYWEBQeI4nkgsGQjQU1JxPNk4WCDCqf1jR0EgXn4qFP6SRfzfT8Y
	stlC23gOb4YMqIExoPnfdnkDhStp/kdyDFUBGiEjlSqcatv4kpOfzHI9jsRBkfAEe+o6d3oopgDcC
	mnqs8mAANrzSZaHoZWI9u6Bp96/mqfUF6czuKuAtUoEbq3C9JjVcwrUhW4NzPwYFNBw1ulOt2lerb
	yvWER+aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0y-0000000FyAG-0l0t;
	Fri, 05 Sep 2025 02:17:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEzj-0000000Diow-0ldB
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Sep 2025 18:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EC33gfOxrVx9yOb0T2q7v5jSsm2pb0hI95/MIeDFncQ=; b=pp8+MY5M5p0V0eoVr7AyJnfDq3
	AeBeAaQWVWTadlRVXsjLajFwuh/H1X66Hg5EbwBXjDROhOJdQB+1ZIdUHFEJrEr6G+KnEd9UUXJ1S
	M+LSHZVixVifkWDnRzIubageOyltAyn6uwNbfbCyQEPuabqpobGMujOxHoF1HSdEtq13fPQeyNDSq
	J4LQH4tfuv74UE1UmtUb996Hr28/aHipswM+mT4dDQohr+srEtkVzA8XI63tmCmbXYpYWkrmRXYfE
	aa/ayo24WbPk1VoC8xQ6+dUagdATR65Cv2i/DnlrGi/prU84Fy4ZnDVhbmvhwY/9y7hUZJmB1ZRp6
	khiUSGXQ==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEzd-00000004P8e-3hPP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757011622; bh=RDKiARPNmJyZNUSFcqc4mw/jzkpd7WdgnK9xER2DNII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OG7hviRDiR+8f7oOh5rw/0l8ZHUBcSh5fPMBYWqalyUu2k8EJSHbX+VKJ3m+7tOFz
	 r4hCFezb+9J8MAK5AEOtyjyKQ+fuB+oa1L2fLE2uKOJXAt97WFPn602KR3bbsBqTcC
	 hojsBwrPDQWcTGtv2Rm+/E2ItUx3AStiNSgQBaZUM21Wh9BcdUBeFRhv5oZg4zj+T2
	 lhqEWH09vg7wDInD5LHcVnIwb+MS0Z+nmoitmMkd1TmWlG9c0VwsOFA0LiHHRdoxOM
	 QbtHkNvjW+9czLj96BBOEqLdBF4BRuhjSY14QGAsWgS5gkxNyGkjWmXMjF0B9AW6TB
	 iFfpioVqFQFag==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 993083D2184;
	Thu,  4 Sep 2025 18:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757011622; bh=RDKiARPNmJyZNUSFcqc4mw/jzkpd7WdgnK9xER2DNII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OG7hviRDiR+8f7oOh5rw/0l8ZHUBcSh5fPMBYWqalyUu2k8EJSHbX+VKJ3m+7tOFz
	 r4hCFezb+9J8MAK5AEOtyjyKQ+fuB+oa1L2fLE2uKOJXAt97WFPn602KR3bbsBqTcC
	 hojsBwrPDQWcTGtv2Rm+/E2ItUx3AStiNSgQBaZUM21Wh9BcdUBeFRhv5oZg4zj+T2
	 lhqEWH09vg7wDInD5LHcVnIwb+MS0Z+nmoitmMkd1TmWlG9c0VwsOFA0LiHHRdoxOM
	 QbtHkNvjW+9czLj96BBOEqLdBF4BRuhjSY14QGAsWgS5gkxNyGkjWmXMjF0B9AW6TB
	 iFfpioVqFQFag==
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/7] ARM: dts: lpc32xx: Correct motor PWM device tree node name
Date: Thu,  4 Sep 2025 21:46:43 +0300
Message-ID: <20250904184647.397104-4-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904184647.397104-1-vz@mleia.com>
References: <20250904184647.397104-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250904_184702_662194_C3A1B3F4 
X-CRM114-Status: GOOD (  10.35  )
/bin/ln: failed to access 'reaver_cache/texts/20250904_184702_662194_C3A1B3F4': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_184702_662194_C3A1B3F4 
X-CRM114-Status: GOOD (  10.62  )
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

Change once a customly selected 'mpwm' node name in favour of
the expected 'pwm' one.

The change eliminates a reported warning:

    mpwm@400e8000: $nodename:0: 'mpwm@400e8000' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 916ab38f0a4c..761432673c39 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -298,7 +298,7 @@ i2c2: i2c@400a8000 {
 				clocks = <&clk LPC32XX_CLK_I2C2>;
 			};
 
-			mpwm: mpwm@400e8000 {
+			mpwm: pwm@400e8000 {
 				compatible = "nxp,lpc3220-motor-pwm";
 				reg = <0x400e8000 0x78>;
 				#pwm-cells = <3>;
-- 
2.49.0


