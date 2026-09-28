Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D35FCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 14:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MBwtpeeZ1KqqImP/HFCVixak/oFov7fCW/o5bl69ADg=; b=BjXeNQYbITIILRQFExcj2B8EEk
	pRXP1oT9JgvDESG5lR0og5Uscqhw4GIM07oNH4goYZORwlIeKZtiOoeNYGUXhTeQYBTk8mTB3jZqS
	jEyi/ZD3+frZXKTbfuTSHIihsIQ7C4hXF2aADuBrH+icI/hBWr2TY/KDv7y9rbJ99SSQ/V/1D00/w
	gWdou8yPtVJFSbbGJHoia1u39LiMt/SfdozPtNKshZ5xUep/7zM9tW9f4QabXSQdy6Aw/2Zba/qCr
	2A59H1Ro1x0w/VrH049GjEslUngKgQFyAsU0p6sRB+pq+UlNDkm3vTpkG9WYxRVI9CMh7KFaXb6nK
	gcun1j/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCVZ-00000000nFK-0gdZ;
	Mon, 28 Sep 2026 14:39:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCVX-00000000nDh-3QZY
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 14:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=MBwtpeeZ1KqqImP/HFCVixak/oFov7fCW/o5bl69ADg=; b=O0Ak8IW59KwuRS0ifR1GrSaW+g
	m8XfkT+Bs5RAMD9QomLd8K71uf/1vWmrFJW5+r1V6Jus4bi+sTSLSrtoljVGhfgzMxzZxsNvFfH4l
	o7w1siAXvfkW+Vq2AD8PCXF4y71sg1toQGV4fUARsIxCdvNHgxa31p5DKPXbcChZwEF+2hCngIw+M
	i8adqPv9t9mkuSVtjT3Mq6yK/CeDn8gr8b1mMu3ajszfYcYb2RGTsVqyizn+dIXMhSTZRq4R/+Hog
	42VX+KjkBMVOQnWjzMHsVoP95IiTMP5K1idifMy4/monC/drp/w3Q0unB69SoJpc+pB7CVAAfExhs
	soENfXZg==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBCVT-00000001Zzm-2jBI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 14:39:05 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a00713639cso7064615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790606341; x=1791211141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MBwtpeeZ1KqqImP/HFCVixak/oFov7fCW/o5bl69ADg=;
        b=HitqSR7vRUQJ123eFN1MVamHY+mt0fF8iILYbVZTzcjA0mMHNYvJ1HQ8IeTmk1UnoK
         xCuEDW3bnMgLYac4kixdwJcidzoZqlwLyIEiVn9Rc2HJqPbuoi/zMbVOCBEmNfStsZuT
         HNEGTN/6i4VQVieRN/3tB9WwR5ct/iU9GumhPgDNzjItNstMSvwwN49+AEi3WRwg1Kvs
         NhfFiD3GiJ2lQcX0EC0ymOymBXKBDuY3/jj7ZGdRszdKOWwCb02PRFsFsoj1wXUDAL2Q
         exRnFLxh0QL8BkzvZaCY5GwqiO3Fmu74vhdK5it/2Sz6ETpYMP0mpeOHQdS+vbp8JtGS
         g9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606341; x=1791211141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MBwtpeeZ1KqqImP/HFCVixak/oFov7fCW/o5bl69ADg=;
        b=zZR14mWOQcjLVROT3kAK683ySUddmg2iq80ee7q28w77gYy3Y5oWuXBVEdgUuqziLA
         xRv7M+YG+gQxWE5FDEPjfY2Ua1WwQNP5kOI1le7/H0i0MpEDqUk8N4wRpGKOMSwdRtWe
         Kjiihfrxuye/MiUKkkKZ0PefJgOaySCAiyycdyYXT+g2Dx24fdYDt3itjp71STPu0UtS
         S/H5m6tDFA0ZsRV1nhaL9vWymMkoftcuHaJDjALHuTwR3KnQpeCODj1NcxSKQiiSyL3W
         DlZy9i/NAUBEMvzT4A8RYSnzkGXxohHhs20xgVXZJ6IZtwoKNF06NR+VtnxLu5NkLENf
         AWBQ==
