Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30212C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 16:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u9KepkG9ADF8hlHDnG82SdrNv29y89LUZ0AirKBzFtk=; b=rPy5+X6UWL+iay
	J2AXMdWDKcmXcDIZuKQfV9203krkb/HahhZGg+QPlBTvNLfaB9jctn6IBoiOlaXjw7H6EyFr9S05U
	yvhCTaaLbCpCaBkb5ZY1qyE1avjS5Cr9R+v/Bw2YWBGrDNiQpbbl1+u/gE97eqenZ217EPDZH5xQ1
	bXVk/+uwGymIO9iDS6fl+ub9yDqngL71VMIli2TrpiiJz+UjjUvMWovzc5VWocW3Aho6xI3U5Act2
	JtZLC445myow8S/ZstP1RoUsElQ9CoRfy0mJHHEenw9nWeSscJybMIMVfMavXeEYL/9jghrAQAZIz
	kZfdJ7KsIoWVTYgCPLzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Lhq-00000000AoA-1qis;
	Fri, 25 Apr 2025 16:15:14 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8K80-0000000HS5k-3JK5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 14:34:10 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22401f4d35aso29009755ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745591648; x=1746196448; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9KepkG9ADF8hlHDnG82SdrNv29y89LUZ0AirKBzFtk=;
        b=ihpby9Xv6oVQQ8K30/69uN7SBKlw2qdsWvsbG1ETcjksahhIQE1xzvMEn7iN1c8GGl
         yuiZfYi7nVobE42hensF9uSbqUQxMbZeRRX2swXa4WgbC91sHRM3OgzIpyKb6dyeaVdk
         0bUfanhzOV2YD5dOWx1d8MgNczeRJoCM7IDJnKCTlNv4lvVj863kX+SJlOqjloAwpaTI
         HzEmC9l8T+V24tmSFCrW+uHvRWigxxJILb4eOQQhJpzulGc9ZpLt/oTrc66iPz1Ue4KU
         jT7Cdw31R/SMJ+d/ndKgitxl5otn/lVB2I02xRgskTOxk+rpZN3zaxh4Q/0kbWRgh/8+
         IC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591648; x=1746196448;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9KepkG9ADF8hlHDnG82SdrNv29y89LUZ0AirKBzFtk=;
        b=MgcvOTjq0I53qWIM4v2vxweUk7qboUhUYivZPz9k98juGNKHb2FCLSZBR4vNchdhLA
         XO36+lfBvQtLDuxR9HdPZOQwg4CbhNutuYq+uMLkprIpAPV5EorUqD45pFb2RGtcDCXy
         lUm//DFCGmotXj2SbpQtmeU20Uxu93h4pfOZPp6OHXe70gGmEu8fWwLuaotYR5LHIQGN
         uUh5ETPRRSogFgMd0Ooh7u0e+tem2Ibeda4qN+E7+A33vnZampP8xm706NSX5Qn1Ssmm
         DB2Xhz6s5swh+73UlHW/nBeP0C3W72/vvXv+i6dNHdq6JtEXgJMyfG7uc/irHHPtJcme
         YLdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ+/SbUOzjslrYR6WctHWwjXDuA2mKjnKegSGqX/Ys6QkPwK1lT47kUjuCGUXA2UsHNIlhgoSRe1dHGaHRnxFT@lists.infradead.org
X-Gm-Message-State: AOJu0YxlLlkbfYUNQkW9A+tZxf0BCFHzyGRwR+79oQc0vf4l0DSenZ/V
	Jwver1fYdcJJJhDSL1pqyx5jHnJ50SQ8ljMPkIuT7/djXdMRx/xq
