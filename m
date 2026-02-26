Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365EBFC590F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wTIDqyg2XC0iHi1WCfQ6EE8S6g1mAh63E4xVMCnsuto=; b=FPCpH+CsTglYIehBxPyzai2Rbm
	fyyfsP2MnE+nJjcmPu1SGezdh5Pcq94x9h+d3qNurqj5mYgyFJWygnfAPiFIs5vpeEPCB7LJkNjh+
	Yi4+Alp1lntORsMkZYyjsSlAwebaS6D7uK2aPJ3y0NuVUtYsH3RHGd+n9N/opwWsBgOIA6VcPRYRw
	3LM5MHrzFU74fFXnwJDUBLpifJVvH994TFkCk/AChM8eWhrdgXuQFjXUF18wUGMn9JPjIlPFwuG/d
	tQ+X7H5Rniw/yQRqBAVxMC2a3eyrtbDa6aTwvRwFVYPv9AUuRnSEm1QIlCtVLZ1WT5ecKkCNbdA/Q
	AKsB3/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX3N-00000005hBA-2wBV;
	Thu, 26 Feb 2026 08:49:01 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX3L-00000005hAY-1tze
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 08:49:00 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-824ba8f0acaso341576b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 00:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772095738; x=1772700538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wTIDqyg2XC0iHi1WCfQ6EE8S6g1mAh63E4xVMCnsuto=;
        b=UQphDThB8l+bk3mj8r+dcjrPBAeSF6CIkGxdEq/tsSidgNacZU2Ymv+J1LDH5c+6tW
         +mk2v8RRgOSNG5GCZ1RLtbREip/XfDihkO97piuMnFZkrYVJ+ThjtAC5gxF7vc6f2HFC
         DaPC8jBBiNneqxbnejzk63J01j2ec72oo3hPFNLzh8oWFYrJgfbUwTMGOQOr+FncAjh/
         o+kxgXqaGdHXWhEbvjxJSg2XLJ4fPBBDWoN/s5gERHEUAZ0qIFC/Uq9DI2LvLiehtNyB
         2a6E/Y5aQsIwLaHfIRPSLDsGWrhx3xxTrR6yLi88orKNVW4OWMQF8KBNEIGVbBlxdzs5
         EVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772095738; x=1772700538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTIDqyg2XC0iHi1WCfQ6EE8S6g1mAh63E4xVMCnsuto=;
        b=eIXPUmbS8GVs55mfdtuxoE9U2L4s8C+I7lKvdT1FWg+eJ7tBHjdc5nm7CvqPJB52/J
         HPJ5ONFEaDL7u2ukOvWNDQI3Mgu03uJzVp72W6by7TW4HEC61uVc93XLRfHGaDMskNlN
         ppcl5aeyio8zqX+CK06+UQw4MpNC4tQTVfq1XxLiRb7VfvSb0pZvqaUPOMVQJkX39Asb
         JSGOX79GthaLVFD0L3yFDe68uNqWZvjK6rT8lGvh7U7IYBb3kZqEJ5aJTwvNVnE4zRaa
         qwWQRVqQoGyStmEWG8ycwzdVicIoASOH/crLeibvVs+/bM836NrLP2Z6TVSAxBVMXUbo
         TRuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA22c/WUP/qX1geOL7UBSSoDoceDiCoHgD5bhi4U8OdfNkzcKxosMO2zyWfV7quH/mxEcXP7JUjYJb2hHKNjdE@lists.infradead.org
X-Gm-Message-State: AOJu0YwvVby4+JB/nz6cwwsFVelRWyIeuWbsH9wD9C7QCojI07DTNpqA
	/qr70/w69xe+SpQc4EQPP+UK+G0mRZtAXh9u+45U5qWmOPio6Vjq1Msg
X-Gm-Gg: ATEYQzz/gMUH5e6tEg1izS+0QoNZWap2t4cRPmtXVcJdvs8Gz8DJqBdfL/kEOZ+x+fh
	6dsqGTmh200AgupMa/QdyMYq8xnH9WXt/bF2KrF43PrgkzhuQVbwX5F1wKTGGsBuKsLahaqicas
	KcW5dF9fng4NKosDTqclLwBO/jVkLSZeSaDpiQtJ6ArJ5Zo07ipi1imI2zaHp5fkY2GEN8ZDSxA
	WBUNN+zDEt749r5yQuXk9SVi0OQ+/zebgcZ4AWZvNzB/kuA4uhNiazN5m0N3r8Y9hJsgtVc5QbJ
	bFpTZ7aBWY+GGZmua8W8vDyeexLUJ9LtUSVvZSEVUAtJzkjh3Ednf8tfJ8IFYJhPRk012387lvS
	Ekq75r8A84VENpUdL/qyphpA/BsgGHQa4Grg33d1fxz5cuX6lRe3Gt1N5ViKEXJ4nrvHJquvUOj
	Lt+EjZ2CFKkvZBc4FqDoJenUatgRfeozUXEJKJ
X-Received: by 2002:a05:6a20:9e4d:b0:366:581e:19f6 with SMTP id adf61e73a8af0-39545ed4a2amr17383051637.23.1772095737809;
        Thu, 26 Feb 2026 00:48:57 -0800 (PST)
Received: from arch.localdomain ([117.147.91.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa848471sm1342441a12.30.2026.02.26.00.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 00:48:57 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 0/3] board: sunxi: Add TaiqiCat A01
Date: Thu, 26 Feb 2026 16:48:44 +0800
Message-ID: <20260226084850.417731-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_004859_489581_76EF3579 
X-CRM114-Status: UNSURE (   9.64  )
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

This series adds support for the TaiqiCat (TQC) A01 — 
a set-top box based on the Allwinner H6 SoC. 
Originally released by UQsoft as a blockchain terminal, 
the device has been discontinued and is no longer officially
supported.
  
  https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html

Jun Yan (3):
  dt-bindings: vendor-prefixes: Add Beijing UQ Interactive Co.,Ltd.
  dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
  arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 361 ++++++++++++++++++
 4 files changed, 369 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts

-- 
2.53.0


