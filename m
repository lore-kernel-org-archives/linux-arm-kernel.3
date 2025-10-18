Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F9ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 00:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PWNtFrwP/oSzLfkwsnt+/gfiH1RiWv5c2UepBm6CR8=; b=aFv3IqwtGfu/RDW/T1rG+BVHB+
	h4VqdWNWLaVEYM51A6XF2PBNrzTJWaK6GkyYS2EAseL+hxGBsjrtaEmQ7YrKq8MZ+0pUz3Y/b3LBZ
	xujYJ7dHtWCU8tT42YCfdqvMbwRPy9IyEtskqMHottBVDUsFg08Ewg8lbzymR4PI+ydcWb5XFFQFS
	9EANfIXgB62ZLhadjGKDi7l2Iwkr7C56gxFk26yIVBOwavDaB1SChaD1KDHix0rsDuCIvc8YrpmEG
	nDPUnjTfW3tUG/JxDICGAfwraVl7H6g7JeF+OcV+UKIoUX/htw7XpDzLVcTgyKk8iFepNmApsD0/E
	pIwnA00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9v2C-00000009HrY-1mBm;
	Sat, 18 Oct 2025 00:43:00 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9v2A-00000009Hr6-2oUW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 00:42:59 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-269af38418aso27129035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 17:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760748178; x=1761352978; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1PWNtFrwP/oSzLfkwsnt+/gfiH1RiWv5c2UepBm6CR8=;
        b=lW0fxsqQhBtgsWI3TfQ/9ScmzB+1aElxEC6RG4kc0IGTte+l9hVAp02nCni0xFbpg6
         E5QhvMVGbRzBLzUpNUkWtdzgO4inJFakmn9BQT7FaMVgXQnH86fDeC2fRqZNGXVfbvx8
         zAo61TZJgtwL93JNYUf7nQdgU26q+pUbAPgggyQsKfDY/jDQzictEHmDDjXb6xc0XCCT
         H0q8BSxuu5UNLgOyCGwAgAxfBAM0LQD9I/jmvZQ2ditOpkqJy5DnxHsTjiNYwhnoZS3G
         nRUs4BQxiU7yD/Gnj7bAyAxI5M0ksppOIt2G6EoUfIIOVapTgu9aJYEhfv0ivBy1RA+E
         zdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760748178; x=1761352978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PWNtFrwP/oSzLfkwsnt+/gfiH1RiWv5c2UepBm6CR8=;
        b=k8XyKOY+Wz8K0NF9zTPJd8uWwXDEA6HlAr6H9NTsY4ZiJs0vMPu75SeOLRqgr6tJ3A
         k+qafS/trWEVkeAUuwTH0cZHYQlsylumVjv8CkDGDI89rWnOiep8UKAQfQWeIcprh/8z
         yf9qkuB10ECEKMcMPw1J7rpjYx47b51VD98uVh2NbGSbvbkl4TBYv2K1NwS2qs2zVdOf
         YO/BkmpVvOtB/PJ9/SmZgq2RQPSVzhl426N/9xzx1icg+fDZ1GeF9LGluXki9vAV4iO4
         TwQrRjXJhoyBhjVP+l1O/ob3Z2RynUwAor+6oXEs7UMtVPzNgch//I+8M/Jk7deH6wP3
         02gg==
X-Forwarded-Encrypted: i=1; AJvYcCUiyDKvFXVFRYxBjMFv5iOnrkfqGn2VQKO8H6nT7JA6049PJU2f5riVF0fEF1LL92vTkFfYZl3eH8oAwVk7Pjj4@lists.infradead.org
X-Gm-Message-State: AOJu0YxP3d5fwODKVgxaqqHqaWeNtcFkLKUs7mq9z9A49XDgf96xDN3d
	kU2b1hbJYRq/qhzrJSKMGQrmIRo8AHg+S1teHn2m0cDH0eFBwjir9J5a
X-Gm-Gg: ASbGncvAViKhH/m7j2uwXe5FG/1t7yR9bvkBQlXPy/iIjGM97pk62tUhsSpoXMRLYLH
	t2BMKHUXP1Z10wWMjJH0/C6cDLvjbcLu1oSgtMGcqs7i1FCOF67qbrksD3dDrJu8tOrCkY1ib/f
	LNHVD9bjn23HAeYpRHDIVYroY0eYeotPUh+RHzBN/QdsqOOMCdIxWMSmagfP/sueVpT5fLHFhGR
	fyptm0d03envR8qHiDqsx5mQmLyxZs1LjXgEUj669z5zDEJ5giMw7t3DT1feRNhoZxW/9gHTCgZ
	gPOusJPm8zH8TsWcRJPEBjwL1cyeFIaH9mDEdx85rtH+xXebTerVoRAsjW1/j+zzZZCGptxFRzZ
	uXTLocxiAKpiTn0S8++6Cm1z+vDB9rPi1CIxgF8LZE71w0jaHKGh5TcwgZUq6hflGYnMnsAQ8WQ
	0=
X-Google-Smtp-Source: AGHT+IHk6GRhreHj//S6E+ILpNLEY2kapbyNg9O/WZnXJ0JV/NPB8zjD9Ghulw354rOmUlzfDrJAcA==
X-Received: by 2002:a17:903:1746:b0:269:a4ed:13c9 with SMTP id d9443c01a7336-290caf85146mr63860745ad.30.1760748177829;
        Fri, 17 Oct 2025 17:42:57 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d5874sm7975275ad.54.2025.10.17.17.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 17:42:57 -0700 (PDT)
Date: Sat, 18 Oct 2025 08:42:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, netdev@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] net: stmmac: dwmac-sophgo: Add phy interface filter
Message-ID: <i5prc7y4fxt3krghgvs7buyfkwwulxnsc2oagbwdjx4tbqjqls@fx4nkkyz6tdt>
References: <20251017011802.523140-1-inochiama@gmail.com>
 <34fcc4cd-cd3d-418a-8d06-7426d2514dee@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34fcc4cd-cd3d-418a-8d06-7426d2514dee@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_174258_708041_70683DA5 
X-CRM114-Status: GOOD (  14.97  )
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

On Fri, Oct 17, 2025 at 08:16:17PM +0200, Andrew Lunn wrote:
> On Fri, Oct 17, 2025 at 09:18:01AM +0800, Inochi Amaoto wrote:
> > As the SG2042 has an internal rx delay, the delay should be remove
> > when init the mac, otherwise the phy will be misconfigurated.
> 
> Are there any in tree DT blobs using invalid phy-modes? In theory,
> they should not work, but sometimes there is other magic going on. I
> just want to make sure this is not going to cause a regression.
> 

I see no SG2042 board using invalid phy-modes. Only rgmii-id is used,
which is vaild.

> Also, does the DT binding document list the valid phy-modes?
> 

It does not list. Is it better for me to add a list for it?

Regards,
Inochi

