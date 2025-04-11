Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844E6C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 00:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEj/TlILN37TPKrS4vVDvJow8Rh350Q5eqqNTt+HqJQ=; b=zEd+5lR8kgbSr2OrV46gDDFsVh
	yP+aq5o0NA/xpLHxCio0aB2f1Ix2dR0FGDzli9iMTF6rgqvj72aAZWNDDf004fPX1tDVLuP64OnfV
	eSAinGF72m2G3ZmQhpQJi7Uot7LhCIrAottI4jqQsFdSqD3pdsx8s0CXE+DFgD+KAow1xZDtxJD8H
	fDmMR1zGYXfypF9zE7RHS+7lYJ5EFoAEd22kTdxY3gT9qYQMEmaKTdhDObFArtoHkpwzlGXtZi+tP
	ZAit78UpX1kOUC95yuJvCPrD6LM6fD+nmuUFSk7uVQNWKAu3Vl7YguRWWYMJQFDb4xE4JCuLl4maI
	eSW+njtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32Ja-0000000C8Gi-3KNt;
	Fri, 11 Apr 2025 00:32:14 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32Hm-0000000C8B1-2FPr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 00:30:24 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so1348959b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 17:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744331421; x=1744936221; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEj/TlILN37TPKrS4vVDvJow8Rh350Q5eqqNTt+HqJQ=;
        b=NAf0XI8W/saP3DRIpdyCz9zlFfl7o5DSqhIkgqFi/H8Nhnla9MRDONly0kplFocn0R
         2kcO4vTKp6qoKCsMxtCGPVj4QbxhafOsR3MgOmAXmy8w2DfvguFa4/GINg6pYtM8cR0x
         Q81OUuCK+RKKLqff/Yo0YuwZuNRo3Mpvwq098oPg94OJSxtycBmrgjw4Y+oTkFI8iDXL
         GyOUZnpgUSM4kCaIWB3T73eQABJjWGwb15/WLN9/ErX2GmHRdbei/81C0OZeiuHuE4O2
         9K5BKWbuJbK3sd3Cbh9PryY1Lf/nl8KI823caCaEE0qOIaB4g9raslpWV21sgD68xLAc
         QSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744331421; x=1744936221;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LEj/TlILN37TPKrS4vVDvJow8Rh350Q5eqqNTt+HqJQ=;
        b=aOE88zkaPOGX39qnf2MEicjmeS6IpvcRPjgayBoUp42BlSmUN3gSwtE9Qs7dUNFTZ0
         nfahdLGrBewDs/kr87MGKxCZdUhWhhIXKfcjotrb0ZCFhyzFHgp8EF73F2P3Bf7tLXVA
         sLhGxtj67BGuq6EanYiOt/iQKpddW7dvaaVPG1Liv5KL7qb2+NyS7ubruyU9dwDMPbue
         mQ2sL60MP6JhSPDWwN04mYxcA4IGVNMrFpvsYgqDof01o24WjyRrsAQJvk7khIIZl8Qa
         8sUAD1YApJ7pL+6SfScuRJ529RwHU5kTFFEjOq2RzOMYOivLjN/bRccokh2Sh1sAGkFC
         So2w==
X-Forwarded-Encrypted: i=1; AJvYcCUaotuc8z8c0TBQyhdvQfuK3dzNO6rhw1K5IitFg8sTqC3uokdBw0u8a2tCuy45EYitAgfmYCtnCfhyg3OoG4YK@lists.infradead.org
X-Gm-Message-State: AOJu0YyvZj18kDrfcY3OIrbexdxjumNcjmUYXbiNRg9wMGQ2nTPxDWCN
	GEagRWX4jt1JqUkuzW9o+qPz243KOGQJw4KdjTPQUnLeQquFhlEyyWcxuMbgaMc=
X-Gm-Gg: ASbGnctGZz/8epQqZpSAPCzZxfB6A2F3LqkZ0xRwlYBM/PIHwwsm+S00pGNUT1bdCkR
	tiTztr36ayU9vbT9CnYa/srTPop+pRRpuRJCQzDKV1CGEWrqhgGVXJZQ2GhwzskJgz+W67nRMLl
	n3WjOjgigipQxan/slXJWtHBs/KPd3XtA5LiaFAKQlIkINoARw+v1W7Yte5Ep61hQZTA8DQxCnR
	T3gPjM1LK5fwAoZS0bFkRMRNPnaqdISUrvSqil3z34XdX2ox/ktxq09ZCvjq3Zi8JQ6mCIGuqnz
	bL/IMHixoBFcEIJbhyFMFqd5gVKXvqziE7FkK+4=
X-Google-Smtp-Source: AGHT+IHK+hZPSxDXu+yULAA+P8ggs/de/t3JfqukjQr3W1pHmgkXMe4iexgqgEe5uUDhbixl0eakvA==
X-Received: by 2002:a17:90b:388c:b0:2ff:5a9d:937f with SMTP id 98e67ed59e1d1-308237e1b7emr1466823a91.24.1744331421495;
        Thu, 10 Apr 2025 17:30:21 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e666sm4395562a91.15.2025.04.10.17.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:30:20 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Sukrut Bellary <sbellary@baylibre.com>, Russell King
 <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Bajjuri Praneeth <praneeth@ti.com>,
 Raghavendra Vignesh <vigneshr@ti.com>, Bin Liu <b-liu@ti.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/4] PM: TI: AM335x: PM STANDBY fixes
In-Reply-To: <20250318230042.3138542-1-sbellary@baylibre.com>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
Date: Thu, 10 Apr 2025 17:30:20 -0700
Message-ID: <7h34efy1yb.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_173022_842047_934F9720 
X-CRM114-Status: GOOD (  13.32  )
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

Sukrut Bellary <sbellary@baylibre.com> writes:

> This patch series fixes the Power management issues on TI's am335x soc.
>
> on AM335x, the wakeup doesn't work in the case of STANDBY.

This series is specifically targetted at the AM335x EVM (which I don't
have to test), so I'd appreciate getting any test reports for this
before I queue it up.

For AM335x, I currently only have the ICEv2 and Beaglebone Black,
neithor of which support suspend resume with RTC wake AFAICT.  If they
do, please enlighten me. :)

I was able to do a basic boot test on the 2 boards I have with this
series applied on top of v6.15-rc1 and basic boot still works, but I was
not able to test the PM path that's being changed here, so any tests on
AM3 platforms that actually use this path are appreciated.

Kevin

