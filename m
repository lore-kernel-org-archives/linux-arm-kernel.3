Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E495CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xLGRjFMRFj/0Wr7Pbd6Nha7Fn1G9Rd12lG5MFWvKdFA=; b=kmlLu7rH5bzcMYOmwwG7nXbSa3
	OZsufWjhQkIKJCNKmKLbcYfAfvGYl7sW1zrr4WMVnivGHihR0gWj/hg4j6Ss7gTnGidRG2RI57VTD
	K4CRWDp8Ybh7bioAqYakAe9bZzKzg3pqG7m2NDymOIBV3xhixHMrtuHKs8fKuGfn+3CyXKFHpHdpm
	oA9th77ch0oj/A2/5Alh6aKHQ+1zFzToWif6mB/XIYZhUUbIpQi+MDqGXEBbtmniIgxPqwip+o0rZ
	+dF4X3t4nQl7k6o8M58RSmwBDPda4fYF479aaeXQXf2cAjg/61wRqE2rv3B7faDuC4X4oq+7gZa5J
	+sqHSoyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEEJ-0000000HUwP-2Kxm;
	Tue, 21 Oct 2025 15:24:55 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEEG-0000000HUvx-0pgZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:24:53 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4710ff3ae81so21101775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 08:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761060290; x=1761665090; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xLGRjFMRFj/0Wr7Pbd6Nha7Fn1G9Rd12lG5MFWvKdFA=;
        b=PG7Aq4G4H8/Fwu6p8l0hzlqip5kE5+Mx1DR4gCtjxTBE69MXsJcNH/nMjg/02YcXDs
         k4lQ3A9J5qGcBbCcFkCPWxsVDdpx4NITiCt1L9YOqLVZUv0rxGLc0K57VOSAqy3v+84H
         Mpj/uWXGNbj3hFMIaM3E/EWbi/+nZ2Gt5+B77ytLX2MABL47UnP14bjfwGaA4ib8u60o
         VFtajEVxdQD/D134NdpZOoXF/5kCgugUExb/Z7FzCS/D9tOpYF715eptvkhwK3Exm9we
         gkpT0mVp+758kQk7g5B6rAHEd7Y08ZzLXdSYgA1jd/Hp0AbgrWTGaudgSGKtzG9Ay4T0
         QN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761060290; x=1761665090;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLGRjFMRFj/0Wr7Pbd6Nha7Fn1G9Rd12lG5MFWvKdFA=;
        b=dUCKQDwyMWKqgpJQu7vOd8zTM2LDAdVnqOAjEj8Zh7GAPqm2OEB59QK48fqcIRlonX
         Sw/dIC+jPmQGzODhcCm3hhA+H55gcvZrHua0FmX2ufVJdRQfpwJsAirAoVQk73xrWN4X
         T7e2J7ZMywqdlRfhMn5Kn0KcLESlUwmx9NXjiZOI0wVsWDRKnEZiyBtMAIJdfrI88Vdc
         HBf1DiPnpK2wIkA6pqEftiIPCnNYsJOIZ4l5ex3rehn4d3pPeihT4dLdy7UMSyo+i+mq
         nTaNJoecOECSrS4VGY67PCj4NbUMbRWKiP92tL4/L30n/prYLdXyn2HYI2/V1kbQQqJw
         IsVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJS/sTCMVLRcDRTDzV8rCiq2Rlkq2lgYbT1lp3duQ8ODPlscpVk/O3xuCHltxafIPyXlq2ORNlcXlbqboxaGax@lists.infradead.org
X-Gm-Message-State: AOJu0YzD/QV7M5/2gUpDamPrpQREat5pCzzk8Sahur1/qUXGeFrCArMs
	xR5kCg55cM0I8QHOxtT2ec+GOR8fTvxBTc8HudhTOVBwVIw9U/En+bC5q4CyjaE4/DU=
