Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2F9CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 01:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z/BU06CtUrguuFA4ph2pK8mOWJDR8MrG8VSMsF7a8eg=; b=xswJUEDJoBO5Ry0oWs2KjEEiUx
	KnVoapzdYYbktX4av245iq0oVeAHU+37E9xOqdyZG3tWnQeMbs9182saIee64V/G7oY4aCnhC4DMJ
	xKEwjD/j6nqj0cUQbxrljEOurJD7Ftgtnn02yGJkKJgZ94ip/D6B1+4nEwK+UEG2nWwF6XRlyuF7+
	olx9RZ3pqnlZUQWDMxPV+a6YEGVcro5kWWN0yWqlOGYQdne2/MYTYMnnXA06gUrxL5I+IJZpbHa5z
	2joyX/z2SKmfEZ3zeK2509LR8J5GLDF6G894mlaUzX6GcgPTipnZG4nKSKxj8+SxY1h59EPZUpR/V
	YHOHJh/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCoX3-0000000Csjs-2XI0;
	Sat, 03 Oct 2026 01:27:21 +0000
Received: from mail-dy2-f42.google.com ([74.125.229.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCoX0-0000000CsiW-1H1h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 01:27:19 +0000
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3510f6f130bso126219eec.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 18:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790990836; x=1791595636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/BU06CtUrguuFA4ph2pK8mOWJDR8MrG8VSMsF7a8eg=;
        b=h0TUmkGqbAVzJ7U3UrpamDwqXzW/4Zvy9Cutee/oR8XqiFYUIGkZShwG19lu5njgIf
         SemhMpxXo+lewhCe8DLFFePdXzXs5WRm2usOPGHHib8RP6nAFsvdRFlrXPSCM08blQfC
         l8KMMu8ja99NpgFSoGiKQt9uHA1a0ZikxdIeVFqQlDuLdZ84m1nefQnMS8kvaBjZ53u+
         JSQUxWfiB5HQQkcgzZaa+aqnZWdLK/G2sWhdf/mnot7IX8c5sTv7+aGm/X3A9pZqVnr6
         YvF9wXyBOvAJFNtL8zX9zIjcTY/TaW4FArPijPR6Y6Tu4ycYyYI4HiiSHIAjN0pXg7uP
         CXyw==
X-Forwarded-Encrypted: i=1; AKwUvBzomLIQjwxPsnM5CiwgnIE47ENJIyYFHOonQBYKum6XEmM7kkNkTArw0NavOrsApsXTpBXNIG509jUWrteJAFW1@lists.infradead.org
X-Gm-Message-State: AFq9FYJIB3nqR86tLpjf0ijGyaCuzrxmanKlXubJy0NiznXOe9T5U79f
	yJcmdvnJMpiRrEfGzC/ql3vwls4W3dbYzntGvKCTcEvtFcrvUzKXbJPZpATwMA==
X-Gm-Gg: AYBFou3m/EW3AkUKHws1tf4QzJzld7JTbDKdOFnkTGGIxmwI+FMbU1sjjS2UB3vNZs0
	2sG3sdm8PZkpcM6fOfNroisDG+2lrqibjIO/vypPwMkVKTzh6dYYdY7kau5ckwRyuXb6qWw8CnN
	e7UtgGNND+U44mXqaDZnslC65eG8U1MImwE6CPzLOnLVmNpFRkEZzu01QJoI06U6XlKExJK568v
	DuDeF8o8xymazUrtB0BoVIJcRd42v+H2joMdBt6IDysMQ7jyLv4FNkxefWOlObHpfjRUuuxVYni
	m4S7gN2rreJWbsPwn1QXlzDvTLLVz80Lw5Vy+3K0HWEl0OrM1pJXkGl7m/UPMujpLMB9VkRoJOT
	TIHTS9zTGBM4JenAqCYjX9COMn3rDaVgY5DkYF+rGZBhAU2Lm36lW1aEmRuHKC7ezWqELnh4cQO
	YzTf1sYq0D7gXuR3dKiHzvk2fIE3xCThgEjiZL73Z0TpOExhRT/mEXbPEomUo2HQslxofkEQel1
	ihzV2l0SKIBhv1NzkbD1u1LHtKs4w4ckznD5rFxvrXqjqTRf+Vfis96+U9DwJwH84LwMg2Ghchz
	LrlzPyJ4LQdEXFMNqHm089lLb8Hje9iCHuALkVxqBV+cwqxlMZnuF3E=
X-Received: by 2002:a05:7301:77c4:b0:33b:b0c8:73d2 with SMTP id 5a478bee46e88-34f14f18d51mr4593744eec.3.1790990836120;
        Fri, 02 Oct 2026 18:27:16 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f067301b5sm10442242eec.1.2026.10.02.18.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:27:15 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 0/2] Add SID and THS calibration for Allwinner R40
Date: Fri,  2 Oct 2026 22:25:34 -0300
Message-ID: <20261003012534.418820-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_182718_358548_1FD18EA8 
X-CRM114-Status: UNSURE (   9.92  )
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

The R40 thermal sensor node has no calibration data. The THS driver
then keeps the calibration registers at their reset value (0x800), and
the reported temperatures have a chip-dependent offset.

This series adds the R40 SID (eFuse) controller and connects the THS
node to its factory calibration at eFuse offset 0x40.

Patch 1 adds the R40 compatible to the SID binding, with the A64
compatible as fallback. The SID driver needs no change.

Patch 2 adds the SID node to sun8i-r40.dtsi and the nvmem cell for the
THS calibration.

Checked with dt_binding_check, and with dtbs_check on all R40, V40 and
T3 board DTBs. No warnings. Tested on two Boardcon EMA40i (A40i) boards.

Otavio Salvador (2):
  dt-bindings: nvmem: SID: Add binding for R40 SID controller
  ARM: dts: sun8i-r40: Add SID node and THS calibration

 .../bindings/nvmem/allwinner,sun4i-a10-sid.yaml   |  1 +
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi        | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)


base-commit: ff47652a4b66c067c765a7ad464d930b5a9367cc
-- 
2.55.0


