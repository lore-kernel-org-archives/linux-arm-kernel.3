Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F07D38FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLfTQh/qlV++IGofMzGCRcDA4hRAyZAGlY1gT7J+2+A=; b=UUIsNXB9IFsoNdYRz3bOLRdLvI
	OCCpbfSNWnO4axKfsVArDvBOT9/MMxIDezQ3ka7ZzqGj3NfHWI7Wtaxw7T7e7DdF+IeUiDnKnPTXu
	RAPxcO4TbmnzWruQqLfrciI0yYBfyNrhJzMZ6d//f65OftpB8t469iq0OdfViUPqknU+C9c+gCDLY
	qGSibN0JJM6uJh4NHrrB8iZ4HBGO7X20o4gvtEA6z03pkQechkn5yt9zi1TI1PL59uEiHQeATGn2j
	/5JlLMgo2FYSw1TjZp0z7O75GeCidyxp3lfvyLMa0hv4QRY4kW+l00ruFKjApUIhaNxvl7G+BYXNG
	SIvnxIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4NA-0000000A3Wf-3T8x;
	Wed, 14 Jan 2026 17:09:35 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4N3-0000000A3OQ-1qwb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:09:28 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so431895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 09:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768410564; x=1769015364; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLfTQh/qlV++IGofMzGCRcDA4hRAyZAGlY1gT7J+2+A=;
        b=pXnm3w58cqgchMqi7zUSeX/vsjcOQhiM1eitW9+loM3iatwVzGGZHL0bXg6LAirXGp
         Xnbyih+djW2EKdFw7TiBz9hU3jUuSIVDwcR/UTSXOQN3anu0SUrN161rV3HBo86h9hKk
         6eeSJxwt4oLBcPTSNi0NbTZs56+wdtPpBfpJUqYNAqSf+x07FE49NxTAyUrhf9dPkaZM
         FWZiKSOSKkxas8++brXfLi887HhrQb8jX5GOHB0xrY+T/S55ojU/+39lyt0WYlw0jO6T
         Gg7SgNwvp62565DKbdBDYvRdmiQmBxOPFVWzPqeavZEl+8ZBxpFuN3SOMd0O4FiVKd0n
         trGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410564; x=1769015364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cLfTQh/qlV++IGofMzGCRcDA4hRAyZAGlY1gT7J+2+A=;
        b=T43sXhKhdXfzSJSLejDoot6zPvXFQHpYEfBgfVitabQW+cO2athCvunLRo0zpoBIjx
         7GCE599YUzZMke3JBYNS0Ad+hYb8OY5vt02q9bNAhNAi/3BiGtI73zOu0niSMyH/BP7w
         uHTEPwTiHLidauq2N7g3M7Oz1DCZEidVTQEba6Ijytwsc1N6VqCwVLEdWGG1Tq3R+yeg
         I81CGF/QlwZBB8rOmQihZKVi02tTRjBZjF7NO82jS80lcDJ9iaHSbNL9adleJI4nHtP5
         l/6J425cMI0MSfd9msl46SKBl63ZYmPdCiYVwcQJlKsQr1FZCLdl71qkbDBDw15SC/V5
         BJ+Q==
X-Gm-Message-State: AOJu0YwTlX7NjBUtzczAIcjWiGHctBfgY34MuWgKv5FwaJR4eeLIH5lk
	ok3ch4YPwq+JsB0BME9XjyyOUjZHGEACWgNJweAKj1tkeT3dqF/JXfIA6bGrHB9Xr9gkhaA2wiL
	0T9Ms2DY=
X-Gm-Gg: AY/fxX7lCyMYC6USxLIo0Xmo/Eqgm73JwgZAP+fZy7yT+xMuG7kDovPMIXH01tvczTz
	Dmx0FCjxjMnqNwF9Wr10vbZpu2yvVpe4bqdKWVbOWIOd5RPyk56tERq2kYv6nc6ltPY3gHLycgO
	jF4LV8QWwm/tf7YKmT7NTkGVCjjFTAxEOnnI57p6Zn5JeBMFVb9NglwYjx2AIwJHAVJEsnhvyhf
	mXE/1z+5brLDvnQLspMl2ECWtaw1FA6+FDvDTTZrWmgjqxb26D1AzJNj9ORzz0y44sZoJcIcTf2
	uCLtDlz2UuboEiV1SGsc1fHIsePAaesfHOSNaV40HGMoHEqp6SsTXnzsZUMNrdtfoBNEa9bYJvy
	R7lNp6K5LC0SJP2ddXSCwyEgwAGELPib0HKVmFn2OOtQ6xOWWVqhksPGRTY0XxJ15PhlL+dlut+
	25IzXRI9Lmyw==
