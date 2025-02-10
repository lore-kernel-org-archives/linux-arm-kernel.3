Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD61DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqD1g4YKIN7d8Jic4AmC6WlJ69pwzDTn8w0IL9Ra7Bs=; b=hYHOyKCaFm1BdHDL99qrTr1KBS
	Tcz000nntHx585dh3lhDVeM5ZurB4PL1J97bhW/9KACm93wOgVqpCv+Ov8ziSJ0Z6KgRCaI6uyqDd
	9py1ckFyGwZDBxWEjMjNCM0l2FShyzDo8APczAtf4xpyCcCJyW+Tn+eqexOZrZVLHet/LeRz6R/Uo
	N3nHs6fgpvUpQ1dX6PEZPBbCFIkt6NQw5Ygro9t4ULWHVOEBk2qRJX2T11a9c2DJOvcERN4IBaQxr
	dWzMhDg7pP99FBQ7fh4qDQ1p5HHrnGjksv34p1sLvcQRwK8Bt4DY6g3xAlEEZoeoVtBo4Ecyyd15I
	BRqx5hJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thTLV-0000000HTK1-0mRQ;
	Mon, 10 Feb 2025 12:57:05 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTGf-0000000HSIA-2m6f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 12:52:07 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ab7430e27b2so843451166b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 04:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739191924; x=1739796724; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqD1g4YKIN7d8Jic4AmC6WlJ69pwzDTn8w0IL9Ra7Bs=;
        b=QvgACgXYXF9QoTxwbEq7RLJWYRBfIi1y5eFkZN6MbYZDojz4HVi+7JLG78RiQARtIi
         gMIU9BMUa9vuKs8h76bNR1Xx7Diakvep5ffx7qotcAxnSuIfuhoEgExmczDyLY0SFbl2
         2nnl5/4AIkG9DqZL7/meJWt+n1hv7GHjXDTqgk/Rcl5UKlWhrBhBwDLCzUh+83fpmST8
         rj/RGk1IrNoJRRI5MYTLA8c/XUOswIgwTL6e75dqkJt+ntV9ZnsHPxl0zakOEXa4KMBz
         L9G50GqRQ17o0EYKa5nbEMcNX2NAF3GLMQmD5HeA78+SzsVAe9r2e8kfRm5FI58xjzLv
         g8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191924; x=1739796724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqD1g4YKIN7d8Jic4AmC6WlJ69pwzDTn8w0IL9Ra7Bs=;
        b=b2DvNnd8jruKvKanAVrTUqumTlZvDl+k6lOMHoMoZWV0aLwFIM/52R0ohGdHOC7+oP
         AMBB1pHr27ndh49wc+RHwNMF1pM2Vy3C3/xB5ledm4go36uy5LQMpZBP6mp7MWlVHYJa
         YY/p038Fo4/4wCCoPjVysPAYnHN/nx3G0ehFSAu/fpMG6exGcHECi0W0/q09CFXAUazL
         mr2JAmLzza7j4xFoJUnpUBvnYlSdZ1tivs8qq1trVmZ/t+zLp5kQCPZFp77I4KfPFFJ2
         1Z1vRWljcl/l0F93xS8Xj46Pp5tbRjV5xju/9mbvSEGNpqkPpB/hQoIjdNdQlZt+ALfC
         e5uA==
X-Forwarded-Encrypted: i=1; AJvYcCX9f6y8+sbaq0zl0LMaHbp3YqLsPh80Se2hM/A5SVvwaPicpEjWx4Ge/+PfXx9viqlrnNOeFwWHW8JYfcpDQGVn@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz7tuAzX8J+YQA8TV1enof0dC9o9F5oj/EFuISvnAnpHicDH1n
	rcI9BtN+jkWHWQlQ+0k/DB/AXknlV8wS3CNs1oKt+9rOlLfwyNJiUgUldkFgQF0=
X-Gm-Gg: ASbGnct6gflXJrV1pkJNsgNDXwLWRNOAs2f4Pz+4tS46gZcIUt0DxutzOXzevgPNLSB
	CkWSj75WV84XLZ3VvHN6fYEdnWBAipJY1CzI2wXqS2m7HEjLJZ5BYTZC0Gg0yDmrb6jli2nvRG+
	p0DCHVnxRZnfbtRKz6iMpxW5A7xSz7gkK+zsD+1Kd2nV3jm+PVxC6gqMw9R7iZP8JZX+R2w5H+u
	AJoA2VkZOUSmoDtkIH5YzAWGthXuAgAPN0frqx1s4MpP0wFmOHL+oZnetstX+pE3zPTbxfnUiwu
	hOx13aG96o9oZv61Gw4wz+UwN5rJMfadC7N0Ydl0VUNwpaKLvVxD45Nl2jCmUKvJmIWimlcNVDI
	=
X-Google-Smtp-Source: AGHT+IEcs4lV823LwIXgoykf1sI1un5zsoFBvpa5yONNWVKm+6SAtdOLZFSfcwD/mDii+zqT48mO9A==
X-Received: by 2002:a17:907:2cc6:b0:ab7:cf4d:9b2d with SMTP id a640c23a62f3a-ab7cf4d9d89mr171928666b.30.1739191923919;
        Mon, 10 Feb 2025 04:52:03 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ceae3a3bsm85819266b.129.2025.02.10.04.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:52:03 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Feb 2025 12:52:03 +0000
Subject: [PATCH v2 2/3] arm64: dts: exynos: gs101: align poweroff writes
 with downstream
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250210-gs101-renppt-dts-v2-2-fb33fda6fc4b@linaro.org>
References: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
In-Reply-To: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_045205_727064_A09CC2E8 
X-CRM114-Status: GOOD (  11.97  )
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

For power off, downstream only clears bit 8 and leaves all other bits
untouched, whereas this here ends up setting bit 8 and clearing all
others, due to how sysconf-poweroff parses the DT.

I noticed this discrepancy while debugging some reboot related
differences between up- and downstream and it's useful to align the
behaviour here.

Note: for reboot downstream seems to be incorrectly writing 0x00000002
and not just setting bit 1 (which is the only R/W bit in this
register), so we keep that one as-is here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index e78dcd506a5c..86741994bb7c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1401,7 +1401,8 @@ pmu_system_controller: system-controller@17460000 {
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
 				offset = <0x3e9c>; /* PAD_CTRL_PWR_HOLD */
-				mask = <0x100>; /* reset value */
+				mask = <0x00000100>;
+				value = <0x0>;
 			};
 
 			reboot: syscon-reboot {

-- 
2.48.1.502.g6dc24dfdaf-goog


