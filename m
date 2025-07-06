Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3E8C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 04:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVmb8+ym3rIBDL7U+LhviQ6wlTsutcclIyc87Szy4qU=; b=c4YRfQZIUWEuNKpkU5wco9YEOP
	M8O7kIIjWB4JvKGBAqJCh2Po6gkTyoh8twjUPRYKApTH8ZRl/dkAmIomu1/Q9HhkMQUvwBkTTcf3V
	ylpw6SIQFKTOW+WaBHJfMqMHnYMLbkshnV7gqa/iqjkUNxfGnO/6vHVKqPaZTCX0VmIf+bBOBSHWR
	ahzaRMvZaeWwDU5/kxkFT0+3/YJl/khqPV4+wyvykC88viYKv/DZMW0lhmnq0dTXx1PO5ipiVKx94
	KzYp//OnKqk0kpBuedK/ticz74CtZ/OK6EAaMIclRQkZZw+o1YWCBAObuzCR+I5rmqKHiCTI8y0jV
	LQmMKp2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYGlv-0000000HLJy-1yWO;
	Sun, 06 Jul 2025 04:14:35 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYGjZ-0000000HLE4-2FgT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 04:12:10 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b2fd091f826so1530836a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 21:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775128; x=1752379928; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hVmb8+ym3rIBDL7U+LhviQ6wlTsutcclIyc87Szy4qU=;
        b=W1ssffkQRTra/0xlSTyDjGKyqmXmtHwSdjD5UE2rA0vVpoTd9P2qkcJsyyP4ROcksW
         DzKGDxw0pTAkh0pRw2hmgfTzOW7KAMj4fZ3Wpcg8eYn5PR4XzqeFaPosQnpNHrO4iehx
         Ev8jE4fFf2t2R5aZ0/RNhDFg1urCJigjQgpnyWov47pgRambd3LkukukgHeK4hQTkp3L
         mVlFYVkAyYa7nnaNH2L9u9dOLIWhZARlXJvI+ebiTaHXjJRqL7Bvx1w7hEczCIcpeA0H
         DxFQQ2kgTL9TlW06ePGpFIXrbOuk1G6Vda4fBj4bEfOXeujMmGnHCme82UKmZXO+OrLp
         NfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775128; x=1752379928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVmb8+ym3rIBDL7U+LhviQ6wlTsutcclIyc87Szy4qU=;
        b=gtznvxL73vIJ8H5/9kubZgW1OglXMWTrmrjp4i1TwWkz+HzyBVeEX55lV3x3IG13rf
         ewjw38/VmwZ7AwvI4jGyazSJRoLHXgKOvcxXZadqXuOPPipBGyK+VKggrnTg3s7tMbjc
         9vtuaFPE4etnZyK0u/jpP4fvUlW2dheM6GXORZAJtSJDHTWvYBAowfqdjTwF4OqQoTfa
         p4hk4nYkFY6SbtiSLIX8oPiD5D0buEuZ2NPt/8MROpax/8tM3b6yd9ZCak/kLRdCSouZ
         YzKIGzUdJCcXzw17hMtaKV787rzPx30M7LaRmqOsNzQqH2xEZeH07Mx0slDtlf4oG6SW
         VkAw==
X-Forwarded-Encrypted: i=1; AJvYcCW+TYFKD4pmVJGlUNMt636TLI/xLbKb+FwWFYHuDegwefebJuhIqEz9uL9qeo7/MggHw+WbkyThRM472RcsHicW@lists.infradead.org
X-Gm-Message-State: AOJu0YzaoINaFVQX/oiOyd6vcaKBC+PrefwipuuiNmcy20S9pgAyXyRt
	ppH0RAyNmv483vP4gd3qBWyBt6b/HUK488gkLz7WjWtJeQ3Y08eyuj+8
X-Gm-Gg: ASbGnctsnrHk020+zYsF3u6HIvuBdTE8VVjDxddVzxBKkdHHlEqDrnwwprMkgAzBNMi
	hNdPiadWDTTCoK6i+7GPMas1EVw+M3S1yMyubqRLOCEHG1+gxV8ml3WaD2alTEXEoTYqbKw/G8E
	jZ+x7CytfqGwPw9MXZjSYFG/g2TTZmICax5d1ziPkBjK6oOi5w2IlqDm5mPv8I+RxadAMzn5bva
	TV9zpEuRI7cjC73mzB3Qt8kGJzHR1+6Z0ek1HrZpAlCnvlv9RMLWRhgTvCtvJ+07M5+yIpKxURU
	KGIRGHFxQM4tL3MWKHrhT3uKMZwGSaQ7IGDQ0ehJ68n4p0pEbArc0y7aB7H4nghybBAGqvvmXkH
	9HStd1vXEkBFHEVD4Qwte2x2yta1yHm4fbU8Yklk=
X-Google-Smtp-Source: AGHT+IHvXW5jZXVYlEka38PzKTBwvT3r/GnGzZfU2rZK6jmJT69dhrpF0lmwPqysm1iag9gx8vKZWw==
X-Received: by 2002:a17:90b:48cb:b0:311:a5ab:3d47 with SMTP id 98e67ed59e1d1-31aab83725dmr12052060a91.1.1751775128288;
        Sat, 05 Jul 2025 21:12:08 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8457f34bsm53310255ad.156.2025.07.05.21.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:12:07 -0700 (PDT)
Date: Sat, 5 Jul 2025 21:12:04 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Message-ID: <aGn3lNXQ8cid6jbf@localhost.localdomain>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-6-rentao.bupt@gmail.com>
 <a6f6966b-50ee-4b4f-9422-96c6ac9391a2@lunn.ch>
 <aGW8Nm8ZWMwRYVOo@localhost.localdomain>
 <220ac6c2-8373-4742-86fa-f322d6ada624@lunn.ch>
 <aGcBEHMEyQJuzmjj@localhost.localdomain>
 <95ff4056-d1cc-4564-8c44-0535196e7428@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95ff4056-d1cc-4564-8c44-0535196e7428@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_211209_578929_B5CB1E72 
X-CRM114-Status: GOOD (  17.02  )
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

On Fri, Jul 04, 2025 at 09:37:20AM +0200, Andrew Lunn wrote:
> > Hi Andrew,
> > 
> > Got it, and thanks for sharing the context.
> > 
> > I will reach out to ASPEED offline to see if they are actively working
> > on the MAC fix, or if I have enough knowledge to work out the patch.
> 
> There was some discussion about what needs to be done a couple of
> months ago. Look for emails from aspeed and IBM.
> 
> 	Andrew

Hi Andrew,

I guess you are referring to the discussions in patch "ARM: dts: aspeed:
system1: Add RGMII support", and I can find more of your suggestions in
the thread.

I will remove mac controller from my v2 for now, and will add it back
when the delay support is added to the MAC driver. Thanks again.


- Tao

