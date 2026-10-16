Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8A9CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFJNx9u+viXRs5tNEKp/mtIp21KgfUj1WmCFdRLL6fQ=; b=svGTk7bujpLqlt6zFQ8ERnP8nK
	YiwLsjxP1TNKMWJb9yK9vxmoKuafs1a86R+VBCk6X4blMYRVYgZxVPZ+s92FNk9kN1Hdf4/F5+fxB
	GLB78m0QzF/l49+iAPAdAnk3QqoHfCjGB2BmPZKGkEtyYMzk7CKHv9ABtbKGNFdRSl1EXLIIwUndu
	AnxAJmkgDyIaXxJWQTm7CV3mW/rrOwrwhBKlokuX1EbwkR4yZpW3z7/mm7qofmd7DhofD2I3aRGlz
	QmmJ2KfcXX9m+TRA++1WgWxY1t8HWBymo+yVpCrkdCuiUkqqjKcn9VJ20l4KC0KJ5BUMkWdIGho2s
	FUrrwx3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdaC-00000002Mk1-1zMR;
	Fri, 16 Oct 2026 08:46:32 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHda7-00000002Mi5-17tj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:46:28 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8874539bccbso1594918b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 01:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140386; x=1792745186; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFJNx9u+viXRs5tNEKp/mtIp21KgfUj1WmCFdRLL6fQ=;
        b=WPz9nYZs04+1cGAXyxPxbmWRWpty8QU7koGS9sTho4lUGeSkNvxVIFoiyqWMyj0ayu
         ChlxJ3pITjyfVAXRKpEPeDW2KuCNtlkdFpH5XwlP9+a2IqitOFZbBEdZcgmXjiQR+YC6
         K1Ilq/QYJupy6Y93D0gqdsjBK7s5qypiAQtLUmGF4IEa6H7cjt14EQmL+m7pyFS+Nop3
         qd++qkcB339eHofdX7zewUGkMFtfD06lkEGlH2jH+Ur5udkxd98Kez+b6vChb/qWpN3k
         8TglATpt7IT/t/T1qbaZgoqDMSteMu65lOKdAUJ02zyVtN2Y2TfzaZ9qTzUYeL+R/y1m
         Velg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140386; x=1792745186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFJNx9u+viXRs5tNEKp/mtIp21KgfUj1WmCFdRLL6fQ=;
        b=Q1G7hr18bkjWiau+h9L48xWJEFECx89ENHlaQAOQFYWyuXPdgRkHg/aIKL1E7n+wso
         KIx5FPSiUfSJvjvBp6JEBltpaoiNpVleybNOhD1xOcBZ7MiNAKTYm5N7KX3Vmn8dM5xp
         xPTalQ8G60nW2tOA3RZyrow/QGE/c7rhltdHSTkwfwnBh8PlWfkCKgmmd4qfen19O1aB
         k5mhLZPkkDtW81yqmiMSmNLdhoOAQ8ehAsAJqCs5qKxcm1VVwP8tt8Gx+K1bjlz9ZwWb
         1KnBr3ATz19p/95vFqw+3BF/CTgbnhcEX1I0RlYCafUHYyXnoJTRAwlQyQjcuGaGUOWZ
         6PQA==
X-Forwarded-Encrypted: i=1; AKwUvBzl4HRMZi3e/e7yucu0R7Y2hnEQS7M+Mv/PF/TK4mzUhffps+rjOeqMmo2L7nq/Z3tBlQq1DG7S3GgLeNgZnPDA@lists.infradead.org
X-Gm-Message-State: AFq9FYJKuLldb3W9uGcV6ulSOgTYDWhRWA40b3WKjrwic20Z1ITnMPmN
	JKQO4PYrdijw/vE3g49v512iYMzjKHIlbdFVQ15g8aPmJDF0g53qspZx
X-Gm-Gg: AYBFou2Jm5eTsym81HCz81e4fKojMRnvbhpPrmazWenRSR1NN/5LXXf3BNCsDFajLpC
	or3McV7zWPjHcNFmwkYdh+mm5nZKZ9yWxmKM4+E6vLTEU5QFR9OHLNsLfiw6oITI+G7w0zn70Cq
	lgh4OflvGgqZIxDyZCuyATU1tvMp6/rKrxNk1UUhgew1V36odeQNmSeuJ5J0eriNXDlhvPBavOn
	WqVCSIG4jHGmA19oUHkWA0oz7ot0rGmykTCIg9S80GFWg+PvvSQPfqmRTukNJcs+R8LbTiJbLU5
	FxrTTtII1EA+oemfw3zvAdXLI+kbp2ySU0BplmtucCp0tEBXWkHFJ8JqigZMnQW5cRBaKA+ViTr
	/m01mpbCuyNERQ4UtvdPU7bY9iAZfmxBvWmADe2QOtzxHjaffrkkFViLp62gkoTp38s5OiwN9Ng
	G/8ey+YeZS8dFaJw7ZxcUO37xhW7Bcj3QnGOgX8rMxycxT+JBY2YNe6toc2m9Bxjo+DSkcEw+Ez
	QfKOA6OlgZ/9ku1NJIcEyaCuvsaOnQc0FdNFV6LZK27cv/s
X-Received: by 2002:a05:6a00:a01:b0:886:bb44:631f with SMTP id d2e1a72fcca58-897c6e1c80emr21774772b3a.10.1792140386374;
        Fri, 16 Oct 2026 01:46:26 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57947b0esm756620b3a.39.2026.10.16.01.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:46:25 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 16 Oct 2026 16:50:29 +0800
Subject: [PATCH v10 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-ventura2_initial_dts-v10-1-a546659a084b@gmail.com>
References: <20261016-ventura2_initial_dts-v10-0-a546659a084b@gmail.com>
In-Reply-To: <20261016-ventura2_initial_dts-v10-0-a546659a084b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=915;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=FazoqI/ILuJD9YIY7tvUgoQ9mGvSj/LgYKIkJKM/QVM=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq0eVZOWBB+HJr13ff3KUg0fZrnwLad53T0UIon
 3VXJMNq1UuJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCatHlWQAKCRClg0K3CVbE
 gdBZCACjTlbWiWNV+3gKl99YFT3Gs9ahFspJGNkV/LAbx6kcKSGnzFdCsOiz+cbI0XLLlf2e/++
 hekAZIERIT+v+o+yNdb5flZFSrv9bDH1ykaIfXwKGt6z8HTkO7GquwCt+19wBUhxWtw1dYYx3jR
 2R8IMSGEtRuVkTQopF3hUSqV8AjE+CT1SzVN9Q27GKcaBp1rtBrkkJWgc07vbtwjjwfWBdLhpMX
 mAUpr6SupMVssUc6xR4vpcDVHo6S0dl6an2bSyweKYShZ5ixH8xQVLgZijsaJH0G+88ELxqlXT/
 wFmczlplAbMieIwx9+C66Fjktaio07vPPHX7U03TM4li/hIZ
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_014627_314626_E322AE38 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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

Document the new compatibles used on Facebook ventura2.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index dd7996960de3..b7e70868ebd8 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -98,6 +98,7 @@ properties:
               - facebook,rainiera6-bmc
               - facebook,sanmiguel-bmc
               - facebook,santabarbara-bmc
+              - facebook,ventura2-rmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
               - ibm,balcones-bmc

-- 
2.34.1


