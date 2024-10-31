Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E6DE68949
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 03:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CO26Xi2ZufcZQHF7GhqabRMsgC0ZN8foXoQn0KomRiA=; b=b46NNPjO0TaMoDBr6HfONNn8EX
	CEdXdCMq3G7E5gy7X1o7vJ148F8UcF0XPt/EqseDaTMbAxnFv9eF1abRq/6VhwaR1/aQhw/XEXSN3
	qT67NwiC81tExv3uEJjhZ6T5aTSDHQDx+Y9TCHTAoRnt3BuhGSsTn2E5uzwcDIEMqX5zgCxJhBxZf
	8D2fah4d0nADIab3R9uDk6gNVvM6KaXTN+rg+aFCHwN6CdeODA2+JCZKBVbC8FfI6W1QZ+X15p/zh
	5qZdamkp9FO2LnhuM7V7kTfeqlGrQLmgScomEIPSIPHYQxPH2Y/E/jo/5PtQelmJpwOOryUrFOGbL
	U4Q3qkaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Lhh-00000002Pr1-3NIk;
	Thu, 31 Oct 2024 03:18:33 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Lg4-00000002Pkd-130M;
	Thu, 31 Oct 2024 03:16:53 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-71811707775so238152a34.3;
        Wed, 30 Oct 2024 20:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730344611; x=1730949411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CO26Xi2ZufcZQHF7GhqabRMsgC0ZN8foXoQn0KomRiA=;
        b=KYJm16zMPtSnxywPYbNpopx7KidrvHYRfqFM+Yg8ndp6NDI2NpzyNwVzq2Xo6CzofD
         JDyExxe1uWvzeTWpluMmdXFtQP4+ug85/b6LsPognlZQiaAWTf1rk9y1UniifU4STVth
         JRrDT51lNUQmyetDBAYRjiSXALXpxcdm8smEQw0nSIlmsDQJpxDmVa5zAcptAHpodTVr
         emrz+kU9T/lXhKJPosecAkJ3POnEH5JjFEQCocWSDBzC6QAL6WloI93cJPdCIOzfd6So
         QZvapUY4Uk/9BXG8ECx4hLR0eUYd+hTRfpNnuWqIeHzF545O1a59DNH6pTEMT60qnPUr
         owSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730344611; x=1730949411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CO26Xi2ZufcZQHF7GhqabRMsgC0ZN8foXoQn0KomRiA=;
        b=Jseg6yGynJJFC+5MPaELpXvZq8mM+IZyF5vREmRj05+qV6WSUuRy1wi5OB+XJ5l2gb
         g5IVYHE00FuVoyECRznwLMN4vu1z52d4XNtNONvz7zhBtbQ2AaNNwJhHu5IABVXQJpM8
         2pGLSlRPAwhnIfopS8m58yrrPVAa1lrhSxCPQhX72eVTsLZ7SrAFgFww/43s9f/tE52F
         dh/p65wyty1bWXnB8fHHb0n5N6Nr5c3kVJFK8/tiiEScZ5xJcLwwM1m0nGFq1G5+3iqN
         eG3zpOjiG99xxC9ku5g9z2a/ukhn1dvPyImVg8nnFYI1+f4d2aD9eboY/QDRGiChjQh0
         BJgw==
X-Forwarded-Encrypted: i=1; AJvYcCWSDizqri4Nv3PGBKJWGn7p69m95N0/LAaQ8bApa7eXv/E6NookhBUiR2RZAXAaZKCTOX5hQoB66W5LReN+HOy0@lists.infradead.org, AJvYcCXglxg87VrI0rsfl5W6NHuFkdPfGLNskbqyy0uGb+MSNhA0ex8B6ykmRFodf/0fa4R7F7hlmaTtzIKZpAQNICY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzC6Dep5kqqmsHQ6XQbLzuM4RnABeMCKRoO/nPhGagEYGLqFtey
	XYccNnaPDupiug0TD4/Y4BOHmuawkRU9J7+tFqnrA7UihN7cnDbh0M+NQPff
X-Google-Smtp-Source: AGHT+IF6GBjpg7aD9uHXCAQxv+fE8MgSqRX160sLvM/GKFoARyjXKfUi+zX1I5r0cAwC85g+cotMjw==
X-Received: by 2002:a05:6871:5822:b0:288:3762:f7f5 with SMTP id 586e51a60fabf-29051dd94d1mr13569271fac.47.1730344611458;
        Wed, 30 Oct 2024 20:16:51 -0700 (PDT)
Received: from tower.cjhon.com ([2603:8081:ad40:11:4dca:6aa0:ad60:9b88])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2948742a0bfsm270149fac.2.2024.10.30.20.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 20:16:51 -0700 (PDT)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ondrej Jirman <megi@xff.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2] arm64: dts: rockchip: Add Orange Pi 5 Max board
Date: Wed, 30 Oct 2024 22:14:49 -0500
Message-ID: <20241031031528.23428-2-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_201652_308593_35E77072 
X-CRM114-Status: UNSURE (   5.25  )
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

Changes in v2:
- squashed commits together for initial board file

Link to v1: https://lore.kernel.org/linux-rockchip/20241026100310.52679-1-honyuenkwun@gmail.com/

