Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C623C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=; b=yF7PL0Wm5GVv+aQ4j+7095Omck
	UKN8TiEIzgBBZ56UGXhY9K/oVDlZnG7N+GlnyCLnjfREwNY68MkgQp/oMDYPh3ONjNHURC2E4Hcco
	lcMkKwHqY6aFMSNuX4feybPoY/ShiE8NnXhOreT4lzAXv0xHBkrTZeNEUN++jKV7yxgcFzbf/z0Uh
	XbKSMPlIgoBQfqzrs77K1GJZp0bvQ8QYV2GNCBMtqkLDX3v/Ui3sHmvcC/Yd7RO5gTFD2QPFlwxVZ
	KilIQEI98KVdd3/ZPtPcgnAWk4cyqUvxuYht/bmtp9TRmT0Sz2y+27uVEe8F94EeBC/HC4psN+DJv
	YdbiY6vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zka-00000005KA3-2Dmu;
	Tue, 22 Sep 2026 12:37:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zkZ-00000005K9e-1glj
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 12:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=; b=GQRYwjXkwpxJ+mj5noEoTNTIza
	usIFAicxlmZHN48fkgpYbcnEZRzku0mfeFYbx4qI2sCpqxEjFkFm3EEO3TKDKiC1C5alI3LgQ1NSG
	FhLFwZvaUaDDNLIllFareJp1kWZYacoNWvAHELeV1+Q5eNqP4p+2WVBs7ztdo19cFJQhqYx/QKnWp
	yiZ2I5uu16xDXgyfKqMAzPHC5ASncBosf9KvgmhCgb/RyFNTQosdU+TNB1ro9UZ5srOtO7nyIhQlF
	sgXKvpkHvk5+Dxu9SRR0xoxqrk4LTTUWRkK6YrB1HJViptBOtCazBXjOfQkyXSwI8bZSyitgEeUTV
	JMDbTLaA==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8zkW-0000000DYaS-1eij
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:37:30 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so3685886a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790080646; x=1790685446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=LpwUq7UWbxAt5yyQNxqmQ74ivQnIYkfiXmxj4TbtkRFGKl7+WTaytFBuxGfMFbJOMF
         ml/a97H6aXPDitw/vpjhHP81ZwU6m9P/xrsftEBHcaPCKIISV3Ajm9ncsiX93iJH51lj
         thTvMoZbvrQVWwdFq8H+BGeik0UNIPOb73qYOzb6OPwz81VLgd0zD3iGSbFZN++bXX3j
         ieuJwOFG8zfH2S+pkLPRMDORygnHUn/iBlOA7AO3pU4YKsG4Z6DMFRMobN0Fm2a7vaLe
         CfymmCQseOACWv+U3VjcH7tmzeimQBaviOk5IqAJU3CA7CUyu6Lf+y51sr6+xuPemsLJ
         O3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080646; x=1790685446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=jvSoxPhos0Aq4BGWvi/r1B6q2XvWuDT0nE6K0mWoUYLxbNzhohLXu/Az4h+LPBYMZP
         d9PTjn1zCl0594bWyE4CO+27ROFXuV87sAYvlK/TYzEtur+O4vkPDqkqAN6hRILkxTFJ
         97S808G07WgSnEzH3Q+7tq0ht86/jPdRQKjP6o/JtdE/ugKdQD+afyvyRjpVr2spG8cN
         OQssT5JcSRqwyBXGTiUY4U/CcHhxiuH1tt/RvgtWm6CyzrjXOk+GTzoRhU5G5I/aws+0
         bgTRzoyW2V04QS/qOfQAMc7tZ9DzBAvK/JXomdU2FUqkq4olLHuPCGZ2/RzJKf5SZEkY
         HAaQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9lczi+GtGDfz53F9BZoYP33mVVEuuCpyhJfIIGH4Cj9FCIbVzw9f5WOcRvk1j2ha4+dRd9wSmR6tSwf34GOY8@lists.infradead.org
X-Gm-Message-State: AFuF++nqV2Iq+/h2xscClb0rP0kwbZP1gEK90vr23ZED/hbwKx23+Nix
	302dx2N7BrjkEiSOSU+88crzt5oTeVRl8ubdUOX4UkoeLguIQGZG3QyC
X-Gm-Gg: AYBFou0jfKAFTYyIeZTo3wHYGJUoQs8WWMAaev+AHNoiPzzNPYJAo1RGX28i5KwGgvs
	QU5i+f9clS212Rtpbe0P/OPJpkp2BhpMPysuypbAhAGGB+SlQV1dMG4AHCd3LZQGvc15kDsb2Qg
	3jQumfqzj5KfgcUb0W/4WvMrEgqiOTowzh2OybV9aYKQGI/i5ywHiHo6PVZm7q94xvWKzPkhZ0C
	NMWXLp7zPp+9SXZPGwjqNWwffbVY0Cn+0OltCB7kZ8Lb8u6aLF1iJ55jxTQBWn0iO3xUYBaer8O
	4qK44NfTssOR1FEX6tTw4qy0h5yMowc1+MNERe7R++YPZw/AOLzDIq6cqG0uP6+4HMe47FcHANO
	fwgXldUCzm0Ew5x4061bVJnAXuvQJbiL9vSZYzLyt2VtJRFZ+1NsGK6Bn/JjZhBvsDwy0OYM0nI
	uKqu8Ml5TsySDRTCp9zeoV/Lmdp93NM6abh+rSLevqaYGLmnutucXKD9G5e/IXsY0jg8X78k/xf
	l1aYy6rb2vG1xgv
X-Received: by 2002:a17:90b:1fcd:b0:39f:d323:c988 with SMTP id 98e67ed59e1d1-3a073241ff2mr1206949a91.48.1790080645673;
        Tue, 22 Sep 2026 05:37:25 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612ccd46sm6453922eec.18.2026.09.22.05.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:37:25 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au
Cc: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	andrew@lunn.ch,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Tue, 22 Sep 2026 18:04:59 +0530
Message-ID: <017f5ab1176b12a9d56cbc060f3ccc1d6ce8332e.1790079398.git.prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_133728_630543_2BABC85D 
X-CRM114-Status: UNSURE (   9.44  )
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


