Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E968BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TUxR/r796SUvbiyGa1bSMGrrDRqX6TeysLJjNijsVtQ=; b=K0MseGzEyBAhejqJMMv7c1GOTL
	s2vEKUFjmayWgIEUO+5IiaQ4jKfkDe7iW5Sx2xR7a3PXzPvH6quCy2q/4DyHVUhcidEOPXJvg/C70
	kyW8C2DJ9AyGgK0sd22qtEqRlGS7TRKt6stZ+YzS5itf2+fGuHT22o/7LZfwBx4GETPJ1b0M9d0it
	Cp/s7vWygGiMRL33SiiQWgniN4PgvjsA6HqnEhH4V2hNGV3matCDEmIxF/4YGv7VGzvMK65TImC8d
	3JXtqJpl2G8fhgw1R3ScPn/up51n1YhM1QtO/mD4IgZwmcYHGG9hiaL9rpU3U7TPMqMJEiLaXc9HC
	+k1wLxsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrRO-0000000GeWt-3bQa;
	Tue, 25 Feb 2025 09:41:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqxF-0000000GWdx-3Mhu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:10:18 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso30571635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474615; x=1741079415; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TUxR/r796SUvbiyGa1bSMGrrDRqX6TeysLJjNijsVtQ=;
        b=ldkvD1rekrlyxwh4J9FRIglZSTGhc+nVmQEumLb0Rir1TYD9KcDKQ/shQpim2D/qZl
         F74EIjnn4k+TK9X3kc7pW4XceoFZ66Vu2tk8n7OSIuoVowNPJgwprd258fjuvkd7CdkS
         5GYGzUAAjLqtEPvZydG/ZaRlX+nJ7Pb/54EGBm2un9YbbkT65u6ld3nuvqZBbJFUYP1F
         7UJ8igCX6U/jWqduZ+hnUfnw1NlrjakI37cGVU4eDm/YNdl46MPueEsSfrkumcU6F92w
         WJyPiYpH8qsHEKdvXO/bCee0WyZRYWE7cgU0zakjz1z3HhpgIqSZH+C05OvEn42moWqW
         8dmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474615; x=1741079415;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUxR/r796SUvbiyGa1bSMGrrDRqX6TeysLJjNijsVtQ=;
        b=FMQkkJlnGYyTXm6o2DfBkdXWaE2WEwRmvhbEGZ2e0jcJ4FPloMUCNt0B5EbKYQO4/s
         Rxa4W5ZnyVLuYcUrK6q4JLKf7SwM7+xicRQPuCqZ1ROovA4qSb8KXuZmlXbU6XMbIBII
         p5qNF+VpYktw0bTNro9BFX1Hza0ijt+XPxfXrZO3KEpPK6wh/tGpuOEVdbHAhx3yktZg
         hc6cxXHosG882Wwk7sGfaWJifghSYnusY7oaAZ3W6fosJ1zwrHu/e4hqdoQW5extVT4f
         /r+SRRyF27PUxHsjBtNwzbETaPzmPlgcn1IdpVvAQ6Kk5VYeirKv735rvWGmoPqhBTdK
         CDBw==
X-Gm-Message-State: AOJu0YyvNlzot1xs2bqD4suLnTiXBy2yAydgvXWIFewEkpm7M6OoQHsA
	OtayP5Q8us8T7EMLbEWbMcEfWPXGgcuHxpb76F3B+pj414sbTBX4K69AfQK48Nw=
X-Gm-Gg: ASbGncvrj7nwYHSHl60UK9tu9bOmPfOFzXz5RZah2uRmpbeKAjeOgzwLUEaUEc6VTHg
	Eiu3UJM+cbxy9lW/QxrRMVJvE49i0xmbQx2IQxxC4D2ioHEOnCb1Xv/PSj56u0YdusuDUW47Lgz
	uJwsYXSPLvNxWa7Tjvoqmb1mkXUM8gRteEeJ76xulqxdMLV875qz9xA/vwK6+ooNvIiYXYkdK+f
	qytjyIPfPQpQR0Ny0774SniZFYVv2vVRXbsCJF24/xAcy++v98FJKYLSi3ghJpxTmmRgYFLLqVr
	PABaoWqA3avdQDSv5E2iNq2kuZv0vLrecf1/3ZYQbwx7pR4=
