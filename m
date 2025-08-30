Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5263CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pd3QAgaI6xLn3TSraR7jO04+lJz847xBQQfmdUU8S+4=; b=f8t/chJbBRMglToB3H0QKytL/D
	AiFFFWG+FYCk5nYDVIudLDO0mOHxNPWnYYtxZYQtSQFvEKmwLpyOH6pbanttZCySR/ImuY/3bWnCf
	tsE2M3S5rmNfvGvUliiTkNsaSOq0rbcmi4PjjZuxcAYHfTSaHMR1F9cfd/1m8UjfO/HIMHEEhXW/m
	SJauPBZskLCl8pm988hlPq2/JTaySt+ImwaawEIrfRgh3+xyUJFz8PeZNO2qJtVUwLXFHBa8YBa4A
	KwBdtyG+GhgYFkZ48sQr5kt8h0T7XoMxzz1ldul8i41PniGDfJ1pL7t7kWk7g9LjX44N2+XOgInY0
	n1AVV/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPmp-00000008Gq7-18ck;
	Sat, 30 Aug 2025 17:54:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPXZ-00000008FOf-1rno;
	Sat, 30 Aug 2025 17:39:02 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-24aacdf40a2so32435ad.1;
        Sat, 30 Aug 2025 10:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756575540; x=1757180340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pd3QAgaI6xLn3TSraR7jO04+lJz847xBQQfmdUU8S+4=;
        b=SNPb/3RN24azthLWgl2M5IQs6YYjE8vPtuCQ93bliyn5aNDMc0Bc6HO1kenFpUrYF0
         v/y0N8QaHEC39dlpYcpJm5VbKuTEU6VEYcow1+PASYlHW8vqxt1O70B4MMLbInotCQX+
         HKcXL0kTfsXSSvtAacLzom2RGKzAjxvF9mCeeYd7RUPrRcDJTfW2HicfAQpElByLQtxo
         +yWKSEi8jXkZqEg7qhcYYl2S/149y8BERiv2BjS18fCYdFf13a6r7FmsjBplTTBkZGr0
         6jLZjhOh8KNecHsKHO47ZPQWV44crsIMfT2PU6GR/gCMBGKWmOG/9/CPjMmGNk5VJvIe
         6p9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756575540; x=1757180340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pd3QAgaI6xLn3TSraR7jO04+lJz847xBQQfmdUU8S+4=;
        b=rwDX5pAML2lgBDYSLsbbcg+FTsK4o/ndgbpWYFol0Z1bLv46rG/zoQZe+S7aEySd5I
         phEDAHY76AAZlPOMZqDGAWkNZo2Gu+zrUoYsiVqNp3qYSCrafps2WqTkBikuM1UGL6il
         3wjj0YIqlGwa3PW4B3agq8+z7k3d17v6zasRem+5EAUKBzSddOhr1hINv4OLMYIqL+1f
         sfNv9LuTtLYh4vghQgIk5L4P69bfOpH1GSeF5MOBDnqS8qtAZYhPky/SNbbvEEyZmKcf
         AyO/whHCKaPD451d6sf2TK0QQWciO29QhFKpBmMrh8RZrOu4k/JM9NvlOBIPj5bRgG5V
         LDAg==
X-Forwarded-Encrypted: i=1; AJvYcCUXiwGBaqD/T+CAnEkH8sFea2TGlhs5C/UYULaMCtvQgdd9vtrE7dTF6JkdB1cc2j/zTEJXWPVn8JNvURhcQvIfEQ==@lists.infradead.org, AJvYcCW3Z+ChW+tmSTLO1vXGAARCj/PGXLv0VnaXSRUaQCgdcqCm5onEX2GBcc+smlFLC8VP5G0LyelGFG9rYGGXZ2i2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb7J6Z3fTqJBzHVqbmRLMmKNTjWQ1SKclF2Wv7cYrZC1m1LdGt
	TVuxBz6QcgnTBIppWAAuReZn1zpf66FF0esmLrLHv/lskNAmRwJn8MIk
X-Gm-Gg: ASbGnctHtTP7BQIUTw6K+cYyr5EnDBiLZYVlDor58GMrVTQEqWpTIWE4DY6GstcxcO5
	E76BvX+1RlU+D7IhIPB3DIdGW+fU9P8L3MXOFTxjdPm9n50WK6lLtRkOg4jdtDAaJ2Sokw9qxrU
	EqT+C4AEDOHc4Og5TS4Jc7dOuo5T1W/GSesohHAKTeT4L75Ul8um0GftJA+/4OvUhOKepaAs7Hr
	r4JhJd3s3/AWBmoRNaQPsiheHLoehqAO0OwyAocHG+M3sAJd/9XvrwRlBiBknNtKZtEvaKTeb3b
	rN6BSHuyunJKSELX+lFMQlsbxded46kw27Ble8pRhx0bxiLaxcBdBJ6e0aAqpwj4nF5zDEr+AlC
	hjv5H9/V/AXoEQ9ZeTX/jkiOC0SYJKy3t2oev9Lxu8Q==
X-Google-Smtp-Source: AGHT+IGXSHsujaSl2ROKONAWQE6+Ygosv4F3z5UVve5pQ4wzulH1rYWqg7jKwQSm4YJbOk69qQJB0w==
X-Received: by 2002:a17:90b:4b87:b0:324:f79c:2dd2 with SMTP id 98e67ed59e1d1-327e666e931mr5142096a91.8.1756575540232;
        Sat, 30 Aug 2025 10:39:00 -0700 (PDT)
Received: from raspberrypi.flets-east.jp ([2400:4050:d860:9700:eabe:57a8:cf74:875e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28ad39csm5154525a12.27.2025.08.30.10.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:38:59 -0700 (PDT)
From: Masaharu Noguchi <nogunix@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	dave.stevenson@raspberrypi.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Masaharu Noguchi <nogunix@gmail.com>
Subject: [PATCH 0/2] staging: fix W=1 format-truncation warnings
Date: Sun, 31 Aug 2025 02:38:48 +0900
Message-Id: <20250830173850.323897-1-nogunix@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_103901_483790_1663D7E9 
X-CRM114-Status: UNSURE (   6.54  )
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

    - This series fixes -Wformat-truncation warnings in staging drivers found with W=1 builds:
    - greybus: prefix device id to widget/control names safely
    - vc04_services/bcm2835-camera: compose V4L2 bus_info safely
    Both changes use scnprintf() for the prefix and strscpy() for the remainder. No functional change
    intended.

Masaharu Noguchi (2):
  staging: greybus: audio_topology: avoid -Wformat-truncation
  staging: vc04_services: bcm2835-camera: avoid -Wformat-truncation

 drivers/staging/greybus/audio_topology.c              | 11 ++++++-----
 .../vc04_services/bcm2835-camera/bcm2835-camera.c     |  5 +++--
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.39.5


