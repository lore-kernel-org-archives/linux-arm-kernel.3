Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91437C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 07:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOdC1YcpFjxEHlAYMoJx2bj5+Wiwc2x+b7apAFR4ueU=; b=vHHxRAqBbJTywOIXPyfMfx+/1x
	hqLzhtKIaxLPHG4tiFWMBMcc7cgDhLpy5rwi1SC1WSJzpf7Kf48d1ZTdqxna2UUe4HnFxBZFtRWd/
	Bz1kjxm/f3pu6T6+dHqH5nT+cfWXLh9SeIr5+SKAieFzWqYcbAUqFnHpGsORmifVcPjR0U1ipTgu1
	0fk43rnhQ9Hxuaqu8kISFaLVIZ4UD2UoMMjkoaj1vXIn9dDOZF1TEZ1WTS4gSgO+DjBv2BWh0/Xtm
	4B824OGGQgnnOSIHmGU7rYVqbtYzoZ17ud0XDKnZ6Hii0hdZLKvk8FKc2o6jJ1k7IzI3dOSZDIo9Z
	8aHk4hlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXjs-0000000BD92-12sM;
	Tue, 14 Jul 2026 07:39:36 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXjq-0000000BD86-1Bg4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 07:39:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493f2e39e81so15771025e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 00:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784014772; x=1784619572; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KOdC1YcpFjxEHlAYMoJx2bj5+Wiwc2x+b7apAFR4ueU=;
        b=rNEU/Xgdqyh3VF8chAkd2j8rqUNUP158OWJZIz7lWjflGmtq4/c7wTxI0DwR3KtM81
         HW0DI65NOpyFCIlsCeZRTzltSxcfs8fIqOoYB7twHYVUsPhu0JE17C3l/+CCKfEAPjzE
         gf2XT3sZTQH22pXELtSJQT2SeVYdBORvFr4JdZYf5FKGo3sLhj0n1z9Rn+Yu5yZ3JfI2
         Ol1DWgf9TyD7q3dvY+hkJTbacvyJrNVaChZvbxYuAzPiV5bWanX1rxpy9xPulC8maBJf
         1HyweR9weqisjD/dAGvfPed153vYt0oZP/2Yls4fJxAfO2grQMoaHx17ckIDgbmxep9H
         I+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784014772; x=1784619572;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KOdC1YcpFjxEHlAYMoJx2bj5+Wiwc2x+b7apAFR4ueU=;
        b=cXQzLoZnRX8eGwmOHdl7SPvInFY4xu8GrB/5s9A/EBX68RzYdCo1hTZMHXIMPQv6QE
         ssupn1LV4JWPgRpc6pCoxxBojCxGlR0SRys+OvEl8qq47Nmrl08QiNW3MSnEiLwC2dcK
         TGpQsQAS/yL8hKoS8A4Dh7YPKvXxEKpU6eqKC0O8MfCoVfoY0TR0muf5cmfM7yG51u4z
         aKn/0ofuwMyRAlvGEzC4mm9UMMxIdqY3Ad7U6fHmi7gAu/N7CChQgHja1T4OjkQFA9pE
         jRuJrrBc8O1fZ6yvm8UROw4JsaprOH2XwegoZXjSpCYKr6+0bE130AEeLPNDe2blcsIJ
         MPiA==
X-Forwarded-Encrypted: i=1; AHgh+RqtQ83ckkW3qOtxbnD0Bl53oasGooZfsTIX0O7fPx8a8mHPq7UeUa/uEhIz7ortkXMFH9F63XbDQ3Q33rJlWlni@lists.infradead.org
X-Gm-Message-State: AOJu0YyncWq02OIXQIsWHUaxUCte4pGpoBA7hlqyBIYTmvjIPreqTKYQ
	rpfTZ6niFSjnyEeFtkxOt73RaNU2L9z0e85RL8lX4ZK0N80nr0TYmR7o
