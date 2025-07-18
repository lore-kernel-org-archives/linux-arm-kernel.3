Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F90C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 03:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4q0Q5EvAAnymgIMuX9CMnSNvFvZahS0xipjrXbSldw=; b=jKfsTcm9SBKcYaP+Z44AxhFVrX
	WIx8m8aJWYCzNzZERrT1wpNx6vx4+WdaNL3G+L0b15J33PcHgbE3JVF1hCzFWr2ntg/hSAq43uyU5
	Ukwl9O4PXEANn+WrwropQWhBVe2hj/BML8NKM/54Y25cxwA6QbgrS4XoDZo6w682dUx3igQmmeSKB
	APB8VNOD9F4PxdeUXFj2tpItOn64cA78A406Z0aAFY7o2twGDiWE9lfhAh+NPdN6L3lWqR3YIHZNK
	v07vfaZlx+n7/GuxgTd2dKTTVKCvwxZskHZDDgho92gPG0ZaD8eAznTOcXa30gIkgb//xSzcWEDXu
	s7284ELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucbuw-0000000Bbm9-25wJ;
	Fri, 18 Jul 2025 03:37:50 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucbqe-0000000BbVj-35zT;
	Fri, 18 Jul 2025 03:33:25 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-87f2aed4092so862833241.2;
        Thu, 17 Jul 2025 20:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752809603; x=1753414403; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X4q0Q5EvAAnymgIMuX9CMnSNvFvZahS0xipjrXbSldw=;
        b=iqP06n9bfRJFc5nm7vejAX2XmY1amAuaXYdF490u2j+XLtxagz9Hnz7es/bjYNoc6/
         PGxnzEuQ1AUnDbRSy4bQV4WVInqaGd2rOOAS7RKOC5OquEpJLtMh1V33OKu3WkLd1xT+
         zCDHom4SngkSPZuF0kiYIFrwbIGCpTTp24t3Ry4DoR6TX4WUHTUA5AVCtyrdTbIwPWfP
         ZOYafav30SN0VEgdX1fjet6ezkNKhf/BiyQD73dSp1PuBQLkqKI3XowLVwYTnI6MlXX/
         YRaRBhAHgecGimjFKdVxUsGFWzkGCBxh8MOcIp44y7SDw0v8YFHOjbDOrBpZLiFx4EDK
         SklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752809603; x=1753414403;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X4q0Q5EvAAnymgIMuX9CMnSNvFvZahS0xipjrXbSldw=;
        b=L/r3JH7NWKvICk3yBPt4mVWCIPvM+Sp/N+k8wJEDgCGUZXGi7FEomHVUwlKUNhONwy
         sxf9jDErcblSqkPpWZ1d1NgpJMxJfW9Kwl3y3K9FwUmst/izjBrSHV7nZoFY4QR/Lma6
         W2Kchn5yPfLMeawHtiMZ1XNAq8MnjM0Oq0nDfLVTeG4RiNkVDeAgyGNdmWYey004vCAY
         NEJAtjiHF0kZX5du+jAqda0XQWP75lQJa52gFXfQ6c8svpRwX09rGhv+mjlufEkSwefQ
         XlBftvLu4nqVW16wjj0Qw8xI3Xy8myMVMvC/EobrmxDjHIPdYIpYIXroI0M4st57Ci7r
         KLUg==
X-Forwarded-Encrypted: i=1; AJvYcCU5NvaGhwpqX0Ev/vzZ7Jng0p2H1r5xX3dp/mehw0/rPQCuvs2F75BxK5DsBr9BxvvrtQk22OBdYZdtn1MkGA0Y@lists.infradead.org, AJvYcCXXXwiJMyBZcbAFX5rlEfutoX9loEh7miG6xTFuIUvEeB+ol71MafNdeehwBrcpMWKJzTICDM13+U+rQTmr2aU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxE97zyRGZ5DAh6knCmSvS3ZXmOlcj993A/aAV1Ccpmxk0eG3or
	N0CIcHQMyc1r+fjfpqeCeSfq/TYaOOV5De8ngNZ+y7qOOYw9mEaE/lGO
