Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0A0CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fmt8NRxXiTXIxxt7so4xgdOFQzQhtk1IBnRJvL5Y6wM=; b=UgcJFrZ7ClFjrQY6X7IpnNl2is
	3TO8vT9rXzk9C54h9EmF0KtXbJZtOG4Va8neB/3VcIvrHoSQac6VbCMrKFIszaQzgiKwsOMCo7JA+
	ceN+v5tUuHSObhdLPsu0PiTKR4P/HobMs+EFHXgYZcBlkZ8xu7XyOES2QjakC99UudBdLYkyHGs0s
	LTC9Z2E5HGhmFiCukjmG1NuO0u5+v4lTc8+GhLqwBHDWdAd17flv+v3/qW1PsYaLY08vOu7e1x3sE
	6ev/YZt3GF8Y1m17qTCScQKggRHU/Jlel/qOEhyvqrSDTGFMUQO6OhHunp8yMqHVzGgcOH8S1L/8J
	dX33mdNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGKQ-0000000Cypi-1ble;
	Wed, 10 Sep 2025 08:37:22 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGKN-0000000Cyo4-3RqM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:37:21 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-629f06935e6so655808a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 01:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757493438; x=1758098238; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fmt8NRxXiTXIxxt7so4xgdOFQzQhtk1IBnRJvL5Y6wM=;
        b=cAyrCaqfs/gGx/K2GTdFwPj7xrzuZSFCSj8gBJE+5Ta36X8TMJTZoQhvocqGd24nus
         BW8NlUPAvVDrwX75uKZu7mqsymKIv7h/8/2P04r24BHW3v7S7DCRUnUheMiDC2REapKy
         rb76jJx6LhSs/xsXD1pbSlFfk3aWJjGI14rOzc1faDTEJKkTESFSRIjL8OBMAr2ai+3/
         pLM9FuqqwgZ+6kZyyX3SsaFet3807WnP4FyE2MgMw1H7KzMYhSAim+xVN1SA0tu14SYc
         +gly9+1Ygo5l783ruh3nUK+EP50tOqi02elUwLKvqwFKRz2JhgCcuZ0+GN1Ih/NMPX06
         hjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493438; x=1758098238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fmt8NRxXiTXIxxt7so4xgdOFQzQhtk1IBnRJvL5Y6wM=;
        b=JTKIhj3as0vWwo4u6zX8KvNKTyJnX3ETEwMmZWqtqpfcn+/dwO66+9Um2HeDwvhn1+
         cqyUF57OCzIjwEOqe5MI/sNewt/Xm3G+CNH6zfTDlGqL21rPObEBqIPX4egx6U0xkoZT
         fh0ze9EiNcp8mYVnoW3BCpgiMF+mUuTSw5awqRo7Gn70i8pwq2k7ihFvIRZO4GV4zfVx
         JOj3BJrYP7dXM64t2Jm1gzP8nrJpF551kdJaL8qFk+gX4FjFuOp5g7o8MqV672bfbPlE
         FdFrN9zrQcGr3DyLzEziHdYfA7Ry3oqcfDYMxzH50lNN2mCjV3GPNU93lu/kPQ0FWyf/
         fydQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPhhBVna+g2owTkQtDzBAmbkEJ+IkAC4R3pcbSLM8ucMYK1EzcocY5xHLFwIMxGAuG3d8c2640GOM4bl9ozoQk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7GyvZt3v54+naAssdCcu3tKTQirgwn70SqRVM30qVbNe1HO6D
	QgxLmrxpEiq7csb7YEXSDmh20gABbY4X8UokGUxX0yq/wsFi0s6r6dP7Xaseyw==
X-Gm-Gg: ASbGncuwJgQUMtYE+u/C6dg5jBiZy0XwYJfnXo6qXX0VMqnX64Zec8ZsTOz7q1KKouX
	5OyUvL8sgzOb7hKMY00j2uKuleIQeU/zOHopvQrTD1EUsaP4xYy4tRbDVhIcPZ42kkN6uV+2FY9
	le7ugzaDvAOLLy6GNHJAEjIds8ad0nNLgKaIkwzhdDyhfY3ruprk6QlklIhn2diUZGwuTgCbkUJ
	g1c1OOpFsn9eoRxDd5nCvXEG+sq1KLJ/lhyULvu8HBm0vRTD9nim9jKC5+KowY9E6XbaXn0DBzw
	r07qVawUR8uP+L3IdJ1J+3p43Xkskj0Kzny5u/CcRC1lnuiMoD+oV0cJrejVsk7a0p6RTmrcyZ9
	RGHzu9Pogghu2tQuZDOc2LEMuqw==
X-Google-Smtp-Source: AGHT+IFidFPKBI8cS+d+4gYHVAlOYg3Lgm1sKTkF6r8WI6UG693yE4O5MLuodha7xFNpnvYnc+AT1w==
X-Received: by 2002:a05:6402:4486:b0:627:e2d8:459 with SMTP id 4fb4d7f45d1cf-627e2d80936mr4573364a12.6.1757493437828;
        Wed, 10 Sep 2025 01:37:17 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:6669:35e7:fc93:9b1c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62bfe99ffcbsm2844962a12.3.2025.09.10.01.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:37:17 -0700 (PDT)
Date: Wed, 10 Sep 2025 11:37:14 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v16 10/10] net: dsa: tag_mtk: add comments about
 Airoha usage of this TAG
Message-ID: <20250910083714.gfrhsco3e2q7adxt@skbuf>
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
 <20250909004343.18790-1-ansuelsmth@gmail.com>
 <20250909004343.18790-11-ansuelsmth@gmail.com>
 <20250909004343.18790-11-ansuelsmth@gmail.com>
 <20250910082017.hjlq3664xvg5qjub@skbuf>
 <68c1376d.050a0220.2085dc.675b@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68c1376d.050a0220.2085dc.675b@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_013719_878340_EED2D05A 
X-CRM114-Status: GOOD (  17.26  )
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

On Wed, Sep 10, 2025 at 10:31:35AM +0200, Christian Marangi wrote:
> > I think it would be good to present the AN8855 tag using a different
> > string, so that libpcap knows it shouldn't decode these bits. The code
> > can be reused for now.
> >
> 
> Do you think I can implement 2 tagger in the same driver or do I need to
> make a library of this driver? Just asking what is the correct way to
> generalize it.

Look at the uses of the module_dsa_tag_drivers() macro.

