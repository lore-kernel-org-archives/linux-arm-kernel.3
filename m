Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D46CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 15:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lb4VSxhZ53ib++NoC6OQcXArogDrZtQGJ7FBlNPhbfk=; b=a4AP/kwpxlAppq
	IZIcOafp5kJCrpAqNTWqzaERYUJpJ3lIOhXwSIKq4ETltqAASpHKIqMWaheBvFc8XFak6I3IWSjrr
	2uJvl37hjYgQUAThRSS+FJWN+usWmHWkm3ps22VnQE9pNcIBUwhyN6KCoPEbYkOhg0cQrzn1dWWeq
	p0P5tII4l4Y7BQ1G5gfuAFDVyeiY61vv6faLB01dQtH0crSc6F7kSi2J3wOFTwM7BncZcP2rVhk0t
	o9JYpxooDOt2oASRPQ+t80qUIzrFxgLEvA1QLNtHWsouHvxCBzJ26F4Kz+lBI3U2CsFMQtI79U1kq
	v3F3H3t2JyzMQqyDeszQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPPC-0000000EF6v-1ktZ;
	Mon, 27 Oct 2025 15:45:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPP6-0000000EF54-3Q1O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 15:45:08 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4770c2cd96fso13624345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 08:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579902; x=1762184702; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lb4VSxhZ53ib++NoC6OQcXArogDrZtQGJ7FBlNPhbfk=;
        b=0eaRjIA4IB9dGHsvPX9Wgn6F2d06ZAHNwhdkCB2NbrYUaihF93orGQ5scAcmWi5w2B
         xFH4Jtml6a8dbXnWLlgJkoObO9hENe70JVg6ZIjkkZZShBAwZ1khhf9b/ZjiNHqodp0K
         fClnLV9Ma7OzDmAU/4rF4snYYm+VIVTf9rbFQgIEV3csk3Wx6USPRK5VwEawWbUhLXK9
         kmVj4O1rx6DFmm9M/E3uWNMbKmeLpQ+H/1odaIi3jK8bOeuI4vsdU87n5zAHylKc+bhn
         AaGcM8hhiy6Qec9lVh4WkgDqj1mxE2NY6igTPu1Oe72VSy2CsN5TCP1GD21xY/hc5vu0
         +CYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761579902; x=1762184702;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lb4VSxhZ53ib++NoC6OQcXArogDrZtQGJ7FBlNPhbfk=;
        b=hg9zd1KS5lg1lpJniHCZYYp1s+P11kbpYfttErPeSoFfE2KiEse3Eyif19ERRPvh4A
         CbIO2811d+3jVHggJKjMX4JpqMrsg7pCNSpYEjnNBPg9O498kecrGrzjE5qLZQ7wVbMs
         k3HQ4FP9Zy9+Z0mUzKQn9Tn9MXm94g+lGtpQ+Dd/4keNN3bXj8M38kUfBCo4ACKr6rrH
         gDE7Bgb2WGILhbDx6O5HX2U+SomuttMmWKFayOIm6NHWJH/pe+Kdsk+mrr1ePlcQBXbl
         c6pZMx+OYh3hIJv1vCMngJZBhK5rrwG2IwfzDCxaxiPlCbtp8DUDO11qMqBurLer9d4C
         WJAA==
X-Forwarded-Encrypted: i=1; AJvYcCVcvgdKtstE9F9cyjTcf9x56tSbpt0Wd2N473R5+wSWA1RbGOXqJrIOaPXQj8YY/zflMxv9aCVIFvGYj3Ev6YDB@lists.infradead.org
X-Gm-Message-State: AOJu0YzNwyvdy7Jtb9TDFhKD0x5fcjfciiQzHsFdO8w0d7Xa/3MbELEe
	S0wwtKD2UAvTNePgUv/WGYUz9WqDYEOJbNfxlzmSPhJC6f2vKtje8cDpJAbxZlpBk8g=
