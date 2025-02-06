Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA133C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 12:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YGdBF5amQn6183NcAyaMY643bdra7yDi7L3ZDBI8C9M=; b=OL3Qy8eY+rf9D/vMRG+WbE/1G3
	en+RMhQK/hgmbeYbWW4UqSvZhG57SNy1dLLNQdSuYgQ8IHl9axRbBmPn3eYqz1QqiL5bswp584P9v
	xt9U6jBCSrTTmIa1B0+Qpg1geP34tIIs/q7vHi0VG18f9GCqcswynHPs5SLMwHRJfufA61i1dsE/r
	+n+PCjKR0z5OLj+KyClULaxwDqAT1bWZpbN+mK00RkPjlU2u9NGVvqDpetfKJFrCD8AZuCoaRsyFm
	+vZ0EIdevZxGdAofqA1JZTbGd5PxMoZn1rjmQZwzEAeGYHnWbR5mTRqwpHYSqRhe/o72qGZpIGGq4
	K6b8dSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0nf-00000006El7-3IYh;
	Thu, 06 Feb 2025 12:16:07 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0ec-00000006EC4-1upY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 12:06:48 +0000
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-5dce3763140so1867476a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 04:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738843605; x=1739448405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YGdBF5amQn6183NcAyaMY643bdra7yDi7L3ZDBI8C9M=;
        b=QG86W4FQ2kgHwOzTQZflAmmDvHQSSngKgInI/daQvgSNASWM+OAW7nlVAwu6Njz5Hr
         U9/7tWDUWUmXhNIRYssM23WIe8DgXzGXxAOPyTERMYuRPlethqFdzPfgng38ZyUSToWf
         VsDRLCBAzGM26vzIhLOR+RIUOrURvvbudsOuuPRY0wJUt6kdRi5NUB9uQgPvbZIdrweB
         gNCLnkz4OjtOfxrzH4O/hSSzjGC5C4WxN7FvT3/z4NOMt66Kc3Yq1nhWsQ767+oORVSO
         dGNQJVVXV3GJQN+bBMJ5sH/CdIyXfD5Zw01+Nha1UuRIO5mQjFc264bo+lcSSqE+zX60
         ja2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738843605; x=1739448405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGdBF5amQn6183NcAyaMY643bdra7yDi7L3ZDBI8C9M=;
        b=C67wF6RN+4aJj8t/adDvGiSwdYX5v7D405htgsvD6dTECKK2RdhWDrOyh1Vc2CzCos
         YDY3PSvXqP2p7boY9C0dofWpwxceHB1v5XORhMxBqcA5Exf16OSeZgg8sxjd+fiNtiR2
         xBgVG1yJ/GR1ZCiwXBELOgpQbVhhD/yUeBmpQG3QBXiuGf5DR1M1JPEa83KovSOSmw4D
         ttO2kxnrWgFyklxkphf4gIxgc124mOziPDyQlfJezSFp71+oprn5rDHazDz5RN/7UplD
         ZaYoEh4AWNpFi0L0F3F/NOjDFZWAyH0vMDta35G96SPi8BKdeLqN4LA2btMVRS4iml/e
         djWw==
X-Forwarded-Encrypted: i=1; AJvYcCUeUI619EAU9muVQvG43FY66Xl4lce5HVeVHcFPnLv9EuKNaWJuG5Rquz9HH+EHy0z2as25XclUx5G/0EjM7AZP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6nwKTZFIPogZ7kgHp6mYYPFf2rLIWj7NDTH/fkcyKbFizNThk
	rCqmWx4Om5Nr43VubdP4arxFJLUwtYsnJvOE3YHwHptHnryt8APyoFuHWnQ60Sg=
X-Gm-Gg: ASbGncsL2flrZX2Ec48rD+/ASF8F7FnRcyVuKGEhdEMArGcoN+MUz/6Xs7b5y9TV4T7
	i4hVxCNRdQc2y8ak2kvcppzrXExr5bNxFls8YEQqn5B4XlzMocnqBhZmhf4tKaiVobJEvAmhT2w
	DwOJJGbmxoWiBgh6odtNwB0ZpGitOYm89DzkVSnsJE907GYNYAK9VdoKhfIF1jL5kYQq+7a9XW8
	54SwPZGArj9YrG7//51W4F51S/o4mw9o+72Z2YVvsxGGPk5qeu7ezpZkHRRibbjeLLTSSjnCdqc
	S2AzThMFxFF44XFKI03RiNKCaYvVwIDHWOQ406DdrB6WdreaS9t9mhRPhA==
