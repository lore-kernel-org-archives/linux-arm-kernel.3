Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE25C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 05:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwlCoX9n3S+W1I2p1kc9IDkLp+xJ/GgTuu9b7/n8qiY=; b=GF3uzCnkzAOMlutIBxI2NqaqxI
	d17QwYDU13EEjydBC4na33RI81WbvBqc27W7TxRezbYTeUj36qdyq6PD96iOF0is96zIYuem5SL7r
	det6Gt3dx5UzZjgQwpPA2hnIxWokpFllHXuDkFPMMwGSLWcYdewngAJ+jfNfjdSyW0h1SRyvqYWKl
	IU3AJNXrpt/rSTz5p5otfx75BiBK5jFD3R4RQMhzM4phhv664Fdcwz1I3duj/iWeA6qsR7GYZZB+X
	tinY48jSO5yeqZ0DK/jWoECocuya+0fXzzjRjKZTbF+6cbN6FeD9zVPzOBm0iwzCngN79Kfs0O3sh
	oWdp1psg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufAsG-0000000955b-15WT;
	Fri, 25 Jul 2025 05:21:40 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufApe-000000094rX-1Sjp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 05:18:59 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-748e81d37a7so1210362b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 22:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753420737; x=1754025537; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hwlCoX9n3S+W1I2p1kc9IDkLp+xJ/GgTuu9b7/n8qiY=;
        b=jMCQy5xZi0AxMrEZkYOxy8NWR5bhHOOb0bU7839EiwQ5k0tvhBfPop3W/kfqJvHA1S
         YYqBJqJXDDa/i9KICZLDL0onGwzLSn+45QuP1rzOc2vtqu/7jrGGHiH+WH7AuKNEEJxF
         QeSnz3cXPRxj0wXkDB2B6111kJpxXLIOKocnf8A7AWrM1uLT3x1+MAzrkQem0hCBguKo
         PMbu461ewhTMSvseBUhRMc6PpCrVJNZBQjplJpQa809f3ckKogc6oQaKJL8ma4pMzsHz
         9uOlfKFkXE9XQzFUcCiFWrFw8Dwd1h5GD+BEBoD6KcZvARX+ao1Ex8nCOaxtvjo5Hwv+
         uRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753420737; x=1754025537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwlCoX9n3S+W1I2p1kc9IDkLp+xJ/GgTuu9b7/n8qiY=;
        b=d3armE5Pv/HQ3ZMYEwTNtxaLoXD49ERmnC351DqENS7drvrYTo7f1HowM4eEfYUoGg
         9odGu/52AhSSXd2rxhUjEi2N2GAI62SIMLGn+czB7I4SJCyyw7SdxKqlwVfPOGT/me7T
         yXLo9wS6UYFtpuZWRRnTt6KFyns8FuFeFN1B6FNZZz3zSxKQX+FFDFStCKJ4IVvnfn87
         7URsxXrd/h80HtFXKcwAMQisvWF0HJZci4str7pRX/G6TAzGtmAct0zM7G29ygIP/RiY
         H7HF1x/mWJRPGVFM13o908hhJrkTWvi2opiTzYH1Cr4RIzA3Qz6XRu2M2WVZ7uXtnSAb
         yVDA==
X-Forwarded-Encrypted: i=1; AJvYcCVFW0sZpkzhl8fsJgLDiN0gLQc0jEfVsAfUT//8f5xZnxZawcVy9j/8x6YL2zsT9k21sEb3UG7HfZ3jaNz7DJev@lists.infradead.org
X-Gm-Message-State: AOJu0YyfwCQHuKZNWDElojTRW6TcsZSc8npfUBPvm0led228uynAcEQb
	oIhz+pewuca4Mk3ggAuMOShqdlQ3dfInQb/tZRSRwe0yY98UUCoJppwmQajmSHAI
X-Gm-Gg: ASbGncsBxnEbr2cHFKXKpWdLYfC8VvAN/nz1U6xagC8RT31JwqJkOFQaYGSqVwL0feT
	MWbNpJE3bgrBhej3TDnxZeUhzLMIZkdtV7/57jZ61Xxzd92ld1g5i3CDYlcjEcrqJnL8LwgesQg
	EQ8z1kTteLJw7tv2Z69nqtHfmEU/AHPOmdcBmXxY/lj40+5Von/zyZLU9mKjdJ+CHUdkEvjDq0P
	27JYhc3NIfqmfDHdYC5XI5x6kurjq2AEC+wSHquVXKx/PZixF8r7f7L21CTSe6wrJeZp0zCQmT+
	l2H1SJ/+rdsAUYmwqgI4/Le+tWaSeKWxsx2tSb2DKN1t9W9hLLeHWQPFuF3GyJ0q2Il9Pq5dDFT
	AQX+spebStP5l5i8DLdFhyR/AiWGwU33zgchkYL16q9G11vNKKy1O+h4kQgE3/so46GjD8F+Wj+
	c=
X-Google-Smtp-Source: AGHT+IFPixTsfdXK9p29I79UGfIgXeOO9MD+/pKk+rfiR7TaXdWeo4fQpMcFgUkv1hBHXBF3FZnWGw==
X-Received: by 2002:aa7:88c6:0:b0:748:f80c:b398 with SMTP id d2e1a72fcca58-763382d8395mr881883b3a.15.1753420737003;
        Thu, 24 Jul 2025 22:18:57 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae15838csm2966301b3a.43.2025.07.24.22.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 22:18:56 -0700 (PDT)
Date: Thu, 24 Jul 2025 22:18:53 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v3 10/13] ARM: dts: aspeed: Add Facebook Fuji-data64
 (AST2600) Board
Message-ID: <aIMTvUyHGd/ikKY9@localhost.localdomain>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
 <20250723233013.142337-11-rentao.bupt@gmail.com>
 <d09667e5-992e-4ced-ae30-7a4116a72c62@lunn.ch>
 <aIGGdbIX9HaV4dB/@localhost.localdomain>
 <769d6817-ee97-4a23-b013-29bc875a00cb@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <769d6817-ee97-4a23-b013-29bc875a00cb@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_221858_389366_0CA40CDC 
X-CRM114-Status: GOOD (  22.38  )
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

On Thu, Jul 24, 2025 at 02:53:39PM +0200, Andrew Lunn wrote:
> On Wed, Jul 23, 2025 at 06:03:49PM -0700, Tao Ren wrote:
> > On Thu, Jul 24, 2025 at 02:03:20AM +0200, Andrew Lunn wrote:
> > > > +&mac3 {
> > > > +	status = "okay";
> > > > +	phy-mode = "rgmii";
> > > 
> > > Does the PCB have extra long clock lines to implement the 2ns delay?
> > > 
> > > 	Andrew
> > 
> > Hi Andrew,
> > 
> > Thank you for catching it. I didn't notice the settings because the file
> > is copied from the exiting fuji.dts with minor changes.
> > 
> > The delay is currently introduced on MAC side (by manually setting SCU
> > registers), but I guess I can update phy-mode to "rgmii-id" so the delay
> > can be handled by the PHY?
> 
> That would be good, if it works. The problem with the current code is
> that those SCU registers are not set as part of the MAC driver, so it
> is hard to know what value they have.
> 
> 	Andrew

Hi Andrew,

I set phy-mode to rgmii-id (letting BCM54616S handle RX/TX delay) and
cleared SCU350 (MAC3/4 RGMII delay) register, but somehow BMC is not
reachable over ethernet.

Let me see if I missed other settings. I will drop the mac entry from v4
if I cannot make it work by next Monday.

Thanks,

Tao

