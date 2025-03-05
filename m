Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C69C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 21:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dx/4ooZvaFT+M8KdTIK1XiMnsARRScY2O0ollC2/tl4=; b=VQemAMn5KiaFfA
	uHoIx7deCaFP8/dyFmVH0ZxuCio5UHx7nq/FzI+OJA9tWIuWYhsGPRv2u3OMylFBJc9uBRe/pKV4E
	Wwzyr2ElMSf9Dn5/oOKG0y6vP632tzwNzTLs5H0bcfKTVHCQLk8t2TsBQcCEAIz96kRepS/4KVxB6
	zgtKyKpyNhQUr49rtGz+UWXYHJWJRN/7szkQYpBoMwNfYP4lEgKgtn6ltsFnJ4sWGxDOJ9gPfSdZZ
	CoGE4UqZyDBLTmB9KypuROTD7q4E46Fh40SVa7fLFeBekwDvU7iHs5SG/eKKCjqqRW/4ibR0QQo+G
	5/Z7ICnzUkgZXMxRpCAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwav-00000009P8t-2hEp;
	Wed, 05 Mar 2025 21:48:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwVh-00000009OAq-2bSR
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 21:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=dx/4ooZvaFT+M8KdTIK1XiMnsARRScY2O0ollC2/tl4=; b=bYE3F6LslV/LxSbMEB6CUu7GlR
	N4nWv7mZfshMqWg2NdhNgpt90UiYKqU7+WUwt0oavp5pzMph7/vYQREHOVQtXtD06kfp070sQrgsY
	i6nkOyi3gRFUwIri1MTAviaNjBoHqcu0zJLOOhOny75l3kNOiI+YYHZ1Uvke4N9dooLpQ1RBYzAWR
	40Mv52tSQveLWVOesGOIKDHihSxRxKnnyhi7/5mJr/8dn1DgwQrrh/D+AJNNMyvk2Ee+rW/ntNK0Z
	iBzA8nRSSKRRz+C5ES3DoJfMt5oAU4r3AvMTaH+JbYMDXm1VrCYpXch/PhmUMu0ClwSlbr2DjlihZ
	soVTRRMw==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwVb-00000000lfO-3coi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:42:35 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43bc21f831bso3950305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 13:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741210949; x=1741815749; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dx/4ooZvaFT+M8KdTIK1XiMnsARRScY2O0ollC2/tl4=;
        b=zmToA5S/n/xCEEIO6eC8e2gLNhT5EWFaW88zhl7g7/qd5sCt4N9HOcPMSwPcPHh4JB
         LN9oqBxoZE7Z8g34szOTOS9W3FJgnWX7wKpjC+Ml4Aw1ymYwoczJrGGStYw6wZCkiVhc
         DigrQxXcOC7xJm0gsL+91H0Q/kQ+hO4ye9c/yKzuMhI3Y8uzQeYVydZEofExK0Z7DTPy
         U5xFRbQ3jrpED7Hn9mCwayG9xzVuO5G5td1Q6Kwg2wRy6zCcPPuyKG0Wyrs9Wo9Yl2XK
         5sDGCTKuNvoHh+B6eeYYzA/11l9REGJZtOvnQ4hSmcEDQZCmaLFauKK6Rj+GKnQ02gHv
         8gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741210949; x=1741815749;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dx/4ooZvaFT+M8KdTIK1XiMnsARRScY2O0ollC2/tl4=;
        b=rZLkYdwJzUbtaLF+RremUiwEXlLjQeNZRWE5HnBENCQ8i1m8M+ht9TvOvKFkFHPz5m
         n7IhFiV9nU7KfSmC00tMwii6schrLikHRJ/bJFVvTIhJeFXG/W9ITsVeRzqgKr3++TdV
         GSdWLz9hKDp1vvGTqoYLrjUPugCxwK9Y8d/Q1vExuqZ+VFY4L3f6oTMqZXHGpJOF9Id3
         DM1pwKxUVuQ43klUWQ9ECYneVcuNMhk7iD2oYUrn1vZ6mdoChawNicID4U/wqRF1y+rs
         BjdtCr/w/IRF3fQBLys1xnrFORgovVzAGO2RnPNwWbQ0tCNitnyp8q7rHmIvskJlPgdA
         463g==
X-Forwarded-Encrypted: i=1; AJvYcCUbHqc0cq1DKL/itkPs2yu2irmwSAWbAepYSmNoVzOIMoK0RMHZcXXFJ8oELM+Por60zD9P+DiuuDuY94pydKp6@lists.infradead.org
X-Gm-Message-State: AOJu0YyL2ngo0z2ubFUSTuwY4wu8y+dJOheSjo9AKyghY46P7o3fE59U
	1EM7jj30rU2MfZpGFCukdxR9UptF1FfPQf4qqPNzAc0LN8pvYRQDaICphAcNfA8=
X-Gm-Gg: ASbGncuYcAVUIDl0RwounrRlytdpPee16X62QH/mdq9eR2gnNwhjqFayaL1avTeiKj6
	J/K/gLwLB6l9QGgmbxowbxgavvXKjVbHmBWW9PD6MPnmVgRZL4pNCBYrEdMyAIPi/Gh/bYhfQMQ
	MwtdmTUBRux6TAbLJn2FlQTUMTRirz5z0/+lKyji1XkTrkOhbfs8/m/riWElMYF0tzTZvQ/IWqY
	4Wykt2P9FhhRb9uoOg97D+UWqacjgPSAwLkr5/DLuO9AO3JfVDQ87BmsoJgSzw8LV8qjnzEs2U4
	ov1AEvLh+rPaqSG2FG+h5IgVkA5gHqc+hCfHDPAni2Ujm216tObxbZRCRCgu
