Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60C6CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lcdJmzD84uDfab79lyqxcqnmMvBiautmvBU6m3EhEI=; b=xNx4qPyJi+xV2LMV7QSD+YnKHX
	7cxyAFapvn1AIn6YB5CCKvwVGB0Oaft2eqOP1Q9cYWXkYi02cgWLCrm6Gi35F2WueyncRUu0Dx2pR
	9QR20f48UVZ2Qf0N3Fe7BQLvuXAimDkJVDwIvchcgcltkyUdNn/b+Y1GQr6j+nl6Ag2nzTC+0nNxD
	FjfJJg8B4ppMT5Fs1wakEYtFxS4m4u3sJfmbJOHaDTChlN1IYmcTcqSvZoE0I5dK7TFD1v/DdiZFZ
	f8XrP2ffJHd2efuAtfZTzBQoUJS2w9MUByRmo7hnbRKEooiT9j76SFuGPz8fR15q2fc4cBs5AvrrH
	FH4RdPeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGwL-00000000Vnr-3w23;
	Thu, 18 Sep 2025 15:52:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGwI-00000000VlY-1XL5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Sep 2025 15:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9lcdJmzD84uDfab79lyqxcqnmMvBiautmvBU6m3EhEI=; b=fYdHu5bLooAzxxae9tIoMvx4fy
	LZLCS1iu2hdb0Yenn8vJULPcwwOeKI1UWZvjWA4NYfkl/zgNuQ8J81JqLdecCXD42oYZAF9uURjSz
	WYBUtXCOlbOSRVNcgVg3Njz640KfFCfvFV/yfQw7MdTn/poKBE3Zh1PtaGy3l0YEdkLpM/MU+Yvvv
	X3AjWB2/VNINH07r/9ENoiT9+fe8q70cHoUMjgtX0gdZqrgCNLC8rjXiEiRQjzTIaaUOje4cs7z8v
	M4OYW8MfyrX0kFn5x/1E2OTX9yjZYBtwWyyI1f+F2O4v2/+yHrbR2eNtno4R914VoNtiYcJRDCci1
	ziApBudg==;
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGwF-00000007eAJ-0Ylj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:52:52 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b07e3a77b72so319878566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 08:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758210769; x=1758815569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lcdJmzD84uDfab79lyqxcqnmMvBiautmvBU6m3EhEI=;
        b=jH2KkLggfZxGr5nSrlVRn2KDHRJ6+Pd+tnB9+VBWM8kJD/I5XlucmiUsSsD4cs/qGw
         mHckEbEl8kMzWdmcTMYfFrWRWvU54a7XlR5QVPNLy3UI3ksuUn6Utw6JcP7tDfIj1AUQ
         MD+drJ6eAsEwD8kUrbpf9vfKO7RJaki3lsvlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210769; x=1758815569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lcdJmzD84uDfab79lyqxcqnmMvBiautmvBU6m3EhEI=;
        b=R8OfjWUwABqB/PJOFvAxIxr7UC4NCDD4Fmz2TcL3QMGqkebSNE3sBtOXaTpqSxwSDk
         xhX5W807aaflIlmaScrz2ZXBbfdrmielaM8COYS5hi8kkj5s2NaDeCFDZ5p/pviyWzIH
         j6UXTZlkoq+el5r1cmzDzNYVtVg3MLf+4TzI5zcNi1uj7SFHpsd9Q4SJMtW/2Pd3IxuK
         3TdKhF2mB3MWigwXS+yuF91ftHCxhOetrX3XsWum9Mcf3pwVAp2c0hppqP5PUxpoNLgO
         HcClLOaJnc9v8b/qsthHuc8cxMCS4dZ2f/1HOcsGQBnLNThff9zreyKYwwotanhKQAIY
         rbFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp2Ksmoov/GKeznvWlUL6TaXH0zrgSbvBOxOOQShKO+of9DfhL4PHRiUPbgghyAiBA5r6FrkSFcdghENif82e5@lists.infradead.org
X-Gm-Message-State: AOJu0YyOn8MUtt9MSmWT6uyeyWlROecIAcvx6BX1RTiV529dQFecVE1G
	PuJN5mcWVk06ah7LZvNpz99GTUmD0xgZbS4W1ZJ26NfuPSd4fJeucKzZ9bGpgROZlGo=
X-Gm-Gg: ASbGnctitd3wtMCTUMLh3AfxG+q5VAuesABh7/ogZNA0Y1edREK0VSYPrHGcNscf317
	xgJC7Pot490Kb10DgZF4Vx5TUXjppBLb3tlGZwfUnJdvKifXjmBU3yC0D+tutgTl3JTs8jnRfo0
	H6cVt32zPaQ+v9MuoMQRGH1hK96hL6cyBn6PiE0wNUzIxwfedbdHdMrdFwTQoRAxZzzvNJcLGMg
	1d4bsK5cb6QW7U9KcqJyhNjcfFzhgMrcaLYOWs5UOc9Jl5/2QvGxsosNnvMc3pfAAPiHDnoH/x+
	Tw9lHf4YcxkVFIlAmvxnJI/gsDiHRwiiXqpwUvMtvf36zforBlDphRg0PNgwnIeOaJN5cDLbGAs
	z1WLQ4E/FR7qTe/+3BDy98HKCRnCi59dcfzIj+JAmSfgwLpvOK6SleDJsyZvac+HWWMKQycvXdl
	JLOIZ+jkwYREhEYvGbY8QnO+fRyzfbW8AlSqxfleOJQaDWHt7u4QFI2zqa57befD6g59Uwi02i6
	KdLbgP9jxs=
X-Google-Smtp-Source: AGHT+IErelZCb4Ng2hNIph4lDPD33ehWDH5J7iXux+fMT/vxxySG4ibwfi79WajSIooQhiHJCIIbVw==
X-Received: by 2002:a17:907:934e:b0:afe:ef8a:a48b with SMTP id a640c23a62f3a-b1fae7a9b82mr410713866b.30.1758210768899;
        Thu, 18 Sep 2025 08:52:48 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b23a1227bacsm60449766b.41.2025.09.18.08.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:52:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v5 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
Date: Thu, 18 Sep 2025 17:52:32 +0200
Message-ID: <20250918155240.2536852-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_165251_346625_760E5333 
X-CRM114-Status: GOOD (  10.98  )
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

Support the touchscreen-glitch-threshold-ns property.

Drivers must convert this value to IPG clock cycles and map it to one of
the four discrete thresholds exposed by the TSC_DEBUG_MODE2 register:

  0: 8191 IPG cycles
  1: 4095 IPG cycles
  2: 2047 IPG cycles
  3: 1023 IPG cycles

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- Adjust property description following the suggestions of
  Conor Dooley and Frank Li.
- Update the commit description.

Changes in v3:
- Remove the final part of the description that refers to
  implementation details.

 .../bindings/input/touchscreen/fsl,imx6ul-tsc.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..1975f741cf3d 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,20 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  touchscreen-glitch-threshold-ns:
+    description: |
+      Minimum duration in nanoseconds a signal must remain stable
+      to be considered valid.
+
+      Drivers must convert this value to IPG clock cycles and map
+      it to one of the four discrete thresholds exposed by the
+      TSC_DEBUG_MODE2 register:
+
+        0: 8191 IPG cycles
+        1: 4095 IPG cycles
+        2: 2047 IPG cycles
+        3: 1023 IPG cycles
+
 required:
   - compatible
   - reg
-- 
2.43.0