X-Gm-Gg: ASbGncvxB7bVcV73zHOpp4z5PGLDeumrcavDqtBVLeY74zdFyuQjHwSEI4V6ZMlyWux
	jN/iJgVCg9ItVjeeeUgy4vg2yLNizhvIJQ6vXZgl2lVnUPz8npq9R/TdST8fMObitnP9z2YzzGh
	1Yu5gJ4ECpSQ/5vtfdCbrbfu3qOtNkqhozV1wonduIHIwAypV0i2MUWL0Cxg3yBJtt0TYWqfZqw
	Tnq3xdef+YhlveAPCWYKzvqryHcHSKCakvXOclFb2/nfcgZ1vYnrOAoQKROO0leZ39SbS64wpSR
	EZanXhsCYv1v8HRXskGHBg8BeiQCnj6r9LyPZyOaIe75Z+yDT8yh6MU9LuqM6rxKA2Da1O16u6S
	qmSZBeEJpYKGZWbDx9eQ6
X-Google-Smtp-Source: AGHT+IFG+rqRc1GS9r7vH4lNCHz/0iF5wqAzIkwI4O1lQJw5WIt9L0WOWQNLdU0Vc6VPuIyzNQyhDA==
X-Received: by 2002:a05:6102:3053:b0:4f1:7946:ed52 with SMTP id ada2fe7eead31-4f89996c9f6mr5408257137.12.1752809603242;
        Thu, 17 Jul 2025 20:33:23 -0700 (PDT)
Received: from geday ([2804:7f2:800b:2246::dead:c001])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4f9ad094fadsm138027137.16.2025.07.17.20.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 20:33:21 -0700 (PDT)
Date: Fri, 18 Jul 2025 00:33:05 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Hugh Cole-Baker <sigmaris@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [RFC PATCH v3 2/3] PCI: rockchip-host: Retry link training on
 failure without PERST#
Message-ID: <aHnAcbXuFqcMXy_5@geday>
References: <cover.1749582046.git.geraldogabriel@gmail.com>
 <b7c09279b4a7dbdba92543db9b9af169776bd90c.1749582046.git.geraldogabriel@gmail.com>
 <ac48d142-7aec-4fdd-92a4-6f9bc10a7928@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac48d142-7aec-4fdd-92a4-6f9bc10a7928@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_203324_782999_5D760601 
X-CRM114-Status: GOOD (  26.41  )
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

On Fri, Jul 18, 2025 at 09:55:42AM +0800, Shawn Lin wrote:
> Hi Geraldo,
> 
> 在 2025/06/11 星期三 3:05, Geraldo Nascimento 写道:
> > After almost 30 days of battling with RK3399 buggy PCIe on my Rock Pi
> > N10 through trial-and-error debugging, I finally got positive results
> > with enumeration on the PCI bus for both a Realtek 8111E NIC and a
> > Samsung PM981a SSD.
> > 
> > The NIC was connected to a M.2->PCIe x4 riser card and it would get
> > stuck on Polling.Compliance, without breaking electrical idle on the
> > Host RX side. The Samsung PM981a SSD is directly connected to M.2
> > connector and that SSD is known to be quirky (OEM... no support)
> > and non-functional on the RK3399 platform.
> > 
> > The Samsung SSD was even worse than the NIC - it would get stuck on
> > Detect.Active like a bricked card, even though it was fully functional
> > via USB adapter.
> > 
> > It seems both devices benefit from retrying Link Training if - big if
> > here - PERST# is not toggled during retry.
> > 
> 
> I didn't see this error before especially given RTL8111 NIC is widelly
> used by customers.

Hi Shawn, great to hear from you!

Notice that my board exposes PCIe only via NVMe connector, and not
directly via a proper PCIe connector, so it is necessary for me to
adapt with inexpensive riser card that exposes proper PCIe connector.

I say this because while I don't doubt that the RTL8111 NIC works
out-of-the-box for boards that directly expose PCIe connector, the
combination of riser card plus NIC has a similar effect - though not
entirely equal, as described above - of connecting known good SSDs
that simply refuse to work with Rockchip-IP PCIe.

I admit that patch 1 looks a little crazy, but is has the effect of
enabling use of presently non-working devices or combination of devices
on this IP, at least on the board I have access to.

> 
> Could you help tried this?
> [1] apply your patch 3 first

Sure, I'm always open for testing, but could you clarify the patch 3
part? AFAIK this series of mine only has 2 patches, so I'm a little
confused about exactly which patch to apply as a preliminary step.

Also, since you're asking me to test some code, I think it is only fair
if I ask you to test my code, too. It shouldn't be too hard for you to
find a otherwise working NVMe SSD that refuses to complete link training
with current code. Connect this SSD please to a RK3399 board and let us
know if my proposed code change does anything to ameliorate the
long-standing issue of SSD that refuses to cooperate.

Thank you,
Geraldo Nascimento

