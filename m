Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB09EC1112
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfSw/YyZxtWdt6T+0h8WzqJ7g3THGU6LxAxLY8xoIzw=; b=UviJt1//QuXFMqpPx+dm4qpX1d
	pEB5tlRYETDelR1iMwROWCrjvLfSqFNFaVbTCKxkD3t3yC/589MZQ276OZYRMMvBNCyHhotaEZLnz
	VOYHr5xjcf8sjZpuKFVKVxtya+J0fawBBNSpdugHGV7nsahnAIUHD4cCWhwX2+Ieq2ygIVsVD4shM
	wg88PUMjJMIBin2f87wTY+YN5vNKicJNA1KrV4vHAD6niSNiPvm6/n7Cvrb7e/Mh2z10sokoOpEod
	DzCNgh05ia7tDRyNGEZ1uFBXNySDQAZnzjCe7ppDX3Co6djTNZzNvc5SmJL9CQ4HaNwgGG7RG0nAW
	CK+bngAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZYr-00000000jrO-47IF;
	Mon, 23 Feb 2026 17:17:33 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZYp-00000000jpW-16iA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:17:32 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43621bf67ceso3066703f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867049; x=1772471849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfSw/YyZxtWdt6T+0h8WzqJ7g3THGU6LxAxLY8xoIzw=;
        b=Kl8UFxnA+nFadUlZqlU8fYmoEJUg1j6v8aobYxX6+TnAzCcE7lxImj0JjZBmVPC0mu
         oLrMRZTqilA6fgU45DyhjmH4QN7DPo1n/Texs/dPQAxalnwk2SZisbLsyu4uFKjOHKQz
         CWL+LKm1zsLsxFmza5eTvvHxZkRC4vWjxNOvxYs6X6F1o7chxdHEcuJzEFU29flQiYpr
         2u84ct5t1R+OyKdluQYMut1Dq1gmSlky28mW+6zF2RU9KT0sjwHwp7XFcjpI0aHim+eu
         p1yhIE3IgoyiPDs9rPvAcu4xoiWbSt32NcpeaSHORjJmfG7iEcp3EsT9ti/Pjk7JZ9g3
         MTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867049; x=1772471849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfSw/YyZxtWdt6T+0h8WzqJ7g3THGU6LxAxLY8xoIzw=;
        b=l5MkAEPOvrDGF8WaSy6kWR+t2fTwAax05Ui8rQULNsUiZ2LLLSaiZPArkGAhehApYq
         ofN2gN+UpaIYfN7YN6Gdh/EtjIBS6O+XTlrMXHIcax/xWt+CGSqP+4U3jl6iivXNBVMa
         EiienZSd91+kRkzfEAZJP6bYe65hOVPytmthDr+pu3ESFIcvtXeEsz6yZcDcgEODd8Pt
         G4i6Vt+c+Pa9PZUe8pjB7vBIYyAmoF3AtCbPw+kEx8UPVjYBTisOKSjfYm0PLMEGUVSV
         08LPnL7LeKdn9jo2erLcZzPQQvz5RUuh5SA08vfaR0faeH9YAoiw071a/KgYaTJ9f4LO
         8gQw==
X-Forwarded-Encrypted: i=1; AJvYcCV+2m1OBg8xFGL7Ew/Ynk45fdDAuSgul3MZmyjqxGzhsw65ehkntWkRZ3L3ooPJvBxcdOMX4ZoFjrVMoRfWYCt9@lists.infradead.org
X-Gm-Message-State: AOJu0YzQhdIDV8CDyviP55QCJUk9c11w66NqQETTD6f6ct+0tlGVxXp3
	9mYXf0PkcK3Gwmt+98DM3+S7ta5y90wTHxWdgDKpuF5s2Pm0s3C1NFMv
X-Gm-Gg: ATEYQzwwdL9LXh0Q6VqPTTD0EzcNxWhmwQgKafkLzG1cSs9aWlh0+qYmYhYnLhiWLrf
	f0ds4xoFrKvyUgjDpik63P8JqAX33+OPFaS6Sqvb/ipBn6RPPinnzk1M9WjSLm01hK3YNQLabCh
	t+FIuIVnpdKGYfoAUlyq1gdquXJDhYttAUqQylJJ7W95b5TIMRj0ikaEjckmeWWVkZdKesWjkwZ
	WNvRszXILsYaU+So9WmZR3DLrtm0mDvmaNHsE4MIfSiHVwpUwVl49afjUJ5qarN8UDdUfkBcrhX
	ewwX71DJL50e0CbFxqtoMkirbuMK/1voY76YgyzizpilLCHNb7hLFlI90nLJ6CC/a6QccybfMw0
	L65ntUnwKLjH4CbLW8DFAYolBbmFVAzwZzEMflJ/VoxcB8pebfDMdelunEYqNoqfJ3F0AURO/Sn
	0Erla5x4ak7ksLp8pKDQw=
X-Received: by 2002:a05:6000:188e:b0:437:9d2f:8bf1 with SMTP id ffacd0b85a97d-4396f17ce2cmr17527562f8f.38.1771867049261;
        Mon, 23 Feb 2026 09:17:29 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:17:28 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 2/9] dt-bindings: regulator: add support for MT6392
Date: Mon, 23 Feb 2026 17:12:41 +0000
Message-ID: <b7664f4d9a7b038b0603b6bba79cfab4e18cbdd6.1771865015.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771865014.git.l.scorcia@gmail.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091731_319936_503F1FD0 
X-CRM114-Status: GOOD (  11.08  )
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

From: Fabien Parent <parent.f@gmail.com>

Add binding documentation of the regulator for MT6392 SoCs.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 5f422d311d4d..b61fce8f09c0 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -94,6 +94,7 @@ properties:
               - mediatek,mt6328-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0


