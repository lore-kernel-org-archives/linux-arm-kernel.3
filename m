Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EC5E677F3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 08:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Subject:
	In-Reply-To:Cc:To:From:Message-Id:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOESJwGk/m0BH7DybjWTyh29n0WPp4jHNYg51LnvExA=; b=lZ1XF5j/UxjKo/hkNWGr+V/XTz
	91k1f32v7PWxNdA54jzPAdkMKZiQ1RxbgTYfwiU4GZ9z0YmPr0g/Cg3UkThQV87JSLu8GI7Hbgvr4
	QJpJ7HGfurXpr3iO4Q+OS8gGBMgCKETrWGP4ZxktxXfZXMx28HN/CcB/EqE9PDQBixkN36Udh2lDj
	rzI/NOWckO1O6pGt+6p8o1T2V+s17743lozPgffBAjs5PTx/WsYOe6B53opfyH9yUOP8FAGvzG7zY
	b/0hhzUwHiHCKFHdrOx2IJ68ebBBLoWf/oXt8W35Na23lnnecX/3/84f3AA4d2+OH6m22mkvY12E7
	aRfbdo+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t79hD-00000009Jnl-2aST;
	Sat, 02 Nov 2024 08:41:23 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t79fW-00000009JcN-2YSw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 08:39:41 +0000
X-KPN-MessageId: fb73fc64-98f5-11ef-8d51-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id fb73fc64-98f5-11ef-8d51-005056999439;
	Sat, 02 Nov 2024 09:39:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=SOESJwGk/m0BH7DybjWTyh29n0WPp4jHNYg51LnvExA=;
	b=DCiN/7lkFwO7MpBe3tmDSRHPmaemcDLP0hYYF+3E4NLEKN03H4mHJXcJZNNAAQlKxBB8UdvZAG5Jh
	 J9b1D7HY8/MXxQ3mnDq3KPRYsLpswke8pXjjQBYptWt7T+5DeHyNFbWnbxgHZ6uwLDIP3l9N13rgEy
	 r7LxcuhaiwExkywlMDZef8K5EX+wo2iDlQCpN8grSVSppyPStgzGcX6//DIFp1ZqyzmhdSX/N+g7jh
	 K/CsR3ka5AuXmDwIBqP/awaYO/jMoVlZuiUz+2b+1ynKZopZhcYy0r/c83DFbVdGd72ynJtr4cwhsG
	 +mkoVNjpDzs63hctmVGQ5H1LUBJmdAA==
X-KPN-MID: 33|CNLLXHK/GrZqDr5w1I7erOjxXIjBx9wdE9L1Mf0wjG4F9Zpd3D6Gd9zERmwBM7Q
 mPAkEG/BAmO2jCnY0x6OdybuAiCXqrxgsYgj7/db/epk=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|B9RhJaWMW/sEKQDBuQQ0hglTReDydKiDe86GzGIp1EwQCBNJ8VbXfe9UflrnJU6
 XTpk5Yf0qfQGb+IcfLRUk5w==
X-Originating-IP: 80.61.163.207
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id fb974d63-98f5-11ef-9749-005056998788;
	Sat, 02 Nov 2024 09:39:33 +0100 (CET)
Date: Sat, 02 Nov 2024 09:39:32 +0100
Message-Id: <87wmhm3u7v.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Nick Chan <towinchenmi@gmail.com>
Cc: j@jannau.net, marcan@marcan.st, sven@svenpeter.dev,
	alyssa@rosenzweig.io, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
In-Reply-To: <46b31874-9fe2-4534-9777-816765a265b1@gmail.com> (message from
	Nick Chan on Sat, 2 Nov 2024 10:36:56 +0800)
Subject: Re: [PATCH v3 1/3] dt-bindings: spi: apple,spi: Add binding for Apple
 SPI controllers
References: <20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net>
 <20241101-asahi-spi-v3-1-3b411c5fb8e5@jannau.net> <46b31874-9fe2-4534-9777-816765a265b1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_013939_082143_E8FAEB97 
X-CRM114-Status: UNSURE (   9.64  )
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

> Date: Sat, 2 Nov 2024 10:36:56 +0800
> Content-Language: en-MW
> 
> On 2/11/2024 03:26, Janne Grunau via B4 Relay wrote:
> 
> [...]
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - apple,t8103-spi
> > +          - apple,t8112-spi
> > +          - apple,t6000-spi
> > +      - const: apple,spi
> Apple A7-A11 SoCs seems to use a Samsung SPI block, so apple,spi is too
> generic. Fallback to something like apple,t8103-spi instead.

Well, if that is a Samsung SPI block it probably should have a
"generic" compatible that starts with "samsung,".  The M1/M2
controllers have a different SPI block (presumably) designed by Apple
themselves.  So I think it is (still) appropriate that that one is
"apple,spi".

Also, (upstream) U-Boot already uses the "apple,spi" compatible.  So
changing it for purity sake just causes pain.


