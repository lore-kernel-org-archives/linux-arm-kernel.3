Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C84C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 22:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6p7ER/Q3/oiPZqhTroZ/8PyX/B+RWKmVdqYgvMtMSKg=; b=xRbcJQs9dwekn7ZDaSUjjWbJRf
	Ug0PwRk0m7A7ZKkHzUtYVcGDUW+GlEYbvjyYkMDSI06n2S1sZxWS05yoNi0gROjUTXQIhbwT3SIlc
	j4J/b2D2Sz3QhhTCSCpmBMAi+z8djzyQMQCBIcpyYooBtxSWNgOntKGm/52smF51bFP3HVXL7Qa5D
	kX7TavLOc3RQPOS71dByWSKXukqQxw3WfZNrgmmlIJ54t6vjveNATa9wpOE2loaiWoBKQdUzfxwaQ
	0Mbi6dngdTSZ5JpImyQFgq9kZUqDK6fU/1CD+qfhyq3pVm8/s5BFpJmAYr+OU0y6hhQM8fkkFG23Y
	qcJ37sXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWHF-000000054hO-1oke;
	Fri, 09 May 2025 22:33:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWDH-000000054MA-0TAp
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 May 2025 22:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6p7ER/Q3/oiPZqhTroZ/8PyX/B+RWKmVdqYgvMtMSKg=; b=g/+3ez2b6KTcYfYd5OcUgo7Ok9
	TytL6BnwE1vrqysiZgxc51ko3PoDNHvNus4rhAN2oWIB3x2V9usb4k9TFl0+ZiIYueC8Gq32Z8JPp
	98lBaaXlXU43sa/hKwpOx9grQwSLiIaHqqVY27nvTj4tIXITcCfFqR67iEpctUvr5yA/vZStS6KB7
	YrtWbNpYjuzB/lAX4JhWYmCOTB1CBJMqWKYjBeKQOELcclncM+ehPUX4tRcRvShPMX7c1I307dUR5
	CzHHefrKRIerH72eQu6IH1cRhYXGsmxvjIypj5Ka9biF87dw3725PvW3nttiQ7PP0NJaxRL3v8k1L
	0z2TC/yg==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uDWD2-0000000GN4t-06nF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 22:28:58 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22e4d235811so37565735ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 15:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1746829709; x=1747434509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6p7ER/Q3/oiPZqhTroZ/8PyX/B+RWKmVdqYgvMtMSKg=;
        b=UdWoavFCy66IsfhHhcyeRATt59RQ1Cj1zJQ6mZixljvPsRd6fKx/uBdEPRfPgXY9+B
         9NJmdjLbI5ViZU3n2mZ6Kd9VwiJvz/Irnvrcp/1ycPCngu9H7UGNyrv+G84qMlV2olWo
         Z7m3P2N5Pw5qEh77FaoEcPHK7SAeAQWGZMnjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746829709; x=1747434509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6p7ER/Q3/oiPZqhTroZ/8PyX/B+RWKmVdqYgvMtMSKg=;
        b=WaatPHtUw9FkKbzNppNpHQWI1Z25GuQTjpwywsgRHGTmKdFsNsLI+uO4rTHgJqnszp
         APST7Gs/yJ4a9TrKj8f4noCwiMpKu0jqUueGcutCtUvd7ty8IKRi9hEpvB+fgkRloSST
         Yi9KnOQYL9NE2bTciRDDjbEmLD/B00q7ycZdlMEAWHv3GismVqCrCNHcjXI0u6HCJ01Q
         wXSJv0omqX+4IhIf376nIs9v6Y25IXPDwXKM4vfzfWu+vOswTAXYtu9YZ8V/9kDhaPca
         V59AW1Y0rXke0JpWPJQ/x+XZr+eKIl2Bnx9Lq2yCRLMyiUhr80nkk89+GlYE9X7DiyqE
         d3tg==
X-Forwarded-Encrypted: i=1; AJvYcCVMM7kB2xF3I5b87VahMecxROPw6SOeWnfKO6UZJJy2RoKRju2/OgeEzLQcmEcKc7JXBt1uetp6XY9fcMmk+8Kx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8rW/zt7yG9NNR1yHBrj3wKFDWtdQot7bPtsuxZCFzcQNQkdiw
	bLByIuWgvnywUsFdGrS6x8h8VP31M4h5Va2bfE8HFazBwtRPkac+PORwElYpPQ==
X-Gm-Gg: ASbGncueKyoYVe4okaJzx1ac0UAtvISdjZ0p90KRJyeEclDAIbhJIiO6hE46KL3k5sF
	YOnzTY8VaNI/NhmCsvOOxzraETkRx6zyWKpvcff5aBhn512ARYHC9k1cNd5iaLU1pFuCJhFxKW+
	TWlLmdhzIvyB1udUhSUe0GTfoGby3/yYeSXWpBje+kVQ22410xDINxoMPkJOZ8TYEZiYM0IMfm8
	HEO63kSA0qmtjeRdKoE1xXq6jX2uTEZWPixwQE1DqLusBN3B9tkHfgL1A101UOslihrrpykiNEC
	t4Mi2m9V7BLGsxxatoi8Pcw34wXb/T6T9pRWYtObIA+TBFstHc+6tu2FLgrbCy3DZzP+WY4uo2+
	jYG2XXcstvWFAVmUFyGNt1SI3lp5GPGo=
X-Google-Smtp-Source: AGHT+IGfUwOQRvWOeCWpbpI7bjN2yUkoA+0vs2CH6hB56pZLb+zEdsUnC3KckTOyfdQuyia/7g01Hw==
X-Received: by 2002:a17:902:e747:b0:224:a96:e39 with SMTP id d9443c01a7336-22fc8b3e2efmr67480325ad.9.1746829708752;
        Fri, 09 May 2025 15:28:28 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544fadsm22584465ad.24.2025.05.09.15.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:28:28 -0700 (PDT)
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
Date: Fri,  9 May 2025 18:28:12 -0400
Message-ID: <20250509222815.7082-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509222815.7082-1-james.quinlan@broadcom.com>
References: <20250509222815.7082-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_232848_156282_424DBEF1 
X-CRM114-Status: UNSURE (   9.12  )
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
 Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
index 29f0e1eb5096..f31d654ac3a0 100644
--- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
@@ -107,6 +107,8 @@ properties:
       - const: bridge
       - const: swinit
 
+  num-lanes: true
+
 required:
   - compatible
   - reg
-- 
2.43.0


