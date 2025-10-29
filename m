Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6B6CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wq8ujO9Dpm/7YPTf3iw45Jy/+tYmVu6IfrY/4dh0q7w=; b=g5Lurh8UpOIo16nPnwZ5cqNUaM
	ei9qADQQLhL+p3iNUoWq4I3+aU7JC1hZmqyj81pDTW9AHJyf4b65OvIMJJfcynlOxSlgbo+Svcxlo
	P548FFqMYgu5dL/KwbM0Lh2kCIG1/BPWon0EtechDAH59xL2aHozDWFu5E567mLxkNR3gD9aNDlnk
	ICaxMQ5tKdOOErGR8XPo0DCy7cu+5v37HbH8dTp/Wjkq0gY69/mKA26MQcGe7q6+KNPBXQgbKCsKO
	5b5oieSCr/i2yykc8VIox4/jEfymqu72YoB7lKKGY+vyNhNAOmpVOw0RfDWoMUVSlqvtslw1je6DE
	pftoO4YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE40z-00000000tNz-47yS;
	Wed, 29 Oct 2025 11:06:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE40z-00000000tNe-0S6A
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 11:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=wq8ujO9Dpm/7YPTf3iw45Jy/+tYmVu6IfrY/4dh0q7w=; b=kdpZvdKHy168RFuxgkdRe5tadY
	U2/WI+r1WwhrddylSg/fQkvmersia5eoY8YDoMdRXkOrTEBrS2h10G9QXi9JnspFcCEx/2gShMx2t
	tn7qLmLbkxLOPX/6E+9syKyUmD++X+VnlZXxZNM2mEcnJ89C3JHDQu0XtkjRqCy602lojAhyTkRs1
	ydH5zrrJs+qJvvWV3MyTQT5G1pIh/0XTU3iwrJWESlHkSmLrWFJXgaJVbQQuryFLntGUT/pu8R0T2
	VzyVj5RwigbYQ0j+7OlYlhFMpi77Ir6wAp2JFzDjMQr19sDi87n5QmmnmcbouW4HY2yTmZYZM1UNI
	SI4VMg/g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE395-00000006XRe-3t4Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761735990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wq8ujO9Dpm/7YPTf3iw45Jy/+tYmVu6IfrY/4dh0q7w=;
	b=JVuaWFH9VkpA2IHJhG3/4iPhsCYCRrgaucb2b/lwliWLKAipVpioOmSbVVHyE3PWrYWnMp
	t0FoY9uogDQw96HQr/Ye+fFiXCEXK8OLwPz+zY79AgLmxdU+Dou05KB1Tm69A/bdrMfIie
	2cz7mIDnQlwOgElAZcZx/TrallhhirY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761735998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wq8ujO9Dpm/7YPTf3iw45Jy/+tYmVu6IfrY/4dh0q7w=;
	b=Fi6yB/xQqh/k3LnDBpKIzuEW45mvxppzw4oXZ+id67X4gN0WRrKG1i4hIHIbPzF3IkHdSI
	G0uBW3JVbQ53KEQOmWXoSdsULlvVuNOp1b5EUBtUtJMmwDBrDOxS5uzgrhriHhY7PLKoh+
	q57gTH0s0CFjOwbiVZDgO1+RQQ+LRZA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-6yAUS-QLNT6qps3k7hh7JA-1; Wed, 29 Oct 2025 07:06:29 -0400
X-MC-Unique: 6yAUS-QLNT6qps3k7hh7JA-1
X-Mimecast-MFC-AGG-ID: 6yAUS-QLNT6qps3k7hh7JA_1761735988
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4298da9fc21so2382039f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761735988; x=1762340788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wq8ujO9Dpm/7YPTf3iw45Jy/+tYmVu6IfrY/4dh0q7w=;
        b=i+o71DtgX+igmn1rlDbMgV208+2AjOOhTcPiiUZfr4PG2Ux92FV+0tY6Dxc4FB0PDu
         8Kz8YkC2HhQ0UC6k2VcKHJQnSed/Ek5wtnqqJdk5v4D2YDvOWaswMZ37vkJJBbBWxIbk
         w/P8320kN52DC1D4xTGEMcyPqJjm/JPu/IDOuIzcFwBMlmyYfMRc1WWtOACZmdpPmGyv
         y5Kv3G0q06y+zK2+obFSy/4SKfy4juv19cHS83COVuHFj2IWveJkN1BYWAJ2xyF79US5
         APnLywq/90NemAbJUdZJlGRDrv+h7HE/wy9ut7sbqr5O6ofFUIcxsxkIc5QcqQ3t067k
         Awyw==
