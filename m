Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D811C98331
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZSZZ0NcHIRuKJcx81Mh2IbInHyMIKpBF4sIqpjFN2E=; b=j/rk7ZrJ20hmDJbqCMmZCKwiwM
	ho0Fs8yUsFX/HkOLYmd0WHqK3cEOiUPX8+tn6MldONMLftACOdB6BLM5W6cDjxMOIzIqWz8cFRc+L
	8oX5aGgXZBqt8jBd4spGwy/KvWM590mTvzksmcVSfe90OlroQOZtPvG63VHpqqu8gsD+oqrvoOOsA
	zR8OPUxnTXNVcb6sbbH03tJYU40EGLu5VWG6fJEC1ba5bpOTAkXn9ue2nNvTNsUR0eglAEMOY18nI
	yZb6SmdjHCIjrYcNOdlghsBZsbf8oKbZLTxQ8baNO4ZFjmjChmHHv+JsLZWG7gOclxhjLGWp5/59v
	NCxdF9yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqzl-0000000C2FR-2WjC;
	Mon, 05 Jan 2026 20:16:08 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqzi-0000000C2Ej-1gwT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 20:16:04 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7f1243792f2so246938b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 12:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767644160; x=1768248960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZSZZ0NcHIRuKJcx81Mh2IbInHyMIKpBF4sIqpjFN2E=;
        b=p966yWxO6mAbMmcG3wfgQ5Tw9YJZBjwkz+jbXIY+1//BsRRyx6EupWDPGMRkW2Rv0Y
         CJoVQIziL2mBb1+4teVd/rGW61E0eCYBfUt/bcILWWyNxVI0pXxyvHUsGj0UM16ZIz7B
         C/wUrtoTnK98vEX2+z6eAtn6JErWe9QQykCrhPpr0qmtv8iYZQepWW2CvhCgHoeSQ49H
         D7+JHRjhL4Ke5isM2Ul+18r85JhCf9b4dGYkpllu8I6hq9035K0Y9rS3Wkd7h5mMTiEy
         ZK66LL5b06C9prPj8qA+bnB8tkyLMPrJh1K0WUFE87qn24mbFQt5Tp0UoaDKCjYB2hgb
         dMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767644160; x=1768248960;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZSZZ0NcHIRuKJcx81Mh2IbInHyMIKpBF4sIqpjFN2E=;
        b=pIpw6pO8Dhdu/GHMg69cN+oSMO/GdpwZMo+aMJwRPMz4dIz3uNRE0Ykls86oH5ad12
         AJKZelnZY13woxF1zqMsoP4aR6SekPjPi07YTLaF9Vs2pJN5ZKZtdnYd7xKO6nebOM0D
         5VOEqPriODjzc1lOhNr5OoF3HZxm+xnEyLzZfI3BF0tUid93Z6dITejfuXwe+XdLEno1
         wqoxq22XBeQhTJwmuFafhu7wVAakwr2wZyQCoFZhqBgnq6y8qivivhFQ4Vx95CHr8/FV
         H/4/5iYWORXXEyr9BI68Eik3ClOC1fMNo1ovIwd+N9xqz7gc8DpKabj+41LPOr0+0pAn
         X7rA==
X-Gm-Message-State: AOJu0YwDen5hIvQDV/jPvQjaUqbPKUY0VFpYVq94XXqyQuOBfuwLE0BB
	H8rBEyEjDsM/gL8qE7xo0LRg1uCKzpaiQaWDktJZHLWY0HZi+LN4ii/p+fGqbfqBTwoCmDw+ETL
	/VjltS8I=
X-Gm-Gg: AY/fxX7ZoE3W6Yb7itiyzzI1xXFugiSNmM5fmae27D690LAX2M4qkDGSqgDPkr1As7c
	zRTtzkb4shX3SUbB8c44siwMz8PAbcvf+rjpwJsRnUcwMHveFBwftJcHY1e4vlPAAk+6r4/oZaN
	Swv734GyZtcM9RvNFtb3Pnw+NOpTcpNExEB+JaZ50MqHlFqLCd5jPd5QJzW2waolswh3eveW3ws
	yfXA+/KiZuAHkXdOpBYtqPYPF3HBWvVT9ZIgL0h+jNSvOBbDdaoJewRKLSWiXnszJ6LKSxMbSEJ
	Tk4jN341oH/07++Q+k1khADcglb68lEOHty06JQXvft5fVHPw3SkSKEB3vERikbRLLnYUMbqtjq
	oJr6zomDx/thfmCXspWtTGMgsElTiiY8qsbGtRW1eMTK1rvt9eJnmd+QeE7fFdicuHXRyxVI2iL
	is0EaXghdl
X-Google-Smtp-Source: AGHT+IEHjjpFYWzc2Wq0J1oiLBzWArBe54oz0YlfSqH0xF0+40Jt6FjOez5/4L3fR9/GkZAWrm4pOQ==
X-Received: by 2002:a05:6a00:430b:b0:7e8:43f5:bd59 with SMTP id d2e1a72fcca58-81880383fddmr689923b3a.69.1767644160587;
        Mon, 05 Jan 2026 12:16:00 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5302c61sm22217b3a.42.2026.01.05.12.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:16:00 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, rogerq@kernel.org, 
 tony@atomide.com, linux@armlinux.org.uk, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20251217142122.1861292-1-vulab@iscas.ac.cn>
References: <20251217142122.1861292-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ARM: omap2: Fix reference count leaks in
 omap_control_init()
Message-Id: <176764415968.2561401.11587667060875531413.b4-ty@baylibre.com>
Date: Mon, 05 Jan 2026 12:15:59 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_121602_496468_4AE6C4F8 
X-CRM114-Status: UNSURE (   7.57  )
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


On Wed, 17 Dec 2025 14:21:22 +0000, Wentao Liang wrote:
> The of_get_child_by_name() function increments the reference count
> of child nodes, causing multiple reference leaks in omap_control_init():
> 
> 1. scm_conf node never released in normal/error paths
> 2. clocks node leak when checking existence
> 3. Missing scm_conf release before np in error paths
> 
> [...]

Applied, thanks!

[1/1] ARM: omap2: Fix reference count leaks in omap_control_init()
      commit: 93a04ab480c8bbcb7d9004be139c538c8a0c1bc8

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


