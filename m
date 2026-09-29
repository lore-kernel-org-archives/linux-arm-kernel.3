Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C99C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqA+LDAW+n6bzSeEWtxAoQmofqsPeInfCOUXCovBFDk=; b=hGpMb3WqKLNIEOPXPpjLQouHe+
	9ITnaX0onKdmXvqqaIoC0BAWfocOXq7XQRd5Mdjczxv5ise7BYrTnuo/BaqwJ/3zyrNxOhFqCSee6
	jAMjcUIAp5XHxbu5180BIEdufy3ZMdeiCw8KJ2AJW4nYNHGj08+B34ZLnFwprXhpDB8YpdWjhI6wT
	5Cgj2uNDHd+cZSkEV3oqfoOrSlHSXQEGobiS6LjU0iKVdkxdIsBV59RNd2ShWmqwFLzdidfxPN8sC
	kqoWc3YLr+N8qpaiYNqSLV0n1y5YAPKsgKgqWvSIOwkFdxk1mYUlxj6qJkGEk38I0j2xCunIas6WR
	Mns7sPBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYUZ-00000003kY5-3ti8;
	Tue, 29 Sep 2026 14:07:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYUO-00000003kRk-2pxJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 14:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SqA+LDAW+n6bzSeEWtxAoQmofqsPeInfCOUXCovBFDk=; b=gyvgzwdWKpceRtp7EK4syM+WQN
	Rg1AdvUbIfsvYps8fsJgpoNhIicqN6BiRjqRoDEAAlpFOCcPpg9mR26e9Hfg70dalqFNTEqm1U8yO
	pVD9V7wUE1Tz4j0yEKn26BHyFtfMYlbDrcNj39V5LF6e83lBf88fq8w1ImXKVL69E/f/EuD0iRpS1
	QanXeJJAWgoPp8HAduZnmrkSKDpbugxapsFXemw5f1DbIwl99xoBAHPsrj2OGjW+qOHa8FDKZXgf8
	hylXB0exxmYd1M8J29cHppRXKFbWBPyibLoDZeChDVcPjb7hdV9KTxACZaFiSet/zi9QFvkCor32W
	kl1aVDSw==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBYUL-00000002iak-0EC4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 14:07:23 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso438671a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 07:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790690839; x=1791295639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqA+LDAW+n6bzSeEWtxAoQmofqsPeInfCOUXCovBFDk=;
        b=F4J1J/YSYoQ5kVT4H3Wa65jp144ZgJjHnadsL/gtXod6WWjJDbsuJj5BZ10oTt/Dcx
         6HPDnulKTBf4duEKZuC/c/0/Ha4SNSfCCoZyFsGfa5duIFFxQdRISTk0zdDRlsWwExhA
         4B75nJvwwMqMtomJq+a2IUvSN4Gf1mTqyEnbwD3JkxTvx2neUTWnvJeEVyeCUft+ObhW
         UCKvBRuEcb8BIdA0dyB2n+jNUO2gWPE5PtD55JitwgM7oihH/kSF0GwsBNOhO76/U6k1
         FL/IM6oDNCGdU67T1I2BtP/D1Xo0pbqmAGTzTDJ6wjXMIMJ1LuR+Vv9pffsfYopbHAlt
         rJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690839; x=1791295639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SqA+LDAW+n6bzSeEWtxAoQmofqsPeInfCOUXCovBFDk=;
        b=yreUlyJ6/PzKMKbMdA2bIKHx7K5zAUSRmRBb1vEubcTmDWilsNNABAZ880N3X9fnER
         huMx4NBPfNJuroUPk9ajEFCuLhi0NDwLBMvBj1GlpHvCBugoLIIAo6A2lMumqbumKp22
         XHABc5GDywj94AlclmODfqM6SxI2Ep+UTN59gBCmxiuwtnKskA4kr7QQQr9h6sPBVbeo
         bO95t41nurGNduiO6qQubGmZT7cZODZr6ld9qekRB8xO0Z1ubABl8GD5V3uiFjarR2AK
         qSQ0rRz3mhFt1wX7FxbrAVnJMEt8wNl8g42ERa2t3VK7TZVWjpsBNZObgGc4GNUTUcOk
         o+jg==