X-Gm-Gg: ASbGnct40HJNddKOAGQBnqvmaMZPbM2FJ5YxAL0/TJ3cLDXHo52pAViwNlj4bTrpSrs
	qv2yT/kk7fywcHDAQgcvUt0N62pYRC5SYoRzPF9AtEPMHcxy8ikOQZNYesBogQqFrwjc5Fbttgq
	A34M3d1CesN97ntAuKTfh1o/gqdC+lYI6w+ZP07DBQcNTybkVRKeHPb+Y5Y92XPXHUw7fWmsmnY
	QIvKRcVU6y8nHvPgfyLDnbt6r2D1JIp+hk0ij396EtemftDiqAed6RaXH36srjV4W1dSM3iYCVL
	8Zl3CEQVuCBJz54+3tIg17GA1u3S5e3/LmH6SAL4SylJ94jejkA50IQOJJK9qT/tq2ysekEJ4My
	QeHw+sbq+DzTGhUYH7sr66ZV15ijAofnZ2kLNIg+O+LmrXIqFPMutI2AWEylPbLX9LwGo7tnSqY
	EECzA2MQ==
X-Google-Smtp-Source: AGHT+IE4u761VTQhz8y8t9/OtyAFKbyH7V0oLh0quuYxb3Ci1sFKCWOHqVBDOe0fEldTYqcbNTrciA==
X-Received: by 2002:a05:600c:5251:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-47717e414d2mr927705e9.19.1761579902369;
        Mon, 27 Oct 2025 08:45:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:45:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 0/8] net: stmmac: qcom-ethqos: add support for SCMI
 power domains
Date: Mon, 27 Oct 2025 16:44:48 +0100
Message-Id: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHCT/2gC/22NQQ6CMBBFr0Jm7Zi20FJceQ/DoqkDTCIUWkM0h
 LtbcevyveS/v0GiyJTgUmwQaeXEYcpQngrwg5t6Qr5nBiWUFrWocPFhxOSs0npGGp1HWxmhSu2
 8lgrybo7U8eto3trMA6dniO/jYpVf+6s1UvyprRIFlsrVje8kGWOvD55cDOcQe2j3ff8A+SryR
 rMAAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=C/+pGWh4ZCGZOy76owpq0eHfBoBaYrs3C2W6uIOqIOM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N3VBuLTH0yAZ2M7A9DyhsM1dSsCaRksN/eN
 7ktQ+jrruaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TdwAKCRARpy6gFHHX
 cmW/D/4qwTNffsadNq6O2GGPSLLD6/KbqYR6hYjz+j02Ym/SK7B4K4488T2mDJH7VKBfwLNw0F+
 F8UxgRW2JqCsR88CbbKcqaEHHIf0hjb+CQ/00REwEdis+58fXQ1yM65j68YRE8pnCvr9Z7/6yMr
 PqzVltEr/mMDst7I17x0N2O0yQeePnBlPVr5CD8xxVvUMPYnQ5VYC0UdaPHnzcdc2owSgdt3UzB
 EhgXHyWxAYgl5Pk6BDSB7R+q5EJ/4N4T1PU9Sb3H1jG7cVjxBVAfsYRxQHm3WRcKLuQH4pVWnGJ
 2hHKyz1YkGJr0JxVVFRDtnzcS/pXpEKdnv4/YhkwS2jZFKnZhs0xvhko2T8w2WWvppneETXCZT4
 /O2DyyXo/gEXR9ARvrXkQEk+CfUSMfw5RHiqWZ5/x1QoaKDM9MYma6Y0l8jmvcTFZWc0xT2vA8w
 sTxikCmtkPxWxEnOr4y1f5Ve+bTBge/QhuZV3b2xPJ2Jj6bP1t9dAOFSU8SzNuTaDJH8SB4j2gB
 v23ItHdt1cXOl+/OxnDhRNaqG2VShqvPvbiBoIcMT9dc5cNNf3v8gjZt2gkjlVcR6oFiT5oNtWm
 4fw+J26NqLyZ8ysRPJPREz1TWntL5wyPyYMwSMheLEPgktnGd5NZS6pasFvxQByYGOIUSGSTjY4
 R4U5VJ/Y4EWoQTQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_084505_001913_7EA6717C 
X-CRM114-Status: GOOD (  14.07  )
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

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (8):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: improve typing in devres callback
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: define a callback for setting the serdes speed
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 ++++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 MAINTAINERS                                        |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 342 +++++++++++++++++----
 5 files changed, 388 insertions(+), 63 deletions(-)
---
base-commit: 5b54ba44a7db08b43d345380857bcf0fd95ab10d
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