X-Gm-Gg: AfdE7cnCIxk08hMsdJTX88xLrOTdjFJcDzUdVUAoXMQSgINHuYZj09rCfTd2oV/Fe9A
	H32gDtpn3X/o6wR69eSFXqt3nttvk711ZRtPJe5fuz+vBTdjv5KliA69UeKYAUn7JC3xaqouU3f
	stslzKdEr+d8XbwkDuo+d9eBdDkmN+lNzRfofVwhPoQUxGvQduDdMoDKGF4hKYZA8ayo5EMfs3a
	jlSlW0UvH1xfV+2MvsxTAOeAlGJB6HU3qd/hUBoDqHpAw+4DHUdkdGYO7wHFs7MklQiiwx1sAFi
	adKoGh610BHJX8PTLck8gFjowF1zKHQPX+Xxiz+Y8qzT1TD5yFQobGuxBei0IAtZ3f0+8KOtcd7
	NwHdr9nLtnfO/RsQVoflLuqPunHBmVySMOOGT+Bzvq/JqAj4Rzf0p2UEO2e42opafjBT44p5dFg
	UgxHSR6/YtpXWv8jNcIBNUKfZWZCdYTRQIMM4N6r/QWLTcMQSkuPcGctbgQtLuNWW2Au9HjCHIy
	T2DltxfwLY1sXp7xzOudkcV8hfJUO8Z
X-Received: by 2002:a05:600c:310f:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-493f87dc3e8mr119017205e9.4.1784014772003;
        Tue, 14 Jul 2026 00:39:32 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49510c8e220sm45791165e9.15.2026.07.14.00.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:39:31 -0700 (PDT)
Date: Tue, 14 Jul 2026 09:39:29 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/4] arm64: dts: ti: var-som-am62p: fix Ethernet PHY
 configuration
Message-ID: <alXnsYCluZiY0sYd@Lord-Beerus.station>
References: <cover.1782680023.git.stefano.r@variscite.com>
 <4d1ba0d1b9bd4957224213cf17dca93392788e03.1782680023.git.stefano.r@variscite.com>
 <531d7396-c581-4b5d-8008-db5e9ee5e7d6@ti.com>
 <alTo0KGWAixkK0i8@Lord-Beerus.station>
 <178400918994.3109814.1083731005888044586.b4-reply@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178400918994.3109814.1083731005888044586.b4-reply@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_003934_370477_2C0A8744 
X-CRM114-Status: GOOD (  19.88  )
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

On Tue, Jul 14, 2026 at 11:36:29AM +0530, Vignesh Raghavendra wrote:
> On 2026-07-13 15:32:00+02:00, Stefano Radaelli wrote:
> > On Mon, Jul 13, 2026 at 04:02:34PM +0530, Vignesh Raghavendra wrote:
> > 
> > > >  
> > > 
> > > So are the reset delays no longer required? Or they taken care of
> > > somewhere else?
> > > 
> > > 
> > 
> > Hi Vignesh,
> > 
> > No, because this GPIO actually is not used as a PHY reset.
> > 
> > After reviewing the hardware, it turned out that this signal is a
> > board-level enable signal required for the PHY to operate, rather than
> > a reset line.
> > The previous reset-assert-us and reset-deassert-us values were
> > associated with the incorrect modelling of this GPIO as a reset, and
> > are not longer needed.
> > 
> 
> Along the same lines does [0] need update to how the cpsw3g_phy0 is
> described then as its seems very similar to what this patch is addressing?
> 
> [0] https://lore.kernel.org/linux-arm-kernel/0a7bdfda80309eaa207b5b369d72f4bcb16e0604.1783864932.git.stefano.r@variscite.com/
> 
> > 
> > Best Regards,
> > Stefano
> 

Hi Vignesh,

No, the AM62 DTS referenced in [0] does not need the same update.

The VAR-SOM-AM62 uses a different Ethernet PHY and has separate signals
for the PHY supply enable and PHY reset. In that design, GPIO0_45
controls the PHY 3.3 V supply, while GPIO0_46 is connected to the PHY
reset input, so the existing reset-gpios description is correct.

The issue addressed by this patch is specific to the VAR-SOM-AM62P.

Thank you for your review,
Best Regards,
Stefano

