Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986EDC5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=; b=rIQqMOgH8CXY42Fo/RTpVs9YKs
	d1fpguRk/qrfQYIUyIhbCrD1+ChjBEKJzykUy0FKKvBAROZKKDFLliPAZg2b0aZ/bP/AUt4a+bnes
	JqVZ5UuQwb7W4WyuCz/zqD/kv5PJhLrgbI7w97HNmjNVZLo6PQ5ezxo5vEgHubuqhlWJ3l5FQKeJA
	KOLQXIBlsmvDOgGCWDACkKHBh0iNxH32dKub6A6phtHbke1f1dQIfYZ6QImZeIN3jbheWuzz4zbkb
	eintpI0lJuYDoNDMFsQWLXWT667CCmjZYGtO2QWztgGHYs1nui6TGKSFNNbfggcbkzVU6bze2LZB1
	NB7Frp1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwytq-0000000BEvh-0RWi;
	Thu, 20 Aug 2026 09:17:26 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyte-0000000BEq4-3FFw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:17:15 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4815b8781c7so974857f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217433; x=1787822233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=FpGElP6LIkjObO9zUTaQBcUnqxILeJk/HZ+j/fdpo7jf5k+CK5m+cRJTFnpvZY6Tp5
         hJM76/ayNAF66RGfFZKtqgDC9JAvQQ74jEw6jjbOpKUKW7txoO/2pjMdqk2NLUvZB54G
         gqBQEQp0eOeO7U0RTjG1cY9ixDYHm5gOXCtUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217433; x=1787822233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=Bc3q5OPft/NlcIt9+Hd5s6xI+sTH6QvrmMyZ3EetFel8Mw7x6xvuWcKndoscawOBwO
         U38OQK0phDIPSXJ/0l4N5uB7dC2ucJLXRIrS9e/Vd2INYj82mIWTXS5TR0QHYQ8J0SPk
         EWd1oveMLQMFYixf9se3VWf+aBGgy/mJBfRIYnuTSzDudC+I1o3k9+/tcOh+1TmfGSCJ
         +TKDpD1Lkl6oRnrRZlYcQWYZhDyeY5C2Oa9dmCE9Qv6lA+Sq3VjjE2IUvBYAbPeZTXfo
         1zKaaIxGTaH2hH4YI9SovHDMQUq4i2xijmudJzwQv5yXNb6KRtcFGoyccKYP+PEIYPHS
         lMQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqkz3LeSSr1R8Z8fdIgPEszR2B2d27lXP6Rb9kGMrZ7qKCHPuGS7Q43qFGN8M/tayy4hKYGSlPwI1LXkMVHj1Lt@lists.infradead.org
X-Gm-Message-State: AFuF++ma92iTEBIDJwHWWjzWKx3SrxA+t61Be2VkNahWFlPIHHwDF7Xw
	oei4glV6sWY2s7Vr5ZmdxTbSx3gBt3bSwB6ZL9osb74k3YMeMS+lMZ1lKsf3PupMWLg=
X-Gm-Gg: AR+sD13zkez6pdGI79wQC7UaplTy0sFtbyNJHFChxRNZ5qUD6TH/qZJt0qu5Tps0td9
	xvMEknaRJ/PmXg/mcHFmcS8PO/A2mdxisPPBBEMRYcm+tCn5V4bKgYoNZGltdVVoTkkGEbmWJ30
	iMg5YwprEU9v3Us0ANd10bt6g29toQ8KSL9fJhl/lGs0sXGF+fzNVpq9x60ESGpvwlzadH+pF+S
	1lh0cL3habB/xi9SeXr3L0FoKqiSV8gQCzgp3h8WNzGncNwMyddU5jcqvc25cN+NITUxU1h5mFZ
	bvwhFWF8lEk0ODaSX94hhDBMyoKsB2PBTVYQ6XT0ID7oJMimMLZWqSq2fXErDQcs7v6GgPA6mPG
	UoROWtVWktaf32tCxHifqWd7u5Fdek+kuMtmfFkbYkx4OwsqLq7JF4YvCIVUpOMvrP4iRp2bj9p
	UBVuY6hPaHhQ4o/aeFaRGVUvwLO1fvbZdzQQv9yYb9L84zdRNTMFSTsUSMh2XIOu3dqunkdcVdB
	XJpT71adWae29TY9jFzVB4JyK9r0OycidOtTThTc76jjWL7Qd3/Sg9YvtRMXbREOoxJZ8sOhjLb
	J9Koum6epzSQDHdK/QfvD4RbGXdIj99h43dIstyueyu37VBAF7ZR4Gs00O/oDjQHpf2hP9UhLg=
	=
X-Received: by 2002:a05:6000:2881:b0:47f:97e9:fe60 with SMTP id ffacd0b85a97d-482b1fd9579mr19387927f8f.15.1787217433214;
        Thu, 20 Aug 2026 02:17:13 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 03/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
Date: Thu, 20 Aug 2026 11:12:11 +0200
Message-ID: <20260820091652.43541-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021714_818811_5218884D 
X-CRM114-Status: GOOD (  10.09  )
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

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..ae36d703532c 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1664,6 +1664,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
-- 
2.43.0


