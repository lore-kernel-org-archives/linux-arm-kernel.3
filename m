Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9F4C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XP/SC8OSq0bvDhZsjPTYCX9oiuM7x6ktXwHIZsb6Nqw=; b=RSaj/eC+Puzvof/WFHGS0eE0Ix
	0ImKrILTlrvTq+moYD46+YqeMpXs9pm0THdlk1anRGWiHDhjcFA+0ByiB5nF6BEkpev16sTw02r4R
	bisRCoZBwE0BDGqorMVjipzrtmwipSqeHB3fcjRC6ljwx1RH42UCm6gmwgQaKVCpfWzs+ZDShjuSK
	apBa4WHoxInkCy/EkFED8Fc1RFqo1nsucTTzPnAiZsVWz9RRwtaGZBZh3orWTjgyvz33wxk6LxOfs
	kbl7S7BvxJ6JdeTIjCUnvi06OZG4E1oH/Cq1rzimdczd5OL2wU+KI8kP2vE95mfaBYeZJc112+ge8
	0KKIiLdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8llc-00000003UBi-3Hp6;
	Mon, 21 Sep 2026 21:41:40 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lla-00000003UAy-1ffk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 21:41:39 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396cccbba92so3123166a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790026897; x=1790631697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XP/SC8OSq0bvDhZsjPTYCX9oiuM7x6ktXwHIZsb6Nqw=;
        b=mFb96P0davjDVorDFsE8dNMc2NkbV0Z0XssuUt2Ozc3NSiw+UycJ+Zhs1dgOF+Xsg3
         WaeqsW/PAPSFEAGzPDHOLyd57KYxd4ZpHRSJA2689tWV6XJgwZfq8sZJqwroLNiqv6nw
         NwKhARF5ENEb8JPqqVxXMlcnfG/643A6UFjW32Q+Z/OJdVLSmJzU8iTMd9JATZn74Ptr
         KxnKmkVjyS8nvxADswOFYQESVifzFH3autG1XFTb50PUw8SQu4Ab/fwqoRDcY5X4yvVb
         /flgqo56nPELBIau7W+bbSbyc0q0DnxWW0iTGDvX3JSIcxj3MLXBcTCR83QcIKYWybbY
         2uMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026897; x=1790631697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XP/SC8OSq0bvDhZsjPTYCX9oiuM7x6ktXwHIZsb6Nqw=;
        b=DmoSW2ud8MMI+yPQM1J7NTa9KYrVvObVEqnhrDOdmbrH/Jb0qElmZ6HaFcXg3gq4BA
         6z5CI72rQu7p3VcRnAq9At9VXp1uScHzlZFy8sDS8tOrWZYxnh+ehRWQQ/7RpJrJ7VjL
         9oAAHlgdDR83+bF2ImZXUHZ/J3tR6ARZPxEFUWZncC7uPkdodhjRK9y/jeLOGSXIfBvi
         GMczpPhhkrZ0tnGUaL2L5pzmsz0CEsAu6TikYI6VEv7Zq9+CcyMOheTN3Q5I0UZb/HTw
         eVemgsa/8f3ye+hD6VWTxVN+utwGKXiUbQoNBcLuJxqM2+ZBTvZQWlg3kLWMPLshWmPR
         rRdQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/xlLfMmNMU5Qn1kVH0yKAuP2sSARATP5scXd8TiROrQP6Tw3vrX2p6fqdTLy0tWnsYWKXccp90VnswqdMA4HE@lists.infradead.org
X-Gm-Message-State: AFuF++mcsQdF9X15vW2n7/HW+wB/5jc9ESfi8RUcrM47WPd5MNxO4YGT
	B2REbG0Xbvcx0rgMmMIJgEBTbCY7aL6OGVVP7BO4Zs4IFrS2v4sFPlv2