X-Gm-Gg: ASbGncuUVrXi3xhq+vhUuXlFKW3AxeLKPfee8gfLqaTNiMvJuSeuSSjbkINI1no3fQU
	9WNnsYOBQt8OsZjyc6dSexCq2gs6mkPXBbW4ruI9E37+Wp2WuZH3eE+OEKYY7WYFAmnSrDZJXeN
	qtYUwVju+3P5a8mVbiiKBbgpdoGt/J8+k01aoy+IUIR9dhCuCr+7a4eb4KNGAKylRzXIVcdBg+U
	Y/RcV3BDyoO4soT3x4be47QESmAje1me+Bw0MbnwrdzfVkAhCHFCwR1cbFvavDu9xbWuFmsQ4GC
	F+1j7anEHiScgdLyo7vhLHYClrWgxmA/vt73Dn8cVBenl+szZNmlvKjuA8fCIMaJbpcs4qRWT8g
	YDScbhy2/3g6P/5/gGb3Zbbdieu7c5Sf2IjIGPg5vxEYm0BidtoBl6bAezUhp623PaGardAADEz
	wpziYJwOVWl8r5GCDgOQZsQu/EvlHdmJECLoRtj8kXv4ANL0oBdjYQVT/eTKMens0=
X-Google-Smtp-Source: AGHT+IGeQKcOKpzdCgFr8S2qcXAD3y1kKSzzFmSzcQgg2oWkU9A1Cyk+uTNL56azhWjBHMZtPZpvVw==
X-Received: by 2002:a05:600c:5287:b0:46e:6a6a:5cec with SMTP id 5b1f17b1804b1-47117876738mr151626285e9.2.1761060290113;
        Tue, 21 Oct 2025 08:24:50 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d90bsm201578635e9.2.2025.10.21.08.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 08:24:49 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 21 Oct 2025 15:24:47 +0000
Subject: [PATCH] firmware: exynos-acpm: add empty method to allow compile
 test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-fix-acpm-clk-build-test-v1-1-236a3d6db7f5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAL+l92gC/x2MSQqAMAwAvyI5GzCVKvoV8VBr1OBKW0UQ/27xO
 DAzD3h2wh7q5AHHl3jZtwiUJmAns42M0kcGlSlNmSIc5EZjjxXtMmN3ytJjYB+QKtJDbgpd2hJ
 ifTiO6n9u2vf9ADpJznNpAAAA
X-Change-ID: 20251021-fix-acpm-clk-build-test-1915f3a657c7
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 kernel test robot <lkp@intel.com>, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761060289; l=1489;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=0pTWYSKeF/umD/wXcGJB6RFTk+048J5zAPQ2CewtX1k=;
 b=2+vXOE49ULPO9WgunsDjzAmwON+BhVkCg2nx7Ql3O90/K3s+zZo6VXA8+hD/KclCTMNDWouKt
 bmloW7AwrluD7l09YBYniO+0BEm/t4+HYgSRcZtg8bA2zLaKSNzvVVW
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_082452_279260_6D9389D6 
X-CRM114-Status: GOOD (  10.46  )
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

Provide empty method for devm_acpm_get_by_node() if we aren't
building in the CONFIG_EXYNOS_ACPM_PROTOCOL. This allows to
test-build the CONFIG_EXYNOS_ACPM_CLK code.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510211905.RgfWkgss-lkp@intel.com/
Fixes: 40498a742053 ("clk: samsung: add Exynos ACPM clock driver")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 include/linux/firmware/samsung/exynos-acpm-protocol.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index b1e95435240fdb895a03f178d4fb3789411b1583..2091da965a5ad238b5e16c567a72fe88fafe6095 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -55,7 +55,16 @@ struct acpm_handle {
 
 struct device;
 
+#if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
 const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 						struct device_node *np);
+#else
+
+static inline const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
+							      struct device_node *np)
+{
+	return NULL;
+}
+#endif
 
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */

---
base-commit: ad97aba3e64f8e474ecbce0c4e08486023ce8ab2
change-id: 20251021-fix-acpm-clk-build-test-1915f3a657c7

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


