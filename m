Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B56C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 17:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rCMKE5gzKgu/HvyulYhfT2Ja0Yjz35cFcUjQJgI8Ync=; b=DHeufS+QKt6xB3r8c2fmL4AaB2
	cns8EAVRvA3kKCtCV7q2Rd1spqIAWXn1VoT+iVXFpfFMEn6Il2DXBNbEfBu6+dbCDg5mzHz9+15mk
	sKXqMKEmuJEyaSl5/CWCb7LmMUNhadcWEBL3XLQ0D/xEbZEB1VT/fQYQTxQEv8VcP3TGPRHpHuLKe
	m+wghsoQOtL1O5RMna/u71b4WjYnXahS2KNohJrK+eWzYfUGfwfUTJHNIkbpunpqyU2Caoo44r+lD
	/46IXGfbFxW8X+8FHJGJNqgIA7kGUC4HsxwRQ4sftfmrFBtiFWNTawOLhT1lhkYfXX9g14wQCbFpM
	f6fYZQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjcr-00000004B3g-419C;
	Wed, 05 Feb 2025 17:55:49 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjbU-00000004At8-07Ic
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 17:54:26 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d932eac638so166540a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 09:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738778062; x=1739382862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rCMKE5gzKgu/HvyulYhfT2Ja0Yjz35cFcUjQJgI8Ync=;
        b=xjTx/GPIdfroE0qx9Dg+JaNY7MxvCXMhNH2I8DiGqJ2MLvvjt6axbssO2Pq6FbGajO
         zmBe4X4pewsYcnXglShni3KO1qhULDOMmL7yZDTF0GXbVMzHdMIk+V9qsW4mXNj7M5LT
         RQ9BwdwwL1f71XU/BuwZXIyumYtytZ+gpaED/tUt/N/ZIvwpRDV7b/rjQXXf101CIIzz
         ZK18ILHRYKAmBL/yDOZAZkeheGwp8XiDszPVhOzUYBdGnLCYs8OV3q/LL+7/PkseWm0T
         4QPiiCOdlG21wfWT4XgZI7aTpPbXVj0YQP9+ujeUIcT916G0RoX3RYirJkdHLdRUNI0T
         XQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738778062; x=1739382862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCMKE5gzKgu/HvyulYhfT2Ja0Yjz35cFcUjQJgI8Ync=;
        b=U+bsXijkNC8XezkIAZSpdPaFcNnRB6ZLOWP/weO/BwMNtDBfWUw4fzu875/dzzv1//
         NWDkrCVQRDAQjLISFbx9Iq7BxhbHBh7klOb2rSKwtrtW1Z054QZOUPJA6c3vbg43dV/F
         lwArYOdvRUOxWdKLbqrqW9OihMATwjp6s8LJ1tLhxl7hUmsHL0z7qj7rpaMOukwpb/IQ
         zgsyvDMalgyMW0MGlSV0aekuHXrYpCQhjOFHP5da6KYyhA2RD3hpgx+dxCK1zuOtDiqF
         wKXUBi/u2aJZHEB9emDyCBJsHRivLP8OSAhqSliAyjXSH7EOkd8Qq9XNJX6IF4ksl8xh
         u5ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUNy+RP3xl29O2hMT30tridOv+lbzxLLTKXu8qfcUBwCDy50vQpAY6AAIQb8+CYtXI3IzmzT1YPUheH2Lk+DfGB@lists.infradead.org
X-Gm-Message-State: AOJu0YwijYx6/cjeYMDDNRZxkzKLZO6OFRUVxgXxq/AgXkLVne1tLfNv
	0rAeAiLFUMMQd47wMSth1OmnNOLOvqE8vM9Deqy73VAlEiPjHaEwQxdN+03PKq8=
