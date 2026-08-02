Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C664C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 21:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fuXEqimyffgC3r6i7frZWabp2CjAJ6czkCeh1u+cNBo=; b=RrgTcH2HwBrOP1CB4NS8q+s5TB
	X5Mrf07TBaj2Y6dmCveVhtwHMmGN09+CwERvevKYraa5r1q7EQM/5vHRWNCttapjYsRdM6+PHQdpF
	xjm0WRLQuEzjHejEvq50ic6spYgh3IEmjS+bOT+CUz1LlISt+5ynfW7uY+ewsJ8f2EkjxB2AYuXCE
	11P2J20GkhA+lFLNuWwYV5wIrPyDv8qYlcCcRWat2IW6vtggEASp7C/Ek7d8mR1yNrkYv28X49j/5
	0JgAUU17uCd6RFbshW56jGKu0MDwIrGGqdBVI8TIKAwKJaLF4l89f0uG2rRWGUPLFBD5oEx+goo/o
	VFa41y9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqdyV-0000000G4U5-40BE;
	Sun, 02 Aug 2026 21:44:03 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqdyT-0000000G4TO-1vmx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 21:44:02 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-8efec2c28f8so18200696d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 14:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785707039; x=1786311839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fuXEqimyffgC3r6i7frZWabp2CjAJ6czkCeh1u+cNBo=;
        b=McKcFFCIzdQtsgWQUJi8CWFlYKPOXI48gLD0PgIPmwIk4SyiH0FTlGPzd0otq3WbE5
         AqB4BYECUn6r3U89VZOngXvcc+qMWxer9f/hfpJLmD1nYRxcAJ1XPVnm39j9MBfPrem0
         JFEL0E88DKWv9FhV55psTUsZFbE4GSX5F05EmjkASD9ciFJo8Fnpstu8vERLGkD+iDJQ
         L5XVfyHm4M1jSTncIx2J8WVE5z+D73WQ3/bPcjuv0wu+s8Wovoji/kYPXvzgFPajotwL
         T4QURF1IIvCtIs9gyE8rqoGOWn6y01hn6aDKHc/f8DFEg4VYFjPIrpXgxPkKLUvIx/Wi
         RPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785707039; x=1786311839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fuXEqimyffgC3r6i7frZWabp2CjAJ6czkCeh1u+cNBo=;
        b=Y7jJ0Qf+3TOdXkU3epzAJyFg3mxBfIHoe+bZhbo1V1JEHa3c/SkzjB5rOjdV6hkVVM
         oQsWE9UCIRgQn58l1H3u+kywiJ0JDB9V6mpzWY/7Wh+gYXympL6Of7w21wGN9wDzG11S
         ROBP9d0CIn2i4wc/LXiakBEi7eABgzuGH+vBOQHyb5Tgj1sJRpbOZIGaHaQLTdgL+1Te
         SmkstZUufn6sEVpo5c6OBuBKbwFS0VxduOe4/ZL4/Y25DzdpgglVUWRpMFnLoZeFGu6D
         ZiA1B8xjwoqHO3naWiDffbD9zE/Zkoc+rI8uTOdJQPotvCo2RSkXC64lVm3zZP4WDhzJ
         a69A==
X-Forwarded-Encrypted: i=1; AHgh+Rq6QXyLiZ0a+1Kzh5llcdmnAbZiQrgzremcgSvSU+0gAmtuOvesu0+R8SDD2HJ1qm2rDmYBAkDtXD2zentcPDDR@lists.infradead.org
X-Gm-Message-State: AOJu0YyRtuB5KWyLnH1wmWWPP0utELnqWtbcEVy4RIc7NVkO0zmi2ex2
	FSy4TSh86ue7ObI9OPtX9aAMnnI04+dxvmjAyBCa9IchzCoJx/Bf7qak
X-Gm-Gg: AR+sD11EO7HBt986vCa6wjoGl2baFsnJD9/OrYTYRKUNMOXLXho47oUKy+1/FUS8CXq
	oumBgmIBgj/9m8AuWmlR87PMkpxdsINZVRleZeCJ+9pHpNkxC+jzKT640oWprCMx4IAFJ9aP/l3
	wSN9DcWuH51p8PUHHZjfBvergGqtHeIU4F7NNSfZ2GJuqErDM/rUCJRaWJjcPa+3ej0XNeqdnHi
	8/QAL+wcV5XcfCVXF0j9MOwLywzHYbpIA4yue+Q17Z6MhZVUpOlFbMw+g5r6mho/SrtvNYoCoV2
	tblWOitc2OD62UYpU7bWMU2ctn2ElH5V650H9e7qoKedC3jdHLIBsvUfqjysTgBQ1rwK5Q49mxe
	d26bNhDX2TotO26N+z4No04wiuT/KB9L7DK8/godSKuoj1MgD/fFxKj18CM4+iZTo7lZVACEAGA
	vuNLtj8LH5ZQlv9n5y7qO8kwhoDoeR7mLJlGbuWoMH2lcNSpUy9hB7i/QiYXzlVNGztpXYkfz3w
	maO0EBOb4SpQOK7iYpRMeCLvXIqxkWY92EncDasfd8lv84gLJJVLKTw9NY0XY1Mv2TBuAZeAVNK
	FEjX59RVi59TL3UFra7rdmCMV4ajh2F/omMxDa5ZUv1/s3vB
X-Received: by 2002:a05:6214:5403:b0:8b3:f911:c1df with SMTP id 6a1803df08f44-9084966585bmr185128876d6.21.1785707039288;
        Sun, 02 Aug 2026 14:43:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908435b6778sm60683266d6.30.2026.08.02.14.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 14:43:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mailing List <devicetree-spec@vger.kernel.org>,
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH] dt-bindings: net: add nvmem-consumer reference to network-class
Date: Sun,  2 Aug 2026 14:43:54 -0700
Message-ID: <20260802214354.490074-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_144401_516947_B795A22C 
X-CRM114-Status: GOOD (  10.25  )
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

The nvmem-cells and nvmem-cell-names properties are used to supply MAC
addresses to both wired and wireless network controllers. The wired
hierarchy already allows them through ethernet-controller.yaml, but the
wireless hierarchy (wireless-controller.yaml -> network-class.yaml)
does not. As a result, brcm,bcm4329-fmac nodes using nvmem (e.g.
bcm4709-linksys-ea9200.dts) failed dtbs_check with:

    Unevaluated properties are not allowed ('nvmem-cell-names',
    'nvmem-cells' were unexpected)

Each wireless driver otherwise has to add the nvmem-consumer reference
individually (qca,ath9k and mediatek,mt76 already declare their own
nvmem-cells/nvmem-cell-names).

Add the nvmem-consumer reference to network-class.yaml so all network
nodes inherit the properties at once. Wired controllers keep the tighter
single-cell, mac-address-only constraints via ethernet-controller.yaml,
which still apply alongside the relaxed class-level properties.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 Documentation/devicetree/bindings/net/network-class.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/network-class.yaml b/Documentation/devicetree/bindings/net/network-class.yaml
index 06461fb92eb8..f7c8e24016f7 100644
--- a/Documentation/devicetree/bindings/net/network-class.yaml
+++ b/Documentation/devicetree/bindings/net/network-class.yaml
@@ -43,4 +43,7 @@ properties:
       maximum frame size (there\'s contradiction in the Devicetree
       Specification).
 
+allOf:
+  - $ref: /schemas/nvmem/nvmem-consumer.yaml#
+
 additionalProperties: true
-- 
2.55.0


