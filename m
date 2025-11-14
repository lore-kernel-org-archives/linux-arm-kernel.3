Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B15CE7AF8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 12:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeGMZbH/yuJRS9B5j3gudhE5eHF+WzcKbi9Poy6lx1E=; b=eAz9StEvhNCc+PcCm0BRautxzb
	kJXjQG6P01oghutGL2vZ0sKdkiC19+ylDV1yFceAaqDibUcAAOSVmTc3ScVMcOuaeXojday3noxp8
	QEX6jVowcbaNZ4M90Wxrv/ZW4GO3HEBH3e+GiX/zog4UsZBuGxkfe+i+fBNCHQgkayxVo2BfpV2tL
	r7tKk7d0vEURSdCS3VMTivm0kFzdTOrqMbqq0X7sxZMDX+FAaiwhnmnyx+UOiwve4WNnqMqdv0+lv
	ZrF2Gf9cWNpSxBN+NWulV8htYsof1gB2zeDIRTCUUOamKCBflzJVNEDu52UHezXZoluRxm0qMR/vM
	3fNBNA/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsTp-0000000C9xX-2uj7;
	Fri, 14 Nov 2025 12:00:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsTn-0000000C9wa-1y1O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 12:00:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so21302255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 04:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763121637; x=1763726437; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeGMZbH/yuJRS9B5j3gudhE5eHF+WzcKbi9Poy6lx1E=;
        b=sVnFPkfswTdOwPpD5Dv1WkdceKm3qGlrNuQkM6Oz5zktRTVZlyalTa5zpjQg7Sz820
         RuJQvNRGR3Z91nqJ61JWpuuCd92QkYnHxHqUidan9AIsWVBq4WqFxjv4rI1fGUu1bcS5
         4u5R+tuiiODFy9afY8MIOvOic+bkuC4J61xLgfupyHsLHvNdoSM0fPvLoYN6lOIMur+f
         XwBo9eFu4lAEwtTxas1PEADgCAhKUsZSie6If0SElDv6OfY/dGfqV6StrIYKfSRPbHS9
         Vnbe9l3p/QLA42hhRhmIZj9XLxB/0TERxW0W9Ms6tEIPj9+VRQn+QTwOYqURZgjsaJmv
         u2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763121637; x=1763726437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oeGMZbH/yuJRS9B5j3gudhE5eHF+WzcKbi9Poy6lx1E=;
        b=SLw54+YZwQHYVRONK5DXD7tYMBC5FY1EH5XR0aBV+ZmD1/x6loGtap6y1RWJvbIdZI
         m7472qZ+55DLqGDp3t+Si+t1xnxNpdS11sHOA31bMNe54Bu+HGH9whIge5SxF95VXOna
         Kj4Qmssz8AU/2UDYwCdVwfyXPvRTw8zG6myGYfV+Po5LBf5eGAWVpxvlcj6f2yqKvCDH
         mMnOj4DI+niqtHSow5dlqqMNxjR6bykZYY+5ERFrw7Jgh7pSSg5UnrpMRHJdtE2ZLwku
         aXrJV+NUN9BSzcgsdpdF5+eBQ1x3DKq/n0Kv8ejSjudNvjH2Yw1VgkVF9G+4nZ7HQT33
         LXhQ==
X-Gm-Message-State: AOJu0YxJfGjhY1lXkZupYrbMf02F0dNh6AhheHm+DlR6e4FN4M7pQXr+
	5Wf8Bgniq8SNq7V0Ef3Q8YtO5RnV625UpOcFqGxYoO/4XLGApaiF2zcBksqKTMpLFC4=
X-Gm-Gg: ASbGnctr2bor29gx9WqFQGbQdbb0sLR4q9eQcesaKXvRC3RPVg/2XRx7Lf2dhmaB7xS
	FS+BuMPZ9IpOWpxeydGu8NBYD0D9A7ive6ovJA8LwesMufAeEH+LFv/aTmlKPfKKKiGrkas+4NV
	GUzNjA/wGvB+Xa6hNts07E/KLm50G8jCADx5xElOpvALWXcxmv/EubBQ9SEW/ybd6y1ooR1MHr6
	gZUDnjyR9jsen5HMlTLcOp0tzmfHgXI/pUy1EjbbtCHnhIIOhnn5aEEyzgFIZXwlFG6l7ifByJg
	rci+HrJ67O7YN9fIpB5XAWO7vxLbuChzJOLtgL3rwd6cDw2mNtf/gxf8t3t2f5oC6bFwPo9XxxG
	ufZx3biuCKf1QeSIXoJjt9QHayb5EBHmSJVT3+Co/5+gu4iyvQei7GpTPZ00F8gh7L93MX4kCuY
	omwOIF5oJHlbdJgDNDzugVKwfyczD3hXxeAAhWZk3O
