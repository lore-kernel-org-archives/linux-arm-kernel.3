Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8524EC01A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 08:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iDc+ycXXu9BZBpDDnQjC6JghUL48eeZBnExRMHFl6tc=; b=ceU/MC223dg6UuYVposCMkkXbW
	x/uy/C93EMlYFD1hWrn7E7xDbLm6IT+x/rmvMs8782m1KseT7P7t9nJjUYfJNGPFBXZ2mM5C9k39x
	k/xv4nYI573rQWziYn/Tac9GZK7TkGefraTcI0PCOvUCbMuuY4nGEqfCYidpFsJ76NAUAIl+4clQ4
	653d0m5kSLpat3LGI+RzctbWcpT/oQIcYT8B/KkRvDfOhffGBG8wP5zvomk85K/aoZU7FJPT/fdhK
	mLIePZmiw4AkDx9PAO4zmyb/bYrQaLV3UPYx7O1G8okZgg1dy5pybTQgQR+sJp4Dsa2+hh9AHXG4B
	nAcr40jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4axR-0000000GIpU-3kFz;
	Mon, 23 Mar 2026 08:48:22 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4axO-0000000GIoY-3ssE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 08:48:20 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso22745835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 01:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774255697; x=1774860497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iDc+ycXXu9BZBpDDnQjC6JghUL48eeZBnExRMHFl6tc=;
        b=NhtUE4nhdoSX+3u1N1tafjC8/iR++fBHauHBTyTkPzX4/GQ8NAWSfpcQB1Ah/Yx2Uq
         QdR1t9qByYUtv70gAL0QE9OvHo/FtWjAx6VvWZPnQ7DU/uSCdVqdHI3Gp9IoKU/BNIGf
         AdRCGe/w/danHhO4OelrM+JWMUyg04Iu2oDYGsTWMFol3toTAaLlic4Kz6HzVAvnb+uE
         pOBHD2tDIjjtuxyJXncXgvZEZzOToK/JkMLBrxMNZ1xcZqDH7oqy39k2hp9GIt4Er6I0
         EYIW5q8Pw1YaIRqwQQvaIctuwRBkrzSRSCKzm5CDfL2YPo15tjq3ucbb4R0d09sJhM16
         mXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774255697; x=1774860497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDc+ycXXu9BZBpDDnQjC6JghUL48eeZBnExRMHFl6tc=;
        b=OwWAGOe8GV3mFcWxkqURj5im9tSU7VcJDq8DEv1hinv3HALvfq2iOVxZBsMI5R1v46
         rQnmovvadqysHQjYkhZNs/wDl79ets45LH/39ynR4VUM2skfXp6cwCN6MZytJeQxHwO5
         BiOKxqVS4SHst+yhXHcg26AIO8O+8wrDKq59Ss/TghHdWuaD7ROImndtxN94xIJCfzsL
         zrGHnGFlyuDfoTCrsFwcA/BdGN1TOXxA+Avaay81XPyVEfA3rmbLlaxBCa42cKX5OepV
         bE+Z0Hc6OkwIoPmnVcXja3+LFaWG60slFEXqUJalT9d+sOC3MhuIdCloTdQ4j/5jE1Bm
         sKVw==
X-Forwarded-Encrypted: i=1; AJvYcCVEkHuZb27BL9CnWjSwks/+WjlbxSef8EGI1L9PUB2+bEETPIXAwQGuRu7RKxH8TznIhTW4c+Xp9Mdve6kXlRR8@lists.infradead.org
X-Gm-Message-State: AOJu0YzFY/ExvBkiAqS5kQ3enRCXUgvcrY+LrDtXa23SZgfsHKO1qVub
	A2CGIJDycQB7PI73FcWky7ntlX5qlOz8SXx484lyzOmvCxoY0ciEQtPm
X-Gm-Gg: ATEYQzx4jL1NV7RdIFpDLVY9LhU5BBHEW1rG28QtV5k4wrfttAxvobm7uhDkwy1D7Xe
	kq3MODS+RYbG1dUmbh8m/bdMqY7AoJkiI+5b2XDLgnkJ1Unixfny8+SReb5Ov5orP5Y9FJx1oGQ
	QvHGL5hAvkqxLlRVrLShbEhLBZn/7eVpVeeHgTB/4Lelbh4FDhviLPa0oTtGix/vOUMTA+Yk3lW
	ExIfO5y4FRzq/OMHAtYC4Ab2LCwzZyGVk2GeEV1o6NMTDJIpWoKW0ceC+/Nv97xB3vYJ1MgpKt+
	bftOyo447qj7x3nVWtoyFOqVXkj9ZWUsY+jQMRFJJU1EvGcwjys33wkPBkVluooybLTkr2xcHhF
	a+PHphurWp0BTA1sq28Sh7zpCuhF7oLKlWJ9FQ/v6HDM0ZDuDVJ6GKRaWW+QzpJj/9HNSOh/zw2
	dkF1TYmBCC0Iax
X-Received: by 2002:a05:600c:5250:b0:485:9a50:338d with SMTP id 5b1f17b1804b1-486fedab419mr176165215e9.3.1774255696490;
        Mon, 23 Mar 2026 01:48:16 -0700 (PDT)
Received: from fedora ([82.77.79.23])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-486fe8367d8sm316822715e9.14.2026.03.23.01.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:48:16 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] dt-bindings: watchdog: Convert TS-4800 to DT schema
Date: Mon, 23 Mar 2026 10:46:11 +0200
Message-ID: <20260323084616.10469-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_014818_974238_31CCE2BB 
X-CRM114-Status: GOOD (  10.98  )
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

This patch series converts the Technologic Systems TS-4800 Watchdog timer
bindings to DT schema and fixes the active hardware node in the iMX51
device tree.

Eduard Bostina (2):
  dt-bindings: watchdog: Convert TS-4800 to DT schema
  ARM: dts: nxp: imx51-ts4800: Rename wdt node to watchdog

 .../watchdog/technologic,ts4800-wdt.yaml      | 46 +++++++++++++++++++
 .../bindings/watchdog/ts4800-wdt.txt          | 25 ----------
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts    |  2 +-
 3 files changed, 47 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt

-- 
2.53.0


