Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96E9C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 21:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=flOU+GsPnkJk4hfwQBm4GqfM22X6Dcnmn1YJIc77Kh8=; b=YUr4MMfoGWQ4Vb
	HY0lRjKQssfDwMqqW7MJigoLsslaqbb7trt0YtiZBAn95RwSzDdg+ZnU3wTnyrmQR5XkeGOqQ3ZLz
	EO7Bgj9UphbltnwNf6tgJl2uGK5t8aYefE1Q0OAuyz2JbJ1wTp4ez++f4NSoBzs+mByDlGOnpovYp
	NiJPJopoWytvoLvXmplaZGiMqqw6laU2lqp8j0U8m9kNQb/8ClCKmxl0+QR9ExLa0Fto3/2IoHBAn
	SQ8DPzdoYgFMdm/hqoh3GWXd6ZbcGu6a/3V3UQxfNBTsK35TC3kiMKuIcfGogA+PaZAqjNkD17jms
	GaisPpOaqyow6fqg2bbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvMGV-00000004DKL-1CRW;
	Sat, 15 Aug 2026 21:50:07 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvMGT-00000004DJs-18bC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 21:50:06 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38f0f3c8da5so303919a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 14:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786830604; x=1787435404; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=flOU+GsPnkJk4hfwQBm4GqfM22X6Dcnmn1YJIc77Kh8=;
        b=kS41LzNekZqEPcv875XY0I1T6zqv9mvTiXHzqtyUu8IqnO/zowwCohK8DmMrO+90bU
         vajIRluxxIoKCZKxqL6Q0o3zhksG5qkLYu9xdoVsDch4Bs3i7JcetDgUyqLdlkuypp4e
         vuqKK02AVYLXIj7cypI3nXWj5Cyj/yL6IvoYdoYfbTemvckJ6oUb3IqCv6Eh2SVxiHQ6
         mvRPSTtI40EsVW2BCdTzqEqsZvyhVSTzzeXsWIFu85RqAcNhzlmAZgr8SldobGSp80Hw
         mFx7uMrpVRoUOOhXh7cquPJXF3bK0g9EVb7AyXga8svQTLlYqrT9oRSTSnE2AYELUh/e
         KDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786830604; x=1787435404;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=flOU+GsPnkJk4hfwQBm4GqfM22X6Dcnmn1YJIc77Kh8=;
        b=KSz1cpl1pns1xAB88wRdE/AbmE8N+XoET6qUVJwL8J+SvMhxVEjbKgFBc0I8/zEWDl
         9jy4L+rexffQUjs0TZVzTiQyX+pdCIz3QY7bRKQ9D3pXpYHwgh7NAdnQeD8hjbvD6sCc
         ZBvSvVRpE48s+jpsKW6yQ3oenkOjdcT7EPhkMFtU3BJuxCJtjA9hXz0bJTfFiIzzEPww
         yBOefWJ1FGA6womezTFR7LZoaGE9NFNNjlk6AwsXrbYIdbDt7G/YZb7tgJEeish2mqd7
         hE4jge56aDEA7DYHV/Z/U6mXVUJtuJj8awIhTe47jRRsZzQaDRcy9zKGolh1JuuFhxqe
         Y0og==
X-Forwarded-Encrypted: i=1; AHgh+RrqTVxeGKFlEM/zyJu4xEAbWo8f8EZ6YH1KegQwPtHqzPGJOFbSSAoFIeRFcHcEYxDux+X0Dpo5JxiGe8Lw+mGl@lists.infradead.org
X-Gm-Message-State: AOJu0YzM0cxnCw+W/kDaxGBoOyN635N462xlZ8STjVl66YySiu/SJ3N2
	pVxUxORndv5upaOh0/6XPmtEb1le+BqDN9LQX2pcBgVCtfkBsibVJC3j
