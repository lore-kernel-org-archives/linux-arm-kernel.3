Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388A6CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyA9WEXalwEvaOd3n4YiMQcj5LFG3ePfGKY54JOZEqI=; b=LenRBIoRyXczQAvv0tzQRzhnaR
	Xov4WPVDLTX5XFmtYIaYpCsyzRfzqScHjAiooa6AYxfdARQSYKuqprSaQSugGAzNqr9idp+S73eiu
	7ghgnrrjq0jQE/lRY4Ygzl9QFIEwi1DoE7XYE3szhwxIjpWybuXbG5YaN2O/DsLOAJgXcDgfiuxVG
	wfyJ93eJ3a+3n2xtYr9yEckwSWXXUsi2BhsOb+sNPdm+XF3MFHNB6lvovXEs7iotDLX6kFnI+XZXz
	2K6sDjDe59/SUYllZ4GBuEe4b0mnpSDs3S0hodTfY7v8OEM5CJzqgjtBmvpIRM2sCDJiKeF7vNEy1
	1xmOUqgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVhX-0000000C6wd-0aoR;
	Tue, 13 Oct 2026 06:09:27 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVhU-0000000C6wH-2aNU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:09:25 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2e8662d5e95so13741975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 23:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791871763; x=1792476563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QyA9WEXalwEvaOd3n4YiMQcj5LFG3ePfGKY54JOZEqI=;
        b=I1RttRScvzZ3v4Ax7kH3kyLwU+BiUdXdf/rQe/4+4Hwr/sDO36V8mdmhQbeY1A9Qfn
         14IncS/ygfsZyNJxTBdE4iFmR7ASmSoEnjT1X1Ou3Z/yIiE1+SYtNXGYVOjMLdnUlEWn
         O5mEwQ0LC3e8FXrIYPGlT5DilQ7vJCvus4wrqzlETiu4Crexf6kibnzkB/QkmlfwfYS/
         Gladjqhwt3V1hria4/vbBqYGyHMxpM5rRR7ki9VSuuWXtWlMjAwe5Y+kDPfLBU8MStpp
         mIGhBGE7UtxbJ3PWib0MhQvHeZduIdoJD9hrv2JaqAcHwfsDU9yhJkFUQ5Bi0mf9zvh6
         /sEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791871763; x=1792476563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QyA9WEXalwEvaOd3n4YiMQcj5LFG3ePfGKY54JOZEqI=;
        b=pn378pBl96HYGLqXGc2dZri9GDQk1x4gpKfp4Oj42LrMBkBCYk8edK/Y2kYWOWMURB
         NdwCHR32ogLNdN9UHoEe3GDdX/iPdppAF8H27vE8gg7ZUVs++9Amvq+dE2c34Ho84UvT
         lmKCVEl5HGKc7dUDstziC7OXNSfHyLdfdAwasYRnPrpfYmBqwaAeNnh95eXAl0Q1DDEV
         SWnXmAo0bgAneeYuTZX9Q9um4EHHKTfVA0LKhrTEteHIeULed0U3NV7lva/YckcvPFLI
         h4hI+SsUuFyxSMJGvKHhsML5I3jqln1edcJ/W8k2nxtNnA0RZEr/RcktFuLOzKKWEcF5
         MiaA==
X-Forwarded-Encrypted: i=1; AKwUvBw2IAGoLF7LfGz9cXFZUWbHsm1OqAlgN+NYrfD4SC2ZQXWHX7TZkKrf1MP9C7m9YFesnwEwZ1RfOr2/lJvV9J0H@lists.infradead.org
X-Gm-Message-State: AFq9FYJWV34n3Nmu3qFV7MwfgxqOfCzMcFdfPQrUkSCIMQcxYCevq3tO
	HV3wccNn3oSLiSOsF/hv8U/6aBTQZ//nGDt3s+K+P5h25Yzkj73GluMY
X-Gm-Gg: AYBFou27DCWL9aNU0hhV05iOFKf3dfbYl+j+7neWyfjx7Y8Ky5SN9NMoNzN2ROQdtT3
	HGdQzBSiNh9bs56lFluBYAYc0y+IMiS1hkcoYHzayzrTsYUa9jd7IMJVNT3Qb7jeciWwCc3Jn7p
	/6r8HLBuQVX1ib0m/MKLUh1919F5frrn8U25UaEh1CVlMp0E9ejpM9aLjovV/GrArtZ0g1HV8V4
	WPjof0jgZiQzRJOUdFgEyow/vRNII2lvL/MAID4o1juv2dRQ3af62JM2TNt4S9h+6LPAaW5a5v+
	LUIMge6Q55d1Ln/rgDiZGp0iDTT1JLoyk4cdrrtgwGUaiOyLwq++JfKBBjRzw/+KyZhm3eeDWF3
	qUpDrqzC+1FKxL6/VFNH3AnyAcjNe/nHCLYYfWRqtD20GAR5U5HYE1pPvQk6fHPLcu2e7J/EIPs
	Lu8vrvFu1hHHYg9LyZTeq+oxr9nhMTdUFFRyceQeeRkxv1jhMeMu1Z6Z4jLtXaPkV5WR3hyeaBp
	BmViJX9VSU=
X-Received: by 2002:a17:902:fd85:b0:2e5:cf33:80bf with SMTP id d9443c01a7336-2e842e14d43mr108812335ad.56.1791871763534;
        Mon, 12 Oct 2026 23:09:23 -0700 (PDT)
Received: from online.mioffice.cn ([2408:8607:1b00:8:5e2a:b6c:f432:a6f3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841432a03sm50770475ad.0.2026.10.12.23.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:09:23 -0700 (PDT)
From: Pengfei Zhang <zhangfeionline@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
	EricChan <chenchuangyu@xiaomi.com>,
	Simon Horman <horms@kernel.org>,
	zhangpengfei16@xiaomi.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: xgmac: do not treat TBU as a TX event
Date: Tue, 13 Oct 2026 14:09:05 +0800
Message-ID: <20261013060905.2777418-1-zhangfeionline@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179185976266.2527009.17600570633406382637@kernel.org>
References: <179185976266.2527009.17600570633406382637@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_230924_659072_E5848914 
X-CRM114-Status: UNSURE (   7.62  )
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

It has been tested on the hardware device (not publicly available),
a DWC XGMAC with 8 RX/TX DMA channels behind one shared interrupt.
The numbers below the --- in the patch are from that device.

