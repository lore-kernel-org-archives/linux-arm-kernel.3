Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD93CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaGTcJpcyPpectgG4eeGbkroVEPw69MtYewCR/dl3fk=; b=EP7ZtpIwM4rrBaa6KZ7IH5hKJb
	e+B0RLds0Aq7pE5ScgI+Yz5pmlWdkbvT0bvXJEE/BnD3glXkWyNG3+0VmWgx8DaUjDTTy7DipcS9T
	MRplfgCW+kK+hR2hDSFLBwHmRcr6ab9z/+y4Zi/RnpTBI7NJ1lvlK6k733S/1bE7p1H2KxvSUzRqT
	FDxyqr8rvTzlLwyJbUtEJD/3wjxLCjDygy0XWN6TG9qdMr0QuLzUel1plrkhjjfst7PlZIz6ipjqi
	Imn/ZFbpBT90saKPQBmlQxbEiuaq98WpIgqcXiHkcDtrR76iw+cuwNmeygHR21JK7vGS8eM0qHedx
	JIDlm/LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfT-00000008UvS-41oY;
	Fri, 17 Oct 2025 16:51:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfP-00000008Ut8-0ue6
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qaGTcJpcyPpectgG4eeGbkroVEPw69MtYewCR/dl3fk=; b=TUXtzdQivrHR1MnGSOH7tHPcj4
	UJ0Ky66ueb4B+WOmTUi9O4Xgx3zroPjdDgogTid6seolCW2EuEGloSHoueUdylVtZSPmzHha/uLtV
	agZaKa1YKAdbJFXdMnVXKbVB+9EzXIUGewIJs5rd39JdDJAq/AkEFGDnWLTbDza6aU08IfzfjFJ8o
	6uV+FipRgCPAiwMF2LOxIhuNhRY2JaT5z6mYYgH8gP33sltzvxYjmegDL2nIK4n2grKQ1xs1bE0lG
	MSsarOvMpgFkkh0T3/znuYAPK4FLUrmPCFhiQ7yxJocW593B6tUk+9I000JvLBFMEvvNc4T4dGbAU
	e9iAXOKg==;
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfJ-00000007mgO-08kn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:50:54 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cp9n222cVz9syZ;
	Fri, 17 Oct 2025 18:50:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qaGTcJpcyPpectgG4eeGbkroVEPw69MtYewCR/dl3fk=;
	b=L/d8FT6D9fjEXEJCuVcmx/uuPsi2MdTwgGIsd3A11IDhTui6KxV/WWGStwKKy6Pq+U0NU9
	qJWE5WncoVnX+bSrUs9nJb6DK5BmH8sI0B9g36ymRiy5OXrfA290ZhCpnDiVqeE3aMVKN7
	tmQcbDhF8eID30SqPjO6mMQUtgDay5BgV5Ss7lmHDvHGPwE+cnu2nrap+NE66F1VAh6hEY
	Fnmh4g6DdM0NMWchgt6yoRIgKxUA+Lxchy2i8RrE5ZwT58MytKF4T0x7ox9Ed493s+yvVX
	kJpAOhrKgwUO1aNWRQwMaqZfWL3UZzUwoCaGByc0qA/4WVQ9nJPIGY6eAh8F8g==
Message-ID: <1b44d979-3ea4-4874-aaa2-4e6cc9395d04@mailbox.org>
Date: Fri, 17 Oct 2025 17:01:09 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 27/39] dt-bindings: display: bridge: Document NXP i.MX95
 pixel link support
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-28-marek.vasut@mailbox.org>
 <aO1OIa86kNtboV+X@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1OIa86kNtboV+X@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: d4ee99cbb628ba38429
X-MBO-RS-META: cseaqk76a5hj6wzpqix4t7uyn1dqk6yb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_175053_189264_B9109B33 
X-CRM114-Status: GOOD (  11.20  )
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

On 10/13/25 9:08 PM, Frank Li wrote:

Hello Frank,

>> +
>> +description: |
> 
> use >

Why not drop the trailing | altogether ?

>> +  The Freescale i.MX95 Display Pixel Link (DPL) forms a standard
>> +  asynchronous linkage between pixel sources (display controller
>> +  or camera module) and pixel consumers(imaging or displays).
>> +  It consists of two distinct functions, a pixel transfer function
>> +  and a control interface. Multiple pixel channels can exist per one
>> +  control channel. This binding documentation is only for pixel links
>> +  whose pixel sources are display controllers.
>> +
>> +  The i.MX95 Display Pixel Link is accessed via syscon.
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imx95-dc-pixel-link
>> +
>> +  fsl,dc-stream-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint8
>> +    description: |
> 
> Needn't |
> 
> why need this id

Because the IP is generic and can be attached to either output of the 
DC. We need to figure which one this is attached to, to configure the 
correct bitfields in syscon registers.

>> +      u8 value representing the display controller stream index that the pixel
>> +      link connects to.
>> +    enum: [0, 1]
>> +
>> +  fsl,syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: |
>> +      A phandle which points to Control and Status Registers (CSR) module.
> 
> Why not use stardard interface, like reset, clock, phy ...

No standard interface fits, this is really a special remote register.

>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
> 
> video-interfaces.yaml?
None of the properties in video-interfaces.yaml fit , so it makes no 
sense to pull it in here.

The other issues are fixed, thanks !

