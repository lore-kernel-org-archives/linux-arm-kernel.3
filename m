Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD237606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 10:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gtbXnGI2;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VE8OPwjY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=is7L+B2RN443PYwwoWeq+UVhGmTjVPpzuTGcDZVXmgU=; b=gtbXnGI2ltctKs
	IUeBBLep0d1L80IZVtXbZ02wPAedEIY/n9MZLzGfk6mrMWz6RB86/mXBArH269QMGXbrVmneJxT26
	JPqv8auD6Icshhqjh3IivGLW3hzqHbcW3a8DKKDPF7WtZz6QWLfiNKSTKEP4NABvm0S9DqijdTlr0
	MxcXsRw0B6IRMX6vNxALE/4+vSCExn1NTnYu5hdIDqDUkiSds5PpMyQK1YzTWFLl7RWyyJFPUXnTk
	Q7/PAk0aWFVUZLAFSvaWkBaaPpUXWuWz/q1+UbXSOdvHops0PxyRNo6yRusKDiNSZjsfOQRAY/qhc
	aY3u0JGr34iCKYSrwUCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCGN-0000000G7gh-1Rel;
	Fri, 23 Oct 2026 10:12:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCG4-0000000G7UY-36oT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 10:12:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so4316545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792750336; x=1793355136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=is7L+B2RN443PYwwoWeq+UVhGmTjVPpzuTGcDZVXmgU=;
        b=VE8OPwjYR1n7qy/xlvyyyNj3y/wksN7jzut67BXkm1wQfThbcIO7N+QxaZjt6kSlya
         jqWoQMCVY3Nvo5zB5BdVqb4ozBuycohPu7iXcmeaHapNLbZx9DxV1GPuwBaM1DSX18cK
         H6SkD3FFQqV2+/tU4L68yZd87GhtqrQfq+KTtO7IUtXjdvhoVC2UU5EkwJScRSVaDdwc
         u8oXWO7d8sbqoqKth9Wb4wlm3zwDY0YxehifwuHsSDDRkzArinMgndl3XAtYvqo7du7x
         HZTQQzB9lDnmWURDgWLDMCKC0dlgLTGCWBjAKLftwN+gQ4HTC21DbqSsOL2hxMLuGHay
         1LnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750336; x=1793355136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=is7L+B2RN443PYwwoWeq+UVhGmTjVPpzuTGcDZVXmgU=;
        b=HsHnycR/AO3PUsOm1blynNICzsZQLQwK6ETS+iTgMrs7PYgh7vC2hkVkMTtvat8mVX
         jg1lk95z2ii7P0385LqjvlmwQRQ3Yq5r1O9B8QpQcNYF59vuDim5C/lHOFtir8X+Td3d
         ZQklNYS5WaBywAJraIz64oRaRdqz+LkAf/HnSXJUsqZgCvbgdj4wUmr5QRQOFcbBq8ro
         Kkw8yA4nv6kAZIFI+1cuSkRreeH5/4JvnY2rtEO9iRRbD/fpndmLHtHx0Zm+0h8bTQDw
         LDEIMa1JyKhMBQx9PyUQXxqdRMaMcntofmeDhwSWf22/3vpEQ8ENfkaGaG0owCv3cX+L
         WSZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcv+91fDIl4zvbv+1Zx+Tcg3QLJ7t8AonGPYohVd5SP4gXyoCpgpCljCuAxahespzHfNzrZmlkrPkZmD/y9z4n@lists.infradead.org
X-Gm-Message-State: AFq9FYJ9qbcGroRgpvbwktcTgWd/Dh12iaPaYoIgYGt4WjGQxKT/Cwlp
	kTsfTS2w/dwXlnXOVp6U5fwHQ8I/Tft109B7JwQuQx88Lmprg85COqJKdcAkZ1fTH6U=
X-Gm-Gg: AYBFou1p8UauSyne5+M7H3llGepoNpBErrEevBtgowz7zhD5sRz8AnfPl4lcpjOGGZz
	d6eDt3SRxdkv73l+vEnoq6q7UztRa5WQYTFA8yOE3GZND9Jm53JxonKxB0adOA6ZViKmcrpSpsN
	TN+s36vrrMMISNc/w1pwPm7hoOlNpF7RKj98LO4z27EgD6TKRaomjJ4w1ssXG6TjhQ9kzyHYG9s
	tTKKkQWxS6EI8nK7JmOCmdcuJ8BJxQLvYPSFmLZbkIqmluNAd328h6R8KU1b0wUIo2aMITtVkjP
	63Dav3/mRhNQcI5rxQL+MWaJQ0G0IJtWYofint9gR4vixx0w+lUH7HC20JFAFHeUr+uilvrU2yf
	B3HpiEj4OPLiJ4uCot6ep7X0tzD3PGJo/cu/WXWwVxBA4qUOrM/Bol8Eav6z7sM5vD9cIfKpn6K
	48ecHUinQ+tkeI8rVVsoIpweA2GfSLvfF8du6gp8OPU/C6p/khLukMGwLgZ0Iiojlj0jgomYVXF
	RwDG5M70aN3S3L5DvOIvYa/v92b1Pxj7jBijIm5CC2g9gA30+9zCcn3HM0WIqzT2+RZbHlGMhLV
X-Received: by 2002:a05:600c:3514:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a211ed7602mr26707515e9.26.1792750335754;
        Fri, 23 Oct 2026 03:12:15 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211b89beasm57982975e9.5.2026.10.23.03.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:12:15 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH RFC 4/4] arm64: dts: broadcom: bcm2712-rpi-5-b: Add RP1 fan tachometer node
Date: Fri, 23 Oct 2026 12:15:57 +0200
Message-ID: <f00b7ccef721c7120ac10a9507ab211773787aeb.1792748691.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1792748690.git.andrea.porta@suse.com>
References: <cover.1792748690.git.andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_031220_949158_6197C744 
X-CRM114-Status: GOOD (  11.69  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the hwmon fan node for the Raspberry Pi 5 to expose the cooling fan
speed (RPM) to userspace.

The fan tachometer is managed internally by the RP1 PWM controller.
This node uses the 'raspberrypi,pwm-tachometer' property to link the
rp1-fan hwmon driver to the existing RP1 PWM controller, enabling
RPM reporting via sysfs.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 748be8f1ee9e2..9bc6d0e9da1b5 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -16,6 +16,11 @@ / {
 	aliases {
 		ethernet0 = &rp1_eth;
 	};
+
+	fan-tach {
+		compatible = "raspberrypi,rp1-fan";
+		raspberrypi,pwm-tachometer = <&rp1_pwm1>;
+	};
 };
 
 &pcie2 {
-- 
2.35.3


