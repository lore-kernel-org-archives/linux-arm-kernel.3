Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C26ACA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ReUPEZ+L9U/syQfiF/4viioOEqFIy3ugIcULtGFh8A4=; b=x4zW6BhHe5Ow0tqEoU/j31fmUZ
	5ayIDPkObj92aGAI/7BOvQZbSeAdsjMqKWeRDw1dRTP1iDLh8VG/+EmVHVgXPZcJA/vjlBYmXsQsv
	qxIS2xkP9o5bORPMp/o0koXYz+Ff0wyqke88pwUJgbynTRtz6JZCoLKWJPozLdxiZVvhwi97Fi0pt
	I1PwO770WGGsK5xl4HaKIOgQ8TCaq0ja7k7mxCUF5c3UbfRkMfBAAWncWiJeVFkqMsmuAFPBlGgzA
	sT+HKYIE0BlBf7qMoAxCTgGT4jvtPsMNe0sc4TUAXS+HgYq2sg5PqSrDpfK/NI3swFFBn4aZ7kw+5
	1CJciiWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSbH-00000002koi-495A;
	Fri, 22 Aug 2025 14:18:40 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upL3D-00000001fbe-40z8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 06:15:01 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b47475cf8ecso1243617a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 23:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755843299; x=1756448099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ReUPEZ+L9U/syQfiF/4viioOEqFIy3ugIcULtGFh8A4=;
        b=CJhroMrwfhAhplj4B/jEjp3Wuc+SU2Vxtuh2b0rpcI3RTJ6iT5SDcjZnOdXN+dqsIy
         AAbRpOQ19ryXCeqwleW6/9bz7/5V1Nm+JkxN//JbXb2FBt+2/YEfhOdFd5bV3FyHdUSZ
         tlRfsFMP5C44CZOaAnGWIMi+atKhyIDQCqa15hQ0nadfWaNbpaw4CG716FP+33+s707p
         rUNBhzTPofv//BmHWEDVl2/ZZdIBkb6Pp1eAT2cYfBqvvxmQUcSgvU1Zzgs6u9Xqs+Th
         +B7LJ80pS+IEbzeEscnss1uceXnAZer47g8UFgDYIGFW1xgg2eETeFR9vuN3r6uHUwoH
         y/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755843299; x=1756448099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ReUPEZ+L9U/syQfiF/4viioOEqFIy3ugIcULtGFh8A4=;
        b=EcdEqWE0bNy+3NYZN6cfAyPXT6RjTo2r0nde7qL6d0H3eIEf1/TqpkbAP5GhW499vp
         e9CFHG32JyIWfQS/kUHANE+nEIc5CxEs5orSRux3Qn73LDp4dgfAYt5Y1K3CMVzrHcR+
         zYXs3i/FGFKvov2/YJSHHOI4sPKY1P26AqK45miXXv9c1tvOKW9OC0VA/pKtLKmLm39M
         fmU4wJqRlirzja8xEQVmzHN1IWsugq0S4vTm7OYbVflI6EuVyGSYI4JDOThDqhQs2VNN
         IL4PkYtgXKv4uiXJ2f5fHt+6El6t2csh2bi1dy9jbIjVtRCM6aORyS7tcWXA9Hc9/Omg
         5ehA==
X-Forwarded-Encrypted: i=1; AJvYcCUdYtr8gQt8pHU33F+E3p7ImjhnFqngd7m25Biz7HyCTURV0+mDvGMF/066j4LeQfEbBpaeVP6XjygHYAwXfsH0@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzx3JFHPc0JNHTSLq/cINNyYtu0nlxKZ/7FAMCgbTBbSJr4VFF
	oaEcR2UfS9E42hBEXZpeVQliu2ptye1G2FlPLfsaZU4zzDopnt+JqUqn
X-Gm-Gg: ASbGncvymEQI0cmyxbh7K8W507k88Tn706p2/yGgW2L9ayMo/pU5TlRiyzVG6vMQXkC
	HUGO/08Eo0GpjX2O26NORgXWDcul3vw7Fil0cVGmzzfhV7VVf2RAVO4O5Fh90aOTitPWbA5zw3V
	7VdoJ3kdctUA7rQQT3q0GfO1zMgIBmSt9TfIWN/6+CVagmzLSSr1J8MulrE0KWa6NWNHAjrUhQI
	O47MDILnx8BLuHEIkuuHkzUCDSs/2B1jJ3Yw8EzdBxyeb3Y5p48V0vQqFiLJgZ0PqxgBkfLa4by
	CKnagzqPsifGrXATW4rP0MNZe86odQTh06tS8MINSzZkWj77bJKftJb+YCdQ+F4P3XigVgU11Z1
	ghH0u8ThzhSdVMsDKKYqM/pKrq85vrkJ4zNYH4oMLF8audTsxnJ0NAy/gb+C5AhFiZhSCOzkPsL
	GWYGuva/NcY8F3VlRCW5u1FEnnc/5KJ1Ato7eXJqM=
X-Google-Smtp-Source: AGHT+IGW9JepiPFOrIKaV6tWBj8wosVylxBRGM7Di3FDW6E6ZDqNYgeHyHaeigxyiBCNZz3dVEHg2w==
X-Received: by 2002:a17:902:e888:b0:234:8eeb:d834 with SMTP id d9443c01a7336-2462ee2bc9cmr28317435ad.16.1755843298776;
        Thu, 21 Aug 2025 23:14:58 -0700 (PDT)
Received: from peter-bmc.. (2001-b400-e35d-8041-a0f2-62d1-f7aa-e5b7.emome-ip6.hinet.net. [2001:b400:e35d:8041:a0f2:62d1:f7aa:e5b7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246181c48c1sm28660385ad.116.2025.08.21.23.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 23:14:58 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Fri, 22 Aug 2025 14:14:50 +0800
Message-ID: <20250822061454.2610386-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_231500_000361_0456D16F 
X-CRM114-Status: UNSURE (   8.28  )
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

Summary:
Revise linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

commit-id: 2236141ed3d6f31f53147c26208dafef6051ae43

v1 -> v2
  - Patch 0002 - add power-12v-memory-good

v1
  - Patch 0001 - add power monitor support
  - Patch 0002 - revise gpio name

Peter Yin (2):
  ARM: dts: aspeed: harma: add power monitor support
  ARM: dts: aspeed: harma: revise gpio name

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 27 ++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

-- 
2.43.0


