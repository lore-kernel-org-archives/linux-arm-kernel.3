Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AB7F513FD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 05:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/SUdjzXEhgvW5puvAWCH8rFOth0bt7gLsKBvzrE17w=; b=Ap2WBbt7CqUQTo8IL0/IzmyiIg
	HNtnQ9SClbNqcUsI1y2UxTCL9xzALxmZqzv7RTnJWlRLq5EnQyoo0jlEvEcIHWMVoZ0yxO2xso57S
	42Xi5Ynj6sB9h/D4NAvNUV8496vwsVTnyaBP7WNE/lh+dGHQXkeuM4gjxUCqNzrkOwmVVC4zCjpSt
	edB5gJZFewGKBvvKXzSGAua27u+XZtuFjh/MNr90djfZpTDIOlvIn3pcenrd7Ogu64klyLUMa25S8
	+wvz0YrVzIKGhsNwUJUNE9Z/sFIMAPWKivIHJkQQaG4KwW3M1hekxM6YfHDfaiuMXuH/8g1EGYJr3
	4qzNfbJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyO1I-000000033Sw-2Qfw;
	Fri, 06 Mar 2026 05:46:40 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyO1G-000000033Sb-1w6H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 05:46:39 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82418b0178cso4961593b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 21:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772775997; x=1773380797; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8/SUdjzXEhgvW5puvAWCH8rFOth0bt7gLsKBvzrE17w=;
        b=P2Q5Yz/u/52ICbWFWDRvW460aFjPIHM73uhnDjpoEM8sx95a1/mo7MDZik9KJMIZaC
         1QcrwMd5KJPzVSPDS1R/vjlaA/8qK+D6coKWU3+/3GVbY//MU1M2NMpweFbfhefKf1y/
         yylNP6f19i4MJDHuZYGeW4UBAmV8y+WpNmHQp1aRvF01vvVAHMzrrGeOwTUpZ0m8W/ws
         QBfT8YWfc6E7yq9JQlrSzIrt6IMFY3vlPqnNtb9pg+Lucijcg8NWy7z0W/PRhpGhoDFI
         Sp+ik+V79KzoAc0UnDSfRl6ytnmRXdGajr0M5l6vsbLf298YPnlVh3ssbYpEdJvx3+KN
         DRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772775997; x=1773380797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/SUdjzXEhgvW5puvAWCH8rFOth0bt7gLsKBvzrE17w=;
        b=Xv9tKFINMj0q4SQP92rGK0Ywd9s81GAg+sTV8jga0hClKk5dED/xLmk261//9wrZTW
         mjuPOXjblcZwIgRoXSXrW7j7jnI2MVvR8v/0gEuqoLWDxjpNTltTbWAZzmmkU7vu07fk
         vNlzRDhdmtPauymLfJS89ovPzKutGVIrDoWbW78AgiFcGQtGVe0TdogYcpct7icu3ruL
         phg1zaQZwAsARZCO8MiXIAe+CK4xMReUA4xZUcPcbdOO8SxCLu47RCYxb3dV389arCdZ
         +eCSWIoJB07Tiyi8tvpbI2TrGwSVMMOgvE6G0BS7oo/eL91+FuAoMqhRJDrOspkMspVj
         4s9w==
X-Forwarded-Encrypted: i=1; AJvYcCXUWQ3oiVQEk8koZTSThV9Eeej8kYGei14UZnWEWXLD4dedDIdNf75HwIeGbGgmxwIkqeT5fAukyywYyNLrssvN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Ntlsw+xzr08aEFMdc7/IXGizzBcMEOz3+SlIbP3QWEBwnX1k
	pBrCbxJO9t2nEsCLj0b79vmZwpoP2ywJjxYyXsd22J9CCVMHImqE1DWN
X-Gm-Gg: ATEYQzxUcYMy67K8ptd5g3NPuqbYhbbATdYstzfbsBiR5L6NVaHJEi0z1H+vyCXdAsR
	F25UUD7ytKZZUavXcVfdqB5/UG0S+3dRWYvFsIUl4BDwRhEq0lpqkkOBzLZoq7PaG574yKiAtJK
	SX28dw86VTHAqjmwZzEYGCl66FyT9bEt9I+G06yo1sfrQVHsoXvABr56qVKbGQFBZcY9THSgoLO
	dECBHDr5XHwNgbgbP2jqDVSh9CDz2Y2Hg68WJho81WiqJ4dil0y+FKXPvHvdYS76DGI/AmV1Wb1
	hofMSggTLsljY+95Dk46iE1iRFxxAjK/gZF55T+k8z69zf4C8us4XBvmNnJaodgmmyJ9d5IgMLj
	WPKfH6/Q+mhK06Bi6FGmxq0N1UtnA51xp+Lqp+LgRu3tymYzEJxANa/e83unMdPRwxdpVeCNMA9
	aesB3b5gcu72WIpXbCbtkp98CiiAWtog8xcydstnRE3xOS0cPvwwJnKuRfCHPj5V0=
X-Received: by 2002:a05:6300:4045:b0:38e:9405:beff with SMTP id adf61e73a8af0-398590de607mr1154590637.65.1772775997179;
        Thu, 05 Mar 2026 21:46:37 -0800 (PST)
Received: from eric-acer (36-225-117-207.dynamic-ip.hinet.net. [36.225.117.207])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e182d72sm424979a12.25.2026.03.05.21.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 21:46:36 -0800 (PST)
Date: Fri, 6 Mar 2026 13:46:33 +0800
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	catalin.marinas@arm.com, will@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH 1/1] crypto: arm64/aes-neonbs - Move key expansion off
 the stack
Message-ID: <aapqOeRMJDmYc4lc@eric-acer>
References: <20260305183229.150599-1-yphbchou0911@gmail.com>
 <20260305183229.150599-2-yphbchou0911@gmail.com>
 <20260305193847.GG2796@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305193847.GG2796@quark>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_214638_504712_E552C967 
X-CRM114-Status: GOOD (  14.46  )
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

Hi Eric,

On Thu, Mar 05, 2026 at 11:38:47AM -0800, Eric Biggers wrote:
> Instead of memzero_explicit() followed by kfree(), just use
> kfree_sensitive().
> 
> Also, single patches should not have a cover letter.  Just send a single
> patch email with all the details in the patch itself.
> 
> As for the actual change, I guess it's okay for now.  Ideally we'd
> refactor the aes-bs key preparation to not need temporary space.

Thanks for the feedback.
I'll send a v2 to address your comments.

The arm implementation also allocates struct crypto_aes_ctx on the
stack in aesbs_setkey(). Should I include a fix for it as well?
Note that I can only test on arm64.

Also, I'd be happy to help with the refactoring if you can point me
in the right direction.

-- 
Thanks,
Cheng-Yang

