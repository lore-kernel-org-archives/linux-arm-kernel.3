Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86622C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 22:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=15lXngfbV3oHOC8Vn3lhHZSCcqaMFAt4guZPgjqF3Ck=; b=NeZLWKSg5vMAbLZvb3wql9ZJ/j
	QcbYSAtc0Us87LgwrdimhSblNTV4VdcvsIYyW8qC+/kuTAkbo5vs+coIHoxMqZK/sVrbHnsYi1OSb
	mBZTmhy8G+4HrIfsBrRfuwm0kAJ5WIkdXXd35C0O10nh1GdUFoNZHIDWgaZ9AFhVCeZP9rWwNbUD4
	P9C2iKmlQIQOhf/6cPK7HuTjSTm1iA2BfIV4W2CpZOm9e0daF+stOnS0XspEh1ZHTvw0Fw9ebt+ja
	EXO+9SbMw3qW9skTdflUH/vDtZS+99adKFU150AEZITfi8cyIttVLRlLWi7S7bg6sI2a83i77WKZB
	97u2QeHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrva-0000000Dj25-28a6;
	Mon, 06 Jul 2026 22:36:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrvY-0000000Dj0s-2OE4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 22:36:37 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493b27c7451so466235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 15:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783377394; x=1783982194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=15lXngfbV3oHOC8Vn3lhHZSCcqaMFAt4guZPgjqF3Ck=;
        b=CZY9EZb7oRHkolW6jEO9Ri4eCEB2HW+7AfVvVJcpzE0VWT+Mie0NLy5adDZ6C7P5lP
         uO+PVlhO1qGeks2NjpvS7ym3RuGypls2i9iaZ5LZHttmBmvAOmihBfC6tm61NjUztzsU
         iz5OcIzp9kSQKxZWhME8zLvotBqUT492BLfEYiD8revsRvEPD+JoxdcRotR2LzfKtNmV
         HauYbxlp7stFfX+dlw7itO2lux8gazG1MJm93AX7E/3QHuSRQ9UcA53G1QebfZjDbv7a
         ZaSn1Cd8pRqUUq/R0e6J0o9PYPBdrCFHDOe3rzUZvgd5otIGpk/jbKb+spqCsaWyNRjC
         UhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783377394; x=1783982194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15lXngfbV3oHOC8Vn3lhHZSCcqaMFAt4guZPgjqF3Ck=;
        b=loTkFq7Qt/6Xg+IMtM3Gw4061krpEAdEQ8pQv39UYr2amJCOS5DXmXcqjkGBd0rvcw
         DDHzeoZ25uBOL/fJRfAcKsSx7ZDZDY6z+DbODCVTp5fbejXzG0EG741dQrmcbeds7SS6
         QRV8R1H8U1knKph0Pc28oFUC/mdiZRZQXq3BfpMivdvk7kkJnUmbaYtPkaixmgnoGryQ
         wPLnaY7QFP/aw5iVmKXKXnIc8a8CSjtRvp6CwOMLAUFVcn4QNhZ1q3GRI5DafPVWOuJU
         lRaNUsQqgXnIw8DBayI46KksmLv1o50em8rcmdVDIX4WFPMoJe1bZz+1uQN46KQcxsPY
         1nPA==
X-Forwarded-Encrypted: i=1; AHgh+RqXUCW9RppTCX+kXbfAEMjG5JRoSGYyBebkNSnoq0O5IlXXVnFI+VKDsJ5MfhxhP9cDt6FspM3hdodZLfhO7Rkq@lists.infradead.org
X-Gm-Message-State: AOJu0YzLFdMQIdZKf/Tkt4xICzgYTOJNTl0O12hPU9KRtNhJCM5/SAUX
	pL9HWp1m42F3DGUPuUfTYdc8fhMIPio2YWI1tlyLjylrpHIzcXmokdJE
X-Gm-Gg: AfdE7cnzQqG6pIqyfu0pLWvzGXQPyoISOQn/B6UhExV+jBVTxLD0K+wsl2tPKCoWiQC
	kHkdCblcokotH9GZVTnMdRG1DlFjjes+iEatiPubDg5/6AoBjX2UW5N60SNeTw/BneLBWZJ0Rko
	MI/+ijww82Lxh8FjO3TVAFPCabS0B0LHFcd7HOV3vMbSWNe/CLQxl8DOlDZuD8VFg1+scE3TKQN
	3KepU632UY5lWtGAcJC/QNlY3bSK0+dUQnSUjkDdQgDOETd8XIWfUedO10HjC6h0/W1NjmYJd6d
	TuqCEI95w65ciYKawiH961wiUwcqI1GJiLtjA1JSIL9LBhO0/t6FIawnbuxg0+bODjxuPhvkVxt
	EmOt13DUVIA2Xtp39cWt61ZN3wwx4cgqWYvjNDDq+hmdbe9v+/4NdHVHiqg0jjtdqfnPEImn/v8
	/ETw96szSWszabFT75MUdfAR1eiof695eTZzb/ulupEtoxJeqs5CxdeCFDzqBzRw==
