Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985A5EC1112
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uM6wk4ilnVR3AWYXU6RXXbe1DzogOfIUTZwC0wgcO4g=; b=r5vs7U2Oug4bNqo+JFmn4/qJQm
	l8rOCPsqc+fPASFiBPDAivnTnfoctiIDnB2xkzZLUX4/Sbj5cxr90/C4ua2wJBhtqSWmjXBUwNH7u
	IQ9QT/kppfqoRh8EbC+njPYqvfE3mRvJj9vytlZJ6s7B8SmMmGpCSgyVDTTN5IFLFpmixWv64DR+X
	HZf+gsqC4cPvGUyZ/Od46NUIKALF4Ge1ibH8CtEOnCkjmIbmtNcrNpqwHgIYqkfAQW2/mWiwKPqg0
	9fvfxEdVgSUUafirP9+NxtDXFQLgVpDBj7sYec2oVil3y8Wv1ZCqETH26oKLtT64i8/BW1SDpFd8y
	tAYsUQKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZZ1-00000000jw3-2LVo;
	Mon, 23 Feb 2026 17:17:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZYz-00000000juY-2vOw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:17:42 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso34731355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867060; x=1772471860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uM6wk4ilnVR3AWYXU6RXXbe1DzogOfIUTZwC0wgcO4g=;
        b=SSQwXHthlQ4bWkhsOM7FILC5iZErvsxWOFpaWIIz/wtN38qE/w6gp0ek3AAmafJ7b5
         EAN2Wc0WfpIPTIWrjUrgDMiGf70VfvbxzbvUpSLIBVFAf8dAcph6p4ON+GjS1OdvXZu4
         x7s/UktoIgOuIaeHOj85avpV3uC7TJgOeYuObQsGJpfeUB6gq4Bn4MkuzByz9mS15DZ8
         N+JkWmSYBKCE5MA72lIpgkhGHIwnrgol4StYJkaC7G9HVSFFiGqfyIRjbIMuiXH/HzFh
         ti9agPPTRjiJVQU/9W4Gvg7HrPj/YqzvZE8ran98ll+Mpi7qnpNbRU+HNJCBP5M9fJK4
         fbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867060; x=1772471860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uM6wk4ilnVR3AWYXU6RXXbe1DzogOfIUTZwC0wgcO4g=;
        b=ca80JjVkaxDcAfsD9/FXvJxf2E6hLyHwwwhFr8KLPJ6G9G+bw+Xio5LmT8LCeBMEbi
         ceU2WXskBt/7nutBFDhlTY8sICLJ1Y/CuOArpSKwCD/UdJeiFbxEij1Q9EYQAxpHM1Jd
         3PoOOwdwLC1Q2EscKrAFB3thtJOdcmNTUTFz87AuY8c/6xRAgdnyDIT9NuK5IkLG/90e
         gO4oC5k7yoRDTV+7vogBJgFrC5pZgJ/oEUsSWqa2RDW17FnbQx7HiM3/f2zGBmnvLyeW
         Ee+SF4wa89qtY77U6xDQQVHfe2a7UGJmxCgZG3gV32xLpveOSVhRFZg9MOIMY6bozU/O
         8orA==
X-Forwarded-Encrypted: i=1; AJvYcCWKtAfEfY/Z6L2glMZjo6UBK0CdAAyvu4btSoAUhXz8BOMnP3Dno9/Z5nx3j9WXrBOVTTiMfNwbwzUnqy4hNuDu@lists.infradead.org
X-Gm-Message-State: AOJu0YzhNFUlcgspR8HUmrsNgH09lCqS+2O0Jqh1WaDp5AHuJARWMHgN
	LniuNejTNkktgry6q+Nf8fObG2/hxHZH+yz/KZo2cKN35YhUYdy8Hoey
X-Gm-Gg: AZuq6aJczwWRp2TKKqEynGcM4+Pf68Yh7HI0bFl5qN5NyE2Gy0DCTKRT+03D58gWJvq
	ZgNF47K5Mg+j2IDhRAX6ZLNFNaey1MuloBTRdtTE5rBRF4s4y7LgzFN1dfaly18r3uRf+yjfxBk
	dLnWDfCuCPu501JFiPLg95AexAphvcL14z6K8QkUHI7qdzgTn0ONPqqEhqMYqdQOcp4q+R8LLUs
	r0KH5SDcYeqG93OAz9Kj1a8MRe74lJ68Dmh8mKA9Z4v8Xktjj+h7cK2dTjT2eG6FEB1Y9pq2jia
	Hh4sygM67ow55+t0Amy38Y5bLN5pcNRtY8JaAJfBpucI88R+7st0T1lbLr61a0T+7CUq5cxqo2J
	EhWyQiNWy3YHQ/E7yJ0WPk9oa/mSbhx5J+z8H9WNUc2nAOd6jWfCDHeJVSok55HAkf2i9AFDok4
	rhmoU9LjtJ/TDnPRLssXM=
X-Received: by 2002:a05:600c:4589:b0:480:1e9e:f9b with SMTP id 5b1f17b1804b1-483a95dea3emr196855965e9.16.1771867059590;
        Mon, 23 Feb 2026 09:17:39 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:17:38 -0800 (PST)
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
Subject: [PATCH 3/9] dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
Date: Mon, 23 Feb 2026 17:12:42 +0000
Message-ID: <056cbc09fcbb4a2845cece69209a2a564d993ac5.1771865015.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771865014.git.l.scorcia@gmail.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091741_758971_9306AD9D 
X-CRM114-Status: GOOD (  10.63  )
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

Add the binding documentation of the mtk-pmic-keys for the MT6392 PMICs.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index b95435bd6a9b..2d3c4161a7f8 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -30,6 +30,7 @@ properties:
       - mediatek,mt6357-keys
       - mediatek,mt6358-keys
       - mediatek,mt6359-keys
+      - mediatek,mt6392-keys
       - mediatek,mt6397-keys
 
   power-off-time-sec: true
-- 
2.43.0


