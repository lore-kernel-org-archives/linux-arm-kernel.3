Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C31C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 21:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2kNjc7BvbeCZjQXT/CDfqSPqzNq93GXaL2zxjFnbUA=; b=CM06TDMo5EH+t/ZrELbBWvcf1M
	LNoRVyX7scqMr+jr2o8WVpd6w/dibHtA6oQWKaQTkMUxNeFs2FwPpp5mxiONpca3jVSrHEvUdhHgz
	4Uff9UkHpl4VrXm5wB8RpzmQ9y2KO9NNbECzyTdJ9i0p2d+gz3Ior6ZslsvXRPHMLAFi6K3tn6vA8
	ieZR79JlTb7V7e/rf+C4cCF+9UidxlJmeY8Mxe/2SELtcQdEc408JdLIFhZw4z76oEIYa2dPM6ayJ
	OiiijlX5c/jdLRHvBtkCqyR6IaJh8JgnwcDcdewePPl8tclauhv6j4PldCH1ARbS3kH1oRXW0iym2
	F0vdayGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXqp-0000000Cvdb-27HV;
	Mon, 10 Aug 2026 21:48:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXqm-0000000CvcQ-1ATI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 21:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786398483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u2kNjc7BvbeCZjQXT/CDfqSPqzNq93GXaL2zxjFnbUA=;
	b=N2EhJj6JdrRy9tyUwqaEfdGMlMvNkHnyUuH0irsZMWSEbe5dl5PLBatgICSs3Ho8und5sP
	lN5rMsMjMY1D3D5/yM4aP7N73beI0SOUty43ZkepIKqfiL3BEYa5JqoqpOKa+2JOtuL6a5
	l4oKPL5/8356lBtpXdPBx8f1IXx8EnI=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-g1Zx0Lg7P2Ok17UxhgjlZw-1; Mon, 10 Aug 2026 17:47:59 -0400
X-MC-Unique: g1Zx0Lg7P2Ok17UxhgjlZw-1
X-Mimecast-MFC-AGG-ID: g1Zx0Lg7P2Ok17UxhgjlZw_1786398478
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e7b95cd84so42559527b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786398478; x=1787003278;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u2kNjc7BvbeCZjQXT/CDfqSPqzNq93GXaL2zxjFnbUA=;
        b=DXShlzmJmqZxCTLVvgC18P62fdLg2ohTs5LjnBNZRUFthCDx0XuMAL9/JyA2zGbF8k
         9V4zRh9RKn/La7NUyKELp/qi2EG8fWNM7a/b4u1d/0EtSFapopP+MrneRSFTWKWvpn54
         8WRDHVm6OrI+ZH1dFmJhYuJZFsL5u4DnnNcWj/gMWsEj8rN6YbtqqK4Ut8P+bcorj2q6
         04dkJqlzdl3wIKK/c93er38mV5ElQCUxAMPJc3GeSPPgjrfNVCHI+pUoMbgQHiB/zeRH
         Gae24zuHPsSV6pPQFS0rLWRWFNYHMU5CfQ18AVpBvnNjxfDEfpuKov6OfDm/ZSjSwwXA
         C/Sw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6Qq+2C6c1Vz9MgHcuDANnlgL1YRuVG9L6yfl1dUQxasRwMSBOxFUqRW7k7ivXnSDGgzl4LaUA4/bH2lhRo61T@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkv/kBhaM/pEl6JbWe5lPR5VGEzgi6xyST8XfBr6jKK/Lamufk
	PeLHTz4fPhjZjgIZW+dZCwACKxNTqCtvNZQkzj26589dD+ImB0keSQdCcN0AwvBk1bEek4FdBqj
	9mR7dYT763V3wSXSeA5L1g6zzo1TDgxbg3mBhoERwpvVOBwX6m5lt4MXi4ts077O5jfnTDIzi6m
	X0
X-Gm-Gg: AR+sD13wF9eKmEftMSMgdN673thupgx1W9as+pVT8nwafOEWiG/cF+QihtXoPK+92I2
	JOTz1tFXO8xpOlemM/kWM6D5hYkwVTRjGfcv7S/QTpHX19oFQElQ8gTEpPB9dmf9q+3jW0ofr0P
	uIKfROXocef7Zska2NLb5viwhiHo57NJ/g5tB3aX6bsWJtU+cxzANorwyyXvgACPi+fdmPzTw9M
	y87knB7r8/Q+POD+2JVMit6Pz74hurFSExm9LE/RA/KpPJH4eAO5WLoQd8KgD8OSs8I3+tFoWeN
	5yB+5UUysmt7UDwTIzmEF+caoXl0AIVaPyjliszU76Mj0QLKaIQ5nYSj1qTdNzosf6iraVdJ203
	V8KPFiiyzViLSnvbtHZvN63BNw3EL2ELDa8g=
X-Received: by 2002:a05:690c:9989:b0:81e:4e5d:484a with SMTP id 00721157ae682-8243fdf211amr161873517b3.2.1786398478512;
        Mon, 10 Aug 2026 14:47:58 -0700 (PDT)
X-Received: by 2002:a05:690c:9989:b0:81e:4e5d:484a with SMTP id 00721157ae682-8243fdf211amr161873217b3.2.1786398478040;
        Mon, 10 Aug 2026 14:47:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f577c580sm64586967b3.27.2026.08.10.14.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:47:57 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:47:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v10 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <anpHCvLCm1JKImC_@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-5-63846490712c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260810-zx29clk-v10-5-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CFWk4KZWyX9ttTwAL_jAJk0i3lS0yq9hG4EmsD-pWWc_1786398478
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_144805_069608_9C24EEBB 
X-CRM114-Status: UNSURE (   9.94  )
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

On Mon, Aug 10, 2026 at 12:28:24AM +0300, Stefan Dösinger wrote:
> The next patches will implement the regmap clocks and PLL driver. The
> actual hardware specific clock listing will live in a separate module.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


