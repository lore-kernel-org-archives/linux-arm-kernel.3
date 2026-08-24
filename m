Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDFAC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 00:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rWm2gOFF46IKwvZet9m1yBgyP8pz5pmvbsrAu+4BmRc=; b=Wljy+F9Jyfq17MkEHtAasVzymy
	voJ07CGQX0giAPnHhghNGK85QGaJCO5dBjKuZjHaQcqTDMEfvCrJryUOeR02nAFL/N3R+IqXuvKjw
	cSpzy0mf0GodfwP/QB1xZptXL+iifabXtz5+n6cJA5XQqQiMhs9j7f/A6qNK3JcB44aiSFL/Lh7gV
	SGF6soY2LmD0Z6P+ZPpuXEE4jYCVwcuKkdCp8m3d91r1QESg+kY3T32gXeKeOtXZZYG9vbEqxGpum
	Kf3yvqTgAKQXT7D+/Z4nO/3hVY3Kmoj0NsGKqIvOfZpy+eUTMSsHEQH/vGsSNrXgTMNrfUcRFlv0k
	rMMzoCRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyIAS-0000000FhXU-3QLu;
	Mon, 24 Aug 2026 00:04:00 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyIAR-0000000FhX9-0Ctt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 00:04:00 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-84847482584so1812898b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 17:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787529838; x=1788134638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rWm2gOFF46IKwvZet9m1yBgyP8pz5pmvbsrAu+4BmRc=;
        b=QFZcLi2/uCiQbq3yrT1yJ2uxiSOMTdpKQX6XBE4GCGov4/4xOYUwPOJHyav5FngV7/
         oJhce5yIJ1F1W9vNq3MNwtt5Q35CmDbv8EsUHdQswkJuYAmoQ3e/MnHY3tiGQx9oKOEY
         qIZtFh5+ssjpf3XIjv6ZpaR620PT43H0Cc0MYSWNJdh9wH0nfbxueFIapLh3lZH4DPBK
         k1jBVwEnCcDDcz5wkgPEv+ZR6cAWstg7IpKOUcI9qPPay5kxQwL2AIoITjRjRgXQM4Gw
         eF5Zc+IcYFSMchDq2lzOBHpX1sPNKuJYe2nEzCohgEEeivT3WahGn0gqjbTMLEEC7xEu
         pa9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787529838; x=1788134638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWm2gOFF46IKwvZet9m1yBgyP8pz5pmvbsrAu+4BmRc=;
        b=MXOFB4iys6dWhCA9t0CdYCzQXYbc2RSQt0MOZ1f4BcaMYqdaeeRRHb8tym8/8PBYLC
         EAX9pbM8olRq+xTGXOavqMKlu82SqykI3TfxUBOrAfsk4c/2fzbuBjcyq/hVliloMTi6
         s1k2znIMA4DdDc/4fxqQEvy+C/duhwOhr4D2HqVo8xR3jloNOKo3C/Wy/diIBg8DrsIg
         1QQgjkYNOeVGQ3IQbp/3V8Tz8q2G46olzc0N9BBinMPU7Zliy1+QbVtGw2TsRb/2puY+
         ILDSc/NDu5ud4Pq+vcK8sd7J0w5/mpVvUQX6C+z2mnZMRjjgXQ1MZxjDipkTi7uwCJOa
         CSLg==
X-Forwarded-Encrypted: i=1; AHgh+RrTl6ufD332zRSosxz+kEAVED/SHvtetKp/1KYUDIM1Ri5wln3kD3xMX6eKKl6ziMO7SIHssTNVmWZ/74+Wgm1M@lists.infradead.org
X-Gm-Message-State: AFuF++lrez7N+47dOKT9PwPTuOYSK4n74hNwfu0SExtsJ/98G1OCEe+Q
	WMijFGGtAQBShN4DQtJJrh++sfqkmb91yub2DywaS0jY8LCAqPzx8kVP
X-Gm-Gg: AR+sD116EzyVyW8hsYODPW2x6NCbvM2T63uz4eM4nLKRrstdmq3uVscPGQY2Fum8YNx
	BS5SO1aWnyGDzClvg1e6YdRauOR0QVEgdoZ6mDZ9IFYdiIoMiBsDVCVL+jXVjPJQYDj5pre4cHP
	7T9ghlcobhFnJDs2K9N/Ug/5FhPsebS9ojIey4X8XosSfIRZts+4lgSq/5hMKYQxlOV6aPMtkt/
	tjzVMVB2elJ9wPvATeJeE0+15o0hbaj7jsHwXOp6tNiMRSELc9kk5lBxsu7xA1RbvIq+YVKxuUF
	bLTR3F3kDlzxivqgUVcVMf0rK5Ia5SdKpxEHGXH7FOdxWBUg+FbE9htDZjaJydCmSCxU0Kipcq5
	FXajNhQwfq6/GfasfrovQ6brWYotgvUyM3GUuaoiBux7zzSkHjR47J6BmjSJdjRzYMo3dVGwqdE
	ozt8m2WG8e8DEpVtzY7q+d3AqaIp9uon3cTinJWIO6rr3Av3BOrsZvSx0JxP+5Mvamt/9AjO4TQ
	VHPx8VmZnGF1fUXlw4pU+jwQYTXbJCEXVbr3fYdpd3/gE/NvEO5U2WDDWXyQXOyffMcWzbvgaH2
	BcPjK5qybspTARy3S+OSOnSpb9FuU0ZW8WlqLTevBcq+RLgg
X-Received: by 2002:a05:6a00:1407:b0:84e:c851:a058 with SMTP id d2e1a72fcca58-851dfa0ac9amr27654239b3a.10.1787529838013;
        Sun, 23 Aug 2026 17:03:58 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520ef0c76fsm1393108b3a.18.2026.08.23.17.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 17:03:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Grzegorz Jaszczyk <jaz@semihalf.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: armada-395-gp: drop unsupported SDHCI clock-frequency
Date: Sun, 23 Aug 2026 17:03:56 -0700
Message-ID: <20260824000356.79844-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_170359_345382_ED13D78D 
X-CRM114-Status: GOOD (  11.04  )
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

The SDHCI node carries a "clock-frequency" property, but the
marvell,armada-380-sdhci binding does not define it and dtbs_check
rejects the node as a result. No driver consumes it either: only a
few other sdhci-pltfm based drivers (imx, mcf, iproc, arasan,
dwcmshc, xenon) read that property, while sdhci-pxav3 derives the
maximum clock from the io clock rate.

Remove the property.

Fixes: 356645123581 ("ARM: dts: mvebu: armada-395-gp: add support for the Armada 395 GP Board")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-395-gp.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-395-gp.dts b/arch/arm/boot/dts/marvell/armada-395-gp.dts
index b854b73a64b4..fafa204387fd 100644
--- a/arch/arm/boot/dts/marvell/armada-395-gp.dts
+++ b/arch/arm/boot/dts/marvell/armada-395-gp.dts
@@ -59,7 +59,6 @@ sata@a8000 {
 
 			/* CON18 */
 			mmc@d8000 {
-				clock-frequency = <200000000>;
 				broken-cd;
 				wp-inverted;
 				bus-width = <8>;
-- 
2.55.0