X-Received: by 2002:a05:600c:1595:b0:490:55d9:149a with SMTP id 5b1f17b1804b1-493e104d170mr977625e9.18.1783377394164;
        Mon, 06 Jul 2026 15:36:34 -0700 (PDT)
Received: from turbine.fritz.box (p5785b224.dip0.t-ipconnect.de. [87.133.178.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6da9sm27491387f8f.12.2026.07.06.15.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:36:33 -0700 (PDT)
From: Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Frank Wang <frank.wang@rock-chips.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
Subject: [RFC PATCH v1 0/2] phy: rockchip: inno-usb2: fix USB gadget hot-plug on peripheral-only OTG ports
Date: Tue,  7 Jul 2026 00:36:25 +0200
Message-ID: <20260706223627.113814-1-andreas.zdziarstek@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_153636_638917_E86C9502 
X-CRM114-Status: GOOD (  22.83  )
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

Hi All,

I had an interesting time trying out the USB OTG micro-USB port on the
Odroid-M1S (Rockchip RK3566) on the mainline Kernel. My intention was to
set up a cdc_ncm+cdc_acm peripheral gadget as a hot-pluggable debug
port.

For the most part that went swimmingly. Just not quite with the
hot-plugging. The apparent first problem was that peripheral mode only
works if the host is connected at boot time of the RK3566 Kernel,
regardless if the dr_mode settings is "otg" or "peripheral". When no
connection is present at boot, gadget setup fails with a
"failed to enable ep0out" error and the port seems to end up in an
unrecoverable state afterwards.

I investigated a little as to why. With my very limited understanding
of the subsystems involved, I think I have identified some problems.
All seem largely related to each other.

* The M1S references its 5V OTG VBUS switch as phy-supply of the OTG
  port in its DT. The phy core unconditionally enables that on phy
  power_on. From then on it powers its own VBUSDET input, making further
  cable VBUS detection impossible. Also, apparently, after reading the
  schematic, that means even with a cable connected at boot (and
  peripheral mode therefore working), the board will try to back-power
  the host. Seems my host port is pretty robust, luckily.
* The inno-usb2 driver seems to generally lack DRP power supply VBUS
  switching support? At least PHY and VBUS supply are semantically
  treated the same.
* The inno-usb2 driver's state machine powers off the Phy in several
  places: on an initial no-VBUS sample, on DCP detection and on
  disconnect. That seems to happen unrelated to controller-initiated
  phy_power_on/off calls and looks like the main cause the gadget setup
  fails and then borks the controller state.

My proposed fixes are in two places:

* set the micro-USB M1S port to "peripheral" in DTS and remove the
  supply node. The board has two USB-A host ports, so device mode is the
  most likely usage scenario for the microUSB and real compliant DRP
  does not seem to be in the cards in the current state. Also, this
  fixes the potentially harmful back-powering issue. (2nd patch)
* keep the inno-usb2 phy driver from autonomously powering off when in
  peripheral mode. This makes hot-plugging and gadget-setup without a
  connected cable work. (1st patch)

This "works great for me". No issues whatsoever with the M1S in device
mode. I can plug/unplug/replug at will at any time, rock solid.

However, I am also doubting myself if I have completely misunderstood
the whole Dual-Role status quo and should have just done something
differently.

Also even if I am right about the problems, I would agree with anyone
saying that this isn't the "proper" fix for the whole situation. It
seems the rockchip vendor kernel is doing DRP related stuff differently,
e.g. an additional vbus-supply setting in DT with apparent support for
VBUS role-switching. Fully automatic OTG with gadget support *should*
be possible to do. Possibly a lot of work, though.

Still, I would say having a solid peripheral-only option including
hot-plugging is an improvement to the status-quo.

Host-only configs in other DTs should be unaffected as the inno-usb2
changes won't matter there. The autonomous power-off will still happen,
for better or worse.

Would love to get some insights on this from the experts.

Cheers,
Andy

Andreas Zdziarstek (2):
  phy: rockchip: inno-usb2: keep peripheral-only OTG port active
  arm64: dts: rockchip: fix gadget hot-plug on ODROID-M1S micro-USB

 .../boot/dts/rockchip/rk3566-odroid-m1s.dts   |  2 +-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 27 +++++++++++++++----
 2 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.53.0