X-Received: by 2002:a05:600c:46c9:b0:47e:e949:37e8 with SMTP id 5b1f17b1804b1-47ee94939a1mr15738575e9.30.1768410563776;
        Wed, 14 Jan 2026 09:09:23 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d3d1:7ba4:2f56:d18a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47f4289b7aasm1832825e9.2.2026.01.14.09.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:09:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 18:08:50 +0100
Subject: [PATCH 3/6] arm64: dts: amlogic: axg: assign the MMC signal clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-amlogic-mmc-clocks-followup-v1-3-a999fafbe0aa@baylibre.com>
References: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
In-Reply-To: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Yixun Lan <yixun.lan@amlogic.com>, Nan Li <nan.li@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=YGYnp6gzI4AxtwJzZWhrklYj/srysFtYicdu+gMMI1U=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ824JyrNtw2KARGstg1jZ0xJArTDmwFFfnr7t
 CVRKFh50+iJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWfNuAAKCRDm/A8cN/La
 hXXTEACb+KQNPCisYBpunAO5l/fotBt43vzRWz23gV7sxlWMa+DBJHIDjWZB6ih0K84HSdO883X
 LxsDYNKAX2AmAVWFYXwPOWyIX+mz7OOvPZV57g81hn+TaDlOP5qlU+zeJgQHJWqBnEYLdAI0W9M
 Rt1x3bpoWLvdVy5REb5ockyDlIpE0H4NMJIDVlgqBLkTjRjfEab483hgc6Zk9pQjnv1wIRKX1PH
 mGHwxGaqLqW+0zRXGH2KPGho7RTD/Ig3EF1dG6A/5leYDs7DieS5HJP45Po4nLqz5T29mYtTP9n
 oqjjcZt2e1V4F3V8bFJ3ls9XDp236X+mj4Q9Q/L5q6oZVVjoUSsBsSUqIobShK3D6juGfJRFRWp
 5hNOHVns40JmGdbHhoc9cSj7dc6vso7fgaELHTmRlCzg1SeBl8K85obRoO1rZLxPQsp6RGwfb4l
 2f081YUC/EaeSrDpi+p/Uehb4WRahpAJ+y987OPLEYntt1jWuM8yIhh+lzKrJO3oEeT7gQ8ZsxQ
 OwolYrioFxl3n5NNsjC6dahVWsh13Ooc87tfRBnqaWPh3hAoOXGMMUy1Z1TZkJUGggkCjMaTfY9
 lBX9/ieqeLKOkuNu8f1uS5mjMlQnDnBjeglBFeWuWXA/E1liOnIP99+pQteQVAt1tvTCAxQgJYE
 JsN/olrqrO+rPXw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_090925_504214_83D227F9 
X-CRM114-Status: UNSURE (   9.20  )
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

The amlogic MMC driver operate with the assumption that MMC clock
is configured to provide 24MHz. It uses this path for low
rates such as 400kHz.

Assign the clocks to make sure they are properly configured

Fixes: 221cf34bac54 ("ARM64: dts: meson-axg: enable the eMMC controller")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index e95c91894968..cc72491eaf6f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1960,6 +1960,9 @@ sd_emmc_b: mmc@5000 {
 					<&clkc CLKID_FCLK_DIV2>;
 				clock-names = "core", "clkin0", "clkin1";
 				resets = <&reset RESET_SD_EMMC_B>;
+
+				assigned-clocks = <&clkc CLKID_SD_EMMC_B_CLK0>;
+				assigned-clock-rates = <24000000>;
 			};
 
 			sd_emmc_c: mmc@7000 {
@@ -1972,6 +1975,9 @@ sd_emmc_c: mmc@7000 {
 					<&clkc CLKID_FCLK_DIV2>;
 				clock-names = "core", "clkin0", "clkin1";
 				resets = <&reset RESET_SD_EMMC_C>;
+
+				assigned-clocks = <&clkc CLKID_SD_EMMC_C_CLK0>;
+				assigned-clock-rates = <24000000>;
 			};
 
 			nfc: nand-controller@7800 {

-- 
2.47.3


