Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E7AC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 14:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePYWD2iTRHxJu1GtsXub1IW6UWPr8JBMi02BG2MjH5Y=; b=mMCBt5LQn1hgjXGA8jIdHghhQV
	SBci4xd/uVlXBl0uJvAV6Md0q2wfw/AlueOk4BdFTFbyWTm+tkVxJZ/ilMZTyxtuOKzfWHq47axNM
	zEVBy6XFiSas2VxaADiBG32t/8r8AsZKgwqGmTSDNNLevvpV5B4qHHBIyrQpB9Jlr93R+gH0QSaiJ
	8uKbfjvX0Ea0tA7VaN2jJVTFd9jvDj/mNPsbuHh0jG3ObajQTkr/44+6r8ej/DhjuKNy8Oa3+gTtq
	vICjzkWZkFvzHD36A8SShtJurrWaLuJmo97M8peEoIP8pbuKOxDGY5uL1Qfu23lfEf1851gx4COuP
	bMm4IobQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXwJ-0000000C23I-3j8T;
	Wed, 22 Jul 2026 14:28:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXwH-0000000C22W-29rS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 14:28:50 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so35224305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784730527; x=1785335327; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePYWD2iTRHxJu1GtsXub1IW6UWPr8JBMi02BG2MjH5Y=;
        b=kKaVNLxSvHaLWWDACHm7kHLOKmuXVhRyH2pW2Vbh7b1AEQARw7gl05coQYyu5Vu5K3
         us1mlEI6MGidB7/ld+FCVkrkstm07iVqi9ZGhoS+5OqscybwdZvt83RqB/MkZavxjrOt
         yuOOvQbC9ZjeBfZaJ4I4+suFnw3bKB+qD2uaM+R/x1GI9xR70UZDBnCuxu+HgneR+WAl
         N/46ILIji6w+c7rvyVQoivylvC2J0nI4yVgN+F+AhuNwhu6BfX/GIXhJEZOpdf8VuPiG
         TpZH+xb9uONMYzPNFFJLnJmbGRW7hQP41Q4zl7FfK18QyWcqmh3W0Sxpo4586N8Ei5JX
         xeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730527; x=1785335327;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePYWD2iTRHxJu1GtsXub1IW6UWPr8JBMi02BG2MjH5Y=;
        b=Do32at3PJrZVBBKLhLE9p1XAHiKj1m1AkRjqFdJn8zspTeOx/qCle6Wxn9RkkSZaeO
         Y9nNj5WjTV4oH/63xXEZ1c+SA8exj6ZMuIDFGjfA/HwpKl2IDiak/qzczEvdGJkd7dIR
         bvYEgNRVHR9DOSrFI2i9NkRAZJmdyGP+I0SZSaWLo+czz2bmYxdJzO2f1UEuYO7g3auK
         TEsFBtgVilQ8AkD01TMaN7izC6HarOEVhg0XN6pWFMt+VdFy2GuFFmE+vL0AQ+WXXs2a
         A8kyq6sKGZQY4Cv+ZvUzjx4ijo173U2pKIc51W/2t3w4yi22Ek6EiVnd9RDMRCX3C0Z7
         FbXw==
X-Forwarded-Encrypted: i=1; AHgh+RqKTbHkaXeCJ2dALtLxlJdEVEiLJP6Z2dvUrI+y9EwN1pAOYcpzfIMx+PYAgA0snq8zHs6w9hZBgEIhsLJ+4iwT@lists.infradead.org
X-Gm-Message-State: AOJu0YxWLRFksgQO71BfRTIvtlFOWIkKOj3TqZ0I3HI0sd93wnvEut/E
	Lr6DMmLwd/44U67ixinWopv9QGUAitIrX7KccvamCGun+UW8/K/LMWbAcIJ8Ml+GtQ4=
X-Gm-Gg: AR+sD113Jwvlp6yK4qL4IsAAr4hCf0JUhqQRNNmiMGmo8/sAL5VuINy2Wp4UR9BNXr4
	2wq2X06qi7M4p57Rf3is2+hN7n4vlmple9/DsGT1X3EYpsZf9VyKxnGiNAW1avtbEtHJ2Q5ruT9
	8upH34yx6aUpfV082xc3ebLR7ox80SqC0bt4jcTNALzCOqmW8Hp3bY9RnKvakDc0vVhWwOxCz/n
	uoefbG99leh+HMZJ3rm2Xq8TfqUuDlt+LWAIg/FHeouYOZMjAPrtexYdiwVW25Sul/a9l20r5NK
	tj7IADz5Cape73u9yLrEfYz5c6B0Wnr2/P73oTl/J6bY0R62bmdAHpKy4XC85q6pRm9fQEr+KMH
	bfhH+qOzUWJNGVifMfssiJuYAwfz+1NceeiQL7tbq/FBaIhrKhcim6Ni4kqWhObh3v0ENFq4T7H
	99jkqXUpfJgFy2gMKl1XWCU90=
X-Received: by 2002:a05:600c:4755:b0:493:c2cc:aecb with SMTP id 5b1f17b1804b1-4954a51590fmr286003695e9.38.1784730527209;
        Wed, 22 Jul 2026 07:28:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c7desm218995045e9.7.2026.07.22.07.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:28:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: laurent.pinchart@ideasonboard.com, jesszhan0024@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, thierry.reding@gmail.com, 
 sam@ravnborg.org, Leonardo Costa <leoreis.costa@gmail.com>
Cc: leonardo.costa@toradex.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260623195741.495734-1-leoreis.costa@gmail.com>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
Subject: Re: (subset) [PATCH 0/5] arm64: dts: ti: k3-am62-verdin: Add
 Toradex Capacitive Touch Display 10.1" LVDS
Message-Id: <178473052640.1949706.11360946998734187321.b4-ty@b4>
Date: Wed, 22 Jul 2026 16:28:46 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_072849_566087_1298BA32 
X-CRM114-Status: UNSURE (   7.44  )
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

Hi,

On Tue, 23 Jun 2026 16:57:36 -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> This series adds device tree overlays for Toradex Capacitive
> Touch Display 10.1" LVDS V2 on Verdin AM62.
> 
> The display addition covers two interface types:
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[2/5] dt-bindings: display: panel-lvds: Add compatible for Opto Logic SCX1001511GGC49
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6ce748682f746a0c1ae311191fb820b08151ddb6

-- 
Neil


