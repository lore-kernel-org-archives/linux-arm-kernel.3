Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC965C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 18:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OemJiih1sslqSbQP4J3cbLzB8Lyd73Gg/1M0pWEdtY=; b=WOfa/iCPwFOnIKdLcA0XdpwtYJ
	zufXVN4X/giS9tF+7E3O2eLpyvbnx3Tn8UYJteBdTpsQYbMF6fIzBx/N0Yp295VY9mqpH6d/Bk9lM
	D4nJwtMUVT/6itxVDyX+V/t1QYFF8fBopD54CAtI9nI4HI9pZlwtA5o/g1UyZ2KwQu4CuwcrXsRnQ
	s1Y3pq84Bgf71+tnN+QcvcUmwhc93uRbShM1ery3QF+9Mu6Wm51GNZNL6npAYqWQrALf3oq4ll+Aj
	F8tfBMdieIr3BN44Or/QZJYCplQ5pX9ZWZTGVmpFzMBLeLga1qnbf3SYRy7ez3BJeXpJXyyFzWFdA
	yLWsHnPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16To-0000000AG0P-1dOa;
	Mon, 31 Aug 2026 18:11:36 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16Tc-0000000AFvL-1DUQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 18:11:25 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-39266382df6so3212088a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199883; x=1788804683; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0OemJiih1sslqSbQP4J3cbLzB8Lyd73Gg/1M0pWEdtY=;
        b=cPCJtLGLUHDJXrRHd+Lo1ZhJSOxoZYm7andCbK1oFPhXOiiDA8KccJtFVtZsFlt4kr
         v+zk6LnuTcItGbI+KxISZNcj3ublDFtA0jndvZdqOfiVrquzxenkfZMrBertp/DmWuFx
         gshNtxeKBqTB3Xc7PBnigrDXCcLrMWAnZl518FcZHQQeGlLExEajjSAUU7IFk6hngPRh
         llGs518U7e2x1ILcBs/QYRvHmtsM5PcMdC9bIOojDmNsmTUMfxjPg9wCIr5B+QGT0n0N
         TgyJXVGYWRtU3/1fKmjeTOqN0GAEZnVPhERpLYYi9aBi+wEvPRzJH2yJwf5sZultCM8z
         ed/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199883; x=1788804683;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0OemJiih1sslqSbQP4J3cbLzB8Lyd73Gg/1M0pWEdtY=;
        b=YGzLMk8mOR8PtUawJqCC3yrNkab+5fopDGUXsMOwvtw0sKU2fYsaMohSvnWffReuGy
         NA5t2MSBo1xzcudi9TMAJxV8YTaLwVCBs+Jq9vnzajMc5/Y1dv7Kad+9yWYwMAmwmfqZ
         bNWSm1LcBG65jh5ZYqW/10gxCxxGp3iXY25d+mNdlTJiXlcACu1K4KSlcH7HUkU69ftC
         tKDU2VlQdOEhnz+0JJEJo4IVjkoDyS0YNSgClJEb4bXHlG/SmIsafjx3hy2sBgAP+ek4
         Ym2BXDaoEgreNCYhwqCUqOnG8q/j6RfSkBneB2B/Zip8V2siabp+588/h/P481UCFo0U
         wtGw==
X-Forwarded-Encrypted: i=1; AKwUvBxd92+KQGoMMxsuBb/YWLFJVv/hLh5cccULrFxoKON527QgS62vcKXX65k2Fr1Lel9ebbJs+Et9OzUWjTdQuOsE@lists.infradead.org
X-Gm-Message-State: AFuF++kVtBV7D/E+uCX7LQ18N+HoMVbOcoXgT1JTQCOtl3ali1rAEIK9
	j9XbeoLUiVred4RGjF8UQO0QOAS1hB7gx1QDMShhstk+9oYtgKUfALl2Looicpd5iTw=
X-Gm-Gg: AYBFou0Ln7huRGlc+Dw+CQKcDI/4OnlCuQSFo375RR06RsSUPybNwioZDbhFtf+lGPU
	QC70roBQWgdhKUlVpFjMuLODqML0KM6M6Nh5JrWsToRm2CbV+zY5Vdo9MbREN04ERzDow6vJSSN
	O+tCn7BoR2q4BAzKmBLeFgQgWAIXT6e47Q0Xy3C1qnnOoi/KlrVQxZywiWrR+tXri/ns3SwCLsF
	AZTqOO2HrktmKSdzdscveXV10H0m/RWgdSw2nler8WVUB54Kg+2mPLIZks4yAVXY/EJINAJ2Cvj
	gIIlzv3pelauvA/sGaN11wUZkd82RiLZ1UOQ8s7l6RKjNbquv7O+lqqqspb3UOXFgq0b5RPQYPd
	+yZ2b8cm7z7zUZ9AzyOOqtV00mWeJPEh7+TM5XCwluhDh12mqyyl6JIlSKZeTKat2V7DUy/8gfn
	XrH0zx0g59thfoV4MzjujBJpGGgzoLV64Z0wzDuJbPqiA2zUxfbhw/pCky7g==
X-Received: by 2002:a17:90b:4a02:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39907ab0960mr2402339a91.2.1788199883302;
        Mon, 31 Aug 2026 11:11:23 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-398a2f5187fsm5504006a91.1.2026.08.31.11.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Enric Balletbo i Serra <eballetbo@gmail.com>, 
 Javier Martinez Canillas <javier@dowhile0.org>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829194003.107677-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194003.107677-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: ti: omap: Replace spaces indentation with
 tabs
Message-Id: <178819988246.2869653.4070159664676583942.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:22 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_111124_334765_A4F378AC 
X-CRM114-Status: UNSURE (   8.13  )
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


On Sat, 29 Aug 2026 21:40:04 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Applied, thanks!

[1/1] ARM: dts: ti: omap: Replace spaces indentation with tabs
      commit: 973ca75604c81c985224624f685f0365e1ba78bb

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


