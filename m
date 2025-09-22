Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F3FCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=unx+477Xo9SXjdzpioJOWI84YS3CAeJIIcacV6mD704=; b=K352fYTDH/4lSg
	r8p7iYdNiyW+KbPeVCP54tpWvDos+pONqcmVWfuQ34p0Vq0WZp9DRv57ZpZZMwTouDa41bzokJIEp
	SHspZn/Kzmgnqf+/razMyqKlebhzjQONok0P/K5Y69xuz+J2ESidhHkC9BLYycY2jQCnLJraz5J6h
	9UOn0uW5x5gnQtEaX7qnHwLmJCiBMmI9v/174J6atB1PArk3jg5tHc7jTWFZ4ttVd3qdQKfUt7Uoe
	PHY2COZVlAEn1QlqQnI4LJ7bhPampXE405S/7AQIc3AYaLICeb1g5XOCAX03SKgK1bdgCtdVqMKq4
	EmmlNhPdw2zDKwNBs4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dR9-00000009yoy-2i6c;
	Mon, 22 Sep 2025 10:06:23 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dR7-00000009yoJ-1cgz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 10:06:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so2944798f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 03:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758535579; x=1759140379; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=unx+477Xo9SXjdzpioJOWI84YS3CAeJIIcacV6mD704=;
        b=aqGQI8vU7B3BTBt4h8hvkHJtygRZ2Hy02VdCPYEMs2DlSrlVLU3GSYTI1n2zS9tJ6v
         EpPe0QxwG/KeOXUTTGG0RypL1ZcBRTuJmpItfuBBvQpd3J/YWPhFf91HXRdXBnBd02RV
         iB5Lxvzx+gV18D8qnIwQqFQMoTk3fy406Oxa3k7H9/yp6+ZA11AJo8oCftPkeYzPYBik
         40LrUxddz3jn+PdPM8gOToig7F/u2imS7I2LuqZbiofipHsBt6hfqgaoW5nf3G1CoSoI
         /Api7D37+KBhZhI1Hy91iAxgCiUHvTF83shr1on2We2KuSIM1CaPBCkkazawI3XPZ9E/
         G1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535579; x=1759140379;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unx+477Xo9SXjdzpioJOWI84YS3CAeJIIcacV6mD704=;
        b=siFVs9tjCrRDraLVA0s5v8CkpRMo/PrhNh4Edf9HOd0mu1v8/na8BsrtRfljM+edwx
         HcGIK1szG3bZyIxAmTEIoXNd0nGAaFwKspctUBumSSnJkoKL1ORIuU1VGOl4msbuQjKL
         4dpmepMnh7PcMvUB0j+GlDs+MB4tCx3gfkUc+cqDY0EvQFUzT2ppKiDHW1F+poSHAgpm
         +iwbQpvzZwmucXO0W3C1bB93RNSXaET3fC6WrORwY4k/mqXj/QVbrifhbade9XFuqhlo
         xO7t2i/BFWG2tOPzsadbT3/jDKYlBmpF95Ukh5bEThIcUyPrEdjP1lnbtu7kpgVoAIfP
         +65Q==
X-Forwarded-Encrypted: i=1; AJvYcCVo7e114pJwFfz3ELmoZAIpry7dp2FE/8Lq64YfiD+7qD8iI5XQMOy1S1LOhK6MJWxxDwVkV6lXfXjyPI/WNmM9@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcaxj+tdYBMQ4J6uf1A+SMf8nmHA5JSV6CsBHeIMrVoZJ5LVbn
	Je/+WLmXfFuUrnuDo4djLEaCTXgGEgQ6i+l2+eGfn8yoMIOYuau034B3UdD3rg==
