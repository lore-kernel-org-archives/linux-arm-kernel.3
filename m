Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA954C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 14:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vlj+8st9s1ial1PCaVYqpAW72KD0VvGynWLvNKngKj8=; b=a+9/ROnnIxA9zV
	bHhWbm13waTTwa8Dxc5Xjc6KW2wQOYEE3fUOYHags5StIviSdNWg+aPT/rYnl7doKf/SOqLlEitoB
	hDTlI36Rpxlv/uWE5q0FU9USsQ2nOeAHC3TPafotq2zS+N7z/NF+/t0gwPrVhYCHBdC4xP1tiAWkH
	bYT4T146IxQMVp8JVxCR/1nEIZgZ+wELdtMJ/IWqBlHmqxEgC0QA9xCfWPsvylkJS0tc7aKQM9suq
	ENw1lyeYQZDuowmVi4kHVdav9xT1KvSSJ8owyuoRox1w+IKwiw4J2fdfcJNAoDkFFoDAxqwNHCPH2
	NPBpWiPuRSkj3wzCGzwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTSa-000000081Jv-43VM;
	Mon, 11 Aug 2025 14:25:12 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSyW-00000007tdP-3yN3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:54:10 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-76bd050184bso5767381b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920448; x=1755525248; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vlj+8st9s1ial1PCaVYqpAW72KD0VvGynWLvNKngKj8=;
        b=KmXFz+V9Yg6QBApxs2WJX3T29tdbVLIUtYUqgjfAoagq9PfivPLrxYGMMjdR/Ysm/7
         JWNykuP1tSypzD+h36uBp71kIlNUjbHWctaY11Goe48dsi+AhPrRzCPLfWyAq5IbeokM
         rF9qT0spC9PjW3dsOgFEAIEWhoKr5CAPQnk/fr08By9/LKI5U+cQcwvS8l1goV9GybKc
         qj2fwGcAUVcLqLJKFmg/hSXIsOa+RDkxbY1S9qul1f8ls3t+rWz8YdQj5r0GNB8fSKCe
         +qf6DGtuK8P8d490gwnuANFYTGYrnAPxTc1Eq5is6KHOtsqyzulAqFr8rsUUQM9d/USt
         ik5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920448; x=1755525248;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlj+8st9s1ial1PCaVYqpAW72KD0VvGynWLvNKngKj8=;
        b=o+fEadL7QyTAQP/ejTV17rLelFwfZSHZ8EKY0S3pV5jVJe1tr4kK9r32d0WuzUhGK6
         b1a9ASQ8aa9nWJBKcyJ0hZYeQxFpEZdPcafC+8YxEZs/q0eF0srY/Pb+Okautm/WZw3e
         7POuA8lKeoXUXCWwjtXGYGgh0583lQmtcUw3Hi0C3BNKqVh8O0rT0nB/ayRO/VGgWgi0
         96yIuR/Qgfo0/GOL2UNuBf8HjphT1xPp3T4MiKuQUUq0PRChi7jMMu2kZ5C4cKR9x+tn
         R8hphNHOlj+SEW0pBP+uPHrWjwTScXuph1fFcvrkCxRGqCR3sn0+kvQvPUBwzU2tSYlT
         d2ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUiiFo7svEZ1Pvcv0iVJnKN1Va8zmp6PvKvK8uSJ7da8OvfQMbANUeyYyjPmNmUR+I7X/5ggIipDWwkKA9yT/KW@lists.infradead.org
X-Gm-Message-State: AOJu0YxEFB6xUCM49EiB4SS21C7/s3/nuBgadglffcCDaypaoCuGZook
	wiECxbT52rnD5xdXlx2YdKrwp0YexfNWTxpAM0WLbEtGaxUSo6R4F3aN
X-Gm-Gg: ASbGncsVbsf6MVnUXOC3zlgTY5jr1gUyEEkzc4i0QTHIGfMD6Ov2weObgJFb0YtJAjm
	FvM5LddvSHcVZKFGxPbVQO7PBR4CH0bqDTv5NQ7adxssgJLT6NrHYt67WBQQRA75d6UE+8BOPfJ
	Cg6GdFBXG918OZI+P/MEzHsmUeeJc6jfhJFZDovWHXABqnNwSU82BXY8o/NQ9EVRe3je2pJV+t/
	LPzmJvc58eqyipT69GD522FlpsuJgjAAwd7bmULvseI7yZVar/H4yUEjVkk4QrYPIbkIwNPhSRe
	WizbDQNTfU6I1kZ6tw+APWliJntfxZwSq8vzwIFYYpIlnA9RPaRcdFYPa1HnrxZHJGWBKfMI61v
	iYqG8RPRFHx+Xgot7b590XP7y+fRMkUzj0OciQDrBCpdTO6o=
