Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03BDC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bz0ySSPwLkjCZQjoAOssGTzCtgnTiGfSJWwyPJTSyPU=; b=4xuJJOsDDEJohYPR2GuKDNEj51
	ScVIlt+Wartlbiaxqgd3RtA7l1gD8k3W+SYyDjOdw4DCpHVebj3wUz0CzKSSMf7O4+c5WB3fJUehm
	ggucMYzsFEefobhaS/9JiI5VABBoMFSJ9xpgKqjkElSCJE+YurGosAXkXzUafHDV2okDs4lSpa+Mt
	01fx94zazCf9NTHQOTpNOAQ3vL59GuXME+HEAmX641/nNYD6tlFtMhjqn/7bpUMUvwJISRg/krunY
	Yo2/P0I5SAzU070PxncOl8d3RnGYBi2sy1O2Cy8NsCEX9z3eqxz4tHLa0/534bzQfNMTDCiVvlUFa
	0N+0etCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Rj-00000008kJq-0Yob;
	Wed, 29 Jul 2026 17:51:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8RR-00000008k9j-4C6c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:51:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4955de8797cso8639635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 10:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785347500; x=1785952300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bz0ySSPwLkjCZQjoAOssGTzCtgnTiGfSJWwyPJTSyPU=;
        b=Sc8XUk/5vygG9VeEyUcq3uOc78KNNCYQIjC2V93urj0oLACgigkg6L3W4FmYjderWX
         zYHF9lBsie1uS1nl7JnVIVDuwOaSsZVXcOlmRVp5J0d3GefytH+K4NMirusYOikfnAuv
         PPZI9066LNz1dfFiETFc+R8twGPA+OCY16tw3aEUlcCuutRtyPi2p6yQDE8c1skBy9lS
         oAH/w+igSuqDRA63C+hyUn/g4KTP1OeSxFFB2Wwnbrv4eUBESNP22n4xjhh2MGVyWKiJ
         +f1WOxfqZV++JTjxAP1JlUzPfDGOl16heACtewoJiZA7j39dRwf+mj0ZiRrqHzG9PcP8
         IZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785347500; x=1785952300;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bz0ySSPwLkjCZQjoAOssGTzCtgnTiGfSJWwyPJTSyPU=;
        b=fp2MYgaBaUrCGiGLoNJPTSsk5L+8TUIWe4OqchO9q+XUOS8aU3pfMuR7DdCmfA0JpD
         ZbEocvvxO3JUQHHGH+itt7Gv6GuDCLyy9+BG1WooT+gblNS/du+1RMX62Cbe0Q7MSGny
         fV+QKs/nyjUl8lp4hJBLG0zXJuLPgUcWWytNE1HqHCVqdEVQ4E2Etvy2P8ddRH701cyt
         Wh9TWno2OR7W5Ep+1DFFBDeKM896Jp6prNQPaR/5WXiGro+1h0KxjqOZKkVOSQyT/two
         +gzaC/Is7LmY7Pb0bVKsajdwuY3Mbqt212FhLx7vmZb+8DnQV89P6MO4H0u0HlqVcv8d
         Oh8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrr6XHsi4udVvYL3J6boKP/L9Inp/jgIrzsOhGdKFvTQUl58oZY/VDAqVWC56XtCWBe/FQ2L6c7/M0ijYM7/E41@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4qYbxxjIvHvV4yLh/9I6dA8XLoif9v4u1gXBdo2Uus4mU4BrI
	lqWpqzws5I5PBzn1QTxsAgWyWibw7JMsQOmGIEiZ7CoOIKCyV+yEULfE
X-Gm-Gg: AR+sD11jOgrXCZ7hu5Zqc2eqvcLnudWDRlPf96FB5vTQvhnWCHRsvEdJKjF0GR3U5LR
	Fze3icdn5gFQTDtp/8BBe3WLxsU9D3o07nLld37hCvnDPsOHQhp0xNxa0dBiv+kmY9TNsvCFkQ9
	5My5OaXwVAIBfyRGjpgm1j44Vnr/tgyoeNEFI/aOdB0TSBuVZ+cTZppRD5UDBSIAn1GaUxuH8Bp
	G/wRbK74XXSWw+ftrItB0YTpnF//i2SL6P4e6Yzra57ef6re2E3c8KLVKWlyfW79VHAJ8TV3fcE
	/uJFOvrW5tiOZLIVTduObupLJBUkn4RyLcX6KyB538fPznxzwlBIRA2o1wclpAncbyyfdgEytoZ
	vMT2wwlU0R+FyOYUA/VBzyJm/RmRAaeBeoVY6yF4Nh4BCpU8H/wL2Omn1bx7fNZ8mjUEBBCPYjJ
	11MgorjRDLDvaebskcIjINV1SovABlT9LeougdeeI72oNAd0mu7WfJuXuJ13AL2G5kf3SpEKH/C
	mgzoeLzQz+Maq/goDYXDA==
X-Received: by 2002:a05:600c:1c1a:b0:495:5fdf:2075 with SMTP id 5b1f17b1804b1-496c60c1c4dmr81087375e9.0.1785347500402;
        Wed, 29 Jul 2026 10:51:40 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd83fabsm75723775e9.15.2026.07.29.10.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:51:40 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
Date: Wed, 29 Jul 2026 19:51:33 +0200
Message-ID: <20260729175134.92909-3-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729175134.92909-1-robazzalberto@gmail.com>
References: <20260729175134.92909-1-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_105142_116845_263B9F23 
X-CRM114-Status: UNSURE (   8.71  )
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
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
which is based on the Amlogic A311D (Meson G12B) SoC

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054..2d6ecdada 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -167,6 +167,7 @@ properties:
               - bananapi,bpi-m2s
               - khadas,vim3
               - libretech,aml-a311d-cc
+              - orbbec,zora-p1
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
-- 
2.55.0


