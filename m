Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2961CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 22:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xrZ1qN3DYmU2M5pGPX1QKTcsDyaZXEbX9yPyZzRw9Ug=; b=pDjJQbyZUxyCRSijpaqFLEBF1U
	an/veFf4agCaZ0Cr7ABn10DRwnivdUJoVaTMDPI7JS8RkJSyJiBSDaINKTHQrszssKOZ+qNJfxEut
	L8Z7kphdVLqwhm4XX7ReCfm9PNEVkYyXCK2EjDGF/FeCYqBSJll5ufURdpE8PPTGG693plrVN83Jc
	NCJ9Yx/RAoAD4M6Fb7zi0FCu6Vc5N6YVprgenNr+vGHNizQTyi+VIf3FPyaVNroIpiOhU8OpY1okh
	6x5tTlwuOArbTp+TDTFSoh2RXrOrfzNkt3TGvVTOLvnEgM4jwlUlWDE1dK9vnCgcdJiehQ04uQb8/
	IIfrJcNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usUTI-00000008Vq4-1wTK;
	Sat, 30 Aug 2025 22:54:56 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usUQZ-00000008Vk3-08hU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 22:52:08 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4b1099192b0so62123201cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 15:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756594324; x=1757199124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xrZ1qN3DYmU2M5pGPX1QKTcsDyaZXEbX9yPyZzRw9Ug=;
        b=Jc5a86xjq/VRfpoWMDeAts8SMvRtDkDgGatGVwqi3ryzIwdWSNwXwAtu/w4eUcVsfo
         LWOHQTxQ1dtMu710vQ+zqxezebKRgmt5MVwYSbVQHmYS78Wm5dvA42k6kfh4uzCYBuQs
         8n9kDrfMfpQSL0tZcgTAPoJzIFLwgOlLNWQhCr98JedU7OhBzSHAkjXTPoWxzqKthdMW
         Lu9fbDOn90VxeLYPB7k3U7s8DLOCsCIln6Qg4gAQ7dgoIbm3KMb19swzUlMznVWhKCaU
         j76IrZYSGIa3E068P9/zP46rZg2w3u++h64cAulWP7zLrustFV22ZccHSNzLOTLyB3U/
         IAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756594324; x=1757199124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrZ1qN3DYmU2M5pGPX1QKTcsDyaZXEbX9yPyZzRw9Ug=;
        b=L5D+d2lY99yqRImzjWWYIz+Jp8Hnh7HYHzOr9HkYev8DMHsYmHWSV7K9dftLAAgWxy
         Bn/4/FesGJu0JwZ5EJsAMFxrdZviEenmG1M/7KbEFAV9rLwuMKpbMM4dCI/WJIJqllaP
         4tLfpO9Y0TpWhdPG8I6zyHmbG8LbaDYGmlAZUPuabEkLU+96UnnZvn7cQcMisRGvOosz
         dS/cdZzgIwA1ljyS5v+Ve//pVm/J0iYMsKZ0qsekr9OE+E+hQfUuMyWUyXdbdXHwRMxM
         71a0Nem+owI/L5uA0Lw+vkBBGt353j5ef1QKOECBJn2dAjChAiYIgBhc52w16wEDkgT3
         gxOA==
X-Forwarded-Encrypted: i=1; AJvYcCUXlfz/rn1+drzWE1ei1p22quGJIM3JkpN1eLuA+PTDozG4TAdXSet0FkiygcVvyAFU3qWBt6+rSyNzOwl9LTjJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwSDX6d7MNTxe8ipPFXYXUS7aBnMDl4wn/Kuaus6jzRLuqraAce
	e2iDimYohdh4xXSMsMPsj4rkYf3WalvS/auQTN4y9Yaa5qMSNEuK+c0=
X-Gm-Gg: ASbGncum7GfqiYDW7qwAFHxyj+c+bHcuZhZsKepnMJJ2wuMBz1Hl7sdQS6cdwG7yxLM
	MZ55g9R/Dzd8fX0EOX/W/UQOjKKu8G66b7OajcN5DZqlbh2wSAv+r0c+KWAfOcI4DUgK/fvyApe
	q4HfIN2cLIY3iRxLWrLiDNA18+nf9nvOr22pEYnzOySaCQ6ZzvPWbuIHbgG7ePlM05xIU7/6SW+
	3BIVcU3P7NjDJ0jEAGDQnuQ7iV9IQy24b2W1Vvj7JsfGvqF3eGXfBX2j0Uh4SuYHrpZz7wmHTQs
	qdpYwo86w3Up1vsRolU5gKRqwRh29hMOL7mCe1YKnJ8HP0eGXEYOcRJEuS8K3OJglCnYPRVmPzk
	vsGiG6W8KO+2NcxnxL4qqUqA9EzR0vAfVb73H/nRK8NcDuiKhCnmSQrFg
X-Google-Smtp-Source: AGHT+IHj1Y7mSbhB/V78RbLpZrF2ojqkt4iRIfegSDPVQpLKIbvDqEpOolWmEiXgivm+8z/ghRL4WQ==
X-Received: by 2002:a05:622a:2284:b0:4b1:103b:bb84 with SMTP id d75a77b69052e-4b31db67395mr34440651cf.62.1756594323672;
        Sat, 30 Aug 2025 15:52:03 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:68e:c28d:1818:9595:da56:53b9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b30b67894bsm38752341cf.33.2025.08.30.15.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 15:52:02 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: mcoquelin.stm32@gmail.com,
	robh@kernel.org
Cc: alexandre.torgue@foss.st.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ARM: dts: stm32: stm32mp151c-plyaqm: Use correct dai-format property
Date: Sun, 31 Aug 2025 00:51:15 +0200
Message-Id: <20250830225115.303663-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_155207_072978_B954F193 
X-CRM114-Status: GOOD (  12.21  )
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

The stm32-i2s binding inherits from the standard audio-graph-port
schema for its 'port' subnode, audio-graph-port requires the use
of the 'dai-format' property. The stm32mp151c-plyaqm dts file was
using the non-standard name 'format'.

Correct the property name to 'dai-format' to fix the dtbs_check
validation error.

Fixes: 9365fa46be358 ("ARM: dts: stm32: Add Plymovent AQM devicetree")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts b/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
index 39a3211c613..55fe916740d 100644
--- a/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
+++ b/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
@@ -239,7 +239,7 @@ &i2s1 {
 
 	i2s1_port: port {
 		i2s1_endpoint: endpoint {
-			format = "i2s";
+			dai-format = "i2s";
 			mclk-fs = <256>;
 			remote-endpoint = <&codec_endpoint>;
 		};
-- 
2.39.5