X-Gm-Gg: ASbGncv/wOUXOoRIZJNxatex8Me/SKQQQvZuEa5amlQJBYTQov9aizrMbcvGQD0GukI
	lB9vHLJRvYYPdLFO4uaVPM+yJwX31quDGK/uUuWNPCyiGE6yuCt9jYFlyn6P6pukt0TQZDyKG/b
	+Ekdb2U2FF+922cMj5Vhnqt+I5e2Mb4ynvGg4QpW6fqTVbR18WU8SZUy/BPCgyXYpOQuErsuZVI
	oZ1DqGkuKlQadhsC/bJZu4G5Ol5xIP5Pn9nOlmncjGn+gRV2w+8XucwF41NI0iEhS8mrQK7oJd3
	EB/vo4J6CKL8g5ut0MfgQm7huBDYIKlU5MjEUcFRx9EiE+C23t+jY9AriNdZC4GOSjc8LU2/3Zf
	fAlqe1rpjHezQC2gIGkOdI3Kv9ygCxAe2/phI7W4MZXxgNDn2J+b1xCoDGGqjqhEX3KgFZmUbZ3
	ouBa4oK7HOzKKE9B6g
X-Google-Smtp-Source: AGHT+IFPgQWMfW7+KuDx0XBlYA9F21pJgkpSv8WTV4nH9rMZwyvad2B/FC4WdzJHu0BGJqOjLMdEzA==
X-Received: by 2002:a05:6000:22c4:b0:402:7afc:1cf5 with SMTP id ffacd0b85a97d-4027afc20d1mr695483f8f.35.1758535579347;
        Mon, 22 Sep 2025 03:06:19 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net. [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46d1f3e1b03sm40908675e9.23.2025.09.22.03.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 03:06:19 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Subject: [PATCH v7 0/7] Add DDR4 memory-controller bindings and factorise
 LPDDR and DDR bindings
Date: Mon, 22 Sep 2025 12:06:13 +0200
Message-Id: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJUf0WgC/x3MQQqAIBBA0avIrBtQS6WuEi0sR5uNhUIE0d2Tl
 m/x/wOVClOFSTxQ6OLKR25wnYBt9zkRcmgGLbWRo9a4DhhCwZVz4JwqOmUV9SR9NBZadRaKfP/
 HeXnfD6+bg1phAAAA
X-Change-ID: 20250922-b4-ddr-bindings-7161e3e0af56
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_030621_441464_352A7387 
X-CRM114-Status: UNSURE (   9.80  )
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

Introduce DDR4 bindings, which is the first DDR type to be added.
As the DDR and LPDDR use the same properties, factorise them in a
sdram-props bindings file and rename lpddr-channel into sdram-channel.

This v7 is a subset of the v6 and other prior versions, split to simplify
the review and merging process.

Changes in v7:
- None
- Link to v6: https://lore.kernel.org/all/20250909-b4-ddrperfm-upstream-v6-5-ce082cc801b5@gmail.com/

Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
Clément Le Goffic (7):
      dt-bindings: memory: factorise LPDDR props into SDRAM props
      dt-bindings: memory: introduce DDR4
      dt-bindings: memory: factorise LPDDR channel binding into SDRAM channel
      dt-binding: memory: add DDR4 channel compatible
      dt-bindings: memory: SDRAM channel: standardise node name
      arm64: dts: st: add LPDDR channel to stm32mp257f-dk board
      arm64: dts: st: add DDR channel to stm32mp257f-ev1 board

 .../memory-controllers/ddr/jedec,ddr4.yaml         | 34 ++++++++
 .../memory-controllers/ddr/jedec,lpddr-props.yaml  | 74 -----------------
 .../memory-controllers/ddr/jedec,lpddr2.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr3.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr4.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr5.yaml       |  2 +-
 ...lpddr-channel.yaml => jedec,sdram-channel.yaml} | 40 ++++++---
 .../memory-controllers/ddr/jedec,sdram-props.yaml  | 94 ++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts          |  7 ++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  7 ++
 10 files changed, 173 insertions(+), 91 deletions(-)
---
base-commit: 07e27ad16399afcd693be20211b0dfae63e0615f
change-id: 20250922-b4-ddr-bindings-7161e3e0af56

Best regards,
--  
Clément Le Goffic <legoffic.clement@gmail.com>


