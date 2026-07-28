Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17664C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QauyaNd/XQMqVFtAv3ll2oSoodU/3X6RpqEB6YOpU4A=; b=iyAAbNMD7Na2au
	jLWIBf1MOr9gvPCVH7inMaMRZsQb42sVhrdqAluumaplF0KgYondi628549cB8OcCPWpvchCCYVkI
	2U0HZhhw+G4zbPzHnx+nhkdbTF3CR9a5Q5IaP4y3gFKsPBy1gvObDkQRJfYQ6hJuUiAy45TK4ssTB
	75hjf48RAeduSbXVu/lUjUGDme+5J1Zcyelkn1pK5yeys5NSs8pDsH7WIR6PX7N5c9zyDfqQE1jQt
	MiVguu/PUvPjnMzh4+C+Kl4NLH/Y6jn+Vah3KTfQlA+gcRQ1IBkhMJSC8je/jOFkv6RtTmCYRc0mf
	2DqbLVTZMO+xVW0onnaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeAO-00000004ph8-1qjr;
	Tue, 28 Jul 2026 09:32:04 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeAM-00000004pg6-0DnZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:32:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-495635a85d2so29861345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 02:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785231119; x=1785835919; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QauyaNd/XQMqVFtAv3ll2oSoodU/3X6RpqEB6YOpU4A=;
        b=viFCQbzVQ8CHK5G5ct7XwJmhiprxkDFwLjInjMSKSGNdZVHoi9bh1tVHcQhDiwO5Sl
         njiYvoFhmfk4pyimKPBdOKjsHzn3FZEILnyZrtxyfYQn0Ove1BLHnjyN8skZ2PeM7huh
         Z6YuLmFJu5H0MNM0Rilo0Lb6eO4m6hVIo0LF4afpiz8nHAehdcbv7ZbLCGc5xmwDXZlG
         DoE1ITPLc48gl5NI4WHRMEzcmoM0ZV1fPFge75JW1em59oNqAYUS17JFcz0dUx6SyK7v
         oxj00neOcBUNoXhBlFGEyFxI4M71Ch4WsZ2r6YNvmC9mprhZVf9fQGTuvyFXhoyj4hPj
         ZsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231119; x=1785835919;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QauyaNd/XQMqVFtAv3ll2oSoodU/3X6RpqEB6YOpU4A=;
        b=QIqaXN2RGraXPBGZKyQ5oC7zGP6s2s2jVZiOd6krY3go0YaNx3qSawmWLgv06BHcyW
         IRIsEpPIeZ5bIjrCBF8DseSVMy4r8Wr8SYRQyjft7AMPxdD+CQqBC/X5zVIxB59h6OYI
         xlIA7+bZAOP7+GJ4V5ylMLbXCRCbn2Ef2NxQ5xDKHyoo48HzmCsxo96PGRv+weOIyaGP
         Ud45qHAd4ELcsaoq1dw0oR5spM1xcIN9yVFXD7C9+K6Xn3Rlw/ahvhWI1mNwCzx9S59h
         tsQDhp0G5bYVqk+nLgDg+c1zk/1n5I7jiqAQQjojRYX8TfdxAKH62YS530ok280tyKgg
         wr6w==
X-Forwarded-Encrypted: i=1; AHgh+RrrJneHNVKZZk4AyNvQI2WnRzL44mfef6dEb+oNmX2ltlamq+7Kv2v4BXG5E1zQ1EVn5Gr2Zmz0Muq9SUIlmDYJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwKfi9gC/WW0jurRnbnEeeXO5MWTO72lBtXoEtwOnsbQti1MnnX
	gLTLkCmyol8/cOVPWAxO51KnzCN0oGLzZMgacjFG9QYVKBgj9ROGGftF/3h7Z+auxGA=
