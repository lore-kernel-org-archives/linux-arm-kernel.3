Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE0CCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 11:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZaGycjt36+NJT+7JRNn303P5y+ponQJAIIaK3c+nUEw=; b=vC7ljYKvDQ1b2jYycHJhO1uk43
	kP1wo0qKHTnjs0uEE+ut9Q1t4J3pNdoL7u4hyl+jgzu9A7dxMg0vWRH3E0nc1bhnk7jx5mqR8Udyw
	ZIlj82MELnCMb4TuGSoV1pLVCtcAodB7wAFEqAd/s9QmLc9AMEJ7kGL02OjJvXYojEF4ui48wXAG8
	7nRoeqJ3KEb0IDhCJozMziGzLU3VE5J3bsGWJh2FUK+fWx4FeWGh5rNaq6jJ4A61t+8cFGkBxT47Z
	LhFA8kgMdjo3vDnKceptbCDxdS2MVz5he0BbnLVbIHfN9bV37weycg6ZQcia6PeKAPnydpdo9/MNT
	1ENMMWEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyq6X-0000000B60t-1ClG;
	Wed, 17 Sep 2025 11:13:41 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyq6V-0000000B60V-0yox
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 11:13:40 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b54f48ed1a5so322592a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 04:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1758107618; x=1758712418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaGycjt36+NJT+7JRNn303P5y+ponQJAIIaK3c+nUEw=;
        b=qpdgYyEaUPtJQGfa7HLisDTlitJpX7eyLRuA2JDJNUcUVqdj/NpJR45rO+AAtH5pVE
         epRMJdq5reOlEsI2MEpn3pgP5Rkjxe41f1niZuTebnths8QBMKkNzjIqB0Iy/Ybv8O/C
         PRTIogULW7Y2+8zWOfWfcCKB5Rxb7GKGvmABmpJlCs0+f96TjwRGOE87R90tSWr4iN7U
         Spmm1Hxi2+pNFsWx3niS/4om2nxy6Jt/A+S6VWv3xCYsUbbnkfl+muX+kMLI5CbVGEqs
         6MzuZ9DKQb+S+zW2our7V6Zyw0aiIicZFZ6Q37pjmQ5G3djNr69YO0PqvWh75wMAsqx6
         fPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758107618; x=1758712418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZaGycjt36+NJT+7JRNn303P5y+ponQJAIIaK3c+nUEw=;
        b=JOgvHvEcqpJ+9m9/iVMjrUsi6Qx8ZjwEdVtkojZMBy5oD3ibfdN3D4Del7jZ5fj5SN
         e9H1XQzCWSdDPEZlm39j3hWDuWSTEef2CnaWQdZlk38kmB49L7ldeMN78rIA2WovGw7o
         K3Rjl9a9sqs0rYSM7JDmZ7SRiUrlei5n6Wolhqz8zV4EC9N75K4uip2BAbhSvZUe0AN5
         E3sjpO9k/PX5hmgs840kk+SIAN80OGRJMTtbuOKjJdc8wEi+R4Otz/ZMHOAm0q5VqMCr
         hfptcJ143UoLtwI1xAya9laZwGUxyIRjepQ3nhnjoiRlPI0OtQxE2x9PHEB1ybAqLUxw
         YUOw==
X-Forwarded-Encrypted: i=1; AJvYcCWuXDx9dtScuR6UGn+zJDnBfqWy1GZECV6qzdVVDQnFnCl0MqJlALK1ZeJXmOUKZp0btvRzJqvIT1za60dVfTfC@lists.infradead.org
X-Gm-Message-State: AOJu0YymQaPO/q+g5Aia9+SFy/TJc3UtTQglj6aabkMwqqtE7F6ymzmg
	0rj33uZS5wSijV1sL1tmCmn6ar34tYkZNm2MrrWRFDdyYeCCdur3CrFI3IsDp86Mt+w=
X-Gm-Gg: ASbGncslWqj66yqwYN7a63g+2ZOjeDmcw9hoe/IDl5mda7e+6q6FZ5mr83WjbV33FT0
	m80fKFlCABrabZrrLsyHjOu19/4AH2KcJaxfTksNkWCl7VIDN6GN4kM33zJPmUc92HdbuPUw7nX
	BvtpSG+BYNTsXpajUZ9khWcWwtzppBRCdDdfIXr+16tC+D5y3ymnftEMbvb7c4S1TzEcCYGCMTN
	sQl8SAkjxIYTyb04Etlv2lp5Bdr+xR58KEcc6hQEAQezZoB6Yub+bB1hnWf8EIQZIFhxs5xZQkc
	kVIGYP1Y2AvAa8toboMa6jHI9Utl6+Jugk1NRBOFcEpQNOwkSc4L6AKwI3ECe+vWB9tK3UKAzQP
	JVBAV4rzSnAJJ/LIulOvUquKJNmzPqPvlnpit2ywt+iSQVQSfEcjV5JCS
X-Google-Smtp-Source: AGHT+IH6X33FWxaAtcbZuf8x752Ux8OoEIl6JrI53rne57TK5RbZLOWAhZftzg4xVFvnL1vFWW1L2Q==
X-Received: by 2002:a17:903:2f03:b0:25c:e2c:6678 with SMTP id d9443c01a7336-268118b3ecdmr23173225ad.5.1758107618458;
        Wed, 17 Sep 2025 04:13:38 -0700 (PDT)
Received: from fedora (cpezg-94-253-146-122-cbl.xnet.hr. [94.253.146.122])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-267b4ae8808sm59079655ad.132.2025.09.17.04.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 04:13:37 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	benjamin.ryzman@canonical.com,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/2] dt-bindings: reset: microchip: Add LAN969x support
Date: Wed, 17 Sep 2025 13:12:35 +0200
Message-ID: <20250917111323.60781-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_041339_276418_3B281F19 
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

LAN969x also uses the Microchip reset driver, so document its compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/reset/microchip,rst.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/microchip,rst.yaml b/Documentation/devicetree/bindings/reset/microchip,rst.yaml
index f2da0693b05a..4d4dd47f830e 100644
--- a/Documentation/devicetree/bindings/reset/microchip,rst.yaml
+++ b/Documentation/devicetree/bindings/reset/microchip,rst.yaml
@@ -23,6 +23,7 @@ properties:
     enum:
       - microchip,sparx5-switch-reset
       - microchip,lan966x-switch-reset
+      - microchip,lan969x-switch-reset
 
   reg:
     items:
-- 
2.51.0


