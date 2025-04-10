Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1A6C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 06:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNKcWfeOv5X1UZBWJNkpzhwgnAdoDWDmVg5nRct5t9Y=; b=UHIBEuK7IBzv1HU2qKV19bGWVe
	mJVulVJiDsKwLMThvlfMgbOhBR/U4+38XWepwJx3kpWD1J1v1IGvWrrs+p02F718Oq9QaLZKwh2Fa
	IJMM7n38oYTpZJzclzak4SwxGGTLIn+SCEjL1VlGh4uQNb9p4oXtsMNfafvVjhxCVMH9XG3RW/+Nz
	6z75PniPv0YlRJcw+MVOI/Q4ZT8jm7X58NCmKA9SiJ1btP55mdUxcbTT5z/m1OVY1ch+G2rC61h00
	+VDHou3ozeJNLsyiRRKPv2TA1HNk+Yk0se8qF+4EEH0eOgFbWzajXn3s8qCUGUtW2XsjHO9cDW+G7
	IeMVfEew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lJr-00000009MCl-1ZNC;
	Thu, 10 Apr 2025 06:23:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lGL-00000009LnQ-2tJy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:19:49 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4394a823036so4339115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 23:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744265984; x=1744870784; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNKcWfeOv5X1UZBWJNkpzhwgnAdoDWDmVg5nRct5t9Y=;
        b=smwgOM3Cs2gynyJbFSt9DzEVbaiXZ1T4mL4PpGsbRbsJK3F7tDR5ced8RGX9+TOT1l
         c/2PznkiFCMELI13wOTPuyZmBG96aY0XxLfJY0lR6hnGb8rRO95sjUoH7gJV2IHoqMo2
         Gsef0SrI6oEMpymPD1HPZsdNa71UKDhD4qfJxpPmLcOtbx2qukWWrBaSN3hhG4KlLIWh
         BydQWqN7P/PKMndLI7beE/z07YqkdMsI9HqmH9DcusYwkfiZsihoQtPxV3moBW816zjx
         LPgNQGcilpd+lxdUPuR4P+nNlOO5jOlOhH0fn3DwVCHrCcQ31pn3Y7ps3nxDvprbyEwc
         HZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744265984; x=1744870784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNKcWfeOv5X1UZBWJNkpzhwgnAdoDWDmVg5nRct5t9Y=;
        b=sIR42SUMqlwy5kRCRLQqS/vNBf39hqakzbkHlxgwPhK55u+QD3D7F+VuJAGxQo8MUw
         S5OBqbumgE3a1lYhSW++ZDSLfL5SWsfYDP9781RqKIiedV7sUOYZo0uuLsBrxe04MZ18
         kP+ekJhjF5h+He0HYOE6PbSDsIhexJuBpcox//gfokSgznuN86fBQl9LPLxWmkNEzsbX
         jt7gO3oFlUNxB1gjEGBHFIZSQn/3e8eFewGEPKGFLn8Vz1xtdacUT1fcuWcBsgec/kU9
         x+0YG129srBWZ8nJM7B0wMs5DJ7ANM1J19eTpd4KXsnH+wAmxUOehHbYuAqqWk/u1rTZ
         T9vA==
X-Forwarded-Encrypted: i=1; AJvYcCW5no8qowlRO4wNNR/QcpAfkvj6yGxS22IwfVWnIowSijdCaZav7K2i0c+vVK4AJl1Y2evm1RyNOKiA2VdUmo3Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0sMvW1fb+zXIhvb4MYYFkQJVSxcV2jIkG3+LNGetmsekLyoFv
	L7sxZlBAPhlHq8WBE7Df2VU5gTo34/eCgKEYGnfaDGkr+Pkzp+Yw03hUysfZTWw=
X-Gm-Gg: ASbGncuoMivUk3ycFB6FhWoIJK5LDCIU4Oa+FDAT32cLW6+elfEj0cUZJP3mP67vXb0
	LnPQv2tsz9CBdD4pN2JWZ5sdHWVTjNicpvtL2z6z3SlofCAWmSF7gnlUxQ1AlWPbmjsXMTUUuKC
	R8WOTJ1KHGksej5zvO7KcL45/SEVB4YRYYDsaiJ0z/ffrqIWz2wmYNGZU1wSTD0Ycxd5TZX/LNv
	D4wCGf/BoqS8N72VqCi79TsMXb5RDMIFjHJufNwr7Lp0mg6W7Kz03RKAZUNDVob4+SeU1B/qYaG
	yRDuQZIO+Yn4nZ2bK3Zuf6D0P+6RaRZjj+HxhyrM3hZ9ne0soFNgt6mP
X-Google-Smtp-Source: AGHT+IETxKgteFp+KK8rObwmu67CyaszSv6hN7I3pcGlN+mzeZYmJ4TDp+koJRpZX2WmH9ySINK8Og==
X-Received: by 2002:a05:600c:b8b:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-43f2d9604f3mr15862495e9.27.1744265983907;
        Wed, 09 Apr 2025 23:19:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f23572bb2sm39720035e9.29.2025.04.09.23.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:19:43 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:19:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Siddarth G <siddarthsgml@gmail.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH v2] media: imx: Fix NULL pointer dereference
Message-ID: <e4252054-69e0-4f65-bb75-54ba4a24e5d3@stanley.mountain>
References: <20250410050543.6963-1-siddarthsgml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410050543.6963-1-siddarthsgml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_231945_890605_350E2899 
X-CRM114-Status: UNSURE (   6.12  )
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

The same comments apply.

regards,
dan carpenter


