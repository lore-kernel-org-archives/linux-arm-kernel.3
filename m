Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B99D2F000
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DPB+DFTfjkKjhu4BtKlRuvVUNmzJlqVK+VXEKwMXFYw=; b=RqMEIz0JJkB+EcFsqjEl1pKdRV
	Mgx/VYway1N3xkN6gSfgi2WEUp+JrlreFZcNhfhTAIo/mSHKBg8p9eYY2lAWtnB4VP34B5JpveTKH
	ptDaQ7IKODG7e1Eep4vFQ97ycYR/l8v5xrXj1yIAVbQ1KiztyO7tlNBqGGTX2KNOlZkLvRT/7I+E7
	J0yjt6uCJ7ZTdtQD8wPh4XlTnhFbDeEmTDawsFBpg2qxkaDdnBDHAPhSEXB2TPnOo6ycDa9+q3OU/
	XLgPIHdAS+nt92odFLiqrFmZ5STjg5TWie0J/JTCD4KEqfgg/pX/kUc+QTO8JVnks4Aw/As7ngxpc
	jD/7eZVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiFn-0000000EFfV-0Sj5;
	Tue, 27 Jan 2026 12:33:07 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiFk-0000000EFez-2lTq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 12:33:05 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59b710d46ceso5374678e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 04:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1769517182; x=1770121982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DPB+DFTfjkKjhu4BtKlRuvVUNmzJlqVK+VXEKwMXFYw=;
        b=VKbnQ8sgdW5rUU72U8nMvgBBECrqKrGbCnGWKIO51MoM17TyiHAeIjRm8tCV7cLgD+
         RqqT4e8PUGhqa2MlWv9iBTQosDmfJ7NCENnBnTrp2YUqXppU3n9vmxj+6ndOBEev4Dxw
         wHwQPKdsZVDGNwl640g16LkZoYbhr3XCyN8cUdgeKGPc0j8mtZMBLaUmYp5qwr9Xxu/+
         JbvKK3UWHRlqsaKMrCbE02+og5tUaeHO1dVTu2R+R+hfKjki6JowmeYVQ1X+zE3Zd3NU
         Zsd5YIULvGsNN9QhNDEt83RyUC+4xxRLSm9xAXQkR+PXfPnEMJiig1vHSnKSf/lFeckg
         4hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769517182; x=1770121982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPB+DFTfjkKjhu4BtKlRuvVUNmzJlqVK+VXEKwMXFYw=;
        b=lCmMY3zERpYe5sq90HqhHbRUlKKuMuLr+RTzCdYhLMGjbjfIDLU71zNXT/Qpx7X//a
         l64ER3Qkvzg2JUYRefgbrqO0gxYLHaEpfULNtyEf+CZM1+Pm5848s+xugsaDlHt75Zd6
         hav99kwaH8NgsPaLkYYhCoCxWPW9Ew6ohIL4oHRX1rxQew/Cd9drQQRiSqgnkon4Mexi
         6x1ebgBwgjzrKjFpZyBYfLIYgQwOPay7B4JkkmFLqXguSG3QNWjuG92p/8IMN3etQ8+4
         Rpu1yuys1afLbRp73OjSTAikdkhvmOLWMpdlphdMbBIg6+Y5RkqrAdtqkkNqPqwyGf9g
         qP6w==
X-Forwarded-Encrypted: i=1; AJvYcCUkEn+yzlCA1o07jFzO9JjqZiPGo1MbXCRdFktlNu9j3S+DHpxeeeGUiaB70CCwJOrZ6qdIr4ChCFaPcnTM5FVh@lists.infradead.org
X-Gm-Message-State: AOJu0YzWtDstvNK7/y9jxAsuieyby1Mcqi7vqzEgdNfYuuR4K3qmzghH
	Nx5Wfjn2ZG3Q3KsvyGkyTuX9nm8aK9gT1SNO2/QX62RAEI6EU5qqUpw6QAbH8NkqMJo=
X-Gm-Gg: AZuq6aJIky3Oz+e5gMmw1a/YwVXDOSA3YVJmWPHPva2lq9J+Lk2YwqCB+QsYnMNfVHN
	pWVYiZrfv1rJy/OETp4OT8ZYodGv47EN/bRzF6zbtZ/pCLzDFqtP3pGmtuCPTjLIoP/Ef2Lkl0o
	dDABsDmKOIOgh3crrEvgaxG8H6C9o5h5KoD9xEI4K7G3uUiRi42/Xm7QDnNraNPgOfVulY74rMM
	megAu/JgeM/tWgdQiwizQRK9HTT0OCcrRcTTSGDtew+OuLsyjAEJlY2TWsgwRzHplA7cFbqhoIB
	KDTr2N1RoZFnretjCVmFnBxJ6RVcH545syOix25LagmsaZEZe77HXR7G5UfFDBtZLB5NkIdP76w
	6ZwlkTE4Bg6w0Y31D+o3y+Iq1QRlY60v8KJHGRZ0JFAzxRVcSA/zlJHEO4TVRN5XFlDMSZ58N4v
	eVs4wih1iJ/qIGO2YVmN89G5ThpDgAAAab1F722vOpUgLiLdZIxzCPAjJroHiIZE1H7zpJtIuQo
	N6/kDa0CgA=
X-Received: by 2002:ac2:4e08:0:b0:59d:cb56:d2c7 with SMTP id 2adb3069b0e04-59e04017290mr701225e87.13.1769517181789;
        Tue, 27 Jan 2026 04:33:01 -0800 (PST)
Received: from fedora (dh207-15-237.xnet.hr. [88.207.15.237])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-59de491fd7esm3554811e87.75.2026.01.27.04.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:33:01 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robert.marko@sartura.hr>,
	stable@vger.kernel.org
Subject: [PATCH] arm64: dts: marvell: uDPU: add ethernet aliases
Date: Tue, 27 Jan 2026 13:32:15 +0100
Message-ID: <20260127123250.527714-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_043304_734259_9725B87D 
X-CRM114-Status: GOOD (  11.34  )
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

On eDPU plus, which is an updated revision of eDPU which uses an external
MV88E6361 switch we are relying on U-Boot to detect the board, and then
enable and disable the required nodes for that revision.

However, it seems that I missed adding the required aliases for ethernet
controllers, and this worked as in OpenWrt we had added those locally.

Cc: stable@vger.kernel.org
Fixes: 660b8b2f3944 ("arm64: dts: marvell: eDPU: add support for version with external switch")
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
index 242820845707..cd856c0aba71 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
@@ -15,6 +15,11 @@
 #include "armada-372x.dtsi"
 
 / {
+	aliases {
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
-- 
2.52.0


