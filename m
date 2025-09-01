Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD975CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOY5Dw0yIneTkFl1rkItoGut8jnz7U2o1MHv+e5ti3A=; b=Wq4amLrHIYbbkz6/eYOP8qI7rR
	ysY4hwdKom/443wKEsw2ueoxeuxUeogzfGElFXUMJPXO2X62eQqKO/ycrSQGKjhqeA/GM051/EppQ
	46qdjYo5PHpdtHfYnoVOHWrq2NBBVjVVMShH79wD7SYGBFOGegyl9kXYXWlgeFdH/hZaj1grX5wCW
	wSFEcVxWkAgO5pNe8e4EkcSPMC4Z2nGZwGvgoMofUpN5PymfKm16CfRFDZcH7NRiROdCrjIBlvplX
	8C0Wu7ARiA7gU2NHmvHMxwfF4Xuyqb3PwQ9CoS+SEKqF9wr4T5ekjbyKayUMoFEx/mP0qhFsiC5uq
	yMd76Ong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VV-0000000DH4B-1wJn;
	Mon, 01 Sep 2025 16:35:49 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3rN-0000000CZ55-0GhZ;
	Mon, 01 Sep 2025 12:42:10 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-324e2c12f43so534730a91.3;
        Mon, 01 Sep 2025 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756730528; x=1757335328; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gOY5Dw0yIneTkFl1rkItoGut8jnz7U2o1MHv+e5ti3A=;
        b=OS94MGhWpP7wRfUMZx7OVXCgpezOmIQ2J+QTQ54O98Ls2aPXjHsmucvOCMjxx1kiLC
         uoM2pXXsJVogMaJGA41yUM1Yo8ksfUz2ZceVNUyWbL2Bk1JDWttPDdM8mWfsLaD27J3z
         3DoiW/Ua8s5m8VDOeQVBCGT3d0ylm7UavE5vycjuMIrOHCvzC6bh2Owg65l0tsNjuE42
         tsX4B59Cbni70txtHo0hCQJtIxdjDRUP4ysxo07ErWha6vbDXi5cwXFpG/HSwONblWk2
         fOp/jcMeVFnkwOgz+rRFXevwNNeg0sXRv3sg4QWFgXSm4lAl1vDSq+dk4qnCCT5M8xjL
         Knqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730528; x=1757335328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOY5Dw0yIneTkFl1rkItoGut8jnz7U2o1MHv+e5ti3A=;
        b=W63yyGJEwatIO0C1Jayzg2Hj+oIaQtTwIBB5NVWdpY6p5AJ/huB9xcGZ6c2xcnUzpX
         57YsBPWQGPgR6ylTCSlToqswTA69efRr0FxETkdFGx1Sri2GKBDWQ/uABr+ULV3ZDP7O
         W41hRq0BYEGCgtk770GSL3psXY/xwcn7RCa0Ay3Q7kxBZYF0lFtTmFT98XhiWacti5sb
         y/+hts9lJbfxnhbNA4X/0axMzSUuA7oEIzLtUvLA2FakKgmKbZQJoLroTlTUVlBceEla
         Ie6KUFpveQgMaHrdAG0EzySWBwnoArFOHh2N6WSXKv+KDwcAc3pLQ0pujfBJIiIQHdM9
         y/pw==
X-Forwarded-Encrypted: i=1; AJvYcCVyj82pmqCJ7waIHzBFI6PXJopHtvfZJerueISAHhQMqHjbZAQH7nPWwyzhvXX/LkNedTDePC89A4q1zYYXkpI6@lists.infradead.org, AJvYcCXL+uvZgqAmZPchpoPStsbR7ddq74Mn66hJa6/GneYj7zBOA2+/8xwJGTqzlSwmQr3XwprNRmipfMlTLT2bEzrbJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyT++oDMFwEp7uDXSLVl6p3MR67aBaeWfQpJBYCfT1SzfSpRRVT
	S0J1M3nzg60FqImBY63Lshz0B/3uQvWWYtrw9elcdeXeP2aTlz6h1jol
X-Gm-Gg: ASbGncvtnfGtFgQDEHsZSsvHNqrdMQmV8Y1ZNmy+gogjg0jbjYyYar1KjGIIZzeIjmd
	5BK9Mfn1fEQbe07tnRTulFtMlq2y60x2IrFYrk0bec9vuHtLVr7xTdseSAC5uqRSvgDRaGnSEjR
	fk9w+HFcg5e2LVL4wQdjLyGVqFlIZe4LVgxpNgU8X+rIhx2Nj1W0UzFcn72lQVFJDVDcoheixkd
	RhaJNvZ4Hs0sld5t+PwZxQGUZXj7ezxB+BRZ+dRFfrpaCSkvhGhlMWic6oPkGgQ7t2PQYVuI8a/
	W41thkP6Hnn0ov/7EpMyhzZz5v9KG3KoT+PVJQbkJ460dzjmwqvFf1hCeslBcJKQcZo9HB+Fg8k
	gdSqJO+Cc0rz40EYY
X-Google-Smtp-Source: AGHT+IHUn0SC6xICje1UUoFTPSuAjVvF3tBb8TKjXdcRcJR9Br1XsPEsEJrd5UjL8hvq4o4e6MFvaA==
X-Received: by 2002:a17:90b:4c4a:b0:327:e781:3d37 with SMTP id 98e67ed59e1d1-327f5be1809mr8219063a91.6.1756730528211;
        Mon, 01 Sep 2025 05:42:08 -0700 (PDT)
Received: from fedora ([2400:4050:d860:9700:8e8a:52de:86af:cfe3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce0c5dsm16686640a91.21.2025.09.01.05.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:42:07 -0700 (PDT)
Date: Mon, 1 Sep 2025 21:42:00 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: greybus: audio_topology: avoid
 -Wformat-truncation
Message-ID: <aLWUmF2fDUyerjps@fedora>
References: <20250830173850.323897-1-nogunix@gmail.com>
 <20250830173850.323897-2-nogunix@gmail.com>
 <aLWEm2sQpmoNYLAC@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLWEm2sQpmoNYLAC@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_054209_105209_929EFBD0 
X-CRM114-Status: UNSURE (   8.22  )
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

Thanks for the detailed explanation. I understand your point regarding W=1 warnings and string truncation.
Based on this, I will drop the previous patch and leave the code as is.

Best regards,
Masaharu Noguchi

