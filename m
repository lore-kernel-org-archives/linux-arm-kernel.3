Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC145C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kBkIEoZc6BXsEi/Xl/zpbl5kQzqAT2D5l+fVFL9X634=; b=nmxwbcx7ZAl3AWnEsylLv8hXhj
	r0pJ9BJD5G1vI0e1GW5LnCLh3SNKyceHRQU+6jNzChFHTq2Azk9ZSYxfItZ/yHnLeRpB3JP3fsyeX
	cd7oONk/BGm2v/JZCs0kpJxkFYGG4z08p9ZPjnbfOSSD8r3DciF36XTCEuWgRC0pGFWm/KMCVSq9N
	nxFi0ql9cT3tf47xnQM9eNbKJP+YbyDTMe7L/c5AXYI3F3+o7c2S1PAl6xEuqLv0fAtKulUBTyWSr
	jCSKnnkJ9kdDDT9ay1MxTp3IW4kqg6j0ShRLYwWPzxybde2r5byvIc6ZeQu7roX8CLQczPW7GK4pO
	raX9ovgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5bV-00000000rnH-1CUl;
	Mon, 03 Mar 2025 13:13:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5Zu-00000000rV3-49P5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:11:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43690d4605dso27990315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741007485; x=1741612285; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kBkIEoZc6BXsEi/Xl/zpbl5kQzqAT2D5l+fVFL9X634=;
        b=OHrlkDwMttFx05aM+LggimNh2naBFrCzfnl4TP9f0L9bNbwSd9dQapSwigtg1i4KQI
         vbKL7fdusaxX9Vs6bafXzVw74SQ5ODnO8kCIrG1pkzf1Y0WpeeBzWahgavsw2MWO7mgP
         rFF6KcU/pABmdPT5++v/yb8NvZAXdF0zusrnj29RFSINMfMuHItaW3HZHaKIlSevzECh
         XwL8+CNWcUGKIKjDNYMWB1I6oA4RfMnm+EiZC9vTB159626zpvHxDqUuyNRWTzUgHq/w
         TPr9Y4DLiNXgBSwgCf9Rl8J7zPTO7Uga/kCNlewgYk58fN4SBseKGHW1/LHyXFACWUiY
         Y2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007485; x=1741612285;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBkIEoZc6BXsEi/Xl/zpbl5kQzqAT2D5l+fVFL9X634=;
        b=ZF5s2R2gthjhMtAzRha4L5auThoiEQRzHdiH5le1M4vGHXGiJJv4KAYZG0UnJN0ECA
         cUYm9OpGe8KzbfbHhqWh1Ig+iVexpMAMMky1YNEkXend53dr7gLIN7R6HGOQE5wZKvT3
         XNRD+dM9GTAuzQSUDPtDuPsYO18ALCVJJjZtMUPqwUwsdkZ6RVQ+hBJSbLe3o5eB5z2a
         Rp2ZWfF8iPkT2HYXm+I/to8VlftG9jeP4KSj75I8TQLPwpquRVEhhK4OHWL1Nq76uQTJ
         b/Qcz4d5kb9e6IFbnNRv3T3TrUtsm/Fnpj6ajS1V8AiUQbCzveF1eGDGywlw4mZ09yAp
         riwA==
X-Forwarded-Encrypted: i=1; AJvYcCUyrGDDq31JeQw4IGLKdM9iIx5qF046OEEKkXOTyYIsVaE07+eEyWHZ3z61SGa4a7pz8IjTcRS3JZrt94+1iu29@lists.infradead.org
X-Gm-Message-State: AOJu0YziHJg9Yn15h3yJ2cErOERffOC4ZXqB0O5R3Omiwxp+7vgC0dzm
	hd+apmsxlgVFeM/jNUHMKH2KVRlXMXzNtq1ESLPab+gbuMq4JHiWq3z9char9EI=
X-Gm-Gg: ASbGncs1cT4pcu1PZVFpGc7e/14GH7Kuu8yhOspYsibb5kHurPkJtJOuFWsWSV061Nw
	c4lBNfiak2lMjfeu8kw3qxTlfxtrVZo1i/NtjLN+e8lzooK+2QNyAlH5ijOUN5EV7tufKfU6v5I
	Sna5peFizn/uBYJxsBDerFl2eVyDbZtN86kO+Vos2wD7AndgCWLuHAv42GCZ4jRgvuILHsvdO6P
	wyAepGmjz3gZCMOqu39HAmQYL1lebUWY3ROwRu3uEUnPLJ3JbZoX+mZ9VJju+WzHEmSO616cZFs
	pFnrtdHyM93UnvCrFg9yw/JLWMI1YOn1C5UuSo6YZWe2hHSXTe/XTv7fNDtirdCW2oh1aN3HKRE
	=
X-Google-Smtp-Source: AGHT+IFogfy4vTLX2D880m2Emlv1b0QxLptjPdeT4ir4OaH0lDrtdJ8Ijk5zG3y61SkNW3iZImJ9Gw==
X-Received: by 2002:a5d:5f96:0:b0:38d:e3e2:27e5 with SMTP id ffacd0b85a97d-390ec7ca98fmr10768345f8f.5.1741007484699;
        Mon, 03 Mar 2025 05:11:24 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b73703caesm158307785e9.12.2025.03.03.05.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:11:24 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 03 Mar 2025 13:11:21 +0000
