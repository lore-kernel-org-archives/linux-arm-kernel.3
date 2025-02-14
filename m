Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A058C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dl5R/TPlYSsamCEAGU/chHrDqvXleYXJuMFs3tfWros=; b=xa3yHmUJ6YVqa9WVmscJP2g0Ye
	QCGJdTgVs7BBh91AfxsxX1Z9dy/n1BuX9/Aj8K+mRo3UnoS9hF7j4AOVLZ+UtCSw0peGvGQMnx50K
	FG1BXpHbxoJIGD+OIL9UrMylm77+SK1NpRJ5q3u8LLc/tNG1qZl5lCLB9y6CLO6uJjYRx+T9Uvv34
	ZNCGrqHIhvf2ACKQM1sKABPTEERGWcDhPh9WPCTszkbDByje/1TUSBe4OCZ6ohmydzQ6LPUsKtVYE
	VmdPbxYaGuv6ygzJwT/rrTk4ZKsGGPvqe0dzKySmpB8a8UH+mM1u483HkVIIHm6wP2A7JJztQaoK1
	8Ayy4reA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwez-0000000F9FF-3weD;
	Fri, 14 Feb 2025 14:27:17 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwdX-0000000F92S-0Wfc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 14:25:48 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5452c29bacfso577753e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 06:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739543145; x=1740147945; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dl5R/TPlYSsamCEAGU/chHrDqvXleYXJuMFs3tfWros=;
        b=ZVYaPUy/QZdKSBM9xrqMTK4/M0cfsuinShclRnZYTa0uZkd1r8Cs2/8HkDR1K8p+Wk
         xhuIpD1+b9IrgGp0FwZzQZ67k1tA5Ocoiahr4BZhyyime31jV2mDVixOnPIis92bybVS
         eTBktCMM1x2w/7oxJjVnG6d+uRr34VXmqHj8F7mzGEcS7daHRtuwjMkyFMcICxMJDB2F
         fyp5vxPtJ/butHqXfhV0MWiRKHbhOxUP9xIqJ9zMw4N+WkbJDM7GR/ITy72mrMv4FA5v
         Yh//QwRsUrJin7HtJNnAGb5ZTXc+AeqRA1uwbNKmUkoe/Bt2fiQ+0VNNby7YQaMe0jvQ
         acHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543145; x=1740147945;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dl5R/TPlYSsamCEAGU/chHrDqvXleYXJuMFs3tfWros=;
        b=ohwXvF90d224p0RLhDWbjR1h0w5C5HSXDqn96ZhE/bYOmYv/M5fYULTY20CvvKvUoE
         zo+MT0iFtddbTgvlpWp1f9Q8wM9KZZpulWsD57j7XjdolFqp5vQdezfsYnPamh++/+x7
         Sb5dXEypRbBNuUN5D+krjlSFEWi7ZNBeWQdW3+gJtE+yKuR9x0CdJszcUQmO5WcTpxu3
         CS3EGAcqrIXRCL4aFhZgWVsgq7N0kHxu+V+GwKwm8obJFGVGsaApOcnsnZz+3yeLPVyO
         ZDJIClx306LLQiHD5gPBDEO+OqGuszybKkZI4yWy8JKG1idt0CjvedSdmv1v7NaBU2V9
         3i7g==
X-Forwarded-Encrypted: i=1; AJvYcCV3qJSdoRyLu+F/rH5OoSk8Fbbi+AQC977gkRYI8ho2G3cmscY8rnDZC3HK41XiORYW5fISMlMvs0Vj0EJzSJDI@lists.infradead.org
X-Gm-Message-State: AOJu0YyfYkEuoptAMHYSnL8blgOSY70qEEG+W8VVeGJsW5q0ggfXzNat
	2VOW6E8plWV+AThNWxU2UGqBl4ZLNSS94gsYZyljnc0CIhmqo2xb215L7Rv/DRA=
