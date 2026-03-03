Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9373EDA685
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FTo5uT1h7nOZ7FtDex+0/FEIZ4xUi7xNVLguZff5jE=; b=f9MZw35HnpOEHbBmK7l4ezTh9s
	JLSdIdhwKOTyYf+zDjBOR8UlqYweGL7u5bOSEz5a+F+uUdJWfACrWzIUmQdxENWxya7txhs4wTIOp
	JpoBcC9yZyqQSnJ2EGTPVdK8Qv1nJBpAAgX6y7nfuhipUnNFxOcZlytTrHUZko5Yc0sUZXrGE8Kld
	OKEgH/QTvizo/8f2JxzgxZworl1bC2PhVm8XbXIEfagn6Vm3EXlCxz4Muw1ZLEPfrf2WmFE3DzMwd
	3JnBMb2tyM7JumN4MiJtvbYh07gES+4UO5U9hau1oG8szPp1vsaAlop1MVE9+o6rMB3um92QLOfEL
	4wkTgjnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRRj-0000000FOw2-13LF;
	Tue, 03 Mar 2026 15:14:03 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRRg-0000000FOt0-20gM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:14:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4837634de51so24413725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 07:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772550838; x=1773155638; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8FTo5uT1h7nOZ7FtDex+0/FEIZ4xUi7xNVLguZff5jE=;
        b=JpGB+BK54h3sjRja1DHkCD/IPYgX0OZNQSE3zxj6obi2VLwT6ofT7z7Ampe1qdyI0d
         YtVWXCJyW0xBeeObIFpXJe2UBLlOuJjAyc2+kKmPILb0+5W56vn5pv3ntCg/+B8CKiQN
         CRz+bBsL7q6ofucXz06R656Oe84lSwzKAHrMLmHRn0vdUAgwQRheMl4DRtClwEQVvWJ8
         ahSGoplQCAmrEUhuBNvrnNdxAtJBu/MarEouM4sfZV0ngs6HcTy++4ntS1+nazFqhHfd
         zC4nrFgVO0z/03KgvvEPPU200zjjMU3A1FIflfgbMwa7c7kjX/My3a3/LeCXD70XVr4P
         lTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772550838; x=1773155638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8FTo5uT1h7nOZ7FtDex+0/FEIZ4xUi7xNVLguZff5jE=;
        b=XBGMiwsF2itShf4OAL9c2Z6ICQ1TEy/5eh4YMkLDpRZHrpf3zHGzGjXsdtfS1SvW1R
         seRKyjLIvfFd9iIRA8qinCxUBmmFoIMjuFSmGrkaWEhIIBp1p7JPCnm4nm0UEnGpkOhP
         WIOhhpoO2sZVK5uVAX5hJIc/LSLvJPKWNzJR/KzrXw5HrImQ5gNSNplEy8ggot3u2g6n
         gN3GXMFruz9QKGC7qtQN2tSS+i3H8C/r3g8FrjSAS/vcMQBl48ODNhXxsUyYYF6zYpzD
         YWjjRj2Qu1ZJGI7regRpcdnywYLzFs06n8omlbA9w7MOEWz8ctpZ0hae3yy6tY11R5/t
         FucA==
X-Forwarded-Encrypted: i=1; AJvYcCV55KPYTfKcspwYIUpRPnHpKo1kNmskYNmse7lAD3lmJbrJbLr1WANauL8j0awpHELna31dWpgN3S9emb6JiiKx@lists.infradead.org
X-Gm-Message-State: AOJu0YzZusXHi7pqVe+ky/KwY2dqZydeY1dhUbZFRmG8rQAxRIRCAS2b
	YFxj27WGsS7BeW+tgDh3zrR+z9+1alerqDSJrRg08KZNm7d3Z8bSjGfL65BN/nl+nYs=
X-Gm-Gg: ATEYQzw16jFmIZJErUgo024CUKtx/PiFO3/MTEh/KB/U34vcOlLgZMc492tIzbVxJvm
	+LYZf5OD3YxqcuyEVPxMRz2w3kVv5jFNL847EGUoYhbJS03NVIKkud6QPqql+6tOH1Is3YOtvDn
	cAW/faOvTdK/dsCQI9rzvRCICS9UbPKJ+udpZn5BpuCl7fusOjD4a3sMYADXaJVGNVjaj/TLXYA
	WP1SQx5JqoWy6f9W0xeidoeZXsJHdsJM+KVgQOQ/SoGirY96vpVNEnPf7ouXAqMDYxCptXWGfwX
	qZ0wztmCQJctbx4EqqTCyWzEYwZAFf1KTwYbXa1fxqKu9Wh9aP9pJEKY99BS7+lUvqxXRP2nFOM
	D2Xto+CXiDTKU7ysrn4F3ZqufW0eJuBpVkO0e9wkNdwWY121qKHJM1W80U/U29mc3qAb3Dg+IC/
	+7CE+5wUWu7V3mjMJkeJa4qOTzf0zzHpQ=
X-Received: by 2002:a05:600c:3110:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-483c9c23ffbmr281348625e9.24.1772550838544;
        Tue, 03 Mar 2026 07:13:58 -0800 (PST)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3ce8fsm357946955e9.4.2026.03.03.07.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:13:58 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Mar 2026 16:13:04 +0100
Subject: [PATCH 6/6] arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram
 bootphase
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-topic-am62a-ioddr-dt-v6-19-v1-6-12fe72bb40d2@baylibre.com>
References: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
In-Reply-To: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Z0hCS+H2IItocsB+jWcDutoPEuYwBwtSDmCeiRLXMdg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxlv5b/TcnsfLZmYhPfvfsXtk8u7/qyr3NGqXKF8oOGW
 /eNTgls6yhlYRDjYpAVU2TpTAxN+y+/81jyomWbYeawMoEMYeDiFICJnD/C8D9q0TWey7Y+eqq8
 a94KvXN1bzjwOfrC1TOfHaVTmDVLOzMYGf5O0DPs/X3bY0qOy8+WSeI2FX5bpl44f28t20+u7xM
 CF3ECAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_071400_541288_91D2ADFD 
X-CRM114-Status: GOOD (  11.12  )
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

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 7fa4924ab52484c7ac4243a0cd6c0d7aacaf8b30..55e75e9946f75d4d787c933d1d87de6ea9670a13 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -71,6 +71,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -868,4 +869,5 @@ &wkup_r5fss0_core0 {
 	memory-region-names = "dma", "ipc", "lpm-stub",
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
+	bootph-pre-ram;
 };

-- 
2.51.0