Subject: [PATCH] clk: samsung: gs101: fix synchronous external abort in
 samsung_clk_save()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-clk-suspend-fix-v1-1-c2edaf66260f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHiqxWcC/x2MSQqAMAwAvyI5G+iCWvyKeJA2alCqNCiC9O8Wj
 zMw84JQYhLoqxcS3Sx8xAK6rsCvU1wIORQGo0yjrLLo9w3lkpNiwJkfdNo3obXOdGShVGeiov/
 jMOb8AUPfVtthAAAA
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1935;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=r0ACFUP8gmClzRtzoxXd/Ng22ZxFYgefb4nyAq8SEaU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnxap7U2WN1YaRHw7W9uRbiu+2fenuf1A5eZ5Xs
 bFL73mvclGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8WqewAKCRDO6LjWAjRy
 urfgD/9/FuIh/ujTyKiv8Fzda0+kpo71fe+GrwZib/NQ3obhlvSc2WG2XGPhRQqKlMOt+DkEN5R
 pkLY3fshHXDFGhS39zEkhSA7qIaltThWozUvf38use4WQqs4eriaJxl2vWe4+s2/uztjluGDzsO
 3h4ya7IYa8MwskiloUzzctUj72lrg1OatkYUBxed0T8dky1XnyAMxKJhvDO0b7pleAuVzbEaY6J
 HOpd+dJS0SoZXlir3FNdpL1Tj9AO40Bi+GtLOYFu2qoBsIpAvgfZgsWkKgudL4fatx1TyChxbIU
 WciyJusPm8nN9ZhblpHBPvx1TZBYKTqgSJH4l49LreqaSvPkll4IiVBtYdiTii3WKT/VYKpEQLm
 eS1C0DH11KnPbQGXvk9hqQk/Hvnrwy/8H0By6KghKQZ1/KmpHEIEK3SzD9iYzK6ipbaMi53ihFx
 MQ5YkGLXWljT8CAnz8WiWR+kP5Rc0ePEgX1/AH9j28xALgYmvS1oLEefx2divEis2r1ubctopys
 xXiMu4ffHKQX/TM6zqkIFpeoXMvS+S/DjCpYVPeixRCu43QIBUO2/cSWIH8ArxA8OLg3vIZyTEe
 n5W+B9NFHjIOfmXhKKZnbNo61bf2pAIkXP7TZPPB6X2Moqeo50SGuhjSusHrW7SMp9zX4j8mjvL
 eagVef8tl5/9+hg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051127_042668_C99F781A 
X-CRM114-Status: GOOD (  11.40  )
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

EARLY_WAKEUP_SW_TRIG_*_SET and EARLY_WAKEUP_SW_TRIG_*_CLEAR
registers are only writeable. Attempting to read these registers
during samsung_clk_save() causes a synchronous external abort.

Remove these 8 registers from cmu_top_clk_regs[] array so that
system suspend gets further.

Note: the code path can be exercised using the following command:
echo mem > /sys/power/state

Fixes: 2c597bb7d66a ("clk: samsung: clk-gs101: Add cmu_top, cmu_misc and cmu_apm support")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Cc: stable@vger.kernel.org
---
Note: to hit this clock driver issue you also need the CPU hotplug
series otherwise system fails earlier offlining CPUs
Link: https://lore.kernel.org/linux-arm-kernel/20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org/T/
---
 drivers/clk/samsung/clk-gs101.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 86b39edba122..08b867ae3ed9 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -382,17 +382,9 @@ static const unsigned long cmu_top_clk_regs[] __initconst = {
 	EARLY_WAKEUP_DPU_DEST,
 	EARLY_WAKEUP_CSIS_DEST,
 	EARLY_WAKEUP_SW_TRIG_APM,
-	EARLY_WAKEUP_SW_TRIG_APM_SET,
-	EARLY_WAKEUP_SW_TRIG_APM_CLEAR,
 	EARLY_WAKEUP_SW_TRIG_CLUSTER0,
-	EARLY_WAKEUP_SW_TRIG_CLUSTER0_SET,
-	EARLY_WAKEUP_SW_TRIG_CLUSTER0_CLEAR,
 	EARLY_WAKEUP_SW_TRIG_DPU,
-	EARLY_WAKEUP_SW_TRIG_DPU_SET,
-	EARLY_WAKEUP_SW_TRIG_DPU_CLEAR,
 	EARLY_WAKEUP_SW_TRIG_CSIS,
-	EARLY_WAKEUP_SW_TRIG_CSIS_SET,
-	EARLY_WAKEUP_SW_TRIG_CSIS_CLEAR,
 	CLK_CON_MUX_MUX_CLKCMU_BO_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_BUS1_BUS,

---
base-commit: 480112512bd6e770fa1902d01173731d02377705
change-id: 20250303-clk-suspend-fix-81c5d63827e3

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