X-Gm-Gg: ASbGncsf18UIpNAEW0wtrZLSf112a5eHxNGZwj3POphWlmW/Z9nzYtTYtJvdOGllt69
	sJKPcYM1K0/3Ow+R39dx8nHo+fHNkJkU9L5GEYR9iSFdUz7rDU4e5wMucX7I5bFLdy/NHDcqVqk
	G+RCj6os5Yfl/psU9j985lXbEkobc/exhMGQZUSvBzg3z1LCn21XGhyDBRNSa/zxgeJDMvTeIAl
	JlhaYkPI/17EieFCbcS/cSfFsu/HCEv9qQ/ghI+7FTOj/NfrBl5CRqsIO2Xeu4MOatF53xxhG8U
	QEmQ++hW5VFpdYi8XXipSx91+0l7SuCi5xnKntv73/4P/fX3vy4tdrjqyw==
X-Google-Smtp-Source: AGHT+IGwFChnLi3ypYCTZHAHkBmrw8K+5yHJCBID2rJDb3472Yl7NGdTkpLX4by9169XWQPNNr7i/w==
X-Received: by 2002:a05:6402:234f:b0:5dc:da2f:9cda with SMTP id 4fb4d7f45d1cf-5dcdb77a00cmr5000144a12.27.1738778061929;
        Wed, 05 Feb 2025 09:54:21 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723ea218sm11385857a12.31.2025.02.05.09.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 09:54:21 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] pwm: pxa: Use #pwm-cells = <3>
Date: Wed,  5 Feb 2025 18:53:59 +0100
Message-ID: <cover.1738777221.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=JDsPD6H7sq2JssXSPZq5WPbt9ev+FcdfTWuhqbRmUg8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBno6W3nGyFzH2RWbXMNkDi7NRuJZY1Mdd/uPZtB mi/Hqxh8yKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ6OltwAKCRCPgPtYfRL+ TqFjB/4mMGV2Y07JilIJeoyM64TvtCXPufPc3lftW4t+VffV2nwQ6OLwLX+5YEccyi/f9YSA+d0 4WxXZYZCfQSn0TiqfSAwXm4uPNwjiJWWvmeEXDGjo65qwGSrKuqXLHomRbjgaO/U6p1z/F5ZWNN lnhWGvWiVP0jUiOqw8Rm5Phh22liOqmuqpgZN84al0Oab0/Sa3BUqg0hNTgc8KWGB2ZSRQzOjuD 23PAkaPxmgCnvt5H7iFAgV3fcjOfLdR8DF3qRmkoh+NQXfbAxzfua2b1tw7w6Q44rFH/1vpTiau /AF0kWibrfiJUjW5xK7cjmhO0scrEAJSxr82XPZ8ZcLJ8i5U
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_095424_318493_19EA4F58 
X-CRM114-Status: GOOD (  14.72  )
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

For merging this series (assuming device-tree and pxa maintainers agree)
I guess keeping the patches together makes sense because with the 2nd
patch applied but without the 3rd there are a few dt-checker warnings.

So I suggest to take it via my pwm tree as I guess drivers/pwm/core.c
has more potential for a conflict than arch/arm/boot/dts/intel/pxa.
So please send Acks and tell me if you would need an immutable branch
for pulling into the PXA tree.

Best regards
Uwe

Uwe Kleine-König (3):
  pwm: Add upgrade path to #pwm-cells = <3> for users of
    of_pwm_single_xlate()
  dt-bindings: pwm: marvell,pxa-pwm: Update to use #pwm-cells = <3>
  ARM: dts: pxa: Use #pwm-cells = <3> for marvell,pxa-pwm devices

 .../devicetree/bindings/pwm/marvell,pxa-pwm.yaml |  3 +--
 arch/arm/boot/dts/intel/pxa/pxa25x.dtsi          |  4 ++--
 arch/arm/boot/dts/intel/pxa/pxa27x.dtsi          |  8 ++++----
 .../dts/intel/pxa/pxa300-raumfeld-controller.dts |  2 +-
 arch/arm/boot/dts/intel/pxa/pxa3xx.dtsi          |  8 ++++----
 drivers/pwm/core.c                               | 16 ++++++++++++++++
 6 files changed, 28 insertions(+), 13 deletions(-)


base-commit: c98e66144b7d07ee9a3ca8241123b628a8ac0288
-- 
2.47.1


