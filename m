Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CED4C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XIDaYsmUghacwPnCHFIq+ZA+KCqDvLae5+CGWLLqcE=; b=N+OJiprHio4ho4Cs0d2DsdBWWd
	hFeJb4iwUFdCwhjJk3YVNbMPJBOw980whDO8Aj8b6XXgywp+Usxo1qvWQ6fBpmBbTalhJyLZYqx7i
	68D39EzHuTsUmY3hH2XQBl+VL441SF6QkeHCduqSajIDXDnTcTJaDG8Iv8+aI+dToAoTYEtNH/XWd
	KRcf/14sWzTbpXiXhRSy0uzjsvJX3ddy39iQoWl41E62nxo8TXkn6nTXyDg3zkTVED2A2d+MMAKvB
	5oWgOdXZl1Zvya9yv+IATBUEaP0y3cR53jaPdNraa8S9z0X2NylbDSlofN4PuV246IomW7Gg5MMHA
	voPjVoHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ijD-000000037AQ-3CBm;
	Mon, 21 Sep 2026 18:26:59 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ij3-0000000375y-06Aq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:26:53 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485ac898fa4so2917649f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 11:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790015207; x=1790620007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XIDaYsmUghacwPnCHFIq+ZA+KCqDvLae5+CGWLLqcE=;
        b=MgcjPS8Z0zLG/pWtk4oNstOEf8CNwL5TzF4kKv9uRm9kWO1HGe39GETN1cLC1qwq2+
         gVdkAlerAUe8JYOHKt0ctOONwl3lsihrEvUNZJNNg3sBkdf941Xx6sWQeViQBpI7EFsd
         5w9KNcZ0J/lPCxUF8TrZb6OB1q0xqMFQFWiZHXUrE3+qU7RnaGViE+HkJ+Ey8uLFWXvX
         QC3SN7vOml+/bdG4WFhur8Vbend7PjIeDMnymStnzbHlk8wkj4BkYJZr2g+mUXS41Ukn
         AJc83uRtEcZNNEX7LnHgEr9xmIXwnHfO177P2vEbTxMFGcE3hPZdEs+cxehTqmtDkdvu
         NTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015207; x=1790620007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3XIDaYsmUghacwPnCHFIq+ZA+KCqDvLae5+CGWLLqcE=;
        b=U/ku7hOG3itmQ6IXX3h4/6UE36HfCfXkqTY9+2R4GSRnuILVyHc/T8BOHoSAVSv40W
         fU9YZ4PpjHz2FZUeR955kiNfscI9TIVql1d7Iwgm8qxR+VUYSmNbAvnHtX1laztJxCsT
         SmuMkOyn7nWzj/hiY0eoXbT7exXejd6gFLnQa/ZlG1/5nkRXOyx6WOx24buJF3y9oY5C
         9NwAKkUTjVTY/UKfaauXs2Muj0op2bo/ND3uqvV+F8R9qkMkqr7e0DRNP7PlhW0HhDGU
         mxZK0t71fOhZdDM7gK2URF28FwPfS1fDglwtamRVOND0CBYUKvDQFW3XatLKUVcb6Cp7
         04fA==
X-Gm-Message-State: AFuF++lLG8JD+ceZw1fofRBScJFnLjqwbyHcbZsSAUM3Jpx4gcB4HMjB
	9pbA5S4P93bgCnS6wegHTJS3nHfjcMR2+cpJDoIq7TclenfUptWfLDdIMYsKaiY4kqVemc+G1OZ
	2+JVjz9Y=
X-Gm-Gg: AYBFou04fRY7cjx85SSZUA6qa/oDpJVixGUomhvVOmY3ULevrgkNwSZBAaIUCvsr1OA
	LfB+rTnGSAd7ZmJ3PtA6flPgDHQyWLwbZrOeq9PUv4QmyPWxVcsiz9wcQ1pOFVIl9/BLghft162
	bt1mKspUrM2TxSzYcM/qOom4qv9HPhq1xwwZyJ/v8cy8mjgzClbspmofdrkgM9m6ra9TZvxCAHr
	Y8AMvruhSZMmafo6hWaxaLNhlmqdAn0OEvQCluGh1Ai+H3JYsH98AbNRBhOCiwq7tMkDrTghqfP
	NKPYVVOQIiGuAC5XCEYoBm4iBJMzFbYGmtr5qvHGPdWVU78bo36M/sCRrSW0mh+L+QEU7IHvmkb
	HFrdzkC0vqNcUY+4tgtEooJprSLMmBwpzU5ACamq10RxpF39CHT/hzNI1oJEzBaYEntdM6JBGWQ
	v62Ped0QVCs2GHDlHzLX9djhOEB1IuF+5HkaJabTQ8EW4xUamDM94lpn54uIqoZp9LSXib+SN5F
	ELUesl3/zSetUSs/aFKrLce4TKn0DvgNgAb
X-Received: by 2002:a05:6000:4685:b0:487:2385:e19c with SMTP id ffacd0b85a97d-4872385f827mr9198374f8f.0.1790015207103;
        Mon, 21 Sep 2026 11:26:47 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872446067asm25126184f8f.12.2026.09.21.11.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:26:46 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v3 4/6] arm: sunplus: enable SMP via PSCI on SP7021
Date: Mon, 21 Sep 2026 20:26:18 +0200
Message-ID: <20260921182620.17597-5-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921182620.17597-1-ag@ffroot.co.za>
References: <20260921182620.17597-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_112651_114646_68B4E700 
X-CRM114-Status: GOOD (  10.70  )
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

The SP7021 firmware implements PSCI 0.2 via HVC. Add the psci node
and enable-method = "psci" on each CPU node to allow the kernel to
bring up all four Cortex-A7 cores.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi b/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi
index 493d32357e4e..b73cfde7ace4 100644
--- a/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi
@@ -24,27 +24,36 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			reg = <0>;
 			clock-frequency = <931000000>;
+			enable-method = "psci";
 		};
 		cpu1: cpu@1 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <1>;
 			clock-frequency = <931000000>;
+			enable-method = "psci";
 		};
 		cpu2: cpu@2 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <2>;
 			clock-frequency = <931000000>;
+			enable-method = "psci";
 		};
 		cpu3: cpu@3 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <3>;
 			clock-frequency = <931000000>;
+			enable-method = "psci";
 		};
 	};
 
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
 	gic: interrupt-controller@9f101000 {
 		compatible = "arm,cortex-a7-gic";
 		interrupt-controller;
-- 
2.53.0


