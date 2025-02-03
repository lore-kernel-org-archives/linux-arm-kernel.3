Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743EEC02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5wzLBJUEmaueHPGAWBI0Wr2N1tn0LQYWkY5tyBdPNM=; b=JwkKc1puimLyNRguDcZirILNZS
	y9PTu/Z5r+Dw+JdUq05dmdR6+TpJwiKcexq6fB/cjQGPCJnIr4PT/VsOMnwoKF6rG6b4EuJqK7pPn
	GiZI5UoZCCvemaRD0RKNsfn8k8sbbPkg97e+PpxfEPcXdx9iY4IAsDwcB1nZt4xy43+1kT59Xcyer
	kB+G/4PQVfctjknOTVg7nV1aAzoreybYuLb9/IMielzg36wBgt2siqp0xtY/f9FRCwA2n4KEEcBqz
	665ogp4+K+IDYccuY8xJTn6+k02R71AHDTp0wb2CKv7Vuj4OM9pZdA31wDrV8zEO03d5ikvlOAr6r
	MaQmY/3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teuHt-0000000FCRF-0HgU;
	Mon, 03 Feb 2025 11:06:45 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teu97-0000000FArX-3Inj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:57:42 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2164b1f05caso68010385ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 02:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738580260; x=1739185060; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T5wzLBJUEmaueHPGAWBI0Wr2N1tn0LQYWkY5tyBdPNM=;
        b=EcgKdbBF0H4QF2jIi8KX2KQpVEAL1VtQfj6GXQnppZPKL4uDq7cMjnWYCLKPC3uLle
         +z8LkLQKCGYQb5TUq8Nf9/BBeOGcmXdXRqCIFfCVvzO87H7Zx6SR72BiLE3ump/VsspP
         GFhjRrxy+VHH/4/n1hfanf3DMZ978NGK+TUK5NUhpyVvN3VUQQU27L8t1SgG2ZeUYZ7y
         rqXQPvAMwNJScrSxywvyQvw1/uicfwQtrGDN/OIfBlzNqeiSzW1cs6gVsVZlkjXlCVxb
         FLWVMqA02OjGaXu+HXLfZocphsgFPDDToLsTdFVUv3jQAtLR1MWCuu5CnaWtFJcmYq4a
         sBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738580260; x=1739185060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T5wzLBJUEmaueHPGAWBI0Wr2N1tn0LQYWkY5tyBdPNM=;
        b=TzhMlYLGWspl1Jk6drc0Iq7d3bhQHVc1owj5vyGXYnZXlIv1W96rvay1DaZxMAP7bz
         KjgteWkX8/03x5bnkuaYNgAxgy5k6D8YC61Av3S4NGwXoy9JJeSvoQGJfAHyy1A59BxE
         kntMeAV8guIy2TN6SPHCaUE0X4egxyktA5OF4VlqO9utn+v9E4ty66Iyh9wq0yN6kuE9
         mij4dn5yN6KxJa7PWRZSAqXA2Jf1V75T4SMs7fbIJ9lJ/aKAFt2RUSEcZ2nMunsPrf4I
         OQMv5wA+kl5ML6wm0zvnE3b+MMYQeKAqccprQjUMSB/ALt4spIKNKJlBuobjTfxQrgiQ
         hv+A==
X-Forwarded-Encrypted: i=1; AJvYcCUoI4wb1FNXOgEN17cgM0MsZJcvx0CcJbPLmN3nge+PJHcaxoMw7uLrq/mEjUrmoDs+8lXfOnYB7ZET6imHdVy/@lists.infradead.org
X-Gm-Message-State: AOJu0YztNjTinaF+63abzIMzDHwy+dYs0da2Zaso1XyYPKeUyFY3xIh+
	WCgzbtLyz02FYU81x4yFocvF6NDCzUIx/EpMsGOHflgPqKXbaIdvKzNPWoj5bQE=
X-Gm-Gg: ASbGnctr5c8LBtSbmthpJv/AFP5Ql52Vw8veu+hM5jAgqGXbGoAaAXHM99Oo7PTy3GK
	EwP7Ag4LoPEP9su/t/pEUtBtO8THk8yFEvojiMckAjxX8fSuisF9xUiQy78TK5O7nWIYA/OK6ol
	WqVEqD7Ho03Hjgtr2TSdkFYOhLXMO/87g8mdEHRH1damvACEWsk3Agu2yZ7jcb3DvDd1eJVI9Nc
	KZ49Kuj1W31UYsW2fV4PiAFmsBpjHD5TLZvJP1njTsvng82vKN+B+Sda431B4rEvBsMCT17a2Xk
	9xQaT4PnDm1FC4H8CA==
X-Google-Smtp-Source: AGHT+IGmjWIWKYEvHYasG0wmYEL/dNtj1S2N14U+kYyH1kl5FnrXzEkQXJKqSrqibFN1LCe+FoWnVg==
X-Received: by 2002:a05:6a00:2908:b0:726:64a5:5f67 with SMTP id d2e1a72fcca58-72fd0c03db4mr30024540b3a.12.1738580260474;
        Mon, 03 Feb 2025 02:57:40 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba3c1sm8370690b3a.108.2025.02.03.02.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 02:57:39 -0800 (PST)
Date: Mon, 3 Feb 2025 16:27:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc: bschnei@gmail.com, "Rafael J . Wysocki" <rafael@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Benjamin Schneider <ben@bens.haus>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH] cpufreq: enable 1200Mhz clock speed for armada-37xx
Message-ID: <20250203105737.ilu6kldt4onzcygs@vireshk-i7>
References: <20241125211452.14987-1-ben@bens.haus>
 <20241212070712.txkxgmiugzji3doz@vireshk-i7>
 <fjdblv62k3nhqgy7decdldtieo4zyv6phxofx72dreyq7jbm4f@qmkp3e2wyplb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fjdblv62k3nhqgy7decdldtieo4zyv6phxofx72dreyq7jbm4f@qmkp3e2wyplb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_025741_825450_238E956C 
X-CRM114-Status: GOOD (  11.02  )
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

On 15-12-24, 22:23, Marek Behún wrote:
> On Thu, Dec 12, 2024 at 12:37:12PM +0530, Viresh Kumar wrote:
> > Marek,
> 
> ...
> 
> > Any inputs on this before I apply it ?
> 
> Viresh, let me try to test it this week on Turris Mox.

Hi Marek,

I am inclined to apply this unless you have an objection ..
Please let me know.

-- 
viresh