X-Forwarded-Encrypted: i=1; AJvYcCWsUhiIAIHJ4HZ79itZqQlSD2z6AxgL6BNecJuez2xW3kER6NtZOPKXhjP08hmNeLg3zh5+Ev9ZsFyZE6yq/Aq9@lists.infradead.org
X-Gm-Message-State: AOJu0Yzsia5bbAx8nVNRU8YwQh8X1R1p79DvJ+kSOs6WFCaf5ul4LM4T
	K6BHj89VoKqAv1OCyo42YE/A6rJFwwWkFeAywgvu/7CZNAe4qwhegwkJbud0G6rjXg9AxiJ4sbT
	PZPsFw9Da4P7glOAlXkpWelNxRGqtVVDeWMpdMa9tK2eTGmo6ZDwMB+fMXkOaYo2h9ofBeCHvNI
	PK
X-Gm-Gg: ASbGncv29O1ekBC2AwM7LpuPI8CGzxaSVpf+fWE6DKjbnOWZ50smc+T15JFDB1zTqj/
	zYBQhXGRnZr3tIrhykZUswsMJRCmEQFkWSyB/pZpynDn9rHfatFgPVXNnbAoEe4SQg++TbjeeT7
	B3U+8WmvASArAL3wPeZ6gXI7UsJ+qlhIIXAd4AHP3R4adPPIjK/GLL7m+QsHQsiIT3FqtU1oXMO
	RwPVLRtGeicTyj+2l1JHSSgtml+kIc1Ne3pxl/wAhjnczmTkd6PIBIG2qZw2zFWjdDz13HBrl+5
	T0JgQyAoSgclw722uJwn3yTaagNx3tBk8Zw4nu84FKeZuTYkBxAMX0U0W00FUdqU7feznEClhJN
	EOFbSTlQxOLpkRUtWCb71Q+hAeyQpVBvq/9oXLbJAUnd7ML5G
X-Received: by 2002:a05:6000:2882:b0:427:e1bf:13db with SMTP id ffacd0b85a97d-429aefd0840mr1957014f8f.54.1761735987808;
        Wed, 29 Oct 2025 04:06:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB8RsWZ0SjBkvUi9VbRgSefrwznyNGIlSzLxxkHxgmXUspqFq3z5NvztJjJO8HtqyDc5C8pg==
X-Received: by 2002:a05:6000:2882:b0:427:e1bf:13db with SMTP id ffacd0b85a97d-429aefd0840mr1956977f8f.54.1761735987352;
        Wed, 29 Oct 2025 04:06:27 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952ca979sm26665735f8f.14.2025.10.29.04.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:06:26 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in MEDIATEK MDP DRIVER
Date: Wed, 29 Oct 2025 12:06:23 +0100
Message-ID: <20251029110623.96661-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uJ8nn8ca8dzZ12gPnUuMtfGKzUrnO0AAGYTOfQ_vJSU_1761735988
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_101114_314095_9DC66A32 
X-CRM114-Status: GOOD (  13.55  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 169ac4bc5bc4 ("dt-bindings: media: Convert MediaTek mt8173-mdp
bindings to DT schema") renames mediatek-mdp.txt to
mediatek,mt8173-mdp.yaml as part of this dt-binding conversion, but misses
to adjust the file entry in MEDIATEK MDP DRIVER.

Adjust the file entry after the conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e428ec79dd24..c094b2fef0fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15881,7 +15881,7 @@ M:	Minghsiu Tsai <minghsiu.tsai@mediatek.com>
 M:	Houlong Wei <houlong.wei@mediatek.com>
 M:	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/media/mediatek-mdp.txt
+F:	Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
 F:	drivers/media/platform/mediatek/mdp/
 F:	drivers/media/platform/mediatek/vpu/
 
-- 
2.51.0


