Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29C9FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 20:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mcl9hUvY34FgeniWwVm+TyCioqlD+gxNdeIUe9rxqOk=; b=uQ6MdRPvb2cCb0VlqkoXAyc4UH
	XLugGd/8Oa6FUqKaimeooLoLQloL2AftDLSVlrfTb0VR85tIi9OA9CrLSlEVJHkkb1HSa+2K9lCaf
	kMT/UVAG3/csT3olLUB218YtM7wByW+NCgub0uKW7WEKg8BJXyjRElqrH9uk1aCJhSQBn7yl/9dDp
	QGoq1dqUF9ZJV/dPgnWwgbp6JPksBj2uAvzHQkru1Ykq1W4rM/Xo80uV1arqOiK+4fjUdpbhyiysj
	iv6hbF0OsoCpisQDaL9oMpvuMFiQFtvdQZ3zWbDxq8VHgRXtQNLxr45GwcdIvvtoXYF5sQppemELj
	AzPrSj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIBOD-00000004BZZ-1UNP;
	Wed, 29 Apr 2026 20:20:09 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIBOB-00000004BZ7-0xaT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 20:20:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so7837765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 13:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777494005; x=1778098805; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mcl9hUvY34FgeniWwVm+TyCioqlD+gxNdeIUe9rxqOk=;
        b=YsBZyhnyD7ey8yFDdwfOE4jHEgIEs4jqzBT0ZkiZnBI/V2/VpzSHUjtLRJJ4iqyBBx
         iU7Eb0RatRowBgC29bz9dk5Gu0haLROM34b9CyTjDg3mzgUQ1qPLBac/hnA8TSyqaJow
         PGRSxt9Sf0Rhav9WhnhB1KPB6Ks2AagIfwPyqAVT5NK6OdgT78ZMq/aR6A3h5YUCJg6o
         KRv3g7SBFxiIlVUSGNNJC+IXOZD4lzAR9CsQ92b63SxAWjkt++CvHylhpOxmRoxX5TOX
         jvWB8yQmUTR2NOeh+z7cLuOvlUKMvr3pozCaIom4VS3SuuAHuUB3CiURgPW8gF2Y6t+z
         unKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777494005; x=1778098805;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mcl9hUvY34FgeniWwVm+TyCioqlD+gxNdeIUe9rxqOk=;
        b=Qhpft4FKa8xKXlckQMAWhKdNU+SbJcNz/+YQ3T//GI2su27giw8R55cvsHOR1siPM8
         csukKF7i5oDcyDXLAcev1V0RLzUXp4EabKI5LkpS92X+svQOwPmbScKc/VJYr9rvhDxr
         YFSWDtU0IE4NihrfVw4gNMyaheAujVkYzXknDFxVve+TnEuCA1YCtJXxRNJKZISZ7pyE
         /CvzAc7HsNxM+XRkhG2L4N2yCD0jLk7fDjhX9cOt7toQr/UUw3LHWEiP5Cx1ZOr/olSb
         ykSIEQF0b9FwHtvtcH1p0lCqPo19I6FD6XQORB4zOkl/oIvvUeNEOtd3q3nN4G3aIPCU
         VKPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uo2PHsfzzX36rwHEZhB1pwHZRedpv5eFNqqM9i69WFcigOyDpRkfBtRlkAUYekNw3yTP8XV3AP4ntjXvDGwRA@lists.infradead.org
X-Gm-Message-State: AOJu0YwI4+2oSVrnxVqWmo/4pIzPI2rSroQEGKQsiNdKveANHSjtivOQ
	H+Jg0DzAcz4InKAb/8CtxEEHaGU+pujzYPvI5EwMzWnkXB9yaxmCcLUxx76qILobkQg=
X-Gm-Gg: AeBDieskxjmmQbmJMsy7PgEadDvC0hFYeHpg6iUD/YpeNAVD1My5iskkK4aRbyifCEF
	kgZj1l3S7ep/xMZ284nTMbUa7l+FuadB7eqqutKuUqcHaM5LGelGc7Ib9gSTaEehWb7i6hYKz6m
	bCVkoOdMnEEe9KPaZHSG7ybY6xXqzwNd/awlYtu8x1f8W+3LhXjsvBvAbZ0C/8CPlCb+qmDvX6T
	fDkyICodmwDTOscmJ1fPOmiZXzNOk13vjPutC5KNFFA4JXa8H3So/CaLYykw0n71Rghp/R30tK/
	MTRPxghMSIeuFOodVqnC7NzO4HnWbkTY2dSqPOLUfSW4wKBo4VxKjSH83igticVTS4L2qAMz4Oi
	7022e9FqGJSxQbmCrNe/qIubuHaRmlAq1q6fCtfTpb9ByLXT1WZf1dZ4QYGKFA68V+I30Dp4Rfj
	OXyQsTuCt1Wu3uH+sKODySIn+kDsbDd+ihI25Hwu2WozVe2yHn1KMWSEKb23varX3sQbWEJOKN3
	QoGou0W3ZweWB+yE5hj0wlEMIc=
X-Received: by 2002:a05:600c:a013:b0:48a:5821:6006 with SMTP id 5b1f17b1804b1-48a7bf98557mr78026385e9.4.1777494004845;
        Wed, 29 Apr 2026 13:20:04 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b901a15sm58061355e9.1.2026.04.29.13.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 13:20:04 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 29 Apr 2026 21:19:50 +0100
Subject: [PATCH] arm64: dts: exynos850: Add ap2apm mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-exynos850-mbox-dts-v1-1-7f3ad27ed4f4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOVn8mkC/03NTQ6CMBCG4auQrh3TH8S2VzEsShm0iaXYIsEQ7
 m6BhS7fSeb5FpIwOkxEFwuJOLnkQp+DnQpiH6a/I7g2N+GUV7TkCnD+9CHJCwXfhBnaMYFVjcK
 rEBUrKcmPQ8TOzTt6q4+O+HpnezyOP1oXOyw4/YPNwM3gwRv33CZs11Er20pJJfUktoXGJAQbv
 HejLqbrmUG0jNTr+gVlPGPN0AAAAA==
X-Change-ID: 20260429-exynos850-mbox-dts-c9b9e7336140
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_132007_323754_39ACCBEA 
X-CRM114-Status: UNSURE (   9.56  )
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

Add mailbox node that describes AP-to-APM mailbox, that can be
used for communicating with APM co-processor on Exynos850 SoCs.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Depends on dt-bindings from:
https://lore.kernel.org/linux-samsung-soc/20260429-exynos850-ap2apm-mailbox-v3-1-8e2719608c46@linaro.org/
---
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..47c9293c54c2 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -305,6 +305,15 @@ cmu_apm: clock-controller@11800000 {
 			clock-names = "oscclk", "dout_clkcmu_apm_bus";
 		};
 
+		ap2apm_mailbox: mailbox@11900000 {
+			compatible = "samsung,exynos850-mbox";
+			reg = <0x11900000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <0>;
+		};
+
 		cmu_cmgp: clock-controller@11c00000 {
 			compatible = "samsung,exynos850-cmu-cmgp";
 			reg = <0x11c00000 0x8000>;

---
base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
change-id: 20260429-exynos850-mbox-dts-c9b9e7336140
prerequisite-change-id: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898:v3
prerequisite-patch-id: 093e2d93cd4b6f0ade6f9ff0e3b773e47017f884
prerequisite-patch-id: c2e9212d341270a2f2a8b6f3695711bc3b6ff2d8

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