X-Google-Smtp-Source: AGHT+IFREm+ICSfjlEdNUiEPLWcefl3c9UzEK32TYGiThbSwcX7n6Z6/6dtE6UPv+HGxobHUcMeeDw==
X-Received: by 2002:a05:600c:3b03:b0:43b:c0fa:f9bf with SMTP id 5b1f17b1804b1-43bd29d536amr13669625e9.3.1741210949411;
        Wed, 05 Mar 2025 13:42:29 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd42c60c0sm29215565e9.22.2025.03.05.13.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:42:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/12] clk: samsung: Use platform_driver_probe() to avoid
 __refdata
Date: Wed, 05 Mar 2025 22:42:01 +0100
Message-Id: <20250305-clk-samsung-ref-init-data-v1-0-cd144b4fe31f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACrFyGcC/x2MQQqDMBAAvxL23IV0q4L9ivSQJpu4aFPJWilI/
 t7Q4zDMnKBchBXu5oTCh6i8c4PrxYCfXU6MEhoDWertzfbo1wXVvfSTExaOKFl2DG53ODzJB+q
 os2OE1m9Ny/f/nh61/gAXaDbdawAAAA==
X-Change-ID: 20250305-clk-samsung-ref-init-data-6b2cd242409f
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2492;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=k2uk7mWRxQ/F2xpJkIMGDONFAxPuJRwjbtFcXicz32s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMU46xTOaW9Mx5SvsNf8OBwaIINAwGWUnN5Al
 LJJACRkiHyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFOAAKCRDBN2bmhouD
 1yQFD/wPvK/fXWfnFoQ5KzU0ZRW05q3ts2QXZIiTdKGXLc3CKntkVUH3UZpKlMaQLC5RriiVn8U
 sfrQPgin+l0ndNTJJLVgmCKzVjM3wHc5ILrf3lcDhQ0iA+89THZ3YErFGdM5YU4XRZswaGU8rnb
 W+Jtd8Snv7xPCokt66TzH9oUWuenh3INTE9FA9xDwNNhHsWjBpHgbHD4JGcXut2pIEkbwuZcDZq
 jf+maGEGE4nDmySK+XWFMp3oGrj3ebi1Yl/AKluuB30J9azwIfRQ9ghr7S/T9deCb2UHtwljOzf
 NzPdDZZc9VDcltu2AY/UqPqIskoeWjY82WaFG8QZ1StijOsH+JjWrYviMTfJoMBGkFAFLfNJJAr
 Is6EVr1xdlnZNHCPTJvuAtFz4FUgI31tlqeiHZgRKxlSF63ptFi5DDXXr3oaSTg48m1EH7TQMyQ
 8TM3ShIGMBBY1XOxJ2v+dv7bSqgID+TIkGRO4ijaG7QpHwIlclk7zQzzVScV8bZZBaxOQtYyrLJ
 xbpawe4TKVQWBI/Qbe7cQeFXhN2y1YjyJPQebLLj1W0D3R65SBCxyb9rvd6VFQUqrDOyThS8DoW
 UiN9gj8yNwhyDb/Vn3mkmtAKa3+TamDjU9+NiEw1n8/+2b2Iepw2qpEeAsT0jWBySIzk2r+4xLp
 cJsLzmI9I1xXJJw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_214233_125668_FC191BDB 
X-CRM114-Status: UNSURE (   8.98  )
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

RFT/RFC because testing needed. I tried to do the same on exynos5-subcmu
and it caused weird oopses which even KASAN did not narrow. Probably
because of multiple exynos5-subcmu devices?

Switch registering platform driver to platform_driver_probe(), so the
'struct platform_driver' can be properly discarded after init and there
won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.

The change requires using subsys_initcall instead of core_initcall,
because no device drivers would bound in the latter, as required by
platform_driver_probe().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (12):
      clk: samsung: exynos2200: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos4412-isp: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos5433: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos7870: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos7885: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos850: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos8895: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos990: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynosautov9: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynosautov920: Use platform_driver_probe() to avoid __refdata
      clk: samsung: fsd: Use platform_driver_probe() to avoid __refdata
      clk: samsung: gs101: Use platform_driver_probe() to avoid __refdata

 drivers/clk/samsung/clk-exynos2200.c     | 7 +++----
 drivers/clk/samsung/clk-exynos4412-isp.c | 7 +++----
 drivers/clk/samsung/clk-exynos5433.c     | 7 +++----
 drivers/clk/samsung/clk-exynos7870.c     | 7 +++----
 drivers/clk/samsung/clk-exynos7885.c     | 7 +++----
 drivers/clk/samsung/clk-exynos850.c      | 7 +++----
 drivers/clk/samsung/clk-exynos8895.c     | 7 +++----
 drivers/clk/samsung/clk-exynos990.c      | 7 +++----
 drivers/clk/samsung/clk-exynosautov9.c   | 5 ++---
 drivers/clk/samsung/clk-exynosautov920.c | 7 +++----
 drivers/clk/samsung/clk-fsd.c            | 7 +++----
 drivers/clk/samsung/clk-gs101.c          | 7 +++----
 12 files changed, 35 insertions(+), 47 deletions(-)
---
base-commit: 7ec162622e66a4ff886f8f28712ea1b13069e1aa
change-id: 20250305-clk-samsung-ref-init-data-6b2cd242409f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


