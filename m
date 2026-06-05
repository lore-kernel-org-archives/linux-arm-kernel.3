Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202B3CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 07:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWQkWARQy+nWOamGOOMfZhOPV4ti0QdK7fq4o+3I26Y=; b=RnFM0KmCeErYq/YpUmqOPXg7kL
	11s0wRG4kDn0AZX4HZ2C+l3KyFRZ//z6X24vi5kuqI3mbjfbBRXuEJ/gTeeLmfjyrbCuGPG8QWPQE
	7/DypgViAKEm0KPae7RmCX+ZXj9i1qF9kMTevi5kVioAE0RtdoUuO2hoP2HSL88Xe8PmOo3BxwHaO
	hbMXR587DIy7dR5MJrn6Tc4rHpPTicUa4JVPNu3in71idPRQ4bR+FJflJi/m9iEJ/8TASFpxGQBdV
	zp6rgIVBu8yVUvRbHTx72CNiuq2N0maWHAcRzpoy5Q2jM8kf85KxgKBZdhBUpzT66XbuWjI1qgQ8j
	P9vXM4Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOgt-00000000Csh-2FpV;
	Fri, 05 Jun 2026 07:10:03 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOgq-00000000Cqj-0U7x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 07:10:01 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45ef5146b56so1689889f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 00:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643398; x=1781248198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWQkWARQy+nWOamGOOMfZhOPV4ti0QdK7fq4o+3I26Y=;
        b=n7hlrm+HeLz7/Aeyz9XQvsYqchtOVvgvKayr9VlT9Hvpw/a0Flhc6YfgNu/yTJdBiH
         S6omxwNTNSdBe94XURCMk54Pig5ar5OA1Js1xdPcLpACgHFfMeOKXdifIwDTOk2eCpBE
         39/STaszuXnFDHLUFGJ8GRK0pl1IIfe/veKIkyv96PkTUaSw3NT+7YD19xk0MSA/1Uq+
         HrkOauFLp0A/t+bgYfdTvjX2YslljlC+QeNMVmK08ZKcd76HDfCydiy7nDwd/muEwoR0
         +TBc7O8EAXH7t9whq1E0ETzE1TDCc8MGLEvhRvoMCimfXXGbRw77rg2QVzOaOJB4SMng
         8GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643398; x=1781248198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cWQkWARQy+nWOamGOOMfZhOPV4ti0QdK7fq4o+3I26Y=;
        b=A/HxmrOo60HqQq3eWLZKPLDF28yY36IJ3F0qLO/JNybszsN3QNX0ZlZxK1jgM7mwkR
         0Y8i9G1HDRC+wDMv9O1nHRnvVveAUIRk+52tf9jfuJKsOtMLbohg4cf1GWxfgIe43cgB
         pasJqQalVdhPMYkh/9eu4bceB4nvaP+ldK8nfL0fUGTMzwrlHtqXfNskOKij5NJnJ6jm
         LGnrqiDeYCaywQq8odbf7p+84jNNtx+ciU40bJiTCmPR8P08uH5A8mtl4R0xnS3ET/58
         jEk2ZjUgwF1PNXdJVGQGSQE9khJVxZhmwo5AHIUNu9S8WtKNOwjnSqz4SXK/hKQV9Kyj
         jg5g==
X-Gm-Message-State: AOJu0YwR3arhrOpKZUPsGpVbiPs/H70Zw6o2inDGvI7oil5lUdOYx6cl
	XsSnaRyMdm5RAYGTzGigiKyFOTDGc++nRCO+yz2rDASki7xdybtLmdwbpcpnZ5U3zpU=
X-Gm-Gg: Acq92OGStNHPP4GO9mGSJW2fX8yZXRem0Z2U6f0W+26HhrrHkIaNNqg9eT6EcXzCLKa
	RSqqcWhUOfF2hoIr3Zjas0sOB15fJO0qY5I1RP/VSZ2UVlcRawLZBB5SapQ2iurYtxiRn3+IcLb
	IHJOcLS58B/xUk9Uc4vNPbRyVqZZ1nGRj2YBTcTTURHB8oXA6cb6K3oHtdig9z6TlQvblpsqDYy
	4IRwhkCc8j4hGkMVLzQsTX91DedIXvAx1MojWs0a6izpPCR1YqxkvgDkK7Db8ig4P1y5KdJAq3F
	R8pwwIpZED8XeYrD1o36J6R7xuz9KVgOLd8JKbuZivo2MXtP8Sd6ahukbacfKXjsgyxxXanEKm5
	5oYaLiPOFBcJIB5MjRLvpOMMpzIpNMfNs8TFA0LpDsVyc8Zm3N6lQk9+Xb+Rr2mLyCSBFf6EnBw
	KWJFd9qP2DcG1kGOKqpJkk4MD60O7p0ALT1whq5jlYtEcqnYIgGbRQfX0a+6D0UK6Zvv8RYZmrM
	HhDN4TUDeTe3R97cteoQA==
X-Received: by 2002:a05:6000:4802:b0:45e:f3b2:1228 with SMTP id ffacd0b85a97d-46032b611d3mr2196291f8f.3.1780643398206;
        Fri, 05 Jun 2026 00:09:58 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:09:57 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 1/7] arm64: defconfig: Enable Allwinner LRADC input driver
Date: Fri,  5 Jun 2026 09:09:15 +0200
Message-ID: <20260605070923.3045073-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_001000_157723_90D431A9 
X-CRM114-Status: GOOD (  10.75  )
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

Enable Allwinner LRADC input driver as module to support buttons on Baijie
HelperBoard A133.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- no changes
v3:
- new patch

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 96ce783f24e7..faf6d86d0555 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -479,6 +479,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_GPIO_POLLED=m
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
+CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_KEYBOARD_MTK_PMIC=m
 CONFIG_MOUSE_ELAN_I2C=m
-- 
2.54.0


