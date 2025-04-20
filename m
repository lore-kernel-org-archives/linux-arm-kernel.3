Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A9FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 09:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KgaxCKXwOIlos19HVgBcYzf4uVbvhuNW1VHVexNu6qo=; b=OsV8S2dBjhiCZppu1u3VGLlQn/
	P0qM8abl5+je15FeLkjmuy078o3FkjUSz2bwKpipZx9hWMIpZYBR6XCRYjQB0DTzVlVBkyEezljUM
	+NCY091hIj/Gy49fBjz4h0K+/6bt3kfC2ExABcqdJJfv1v0Jh6iARURCkubugoRsSSMgRX4ydiUpB
	QZ6FSsoX5WK7itQMtHnn9kM8mtwZ7wG9OtrNXDNAxQ5dk775QXvBlQu/KmmYMdZHx4AURU6Dat1L9
	nUnKXNA6NaQgoCy1mszIZ6c9kdGrBOduWb+2RjQyAjDU5ATbPQbjjlwaHR9BWwTkZ2i+SG+daqnjs
	cucxlo+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6RJi-00000002Pxn-1rs8;
	Sun, 20 Apr 2025 09:50:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6RHp-00000002PsC-01Mj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 09:48:30 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso14497045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Apr 2025 02:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745142507; x=1745747307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KgaxCKXwOIlos19HVgBcYzf4uVbvhuNW1VHVexNu6qo=;
        b=VoDfv7S8Kb5GQVkHIGo1Q/PElEoWcC+xRbdE8R74nCWyZU8FpcvPh1R4kKnJ5335mx
         dlvgYr8tKhFt7zKWEp3XyZvCgZvS5NFZY51cA7F2VKTwkz244q+TDLavsk5R1BjldXSu
         dYCDI3VCxCtYSoLZA0WWtUP8ZSlNNkKAxoMfl0lOzYTjG7rV/U9P+PqpxpUVZXl3NGmn
         mr8oht2wKg+4lFC5XZ6TP2SweX+3yCWF4mRw9eK3B6UBwupfNaXKeawZBoEHyd/nko/v
         hQeCE1hAzeduAexugFv4uL8mCYoj+WeLU9VmhBBNcUGeFda/RBCQoqQPrLBt8Q8SSzqh
         wEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745142507; x=1745747307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgaxCKXwOIlos19HVgBcYzf4uVbvhuNW1VHVexNu6qo=;
        b=B7rCGzoTyp4MOJAfraUg4DiqY+6VgcAvkYT3Vuj21GZ5FW4yPWPm8aX/xNVUY8vYO5
         tEcf8ZnGcBiX0rtYrg8NP09i3pJdNS65/BYJi/PBBXFX/K6x0DR1Fc910deHifNcHOmT
         OU2vkDs8r98xkbvkvl+d5JovnBj4mWT4P9zArsZSUMQWOfXApncNmqKhv9hTExXll+/Q
         Bt2c5USOMjB84/TnJQImdDon2sba3RcecGpV3uCL2EcoE0662dX3XPDqBLQbht57xaiW
         Xsm95q7QR7uBl3XUtauLBf3YtCWG9IUz5gAjlz1pyUnwqnfo5udvKzpu2ZxixEUzLDy0
         GGfA==
X-Forwarded-Encrypted: i=1; AJvYcCXFMsR6v6isjCE5dz3HAv9tGO/ywZ3Qoo8SGt2qSZSUXvr57jEsvOniIY0NJScr8q1t8QnnThdU69X8D/FJiYEe@lists.infradead.org
X-Gm-Message-State: AOJu0YxQyJPaYV06R/d/WQDNMXfhq9Ryieg2Y7W6B//yQCv2zO+UjfvN
	/Xw8QeXieE9pcph38TQG0LF4jywb5OzlcoQkLK5khbh4iMdCpjeR
X-Gm-Gg: ASbGnctgxJkj7O7Dbp3qKF4MVAWyrljGPhYrmK/UMPGwJUj5FNbB+hHI4r9DV3JhO7G
	H4uX/xxUL+NaWAXEKNod5suP1NroYXDWnoshyI3HjvOqZvD3KHVbkTGUGaShAjFtDucjjGwQuRN
	aJdhtcJHbtqQ8tQfiv1qtIau7YJLb3/L7RiY0XNXFHzJuEBXP4AKSfInHFqu0ZM35m98xoxTIC8
	7iMqlzlGGBulHGx3SfD1XFZ5Zw+AGBn4Y0NJMEDOEgy94PZHv6S46zYcSUx8nYF2O9qvwnOBUUu
	pdVl2nGNu8N8Zo4IZUJTRc7qt5973mgOhFOzfmHKc1A8nr5TgnQsNk5Eq4Nb+N0LgZm9VlIgfJr
	pHGm5LU40IHlG+uWFo7suhgWiP3L4YwD46Md9qba74VdL4AkgeZjXR3+0egKoCm8iEo1++91TUb
	4=
X-Google-Smtp-Source: AGHT+IHVc6Fk+YrhS4HlpEYRPoMy6wYmziWX+WTODzzhxnE0xaUTS8l8K3F3aATJnU07+Pf/6vdLeQ==
X-Received: by 2002:a05:600c:138d:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-4406ab98f54mr52685925e9.8.1745142506851;
        Sun, 20 Apr 2025 02:48:26 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39efa43bef1sm8273712f8f.49.2025.04.20.02.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 02:48:26 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Dragan Simic <dsimic@manjaro.org>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v4 0/2] Add support for WiFi/BT header on Pine64 A64 devices
Date: Sun, 20 Apr 2025 10:48:03 +0100
Message-ID: <20250420094823.954073-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_024829_043765_4FE90065 
X-CRM114-Status: GOOD (  10.91  )
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

Add the BT and WiFi pins on the WiFi/BT header on the Pine64/SOPINE boards.

Changes in v4:
- Remove the pwrseq section
- Tweak the device descriptions in the commit

Changes in v3:
- Explicitly disable mmc WiFi section in DT even though it's already
  disabled in the SoC DT.

Changes in v2:
- drop patch that enables the WiFi module, it'll move to a overlay later

Peter Robinson (2):
  arm64: dts: allwinner: a64: Add WiFi/BT header on PINE A64
  arm64: dts: allwinner: a64: Add WiFi/BT header on SOPINE Baseboard

 .../boot/dts/allwinner/sun50i-a64-pine64.dts  | 12 ++++++++++++
 .../allwinner/sun50i-a64-sopine-baseboard.dts | 19 +++++++++++++++++++
 2 files changed, 31 insertions(+)

-- 
2.49.0


