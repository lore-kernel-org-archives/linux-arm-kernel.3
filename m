Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120C9C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tTr+RGt8QXwsbvuUoMSTPv8PVwzNX3CqkyBWX78eok=; b=lRNgO2dX71cadDPZfmMWkpMpCN
	Ef13ZbGb0/w/VMAjrCqnVpKmYpgPi7+ZU1rYUCulWw7NsS158Sd5OI2pzW9IREEaO+1nVH/0Zd0Z+
	BJ6lh5DCH73LDTDzgf6I44UFRR0mVL0h7eXBugwiYNcttFoJUIIGBdlAFx5B/yh06enwHckSgWlYN
	HLxacLkTtlVRlD4pU1c9VqfS498Ej4wNr2aUjYRZhgiKaqBYJDdaxCo+l4NDPqyE9eR47V8lPbtF8
	viMeZOPfK0osYjXTTtaGBwXZhh2ex25i52QaN0jzVlTD6hhLYq6WM/jhbriOOSVVPmxsj2y0iMu7z
	xzyeamxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqen-00000007LH6-2Whi;
	Mon, 20 Jul 2026 16:15:53 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqel-00000007LFv-0EO2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:15:52 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38e08baf860so7891206a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784564150; x=1785168950; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3tTr+RGt8QXwsbvuUoMSTPv8PVwzNX3CqkyBWX78eok=;
        b=eravRywp6s6ecd6UFVROJRkdOM9iPxTRuOOtsMCSxnWpQ127Ej4Qhddc4KwM9eGASV
         faOaqMLNYWTSpTAUpKi7twM/dFNDXPxg6u9PaF8+dW5dScNDhyj3Qtioi1xnDW+jhlh3
         0vxY5ppyrOkpBs4/bk8xu1JNtxqde3uKTulHuqGqKoKvh3+VF9y5fNB/TtSnqDgCv+Je
         TUj8f22KkOHvSpLokBoLPbJclmwaoA8i3gd+TacWQSTdGee5eaL2fnZuivy0iPfsXE4a
         G2q1/0uPi/B3J/Cjhn6DNhV9kHqd4hIPco4zf8qY0X8SH0yZ68EjEhg2i1TTtmOgCUPv
         BqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784564150; x=1785168950;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tTr+RGt8QXwsbvuUoMSTPv8PVwzNX3CqkyBWX78eok=;
        b=QxlDB/DdgUsC/7gIDlD79mExCwGil1DpKvPASEiL5pFdmojmxhpwj+5nbT0rcMBy+w
         CW2cUeNK/GKb81E4oNQ1ck+bqO10Fy0cjzj4hODZKspOk65MhM1NNXtSgsN2BVz/jRI5
         uiILmYbjrPd6K43DE0YlfeBb5nIOcg7QI8B3I7jWm5fzF6N0TEGIA2AaH7xej+fBLYaK
         wt89CjOVp1pgwk6bshyvc3bcKlNa40qDejOYAtjGMDCMSaVWRGkL1GaoF2Ffsi6FJdN9
         gWg8eDqQc4dmKFoFcskBtuKg57mlkS1caZJ+19pX+2aw9bSturCJsbGYkzpSZUFPhKTl
         gDvQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2jDDiPElwG5jhGTYVU/Ignp/B/q50XNPtslmshbU7OeH/tUfLu5xiy6BHhHPoi5MFQUuNeWYL/vCDBBrk4A6I@lists.infradead.org
X-Gm-Message-State: AOJu0YzfMygrY+O6CGkAdk6QO5ID9pc9xsWKLEJwxCcWQxiOX4lOWsBf
	jzzDNasSZNxQll6QOKkGJUX1WE8yzum0RgY5pwK9t2QJLiV/kbW6Wjg8
X-Gm-Gg: AfdE7ckaAW1VNdCknDj1abotQrirT/xy4WJQy10qJoWZRb59z3MUUKeRHB0Arw1imlt
	50q+2vtlKbWoJIbG8za4RkPGwOTTH68kgUYKZ7zkl9fRDmL3A1tcKb5ROCC6zHR9oZN12QSWpHM
	DXGgu2lG2neQGdJx9BjSSbbED1wNZmRbu/P5RiCByPL20ncYA8FRsvQrtYGM2Uz/wCfOe7h+zAF
	Rd1lX8VgnEdQUDS2AAjAfcs53dUVOncWwveMQ3vTugg5NLKNv8Jv6u2k53cZ4QuKvEICR/N0nAX
	kEMHfUcurn3rPEjcwbAa//IHdt31O/bG1SliilkmKxDE/mHiaAcCOxlbcvKDYOZ20jMAW50fl38
	NgJs+w6cGktrPDoplBQqwuL5epE234jhhOxp/VKs/pDl0OKtE6qGgfDRSL2/Yp8+63eUKaPjncB
	EW3BA2jdrkTZuG9Js=
X-Received: by 2002:a05:6a20:914f:b0:3c3:ad17:eded with SMTP id adf61e73a8af0-3c3ad947d8amr15223942637.36.1784564150015;
        Mon, 20 Jul 2026 09:15:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d439sm45298283eec.5.2026.07.20.09.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:15:49 -0700 (PDT)
Date: Mon, 20 Jul 2026 09:15:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Simon Glass <sjg@chromium.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-watchdog@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jamie Iles <jamie@jamieiles.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: watchdog: snps,dw-wdt: Add RV1106
 compatible
Message-ID: <434ac32d-9f3d-4b5d-aeb2-91ce317f8e70@roeck-us.net>
References: <20260714131856.v2.1.b5339e64b3fe4338b3924ebd9dc0096904699744@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714131856.v2.1.b5339e64b3fe4338b3924ebd9dc0096904699744@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_091551_122141_54533D76 
X-CRM114-Status: GOOD (  10.35  )
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

On Tue, Jul 14, 2026 at 01:18:57PM -0600, Simon Glass wrote:
> Add the compatible for the watchdog of the Rockchip RV1106, which is
> compatible with the Synopsys DesignWare watchdog.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Applied.

Thanks,
Guenter

