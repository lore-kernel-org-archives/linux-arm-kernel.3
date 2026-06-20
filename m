Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC026CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 20:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=NehIaf6SKw9wyQ/+63/8BavLtY
	zyJuNk1bM1GGxwE7lOBV8OiKlf/ZU0+4hCbpbLzlosznEej3DO5doMA95XHWorN/MhfuC6YLQyICk
	pAneo9Hkkz3PgLjSgukcpNHy89vURIrNx8OzHjaIAWGJs+eREj8vtpVj17AgXJcsGUaZDTvLvnNaD
	Oz2S2GZ8vlMuh+Pec+F/n6hfqbAeDx1gou9QPc9v2ua2OiInEy4HdI17Kanjc9medeiPmG40bUDBP
	h/Bu6A4q8vwHQ2iusb3K6I09WZAH1WQGpYel6j7bi0bv+Hh/XEXK07sStteU3HnZkTDW05RaFvJrE
	1f8M76mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb1sV-00000003Wgu-1PWO;
	Sat, 20 Jun 2026 20:01:19 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb1sS-00000003Wfm-1zzm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 20:01:18 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so23010985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Jun 2026 13:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781985674; x=1782590474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=j54GW9chAcRaoIkOU0swV20uZohPlh/fmZGhuzX46QFiNqrAztKCJ4fQapMTdRwjXK
         q4Tuo75qOm+/6cIWFWHTsqh1NUbZnIudn+FeV1vmEtOoID8YqNPzU4JpkfNov9gNwWJt
         Mnx5E4XLK+S2wGc4XFN5OpySeau3tGDzZOdatKDwyzHiFWJQJT7K2f+b9Yt85zhs27pP
         C2LyiX2g1URdhmvc8Njvs1R0/IBs+46k/g27847+GnAQ7zZSVJ+8he9Q1bPwveA4srA7
         dMVLEopn1WEvMxUCNRiW6ab5zQizy/PJj5yIaqDiSyJPU5c++zIP/zPoPGiDWfN7IDGs
         NF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781985674; x=1782590474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=b0PiBZHfZjVszLnxkXDE5haaecTZJrtCCnvwsA0QH4qQeDrLSnrTizCBLzMHN7FDGh
         FiEvbw7tb23p1on0Zkw1aTEQQWFKZZvwsebpinnlBs+2uypV6iZUMn26oUrND3NGGWTE
         +Ekae0NmieDyqhawcD/xfaxWi4LHdgC9DMOa7tpaGvmzywL3aTCk91POEB7fXDX6kUSE
         M3L4N0wmXzPqR0qvpb1tt9HydD30rknbIIrboEyRolSpki5BCgceysHxno03/vBNOo+k
         ZBQq1a7S3ONnhLfaoFaMgXTds5mXfpZkGq+9X5cjr/mjZ1uN2sKHJeVfl2TSuK+F87v6
         Eyog==
X-Forwarded-Encrypted: i=1; AFNElJ/8Wf6JEZwGR9gpnFcjCNtgTcNr0J+Mxy5tj169y+cM/C+tVMYOJTpvDPAAUkj4CcyMdpCorFJxar68yhR5PDNJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyyDYkNJy1xplKzMg8Qres2xPROpKyvt1JIyIknKBUYBbfEaDeI
	SiU3AkO9JvG21/61Mn83MGFVDHT7BlSV/0LA9lR8JGuTGF2TTTQASqtf
X-Gm-Gg: AfdE7cluzDYwak+l/n4EE+4m5rG4eZIPWZWig1gyX+QmgqOts567885TduVhU6m/OmC
	XaddoTDdzaFiyzjGIT7vmCJ3e3G/xGqwIST3lqEmrymYmuKbomjNOk600lG6NmYkX4oDfiavOES
	e4mf7gN2Za/Y0XlcWcuI8I7DA1eWJ8bQQEtkLHPbkuNh+82kAJ/NpXFM7ON9MXz+Ij19AcEV2kC
	fJOp4q+uEBGt92bc65GX94nCPwYUcTNVJTsh3+ktrNLqrJI3nYIlOAvmzjs/YJ1Xf8AnvRiGRfM
	bDt9GMfopi3Nl0by/ZS9ysFOK3Utl8to/Zk+ERMQ5TErUu9NoLfKs6hIYW0sE57ZZdb6ZQOkf9z
	R3KE8XcMurLSzLRTERqhaXy2S/7grXVoQ/aLNeOmcW9+TGTpUzKk5z+f8vWQMUapkFeGQBy68SQ
	DkIjZhww==
X-Received: by 2002:a05:600c:4443:b0:490:44eb:c1ec with SMTP id 5b1f17b1804b1-4923f582c6dmr168656025e9.27.1781985674088;
        Sat, 20 Jun 2026 13:01:14 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788226sm10708354f8f.23.2026.06.20.13.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:01:12 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v8 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Sat, 20 Jun 2026 21:56:48 +0200
Message-ID: <20260620200032.334192-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260620200032.334192-1-l.scorcia@gmail.com>
References: <20260620200032.334192-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_130116_534066_6D9B13D8 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0


