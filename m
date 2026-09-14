Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261EEC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 14:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWBz2u9MZyDcGdapPsHVrPMmzYjBtuHU9QqFvO4VM2Q=; b=eDHxvLtkmXpbGN+gUwik/n1utl
	LJhu+P5MRU55n/jRslaA4R06LV3AT7sZPEydK+3hVl+a1GrJeng7XbRD3+ANT/S8+0WhwAlkshOYQ
	vjqe+ssLl+xAlIgAYhmJrVXM8rBGmhO/h1EUi/uDrsGZD715hWeAGCMvGkrDsRZ7cmKhsQoQIMAU4
	FKuzDigzjV6BMobFcn1hSLbgAdQiYTeX99S18D9Qa+kAr63nXNAW1k/NW8wiHInluq9oj3WVYsX7S
	g+wkUPyIwPNqww6mr4nsb8jRROVg3I216aQxlVR7X7R8BwN3lv5U+zssTrc3YOQhhHhMBqujoi+ci
	SO0D0yHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67cu-00000003yea-2sKt;
	Mon, 14 Sep 2026 14:25:44 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67cs-00000003ydu-3zL4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 14:25:44 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b5e4f1801fso2737049e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789395940; x=1790000740; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yWBz2u9MZyDcGdapPsHVrPMmzYjBtuHU9QqFvO4VM2Q=;
        b=RiF2d1bzw4KVXj5CAtFVpmNCaCgxA35f41mYsrihbPTQg1zTzPixLkGvKf9UIND0ny
         P3BDH3QmNGMqgAEKMpRgS518mB0k4pA9xz0HBG7oE9b4D8a8qFQc04+1OMnZ8g1j++7J
         y2hU05JYP8W5yiMQoaD0I+sY5IYZqtELkdPZD2+gckBcx+FNg5QJNxXmsLIcAmVzsvYH
         wJi246CRuRjaBlDqXBD9Si79qGAC94lKy722/LQJZvSFeR7ur2Sn46lQTZuhDB+FOSBV
         xh+FpMHjtp2SZ8bgZyzRLYpcgXmAX67l51BHjOiTo7XlvVpSrS2nW872FKIwc+GTysfq
         BjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395940; x=1790000740;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWBz2u9MZyDcGdapPsHVrPMmzYjBtuHU9QqFvO4VM2Q=;
        b=aQgzxSXJWfP4eMZAsEM+lrJnPYjtIcc5e5xe6NN6RQgHxKRU1uQ6bMxu3sRrUEFdNd
         eH88jXW1wiloGAhE6istneUpJ1Nl/lobAWd+cJcGe4ArQ8yn/AvMui0BWCNs3sfu580P
         jcGHIlv0BC4pwqhGTtZr4PTkWm4r2P6l/pNn+0fKjPAtcfIBI6HvTnpyCrxvAyhk2yqE
         2m1ZM3A60TLBof1wN+sgDzCvW963Dy4tlrP7GZfSOh28KPSpq2vODBECypQp7VjFOo8j
         h48k1IeGmRKp9xbC8rL0qfjTGrhT1hdzLXxt7QErcencrHEtUBzcq0BdbjLLHD562yqE
         Mngg==
X-Forwarded-Encrypted: i=1; AKwUvBzT4h78rjAPVtXGywfeQcLgYBumDF5VTObXgjAX4IztXPOmX6fujcxnDLjS5K10TAN1gdxz8yG/sVVemWmVgcec@lists.infradead.org
X-Gm-Message-State: AFuF++k6wYnhUaMM+R6i7pf6rvdJGFeUOgRXoURmar/UGmxERAZSUz+7
	QkQz7Tr7YC+mYoJzOAtvw9KnviGhTFx7AxUkHVERR5gpfMdRIuThhDuj
X-Gm-Gg: AYBFou1iSGGjNBIOHFUJ9b5bFci8nn7HOqyj9VlTOnhjpX7joQxOR6W+tAuhnDLqXzv
	vxekxUbWktpCDvvGHxSlKrwsQIboGpgfkRG94g7/imDVrvZuVZ/493IMBjtFMjYjtGszFrpexOz
	sZ8VxWKHzdlw66YFmGK5eFgoxOqRbrs7JwcouPt2O1cibhPxg/cIqL1fp0EdNLIQlbMA5I6EDHh
	ab0y/VjM/Unw+RyNH4CoC7gUOszcFyJ9TODUuMGpk2dTgRBe8r0obYYxlWOAWalNaR5BWW43qvO
	A30Khfu6QLIk3qqMBNVgO4r5J6cTS4UyCOPwe+NWyAuIMm1Y2vVeJa/CBQW0mtk/a42uH2ETt9J
	zZ2PYdS/UoGQe2k50DpxxCz534oz3m9OvmpmaZihVaedueOaPLS+W1yVz505o6Ro4kMCidFmEcF
	Tq3U6EA/Gt3c2CNWIUMw0z6AZZ04hhi34otCOcifXx6wdjsumQFzvWiLB6Lx/BoKuNTTNCi1Jct
	kh+wLxu6IFBqQ==
X-Received: by 2002:a05:6512:2511:b0:5b6:183b:d202 with SMTP id 2adb3069b0e04-5b8ae69ca27mr768798e87.41.1789395940103;
        Mon, 14 Sep 2026 07:25:40 -0700 (PDT)
Received: from KAS (94-29-32-34.dynamic.spd-mgts.ru. [94.29.32.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04798d2sm2492509e87.69.2026.09.14.07.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:25:39 -0700 (PDT)
From: Andrey Korshunov <razor1702@gmail.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add MangoPi M28K
Date: Mon, 14 Sep 2026 17:25:32 +0300
Message-ID: <20260914142532.1997-1-razor1702@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <20260801080018.3220034-3-amadeus@jmu.edu.cn>
References: <20260801080018.3220034-1-amadeus@jmu.edu.cn> <20260801080018.3220034-3-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_072543_001690_D3EDB49E 
X-CRM114-Status: GOOD (  11.58  )
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

On Sat, 1 Aug 2026 16:00:18 +0800, Chukun Pan wrote:
> The MangoPi M28K is a development board with the
> Rockchip RK3528 SoC. It has the following features:

Tested on a MangoPi M28K v1.1 (non-Pro, 4 GB, no eMMC module) booting
from microSD, with this patch applied to OpenWrt's 6.18.44 kernel and
U-Boot 2026.07 built with a board target for the M28K.

Both GbE ports work (RTL8211F on gmac1, RTL8111H on PCIe), as do the
LAN and WAN LEDs and both USB 2.0 ports. With the same devicetree on a
6.12 kernel, the AIC8800D80 on sdio0 also comes up with the out-of-tree
driver.

Tested-by: Andrey Korshunov <razor1702@gmail.com>

