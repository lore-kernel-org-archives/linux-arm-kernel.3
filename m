Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6244FC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrOxIAfNdwTWJDcLnpqXv5maxVUX/AcXpAUf66B2atY=; b=SpDTVMJBMu0vBwYR3D2pDNJjWJ
	yPhDWAomgV1GkpVHQVMMyw8Ow81Rs61qRsEsFnn7DF4hGzKpu0Qk8NFsEMI5mfmMQ1Cm4bEiNgUY4
	1AeuQpwR9ICtkBB5vWFaAlQs/6oy7mKTEUc89DiemZ+2UPYRUwLqp2jutd1NXi7XnpjvJGBAeik/H
	5OSejJ1MhSlzDHKTU6LgfOtCvhFpWG2ytDcl4xD2t+OiD8frd5AddtO1AiQeadSxeH88vHJyHXrOf
	8Fck0siDxzWIwLtuLUFYhJkRCFDUOsq+47jkbgXf5jpXhqB9prgtcLFYT6v1Efykc5SzsKIpAwakx
	a37LINVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojlZ-00000005eQ2-3zvu;
	Tue, 28 Jul 2026 15:30:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojlY-00000005ePT-1hde
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:30:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D555B600FC;
	Tue, 28 Jul 2026 15:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1AC1F000E9;
	Tue, 28 Jul 2026 15:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785252647;
	bh=mrOxIAfNdwTWJDcLnpqXv5maxVUX/AcXpAUf66B2atY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RNWL2ctAHAFUtAXYu+10aBsk6Vc6+1R43xl5g5WKB220lX61TfgwKc9GGgdcTDYyv
	 SWB9v7iz6iJ3/Zilh5KxYPJrzrO7bY+3bDGRcQIYOZnFvMPa3HdGq3PtbdDiMrGVr1
	 ESJBRzYHuEAydCwrsc/2OZlu6RMfQyXyAu6xroZau9JJpZ4t2jYZCwrlsUPCQNbwvz
	 OA+6pA+TdhEN8hhQGkokvjaQvQTVp/wYoyF58zhnLKyeptLeg+buXRxvOcX/Q4PwiW
	 2swS+Oydt4jFiVNDEhdsQq0jHynT6V+QHgghhUJGXY7q7UHc3qPKIAq6ELWtwxTBjT
	 ILdDycqcRswFA==
Date: Tue, 28 Jul 2026 08:30:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] crypto: qce - Remove driver
Message-ID: <20260728153045.GB4281@quark>
References: <CAMRc=MdJTFokXLEbJMQW3V4FAMQid50Vx3fDB+CaNGUrzX-Pwg@mail.gmail.com>
 <2026072412-decrease-sandbag-70a1@gregkh>
 <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
 <20260724141414.GB1876@sol>
 <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh>
 <20260724150932.GA6763@sol>
 <2026072428-ungodly-outsource-b20c@gregkh>
 <20260724155144.GA2032@sol>
 <CAMRc=Me_uO0oMqjyuZzs7AxjWoSyy-=rT1eshmFQcNH_3H2ygw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Me_uO0oMqjyuZzs7AxjWoSyy-=rT1eshmFQcNH_3H2ygw@mail.gmail.com>
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

On Mon, Jul 27, 2026 at 06:26:56AM -0700, Bartosz Golaszewski wrote:
> Is disabling it in defconfig an acceptable compromise?

No, that completely misses the point.  The defconfig doesn't matter all
that much.

- Eric