X-Gm-Gg: AR+sD12c0UD+rFhR7yrGdzMLf6LXE9JWmln6zvFVfObqXtHjmwq70ZaOfebjaX6l3Ul
	0EDlIrXsrPA277ReLU+No/61NF9Se+48RcDd93Lc++n+5dLNmKAdUZ686XXnS6fLOa/NBX/3d8n
	lhZIibCBq+l4oqDYwLbdZ2a9cN2FQGkZFH4EEZ9hlyKA3jGTCz2hdFb/QmoceVoIVeCZkYYV210
	irUoTfCArpFXdwCuYmK/5po9QBF2mgZwYBVdfpnwRniTWTgdzeIxuG5VdKFzgUq+kfpDKH+OrIy
	F9VERnQlZnT49jNdk6Wx5GKkU49vxP1f618nbdcF3TMWCP4/M5dX8A6wTWQS5+VFKDmplk25q36
	EUH+E8VLzk1ubr7do7vJhv7A4qvp44eixR8fIOZ2Kb8NvB9x1XiyMUABmpl0Fk16IAE3xR7Ru4w
	M2LFF2Yu9mZoQBGYtQ1sIn3hPvDUXSW4q/Zw==
X-Received: by 2002:a05:600c:1d0a:b0:495:7838:7e25 with SMTP id 5b1f17b1804b1-496c642c881mr18935325e9.15.1785231118874;
        Tue, 28 Jul 2026 02:31:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm62389384f8f.1.2026.07.28.02.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:31:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] arm64: defconfig: Enable drivers for the Ayaneo Pocket
 S2
Date: Tue, 28 Jul 2026 11:31:55 +0200
Message-Id: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAt3aGoC/yXNQQ7CIBBA0as0s3YSSiygVzFdIB3qaISGQaNpe
 ndRl2/z/wpChUng2K1Q6MnCOTX0uw7CxaeZkKdm0EobZbXDmhcOKHdnBoX+7RNlXHK4UUXROFE
 MOUWeBW1U1gyHvTOxh5ZbCkV+/Van8W95nK8U6rcP2/YBdazrQIwAAAA=
X-Change-ID: 20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-7f07659486f1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=787;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=thP/GwB4GLCCXTXiIlgnJ68amkbzT1D925DfODkrm2w=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaHcMvmTlTF00t6xn6JmmL4J0JWAfT8Mc+AvjDgD8
 DxwSIayJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamh3DAAKCRB33NvayMhJ0SEZEA
 CtENtR//eZGAcMjDmMkbG0XBDwq76s5PEOacmTiz1Us9425b1MUfpvJ2EQi9TEdrqBFvjKO1/Jim+n
 7iNUlNXvZBso4ox/xPCuLFiinaLvBJZijNIvNufCU/jHxkFECENvHtbeNTwO+ORwyRy5iEbKjtSjPh
 whWWctxIfYZgmzqQPpTWxI2BAw0ZjNTTsH9eFpX0AmshtzZT2/jsaWj2YBH3BdOJVxE1SVjif4BGyt
 UZDu4cLCqCgNsCH+xYFKrgoaFgSGz0m7zF3f3yOhJ7JhSvhGlvXdkaibEBw7ymjJi7qWMOdJyIGcD7
 i6/FzV3YUiZiKuVCw+AFmF+iMlcj3RamBDDfVmZbuXPhrhYTv8Lkcr4V6d0EfkS6Gi/lb9bfvjGQlC
 tYeQlRDGLcuFswrphYld600eNphsdIxEQvgxttvSxg8rL2bbJUZKxRVwDQb8fhdCADvBtJlTkllSt9
 53CZwmoOEni/Kya+EBsZy3qlcbwDFDbMQ3VZgMppRgbF9snLmd0bWYUB0iqwakFkCRBW+smQYrY+cS
 5V3N7hrtso8QFBPouNKWVi1dxF+E/o8xPWF2/OuMHq99sFsQRIogDKhx26YdIInv1b3ZmsHKhpC1+S
 wV3IoDm6xnKtG7DfJNhtqZeVMrfDTDezghUBsjZHco/WXqghnY1WurhCkkrw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_023202_115335_ECB2688F 
X-CRM114-Status: UNSURE (   8.96  )
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

Enable the missing drivers for the Ayaneo Pocket S2 to allow
full support of the Gaming device with defconfig.

The missing configs enables the drivers for the Display
regulator, backlight and DSI panel.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      arm64: defconfig: enable the SGM3804 regulator driver as module
      arm64: defconfig: enable the SY7758 backlight driver as module
      arm64: defconfig: enable the Renesas 63419 panel driver as module

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-7f07659486f1

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


