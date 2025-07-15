Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C797C83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DugjhXIO7Zc9X8QwSUhiZxaVIN8vHKh39CwZgNxvt38=; b=dVlL7TYJQLUxc0w1XhNygCotN9
	EzgjESXknP5Ff7jdYMlObRBLGZPTFPC/8tR7SntggMnBcV39IWdJCqpxm36gW2QTn0QKBuWSy4JSP
	ZhbiJggQAwNFUARpsC1iSKj3q0O4cF5XzKHQ9vSzz+ZJXqyv/6nDw1FnS6HKS1imEP3A249Jr/hEZ
	l/8aSkIGZKvVRKbBVeVF655CplICUpoRgqEU07BUsMtH7nd37FUVSDbGHFaZEatIvwSlhxL9r1kam
	rVl1XLaRkK2DJFO8LA1WYyB/n/LMSQqXyreOBpbvkgl0W01+bOgfbKF/67N8WxnG9rlL7B+ZvCZpL
	goWeqw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBP-000000061LU-0T33;
	Tue, 15 Jul 2025 19:19:19 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiFS-00000005hpi-2X8q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 16:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1752595874; x=1753200674; i=wahrenst@gmx.net;
	bh=DugjhXIO7Zc9X8QwSUhiZxaVIN8vHKh39CwZgNxvt38=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=c18nYsj1A7+W/laFLXbshjJHsYsuKBOIJCpyxaNx0IBqYLMDzJBgejIPo2/iWf3K
	 +jEIFIj8NZy8MSPfdbOaBBHkYeDf86x8d5UZVRoNqiJy0l7uCy/6aPYlvH5e6O/1p
	 3kW7peSuhdBxE6MYd8FF6jZiHoDjMcdFeAdFB2QmXG8/WUSsB1Pi5TQwOgAJFBjIf
	 pXCO+yfXAz/gGxEnwdvLf1qxX//IWbT/pMFHFA2BsQVECRFXt32uLZ+3QwPwCk2r5
	 qfRC6FeeRv71PEDkryh4lhkZJw3R8rYq8Sio3dv2uKfwkyAW48k/1E1YiSV/TyxeW
	 2254elq2NtTuodAIpg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([91.41.216.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdNY8-1vB2zx3db6-00dvTE; Tue, 15
 Jul 2025 18:11:13 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 3/3] staging: vchiq_arm: Make vchiq_shutdown never fail
Date: Tue, 15 Jul 2025 18:11:08 +0200
Message-Id: <20250715161108.3411-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715161108.3411-1-wahrenst@gmx.net>
References: <20250715161108.3411-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:epd0Cqe0VeT0MFIJ0TslWfHSxX/KBR9D9ZvtBiy8fWwEt6AwVb3
 t/71d/VeZpgSvsT7WXvSClcRDKtKKVw2i7406Q3Glyd1b5TAZp8lBrKt1KwrBvvnN+DE8eA
 2BmufMbpgI3SJdg0P2RJNZklAzSW/EuWwaiKFt8AfbnXNAIO5fuWnebqsFienqW2mKf1kBG
 OyU46R6s+ZBsOqIyVRQyA==
UI-OutboundReport: notjunk:1;M01:P0:Lc1Yj99QSWs=;4/xMQaczH5jrfzJXGO39DZn/A7y
 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
 X/59BN1euhKo7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_091118_944422_E5255F2A 
X-CRM114-Status: GOOD (  11.39  )
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

Most of the users of vchiq_shutdown ignore the return value,
which is bad because this could lead to resource leaks.
So instead of changing all calls to vchiq_shutdown, it's easier
to make vchiq_shutdown never fail.

Fixes: 71bad7f08641 ("staging: add bcm2708 vchiq driver")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 6434cbdc1a6e..721b15b7e13b 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -393,8 +393,7 @@ int vchiq_shutdown(struct vchiq_instance *instance)
 	struct vchiq_state *state =3D instance->state;
 	int ret =3D 0;
=20
-	if (mutex_lock_killable(&state->mutex))
-		return -EAGAIN;
+	mutex_lock(&state->mutex);
=20
 	/* Remove all services */
 	vchiq_shutdown_internal(state, instance);
=2D-=20
2.34.1


