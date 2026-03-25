Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18BFFC72DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 00:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OR5AmQ5C+PwxUk96HWSvSEr+oIE5VPNLRZ7Lt5xbH4o=; b=n8m5sbMgY93IpAZp++VDKOG+qh
	yAsZxFfupy/lglc2zfBFNpUlmsH5ATQLlltwKGkytf7qqb9CFp+yIlGhCsy9JqQubGEojgnTR1Gs0
	wj4uIyjZlUEGUr23R7YXkuVnYH0TSQV66F91hfx3P0CPoA7bJR8e2VEMwJyx2DLWXdjXK9UnVmjGx
	mtblp14YDhzPszCoBONoSeEp5OVXkQcfKo2yY2G5lZUJnBFJZkfAEqfFYac0ahwz2tbsYlteJwYSm
	aPSDDwc0NN7Y6K9BFVZVTfgOfH5ZaLo5hL9lrwED+WsYwrcJ2+ECD/332PmgXmRR9cAx3ZNhVVhlb
	+9tisWfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C55-00000002Oob-162q;
	Wed, 25 Mar 2026 00:26:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C51-00000002Onx-3EVW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 00:26:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48541edecf9so16491135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 17:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774398397; x=1775003197; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OR5AmQ5C+PwxUk96HWSvSEr+oIE5VPNLRZ7Lt5xbH4o=;
        b=jeax+RT0VY3KJo9szsj86fDfNcvSm7I1NbUSWZnfR0mfyZAqY+zlZNSlgnxddoghFi
         rgXgD4m1p5skFiyBCTTzEHz4/j1TZQMRBWUshIUrYSbioQD6e0rjFjY+LXyIpSEP3OOW
         vhtHjPFF4Y6R9Teeb9N92c+lO1zjuFM76618j/pxO77qetdYOTrCK25rFqmCjqAhFxac
         MMYUx+Pi6w81b2ic1Qh4LVsyf3Hg/9ULGOgLnsc1QyeUN8e5MMKHiWPdDo0R+7l14YiA
         TBpAu15sMRKM+W1vP487I5dR2drl4gSuqWnWfRcKsEbmJM2R5oLkoy37sl1HShA61VKD
         bV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398397; x=1775003197;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OR5AmQ5C+PwxUk96HWSvSEr+oIE5VPNLRZ7Lt5xbH4o=;
        b=tIL6zhR5SMOYXt9TyKw0UGdiBOJ0S6XEn1vXbq/he+XPX7JExaEE/QJ4XR6QbyutcU
         uaPaqU3Qsb59J8vqCLCeYLBLbHiMeQ1L2DhVx2y739bn6KP81WNPj/qOeK0SatIWk7K9
         wEYhK/u7mHp49tpW+60LDmeXv/ky5BzE/WiwtCzuhlUB8G7PW8eToBqjXoTaxReDOqAh
         r8cS5VBoWQAde0nMvYqvDuRhKU5LCCiXQMtdAVfFBxKIVqTw7Pkixy1qlIXPihvmyzEP
         giNdtXRzhDlv00WnVG0XWBg/EJwIPCliAIuYb5yU9giQ0HwHc0oZAmApY3irNQqGvnnv
         GDrw==
X-Forwarded-Encrypted: i=1; AJvYcCXXDcPAk3E5pQWbyrBBt4G32ZkLwF4qtbbKG1mDcD9sAGaNpBL6q7avMchJocVT/GgPTnHuOqQFqdaJn0Gmo2xz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3vMHjRSOgVDsOZwT81KQQl96HUnxgTPJEFGk+uGcpq3dh7/zL
	r3c+M80AMS/nqxcgoHN+5TYH+rJ6qOTQfgGrd4hDmdfTKtB7hW+xLxPcBpOdCbpaA9E=
X-Gm-Gg: ATEYQzy3O9VFV/oz3scP5m8/bNEen/qtV9YA7WqgMYhvHjdPqQpFUCy0iCv5A0PnxeP
	bSJehZ88T4Bo5lw6ny45jz4ffrzftWAsVfAH0w5myKXIs0QbUOJCIGGikG7BtkELI/uTO8ktHv9
	NugLJF3ojxI+eLyxsSsgQtwNbMxmNEpbgGBGF3HzJTYx1sNBe95eV6CgdKbs8R9SuufXlu15hVL
	hkuicGsLqVQkXCFyhpMHDOMlsmR1lDsDi5WOxabH2YOf/022VLsgTMC0tJwhoo7zwnKxBTm9YU5
	CEnMvJVa/Gf7ATGfTaVeOenf+GKUbOVGXxrYvCb/wTtBPYZmU8wU5G7IrtGI+HZfh6CrrS6qIFA
	ZaLv8PSNbC11ZQGzNxStz/3Q+yd1p4M4gZukYD4R3Rr3sbzmHNGOlMQ8ifNXsev2cg8EPWanS4n
	VKmL8Zs5pG3wIbSz2nllmUZ5k5414HPjeBw7t59XKQ3OtA5Vfaw1tpRM1wf2b43dN+Pc+rsFskx
	2ydgc/9JM5N/6w=
X-Received: by 2002:a05:600c:190e:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-4871604c856mr22473085e9.20.1774398397416;
        Tue, 24 Mar 2026 17:26:37 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b85082842sm7233704f8f.20.2026.03.24.17.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:26:36 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Mar 2026 00:26:32 +0000
Subject: [PATCH] arm64: dts: exynos850: Add syscon-poweroff node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-exynos850-poweroff-v1-1-34c19c06e74d@linaro.org>
X-B4-Tracking: v=1; b=H4sIALcrw2kC/x3MQQqAIBBA0avIrBNMM6SrRAupsWbjhEIZ0t2Tl
 m/xf4WMiTDDJCokvCgTx4a+E7AePu4oaWsGrfSojLYSyxM5O6vkyTcmDkH60fbWmME556GFZ8J
 A5Z/Oy/t+INkMlGQAAAA=
X-Change-ID: 20260325-exynos850-poweroff-a6515334888a
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_172639_838169_220B9F9A 
X-CRM114-Status: GOOD (  10.54  )
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

Without poweroff node Exynos850-based board continue to draw current
(around ~60 mA with my test setup) after poweroff. Kernel also reports
different lockup problems and RCU stalls warnings continuosly after
last kernel messages about hardware being switched off.
Turns out we missed a write to PMU's PS_HOLD_CONTROL (PMU + 0x30c)
register that actually switches the SoC off.

Add poweroff node that implements this.

With this change the current draw after power off is in range of few
milliampers and lockup messages are no more.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index cb55015c8dce..3881f573ec08 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -215,6 +215,13 @@ pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
 
+			poweroff: syscon-poweroff {
+				compatible = "syscon-poweroff";
+				offset = <0x30c>; /* PS_HOLD_CONTROL */
+				mask = <0x00000100>;
+				value = <0x0>;
+			};
+
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
 				regmap = <&pmu_system_controller>;

---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260325-exynos850-poweroff-a6515334888a

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


