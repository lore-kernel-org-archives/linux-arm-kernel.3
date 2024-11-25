Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339A1D3B7EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPnYr8aIDFby+4dgQKR60j9AMYM1qDxkn1rBoSKaia4=; b=RAn+vV2wEMKViLVbMBI5EasZrV
	7C81Nb6IgtyMAqIGtx9HKbu9fVgnifDaDXovpVuRBJ9z/HesdhwGFsCjujN+H/HvI5uoSpW10oxvS
	y1Cqo5hAMHO+lcaPl5Qb08wJf1ASC/XoWV91hEZwufObSVHHNsWegYlNnRTmCWw4dYK9xqAQSUCfW
	sJeO7Vv43J9F4thwN0IxUPhFdvTWn+yAWCSogu7unu7b6+9TpR3XQcq9lPg3rr5tocN5H5ZRFJPXf
	Y+NhUQGUb/cprOqmlwKCncIICy1mm3ex/tadKPHIlNn0EJagZaOyD0lXWTNr/cAImPyQmZQh9fjZY
	JoduQEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUZT-00000007Ovy-0wOv;
	Mon, 25 Nov 2024 08:35:51 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFULo-00000007Mbx-03Yg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 08:21:45 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5cefa22e9d5so5009578a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 00:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732522902; x=1733127702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPnYr8aIDFby+4dgQKR60j9AMYM1qDxkn1rBoSKaia4=;
        b=j2TAza9xRBN8QDTVs0eHv0GDrtbgq7JdbJnMs03gHakxJYWTZsB8tj6o57Rjeax1RR
         UkrJgYenyzd3bkWSC0WkFPkzy+lWNSuft3Coc5o5KrQZ7iwAMaZ7IkF/qZifcXYI6vOh
         +AwTqRnqe8TKlEln87XXWL7rhTuoWfNQ/sGX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732522902; x=1733127702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPnYr8aIDFby+4dgQKR60j9AMYM1qDxkn1rBoSKaia4=;
        b=Iw/mhmAv8AuVcSLgbVdauPYqjMP/NrmnrhKA/vrYL1S+fSB7wR8r/+aUuY2DkqEv+P
         ogtv4TPOZln6a9+sACvRmAiDd8y/NEJM7x/32Nt3oLqEty2jpMXs2afYX4adEa8y4RdF
         uY7s8vkP5U26KAQb9x1HQdSxMKfbCdZof18qmoP2x1NDVQpQmj9Ts/wMaqL7dOERJSKc
         kwv6NwhXdfFiupgqMUFvDDO57MLnTQU/K00TfSiIgVLNXnEaXcYF8THCkY038pnzJz7Q
         TmgOZtQjyF7GzJLdHYg4l+34U3x61INFcHxXX3vRQCQ9GS+t8CZzA6dbB4yhqLrnMrUy
         T+tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXxwe9u6S/AsUc3uGnVJsUmY0O506pA9D11O6EN0+43pKNkero6t86L2Cv9k0n9PdcZlX22848/Fn563GRc2lN@lists.infradead.org
X-Gm-Message-State: AOJu0YymbMxBE4VcSeLerx7TWJeGm90DgNsCnWqTGWhBCXEg6+gUuAXu
	Ov0qGyAxn/1gv5oygAWO2+KU8tJ458ZnArL5kwFohIn+mv5CVbLdiNVKTdn7Ag==
X-Gm-Gg: ASbGncvDZVWEhLsSojEgNNzdfW1Z4dV4xJ5JTOXeyabd0WG8yQaVen1cf7yF2bNN6gu
	2ilZzG4MWln3KDCNs7HUvg5k5OcDwKF5k9OW7bHmtZISJEdmi7TFRXUpHJVwlA1VV+rxJQUFbLt
	41N9XVz1dGH+CQUw+cr07UjErDjzCJcjSDzb+Jb/tB0xdd/Bbijci7nxSfvfevuI9mYYX6AXqIJ
	QdNMJJICouFKsBH11eIKtrHKicvHVVnK8OI/7KOVZPoy8fo58SBDIrpwPoqmPKcC+15QUkPcK/s
	OqSSiEMw
X-Google-Smtp-Source: AGHT+IFnAzkhOOadrvOXWSDGzf+kPfjLpDwohhUu4l6LeAbOtGTBnyhEYnIeoSDJDix3CiMDzFUNxA==
X-Received: by 2002:a17:907:7712:b0:aa5:1699:e25a with SMTP id a640c23a62f3a-aa51699e2e7mr827925366b.10.1732522902261;
        Mon, 25 Nov 2024 00:21:42 -0800 (PST)
Received: from localhost (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aa52e45391dsm318503166b.60.2024.11.25.00.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 00:21:41 -0800 (PST)
From: Wojciech Macek <wmacek@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Rafal Milecki <rafal@milecki.pl>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
Date: Mon, 25 Nov 2024 08:21:28 +0000
Message-ID: <20241125082130.2390310-2-wmacek@chromium.org>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
In-Reply-To: <20241125082130.2390310-1-wmacek@chromium.org>
References: <20241125082130.2390310-1-wmacek@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_002144_067791_2908E70A 
X-CRM114-Status: GOOD (  10.65  )
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

Add an entry for the MT8186 based Starmie Chromebooks, also known as the
ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
a tablet style chromebook.

Signed-off-by: Wojciech Macek <wmacek@chromium.org>
---

Changelog v2-v1:
 - Fixed items/const bidings description in mediatek.yaml

 Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d9..6191a5320c148 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -263,6 +263,19 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
+        items:
+          - const: google,starmie-sku0
+          - const: google,starmie-sku2
+          - const: google,starmie-sku3
+          - const: google,starmie
+          - const: mediatek,mt8186
+      - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
+        items:
+          - const: google,starmie-sku1
+          - const: google,starmie-sku4
+          - const: google,starmie
+          - const: mediatek,mt8186
       - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
         items:
           - enum:
-- 
2.47.0.371.ga323438b13-goog


