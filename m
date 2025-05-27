Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A799BC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 15:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqD0/od9qaSOr72rB1opXGkuaDPzcvzJRRaU7EuNDzw=; b=0OTSnlPF9IDymOSNKkmlVWonN/
	TVOP4VDp01Q1Xscmj74G9SL/ZH53x/z1E0ktZo2A1GTz+vHfdGZhPd4LjRVDSDf40OxQb5qdGVsau
	NwwwJ7JMyIr/xPVKaOUOuKR6u7fV2GSNlkeNDMtZK5a0RL0kFDYfE/H+Xs3ErXCu0QW2Em9s4gEti
	YOMCVHxe5WdxEAh7wEGrGnUk+8w2wHnwZ35ztLxhO0GOqG+jJ4B234Pf3rjS64p6sTh6bJFsXKt+y
	N2HmkWZiDQf+uRUirj1Cjw4m7vcWJo7xT3pEgZQGUrSWL5BxXDj3bpspin1ONz/+I/6g2OAxDX7l8
	bYsTYEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvyd-0000000B1WQ-2P38;
	Tue, 27 May 2025 15:12:27 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvwT-0000000B19b-3ajD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 15:10:14 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso2630571b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 08:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748358612; x=1748963412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gqD0/od9qaSOr72rB1opXGkuaDPzcvzJRRaU7EuNDzw=;
        b=QMw8TIY2nooShFRBpREqr4Tv124uuHtdQLIdGvN31nHSmcIyJpJpwIRPNi83rLy5s2
         SSd0lud0utSavp2F+hN3qxabp9u0oU2Yshq5J0jV6i2MIrUg1WutsaX95riaT8HMSVow
         CMLDf94QtkFhP40UomG+mqdNIpsZOr0/GDVoLJ3TmxA6cM5+PsQMFYTuo5h4vh9Q+c3a
         HLTKH0TO6o6bZBLvsKLc5rfb0S7Arh35T3sOdPfrpI9mUV9uvkTkJoxtjZKukAqBZ6GK
         6LV4eHS39I7L7q+hGpouVYOy2FLAre1flGuP2Z51NZlEAo48eDpd6MMovyGTOuIsNrSs
         tlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358612; x=1748963412;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gqD0/od9qaSOr72rB1opXGkuaDPzcvzJRRaU7EuNDzw=;
        b=PYaFFBJ6uHxaH6O5mr03D2jV7b8doEM39NbPr2UG4nSI7TRKsy0VOPZPbesae3j2kA
         3xjawcVAlQlcQ/Kjl8KM2i/l/NYSKpDiD6k7v/gMR7vF+ssBa98jt/KrufHW1QQ6vQb3
         XQwYwulUbztvCVZYOw+0fET1QiacNhS7o5y/z+dz9R+oJDIj7KucAzW+YqSsCrCjn0yp
         TycU60Ebl/p/HxS1s7BudJzhfOKAiACI9OMYqMB1eAoM9qwcr9BtvCE8VdRpYUx8Gn2Z
         Pz+btSRKAjqIgVScr/I+ySe5IcfK5Fw9jAawUfeXXUdgzDqjvbV+AkVVvH93IIH9smIY
         jmww==
X-Forwarded-Encrypted: i=1; AJvYcCU4JdIOF6jhV9Ei1/yl+vKRIbCLEhJ/swK4uA5wcCMAZg0abAKg94WC/rAdL53ZHv1OyGlcN0AKU5duBaPz6J6x@lists.infradead.org
X-Gm-Message-State: AOJu0YxaaxYJL3IJEyGSfHFZCI6DYh5Qbf+Kxgjwniv70j/oizqttaZz
	rAGvKrO2q7ulE4sHLyA+9AMY5P+vkZHgiZKb3t1GydVd9LDUdxlASYcL
X-Gm-Gg: ASbGncvGH0ju3Y4Q4fDQGyue9i5ro1LDuEGD3Gw5I6oQkORURyyL0aWNPKPUx1sWX5T
	W7wHFEeZCaMX3weFnFPxv95Sll80/ULoxAjkQdTFFPh3o6rvj0vPqkE5f1ruU/PfW1DQrssLz0E
	Z0YMHVmzj5O//SHErHVXs/lF5zaQErOmY6dwXperSho9o9mUtRgwXRprq7usWCYy2Eaz0+jluH8
	rNl5gnypZUZLHZkL7meevkrBQWN1X4CfoUrGSXV3c/P2pI10UtV9w7ro7f++bYd8RH7OGpuRim4
	M3NL4E5JL0JhFQHzlmWIIyP8Zl4pklVZXTfBaTONxZAYiyWNBcdupP8DqWPgFiknLa3CKfZ/
X-Google-Smtp-Source: AGHT+IHKy3vWfh1PGy1ku+o9RNhskr/quenhtttfB2tDE91aGVAU8V526XbxdfEk89gY9R6EfOonTw==
X-Received: by 2002:a05:6a00:14c6:b0:736:5438:ccc with SMTP id d2e1a72fcca58-745fde87a75mr18828988b3a.9.1748358612384;
        Tue, 27 May 2025 08:10:12 -0700 (PDT)
Received: from dea88b1475bb.. (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96de11csm18869987b3a.31.2025.05.27.08.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:10:12 -0700 (PDT)
Message-ID: <6835d5d4.050a0220.14ffd7.0e10@mx.google.com>
X-Google-Original-Message-ID: <20250527150946.2815348-1-LeoWang>
From: leo.jt.wang@gmail.com
X-Google-Original-From: LeoWang
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com,
	leo.jt.wang@fii-foxconn.com
Subject: [PATCH v4 0/2] Add Meta(Facebook) Clemente BMC(AST2600)
Date: Tue, 27 May 2025 23:08:47 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f168126c-e0e2-40d3-9b9b-2a5002a75474@kernel.org>
References: <f168126c-e0e2-40d3-9b9b-2a5002a75474@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_081013_899078_018962AF 
X-CRM114-Status: GOOD (  10.08  )
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

From: Leo Wang <leo.jt.wang@fii-foxconn.com>

Add Linux device tree entry related to Meta(Facebook) Clemente specific
devices connected to BMC(AST2600) SoC.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
Changes in v3:
- Dropped blank line as requested by reviewer.

Changes in v2:
- Fixed all dt-schema warnings/errors reported by checkpatch.

Changes in v2:
- Added 'Acked-by: Conor Dooley <conor.dooley@microchip.com>' tag.

Leo Wang (2):
  dt-bindings: arm: aspeed: add Meta Clemente board
  ARM: dts: aspeed: clemente: add Meta Clemente BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-clemente.dts   | 1195 +++++++++++++++++
 3 files changed, 1197 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts

-- 
2.43.0


