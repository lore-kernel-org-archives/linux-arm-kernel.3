Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6856CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 09:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzgyK9PV21LUzCc3kELjlfdCuadwZ4YNSm8kpUWXn6s=; b=xowsPlvWbcqybI5EB20fxznbCH
	VmzutZVTsTB79DbmwBe7GNIimsCe+D/6S1JzJ38gx1cKuWA3rvGyRHfi4AbjwD6M01JQTiVcjRKn4
	IVDWkwTOShjqxmjvKFA4KqiSwJ5my7MPQeBJYJm5/OapdxF4E3lqnxlkcgVBN0fLR4jxIpkQ6J7Ct
	snOdaaKoEJOvV3aLuuZBbl8bAc/mhjhyTNK1Qcyb/mbRu3r44nbIXWzqjZ25iOBbL/15+83uzNl+L
	LyWNOEemfsVZnA5ZSBAPAiQJjoTCWkPfSYg8L0TYrF0XcBxOQZNo+JTQkF9DYjhBsn3p0vGOVMy03
	vEJ/fR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iAM-00000007Xb8-2YcY;
	Thu, 25 Sep 2025 09:21:30 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iAJ-00000007XYT-01jA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 09:21:28 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b55562f3130so526804a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758792086; x=1759396886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzgyK9PV21LUzCc3kELjlfdCuadwZ4YNSm8kpUWXn6s=;
        b=gMVeg7nIb+N9I+cpgB++W7FDZXHZSITx+nCpJnVAX/tFQrUXVJB1eqxYiLaeyq1AmK
         GAt2gQ01JjQP+19lAn1TGCPQx8U0XXxBT6aiLWYD+SnHo81ZNeVYf+1VVv3q9+UUSzBj
         DJWWTVd2zuD+B9LabfSOxfWrCYtknTeJzxLez7mu1dUnRYmGX2uksA6/cpeX0UGsz5be
         Zh4zNsRFMjRa2Ddy5/3irccPPtr1eXuLFgxDo1RqNm9d0/33glxbtnsZWhWJ7dRFkT0C
         WEQZllgNSzGI/aZVs+Mmp1OEiXEnCZraspp4tSsQMVl/wh+DWFiLUGKOolJYSatWnfBz
         Q55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758792086; x=1759396886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzgyK9PV21LUzCc3kELjlfdCuadwZ4YNSm8kpUWXn6s=;
        b=it4SXev6o8XQ3sIK9FW3mzKmQcGIA/NtI73DxAyheIc/qvp8yu1ylYsHJyfon2DRNB
         JQqctJ6p5YTE7OOsAMV3R4HkynaMXwPi/0fmaGiaAWT8OqtYfSsSS11Jc1fBuDluIviS
         ZyLUjTmNqyRId67nm0SK9ZOl3Mm6AENd2HbdhKFE67qLkcJEUofnGUv1TzsEc5CKm0nI
         DyqVP7khMIceTtBRf5E7T5UEPPscQ/M+wI/2HfsOOJUIL7JMo8VEr7sDs3HPFqzpiycu
         0DUzZPhvlgsF5b71NFUK6gN69FiGp7XCzlgLKZWKAeHup+UqyOOaaVsgmEg9CmxWCOtZ
         WlfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXenwMQ62j3YEZcu2WlBiCZENCiJKfQzZfFG+PkRJmwh89bjI3aTYxL91vVLas3JRZAHh7FwZycjRpeauc48b3v@lists.infradead.org
X-Gm-Message-State: AOJu0YyxBp5DfV+8KPBKX444hllj7cemsRPOEARCq/9d1dON4f8xLwHy
	MGn8AMJrCplEMkGIb6vgbvybOcRZBj/TaYFlyG8oWVHqFsDPIeJP2FUt
X-Gm-Gg: ASbGncsE7UTND5ZFxd5hMKpppNsxTqhs/Eyn/deVNq/0Et749uWo41jGYKeIUr7CPTA
	uoTBB1+02iBhLfd/zSmrtHYERMnxv/6V71gE56xvTlF26pk8ht3xUTS+Ft25fjuoJbctwdy4jE5
	lHSVWblfoYMBVkypDEPt8SgBKSGcJ2bNeltrgZpsDQQdhk+R8eU/tBql/bbl6x77GzGiG4EMM8C
	8DgV58anZ+IYpl3F6Uv5gY8PkUzK49lQepY5WMvN5oSJr4YMMWREoFBStlw7pVCL0lC70c2Yc/c
	yPk/8cXa13pVsnNxDithD+dOIzFkaaTaewG9ran2YNcu4cVmtoTT5ew6/b8noPtiew5d22j1LTj
	EdkoA0diB+sNlJ62Mn9pHdkLjPBG9POsgV4SfFc6aGA==
X-Google-Smtp-Source: AGHT+IGuddAG2m+l7uqXE77ohvkH5b/2O2Eh2v8gCidWDhuRqQvkIR0rtKEWmswxBoMYHW2Mjz5AVw==
X-Received: by 2002:a17:903:2f90:b0:26d:353c:75cd with SMTP id d9443c01a7336-27ed4a03486mr32626325ad.21.1758792086107;
        Thu, 25 Sep 2025 02:21:26 -0700 (PDT)
Received: from localhost.localdomain ([120.229.16.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cdfafsm18251855ad.30.2025.09.25.02.21.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 25 Sep 2025 02:21:25 -0700 (PDT)
From: Liangbin Lian <jjm2473@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	kever.yang@rock-chips.com,
	naoki@radxa.com,
	honyuenkwun@gmail.com,
	inindev@gmail.com,
	ivan8215145640@gmail.com,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	dsimic@manjaro.org,
	pbrobinson@gmail.com,
	alchark@gmail.com,
	didi.debian@cknow.org,
	jjm2473@gmail.com,
	jbx6244@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Document LinkEase
Date: Thu, 25 Sep 2025 17:20:35 +0800
Message-ID: <20250925092037.13582-2-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925092037.13582-1-jjm2473@gmail.com>
References: <20250925092037.13582-1-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_022127_045795_88C2BE77 
X-CRM114-Status: GOOD (  10.11  )
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

LinkEase is a company focusing on the research and development of
network equipment and related software and hardware from Shenzhen.

Add vendor prefix for it.

Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9ec8947dfcad..db496416b250 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -873,6 +873,8 @@ patternProperties:
     description: Lincoln Technology Solutions
   "^lineartechnology,.*":
     description: Linear Technology
+  "^linkease,.*":
+    description: Shenzhen LinkEase Network Technology Co., Ltd.
   "^linksprite,.*":
     description: LinkSprite Technologies, Inc.
   "^linksys,.*":
-- 
2.51.0


