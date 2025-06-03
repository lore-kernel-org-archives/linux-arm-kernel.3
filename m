Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987F7C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 15:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=172AOsAQz4QlRBaW+nRn36onwnXefgQKgc9WvkOzeXc=; b=cygS4xR9EMzf5x
	MXbqE5TI9A/vHtlBR9h1WsXsRi00goXr9D6tEMos1ZTVBMX81kjQSFX7VmvmRlaP1ZKyNXG11RvdT
	GblTwvq/LsQmAHcQfjjxlN16mYhNmfxyMYNIvjGIDZIPILBfoqQGqdCTL8mv+0zwq6dVsVrD2JjE9
	GTulGfZIa4TqfGSlAHnDYfND+NS6AMvcE3vBa5hiLjL2u/zusKak0GrPhDWYFqWe66j3ZQo+Klxxq
	Oec+QkVhEB3mzu2mciqiRxUeiiy9mzs18JM9ZwiSOAaSYhW7xS9oHx2VDBByCe0AcM7cbD1MfGumK
	yuSkcUI/EdJKTXOZsoxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTtw-0000000BKPb-2OlV;
	Tue, 03 Jun 2025 15:50:08 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTnP-0000000BJSE-1WGp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 15:43:25 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ad89ee255easo1053863666b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 08:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748965401; x=1749570201; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=172AOsAQz4QlRBaW+nRn36onwnXefgQKgc9WvkOzeXc=;
        b=Iue0fFdh86pdS7W7GsFBtRuOdfoECmC2Zq005Jogv+fhvz1oM4ic25Qs2K4SmYMIpL
         60CqFHb8R/bh9coGPRBv6HE9UvoYlvCNjI1p6P+ED5h96rjS4CSiXKyZ48dSOAvJriUN
         T90sFJtCJdOn4l4NhrAMuIzMNc3BuF3JPiWGz2Nkc9w4Z7de0zizoGIGL5gNUVkaOvi0
         VkZfqUaAy0HLVi/k+Xr7QDtI7OKLRMAW56pUhoNcCmwRpGzT0ihtb0hlkAEFr1aaLOc5
         HpDCjoxnwCAkTtM5P1zD9L2Ihmuuk4ZhRkjcaGnwfdUM3Vb5h3kkNw5G6snBbX5WbChc
         kakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965401; x=1749570201;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=172AOsAQz4QlRBaW+nRn36onwnXefgQKgc9WvkOzeXc=;
        b=HAMjGcA6en/KPASRrv/TsBt0GjQEGjjHJmri12X9gSSALY5OLZkuVPdu3B2fkiBLBD
         krL/tXFQNRmK/XOqMviHfIl+qAUqiMwkM3NVEQP8mRFAj1LxEbkkZo2euUOq1fB7Zc3f
         vkcVwPIhPEdCDQLBuEjFp1RBXculFqDTo1xE5DWu4AaQu4hG8ky4iGOcn94RIm+wNBbP
         jdxXmOg8dAbCMIdjtG26OO7nH4Wp/052o4+6rPIgvqFl4GQ/rQcRep5mMXbffDObIShE
         ObwY4JyBctq2XSqQ7AM/VO14LjK4KVoilIg3xfsT4FiX0SNzHBx8C7xbNIzDQU2fG3O3
         bA+w==
X-Forwarded-Encrypted: i=1; AJvYcCUmfFD4YcDeMyf93eTvzcb3Khhkrn+BQeqMDO50QOLtXheDXKmyuxEQJBbV+hTqmOZR3vJqapvT4kcKvt5zj0hQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi3wwyFTJE6v7sJBmkIlXRxdRRpfdItnnuXnAzGbJ6GCw0mFeT
	OR5pLgc+oOlMmoOhc3pG3lXn3Gh5RbT7Uh8698dykOkcYCdtUcqPJdOxAGv0FQteOSg=
X-Gm-Gg: ASbGncuNkJUH9yMLjQoTsU0Ac+Ez0wqBTVQVSyaCvjkvL2w5oaR6G7qm13iQabdda+r
	y6D84Wk6TAN8p/UaEW8Ydb680PwSrJV9lufdPSp4MRbENyVhcPt0YdGx1Y3EzPAFytblOW+S4ut
	XAO/RRf209L62JNsCa66q70AtwLSxBUsNo7aVINYunKKmUqXzyxQjgFFONLQVjQTrnJRqmExE12
	w/bEpN0rit6CH1XJtLJaANnEnqs9vzdNgjfLDFVGYVsOzBAGn4Qne4yDhI884fR9Dj5X+46ZHqI
	7Oyqg5aq3+eSG307/llcxj31TNgQQ1+cTRPrVJyQX1k6UdV3EOvrcr/w+A49E1US6LOKKkYv0uG
	WfEkxNQEe1FtBL8Zy4tqRpbO7egcVRzJYerI=
X-Google-Smtp-Source: AGHT+IGloNqlwgmA2JLdwpv1Sfgyhpoy3jA6UsqagxeRD/QCKnQisvHafq6ll76RsV6qpOjXtFvGFg==
X-Received: by 2002:a17:906:478d:b0:ace:5461:81dd with SMTP id a640c23a62f3a-adb36b05802mr1654872166b.3.1748965401077;
        Tue, 03 Jun 2025 08:43:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82de9bsm959277166b.47.2025.06.03.08.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:43:20 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] clk: samsung: gs101 & exynos850 fixes
Date: Tue, 03 Jun 2025 16:43:18 +0100
Message-Id: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABYYP2gC/x3LSwqAMAwA0atI1gbqp4heRVzUmtagVmlQBPHuF
 pePYR4QikwCXfZApIuF95BQ5BnY2QRPyFMylKrUShctitnkDB7tuqDjmwRN7fToRl3bpoL0HZH
 +kLZ+eN8PPxlKomMAAAA=
X-Change-ID: 20250519-samsung-clk-fixes-a4f5bfb54c73
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_084323_412737_3B29408C 
X-CRM114-Status: GOOD (  10.13  )
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

Hi,

The patches fix some errors in the gs101 clock driver as well as a
trivial comment typo in the Exynos E850 clock driver.

Cheers,
Andre

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      clk: samsung: gs101: fix CLK_DOUT_CMU_G3D_BUSD
      clk: samsung: gs101: fix alternate mout_hsi0_usb20_ref parent clock
      clk: samsung: exynos850: fix a comment

 drivers/clk/samsung/clk-exynos850.c | 2 +-
 drivers/clk/samsung/clk-gs101.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
change-id: 20250519-samsung-clk-fixes-a4f5bfb54c73

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


