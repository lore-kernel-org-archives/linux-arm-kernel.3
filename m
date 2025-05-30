Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6F8C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 22:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJg1iKEfpql7pmZdjoA3uh10wUEns6L8IYOErZtWpmM=; b=XrYC2oW2PLQqNMU5Cj7bDG1NWM
	jkU4gwgBQ5B+6MH6thLPHgsTPDOtdAG7OWvGLnT57VrjGdpCAme9kbCFHkKH7CpE66pRpkIj1eMZS
	T9AHB8lcE2FduSiGlo3tmFZiQgRiHJm23rcW1ABy9mKqsBEVUNZcDGpJY63gC27cr7viM1O4X9hgR
	o7asTNkuLaSBPS1B091y/qIxjMFWUZwrPdWXiSz1wMTFHkEsBIoijGfjyWBLHe/qmcB8FVWHDo2q1
	fyuaevDpAfkw6hUJLstyvzqWX7FsiGMgSVvdpwDwPi+pByCx297Gl4iDGcOXorxnt1xE4nlOJOzW1
	T6NkAKQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL8Ve-000000027zR-2Jqq;
	Fri, 30 May 2025 22:47:30 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL8P7-000000026C5-3l0O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 22:40:47 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-312116d75a6so2245107a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 15:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748644845; x=1749249645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJg1iKEfpql7pmZdjoA3uh10wUEns6L8IYOErZtWpmM=;
        b=SWr1SVSjShMnONtMOWpWEaS4z6/+milWVFMEvWFkTfaExXf5XUjIZXSJU+y+AW3E7V
         g/erB3nnLekEX1s3ei5IlBr0EIsxTXsvg5/M5a9cvXgkeuxFoQE7aItERelkYK8TEClL
         curKtJQljVMbATj+3QEh/70dsEDuaezlOvQHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748644845; x=1749249645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJg1iKEfpql7pmZdjoA3uh10wUEns6L8IYOErZtWpmM=;
        b=C3Z2koahLrzox5DKvKN93/phsIL4da8jzZ8eWupO7sXdjP+KxWcApMb3YIj+R7d7t3
         Ov9JZgBo3ROhrAeXOKimYVVwvze257fwjccv+qv5cuL+6oBp39SHw0Dp1FW0Tj8nwpqT
         T8c7Sm1cmQ+YUNOmN98UssJB3BRTj7fhfYlhSevysm+FUlDz0tO+hyo6GbsDE2uuN12u
         UyIvpGDon5tN/v8Z8gjtN+roBRmg6X2dDX2sOHAdRpJFkHT7+SmpOVVwAljiVcXx30Sk
         AiP0x6FR+/gImbQBXDM6TJ8Ob4woYHbrdovRwxI1leuKHL7q2nPYck4mCTLUBjy9SzRj
         5ixA==
X-Forwarded-Encrypted: i=1; AJvYcCXUroReOAoslEXt0ZrMLnWscyud5GyZAWSKpLhocTCGAvZX/VdAuxFtvxNirrscnWjJiehgbcUkl0mfK8vuG1q+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcj5Ipto9EEJCNjl8m3oKv7II2gGMPjipzpxMAayuacWDNMGR4
	5QQSRt6ZsPEaxw21vFB8czgyXmm4K5JW39yUy691bNenMYCcgBL8T8pK8yX+/KoWUA==
X-Gm-Gg: ASbGncu8o8uPUZxr9GdCB9E6OXJ06AyFdSz8f9k5mpI5LJhRQYIgupRo+xutUvzz/MA
	14EAd0DPTq8PoZrjVMbKaT0Y64BPbdTJJBLa3bejecnT3pqXQ2gML+Z18qO/YW0nlx0TuHbn5Rr
	K/IVr9tah/QeomEkQlXLTGf542LjzostvSb35gNdJB/1g4hnpAx78uoZ/b8FMfAGb4E+naYV72Z
	nQ0j+3VIbwxkHRkdfdJjMZQIPZoK+/Zr1HUFd/EuBdyEpqOcsX0AxZFwK1VLgF8P3+KF6KSsOyd
	UKZv99rJe75LTuRjj9JBCQ/u6wqdpxUTCW63sf1QvfB74CsQnnOikJ8tRMdiNKUU+kKmELPjN+f
	z1nBIMT3g54U/QOkRd9Kh/M6vnqIuIuk=
X-Google-Smtp-Source: AGHT+IElfUcYdQ8CoYjYpd7MA+ZJeD62ouTASylM9JxPUzOpYGTly9yflZmPOUZsxhdConGhlD1Qxg==
X-Received: by 2002:a17:90b:5344:b0:301:9f62:a944 with SMTP id 98e67ed59e1d1-31241e9846dmr7600834a91.33.1748644845052;
        Fri, 30 May 2025 15:40:45 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf523esm33109385ad.170.2025.05.30.15.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:40:44 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] dt-bindings: PCI: brcm,stb-pcie: Add num-lanes property
Date: Fri, 30 May 2025 18:40:32 -0400
Message-ID: <20250530224035.41886-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530224035.41886-1-james.quinlan@broadcom.com>
References: <20250530224035.41886-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_154045_939127_B75F5090 
X-CRM114-Status: UNSURE (   8.93  )
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

Add optional num-lanes property Broadcom STB PCIe host controllers.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
index 29f0e1eb5096..cba227b19a5f 100644
--- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
@@ -107,6 +107,10 @@ properties:
       - const: bridge
       - const: swinit
 
+  num-lanes:
+    default: 1
+    maximum: 4
+
 required:
   - compatible
   - reg
-- 
2.43.0


