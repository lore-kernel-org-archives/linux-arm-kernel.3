Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAD0C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 04:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2HXiX0Llqkid7BbKxFHITtAYArqMyUNvEqqrLum1r4=; b=vpd7QL3/NGcfYieF9K6345SPO2
	oWxETxQg/rz9BepnxB8Zl+t6i4bX0btIl1VygWHuzsx+D8odfpmLzmjrKsGDl0nYk8S6Wf60+zhNl
	Hkwps2NhSBPAOJRHD1C/vxjuEkzHe2RoeXVPyGYwFGNALZdOQlZFUhuMAPV7usS1WJfPzDmBvO/fn
	xggtZEs3HeyYOyChtVjori9C62qa7DRC7ETSlE+l/nrXCeuQiel06LTH+3RnVnhnw1pDCSSG8KXFE
	t8hcy6ZE/DNblfVIbPCUDIBczAOa+lvhuZVzoKUuT9Pb7s264h9E9wuBA+oYRdSDAV9S4gYSGA1jN
	5NO4PRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6M78-00000002BH9-3RIn;
	Sun, 20 Apr 2025 04:17:06 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6M59-00000002B22-2hKR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 04:15:05 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-227914acd20so32254905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 21:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745122502; x=1745727302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2HXiX0Llqkid7BbKxFHITtAYArqMyUNvEqqrLum1r4=;
        b=VnVOnusBVUxNCDxgpRiOJkackKNKenxckAByD97l3ruNtuuecCmXqC5lKiWk7t2xpx
         JmaMaKFQdc6m6FpY7o1Pg0iggVsyGAvcIMQZTuV0K5Bet3Vbs8/a02FNd0/OpN8A9o4v
         B6gUmLhNYOquhh4SzoyXBqaUYr6DZDmRWy2PxsLoSQAfGKiDEdgUEHtnUu55cg8iTmvX
         KFiiOAqiZNKrxb1XGw/d6leDFK9p70g0snTdjEtLLdHDLQvfIjIsHtZmyMolxSnIalaw
         Xc1mH4Y9Vj2lQEoJ5AYJR7h5927dhqHdrQzBSm6BFniW5vTu/ixlDvxv3mr9Z7JJitBV
         crTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745122502; x=1745727302;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2HXiX0Llqkid7BbKxFHITtAYArqMyUNvEqqrLum1r4=;
        b=nTR2a4cMZ0y4A8Qx26fYbcvYRTeSBp/H2IWfLVCJP0dKzwEhkT4bWxHlnDnkS9bCak
         iJmXgP1BacvXkGp3rmFpYUe11NIGB4WvgMDDi8PjmvCd5wAuMGiwAjtexrhQ8lhOovlH
         ONkNPU8buBAgLODOHoflXQ/TpXDdyEdkZrB5N1aKR46qvV9W1bWpZPAclZDHK+pK8I2a
         vr+9oJjeC6i3Zy9a7WavNc+bSf0mXH+8TwBIQbwQxXzKveaWpyObICvJu2auiEg+Hes8
         G2Fuxx4o2qzXRba3mwwjKhLPx2tPpfH6T+hKwxKoroUxYO3XPGjv5alHSzKVScDsIFzb
         WeHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyN0YIvgXGYXuxik/nt0tgMEmzOSEMYU3JVnGFWBpXXyzb405vxYwsZpd3pD0gavxWtOatbXAh8+StHx9dQ4VJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7supJGrjTOHJBX+pziFpytazedNflnZXwztZ5HfG7wStMKaBG
	y17/OGsckW3BCjQg0LVM0Ci1490+ECA7C/5fb5lhfRpScj+gBZv3p6fKWQXTwg==
X-Gm-Gg: ASbGncvQY1ih6fK8n5rDgHTAToG6llDHvcCj9ooEy15lsPd61l/6X4Yd4qiz/3kISRC
	tpjvPFCIG7AMkskgWEOplVxRP2yhzY+O3CGBpfNOeJbJySzIKpwtnwnTH/E2d4FCuecepb9yfRq
	uf//WA5vgHzL781aQzw2JQ6q39QhzlUN8x75c0eYCZJTItTpceojYj/9iwYZwJyz/BffgR45b2/
	/ors9YSAgoe5yBSeFwgBYeFREtjd2NLKWfNv4XXbT1ZNS7rdey/YIwNwOOa3VT7EpFVO6Yddyxq
	/RVTGieMyp2AMaVYnaVMQ4HCl88OBkQueenPKCMDB4Wmlpy9p4Isyw==
X-Google-Smtp-Source: AGHT+IEoRogqNsHUePuqqRRfsSxmfzIJqF8/P5aLwK+/NB/DXV9xoYPlMraILqGL7x+DlXFdEmPRaA==
X-Received: by 2002:a17:903:2f81:b0:215:742e:5cff with SMTP id d9443c01a7336-22c53ef1653mr122737365ad.16.1745122502501;
        Sat, 19 Apr 2025 21:15:02 -0700 (PDT)
Received: from [127.0.1.1] ([36.255.17.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fde851sm41412575ad.239.2025.04.19.21.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 21:15:02 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250414214135.1680076-1-robh@kernel.org>
References: <20250414214135.1680076-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: PCI: Convert marvell,armada8k-pcie to
 schema
Message-Id: <174512249875.7011.12246888223550931495.b4-ty@linaro.org>
Date: Sun, 20 Apr 2025 09:44:58 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_211503_706371_CF6F8BEC 
X-CRM114-Status: UNSURE (   8.46  )
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


On Mon, 14 Apr 2025 16:41:33 -0500, Rob Herring (Arm) wrote:
> Convert the marvell,armada8k-pcie binding to DT schema. The binding
> uses different names for reg, clocks, and phys which have to be added
> to the common Synopsys DWC binding.
> 
> The "marvell,reset-gpio" property was not documented. Mark it deprecated
> as the "reset-gpios" property can be used instead. The "msi-parent"
> property was also not documented.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: PCI: Convert marvell,armada8k-pcie to schema
      commit: 82f48c8c83f576edb2614c49d0980f8d65eb4772

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


