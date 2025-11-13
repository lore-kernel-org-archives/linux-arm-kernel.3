Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FFCCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 09:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afqFtStE7aqTe8kA6SQYmpVLf0qH3d4gh7yVgn6NgSk=; b=1aenJq6ydqlU9kYJr2OsnmAMOR
	Su+EOtDyoaufh9MTdzR2eM6dMri00buYrPhO1IDj0/6jAbl6EE5YEU9Ria1NAsFI6bHvr8pzKkFwL
	mUhmlyDPhQNxbl8drHDXNCy6KUo4hXyUK3Ge8k+gq6iuNKRpXSjwOvj6SvsebsE5itMWNqHxqVFFG
	Cf9R9DFtB9aWD6l++Zi+GpvbS/zs0nkuWgQ7Jzn9ecucZYj4M5TkvR+kqArJ98CpmgdD5/4cyXXBB
	TXJvnRs/vo3eU/IAhDEWSWcEdeO0A+1yy9bR84wVfLnu1pnOqdnSV/+A1MGaK1+W/fxF7uszFbKdM
	XWV5foDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTl8-0000000ADGC-087e;
	Thu, 13 Nov 2025 09:36:54 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTl5-0000000ADFb-3cPD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 09:36:53 +0000
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-656b8900ac1so368183eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 01:36:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763026610; x=1763631410;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afqFtStE7aqTe8kA6SQYmpVLf0qH3d4gh7yVgn6NgSk=;
        b=DqJ+VAuF4E2UV0Sr1epmukagcLewIoJFG/AsPBKIW8nY1QMTu8JeWuVsQsz+v0Lzs9
         /EJlkKm05RUsnZAAHX2laFAp9304L+rIpHZuCBjFwhD7P4yIQB+D0mw1XNfaeo3q9sjs
         0U5NP6AFcm0s3/7r7W0Hs0nRxBcEvBZwyRG3U/QtbICMLLTlHf5F+5UKRic5vk71W1N2
         KI+1FjFBplH69QAoPpAY+Qo8UerWrKWHkgabUQQvGk6qMKwnZBd7yOemCbioo0bB+0qm
         PoKTa+oasjo4lgA4hKM/Lo8H3cohWEoz6LKCGZXv2o6l0rWhlZOHwdICJbQOpul6J9tX
         N9QA==
X-Forwarded-Encrypted: i=1; AJvYcCUtgYOJ1oqFTnFYF+fd8qfxhvoN3xn1dwkxAW9Tp471eMYHEuqQzmtXfXfGfYftqcHod2L9LhtfsGEyd98pncx8@lists.infradead.org
X-Gm-Message-State: AOJu0YzUjzIBWAmkEbDJyqJMZ0YnGrhxzqjR/ruSfBUD/ZPtJHm3ieyo
	Zpr2aR5a1UyiGGg+eFKg1NYbtZpY4MG5UwG8y7qV0dEp+WFqcePzvozv
X-Gm-Gg: ASbGncv/Bp5ytkkRO9HJfZ2vM+TMf7d7zAMuec4S4uJr0N5rsTfE7+Wdd9yiIS4Faxm
	/H8uS+X8k+KzXdom8vbMD6PCm6tm26MuqWP2/SBQVOrRCqeg9SN2tkSVhQwyyPVDzcSereq3QyN
	BD8im3ujuA7uM4qSJqf+3+oDkY1knb5oLYVD1jGPfmKbWUFW5bIr2fDlDKE2V55JI21W7WEfzsf
	9VF04Kac2UdS2ZdryAK0hqOxo8ir9houXGj7uAAlC6dsk0Svaj2TxtykHpkQ8sQrIFPTpVisFkP
	UatQCkdz3iffT0pgGR/d5RBmWkd324JumJ5GwnZra+QDQ+P2CgCjvrxopnOhQpw92T4vbkPEq8J
	c5G4Q9QHYZsit9ryiNmWrg3F+93quRLmqsKzHEsvihRoiWm7YyKyFVbGTru80Y8s4sbs0D1q72q
	io/YI=
X-Google-Smtp-Source: AGHT+IGNwD3jOzyauRl7M1I2AVm7S4d0kstCdP90+Hgk3itBXkuD/m5+f3uEr9Ung4X9GPewFShbIw==
X-Received: by 2002:a05:6808:190d:b0:43b:252e:f793 with SMTP id 5614622812f47-450745f0ee9mr2565488b6e.36.1763026610516;
        Thu, 13 Nov 2025 01:36:50 -0800 (PST)
Received: from gmail.com ([2a03:2880:10ff:53::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3e85230b2bdsm1038362fac.24.2025.11.13.01.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 01:36:50 -0800 (PST)
Date: Thu, 13 Nov 2025 01:36:48 -0800
From: Breno Leitao <leitao@debian.org>
To: Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	paulmck@kernel.org, mhiramat@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: arm64: pseudo NMI bootconfig question
Message-ID: <sf4iq6uyq64lbrrggwssq2hxslk2qyetm3owplw5rwzqgnemrn@o4beszh5aewh>
References: <rs4igmsjrm6r2aio4nbe5jos3vcqk2u4bjhltjwtj2pn3cquip@kv3grgec7qrb>
 <86v7jftjq5.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86v7jftjq5.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_013651_921527_F4351741 
X-CRM114-Status: GOOD (  16.80  )
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

Helo Marc,

On Wed, Nov 12, 2025 at 02:21:22PM +0000, Marc Zyngier wrote:
> On Wed, 12 Nov 2025 14:05:43 +0000,
> Breno Leitao <leitao@debian.org> wrote:
...
> > Question:
> > 
> > Would it make sense to provide an option to enable pseudo NMI in certain
> > kernel configuration without requiring an extra command-line parameter?
> 
> [I wasn't asked, but I'll give my answer anyway]
> 
> The short answer is no. The long answer is that there is so much
> broken HW out there that dies a painful death when enabling pseudo-NMI
> that is isn't practical to do so.

That’s helpful to know. I hadn’t realized there were potential issues
with hardware implementation, which explains why it isn’t
straightforward to enable. Thanks for the additional context.

> It also brings a measurable overhead to some of the most frequent
> operations (interrupt masking).

For debug kernel variants, performance overhead isn’t a concern since
they’re only used in debugging scenarios—not in production. So, it’s
fine if things run slower when the debug configuration is active, at
least from my perspective.

Thanks for jumping in!
--breno

