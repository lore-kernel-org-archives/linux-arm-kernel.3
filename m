Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896FDC36017
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 18:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aMSMxtJGALgtSMPuvM+es6h4Iyyq5oXkRDZi7PrpWMU=; b=2BpXdkRb2KYfZxpHSRKp8eNqNP
	Xb07BP0CtIuc7y1dvanT9kMTIZwVP3YUF+yQC6DtlxDFGhUT9wEoHrrWTLPlIsJxckp38Td5WXHL2
	PGmSxqF9M8Jp/Y8y/ZgU8XHd64x5XZfGC0rmIlaEeLC1pWxoHP+8kGDvBrk1ZnDAdYTmJpsBei2BO
	Hes563ylF7NaldNb+AHmMPlmN/ivcfFwfACO4tIKEQpKR0x/X67QGyCesCyC/nNY7KwG6ksRLpnFR
	aab8wI3600M1QdmYREuUWM/cF48e6ZVIDBMCNdNk9wfLlqU+snbsmLgr/hZfAI8gdhQskb9d/i/Lu
	mQi74iAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u03Dr-00000006ygQ-3wqi;
	Wed, 02 Apr 2025 18:53:59 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u03C6-00000006yW9-2HO5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 18:52:12 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3f6ab1b8fc1so71648b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 11:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743619929; x=1744224729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMSMxtJGALgtSMPuvM+es6h4Iyyq5oXkRDZi7PrpWMU=;
        b=g9lWniaHfmewvNelI7ZYlqFZ9bovsC1Mq8OqdkZnG2Vga8hoBLVF4Cg9wqg9G83W13
         IguDiafRNb1mvFXpyHPL4zxtwwjoi1jYJhKsaZGVkgw7OTsdfi0krfP8jLSbKq+7H5KZ
         njWP3z/8E+Qv27gHpifHXUIB3QCyyqCFx31ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743619929; x=1744224729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMSMxtJGALgtSMPuvM+es6h4Iyyq5oXkRDZi7PrpWMU=;
        b=ljmPqkW/nzezXSlrq1HddH1E1TtvXs3Iyeib2lCu01TnGUMKEmploqFsggoWFtzHrD
         PmxLqB9rje4kOSpQuemB3t3iK1206Opr88cvXgsxHSAhzMPJZ3OQRF2jBbxe6KgIwVVF
         gLW934vCQ4Ahm5H4FK3VEVecQU2/7Opty8iShA7htlMXAD04u8mU/XI9l8l25QtiMFJh
         M3fRJlEQhCeVv34D2k19sVdmFTijUlS629MW85Au1MJxT5zEZT2WCN1CTcX/oPxNchw4
         +lwnNdjzoVSI4WGeUslLxqvQGLaO7hSQy+G5Xej2/V7cAtuoxko6hRylWxxlOqCadWiR
         RPMg==
X-Gm-Message-State: AOJu0Yx/GbcjDpQ7YkIilNmWAxprw+UAudLVTupG6K/q+dpwEVnigyDE
	qcwPhdG+zIPnI53yGCq+7J5q0d5MovQZ+X9OEwzD3ZXu9P/OMx6/OguqkFa6pJx8CIYZsKzqhAS
	0iIYyC32fmh4FykYhrdlEWPGUbwZLQgymyRjVo+1N52u/A+m3HuV+SqwdYOyaZbw0jTaZdgPJMk
	dZoF+7MYsSo1edfK/Zo401AFGPCZ9421SJFsm9F99bO591q9rPcF2NNsqAQQ==
X-Gm-Gg: ASbGncsAZ7vrm0oY3hExv+4TlXwX+CZxuNuwb1qH/LAlD5A1T2ufZF8LeyV3dXMqjBo
	zZvrukHa542bmGaOWsLax2KYDCEEF9ISEUW7bHK4MpOPe7JJ1FmVyWCbQVVpguVlTgjNTQxM9wQ
	ULZb1mbBp7bItNRCBsXOB1itjx0F/sSMtX75etqGi3HkxDCSd8EIxqgIcx9goxVvdUpNjwwDfnt
	rk0cdI3Ht/L4gu/49zLHnR7F2vZT5CJeDKU/Onb7U77X6QOOW3n5H/FWmqM7bFFI4NrygClHcEF
	gsQ+6wBVDCd8SCAxCqmzNc557JQMg2XQVX75vvaaouTkYGVBNYZKchD/gGi7pBxMYCwaZOAR1v5
	vXO+p/tOdpk9BHcUGGUi2xA==
X-Google-Smtp-Source: AGHT+IF2oyF+SZAWZtK8dqvuEYk7hltRuj0cB3ZM/AI20F98RrPPB5PiVuTkMpiL1IWiNu1BJ9n9SQ==
X-Received: by 2002:a05:6808:191e:b0:3f9:a187:1f5d with SMTP id 5614622812f47-3ff0f64bcf8mr11348947b6e.35.1743619928688;
        Wed, 02 Apr 2025 11:52:08 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ff051aaf60sm2470462b6e.28.2025.04.02.11.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 11:52:08 -0700 (PDT)
From: justin.chen@broadcom.com
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org
Cc: rafal@milecki.pl,
	alcooperx@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	kishon@kernel.org,
	vkoul@kernel.org,
	Justin Chen <justin.chen@broadcom.com>
Subject: [PATCH v3 0/2] phy: usb: add support for bcm74110
Date: Wed,  2 Apr 2025 11:51:57 -0700
Message-Id: <20250402185159.2976920-1-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_115210_571723_A5B55469 
X-CRM114-Status: UNSURE (   9.79  )
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

From: Justin Chen <justin.chen@broadcom.com>

bcm74110 adds a freerun utmi/ref clock that saves furether power during
suspend states. A tune is also necessary to pass USB compliance test.

Justin Chen (2):
  dt-bindings: phy: brcmstb-usb-phy: Add support for bcm74110
  phy: usb: add support for bcm74110

 .../bindings/phy/brcm,brcmstb-usb-phy.yaml    |  5 +-
 .../phy/broadcom/phy-brcm-usb-init-synopsys.c | 61 +++++++++++++++++++
 drivers/phy/broadcom/phy-brcm-usb-init.h      |  1 +
 drivers/phy/broadcom/phy-brcm-usb.c           | 14 +++++
 4 files changed, 80 insertions(+), 1 deletion(-)

-- 
2.34.1


