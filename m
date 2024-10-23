Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A4ED2E031
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tUrRWUy2mg+9eFy2uOgVTtm4AMaUGJKQ+NZVihzkt4o=; b=NSdbQN5BiLCPOYDzWibLVd4kww
	/xp7laKkhsdkNod/JcI7dOajFg1CwP/ZJHuZuWyKcs7IcYjn/vbsxAg3mXoRCUIk1m6gIXDl1wwon
	IubCqXUx+sEnXiGLga+lhpEW84h+HJ+y43st8QG4BTXuS7mFRzghxraBiQnNFY5eTqlKaoqnPOjRP
	9YHod2RiRGVRQMtYk9s+tpPka8pX1dBQfzS37o+Bl/l/sqaHaYM012JIccVbZuY8u7hSePLY1Geo4
	2GfZjKQzwWQ3CWF/rm84L7CtMz2QGir7kDGHRn71JLsVJG6VpOOlpc3SH6C2bw+vvhSPwm/vVl2w5
	qYruaNAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XiU-0000000DoDa-2Lwn;
	Wed, 23 Oct 2024 09:31:46 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XMd-0000000Dinj-1YWg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:09:13 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5cb6b2b7127so2879912a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 02:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729674549; x=1730279349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tUrRWUy2mg+9eFy2uOgVTtm4AMaUGJKQ+NZVihzkt4o=;
        b=lWr4Y7FMQUH158ZJx0HPdiK6x7YLeKP5VkNyvHNwuRGJ3wE+YF5xBhkODthZoyNRLZ
         tF261HUcI+xpQrjQe4jYq8ksiWeLHCqI+hHeMnFRKa8GLzQppVFS72puNChl3H0DBQZa
         Kep605d15s6tOhd2/mI0yI+v6a99SCJium4IAuVB18Z8UID7BsZZDuDN+s/UjeRLLS9Q
         tad+Ie9F/yOROetYmGNrylbLSB4F6KPjDsB0KW12s67GoY1MfYUeywSbD2tJIb0LZ7f5
         CBsY30BHbK5mnp0BcPeg7x38krqIgRmgs55pREQMWcHbTbOwOB9dRn6wKEsv1/luHBpI
         3Kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729674549; x=1730279349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUrRWUy2mg+9eFy2uOgVTtm4AMaUGJKQ+NZVihzkt4o=;
        b=NuZXsMYnXxLneEj/5cZNQK9NIt990agQHfZ7k11RVj7zZKP+nzuIKTlxhlPoD9TdSO
         HLCbWfo8zsA0nd87hH2gPstGM+c1cRFmEFZhGBcu48fpjShH8fuQRFH14tphgUeg6Fr0
         VJc1Veojn9J/epR7g8CiEvFeH9x3ESdZXdHKSFBc+nlA26OUbqnIOArRPJkLd52tWIrr
         DvJUb3Qa4Y7etgIvthBPtvQq00u9GxA6EVLxDuSF7/11aaajYTMFsNGoMwIRl0pLzfQ2
         C+QmOUYQyFdhSd23yEL6V180x36eK/U562sZULJZWBxehN96DgJgW8Cbjf2K/cLcMoco
         bxZw==
X-Forwarded-Encrypted: i=1; AJvYcCUR6bsaYtMTnywH2ISCVOhXiNhtU83h2kx5IccMjNXVZLZdK6hOQAkyaCLz/+bfEWE18uFk/9CLX0T3Kjojj6ed@lists.infradead.org
X-Gm-Message-State: AOJu0YywiVMPW8Hf0HFpuxk+RfsOHL1A7SmLMUlJMsbolcMh8+U3VSjP
	sKwCt975n1BRAJnr19DZP8cDEGmde2xBL5V414iVDywhgPOC/BNZ
X-Google-Smtp-Source: AGHT+IH1co3YBg4rKf5PUxpbvDK7TPc4kKnhGRQ/nm7LiXeXMTGbhhWYCdZPkZcPIJcd+rccOP+qzw==
X-Received: by 2002:a05:6402:3888:b0:5c9:6f20:4cf1 with SMTP id 4fb4d7f45d1cf-5cb8af7228amr1624364a12.27.1729674549217;
        Wed, 23 Oct 2024 02:09:09 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6a8efsm4133058a12.52.2024.10.23.02.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:09:08 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] tty: serial: samsung: Add Exynos8895 compatible
Date: Wed, 23 Oct 2024 12:09:00 +0300
Message-ID: <20241023090902.538040-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_020911_533643_730695FA 
X-CRM114-Status: UNSURE (   9.89  )
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

Hey folks,

This patchset adds serial driver support for Exynos8895 SoC. The main
difference from other exynos platforms is that fifosize is only
specified via the samsung,uart-fifosize DT property.

Newer Exynos platforms also specify fifosize via DT, so in such case
this compatible could be used with oneOf.

Changes in v2:
 - Grow the enum at gs101 instead of making a new if-else
 - Add r-b from Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Ivaylo Ivanov (2):
  dt-bindings: serial: samsung: Add samsung,exynos8895-uart compatible
  tty: serial: samsung: Add Exynos8895 compatible

 .../devicetree/bindings/serial/samsung_uart.yaml   | 14 ++++++++++++--
 drivers/tty/serial/samsung_tty.c                   | 13 +++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

-- 
2.43.0