X-Google-Smtp-Source: AGHT+IEztOiRpEt8WUe38io4Rq4V3TPo5iuLJqFfsDHDoi0i3ebJPfWcuKcGzYpn53XxYHF5bQAiog==
X-Received: by 2002:a05:6000:228a:b0:42b:36f4:cd24 with SMTP id ffacd0b85a97d-42b593495bemr2671290f8f.24.1763121636785;
        Fri, 14 Nov 2025 04:00:36 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae5bsm9487578f8f.8.2025.11.14.04.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 04:00:36 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Nov 2025 12:00:16 +0000
Subject: [PATCH v2 1/2] dt-bindings: soc: samsung: exynos-pmu: remove
 syscon for google,gs101-pmu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-remove-pmu-syscon-compat-v2-1-9496e8c496c7@linaro.org>
References: <20251114-remove-pmu-syscon-compat-v2-0-9496e8c496c7@linaro.org>
In-Reply-To: <20251114-remove-pmu-syscon-compat-v2-0-9496e8c496c7@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, willmcvicker@google.com, dan.carpenter@linaro.org, 
 arnd@arndb.de, robh@kernel.org, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=61olMKxaKsnKoXwZ6EUyBzqRnKHfTUWzltdyLqRoYlo=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFxnhY18qA9fN+bzswZTOhmCb/8dkhaKP8HNV5
 YnhjB6HhWGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRcZ4QAKCRDO6LjWAjRy
 uhhkD/9CwFscXzPW9AOUDeBbnI8PcjSa9eHy2Jmuw48KyfYzI6SU7GywBCzpYaQ530W4jqpt/Xn
 g/dqQdPVleWELDvJ31V1Koj2lataLeuj3zVVca4r1uB2kOgJCIvdnwPE77PQGfSO/1FqCU4HG6e
 A0vWvduDTyu851SEHjWyqaAMYLY1T40wXbaWstxBFqJDniAUVNfJqRESLUpnl150DL7BQUMJhJe
 VAtXeUxaCNSPvCCCIlpa8OKNEYxnnwrSpcB2EsBldf9r1rJXAZ5ZbsKOnP7qWMq9YcUHN4xCx8M
 +PSqHvfwwdInx8fdMed1mS4DIs9ZsCp7jEBFrkJgF4dkatTMhPrr/gQzgavwViyJmAGS+gu4eOD
 fG5kdlRbUqVP+OJ+X2Nf6aLdx0L4yo0zqD13Vph112sZQzaLEWE2RFcHWxzf3yFKI9/UKrQ3SCR
 orNcLtPeP1Vc4feiCVIb5tUy5UEk/UmZTIvU9Jc3/EmpRpjDwngFvrEGEpj4C7qLra5g8UmnHrB
 +w+RQmfDjfnEx0Jt5Vhb5+loXod+0lCp/GsFsK9niXMOd2qy+ygAeGHnq2pCUl2viVPNPPkOyGk
 /SVRGs9OGsCrN4RBHe4Fi6hRuTzQ2ONTtW3fSs+tkRfAp3DSgUKfYoixZwVP+o81/KtYoSlEAia
 aK1EeK8P/19JmfA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_040039_545440_B0EC03F0 
X-CRM114-Status: GOOD (  12.06  )
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

Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
"syscon" compatible") it is possible to register a regmap without the
syscon compatible in the node.

Update the bindings for google,gs101-pmu so that the syscon compatible is
no longer required. As it isn't really correct to claim we are compatible
with syscon (as a mmio regmap created by syscon will not work on gs101).

Additionally (with the benefit of hindsight) PMU register writes were never
working with a MMIO syscon on gs101, so the ABI break is justified.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
 - Update commit description (Krzysztof)
 - Change Items to enum, remove const (Krzysztof)
 - Checkpatch warning commit msg length (Krzysztof)
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index be1441193feeea1c12d0d5370168e9316c8dcf76..84821c38d28d0be6d44fca06bfd63bffc12a8656 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -34,9 +34,10 @@ select:
 properties:
   compatible:
     oneOf:
+      - enum:
+          - google,gs101-pmu
       - items:
           - enum:
-              - google,gs101-pmu
               - samsung,exynos3250-pmu
               - samsung,exynos4210-pmu
               - samsung,exynos4212-pmu

-- 
2.52.0.rc1.455.g30608eb744-goog