X-Google-Smtp-Source: AGHT+IHr/BfZzmlAYdHkONK5DIkNc2MOki3sCNB0+BjvRciFMqB5iZ1wTz2F8JJQatrKAPl5mZWCuw==
X-Received: by 2002:a17:907:6d05:b0:aa6:6e10:61f6 with SMTP id a640c23a62f3a-ab75e322b40mr566158166b.52.1738843604642;
        Thu, 06 Feb 2025 04:06:44 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e7089sm90262266b.95.2025.02.06.04.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:06:44 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] pwm: pxa: Use #pwm-cells = <3>
Date: Thu,  6 Feb 2025 13:06:24 +0100
Message-ID: <cover.1738842938.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1886; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=P+DmhZ5fsqW2fWssaaB0vb1pG+aNe17OBNu8J4YPM98=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnpKXAtvNUKlDIiKRsWNc4oyxCFo6Grjdo842L2 udPu4gsGnmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ6SlwAAKCRCPgPtYfRL+ Tp+9B/0R1HkHEHRU6lkinzAWJleWmmSCWIyIEVGQG4zUoQtf/j5DA0sacW/x5ONM9h62C/Kw2+y +0qbisvUZZia5cZwrm6U7p8g5rXBzXUrIRRz4fdXbKoLRa8mPOAtbrzAx0O4DPVvmfDjv/ezG9O KyJ/u7oU/x1Zl1DoIdSJ7mXZ1p5jczi1/1I5d7cy1C7NNdgQn2290PTgXIoq6N+aSBOcgQ1hxRR PPLThy7HagPJmewucOC9xEL3EQWvsVKO7vo+OLfFkvujO6IgdZJ5bpxYvIP5iIFUsF497yNWOKk BbpVuEQ5Ep9aEgIzUvWwN5n+ZtqJLzLT3Vfl8E+YQtezJviW
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_040646_680430_5454E82F 
X-CRM114-Status: GOOD (  15.28  )
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

Hello,

this series' goal is to soften the special device-tree binding of
marvel,pxa-pwm devices. This is the only binding that doesn't pass the
line index as first parameter.

Here the #pwm-cells value is bumped from 1 to 3, keeping compatibility
with the old binding.

The motivation for this was that Hervé sent a patch introducing pwm
nexus nodes which don't work nicely with the marvel,pxa-pwm
particularities.

Changes since (implicit) v1, available at
https://lore.kernel.org/linux-pwm/cover.1738777221.git.u.kleine-koenig@baylibre.com:

 - Use #pwm-cells = <3> also in the binding example (*sigh*), pointed
   out by Rob
 - Add review, ack and test tags by Hervé Codina, Conor Dooley, Duje
   Mihanović and Daniel Mack. Thanks!

I intend to take the first patch via my pwm tree. Assuming the pxa and
device tree maintainers and bots are happy now: Dear pxa maintainers,
please tell if I should take the whole series via pwm, or if you want to
take patches #2 and #3. If the latter: Do you want to delay application
or should I provide an immutable branch for patch #1?

Best regards
Uwe

Uwe Kleine-König (3):
  pwm: Add upgrade path to #pwm-cells = <3> for users of
    of_pwm_single_xlate()
  dt-bindings: pwm: marvell,pxa-pwm: Update to use #pwm-cells = <3>
  ARM: dts: pxa: Use #pwm-cells = <3> for marvell,pxa-pwm devices

 .../devicetree/bindings/pwm/marvell,pxa-pwm.yaml |  5 ++---
 arch/arm/boot/dts/intel/pxa/pxa25x.dtsi          |  4 ++--
 arch/arm/boot/dts/intel/pxa/pxa27x.dtsi          |  8 ++++----
 .../dts/intel/pxa/pxa300-raumfeld-controller.dts |  2 +-
 arch/arm/boot/dts/intel/pxa/pxa3xx.dtsi          |  8 ++++----
 drivers/pwm/core.c                               | 16 ++++++++++++++++
 6 files changed, 29 insertions(+), 14 deletions(-)


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.47.1


