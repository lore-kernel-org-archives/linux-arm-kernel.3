Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3972CD609D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WbwwjTObIrPMKMbgQEUxwz8EAlGUJCffQHwTQcAAqH0=; b=BTW8hy03SU+O4bMsqrZ5eAu1A9
	56/s23gPjqxEfF9PoMB80gZF2dgM0AIfDMzczydG0/s/RnoWfyIJU47MptmlUS+0fGpHulsyFJJIT
	ygdJ8plKQoS5TA7kdiMcvUMVqIhhKVd2HhdnGJ8gfL8RnAhXLFQYN68c6hGd2GSp6lFdzttTvhvt0
	6EdYRywhiOtnDLsyeIk+YZRYRU9Q0fgAMpbQXqyQet9q7Ej90f4GXsHxoeIeNEnqWASJSGLxkDKe+
	PJQWBLgdQOUjhpwvR5ZAc5uedd98CNW5M0dzBNZur8jQ6QnCDCoZcD3jhXjy6SZZWyUphPRP59BOB
	EfV5ThpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG5G-0000000Cz9q-0AJq;
	Wed, 27 Nov 2024 11:19:50 +0000
Received: from mail-ej1-x663.google.com ([2a00:1450:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG0u-0000000CyHP-0HTn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:15:22 +0000
Received: by mail-ej1-x663.google.com with SMTP id a640c23a62f3a-aa530a94c0eso647686466b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 03:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732706118; x=1733310918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WbwwjTObIrPMKMbgQEUxwz8EAlGUJCffQHwTQcAAqH0=;
        b=nzHN9Vngsjy3uLUHVMzrKnus51Fr3driu1+XVezobpAOt8g6OT2x/npYEuul2OPMAi
         esSLTIDftYmJghkE4iTG1xPl3j16KxgfDuZBbBIs9L97yfWLW9kTsQFLUaqHESyLzGVK
         lguU/eYLyxuiyrEGW0Z9abQE7HotX4teIa/3JElg11zrrjk0+Gkq3UAuLyzJR6WX9XXW
         pvGslyDY1SpvK+aVVIdyxmkO/4C8RDbDTlXsh5XWGhyFHuEvt+1cdFy/G2pQoM6OzUCG
         F6o6O/ValaPhO06B6JdEUxie2X/G+Cc2rvJFrhknVog+lHuOu33nNoKQRyQx0xNVXwcG
         plzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706118; x=1733310918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbwwjTObIrPMKMbgQEUxwz8EAlGUJCffQHwTQcAAqH0=;
        b=K+/5XSObit1givgr8NBSBnVBLk8mmFH2cLVAQfOIdhmhhUJ2R5J8Rw9to2on6ci4CM
         nkBXw81v0Z+dRCP7EHS1BjPXKuRC8oXNqMVqXjuJYaLo5f5DfI5w5J/EZklvhUWCo9Tt
         0KVAQcn1kUicm9jVAybziEIez8IVHw2XQwwxNv+FBS+++6Bz8WbbvBP2quYLMS3oXpiL
         ijspChbhl/6heBfughH5c/9cF8dedUbnkJb5UqJV8OyE1hoNwI4tRK7V5uavdDYuVXUu
         APyWoigjARL/vp+1c/RnZHb3Yjuiqkn2P311I5ZWDnwm7tVZXLGbRT75fu+GnlIiNcum
         2z1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4+WLEEMTwkd7KLFGKBoIiNu/n9sugEoW3aLGXj49e1hHtTonU6K9ENh0WHZOsfQjhXrCc/P1PVRWfONOjTTfY@lists.infradead.org
X-Gm-Message-State: AOJu0YysOeIbs7XUNEWz0b6J33egV7/rmPSlR1g8xM7f/+pB250+qahF
	+kPTrlDae6POm/zOR7dhtMTc9CQeih0tY9Av1Ov8QaqLvROxBXWfx8x0XL2f/mRxq7mMaDPwEuA
	HqxWLaSIZIS++P1GGoLQGRu6Hx7xu0NlN
X-Gm-Gg: ASbGncuCIueIJUYb2veIxDi3TelzhjmG7LEvA4WHT0zQ61SAhi3uGjCQD1bdNCot4s1
	BxTr221m5MxV50o05fSgFpLq1rooXV5VtC5fjh2P158xenn71fp3YN982e8TnivLqfDDQZSit4g
	ILSBg8o9R7+2/n42Z4HoKHiWaGnLLRzmf7hQNlNgX6ynFhxPqlK6JuEdJ2sHtAZTP7Q7Zq1Cvlv
	W0uZ+SRgcmKNLx22gWFvnc8k0kmqNXIsdPEZUITwiKTpNXF0XSVnYqqvaTDXKn8/w==
X-Google-Smtp-Source: AGHT+IEhzkon84gktCOU4wQ0YLegpwevnMbIo0lpL/f5tH0yFj51P93r/ssXmdD+9J/oH2WktVzDT4+2hBjv
X-Received: by 2002:a17:906:cc4e:b0:aa5:3982:660f with SMTP id a640c23a62f3a-aa580f57de7mr188391466b.27.1732706117686;
        Wed, 27 Nov 2024 03:15:17 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id a640c23a62f3a-aa53a1ae8a6sm42110966b.163.2024.11.27.03.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:15:17 -0800 (PST)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jacopo.mondi@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v2 0/4] media: bcm2835-unicam: Upstreaming various improvements
Date: Wed, 27 Nov 2024 11:15:11 +0000
Message-Id: <20241127111515.565992-1-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_031520_363262_8DAC9661 
X-CRM114-Status: UNSURE (   7.81  )
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

Version 2 of this series has no changes, except patch 5/5 from v1 has been
removed while I rework the logic donwstream first.

Thanks,
Naush

Naushir Patuck (4):
  drivers: media: bcm2835-unicam: Improve frame sequence count handling
  drivers: media: bcm2835-unicam: Allow setting of unpacked formats
  drivers: media: bcm2835-unicam: Disable trigger mode operation
  drivers: media: bcm2835-unicam: Fix for possible dummy buffer overrun

 .../media/platform/broadcom/bcm2835-unicam.c  | 42 ++++++++++++++-----
 1 file changed, 31 insertions(+), 11 deletions(-)

-- 
2.34.1


