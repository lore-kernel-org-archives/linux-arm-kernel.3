Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333A2C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 09:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/V8YVhR3tM4id7z6YANMS0pFBWW27MU74/CKtczxu7I=; b=RGiYhoJApGmpzK
	zbR99z7tLmQfRrqKMMu00hki756yj33RVUn9Ld0Dtrr093iMijKxTsTUvbemkLhkIsX1Ivyp+EOpz
	asJ/i9MevkbR/oDGsdPyK8R3j2rnN/Kk5oyFEPXd3TTNaXmUtoPbbKO/m8nC3ILEPLdOTaEl1t+7A
	aZaz6ZMkvs+ils2nsUGQG4GUUMrXSkTfCKFAIn0SqVnxpyL020SW4iYyizHhTpfmrGcBK8CKQPiD6
	fM6m1Pct6ATdPJMmIZQmMiZEHTiBF2TqiufsbhzxoxWNtKRsGnwkR7LxVueEST3NB8Ta0V+SMFfYS
	rxrSKw4azvz3/r8ZcK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXTZ-00000009rPv-1bAW;
	Wed, 22 Jan 2025 09:56:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXSF-00000009r7H-1J6L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 09:55:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso46382955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 01:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737539721; x=1738144521; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/V8YVhR3tM4id7z6YANMS0pFBWW27MU74/CKtczxu7I=;
        b=wLT4f0C2yKEbyJ4jFh1wxjbXuDnlRsFlRSSIou45eqbtPBdClu2DCoUfu/kbfCccC7
         eDAbUfhNDp3O6SWfm5T3ontTIyZTR5RBtoYFmkW90KcfRV4TxvWUtINJobAAkLs6tR8P
         GMKLQ6k1zUye4FLZXAuE0BuMi9bFpqNV4OscOAontlzrd6wSKxdNGPMJ3kH/Bad4V0X0
         twP4IdPGMGLxtkeYkqQD7GJpkxxYL4slntBP6aIKSuxgxSMzZv1gj3mqGbWAAK24og/P
         YMWjblWnacOfxDynhbW7PcjxfyCiks2bWCVceSjyKxbpNqvr8nhsKxW6PCK74gBgZVVv
         YcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737539721; x=1738144521;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/V8YVhR3tM4id7z6YANMS0pFBWW27MU74/CKtczxu7I=;
        b=WG5gkvPXVdoyob/wGnM4wnduNDt5/vCNMVF1iXv69fepUNSxe2a71PI3Fw+0Tsrml7
         a+faxKFiMADBxGFzXp1OX9DaT6ypqtL9gi7oC214BIyN8+tVynqyPL5VqPl176HZD1nK
         mKuILn7ywR1nwCs4y+Oj8jCZDGeUL7+508aNaPmFQ5QFDX/Kc4xf7LWb6l0KNsAO1D/k
         HKRpm14CCYCVIkd/cZVQUsZAxUHSNUV12kx9UsB34qcjvs1GIFMTt0Gg74KzpArqDVz6
         AZzm4U02Bif+YsgUb298tLIyzbY5FvX90Yd1d4ibgnj0m9Pq4G2Knyrhv/va94WMDN0t
         bo6g==
X-Gm-Message-State: AOJu0YwpBwqw/IgqfO20DPtBM7S57Gc1UyOcdEZBbVqRQzGB5DKKua9k
	3PFHwtQsU36aLKEaHgDhw3yLi3rTo2FHyD1nYRlAUL9oQNyaJkAlX3v4Ps0dL7Rec3ZG9nw2V1V
	4
X-Gm-Gg: ASbGncs9ZUgeUG5LNAi7XBmhFis4tV7DVsbAQMoUUNlNtb7t7PNwlxVL4WGzZmLmRYj
	zHVq9sjtiwkk8SeIqnc8jWcwe/DGou1KCO/SctK3ZP0i2Fd+0Ox/0rfuKayhg9GvQNI0hJbHt7f
	qTFxwM/lIpdCkizaeDKsbuP8MsVXiRy/C0zmbzUVa6CSzKvsjx93/sqTdYpnFK8HhPqWilIUnaM
	zOOOpBkpyhPZrMGXofqHlc7eXMr3FoAa7U2uQzXQ+wNaSVSNJn9FpOdRcWkg3XjdM8=
X-Google-Smtp-Source: AGHT+IGTGVFAeu8DoS3c875eDiHS/m+NSDnxiyIxp+DbfiMd4780zIOfrrcuio5d52xUVNwS6P6HVQ==
X-Received: by 2002:a05:600c:1f10:b0:434:ff9d:a370 with SMTP id 5b1f17b1804b1-438912d1d49mr210346205e9.0.1737539721241;
        Wed, 22 Jan 2025 01:55:21 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31a324asm17834485e9.14.2025.01.22.01.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 01:55:20 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 0/3] arm64: dts: ti: k3-am62a/p: Add r5fss nodes
Date: Wed, 22 Jan 2025 10:54:48 +0100
Message-Id: <20250122-topic-dt-updates-am62-wkup-v6-13-v1-0-f74835b91da9@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGnAkGcC/x3NQQqDMBBG4avIrPuDk2ogvUrpIjVjO5RqSKIWx
 Ls3uPw27+2UJalkujU7JVk16zxV8KWh4e2nl0BDNZnW9C0bRpmjDggFSwy+SIb/WoPts0SsFnx
 FF7h/duLEOUs1E5OM+jsX98dx/AGatNcHcgAAAA==
X-Change-ID: 20250121-topic-dt-updates-am62-wkup-v6-13-4d15b4e9e996
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014; i=msp@baylibre.com;
 h=from:subject:message-id; bh=1p9LijuNlSQPGzFnzCwA50BP+pPK9y9ZrlhOfPbGu/o=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNInHCitX91nsyjw1QIeC9Hp0itPC+6z31doZVJb/S5Dd
 YfObvvtHaUsDGIcDLJiiix3Pyx8Vyd3fUHEukeOMHNYmUCGMHBxCsBEUhMY/qna7I1srnpR92VG
 2cPnUZJK/DPZv5RcYi3vaC5xXcSVKc7I8NkwqeuZ3vwfb5e+Ldr96Iscw7kb51IkNaN/Hl+882n
 lERYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_015523_359617_D765CFFD 
X-CRM114-Status: UNSURE (   8.99  )
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

Hi,

am62p-wakeup already has the r5fss node defined, but it is currently
missing from the am62a-wakeup domain in the devicetree. This is added as
part of the series.

For am62a and am62p starter kit boards the r5fss memory region is added
and referenced for the r5fss core 0 node.

Best
Markus

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
Markus Schneider-Pargmann (3):
      arm64: dts: ti: k3-am62a-wakeup: Add r5fss
      arm64: dts: ti: k3-am62a7-sk: Add r5fss memory region
      arm64: dts: ti: k3-am62p5-sk: Add r5fss memory region

 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi | 25 +++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts     | 11 +++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts     | 11 +++++++++++
 3 files changed, 47 insertions(+)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20250121-topic-dt-updates-am62-wkup-v6-13-4d15b4e9e996

Best regards,
-- 
Markus Schneider-Pargmann <msp@baylibre.com>


