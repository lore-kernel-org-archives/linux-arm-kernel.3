Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252D9CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 23:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXr28wg8D7Sns2qkEeLZq8j8Ed6Tt4Rhy3ccABxhAR4=; b=2PIoxS6ekVFSnxS5/JN0koKMqB
	njbYnIr9QjOSns9kH2JpJTMgnwnXLX5Y0jUpxY/YArtZXZW1jMCLPK+/FXpTc3Ay6G7WZssTT4MA3
	lp3SeF4zvh9TnasjVxaSwI55+q4pwkw8wmVDllIrUalsVGpK9clGCiaUZnmyYreXzTxkX2axi/RLD
	7U+3D8bwqkvGUcmjD4r5tyrvV594prmoSbi6T7GFhGiYe3J00WonGf8V/fHDyCXRm5ZwwTGcNbAZG
	SyOOk1vjBm5KWpOky/75DVAuZ3qJfp6x120TBpbh7aTqhurbrEjjllo57wYhMcrZLcEFdyVv51kui
	NTNWPUDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH98w-0000000GLrC-3EXM;
	Thu, 06 Nov 2025 23:11:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH98t-0000000GLqK-0994
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 23:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762470703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QXr28wg8D7Sns2qkEeLZq8j8Ed6Tt4Rhy3ccABxhAR4=;
	b=ffoNfZt+4EwKYQZhUq9CmQ7krU9OWDgy2PcqqjcavAJ+302QZWMBE3OQp41akYkDml5xQN
	t3j3R2sh5X1HxLx4VN/LXhD7SB3EphW4bAd6qdM1rpG4YJAvhcd1ojiAtG0LH5EI6ap5y4
	JxnRcLKT+5R8dCkk6Uzz3dJI5ySmWHw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-rs9Z8T1hNvSDtihQgGEnRQ-1; Thu, 06 Nov 2025 18:11:42 -0500
X-MC-Unique: rs9Z8T1hNvSDtihQgGEnRQ-1
X-Mimecast-MFC-AGG-ID: rs9Z8T1hNvSDtihQgGEnRQ_1762470702
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b1d8f56e24so40395285a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 15:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762470701; x=1763075501;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QXr28wg8D7Sns2qkEeLZq8j8Ed6Tt4Rhy3ccABxhAR4=;
        b=urWWbSRO/yYzp/x7nEpvRqcDqbBvo/dQ8X6dgMDHPZndL0lvdHzn9M9xxn1Rbbhr5I
         6lHNrD0tzZ2DVKJOg142UWmlCCQtMV+cCRP72BHlC4ynC/lZrFWrq2k5hLrlX2ofc8kR
         HZFTJthAc1a8OJtpFxtubl54PQZEfSRAAySTiGfjf63plpFbldwKslCqYK/KfFL4mQ0h
         UfcJ0r3VXAFhdBbfyKb9Dm13oskkwM/gvTtv/TSM3OMlAIAbqfZlOEZNEYbXnQ0Soey/
         tYh344t1wUAPF48gvB6lqwGIp/5/V4LrMWKwxHAx9z/uXOApQX7K5L22oVWuCdVaS6JR
         cHRA==
X-Forwarded-Encrypted: i=1; AJvYcCVZO9+Ns9DWl9GZnQrVhSYraSbuo+Z033hP3KdvCuGjHriFGW4i9l0UmKjOjZce71z/TpyHmXciMtA2K4gtmgZi@lists.infradead.org
X-Gm-Message-State: AOJu0YzRrMcXScAYPYUSF4aWb+k4iYnDNadlxJBSq7gQAlwN2XyEbDVz
	KtRzGBQ5MXHtT52UFXTnrqpb5mjfBUz+sxwHToeSTrZLmQqjPqrXpi7zcaq2cYlAeZsfy9fJTVC
	0R0yjtQyF5Z0244VtEeXFq/QeoryhRaLev/8CXkgS+w7rSkiwMpKr8/nx19vHEhlQpsCL/A3dH7
	/P
X-Gm-Gg: ASbGnctS/eh4RS4oYxnyz6lPUI+rr4JFwjDe3wjBvmrgz80WjZAeGDcx+q1hT883jqK
	wTcW0Zi879p13btUfXDm2jXacwrWLzWTl4lLhDCKwaygBngN/y1T45fw7MUc5M2LVygjl/NFQyi
	twZ5Rze5m//h1TLI1RHWRRso3dtQRvVABUPZboFhNhDnm2Et5JGKhm56gdRMwcI9/7X1M+zXz5M
	XqUBOiMooQHfBeEx4w7T9xvqTflUNTNVpHdWrLywXKe1o8VxLDgSlts1wS62JrzUGziJTC9cBWF
	Nep4WQFma8hPZLPljdmhbCv0IBwxmMJUnW8v/8ZF7N7xpmFCwB52MRuecIHdMKLmgH4H075YHOq
	Rn7IUPHVe+hH6UlUYa8BDmSOn1rrDms0Y/Q==
X-Received: by 2002:a05:620a:31a4:b0:8b2:43f7:c07a with SMTP id af79cd13be357-8b2452a2167mr193181385a.22.1762470701623;
        Thu, 06 Nov 2025 15:11:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVetiFRByjjykyfxVb5wuiQuE2TgT+5D6JC3vwCG5rcTtdy2u5B3i2rGtKd9IxnXFml+2NaA==
X-Received: by 2002:a05:620a:31a4:b0:8b2:43f7:c07a with SMTP id af79cd13be357-8b2452a2167mr193177985a.22.1762470701157;
        Thu, 06 Nov 2025 15:11:41 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2355e56c0sm281056785a.14.2025.11.06.15.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:11:40 -0800 (PST)
Date: Thu, 6 Nov 2025 18:11:35 -0500
From: Brian Masney <bmasney@redhat.com>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"mripard@kernel.org" <mripard@kernel.org>
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from round_rate()
 to determine_rate()
Message-ID: <aQ0rJ3ahOV0gmUVM@redhat.com>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
 <aMatZAX6eFI1RmDH@redhat.com>
 <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
 <aPEZSY6RC-UVclxN@redhat.com>
 <ba2e6b78e59afb7c89e5022770a142ec8c31659a.camel@codeconstruct.com.au>
 <2025101759-runner-landing-374b@gregkh>
 <2975918e3f3a7de245e93fbee52335acb78bb23a.camel@codeconstruct.com.au>
 <2025101721-twiddling-huskiness-4852@gregkh>
 <13566a08eeaed313ad789abcae1920d9b00483b0.camel@codeconstruct.com.au>
 <d53256b35ee7089607463c66bb4a8c3420faf058.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <d53256b35ee7089607463c66bb4a8c3420faf058.camel@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NlcbsGXWKMwtrISMysA3gDugwo7SBrXTgPOQEasCF5E_1762470702
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_151147_509018_BA0660D1 
X-CRM114-Status: GOOD (  14.38  )
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

Hi Iwona,

On Tue, Oct 21, 2025 at 09:01:23PM +0000, Winiarska, Iwona wrote:
> Sorry for the delay - for some reason this entire thread didn't land in my inbox
> and I just found it now, randomly browsing mailing list :/
> 
> I will sent it as a PR for v6.19.

I'm just checking if this patch should show up in linux-next by now?

Sorry to be a pest. This patch, and one other series in another
subsystem is all that's holding me back from removing a legacy API in
the clk subsystem. I'd really like to get these dependencies merged for
v6.19 so that I can do that cleanup work in v6.20.

Thanks,

Brian


