Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F64E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDGgaqN+RyNFFUIhBmxwJa3uKb6CA586OOHT4HO6pCo=; b=ViYM5ydXvB03OzeT4vlYmFf1JX
	kOIevtkj0DPHUtyN6/rg5EKLPIQKcF9vzsGJY/+SPgWf27glWlNV9pnOPCZz1z6vh5PMoH4e3FJit
	quCgF9wCbKHITuEPiYBH1cC8BFWteTGsw2qs9lmjewkDGHHjGbRm7hWh65ZW12C48zHR+ggAP4Zlt
	M2IFGeb/SXSuXlxuUwrJICA6aZP6Nm43KNk0hyY7+FXSQE5HXoBySuXnMCJvCP+JxebOIUB2Jblz4
	SJ+IRy0PwrBSoFFsaUrOzU2xm/X1WICOjGtdyw2EJR0w+4dI6NZwbNyASq0Nyd9rpExpxx3gDk37u
	80jgeH/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAWK-00000000Iz8-1Bjz;
	Fri, 27 Dec 2024 13:36:52 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAU4-00000000Ii8-2pds
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 13:34:33 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2efb17478adso8720383a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 05:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1735306472; x=1735911272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDGgaqN+RyNFFUIhBmxwJa3uKb6CA586OOHT4HO6pCo=;
        b=x00TyTpfDss8BX9kDLt0d1IbSV6yzKWNhwyls4+YJyGS/4hxKhvK20O4bIG7k4/hh1
         4y2hMpE++1nPdAYCeuGSRRdvlEOXgmDfDirktHhwL8UWjn7F87MIDGrZzR6tCQIxsVTt
         uaNHn+V53Zg8qDy6fxj1YHRsy4+1e+w9vND/v+dqZUbbFBPgzRZAzQCXoICD7f8ZP7cp
         xgBCtzkyeMyOgfV/LLahLdOIYPrEKWL1mQhzGrwgUnfnodgF7+/uD1NMxBI1aqUM/H6T
         hbTeIhuj058miVJ9gf5b9p7PoxMgs5raitkl8RkehBgFcgt0Rfo57dC9v5HamBQ77uPt
         GtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735306472; x=1735911272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDGgaqN+RyNFFUIhBmxwJa3uKb6CA586OOHT4HO6pCo=;
        b=xF+VeY1rW0l8h9LYwieDpW8+BINHpBXs2bggPcqjVTcMg/vKfgtcUMyQx0ZmlVj2S3
         GJn6okOmimZ8LZp+cFPf8m9qJ44clBDyJ11IGm5Pp++La5Y/WQfRUZ1bboAeDh4BUEh7
         TNtj8cvys7svEu9r2Jj5mzsnnlyEIYY9zPVh3y45bmTQxJeViZmPi1+OjIt1VKm0tc6g
         ehXNs4F7kiEfmGZ7N6DGPVXzrVx+5SvtQ2odnh5OU0QIhUonbkXstt5ZtXsBQKHBslWH
         E7UvndYRhSGUO5n2adpL1SO8MzUwIAefV+vtBJunMThoMP7Ag14o4zFMVepD8ACWLpt4
         7LYw==
X-Forwarded-Encrypted: i=1; AJvYcCUbaBppGrlpBVdIRp9O6ACYkjfT8vzUBIemHml1ArYO2DjdVM0rLm+52DBAMu0AVwq52iDVbv3V/EM46dwr39TF@lists.infradead.org
X-Gm-Message-State: AOJu0YzPYcrgzHRnB0JXNrHmTe4RKOQP+e2Dl4Tsd/M+KAPGgWk+9n0v
	5XVydNzXAZ+Wk0Da64PVO2zW8G2sWq1qPA83/nsFW0dOWPzhv2wbCkstbzIYgRM=
X-Gm-Gg: ASbGncvssdnRpSXUiJoyPs3X6t8v8GJxivDsqiwNC8/LOpIPqpk9NPaf56ugWj5xb16
	qirF/LPfdSubhv47FZlHd7CC/nWr3RJI5EdqAqhf0D9VQYBqhgSJu4H5BINi05Iz4yP+5nULtVS
	2i7zLfqWA+nfQjtK1xqSjPsy3I8aqnb96L84aZBqo4++uY8yQDTn8m1RGWLGvopbpuB7aighKcl
	Vitt72E7RCTccjALC+rNAS7qavJ3jjjga8MGjVMoAx0H083UIqnFudZu/sy6bNyIx1/MMY=
X-Google-Smtp-Source: AGHT+IFo1pADb4rVMihXewKTUfgIpGRLw2CQ2m9p8MRM9fVgylT7CDtLc2bBkTGmWfrKx/vwilzdkw==
X-Received: by 2002:a17:90b:6cb:b0:2ee:863e:9fff with SMTP id 98e67ed59e1d1-2f452e22560mr40951589a91.10.1735306471825;
        Fri, 27 Dec 2024 05:34:31 -0800 (PST)
Received: from tops-ThinkPad-E14-Gen-5.. ([103.217.239.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4623dbfbfsm11808238a91.48.2024.12.27.05.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 05:34:31 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jagan Teki <jagan@edgeble.ai>
Subject: [PATCH 2/4] dt-bindings: arm: rockchip: Add Edgeble 6TOPS Automotive Edge AI CM
Date: Fri, 27 Dec 2024 19:04:18 +0530
Message-Id: <20241227133420.169714-2-jagan@edgeble.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241227133420.169714-1-jagan@edgeble.ai>
References: <20241227133420.169714-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_053432_722888_2B0FEC41 
X-CRM114-Status: GOOD (  10.01  )
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

Edgeble Edge AI CM6C is an Edge AI Accelerator module based on Rockchip
RK3588M.

Edgeble Edge AI CM6 Industrial IO board is an evaluation board that
would compatible with Edge AI CM6.

Add bindings for it.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12923..709a13835c9b 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -132,6 +132,7 @@ properties:
           - enum:
               - edgeble,neural-compute-module-6a        # Edgeble Neural Compute Module 6A SoM
               - edgeble,neural-compute-module-6b        # Edgeble Neural Compute Module 6B SoM
+              - edgeble,neural-compute-module-6c        # Edgeble Neural Compute Module 6C SoM
           - const: rockchip,rk3588
 
       - description: Elgin RV1108 R1
-- 
2.34.1