X-Gm-Gg: ASbGncvHmd2AoZvjT26Y5f1Xc4KTRqLHbx0kRlNuietZhALMpnP9+YBVPy6bzbO78/K
	02y/qyP+DtfD+5/L+eh7aV8xoS6a7rnWsXrllLuvzW4CtmP8lRIxlNDQr7ylqc26I0NQILHy04z
	svWChlYAzcrCPKv98hwWtETUHx8fr5INya8WcCOi+cgMdUlP8AMezwOKB9OkbMTAhRRB037slii
	FLAOZBuNnFkuP5cmNbHS30GIRmzL4W6CS3TEPfG31aqfxyY8mlwjDYL9c3w3vyuVKlipUUObDkT
	R8HBGbvQXWONo5tC5UQGEMO7mmwG6/KJlS8/CFsII0WhficJsH3p
X-Google-Smtp-Source: AGHT+IEXIMb7CIazyiiisniO4P91K2jYStzyQ95nSmfZDQraAf/H0RTLBmKhNw6lqAWT6hUdXr0eiw==
X-Received: by 2002:a17:902:f605:b0:224:584:6f07 with SMTP id d9443c01a7336-22dbf62c3d3mr35874785ad.37.1745591647822;
        Fri, 25 Apr 2025 07:34:07 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216c35sm32860695ad.233.2025.04.25.07.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:34:07 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v4 0/2] ARM: vt8500: Add VIA APC Rock/Paper board
Date: Fri, 25 Apr 2025 18:34:12 +0400
Message-Id: <20250425-apc_paper_binding-v4-0-0ec2d0febe21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGSdC2gC/33NwQqDMAyA4VeRntfRVqvdTnuPMaStUQOzlnaUD
 fHdVz15GDuFP5AvC4kQECK5FgsJkDDi7HJUp4LYUbsBKHa5iWBCsoorqr1tvfYQWoOuQzdQ1YM
 GoeqGMyD5zgfo8b2b90fuEeNrDp/9RRLb9p+WBOWUN/bCRGnyMLdh0vg823kim5bKgyDkL6Gkj
 KqqNkxJWQkGR2Fd1y+KQ5Ct9AAAAA==
X-Change-ID: 20250418-apc_paper_binding-8feae286710e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745591663; l=1668;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=cCyWwMZFerO3tMEM7NbWoK6zKcoVgBSQgFmaHGU8n5M=;
 b=jCuEdMsGFwM92JrEuldfW5WVF4fuh8Rn+o3+y4vBoI3fAB1NFyJvUUhK3z9wvaElEwvvox7Sg
 x35Ce6v3xeKDUl9dvTIwOeZfvaPkDWHOi551+RWe7USRruO27oalXjh
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_073408_829152_F927741B 
X-CRM114-Status: GOOD (  11.28  )
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

Add binding and DTS for the WM8950 based VIA APC Rock board. Paper
is the same board for all intents and purposes, so reflect it only
in the binding description.

Split the series from v1 into several chunks by topic so as not to
spam all the subsystems with unrelated changes, per Rob's suggestion

Changes in v2:
- kept single-valued compatibles in a single enum (thanks Rob)
- dropped the empty overall description node
- Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-7-f9af689cdfc2@gmail.com/

Changes in v3:
- submit DTS changes together with the respective binding change
- Link to v2: https://lore.kernel.org/r/20250418-apc_paper_binding-v2-1-17c9023b7c9b@gmail.com

Changes in v4:
- fix typo in the dts Makefile which went unnoticed due to a previously
  built .dtb file lying around there under just the right name
- Link to v3: https://lore.kernel.org/r/20250425-apc_paper_binding-v3-0-846b0855420e@gmail.com

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (2):
      dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
      ARM: dts: vt8500: Add VIA APC Rock/Paper board

 Documentation/devicetree/bindings/arm/vt8500.yaml | 23 ++++++++++++++---------
 arch/arm/boot/dts/vt8500/Makefile                 |  3 ++-
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts      | 21 +++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8950.dtsi              | 11 +++++++++++
 4 files changed, 48 insertions(+), 10 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-apc_paper_binding-8feae286710e

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


