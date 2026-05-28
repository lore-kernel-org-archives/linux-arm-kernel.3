Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D95CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 18:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjBnDhcN8xwPKgx08Kq8ygn56aIVDiT8Tf5r5T0cRW8=; b=FlTAzCP4uptXOgU8cg9I6ApSRP
	s0BbGKmeQC4MwjePU6EoFUWOSSLSH5Fil+eLgjG1VmS+0DIuEm9DfiaVBpmKTEaJnupDRaQHBnr+b
	PbVD4FRdtKMNOvRS+FrVyL5qu5jqoISSdUisEG7igZOE1Jj/wEQbSoq27uJKr/xdKw8QGR3aVIVuh
	kjtHLioo1kROZyIRvMi6iR5WkhJGHoz+nfgbMTdrOKoDUf6Sa7y2afJvWhZbeYARoVD/ZzEG2ummz
	ycQdZESgo+TgNFpbtT/AIHnaNL4cx4tuYe+5/g4yoLzr2xSOvw9hByWwLoim5ofYE4Snj4RDFIFzH
	Pb+LL0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSf7o-000000069yF-3Bei;
	Thu, 28 May 2026 18:06:32 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSf7l-000000069wk-3Tdp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 18:06:31 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso50934285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 11:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779991588; x=1780596388; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HjBnDhcN8xwPKgx08Kq8ygn56aIVDiT8Tf5r5T0cRW8=;
        b=ACaqws2BIxpn4Ez21qB4jmbU5/90wNl1w3NrGTrjPCkH9vI8GtdvUZV2AzVgCNeu19
         eXPHzNUSiMUGixziHiEdL0oJkD2l914NwzdUjRrRXQVZjNGUgZ6I/SsEbz/7JLTMG9az
         7Xj3e6S9Cr3c0Oepl0xtz1bBs9oP97gtnDbpYS1GGYl3BF0mPFf3n2G1RvgfcrU2SMkX
         QP4fFp/ojvlsqOrufBwTvpg00cffR98fS7s/uM7CSXqs8ctoRU7WdAv6ObaODsAlPFlU
         /OMDoBYgUktoayFgmrIcY1GkiCdidRLFdu9q3Rf7t3LCwfBG72IpriSzvd7Ilt27V0xM
         p3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779991588; x=1780596388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjBnDhcN8xwPKgx08Kq8ygn56aIVDiT8Tf5r5T0cRW8=;
        b=m4SnKXk4UF8sCuRU4Y0F12rXKrlOGNzSKGbL48s+S+RyYRw1OQuR1jcMJbzp3NF9VI
         mMY+Y3bugFHLLmNv4PA8Vh4EzOIzkRsL0ZlkhVylrCkdOgf4okaspkcvs1Ba4sOfCn1M
         P8+7nFiCRtgnXRzlGmuyOJm0xvt9nPxrnxal9tHpTx2yD/Kkci4Zn4I/2Fg7dKXDLkmb
         Jyuau3iszEURwtQQmvIX3Lo0iqzE+udWHDgWu2YhQKVXNh8L2qIMk+N/SYTusuTYuak+
         GOVQefuJd9NdR3KLiV3d7gGfgsm2CQTXHgXMX3WRoSB2IW25snt8EAO3WnOO++3R5IbJ
         UPbg==
X-Forwarded-Encrypted: i=1; AFNElJ8lsg2ygSZWBNdOCMjhIc2O7zltKXkwquu1NmlndmpJtZLNvRJAuFx0+jBQr75UHPyPK/FB9XSpyM4xOJL8aoVS@lists.infradead.org
X-Gm-Message-State: AOJu0YzVWYZZKtfoYVy2j8nfqTcZawSb8Ki5wrA5Aelw2mYsCkJiKGDr
	U8zPQU65wrjy/j1XdUxnrsYKQGvvGAmbN1H3hehHjJVeKM2hIj/fyc74JZJEsrNuP+c=
X-Gm-Gg: Acq92OEYFgvSOQ1eK5NOUtqg1KhvVljnZzuuLu/Tq2B23PwiCmT1qCRQH8eeWowxc3W
	mlSM5VaTeQNeaiDRDoCYlfiFYvqfHo6QDA5AzDxQSsEoH+jHVMmmcqOlPgVN4f6pIAA9ZTTjPAl
	z5Ew4iZNoV4CvzkmY3lf8+IqHbAoiqpQg3ttqZX326jPkwOv2T4UvdftCIK77nAzLrgdvroQRC3
	9zdhn4evRmwim6IInrhHpPKoOFv7T3SnoOR2uEstpoRhwZJicYeBAo6sdHcb28aFmJPr8zTxKkw
	AU2anP2UHJ2g6Vt7CRHi2QLoSdalMqETi7d9vSw5X5BbIsTLWgH9h7y4ji4jBliG5kfVcCSF5S4
	rvazvZxLP6pvYK1TxU0VFIeEROdQHSO6j+QSraJ4nMmJBTgd4XmipiuxL48UF5PEOzPBKeEAi67
	dNGksWcHwcAR5xZPZtxEdMJGW8tljGQFcyBKEMn2ZmkI1S
X-Received: by 2002:a05:600c:1992:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-490426bc7dcmr456146915e9.16.1779991588018;
        Thu, 28 May 2026 11:06:28 -0700 (PDT)
Received: from localhost ([194.183.24.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909a23daf5sm1264145e9.3.2026.05.28.11.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:06:27 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 28 May 2026 20:09:47 +0200
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Subject: Re: [PATCH v3 0/3] Add RP1 PWM controller support
Message-ID: <ahiE63mGZq711FXg@apocalypse>
References: <cover.1776932336.git.andrea.porta@suse.com>
 <af2bsEdAhYY9c4rb@apocalypse>
 <394b5e02-1aa6-4efe-a5f7-4468d1f82172@broadcom.com>
 <ahajNRmYNa5SNQnS@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahajNRmYNa5SNQnS@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_110629_876601_DC353463 
X-CRM114-Status: GOOD (  15.83  )
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

Hi,

On 09:55 Wed 27 May     , Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, May 20, 2026 at 04:31:42PM -0700, Florian Fainelli wrote:
> > I would prefer to take the DTS changes through the Broadcom ARM SoC tree to
> > minimize conflicts on my end, are you going to take the PWM patches for 7.2?
> 
> I didn't find the time yet to look in detail, but skimming
> https://sashiko.dev/#/patchset/cover.1776932336.git.andrea.porta%40suse.com
> suggests that there is still something to do for Andrea.

Right, so I guess a V4 is on the way soon...
specifically, about teh DTS, I will rename rp1_pwm to rp1_pwm1 to differentiate
it from pwm0.

Thanks,
Andrea

> 
> Best regards
> Uwe



