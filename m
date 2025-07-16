Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F12C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 22:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0u/YC913AnORCbk7RT9GNyXowu0h11qkd01RjAkHwZc=; b=EGCAX/XPWebhfd2Q/UXxuVkc7y
	slCNzu1IR0nXnv0/euWONDd2s/eXJBnUOnWIMOF+JuMXplI8FhQR8hVneadNbNxGVesrjH2keVezD
	rxQD1G4SCJXYOYgxz7o33Tu1tjxmgiAsJTbNUw6bVmDfC3eAubvYfG4mCFan1xhiVyPNMjMmajHF2
	FEry9HRLDK7yXUiFLQwPBqofrw/tEkHuMWdoDwxCXIR51egFEyWSLn/SLfVtqfrgIfCB5eSTQ4Lht
	yD5drB9r8AjeIjWQ9TtgxRaQgvMsYRhmBt+6ExDLzMge05ov8kV3QqoMQ7r9ZTvfLZDBM6NLYqcNY
	ADJ6hk8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucB30-00000008pfV-2Sc5;
	Wed, 16 Jul 2025 22:56:22 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucAta-00000008ohX-2bsA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 22:46:39 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-73b5350980cso1065894a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 15:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752705997; x=1753310797; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0u/YC913AnORCbk7RT9GNyXowu0h11qkd01RjAkHwZc=;
        b=B9RrmYXLYm75YyNhNzgr6J9tBJmRgKI2aR5Bi/jHkDhdVV71gHgBBwAfaKm1Yc3DUA
         ivcpwKsz0PgJfD84gi6btjVqCKWwHnrL+1MRYxYimd+2TbLnh6m6gu3tizdTAcHD/g/k
         VirOaFGV0h08G3DZBR+AcDIYwQQeEnLNMjxxZxH9M/ur5yxXdgWUwXot4iVVPPaulSgo
         Zi9nwUsNTjxVhsNNu0TquTnC1ytTHTLXh7Q1GYH99v5Eg9pwk2nw3lQFaCcLJacY4eFj
         BLNoWJUicVbL1caViK6eFxpaTQuHqh/SmeenAf783VcAqFUk/TllFvL0c0eO/I1G3tqk
         AVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752705997; x=1753310797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0u/YC913AnORCbk7RT9GNyXowu0h11qkd01RjAkHwZc=;
        b=Myk5ZvmyAlUUJLBbaS5C2Rcpp2AfQGt7t9c42NofsGhTAVGa/Eet1Ctc/zwI6A4FuK
         1JWuswVkmYQIT2aLxMc38CXFqNRIHYP15Dgvi2Ce2SCjIMH8X1sIPK7Xq7pTV6Y7VMuw
         hlyxZNonDbOvCQSM+b7P1Jj8o0/UvXy4Nvhln2C+J6DqkfAhszt8CtONrq8XaXvxktC8
         risYcGwO22RYqr2H6H08undhUmGCsZfhX9ye6VTOjt2SOUAP9Y8uklujCc48AnpFRSMN
         n1BsKg6vdnGL/D51yX5ntkDc5x5Tmsfx/vcSZNc7XsoTPv0UsCwHpQBV17g3ZVhWylfM
         bWHA==
X-Forwarded-Encrypted: i=1; AJvYcCVh/vKB8rxiMtsBarVwqRLnnpSrjp7Au17F6SQmI7XoLnaD5VqG8HQSLes86WwAi34iLE8iS9jua5aqG/FP0Weh@lists.infradead.org
X-Gm-Message-State: AOJu0YySrwRP9Gjxp624tvlBrS6EnIqMk1/8SJLSacSkoDokn2kGI2ry
	YRcn6vvyw8y3ytrSQfjvGK5NKuv7lrYvjegGcqHGZRA35yCRcj9NZ8sB8bSJhzY/bhg=
X-Gm-Gg: ASbGncvOkveYDFty0dnrvixVso58QtAn9rPQqS12LG7IKlPWsvjQMitCEcmWuJYMJo3
	9jo/ij0jC2jxEWsSFaEjanJ80fegLjhLWOYUsrKZ+wMmqj35EcrpwrUbimUm1Bc+JdIdyfa43/0
	j6b+O/CWrInb2zBzl/6yJymSNFMxsu25xjJ5iFlk2/G4+/CtfDDfummOMy1bseFTZDjLPvUQJKP
	r7BdFTFY/6SuBov/uwy4MW6KnEk9vv7eJtLvE5pq63KtNc+WSizLKQkoq0iLQhZm1228IxqZHjl
	hRbOSFDQofQ0cZnXQE0lPTD0uKKq89PA7k+p577bwAugg8aGmXQFMI8n9sHcSOCvSY6Kx9KvvWK
	dBTEcv8MsPfE/U/h+IitXAalWR+lQgQ==
X-Google-Smtp-Source: AGHT+IHW7jvGVN1nZDNV19D23iLay5SH3FruLv6n11izEuEkrlyk9Tea64PpmwgpUO6OAQQLBc1AXA==
X-Received: by 2002:a05:6808:50ab:b0:41b:2876:a93b with SMTP id 5614622812f47-41e26d2426dmr821249b6e.6.1752705997476;
        Wed, 16 Jul 2025 15:46:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41dcf3be2a7sm466494b6e.23.2025.07.16.15.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 15:46:37 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:46:35 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: s32g2: Re-order usbmisc device tree section
Message-ID: <14d3cfde-57bd-452e-afa6-8a468281e5e7@sabinyo.mountain>
References: <cover.1752703107.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1752703107.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_154638_663272_FB08667E 
X-CRM114-Status: GOOD (  12.92  )
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

The compatible line is supposed to be first.

Reported-by: Xu Yang <xu.yang_2@nxp.com>
Closes: https://lore.kernel.org/all/u7glt7mn33lbdeskbr4ily6tjjifvffy64llwpi5b2rrhx5tnv@y2h2y3oz3xc4/
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 089f54415571..6f700085dec2 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -424,8 +424,8 @@ spi2: spi@401dc000 {
 		};
 
 		usbmisc: usbmisc@44064200 {
-			#index-cells = <1>;
 			compatible = "nxp,s32g2-usbmisc";
+			#index-cells = <1>;
 			reg = <0x44064200 0x200>;
 		};
 
-- 
2.47.2