X-Google-Smtp-Source: AGHT+IG/FSIkhBsB8MYIghrfDMWXJJBKX4WzLZgOKcea0kw9iCgD5rO28fF7tUtsnoihFXdUVlSIgw==
X-Received: by 2002:a17:903:4b2b:b0:240:70d4:85c3 with SMTP id d9443c01a7336-242c1fdca54mr165046445ad.9.1754920448139;
        Mon, 11 Aug 2025 06:54:08 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-241e899d272sm272976285ad.135.2025.08.11.06.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:54:07 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 0/3] SPMI dt-bindings and nodes for Apple A11 and T2
 SoCs
Date: Mon, 11 Aug 2025 21:53:54 +0800
Message-Id: <20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPL1mWgC/03Myw6CMBCF4Vchs3ZMrwqsfA/DopQRJpFLWkI0p
 O9uxY3L/yTn2yFSYIpQFzsE2jjyPOVQpwL84KaekLvcoISywqorrqWQFuMyMpa6bFtTddo4gnx
 YAj34dWD3JvfAcZ3D+7A3+V1/zEVU/8wmUWCrvbWuE9JU8taPjp9nP4/QpJQ+g2D6u6QAAAA=
X-Change-ID: 20250527-t8015-spmi-838bb49d34ae
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=o99NnlKBN0S1UL9crgyLNkOiVsvnLtsC/PZuyUJcXx4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfX7NEpsrFvYewCeECdsNAB5GZ3v50nSN1cVU
 6ovTW5ONaSJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn1+wAKCRABygi3psUI
 JHl6D/sGsni5nK8sgiBvYX3HSSA5wnrJInj+GxT1f5lgNRwBZASQDREhEjCGS1Pm9UQMi0mY963
 iww+WaDqU9547lDdszgQptU6/Y+Rs/fspDCY8qO7asJCJJTmHxtajPGRt8s/N4MdPMudBHE1A7A
 ed2s8CLdf2Cw0FkjKJLqBEnIVG+33D4JzKS5VPJftVEHZrs8CL1hV3SkIfhrzBtRC/PrGhFMf5i
 NDGQWSsKJ8Jjz2AU0eulMvjcyIoTq8lVApjq643EB71zdM4jbIUjbxzq0JNmCuLe7h5SVPHiwG4
 BOHCXgWbPwT+4JvIGi9gWLrtsD+IL7zL5V9L7S5IpaPyuaf+XCkYCRIa3BigH5yiATYHfY+MuRZ
 nVg8mrh4AJ92qcqS95eyv9UGxkhwAplv/YufDG7ri73gIAXnA0rc+l0EqrwnNQ1/qEUh6O9L+Tr
 NBB4evbMUob+0lxLefP60bwUWl52d3RWrxLtavnX36WcEPJUVyvnEdjc36uKK1Q5XqzYZWvKK7s
 EQo/JJY+xFtG+DdZM3+hHzerO7bJbDqhf3ABV5V84KJVX5m2/HAsxYWx+8FueKS6Fbkal658On5
 ZIoPo75/93g6s+GxWqRts050MjIPR4RCICNYi9LsP/pbfH18pwTet+OhKR31oWwg8jX21CglMTe
 mm5RBIFvGt9o2gw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065408_992285_D5D33073 
X-CRM114-Status: GOOD (  10.54  )
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

Hi,

This series adds dt-bindings and nodes for Apple A11 and T2 SoCs,
and the existing driver appears to be compatible. Drivers for the attached
Dialog DA2422 and DA2449 PMICs will be in a future patch series.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v2:
- Rebased on top of v6.17-rc1
- Collect Rob and Sven's tags
- Link to v1: https://lore.kernel.org/r/20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com

---
Nick Chan (3):
      dt-bindings: spmi: Add Apple A11 and T2 compatible
      arm64: dts: apple: t8012: Add SPMI node
      arm64: dts: apple: t8015: Add SPMI node

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 2 ++
 arch/arm64/boot/dts/apple/t8012.dtsi                   | 8 ++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi                   | 8 ++++++++
 3 files changed, 18 insertions(+)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250527-t8015-spmi-838bb49d34ae

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


