Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A0FD31769
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpVxQLLNLfLph3m6EIkv3r8u00CnaqvwEZ6ejt8Iwfo=; b=Dds7AFtTEzytEnsUPwt4+0RU88
	VsTHf9SXwYm/WNmIJa4+441zfbDdEbM4hZQQOZ/bmhHymvhXzMY7ygQGvVmPoI1M/MDL9llqBEC3I
	DMhKKgSQJRSgAiolSisxYKGSlXyXlg2Mu8WzUqOaQNDeFNaiYFgOesKlSSIweuH+8Kv71uPvqu2aJ
	gccs6Rhc3AN15+gAle2Y1hSFWSJJzEOUALbeGeIKlWV9gGgQB21qvS0hk317eQtNt6NnqTh1GGh3Y
	CnebHFv3iHlAa1FjKc3er1uZXgGR3oHeRxUiy7tlX5UWOhJfjnReXUjlCTuEItEX6H2iB4+d7jU8f
	BXDvAqKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NUE-00000000EhL-12kz;
	Tue, 05 Nov 2024 17:37:02 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NSD-00000000EOA-0PHz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 17:34:58 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e3686088c3so4159139a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 09:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1730828095; x=1731432895; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SpVxQLLNLfLph3m6EIkv3r8u00CnaqvwEZ6ejt8Iwfo=;
        b=TR4BlUgrs55t18Ac77C9glmlsIlAYuExp0ClgIW1PDhAAJkEsI+kxT/3l0C5gfLHpm
         ucIxjdrs5xQUU3t1dJt/QL+NsQtnCZaj1w5ssY/gs0ebkSoRSPak7Uay4smn16QwykI7
         WAIsCBLJyQH4KBLYjN4uDSZtYtAHqZqTpAi/F9dPf59DA94/iHL32b43Ve1eRtqhKobU
         Rr1V7Xz1sBUVnd+4z+Jc6wxAd7YYMYpIOCgO4du7TGhFMvSvcQJBp41cpKHhKpCYjm7L
         er6HE7rbGqbfB0dPJEA+RknAIqmSw97aQioKef1png4Qyae+Q1Oby4yoYWKoiHPefl7a
         lfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730828095; x=1731432895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpVxQLLNLfLph3m6EIkv3r8u00CnaqvwEZ6ejt8Iwfo=;
        b=crL0Ck5oZWKpECyYwpL+sFS+yvpO0CJn35KgaeCRTBTStIuNN6gHE8AIhZFbwg2QQs
         L743s18sYH4kCHc3Rp3S3xkarxR58fp9KcNzbdURC34TWrqopvvlYFXuvAnyM346hbWO
         GmYAaYNd+w5LUTtJlRXqHtzqVMht7LhJ1kbpYoYsjrCn754rsKnonbMaQW25vDG/09Xz
         mJxiSyaJanaUZxwKR4e56lz259JpoK71clRNHxtuc5+vm3SX0HyxKRKjBuVzfVpUsDJJ
         DSaIGhD3WYcPt36Gf4ztx722SOLtqH7E9UwbPlgGKlqCBC2tR2M2tLhy3XAaijgkwLDy
         FnKw==
X-Forwarded-Encrypted: i=1; AJvYcCWCFMIWweiPnz7d0QF42Jp1+6lFRWulMVnXFEtQPrIFgiU9K8/vAikKuNLfH6+zTXQipA0lp9B+LXZmqemvvDma@lists.infradead.org
X-Gm-Message-State: AOJu0YxHh7HlPQQvRwByKd6H/sO7vOzhMog6Vl3493GUhEjfPsFxvx1F
	mhUo02WlENoVdeo490f1HKFHg8fodE4SIQN0UKU14zbl46dwZwo+998kDqpMPYJk/gZDH+/qHAr
	0txoEipmrZhEMyYSIFVTYmCluz+sxPdHXjh2sQA==
X-Google-Smtp-Source: AGHT+IH+bA1GiURFitv8kWYaSx/RW5cqeoyKLHZlSyIHFiiS2c0gxrHtSJy3vziWV/X5vWRNJ0DWzAshOtbMqV8BLE0=
X-Received: by 2002:a17:90b:3581:b0:2e0:7b2b:f6a with SMTP id
 98e67ed59e1d1-2e92ce710a9mr24650088a91.17.1730828095207; Tue, 05 Nov 2024
 09:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20241104092220.2268805-1-naresh.solanki@9elements.com>
 <20241104092220.2268805-2-naresh.solanki@9elements.com> <ac9698862598f0d09d35872d0e091537f822fbcd.camel@codeconstruct.com.au>
 <CABqG17j8RhFpNV+nJ=nLY8+uO_XXjbN55+Ce8op=6Dj5Z=_WOA@mail.gmail.com> <7d9657ff-1c4a-4167-982a-9f07e7b51f77@roeck-us.net>
In-Reply-To: <7d9657ff-1c4a-4167-982a-9f07e7b51f77@roeck-us.net>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Tue, 5 Nov 2024 23:04:44 +0530
Message-ID: <CABqG17i51TnPhAKKEAVYMXfqem9XWeNJuwzgLiYB81uCs0n91A@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] ARM: dts: aspeed: sbp1: IBM sbp1 BMC board
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jdelvare@suse.com, sylv@sylv.io, linux-hwmon@vger.kernel.org, 
	Joel Stanley <joel@jms.id.au>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_093457_193760_09431FDA 
X-CRM114-Status: GOOD (  14.35  )
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

Hi Andrew, Guenter,

@Andrew Shall I resend this patch series along with dependent
dt-binding patches ?

On Tue, 5 Nov 2024 at 21:17, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/4/24 20:10, Naresh Solanki wrote:
> [ ... ]
>
> >>  From a spot check, the warnings seem legitimate. Did you send the right
> >> patches?
> > Just checked again. They are resolved. But I guess the dtbinding patch
> > for the above warning are merged in hwmon-next branch & not in dt/next
> >
>
> Did I apply some patches which should have been applied elsewhere ?
I think it should be fine.

Regards,
Naresh
>
> If so, please let me know, and I'll drop them.
>
> Guenter
>

