Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3929C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 01:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=; b=PGQp1LSYOiGb5GPtw44BEkX8c9
	HfD/1ikV+bOCJJptGt2Te/4xnMLLlnC8b507x5pbri/LAzguw8sswJ2AfPgCiWVgk1IyYoqk+NJMG
	/31fGI3ckK6Bnk7GthZDRcDmh4aowEtZd5jWDKDK7PAjTwCWstF3xvMpUbTUvdR9zm3MxRmVrPQGx
	zvLkd0JxkSNBY3u6/fKLpvFT6KPpQeLQRVjvWRKPT1+YrKGLE+tow+qmsO06MDbGGBRkPadUwVGoi
	KS8uj2zlMlY3Qik5yZowfaJdUblx9ex5Z0Xpj+Dk2/rfUQjwqoLHQoWkMxmkJChbbW/3DE86B3o/+
	6OfiB88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6I1F-00000004xY9-1hBv;
	Tue, 15 Sep 2026 01:31:33 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6I18-00000004xW2-0t0n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 01:31:27 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4c5373b1138so2193132b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 18:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435885; x=1790040685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=RozxSef621ayOrpfEX87MrWFfXIxgrOOSszee1FDn2mko6kabRM138no4HToQstKfw
         brkXCImstI5MsGRitT4yaojxEcr5no0eKr5WkVVVeYBzqkxWvdE48hjwOL0sELQu9duw
         KOqADD9VdXShiJA+5z3vI/wXUB2AWpuToho8HwyFEnkdXCjiJp9eG42Kkh15ewydwdJ5
         wed78pPQ4BtfjJmsJM4/7DA/usYDk3R8YGtyylEa/Rf4ikR/VUPZ4yUVY5TQ7OPRQZvE
         Su04/5I79TqGQtLFRiebqRLOM2sUp7buPd0jqqVydbj/fPngUwP3GQMVR/FIqYS6aJX8
         PkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435885; x=1790040685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=quL4d5/c1ehRHf+J4kJern61xwDws5aQHmib/KA2NoihcWajl/cR7uZ1gs1wn5LnwH
         S8w1KD1K3bMXjFv1hAwsGYFsF5CK8V8HMqYwbjKlgahh1l79sGaXco2ksM5mq6djLhSz
         gtx4MznsxOD1A0NpVgrCwhVNhU+KLBg8FcH/ia+Diwi7QTTyQYBlhrxNZVsFdcbgf5sJ
         DQsQM2irQNwxkZOBXTW2kPVQfgBIRlUlUeSuhEvbbNxo+jL0U6BihtvSyFva3+5EaSwo
         zgR3t5nvut6BvjggM4gn7i2as6VQbJaxvFgZSFMV9qCZk7SHdnCwG5z51d6ySS8wUH7y
         2OjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlXCZ4lPsgxxXa5jKqZ7yw//tVEHsRJDy4FZmrenU8mSJd8iUeeZ4/0spvpq7jTZleTyMb+gdrZu6cHvHhFScJ@lists.infradead.org
X-Gm-Message-State: AFuF++kX/TUICdw8OQrU6nThfL5qJ4PeU9Wsd5PBl2Wz+VBK0x0RqUFR
	9MamCEPqh3YxXX6otUf9GQFUU3FUe2pHiKHGi9yeJhzlpaDygRs3E/sx
X-Gm-Gg: AYBFou1HgMrEnOb8gpwCF7oecO4WuwQujLyxpr7Qq5PdIOVQNNgD4UWvuMCXecAhTED
	YSGPePVr9FsyrCUnCbKzf5jZcmV4JUOkZfKRFMXW5cgoKXTlK9qfpPzHWVp3SJb2seXkofdi4BP
	xO+/GUvvRoJqFBrtY4MUtkkyZXMQEkXHlD5I8DTBug022Mgz0svAMnD5Ro05k86n0f3tpWyFk4W
	QjY5dhh0H6SjzJVs2oVfVvgbn6O6d8GHvhpo8s8rXTz7chRpclBRMsXty/8YFCAizgVRBDIFKdY
	/Z84SdWOa9Ekohqy5FAzAJxXOxKRy/pPe9SC/F8YypGzdSBp/Bz0AX89nVFYGxd4NLjPIWbCW0m
	FjIC7gkVD/AAFiS71PUf21jeK1WGBLTZ3I4zlBCQBnckW6MHeeLSOW05wYKDlg7btf0ZOdAuPT3
	d5+o16kN85CxXJUJ1NviheGtx6POhvX/eQq+FVKWnA3jsjP+wsP0SuOhOGt3++5z8FyJ9M9jhZN
	grozLUao+Fm2OfG
X-Received: by 2002:a05:6820:8119:b0:6ba:3635:7ffd with SMTP id 006d021491bc7-6c543112b4amr3036635eaf.64.1789435885128;
        Mon, 14 Sep 2026 18:31:25 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a59b18sm27111575c88.2.2026.09.14.18.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:31:24 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Tue, 15 Sep 2026 07:01:09 +0530
Message-ID: <20260915013110.4780-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_183126_791987_780E1108 
X-CRM114-Status: UNSURE (   9.37  )
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

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9ba195b8f22d..4c9e96801c1a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
-- 
2.47.3