X-Forwarded-Encrypted: i=1; AKwUvBxUeVzgi7nvDnN8pigpFA5wrQN5hZu1ETEK2hO/DIWCjZsWKl0Z1R4zLNBL4/76nMOwWWH3RR5Ib5R9RNa71MG+@lists.infradead.org
X-Gm-Message-State: AFuF++mB3+pc7PopeE/iv3/HZ71C1RlJZp/93ezvMJBetpZvRRsHVAEM
	L+UlNbQCRMozf02so9sn1oEIRoL8D6Y6L6WW4ium8w0xdy0z9LNqPlir
X-Gm-Gg: AYBFou1HhAp5etsIdOVM8Jyu32tJ9TpscOEhoBcsq7lJ0AyEbgXq+Gs2OlynQtfpozE
	kynPLDiyVXfbuxXWVnaOdA1h5O4yswMaZzXTpXR4FZRBVE5ayyj1zMDx7AcKOoWUYFAB+u56SWa
	HVecZH1BjY91zNyHvMhHf7MYMInf52STRsB9w9bKF5mhTCPZKlnhxGpWwCvo2bC5VmJTZqJZZ+t
	ILwMEEU8Z5pCl+H6F6B9XU8dA5BjR/Zv11w41fUD5tfw7g9q/hNLalEFJYbawk8J8G0N5PbLMWB
	xJyJmlyvItrneGI9v97e0QfLFSGsOm2WNT66BzfKgtYiGmgSermeKUIJOcTHvDa5GqkdNmfmSj9
	/xWRq7e6DrAsY0NEdWkDuDRD/E7qg7ToULqMcCtzP5jKDQX1HiXlmwykxSuvP514AIX0QNKR4lU
	tH/tUwmRJ0ZT0pcoIxFDJltzdFo1xMLXEupDNGFk4rzU1d+tsLS9hFm+V+Mb27g44tvu0XgoqSu
	Y7gQNTDe3w=
X-Received: by 2002:a05:6a21:150d:b0:3de:6172:e340 with SMTP id adf61e73a8af0-3de7cf3ea13mr1897125637.38.1790690838628;
        Tue, 29 Sep 2026 07:07:18 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7b0f4ab05sm3526989a12.29.2026.09.29.07.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:07:18 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v3 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Tue, 29 Sep 2026 22:06:48 +0800
Message-ID: <20260929140649.55-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260929140649.55-1-yaozhonguwl@gmail.com>
References: <20260929140649.55-1-yaozhonguwl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_150721_635186_B1FC199D 
X-CRM114-Status: GOOD (  16.10  )
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

poweroff on this board drops the rails and immediately brings them back
up, so it reboots instead of staying off and U-Boot reports a power-on
reset.

Firefly's BSP drives GPIO1_D0 high while the system runs and low during
shutdown, before writing the RK808's shutdown bit. Mainline does not
describe GPIO1_D0 at all, so nothing drives it and the shutdown does not
stick. Describe it in the PMIC node, with the settle time the vendor
uses.

The BSP releases GPIO1_B5 in the same sequence, and in testing the board
came back up when that pin was still high as the shutdown bit was
written. Mainline describes GPIO1_B5 as the backlight enable GPIO.
pwm-backlight drives its enable GPIO low whenever it turns the backlight
off, including from its shutdown callback in device_shutdown(), which
runs before the PMIC's power-off prepare handler. That pin is therefore
left to the backlight.

Fixes: 171582e00db1 ("arm64: dts: rockchip: add support for firefly-rk3399 board")
Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..210e4cb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -327,6 +327,8 @@ rk808: pmic@1b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int_l>;
 		system-power-controller;
+		power-hold-gpios = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>;
+		power-hold-delay-ms = <200>;
 		wakeup-source;
 
 		vcc1-supply = <&vcc_sys>;
-- 
2.55.0.windows.3


