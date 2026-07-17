Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C35C4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwJxTFnJ5CXL7SNwJ3FzpgAg/ebATche5LLJ2ldkVUg=; b=dfgD6w5wIae6NYexcE47hdSRre
	6Z0T6GhHI6HwqdjgpEMPtJIsy+GBn9+ntCdBo490QI0j8Q7M1d7oGkl8WuucFNqokMjwLZ2CqY29q
	ffL5hosXiWg9ae4ya+9AoCyoNI2snBCe30pnzGjdRgBCSJp2VHb/JE+QNGROyHOILZjZEJsC5mDBG
	J5SgrzrewHVchTnjPDDGIjFis89npwCmKSeVVNLWLuXFZiOcV6ICTiLOb76c09G/u9UrhTu8NGne0
	yKM4jviGWufnBgJKpXecUFVcm5ZzFGZrd/94vQbNH+FehL7Hl8oB+VvyRufvEmwqQnl4LbVkbf7vR
	8zVmNvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkca1-00000001M3u-2cH7;
	Fri, 17 Jul 2026 07:01:53 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcZy-00000001M2h-0c0z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 07:01:51 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-51c2b2c9eccso55329611cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 00:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784271709; cv=none;
        d=google.com; s=arc-20260327;
        b=VC+y5/bcGFw1KCKnFseyOw6eCWahFHQCWX1IIjNqMDnd9JnO2qwMIdPZGBP1yvLKqs
         8xGvcW+gj2/dPyYe5Sj5YU3+3UrUbgK7Cl2vAR1jtxxCPex9UF/cKoZZAbNisw8oyhQj
         hDcM7PkgW1bwJsUHpVR1XuKfp5Ioa0DMZTjPezln1CUAxtf6dyyXRFevuHwtbC411wO1
         Qo0TS83nkpStUQ8DXvEj1SUf4ccS4KScBLgwjys5IRcVync+vxccaqxightB8/2W7BTC
         3i3D3xkAhVz94eRve3kGSu/v/ebzYp4S7Y7QUZ3k4g+zeuuqLCoxwXAsefgfH8XxGFnV
         v1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RwJxTFnJ5CXL7SNwJ3FzpgAg/ebATche5LLJ2ldkVUg=;
        fh=L0vQzhMXaoFmDi6yn6fRLshA8xAvoSpYHz96K2sR2nQ=;
        b=FvEun814Rmdxmd11vlHUbbRNAWN/Z7ReOXG5mXylEhjUicIaOsx2Z0Rxr/RGNSzBhq
         Q+tSB4LNFkgvdX/FbLskSMHrpAFWMXNzkIimuZYuiF/ivWs/muXDVjtaKDRHVH8NsqEV
         gNBA1UdvaIVoazd1WeBtl23rFMbElk7lCBgUQHLM+tQVA9XWpRtSUueWPgO6J5HFcLN8
         Fg7ilabwpsw2JtA0zhJv3JeB70TcwVIXfM+Cyj4/f99PNNPq4tjlQQ6vjFc086E1LtMF
         OyazGkONS6N9y7QgZvsFh34+cmbLBr6WeFm4gMGQUdDVjj15ZBt+Bot/3ytQM5xnR4nX
         wuiA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271709; x=1784876509; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwJxTFnJ5CXL7SNwJ3FzpgAg/ebATche5LLJ2ldkVUg=;
        b=mbtPmDy/wQlY/399zTot5WpBM09xF/LvIyBxgnSYtJw7M4ANMz6jxId7mLdlc0tEov
         z/m4vlMleOczOCf0VqCtn88kWo7foUDFyy3fY4oRR69ocyKH/0KIAH/uxgKp9/8pAArc
         EHobTx8nuWFHyfAEjEJhJxT3hTNBNBsZ4SH7l6XMsNXMoYrjzJHAFFl8uKI+bvyHwP1Q
         f6VNcGF7rKgxZLezYV/r/R8rBg5jbubecjrIMVj99Pw+vWY/gBy1WBmT6kBZxyeANQ2e
         PSGMiQFv5fWk+dxmISX5wCEKG1UuTc9fVJh7U0xCddTdJ+q7F76jnR0tQjrlkJSnluI5
         sBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271709; x=1784876509;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RwJxTFnJ5CXL7SNwJ3FzpgAg/ebATche5LLJ2ldkVUg=;
        b=OmJ9bxMPbD1USb113RfqPYKjKG98ou1JiyB3sJYvIYvoCUUwQCbScmEMnKKlEH900x
         pxCmu/4cPoltT2WFEDFWmtAIaAlgfEJLxR/6VSCofBDaWK1sPE3HCMQRb8SVIbxp30Nu
         T/46ty1tHR+Rr6HPT8euF0iELJoL6h82E77k+u8miYNULHOHGbH4uXOY5kJsSX5rcKcH
         w7wYp3sPkLIGFyGfLO1MLnKj5mYcFnZZajuS1+ut2IX2ckSoq1LOzeM2+lTnogHqPPYy
         Okv99tni120f8spOpQxfOHsRECpNiTZyThhm23Xd22I9qb8uidCrLV+MTmA/obwkMJyA
         Ge/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpZ6t11IWGExkzh10bcjUZasIatl4nMpdqxPffOw4yBWkYN+qL6IZLmyg1ze4++KPwU8dtxMl8fZlLEyecySCy8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn0y1tso+5z2Y0EF4AWcD8N4N4edTlaR9up80GqN2DftnyuGqf
	ApjAwbG4+xbBTIxmLJJOmAkPKdGkJGiygs7qHBpA34WJBVfu/9ZPWGYkLgDxNLL4YsScWvImyt8
	JJx6sA6xAVC9QSnxiE9VQpZOPPBz8+Qg=
X-Gm-Gg: AfdE7clsQmsyMxSNqwHg6xwR65KyC7j24/tCmb8k0N+SyH3MMGhY/iCEdLSqE6YXo1F
	CGd6XdKUKpC5+CEPgT/wxujRFjgUDrZk9fHjT7Ul5QBTucYw0WruV0rFBxcEDxWT2Fj6zZsxQAq
	7IPZMi0fpWxLAcWJ3lvX8e5xOuJmlyEWMD6LHwa8pAsLnFgLUcWEu/KNofBkVkJZeG414MDAK3z
	sO+JWT2cGALT22heua2Jr0sSkCdE6P1T7SS5elBdCEjzJGBWBJGQ10afAhNtffc
X-Received: by 2002:a05:622a:1307:b0:51c:73f:e3a7 with SMTP id
 d75a77b69052e-5213c9db3f6mr11147141cf.26.1784271708847; Fri, 17 Jul 2026
 00:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260716171733.300885-1-akkun11.open@gmail.com>
In-Reply-To: <20260716171733.300885-1-akkun11.open@gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 17 Jul 2026 16:01:36 +0900
X-Gm-Features: AUfX_mxBhDopugmTygQCr_ewrvNPScsxhXpSrlqnE3VeMGuqzfUam913liCneCI
Message-ID: <CAKr_iV4=TAKGb829nXWBBiPkQHo7dFyhT41K7+Twv=VjaEypyA@mail.gmail.com>
Subject: Re: [PATCH 0/3] soc: mediatek: pwrap: MT6589 + MT6320 support
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Flora Fu <flora.fu@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: "open list:MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_000150_192654_CFA24164 
X-CRM114-Status: UNSURE (   6.00  )
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

[PATCH 3/3] has a bug, I'll fix in v2.
Please ignore this series for now.

Link: https://sashiko.dev/#/patchset/20260716171733.300885-1-akkun11.open@gmail.com?part=3

