Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F90D1036C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIb/0BVQLAIWTGsSf2exEUrI6S97uVc10LsFQOB7HdM=; b=W2WjZbgHPSJZsCm+hT/k8rKcLC
	HS69BD7N316i1nxs+GRBeTpfPybN5uBZRRtx0KF7fAqouoWKS53SOAkbCByl54KvXO+Tz8lpkSrlV
	w0aBhMe8WypJJqaRcUPZGpRNfWSTp7tlDkvgAekounu6MdCc5hKQJexVTRLLFlDolz5Kcbg2rMqoi
	gProY+Cg8xtFBUzmKBG84kby5OxUJThU6rHmypQpCPrCBgQ8nrvpJAqWMltAPeqylaKBucLpDCNjk
	jvntL65yBNSXSEQRm1ZUlC5FgqX5sxxVcpLbMac7NEjG0K9T9WOQvyDIed9uxB5N6KE9Utp1jbcLm
	wJghtPUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44dV-00000001kw3-3Zqd;
	Thu, 24 Oct 2024 20:40:49 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44IL-00000001iCD-1Y3Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 20:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1729801129; x=1730405929; i=wahrenst@gmx.net;
	bh=EIb/0BVQLAIWTGsSf2exEUrI6S97uVc10LsFQOB7HdM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=f+sUdQPIrpLcefcW9v+loVnd4h4gsck8HNCHWcpP3Nfk99KiATs4QJkAvJEe3rDS
	 MhR8qm9+EjTb0Bn25PBmJk+tmJBk3wdvAR4ftaA4J1rfuXWuoAmbBznBtQvnfJxov
	 lvCk2fawLS5Fzjmjoach7C/8405fkKde9SDXNrCQ3xmmiGdd+NpSc+HpMtisWIUAC
	 xIiRpXBU7P6NATk3Ss8GOEE0fN8p5D45EVZG2AGlGP9jDEMt6gftus+iGlXNzeiSR
	 wGoH/n62knbVqXDD1nVVO+XPpNCb/Mrj+zGaRVlRs4CM7ubmZDFWpIa/13FHmjTqz
	 kvE2ApD3fC9hxOd4Wg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOzT4-1tGFWf15oq-00HnTY; Thu, 24
 Oct 2024 22:18:49 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-list@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 9/9] ARM: bcm2835_defconfig: Enable SUSPEND
Date: Thu, 24 Oct 2024 22:18:37 +0200
Message-Id: <20241024201837.79927-10-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024201837.79927-1-wahrenst@gmx.net>
References: <20241024201837.79927-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y5qs/K+Ex8uHWt3Wttf4GhkVYRu3Bxw5179FQJlfcGye3NuYOCR
 rlCUl4rYbHCkDTE0zT9u2NBAmL64Jd3QihDV92VlvKRtbLca9N7WjGdTP+QyH2x7mUabJqE
 qKI8xvSwgeKpTl+BjWz04YJl/Rion2QY3C3kJFsI7qAIXd8TStmqJgWB9Ej+XwxUbdD61rr
 bSuWGu1IT+G9XL2uAuhpA==
UI-OutboundReport: notjunk:1;M01:P0:5Bqh0xCZoz8=;7qu7RK6hWjZs3fljgjsKj1/Vyl/
 ykqWpTFJZT6uHKczUlyiqZovVrD2KIPNEp0uF+KUvU3Pcr4p+1qvKIl2WhLYDVoVQANhub/gJ
 DSWWnDp26eAVcntEruJm9YumheLecR/XB8j2naIuhoqe2bK0xe3cWgPo7ddT1TxOaDzlwU+mH
 pgvVQuT5+rA/UM5/lVNeBr/jVwvcecwyu2sOANNkqqgsbNXb1u74ib8507/tD0zPFG48Zp3vu
 OjA2tSiHoS0jfCSeJApf0016KWwsNHZ0vmxY5ZZBnlNjiSNyaLepHBIZ/20My4rKWUgLYB/Au
 URUeJRmHdl13QDeXARorbtntR9IYMowWYzdra0luik5WeyBe0zcGWvc5B4Cv8WSD6LAWWklIR
 Jc1KFyEbXpURxZC2r974fDURffxx4SHi3FkfBVmoKwl9qzV7Jf+1iO2eY0BIPP8DR9yRLFmT6
 UChhtkQtAePgVLuKYcIMvAmvfaskALwQTB/QbEIaHaCbPN1/1yPWrKTbl7SXv909Ep3OA4J5L
 SEoQJSvvvtI/dy/NapCw/qu9g9jA1Xpapf6tlm5TW7EvCuNlJ6c30LzxxHqJLpzrNIvDkoKfB
 MWclfuY9e56KGJGoyCTlLXdQCU3mEl2KUcd0wKK3VLXJjTgtqBFFKaDVQp578XkBHGKrLLGjn
 FBcQ2J+7ZSvzLGnd0et8UhCimlOghZ6q0/Kb5kEh9j9440wrf/KoVQyXxJi/WYQVq3QciNCD9
 M6CWHHltYhrJbFNz5PEC2fxeiUG7xH5w3SvA1ui+Lj2QSYFkJSkXWxHy/LP5Kq/LjzP1QfF2q
 n+HGCgrJRdE1UOdQsZo5bnEQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_131857_720659_A23C229E 
X-CRM114-Status: UNSURE (   8.77  )
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

Since the Raspberry Pi supports Suspend-To-Idle now, this option
should be enabled. This should make power management testing easier.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
=2D--
 arch/arm/configs/bcm2835_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835=
_defconfig
index b5f0bd8dd536..97632dee1ab3 100644
=2D-- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -38,8 +38,6 @@ CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
 CONFIG_CPUFREQ_DT=3Dy
 CONFIG_ARM_RASPBERRYPI_CPUFREQ=3Dy
 CONFIG_VFP=3Dy
-# CONFIG_SUSPEND is not set
-CONFIG_PM=3Dy
 CONFIG_JUMP_LABEL=3Dy
 CONFIG_MODULES=3Dy
 CONFIG_MODULE_UNLOAD=3Dy
=2D-
2.34.1


