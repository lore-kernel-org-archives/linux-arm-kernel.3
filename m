Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA50C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBQF3LhiaELkhAhvThHHQLxtoJjXQ7QMmkLPCh9kTRw=; b=3HiQqrwUxvu5fn6nIC6M37KxOY
	q1gDY9SMAgi+CEf4bMoyj9TomjxGeS4HZlYWnXMlYfWopc/joIcIa9UOF2S3JOXixL4k8Z7qzNDQu
	KCcbA+KDu/KH11glMQV55w8LttzhNxf27o6hDgJm6+TMZFw3pP7uBMp/9J/IAIvHI/3q/1G1DRGie
	zWUVzNvH/7Y6kNGVuddItw/mqHs85l07GV5SggwVb/Fq4/G+SrV2pYWFgMxFFpFkZXlXWZUGXWLhn
	Vh7mN4fYg80MYTPz0UFmkwcY19jRYuq9VL4Ecs1SsZYtbQQKQrpvqeSCAGlA3iy+aGba4gFHSRc5Z
	CFzapG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kTE-00000006dSk-1YZ4;
	Tue, 15 Apr 2025 17:53:16 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jyC-00000006Xrb-3TN0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:21:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf848528aso48716835e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 10:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737671; x=1745342471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBQF3LhiaELkhAhvThHHQLxtoJjXQ7QMmkLPCh9kTRw=;
        b=cp5zZy8pw20gY0oiAP4jmDXEz9at8ueFpe8j3w/rKfcsQfobyJIF4XTkpEEgJkmbLx
         xw8W0uC43sPLpEzRTL6VX7TX2tBAXL1HEXSwyjkfM1x9a6cVhoyfkb1uuraFzfSnYKk+
         3vmMTEaqqeMFgxSezmNwSdezFRaDLoLT/4Y6KnzfTgxrWq8/iBfjOQMhn/aTbvL9kX95
         upta9UBTOSeT+VWohsS5hvq0A3oHciYYeiK0gkTYKm2UBbOqniVyJNyMGBVjm4wdH6Fm
         9uaW7aWVH8HoEpHgl3qI8nMOr1IVG1SAutxL25LxdIsZ8OEAmqHBtKcifiS7rCPMMBgV
         BPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737671; x=1745342471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBQF3LhiaELkhAhvThHHQLxtoJjXQ7QMmkLPCh9kTRw=;
        b=fd3Oi+W9ugWn4VJeEsei8qjQmG7DbbSiAgcaBe2HdBx/8/Uio7QBsOvz22pmm0YdJk
         GEetbq6TXaWD6m6lN3GhQCVZgRNzUnElW97JnxahLVhO3XenW5pMbD+WlbkBbldTFnAJ
         K83FMcTi+sarQU/KptrdXooPYi6lFeCt7YeIGm8Ns02MQr/oKm/Pn19DMRQOb9r2uE35
         DJW2BFh7DKBdF7Qyp4pvUJFaS/DqKvC+XtAxJ5XuxKM7lZx7o/4VFQIXeAr+jBJ+hPZo
         5L6eWSOOazLj2GdObkReOvf2RJhsgkGkAe4MXZmJ13fDgLJ6MOmBxzeM2mfyN4F/qSst
         4AbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4HqsMeh/lqi86CT3Wc2DTrhpjzh64zc6axFAgw74I6/cPBYwM7ZWge4ZFO+AHK6idZ4Cwj3UrmczfkJ/Hsf4W@lists.infradead.org
X-Gm-Message-State: AOJu0YxFrMfX76udwnua/UwsVBO3j4zcNm+betalw0kmngxzVt7VaAyw
	rAgXqNnfYJcVO/ua1F8r4ChFG8nK5p/9zMqO9oJhWFTMf+sr1O7I
X-Gm-Gg: ASbGncv4Sdt6zaKBFZoojvIPM8GeyuuSRwFjFbZ9j+q6+pfDuhNGRNv9/viJDJngnRB
	kq+swJBVrm1bjNdYOW5hvlDRGcDBt32EkmQ3FARd0oMtfMA2uU/3wQ3yXQdJ5vgyThvanTLKzIT
	W3cAVk5JjURW3qFQCtwvGYfsnp0CIckFf4bs7z4VPSq9BfZlVYVFbCNv7zUlMAy3g+7cknL6i+D
	pwSrZt80CgXBUGxeeSBsfs7jCSrMy2THUqXzH10QqqVm28pEAACMnHrmE1pstBIq04RSJtHB5NK
	G7UyP/dzo5CuTRS+mBTZ2LdwhmnFkCu6UfXmUEHoJjoNlHnkehqNrAFiYl+SEvQBHa+1fQdJtbf
	suXs=
X-Google-Smtp-Source: AGHT+IHmlSKDjijdhVP4MsrrIOmDn69e4RJTHJc1yap6d2BaTmoYqDqW9yK+cYJfmW31Obrp3rSSKA==
X-Received: by 2002:a05:6000:4310:b0:39c:268b:8b66 with SMTP id ffacd0b85a97d-39ee27632c2mr255465f8f.43.1744737671070;
        Tue, 15 Apr 2025 10:21:11 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:21:10 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/6] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Tue, 15 Apr 2025 13:19:19 -0400
Message-Id: <20250415171919.5623-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_102112_865554_4DDA8AB1 
X-CRM114-Status: GOOD (  12.84  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ebbc99f9ceba..d0d24fe92c3e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2425,6 +2425,11 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			access-controllers = <&aips5
+				IMX8MP_AIPSTZ_HIFI4
+				IMX8MP_AIPSTZ_MASTER
+				(IMX8MP_AIPSTZ_MPL | IMX8MP_AIPSTZ_MTW | IMX8MP_AIPSTZ_MTR)
+			>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1