X-Forwarded-Encrypted: i=1; AKwUvBx94LR72N9ZfQ1FlB3pQ8bJVW/RLp9zxyMHfAQZmV0+pVXtOQ7FmW1IaaUGN1lm2k2mTciRyBEJCE/1u+ubE7hU@lists.infradead.org
X-Gm-Message-State: AFuF++lTzPgPnLqHoPsml1u7WS2J7qS/b+QYOM+RZKv6Kc3C/Gpvi8Hl
	WB6AiV/oD+vN16rSXCsddaVWfdSc7rCzvTyNUFI0Wyoo5qBbZfSfOy6xqwuOCtj4LTM=
X-Gm-Gg: AYBFou0MskkzsvnK2k1KUj9Q+s/g0C4p7ZoKaQHsNuNqE6PxplY5JSuDFumL819b+k4
	0k2aMEPjA4Rrjkb2Fg6a2MSOPExmmLMqbbknXBA0cso8sCfKWS3aCy3RVZDfk0Vwya3yC45xkp2
	pwsLW0YaOOFeHflC6obDT17k9Qwjkw4s7A8lLTpnxvQxay5f3XichpOATxp39l+7fZBRvkXJwGm
	UPv5BuNW0dp5JthI2LxBOPFmYY+1Q1qjwFwFUy2cxUR4Q00iIPY9U03YeVtt02wyFyJ3M02GcUn
	TiCUubOYdk5F48BRhROG0Ry53KUjoYxUFr2JjcffMyMRaQH2NbEuKufe7ZzjnPjbQTokd5wSEX/
	fW9JH/UOW15wn5nH9+K98SqJ4DViAlXZQkevBTYvGHVwmSrDoBEwXB/xQAFeTTAfeEosSlnmdkJ
	KCZU5VBsBzSGl2JH8+3LwDGQl6gOYzBghxCy+ZABRFV/ykiMNVB10lmu7gQbsi3fUkwGiF/0a7g
	xW6gUXh
X-Received: by 2002:a05:600c:8484:b0:49c:fe46:7219 with SMTP id 5b1f17b1804b1-49fe66d8135mr222403935e9.20.1790606341440;
        Mon, 28 Sep 2026 07:39:01 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001915fc2sm141007155e9.14.2026.09.28.07.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:39:01 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v11 0/3] Add RP1 PWM controller support
Date: Mon, 28 Sep 2026 16:42:39 +0200
Message-ID: <cover.1790606188.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153903_799184_97FEE809 
X-CRM114-Status: GOOD (  19.12  )
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

This patchset adds support for the PWM controller found on the
Raspberry Pi RP1 southbridge. This is necessary to operate the
cooling fan connected to one of the PWM channels.

The tachometer pin for the fan speed is managed by the firmware 
running on the RP1's M-core. It uses the PHASE2 register
to report the RPM, which will be exported by this driver via
a function. A subsequent patch will add the function to read the
speed to this driver and a new device and driver to read the RPM
and export this value via hwmon.
 
Subsequent patches will also add the CPU thermal zone, which
acts as a consumer of the PWM device.

Best regards,
Andrea


CHANGES in V11:

- capped duty_cycle in rp1_pwm_round_waveform_fromhw()
- fixed a conditional in probe function dealing with an unitialized
  local variable (base instead of rp1->base). As a result, drop
  the unused local.

Link to V10:
https://lore.kernel.org/all/cover.1790603500.git.andrea.porta@suse.com/


Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   9 +
 drivers/pwm/Kconfig                           |   7 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 417 ++++++++++++++++++
 6 files changed, 512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3


