Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3B3F364BA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 21:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U30AFcv7lgMNUZ3ymlMVV/vyQq/k6Igfk7p7bVokTZ0=; b=OHS4hLTT5S872y
	BGfHwTUAqOOrfqMgnV8fGZLAZTyMNacm+lBP/tgLQBJE2UiWu0faCw3YzTk8W/f509oLqIeedpWRH
	aWucTWyga0fXRh8+T0fxLcpL1XsBjGoHvoPV+Ck2B/ahYTch6zN+Y8Ty5GYFELunXmocXzAdxTWUu
	+2q8rvZtfDctM6rekp9IasI/YM4aLv8fS3gOz+zWxzOFnxT7vEXJl+T+bySqoxCK3HdIYaNxSrVms
	WfYozaQOeziZYn88KkXmfARr5nQChMej7nxsLRhkPqtJFg8VpL/nxEpVyL5sfgP/bSDxI5SYAsuP+
	xvEtsQRbOO6eSCDQCYqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwmQ-0000000BE64-0bO2;
	Thu, 09 Apr 2026 21:19:14 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwmN-0000000BE5R-42L9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 21:19:13 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso1336036f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 14:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775769549; x=1776374349; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U30AFcv7lgMNUZ3ymlMVV/vyQq/k6Igfk7p7bVokTZ0=;
        b=OuldBKMNqnKboblKZWO+omav/Q+KGGU9OZ/TIoBXqY0zXDzHPj75jJibXqykavUzia
         af4L9ZYPq4XAr851NqCYqT96/Mqckc6V++hLCZc67Phv1UDNiqxJIZ/7BdCa3whsY1JM
         BEL818HjUtmSoozKd21qoCVoMaXFrRXXNQATFGGF9vbgPSOZU3aEuqcddu1DZnsgy7jL
         LxuxDvS95RJBITxDsEZo5PteyEB8We/vBbf9GGVzgE24V+EAlz51TamutZ5uH9A6UNtu
         lVqNXjAfPoa0qOVn0fck/lUQ9RNrJZS5CNQTz4htRG2yTu7eNI8PZbtu/tI3X0+NLAkf
         0DcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769549; x=1776374349;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U30AFcv7lgMNUZ3ymlMVV/vyQq/k6Igfk7p7bVokTZ0=;
        b=Fgnd5sFVOgGWnGYvKBqPaDMirGzxyhLUHI0EpOXE9WLnvat3Icl0/VsJsEkqTZ7CZd
         CNQ/Se143YBw68TI8vyN6c7CHmCKanX+8oAsZ7DMFxd/nngkhCsjWJ/QIM2bdIldl4C7
         6W9Gp2pCOwq+YFOpz9vyTvHU6vFSnebA2UOcWBywkXv83LPhOncTBJb9UE4r5nCbe4Wf
         5zrFtHMxA8a7KfRJrBK2AGLV68rrMEcWX3Xi2POjd4w4v8wkEk2IApV9rEjII7gGeQE3
         fdIJbJLW2DH3iPZt/Tt9dlFggwXyRbzwcAA6P07cO4+qxJdQvHJFJfuMi6vxK7FSqYDn
         FrOw==
X-Gm-Message-State: AOJu0YwFeTh0NKqV1KWfgViAx9owEBWgmK3uKjkmhKKKQSMacUHHy04C
	tmIkuTjnpekrXD83uRb6y4Lbjd44fnhpmm2OMkHq2lQWD7FyWRDwMQKy
X-Gm-Gg: AeBDiesOkvjpauvzgx6AYVyd0NKnO06QPpO/ZfwEQOOJO8shKcmjDpirXrrs+xaxbz2
	5IUsPiACfmvENgrkoVIy1l0ZZhCq/Ay7tz5FfXsCIyRVkrgyqy9LPoBVeCzzCJUICInTeMlJoBF
	Lf43hFygth4KD1HBVR5Rck+uAYcQXsQsPKNQunm9DPUNLAlBqD/SkXb08kAUuNjQ22t1eHocg/t
	80JRhifY9Q3C6BFIs97MtBLVvtSZNXM1ZDbIcmZp+xeCARrrUfGJKKVhrmzq8bWEhveSjc4dnQy
	CMTTmo6tKPfaeZXMdmLiYDxmqLMGi0/HmSxoGWrOdZrWI8BRFNF9mdhtkzFLHigZGhjipj2Yurx
	E2pFtUn6l+tT5Bn4Fh2IpBiMOGxW1jOBWnLeQaP43S3qoHOEfLWIwp6d7lhFNRVgT4NmRnLCu/8
	4McPCRmgdva3VVgQeb9OxtIRtmg/5f8VeD17ZFKysTmR4Ogi5yGXr6lWqoaqa6GC0gFPYLTOPUi
	s+AfGaVnixIQPHEDwAda4E=
X-Received: by 2002:a05:6000:2886:b0:43b:7ff5:fdf7 with SMTP id ffacd0b85a97d-43d642c8664mr792554f8f.29.1775769549372;
        Thu, 09 Apr 2026 14:19:09 -0700 (PDT)
Received: from [127.0.1.1] (93-140-227-38.adsl.net.t-com.hr. [93.140.227.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a53sm1797536f8f.5.2026.04.09.14.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:19:08 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Subject: [PATCH 0/4] samsung,coreprimevelte dt fixes
Date: Thu, 09 Apr 2026 23:17:23 +0200
Message-Id: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LTQqAIBBA4avErBtQ0cKuEi1Ex5pFP2hEIN49a
 fnxeAUyJaYMU1cg0cOZz6NB9h34zR0rIYdmUEIZqaRGfyXeCcONkV/K+AyoBHpprB69MzFYaO+
 V6M9tnZdaPyhEy0BnAAAA
X-Change-ID: 20251214-cprime-dt-fixes-v6-20-c15947ca5fd9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Karel Balej <balejk@matfyz.cz>, 
 David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=843; i=duje@dujemihanovic.xyz;
 s=20260328; h=from:subject:message-id;
 bh=TK7U0/XbzM8sVQEkZGsmbGPzqT8CPmOc8EOImm890/o=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDJviJ/WYdkUH5InLrk8SERafMJdsX2/bQz2brQPZLvD/
 Jjpolh8RykLgxgXg6yYIgvzUrlLfKnhEx2KbJNg5rAygQxh4OIUgImsrGL4p8ZyQuH3tztFn3d6
 7Ii2z/ndELVkeay3x0b5A/LSDz5GOzAyrLiuOu1Vh4fkDX+mypO6zH9v7A6fpB/jelq7rJxpl9s
 RNgA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_141912_046608_A59836BF 
X-CRM114-Status: UNSURE (   7.90  )
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

A small assortment of DT fixes for samsung,coreprimevelte.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Duje Mihanović (4):
      arm64: dts: marvell: samsung-coreprimevelte: Increase touchscreen voltage
      arm64: dts: marvell: samsung,coreprimevelte: Use memory-region for framebuffer
      arm64: dts: marvell: pxa1908: Add PSCI function IDs
      arm64: dts: marvell: samsung-coreprimevelte: Add missing SDIO properties

 .../boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts   | 11 +++++++----
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi                  |  5 ++++-
 2 files changed, 11 insertions(+), 5 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251214-cprime-dt-fixes-v6-20-c15947ca5fd9

Best regards,
--  
Duje Mihanović <duje@dujemihanovic.xyz>