X-Gm-Gg: AYBFou14BWKkK1U+eh7D1ApvUdl2sC/bx9q2t7DT5D9gJMTTS3hMwA7MnTzG3eG9fQ1
	z4lY05cv5t+rq9DHg6GkpCx9wiZg7NT64Sc4uTBHv9t97wynlqO7pNl165NbfEi+gBNGjy7DJPD
	PKk1Z1qXjI3dD7eVJ66VMy18el2I32uT79BuGElA+3Imyga0q67hA9nwD7j9adbq7aLZSS/lgfF
	tWAOrgsbvGf788R1edF0MJXSFckLhb+3eK/vuTmt3RyjOC0Z9mt3L+WH+c3HGcJW46h02IDtaN4
	OaXF7WHikFqvQVyTXyNESSqW3N68xvirNFwurSG6TTF1AOFNCDbBcBa/9a6uJZD9IaHlmcivhuo
	yFJJg4guUh7oACwmH+pdd0sVACdbDObHoSqShNy8+pSRz4J4TSonhU+q8qPVCe+Z+/NbEfcgFlF
	k8BX5H7USvwAk0IvRCOULGycCgbK2AOrn4w6PwBaLMbC6YGY9ZiVznOdxd4VbtR6UmloDTmzww3
	omWHLV+Vh3RQ2njC1UKejYHYwdE3umz5JU/80N7xJReaFwCGjML2UaxDFQhB6vAtjjtnvVf95GN
	Jwqn2NdueGfGujAX2eGXSHwXnSOijHbxYmIuERVOdJ7xDzmjpg==
X-Received: by 2002:a17:90b:56c5:b0:39e:4c81:6c66 with SMTP id 98e67ed59e1d1-39e54dc1a3emr17982461a91.33.1790026896931;
        Mon, 21 Sep 2026 14:41:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a069a0b05esm608892a91.15.2026.09.21.14.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:41:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCHv2 0/2] usb: bcma: control VBUS via a regulator
Date: Mon, 21 Sep 2026 14:41:31 -0700
Message-ID: <20260921214133.16519-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_144138_449264_E0F1C085 
X-CRM114-Status: UNSURE (   9.62  )
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

bcma-hcd currently drives the USB power line by grabbing the
undocumented "vcc-gpio" property from the controller node and poking
it through gpiolib. Besides relying on a non-standard binding, this
cannot work on boards such as the NETGEAR R7000 and R8000 where one
chipcommon GPIO powers both the USB2 and USB3 cores: the two
controllers each request that GPIO exclusively, so the second one
fails with -EBUSY and its port stays dead.

Instead, switch the driver to the standard regulator interface and
express the power rails as regulator-fixed nodes bound to the
chipcommon GPIOs. The regulator core reference-counts enable/disable
requests, letting both controllers share one GPIO without conflicts.

v2: fixup dts and keep GPIO working.

Rosen Penev (2):
  usb: bcma: add regulator support
  ARM: dts: broadcom: model USB VBUS power with regulator-fixed

 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 12 ++++-
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   | 23 +++++++-
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 23 +++++++-
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 12 ++++-
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 12 ++++-
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 12 ++++-
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 12 ++++-
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  | 12 ++++-
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 12 ++++-
 .../dts/broadcom/bcm4709-asus-rt-ac3200.dts   | 12 ++++-
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 13 ++++-
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 24 ++++++++-
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 14 ++++-
 .../dts/broadcom/bcm4709-netgear-r8000.dts    | 14 ++++-
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 24 ++++++++-
 .../dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 12 ++++-
 .../dts/broadcom/bcm47094-asus-rt-ac5300.dts  | 12 ++++-
 .../dts/broadcom/bcm47094-dlink-dir-885l.dts  | 12 ++++-
 .../dts/broadcom/bcm47094-dlink-dir-890l.dts  | 24 ++++++++-
 .../broadcom/bcm47094-linksys-panamera.dts    | 24 ++++++++-
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  | 12 ++++-
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  | 12 ++++-
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  | 12 ++++-
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   | 12 ++++-
 .../arm/boot/dts/broadcom/bcm947189acdbmr.dts | 12 ++++-
 drivers/usb/host/bcma-hcd.c                   | 54 +++++++++++++++----
 26 files changed, 384 insertions(+), 45 deletions(-)

-- 
2.55.0


