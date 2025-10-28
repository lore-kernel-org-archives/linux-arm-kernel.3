Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11489CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 12:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+HQWTTzmS8TT5Tb3R6tEELAasWZz7XbENUTZplMJ86A=; b=12/1ed7rRRPPhgazyCjdgL/Z6o
	oASHz3FY4ZDhH+TqRHTRSfa/zVKNetJFSi+179yrdaY9YxK39uMert1IfFJKg1SjpQFZ3eThXXaLH
	4ZagaTO873osWbUhPGTRQcwhrEbalmpjMCdbR3jOToiIhnBxAEs0VMw4Z7H9SghpRF/9p0/wgY8Or
	BwySIDxHlGRVrhOxuf95rSt3N0CXSrl/hAkyLkJD0ICH67RbnkGctW5lgLTHAbY50by0m2vtZgppH
	HdYKBjXW6tWKdhGc7Qli6qnIGcnTG5W1DJTkQbSprTRh82huV9VGB+7aPEm5srToMZwcQ7VypKpJe
	Yonfj5Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDiy5-0000000FwrO-3ng7;
	Tue, 28 Oct 2025 12:38:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDiy3-0000000Fwql-3MIE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 12:38:29 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47719ad0c7dso7039695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 05:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761655105; x=1762259905; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+HQWTTzmS8TT5Tb3R6tEELAasWZz7XbENUTZplMJ86A=;
        b=Cq0VTHdnSEo0EJYxnlRZeGk803oUyyQr01XFPLR9UFnmuOpakWqgC1f0jh/5RWdymy
         /CnnKL2fHfAhRq+Y1z+WPrirP0PhhC454MOZH8XY5du/bVXfXU+42mT9mMVpNI/i1Z+9
         ywBN2DTgBiy40SfZKtiK3eNGsQ3/B1YuOtTj0hIGFKPNcBCnpItvouiMN4gXfpS+CVnV
         REH/5KyRh2D2Rgrd62T4Bk8XLcj4B+qzpj30TtTzUaBthlf9a0ofpyrzB0xJPu6K1B9K
         CQp5Vn1ALNxOUlQKNiWTp1YX/7eZvUVooSyppvFAg/U+phHj2bEzwzhm4rjkwRo7suHx
         jkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761655105; x=1762259905;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HQWTTzmS8TT5Tb3R6tEELAasWZz7XbENUTZplMJ86A=;
        b=i8II1P/Z5lxeNEQL7gtmM/F6A7mTbsrhGv/LhGl+urXFzVLuOPoh8Zjyrgz21MOyG9
         CG9Wuo80MbFwQKEZZjBYrf3GFTRV99sxXaGbvawfRF33EGow4uxmdx4Rw+gDr2O5G18R
         B+OwqosgZ+TZOKpO9Act9GnW7z3JVKHbNwhkc1pUZx0AmucWRpbrGkzLDNpp44GKZe/r
         4gLejlF8geytLQ3CHpagKnMu+ikWhd9aRl+Jtn8sAKuUyQbB2RdPRiLvWH5S4u2Tucuk
         2klavuL7nW8GQuH6gtDMymbJ5L3ORalMIKVfkfa8fEZKime0n6k7VXzGd9bN9pwzj/cb
         4K2g==
X-Forwarded-Encrypted: i=1; AJvYcCVfITfROU+2+m1bblB3LqH8pxXiWoVsGZj8gCmqCzYNSJEgdSfcyXrrfq64icE5IT13Ccf1Or98pI5RB+mWMY4y@lists.infradead.org
X-Gm-Message-State: AOJu0YyO4y6uKaKXQ5Ht8pjQFYynpNQitBI6upZdST5yiZOYnN72CF2h
	grxbbJYUKG5yeeJho9u6Y/N4RrR0Nv1lDk8/5qPWCdE3sptzrZh87qU4Cs34ysFxrI0=
X-Gm-Gg: ASbGncupELeOsBAlzOxvqi3fJxmrKknAtzYmTwAsiGsFqL8nJVuQzfD+f1kJwQGX2Nv
	QCjA9Dme4iJJawVlwGtW7+VnIYSltJIHkMcs+SwSl0vew+Sr0ZFxW5oWQL9/HQQphuo13GYLyaS
	VUwHMgc80UnDm4HBoY+F9O3WwXvHR2sYf1E6qc0UxiSDXB/2q+bZwztTpd+thJ8SH1pK0in0ofZ
	wrwAs/aqAlwSDTM3UZzZzvMLoflK7HqfzdQpvZaASqZjjq8JBvP54iqSi5Jef9RhszfqCbg+AXs
	xkqAUzkdduff3OQewPfXiESx7pp3k8EheiBPTzZYbZgWPcrsCYvBmkA8jrKt3lKXIYIVORjMOP4
	2xxBEq0/fXxI2Hlqo8TVRpxkWXWpubn/2r7JWDxoK49azKC/oJdyf1850vOwzUga2YOALXCiA3Q
	==
