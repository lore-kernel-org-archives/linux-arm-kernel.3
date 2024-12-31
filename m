Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990F9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 13:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kiYnqctI4B7olrZ8fmWCW3agy6+BOp1wZW4vqYuDgWc=; b=3+7zdWL0iNIOUSxUyxoKfXoy1v
	Dfv7ixwMAPsegeY98zPqKse8kCxPTkeWTKqfI03yC5W+fq2BZBz83q9FCha+MD0XDWlhcwh9nTQNE
	tG+itf4GLK9nuqhnDBRJvBTHkaKKVi+8uK2Av4kR3bvIgXNNo0iGDcutciJzjLE5mK1awjd1apmE5
	Z5mLrd98J2YL2HQLnwHsRzNn0OOKKqgbTy8TtrF/oQBIKEqTp/zDqP1hVS3w+wwZVRlf2jFs+Dsgr
	sxwO9kP+4n25SuNQ+kV+Bd2J3v/cu5CfUNi7Xr6DCnLGl5wlyPJHeKV+kCl7lDIJRFOKFygV06c+J
	W2fy9Q7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSc9N-00000007F67-1HQ0;
	Tue, 31 Dec 2024 13:19:09 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSc89-00000007Ept-0Hoo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 13:17:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4363298fff2so14884975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Dec 2024 05:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651071; x=1736255871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kiYnqctI4B7olrZ8fmWCW3agy6+BOp1wZW4vqYuDgWc=;
        b=LKDJ0VRqG5BO+Qlsveljr3EygQxhCn3ZMAIXISLdPvL8L0ZlOvcGY37HCQtIDsrSzN
         CksFTQJ4MYxzzLSAglbdl3Gt27Qi+24JMi6TFDOa2usIJQtIFYf5m5Ijn/n+emZOU5PN
         hrgDk5Y/eQxfNVAiJk01IifgGYa/zdn5PV4VZxUI59zvmVdx8+NIK1PzPf8As2tdJoXj
         3K9RsV3cziuzIm4N58Jy0DCuO6A8enjze/sRslxHQ7MuwHtELWmH88xC6W609hc2FXZg
         Vb9W+NcOc2/V5552fJc8ADH71VtAycl2Yt9NwqbQdiLVs0dRnuiHY5M4iwVExl/jSYN2
         ApYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651071; x=1736255871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kiYnqctI4B7olrZ8fmWCW3agy6+BOp1wZW4vqYuDgWc=;
        b=l5Rt/WSIxqfpKpQd/zl12CyYwhsPYF2vZw2pcI5W4Nw+VHIwMB10BaC8Txm+Da1hLJ
         ScnHKO+l2Yur20PtEDSqXZprXMR/KizlcJnAhfdOIkPDTBurJc4am3jhZgQTyA1L9WJi
         P4CwrBhjuWd3prKQMsSYcMjMLKBjc217Q0YmISAbkv0oBES1Gc7pEURBZNPYTbNbu5vG
         rU6slBJCv550lYCL3OISfouIg7aLzUHak6wDXsGHr6AZKv/egjcd/kE3RiclnJI92TQz
         J6zWwLhlZd8rdQ9VxPQIZ9TzPEVxDDVZjWFIkibKxvaY+ibF6EhD+yFzcg6+vYrDxFyF
         i4Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXNXnq/ixMPotymu1G6gH92Tz4URABaFZDp48+k+KCzAdC1E7bKuo1fJS8hx1aTtGW8VV9fVPzO4RA78nkkqWYG@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjg3O/10Hs42wUdUHR/lNv9r5DTShM0FiYQZCSzjxY6B6GowBD
	eh65cl0vr7HRVcPGKn8G5cTO8wYQTFyBacGpX5/ilGYWcnz7o4JI2zyD4g+oSLE=
X-Gm-Gg: ASbGncsVwfbhAfMc7wVDcJ1GcQIY+cLBm1E8DcLvOBAR7/ifunaZEwOzO+F8jDzt8rO
	ZrlfgVUzI0VgzK88YIaR6fU5J28dIAEfkhvFgAxq9ycESOZ/v9ELVMduxNn1wBaDsLAT7gdcluR
	0/gptqT7fOgKJUguJfoOyyQYK1P8GIRGsfiD1XkB2myK28RZFVFC/XvYQmx1PQHQauajd7hT+Wd
	pHmGT+/ewY526bktpOSe2yCuNVORSOwU9aYyHCCKYGiPkP653EpyFMN1tcWafHmNhK8tBI=
X-Google-Smtp-Source: AGHT+IGnj1OFU+azmVRh2S542hn5DclJ/XA6d8meuminmJqqKBQ20AJacibZOKkBSbgCiUYj9yDP9g==
X-Received: by 2002:adf:9dd1:0:b0:385:e16b:72be with SMTP id ffacd0b85a97d-38a224057f2mr11310081f8f.14.1735651070890;
        Tue, 31 Dec 2024 05:17:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b441bbsm420068305e9.40.2024.12.31.05.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:17:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL 1/4 defconfig][PATCH] arm64: defconfig: enable Maxim TCPCI driver
Date: Tue, 31 Dec 2024 14:17:38 +0100
Message-ID: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_051753_133080_034D7E59 
X-CRM114-Status: UNSURE (   8.88  )
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

From: André Draszik <andre.draszik@linaro.org>

Enable the Maxim max33359 as this is used by the gs101-oriole (Google
Pixel 6) board.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
Link: https://lore.kernel.org/r/20241203-gs101-phy-lanes-orientation-dts-v2-1-1412783a6b01@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..dea35b7648f7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1120,6 +1120,7 @@ CONFIG_USB_MASS_STORAGE=m
 CONFIG_TYPEC=m
 CONFIG_TYPEC_TCPM=m
 CONFIG_TYPEC_TCPCI=m
+CONFIG_TYPEC_TCPCI_MAXIM=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_QCOM_PMIC=m
 CONFIG_TYPEC_UCSI=m
-- 
2.43.0


