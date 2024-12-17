Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F02E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFIpSlbWhQWU4BmnuczxZhQrx3hDBfJmwoIXHjm0XOk=; b=aRZgK4hN/z87sT99u+80p1kYWx
	ZXt0bMcvGsl7d1nKvO6vGRSzFiw2nxvFBdAnDWxK0qp30bFFiarHhmrx9x3PsHboy4lSF3/2A9DCe
	kztdJ46rcDKpZ6fEqiUG6tC1vwUxJBWROAQwvj2uMxoohsWX4qC+fRaMOexps9xEVJHbe+r/fcNlY
	qsTX9cLbmB9L3APpwiU7smwiBz34DNdyf2a/4s6w7e29uvHcGFz4Xq9bA1ZUQZwkm17st8dwRLrwW
	fkQMpRtA1t1622zM29atyQnao+IMxk7DdSvgXHUlBGQHXujpCUird/OJJHy+S+JI+rKDChMtfgboW
	9/VpIOiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXHr-0000000DVNf-1MyS;
	Tue, 17 Dec 2024 13:06:55 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXGm-0000000DVAL-38ZE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:05:49 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9e44654ae3so816441066b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 05:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734440746; x=1735045546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jFIpSlbWhQWU4BmnuczxZhQrx3hDBfJmwoIXHjm0XOk=;
        b=pxzJg/F8qRo9k75MY7tNKeE/dIAECUz1/ajAAHSPgv1B6ghFWCzef3Hb7TPWJ9OuLK
         jaV+gOSetFvhWGhOis2LvtnC8yJ5QJv8iXS0aLYFVRvF04BaShk3UqjXGPpUXfziHRLL
         fmLh5YYor5EQSK+p+mf8703dbw63TG/5SfWMEjs7J3oOw+BjgqVc/v535S1vFWulPCVf
         qn6htQcRAFr1KEm7WuMF6gioaj/EHdz76C5sWMp9PLOfgHyK0/wISGkuZFCGh5AURXmN
         2FW/eNBW5iBrCrSlxXnE5WNXN0N9FxMn5g0c5g2ho6M2HWfF3+9CevDsVBpblYs5DpBd
         /j3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734440746; x=1735045546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFIpSlbWhQWU4BmnuczxZhQrx3hDBfJmwoIXHjm0XOk=;
        b=cpxgqIRuo5/icAezZB6lLDhkCtIG68xRO4aqfp+7UwDB+MRC7LsVq0AfmzKlMrqZ8X
         w9XGAtIoJ2uYHa/K0oo6UT9U91CibvwdvXGzRCMlJDnts3F/iwT+lpRie9VWFXuDcTcu
         FyQ8VocuksSib5QnuG/BEp4ZpiPxQ9VEc79jxbHLmnkn6Xteks3rsgs+S6RTBZS6Nqva
         Fw6VPEpH/zim3KQLKtEzxVF8sAzp4C6h+bA4kuR4dufjQ6HhTN99RYJ0Sq7TxB4jT1Fi
         rfZx/49/d/lVecV4tPfiAsLp6uUMyZH7QfFqmfmU1cTNda5Zv8gAUrG/Dq1oOntgivCl
         0oNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf1aBCUKhYG4o+8SH556k68QxyvTb7/VKUAjK3kcz7c8JWPuShHN1UlShJCqeKwfZXA3UaB6gkKx3X09JzgBtl@lists.infradead.org
X-Gm-Message-State: AOJu0YyYF8ELPGMbBPxRryfG3tQ/9M7Nf3TD9jDABJqnBTsadxo86GY0
	+N5R6+vtOLLIMKMWPYmYkTlkMXqG4SUHbYJrzK6ens0yfkYbSctcksm8valaUg==
X-Gm-Gg: ASbGncuMgr6arTKzWoddXGYimAT9mewkVfrbhUh9MZOFalxBYYMqJBKXoZufxnKL++T
	kpc+Y2rkOlHSL0O2Rddt2yyEYEN6aF9zoWjGnfQK6Gt00IQ5uftrx9MaipvhglHrdXUuxyjdWrY
	9UsKA8iDVuQ0G3nsBD6LxdDmDDHL/7F9mMsWvnQIBN0yZ/j8u6Si/lreSvhKyctaU/y/DKOcyiI
	OvdMrg3DSDmIvyaCORgdTSjtgedT3c7WyJJq4aWHiMH4VWFrkw7427VyMX5HTcNNWvrUVwkc9EL
	EpPmZMO6lWJ+sEU=
X-Google-Smtp-Source: AGHT+IGm64uJtVDjEAURcs9xZJG95uD+8LpWsogmwS7IwX0FntYGVqCsBRC/TY5BflaZ6Q9qsi8S9Q==
X-Received: by 2002:a17:906:6a1a:b0:aab:7461:fbe5 with SMTP id a640c23a62f3a-aab77e9c72cmr1588746566b.45.1734440745515;
        Tue, 17 Dec 2024 05:05:45 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96005f89sm446090766b.35.2024.12.17.05.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 05:05:45 -0800 (PST)
Date: Tue, 17 Dec 2024 13:05:41 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/18] KVM: arm64: Non-protected guest stage-2 support
 for pKVM
Message-ID: <Z2F3JZII0gh8iOH2@google.com>
References: <20241216175803.2716565-1-qperret@google.com>
 <CA+EHjTz7=dRz5X-CjjniJgwd87Q4DQbRdXzi0on4C21urYnhOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTz7=dRz5X-CjjniJgwd87Q4DQbRdXzi0on4C21urYnhOQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_050548_787974_BBBE8104 
X-CRM114-Status: GOOD (  12.10  )
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

On Tuesday 17 Dec 2024 at 09:25:52 (+0000), Fuad Tabba wrote:
> On Mon, 16 Dec 2024 at 17:58, Quentin Perret <qperret@google.com> wrote:
> >
> > Hi all,
> >
> > This is the v3 of the series adding support for non-protected guests
> > stage-2 to pKVM. Please refer to v1 for all the context:
> 
> For the series:
> 
> Tested-by: Fuad Tabba <tabba@google.com>

Thank you!
Quentin