X-Google-Smtp-Source: AGHT+IGyxD6kxKArelGRFtmyoU+oQyoUCEToyxb454tLZ6do6Faoc5fje7htOPBCBaso+JeJcI0k3A==
X-Received: by 2002:a05:600c:548b:b0:46d:996b:828c with SMTP id 5b1f17b1804b1-47717dfa90dmr28285375e9.10.1761655105404;
        Tue, 28 Oct 2025 05:38:25 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5c9dsm21087888f8f.26.2025.10.28.05.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 05:38:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 28 Oct 2025 14:38:19 +0200
Subject: [PATCH] iommu/arm-smmu-qcom: Add Glymur MDSS compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-iommu-arm-smmu-qcom-add-glymur-v1-1-73f8f884c9b4@linaro.org>
X-B4-Tracking: v=1; b=H4sIADq5AGkC/x2NQQqDMBAAvyJ77oKmDTb9SvEQklUXXNNuUCzi3
 xu9zVxmdsikTBle1Q5KK2dOc5HmVkEY/TwQciwOpja2qc0TOYks6FUwn/ANSdDHiMP0k0WxJWf
 vIT6s8w5K5KPU83YN3t1x/AE2YNXUcAAAAA==
X-Change-ID: 20251028-iommu-arm-smmu-qcom-add-glymur-7e953cd459a9
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Mf8h+h03L2bzW9mDWJu5js5WAT5mXmT3aoXz60/jCXA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpALk+kUF8P0aVK/w8f0AM9SlSRvIOPU68KBcGK
 PM7XHH7f1+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaQC5PgAKCRAbX0TJAJUV
 VsnWD/9BDr2abdk3/NrmmBGMD8VxoWsJxnPo4WRfEjpZxhrNa0p0ISrW79FWqyUm35dCaVmQFvO
 wCiGBC3jHNfOYMIdWGnMCJAP7y9uttfzGyWW7j494avIDvuQKTa/IFQoUa+nqaHa0JdOklX+nPl
 OonLpbwdsJ/6tjmbnIyVG3lqeas14RPcZ0rKKS7SJADHJDxVjIKKpF1mgqpwPnr6DLQaqUxXW1K
 0SApilA0nJhYIT5fqkI3i2lBE+6FpcftOIYxyx5ce8PSRZz9zLE4QKCtuDhIVPZ752RHj4f3z86
 wAAsUkqK6tIk5n22bAY2awmTSp6eggnWs1EiHqgkjyohDOsqMSah8gQCnA8bl44tHEUkYooNJj2
 GrBCKGJEqdkiL1cBOgvSk6WPPGtaGAVq1PzyGeo7Rwzs21hEpTJZEbGChzpBjXoyUnIdf8878S/
 6Vfjl+nOB6ybpcRBLICWuQD0H7GxD61mJTWutk6NuBtjaB4DerA7dDbYk0IjNSkiaCsmoQnQoAI
 nCVyBHKU9BYfkb+raWMcy2rr5IBubLD4ZBqpVs+auH3UXE/dtTIzWhc+CsewgiMuJN1E+GRQmIP
 eBbJk2HseHGPuxVxtneYp4l45JDvFwng9ST9WfAZ/S1RISXMMJNwhXj1VtSmcfOcGQWm96QvGTl
 V2Hx3ejMmtlE/uQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_053827_975821_BC727255 
X-CRM114-Status: GOOD (  10.61  )
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

Add the Glymur DPU compatible to clients compatible list, as it needs
the workarounds.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
The compatible is documented here:
https://lore.kernel.org/r/20251027-glymur-display-v3-1-aa13055818ac@linaro.org
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 57c097e87613084ffdfbe685d4406a236d3b4b74..c21a401c71ebe768115364bf282dd324f8222109 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -367,6 +367,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
 	{ .compatible = "qcom,adreno-gmu" },
+	{ .compatible = "qcom,glymur-mdss" },
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },

---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20251028-iommu-arm-smmu-qcom-add-glymur-7e953cd459a9

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