X-Google-Smtp-Source: AGHT+IGM+4Pzn8UsD55Fq+BjehI/DdVlvQlr7slmeNsQ8GYd6WBYlQHEqixk7pmsC1Arj8pkbnBpSw==
X-Received: by 2002:a05:600c:19ce:b0:439:a1c7:7b2d with SMTP id 5b1f17b1804b1-439aeae05fbmr136888695e9.4.1740474615544;
        Tue, 25 Feb 2025 01:10:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab155eb6csm18607295e9.31.2025.02.25.01.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:10:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 25 Feb 2025 10:10:11 +0100
Subject: [PATCH] arm64: defconfig: enable Qualcomm IRIS & VIDEOCC_8550 as
 module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-topic-sm8x50-upstream-iris-defconfig-v1-1-8a17e2e193d9@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPOIvWcC/x3NwQqDMAyA4VeRnBeowXZjrzJ20Jq6HGxL4oYgv
 rtlx+/y/wcYq7DBsztA+ScmJTf0tw7iZ8wLo8zNQI68I/K4lSoRbX3s3uG32qY8rigqhjOnWHK
 SBScfQqB+uE/koKWqcpL9v3m9z/MC7gDxg3YAAAA=
X-Change-ID: 20250225-topic-sm8x50-upstream-iris-defconfig-b56662147b20
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qPEwhMwk/tYnbquObvTItoCl+kpW9Zcq0Aog5uMEEb4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnvYj2GCmWlPYu4JSBRgvuRiD/l1jBpwcTsfFzEl/C
 Yo+1timJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ72I9gAKCRB33NvayMhJ0derEA
 DOKWr0KWRMUHmWtYFdAjMujKU5JSKy02jE5Ubb+oaMWYNYvWIaKmTQ0JA5U4T4MYztlFXZwNm4Io/U
 4AxbwjBPqtBrjlbDs3DNfd6zbGwRGl3YKKcO5zx0Sla6Av6cuiKPkynEExpBgqQ5weoZQ3rEEMwFry
 uVx23esy8xbDwSYZcVEEqq8gV/H6Z14rMISx1upHJyOlXs4lZStzoIh/1uBKTXfHKiuKE4aLvjVohW
 T2sV9U8PtVRqEtl/iDHGqAzJgVlzn82LFQai55VPvVGsTqJsawzvSG3HXGeQywlr0rUpVHC13/pIjB
 LUc6N0Qz8WxfXJrdP96+lFGpZSZed6VGFhGaEwpPk2Ig0YhRO0oeWnHviJR0vXsqWHOZLVWM7ODQlt
 ei6aYotNxAGFHAaFMzE6YQjsiLUq3Utpj54MBymbf/X6yE47/qngtXcannpVngLmOl2rHAZcGJ/24e
 Za3WhKsBsSuE0qquZztGLmTLxB7IN5912qUawvgpTn2R96JNGhvdSPGHYyEwwvzhCQf/JXHy9vhrXC
 UQYH9Q99Mp5BvRPNf0higDzVfj72OgXjAZAGX6W/+AqNu7ajZ1bnYUwKMcxp1AVUzoz0iZ5dQh8fmi
 mrWvcyDMow9bV+OBd57+WDpI1sGvPbIGj26AUZgzp/hjBZoYh9uG5J2dFtFg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_011017_863498_8DB4A7C0 
X-CRM114-Status: UNSURE (   9.07  )
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

In order to support the Qualcomm IRIS driver on the Qualcomm SM8550
platform, enable the IRIS and the VIDEOCC_8550 dependency as modules.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a1cc3814b09b31ee659536a64b7db704153d6fe9..710452f75133896af2e3a19ae544f139e1c28a98 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -847,6 +847,7 @@ CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
 CONFIG_VIDEO_QCOM_VENUS=m
+CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_RCAR_ISP=m
 CONFIG_VIDEO_RCAR_CSI2=m
 CONFIG_VIDEO_RCAR_VIN=m
@@ -1395,6 +1396,7 @@ CONFIG_SM_TCSRCC_8650=y
 CONFIG_SM_TCSRCC_8750=m
 CONFIG_SA_VIDEOCC_8775P=m
 CONFIG_SM_VIDEOCC_8250=y
+CONFIG_SM_VIDEOCC_8550=m
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y

---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20250225-topic-sm8x50-upstream-iris-defconfig-b56662147b20

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


