Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFF9C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 03:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0w0YO134zBV85YwnHp+km6pCsaY5x0vppPkNuKA2EU=; b=SQ3hD2KqX+IUwYyfF792sAxAxl
	dmXfOxvXw7QQ6oVBGVGo+2BawtP3pvsY1STRBdtDs8jIyg3c0W+J/GdtWxH7kJpUIdJD6TxHO1X6d
	xZCJeGvA+rIndgCgUcqDo8/ij50ZQuWfzszHeBg987tk0lhlw2VT7SiqbtSt09irAofpWfgO4QWWE
	TGOAVxbxM816JlkoZlpZ/kQcGvoJh4/qhSu9YsON7le71gB8CWUqMWYpeT6GmXSyX76Mj7dXATsWC
	ZqK8bnoPE8o1uHwVX9wgB3l65pfg4KMm6653HtaZQV6/o4DF8tD+Y+5mCnrzvXM4wKkU1KsxEbMve
	f8nfygEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqMsC-0000000FJ9k-0DOT;
	Sun, 02 Aug 2026 03:28:24 +0000
Received: from mail-ej2-x03.google.com ([2a00:1450:4864:34::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqMs9-0000000FJ8I-0o3B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 03:28:23 +0000
Received: by mail-ej2-x03.google.com with SMTP id a640c23a62f3a-c15f8dd6f18so119996366b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 20:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785641299; cv=none;
        d=google.com; s=arc-20260327;
        b=fK55zSsmyQ9pXSUUOyN1Leh945Jlt4xeRBNq6I7PR2cD4OYt3/daol0V+fiHcS4qx7
         cSTROt9W6DE9S6x28iMvhO2TojMyLS/OYVYvnNfb88vc5dKxoAjEhgG1IQgKXe93K8je
         /CzBTulyXPtuXnKX/q1l54OvtGlqDnEcIbm/z1Shg/y2kSBWfj9Fl26FE15+fEIEKQ90
         wAW6LIhu+JRt3fF4tV//4u/yTEPoa+C6Scv9OYC7u4nPeBc58EoOKZ7Kg3AmrRUNx8Mk
         Mm+elmzlZri4FfDLWmoyGRbW13pEwlcUU02TOZ1HYw7J4qvdbtHpQEAEowGM/HVa/9Y1
         EeQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/0w0YO134zBV85YwnHp+km6pCsaY5x0vppPkNuKA2EU=;
        fh=1DfCznldfEZ1UF7UfOa4O0GYXP0LFLccSUbRZ2rN4Tk=;
        b=HkT1m7NAFsiiJjM78kb/SCGjmgz1Ky6LGCh53JMGYoDdegfIFy/1ChBqGchyPGsNOz
         OK86ewTkNrpPiICn9825TCevkDWak3wt01CaRS0V0YTkFXGKfwnCWXor4F0pxlPkxpDf
         AKNKhQmVXjnJcPWYD5Ge5ElhuInRDE/DUvOl1i4d6U4KIEw40szvf8amhzk/CkZXAPfu
         STE8iMyj4bQlvhue4F8T+cID3vLylL19SZjWhWn1w6W4xojWdcbQVVbbPFI/EA5XJ4xj
         TegwiYULnsI7beDOkuC4M/eZ89OT/n/t/fUv/OTAaXIibkUNhjjiXL1oEYMeevPLQXsT
         Jxhg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785641299; x=1786246099; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/0w0YO134zBV85YwnHp+km6pCsaY5x0vppPkNuKA2EU=;
        b=nngi+JHYnNGLJxw/hxhV1KJKSyAzCwFCE8UnrNZM9iTJojangKvckyIQHOktORKegL
         VRYnIluk221IdyccQ3BB5dZEvvjH9bvlbrwZNy+MLiBZqu4reZVwHAmFrH0mdshcsy8n
         hwtPdSKi/2hjFpsVm7YW5xHSRrrOb4lnOmNjS0JJpporzvJ93jCI/qpyI27evTLw3FTb
         f7LCI4yvMaPcwjXa3QUNpsW93pYI13D69w/qs5R3AsTMnvnYqomEFQgBGcgLjyjSkugl
         66nc9d97yf6SL7fT8JuxCfWA5JrKek8NrxyhZ6bYw/UA4JV3nIYlJ0jEQrClZJdaMfFO
         7ivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785641299; x=1786246099;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/0w0YO134zBV85YwnHp+km6pCsaY5x0vppPkNuKA2EU=;
        b=pPyHHpMJI4kzw5jXW6muP57V7fYZYBur/N4CKH0/ityy2UIIQezkoq26D+a3lfjWfB
         HoQkB0+BS5dGKnZ6+oQ+2qR6U5SToNm6irEQjgjgmKZOr2TCUGMYNLhPr+mx2rhmRztt
         /GLkzbUY/IVX3GhSdboDDmFxwo1s5O02mPEIbS8Gm3LpS6q1dyiMAWAgI1XXNDZOutf3
         luDMmtJozDep68faIBA19AlJJeL81Iw4sXbLE+7e6jigkJSP0CqCJ8nMOiltKshpDj1g
         CJRfZw30AP5srgCvwzGdc80GE7Ezlsg7RJuJaCTC27GrqQAnV+Heo4kxVA6MbqCIdhNI
         YzQA==
X-Forwarded-Encrypted: i=1; AHgh+RoueHntdGHwxZ38z2DInNKPEdaVQT6sUIdSWzQsjkKmfRbakP2XocFxRhFdYyHkqHooy6JmukxBjgurpGyFfBqX@lists.infradead.org
X-Gm-Message-State: AOJu0YwLsLD9bWupyoYmOdbz70rEVobvfM1QGQuYSBsp8PdcvqebRexj
	63jJPAGD2AZuJ7A0bqZKDOC3BEy49AZJZFbaDWJOpiPwGRZt35Q5hO4rhefHksIV+XvZwDByRaY
	WLXUeua5Var8ZaxHJiATlbPG3mht9mGE=
X-Gm-Gg: AR+sD11BRTVMV15X3PF4zTBvQs9gISaadP6qKj/TGuUiwV8GURfoaOh5Myh2gxf0mMW
	bS8itCukzxdzNTnYxvPy/+4zXpwsX9gHwnFFQDX7loKpFsZ+R7x2c/V/bDv1UkDnniAnCVhlU+v
	LeCd5Khpkbhs+1W04u2jvCGnCzspjF/ePpOV40lAc2Etq0QMM4ZvDFgwjzV/PwYL3ySDNJUyEfu
	snZMDaVF+4h3AODBQVX3E9a6mcovPL77cy8zFdk55zSVU63smu2EslhZ9ryh9HO5onVdxogkiKE
	nC7M1b2e3/Db4R9MUtgsLap3LWz9EQABTCTOD8rnAqD+0Z1L1fEm3z8XyrQ=
X-Received: by 2002:a17:907:7b9e:b0:c20:768:af62 with SMTP id
 a640c23a62f3a-c200768b973mr9148266b.22.1785641298865; Sat, 01 Aug 2026
 20:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260801142244.679437-2-coiaprant@gmail.com> <20260801142244.679437-7-coiaprant@gmail.com>
 <2847036.GUH7pLUipS@diego> <CALj3r0gqvFZPb2SKRMPwf9chCx076rwCnXEoOMFch_V-fOKV6w@mail.gmail.com>
 <0e9d16df-7332-446b-9321-ce3de3111ffa@lunn.ch>
In-Reply-To: <0e9d16df-7332-446b-9321-ce3de3111ffa@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 2 Aug 2026 11:28:12 +0800
X-Gm-Features: AUfX_mx4aMsgyN6RI3IxSSP4ztvHebSR5krnQ6YdL4RSbunpB8OT85Rvkz3cx3w
Message-ID: <CALj3r0guMmNRN4EBbKz7stPNMSqkLBvms643YXBEDMzqHHM=FA@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] arm64: dts: rockchip: rk3568: add XPCS and
 fixed-clock nodes
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_202821_240736_411DA68B 
X-CRM114-Status: GOOD (  14.95  )
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

Hi Andrew,

Thanks for the detailed questions. I've looked into the clock tree
more carefully.

> Do you have documentation for these Combo PHYs?

Yes, the information is available in the Rockchip RK3568 TRM
(Technical Reference Manual).
The relevant clock tree details are also mentioned in upstream
discussions and patches.

> Can these clocks be enabled/disabled?

The 100 MHz input clock to the Combo PHY is a prerequisite for its operation.
It is generated by the SoC's internal PPLL and fed to the PHY through
a fixed divider.
It is not a gate that can be individually enabled or disabled by
software; it is part of the
PHY's fundamental operating conditions.

> And how is the Combo PHY fed with a clock? Does it have an external oscillator/crystal?

The Combo PHY is fed by an internal 100 MHz clock derived from the PPLL.
Specifically, the PPLL runs at 200 MHz, and this is divided by 2 to provide the
 100 MHz clock input to the Combo PHY.
So, it does not use an external oscillator or crystal for its main
reference clock;
it's generated internally by the SoC.

To summarize:
- The 125 MHz clocks (xpcs_gmac0_clk / xpcs_gmac1_clk) are outputs
from the Combo PHY.
- The Combo PHY itself is clocked by an internal 100 MHz clock from the PPLL.
- This is all internal to the SoC and does not involve a board-level oscillator.

I hope this clarifies the clock architecture.

Thanks,
Coia