X-Gm-Gg: ASbGncsT3SzmZeVEo1NukS1FvLSVe9I/QR+TX+dM5GSRWnwa/zJ5Wts2VaS4RjbTS5x
	SksoD5kY0Ho9lYbAD9XRBc94WZqo9+r2cMCwun0EJWozF5rwmgGN12vjsNpJOcxBQDz2E9SirJK
	fq/B1DxpUB8OK5keiZ1lGh8oJ83lR7KJ1jMkJ1dny3jlf6uA9ApTURZbC3hBo6iQlI6xBnnMftF
	uOaZPiWawTvz+AX41jmLxxkJP2rkhRn4GpKA5sWAEvgPwzMJC+VbgDmpnmqC1scS1AIvL+9nw1e
	lnlSWIukVrBU+JBCfrms/q4=
X-Google-Smtp-Source: AGHT+IG3qQ7eIYwNQ5AV7acWuEKmZCbpl/3HmRIO72Nu4b3+s5EH8gvvqKp/+KRrPfoqr1QpJz7Ybw==
X-Received: by 2002:a05:6512:31d3:b0:545:1ce0:6409 with SMTP id 2adb3069b0e04-54525c863e1mr1333734e87.17.1739543144772;
        Fri, 14 Feb 2025 06:25:44 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f11ed9asm537281e87.228.2025.02.14.06.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:25:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Feb 2025 16:25:39 +0200
Subject: [PATCH] arm64: defconfig: Enable Qualcomm QCM2290 GPU clock
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-rb1-enable-gpucc-v1-1-346b5b579fca@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGJSr2cC/x3MSwqAMAwA0atI1gaa4ge8irhI26gBqdKiCOLdL
 S7fYuaBLEklw1A9kOTSrHssoLoCv3JcBDUUgzW2NZYaTI5QIrtNcDlO77FnMUxu7gIxlOxIMuv
 9L8fpfT9gW9QVYgAAAA==
X-Change-ID: 20250214-rb1-enable-gpucc-7ae0a1bf6d1a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6xxF8rN9zTbbJvAKtEFfPHJFOxmzYocfsTr66zyc7NE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnr1JmrZctNMY2SC0FwBsqAPL/Wa4leScAw+aOH
 c/U0nJ3IVWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ69SZgAKCRCLPIo+Aiko
 1ev8B/96pSdQHwskzz8nqCgS4dPCDq5EuP9h3QpyDtwik9pLtkKqs2W224QjBPgecx/ZB3L17xo
 M+dTkK35qmTS66cimuorUsXjJJbyHvrPjl3ck7FGaQy4fx6uCTQz3z8YZ/PEFWJ+R0+cLZojGCv
 sanq5j0Z1XDajo/l3FUNzBNFVNCyL5ysqXLLuImchG1y1BBriELDs+gapjymBGApxH93rMfqYPe
 pwchqjMJticrGkG22vs5rcSezkRYs8+LKBOdI2xyHYMVatP0ycjZTXuRCrxveIcNWXx5ReQfPS5
 XeC2eM0q2VTPMaf1Tm3yqQ3nOWki1OedRrL7PYrX/glNddbp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_062547_181042_042374C9 
X-CRM114-Status: UNSURE (   8.79  )
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

Enable GPU clock controller for the Qualcomm QCM2290 SoC. This chip is
used e.g. on the Qualcomm Robotics RB1 platform. The clock controller is
required for the GPU and GPU IOMMU to work on that device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da44155999b59aff95966f4cdc9107f2af46a..7e475f38f3e1146dc0f742d13ffbc2d0648e2de5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1320,6 +1320,7 @@ CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
+CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y
 CONFIG_QCOM_CLK_APCS_MSM8916=y
 CONFIG_QCOM_CLK_APCC_MSM8996=y

---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20250214-rb1-enable-gpucc-7ae0a1bf6d1a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


