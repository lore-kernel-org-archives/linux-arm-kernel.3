Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBBA109C032
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsqamBp8hVq8vMV9I7W5DvdI+pm9r55STzQZW1yMNLQ=; b=a6YvccQsI2Mffd0Nvx+FCMPY+P
	EB55y5hs++zCTUo64kWdCYVKWp5ys38dWaqqwjlICyoaDJWsXppVtuNjE2yv4CvEM6El94zjKW3QY
	wYxwDxBx+QKx6KBg0iVi0mNnIYJAj1m4Q2lu/T3PVb/xgvWT2JyJC3ywtp9+Bx1B/lzQyHzaQwF+D
	8yd3FNzDOJNvjt4Z4GuN3lz7DRl62WgYcONAw4K6/tBaXN9SFV26kUxPDKxUOIyt/clEz+3vMPtxP
	clTNzlFl+Sw0Zwk766c8fRLkY4PUXtEoUEuC0tGCx6fRAs/Kr38PkIB2q0eweFZd9pBx2tUAULCd1
	AVh7G4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Q7N-00000003mh9-1T0V;
	Wed, 25 Mar 2026 15:26:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Q7K-00000003mgX-2GQw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 15:25:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so45679065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 08:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774452356; x=1775057156; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lsqamBp8hVq8vMV9I7W5DvdI+pm9r55STzQZW1yMNLQ=;
        b=ngDyxPJEXCAXuszPQ1B4oehzVsc23jv80tZ4AmfatpXy0GuFsvsADEIKiMXNBB13X8
         OxaK3CG32LKcz8k4xlP37RKPKsKbDTMtXweOyt9er98iKbZ4NcI2izlvgmEcBdhC/EHn
         jA5kAx+QDwJ/PhCjcFs8/PREYiKB8pQHiff1BLVOStdWz+tDNw2qTkfIaPbiD8GqkzJO
         6wH6khqF8SVCBX2FxnuzRqQ5AlMnRwmE8J1tB15TzTr6eEufAA5uzH0OI/bH/95nILIJ
         ozEj1JZA82ekY3XxVmierpfcFFKlxm0ER1JmTwqtPmkXdbJdAdhPs5/kxjSNCH9OOwfB
         B1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774452356; x=1775057156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsqamBp8hVq8vMV9I7W5DvdI+pm9r55STzQZW1yMNLQ=;
        b=bdASmjfRjtC8NnyFzVGuxQhGWpHxx50beGJ+NPphwDzB7CPdLMWZ053F7J0P5uQF90
         6UPNtKyjWsq2ace+SNFmP0IRvYW8Lwnl3Z5ZbjeZm/fQJt88A0OljrWMoMir7HAq8JAA
         89lXwrUpGs3bq32TqcxZW1gtM3ZXP5R29wE3cmsZOPJS4+7Ai1LU0HvFK1LpSfXEVTLw
         JzWf9t0PVBrL9ioN3+oUmM9d4A3kkiJJlj32uTLqaHiLayVPdMcIPOKIKpzXzJ9TGxcA
         X/WsGb4bbYAb4+zbaVrrv1jlV3zrt2A9r0DR/knzGVn1zsgJ+MdmU25/WkplAhj1JMG5
         G9Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVYq+ZJr5GQCUpAuNSljpMMn3PxZFeLc2HopQJLo7w4ew9bf3OM3ukX47Gf8EtVWRD6YPQ+Wy6OIuShRkBXE/Sx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7AJAc3Zm6kq6FBEqEIrgXOOLVngvOl+y1pysX4Tn7aaJ6eZDo
	wD5uESA5HdcI9R0UShHbEtJZgjot/gONtk5GPoO50xGvLKYccbhiIKIn
X-Gm-Gg: ATEYQzzRGdurw1Ov5Dy0xy3jgj+RDyZPDGxrKKAdMWjyGY+ve3aso8a5jasoTlmCBBT
	8EfkRtZYBmecIibByASCMbv56FZ0c6AmO4Hgr4hd7FrGXsHvWbs0aIQhESWFKKPdM2oGdCqbNSB
	HZjZ333N13tT2uzhOb6uFm6VeB6FQ3GQTLLWDyaBFnKL6vCZk6BAoQDlU5QhlUZccA7ckN3AV3z
	7fJhyA0CN3QuFpkzZAfj1zZ5ZynefRrgtK1fPhY1AT2PSfHJoaf6YIkfx2XvD3yQop1O9chk1LE
	9eNoxdDGNEmO1jLcV8ABuR/STkzKf/2o0jVc6SxkVMQjANyDMihhame9oqnFWGEKa4iekX8jLJA
	/oXOjUhraao8a8AyXDG+Q6RcKc0L74u+po6g2IRVxQfZVQJsZW73QvEbf8IfNtUpsG4Bdyk/Vsh
	4zs/qDx+nD2LTqIhtJZIZq1b+Z/OYHa8ewwUKospnahKCrRyk0ajOWoADcuzKgpL5lOhi0bc4sE
	ZZzV7eCObfvQs55Znn/xsJeC8cgL30uyOisOjZXVxdQmp7DaXCEcsw=
X-Received: by 2002:a05:600c:1d0e:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-48715febda2mr57676625e9.15.1774452356292;
        Wed, 25 Mar 2026 08:25:56 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487172a72b6sm39684025e9.3.2026.03.25.08.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 08:25:55 -0700 (PDT)
Date: Wed, 25 Mar 2026 16:25:53 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/2] Add support for Variscite DART-MX95 and Sonata
 board
Message-ID: <acP-gZii2WrU6eL-@Lord-Beerus.station>
References: <20260313174707.26902-1-stefano.r@variscite.com>
 <abRdwy_AS046QVRI@lizhi-Precision-Tower-5810>
 <acLqjeqmR4eVDoKw@lizhi-Precision-Tower-5810>
 <20260325122104.GA19112@francesco-nb>
 <acP2UX6B5js_ozWm@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acP2UX6B5js_ozWm@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_082558_582814_4CE9F307 
X-CRM114-Status: GOOD (  19.60  )
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

On Wed, Mar 25, 2026 at 10:50:57AM -0400, Frank Li wrote:
> >
> > How do you know that the correct copyright year is 2026?
> > The copyright years does not change to today just because it is the year
> > it was submitted.
> 
> At least it should include 2026 because it is new files in kernel tree.
> 
> >
> > I think that you should refrain yourself for doing these kind of changes
> > to the code when you apply patches.
> 
> If original owner have concern, I can update it in my tree.
> 

Hi Francesco, hi Frank,

thanks for the clarification.

In this specific case, I'm fine with keeping 2026 for these new files
introduced in the kernel tree.

Thank you all for taking care of this!

Best regards,
Stefano