X-Gm-Gg: AR+sD12UJCkWPxe6b7lQT98c8JBjfKhp26EJdExGNdrT7tidg0M/KaCAUDUW480WlRa
	3P00preoQVXUttGpU+DXrH9xyAFJ1yy9SW/Hvz1bY/fCXZJQLSnIgHEr9Hu4VMve5awMkWCv1y9
	MRdePeWVYuPv0pYT9sguJeVafuT/aDEdNI51UO5PBrgzufgamPhdcJkySvK5Jr9yw6B4vBZ5ifK
	vBykffVmIPoqNnUGqDs07NgDfcMTk6lbiRecHhxr8f/Cme4XhU8zzTB2d9wfM1aRr4D1uvkxjY0
	HrcTFARXJhgcOkbsTaVa9CFvajV0z+Gl+3aHovRTyqoZiI7U0YrrVtUgX1rSz9lGnFH4o85eoSR
	fEMHBDuYMtQW+Oudrz+5wlIwGtFNGuCDfCmd+T3gM8J7ExpvvR3uE5odXFNXzp/GSafoW1/NAq3
	uAFptF6P80hrc2HvkZ8pJ5PfdWMQTQ6BIcb4J5phoYWtUWgh7typpeN+RkqRKDAF9+4t7g22a7V
	nsGDEsP8GdYsENa
X-Received: by 2002:a17:90b:2e4f:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-3933b871cecmr11796551a91.2.1786830604335;
        Sat, 15 Aug 2026 14:50:04 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:505d:7e1:7f19:edf4:38f3:dccf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141388b2554sm33541829c88.14.2026.08.15.14.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 14:50:03 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH 0/2] spi: davinci: Convert bindings to dt-schema and clean
 up DTS
Date: Sun, 16 Aug 2026 03:19:30 +0530
Message-Id: <20260816-ti-davinci-spi-v1-0-a7f57dfd5262@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MwQqAIBAFfyX23IJJLNKvRIfMrd7FQiMC6d+Tm
 NMcZgplTdBMQ1Mo6Y2MI1bp2oaWfY6bMkJ1ssaKcZ3wBQ7zjbiA8wlW6bXivHihGp1JVzz/cJz
 e9wOTgHJiYAAAAA==
X-Change-ID: 20260816-ti-davinci-spi-e64e4e48b6b6
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786830590; l=1098;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=4VCb5hbd5FtPxnayyr+BaRBuN+DJl3M/be9Ng6hw8io=;
 b=L5/ERK4hd8yvnG2dq35TqIPDWaNtOiDPSanlrZvZNIE1G6J7s74R8qtuhTEQORm+zHOyL+lpA
 IdfmRSWsfg1BzuE0e8IZSLENqEcuIzeUUlI2+Gz8efUOUOgvZJUYOXk
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_145005_322744_8BE79691 
X-CRM114-Status: GOOD (  11.15  )
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

This series converts the TI DaVinci/Keystone SPI controller device tree
bindings from the legacy text format to DT schema. 

- Patch 1 removes the obsolete property `ti,davinci-spi-num-cs` from
  keystone-k2l.dtsi, as the driver uses the standard `num-cs` property.
- Patch 2 Converts ti,davinci-spi from text to DT schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Bhargav Joshi (2):
      ARM: dts: ti: keystone-k2l: Remove obsolete ti,davinci-spi-num-cs property
      dt-bindings: spi: ti,davinci-spi: convert to DT schema

 .../devicetree/bindings/spi/spi-davinci.txt        | 100 -----------------
 .../bindings/spi/spi-peripheral-props.yaml         |   1 +
 .../spi/ti,davinci-spi-peripheral-props.yaml       |  25 +++++
 .../devicetree/bindings/spi/ti,davinci-spi.yaml    | 118 +++++++++++++++++++++
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |   9 --
 5 files changed, 144 insertions(+), 109 deletions(-)
---
base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
change-id: 20260816-ti-davinci-spi-e64e4e48b6b6

Best regards,
-- 
Bhargav


