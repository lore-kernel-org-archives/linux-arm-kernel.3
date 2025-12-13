Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BC6D5B15E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujq1bGmRYdI/lNIRMhfdMuAx8/BNOBd92yqCSBrmzho=; b=rK9Keszj/Dyc1DPwXAMCGmbkpC
	OdVbnZhnsOk2RvzcpfNwb18WXAHMjMlFRpmwJWcitwzfPeUnZO+LhxGRQL6ciZHYEX2JkVomTgchZ
	FSWwQndMfsnG8sBbdO/xzHTfWj4weGuLJkrViFxvfYUMBY9IClmAJl7WFj/M7HOCPXmHHkCaPDz+Q
	+FkV7w9Hh2JKxqNp1P2Cb/0fHPn41eNXNB+6Ljwt9S9Rb7cYhOx8xSudzH6W5cdUM7j4GKG5/OIRg
	ViDkWdimxUgnOYUp3CVBSyTnHo/aYlivnTJ7pz7opeFpYLO2CFJo29lkdZJQceIKj9Wp9dr8p7gib
	rc86zX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUT1M-00000001msB-28tU;
	Sat, 13 Dec 2025 17:03:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUT1M-00000001ms3-0Twm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 17:03:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B76486013C;
	Sat, 13 Dec 2025 17:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E92C4CEF7;
	Sat, 13 Dec 2025 17:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765645382;
	bh=2UpWYya/vT8/YS5AEgqSuwFPzptYkb/tbVFf+3DX8ss=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j9C81qHShiadeRShnsOu1sAf29Rxt5NieumDPmK7zQmI3xoHdWw1NKrGr0EPQq4jn
	 60gmmv9aHc9huhjELKBVgct9RxV1QGoAkMe7A1KSKQHkpv93BJ+h23kW4kKQVbQtEf
	 j1mZCrKsROqh1jsYziAVG19CNOo3O5x39YClxl/N5rfPoZ2CWQ8CEhshjpcMPzK6Cn
	 U4LEXGqvyMDrapV4lmzTWoZy/Qe6Dctfhf7DC9pDS/sBxwnvJ0HzAQ7UxHUxcCHD1c
	 7juY++qMxRvkAbcpS9P/sah4JrqXek1rn32ULwYeCErCD8dmwbSb7Ql/xDk1c/F807
	 BxNuWL6hOs+lQ==
Date: Sat, 13 Dec 2025 17:02:51 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Linus
 Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-crypto@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH RFC 14/16] dt-bindings: iio: adc: Allow interrupts
 property for AST2600
Message-ID: <20251213170251.4d3b1690@jic23-huawei>
In-Reply-To: <176548307744.1801669.10354753289483698774.robh@kernel.org>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
	<20251211-dev-dt-warnings-all-v1-14-21b18b9ada77@codeconstruct.com.au>
	<176548307744.1801669.10354753289483698774.robh@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 11 Dec 2025 13:57:57 -0600
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> On Thu, 11 Dec 2025 17:45:56 +0900, Andrew Jeffery wrote:
> > The device has interrupts allocated according to the datasheet, and
> > the devicetree already defines the interrupt property. Address existing
> > warnings by allowing the property.
> > 
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
> >  Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >   
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 
> 

Doesn't seem to be a reason for me not picking this up immediately. Hence
I've done so.  Currently on the testing branch of iio.git as I'll be rebasing
on rc1 once available

Thanks,

Jonathan

