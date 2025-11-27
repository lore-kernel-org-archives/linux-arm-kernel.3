Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FA2D10375
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 06:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6f4WuqT6k2ip8WDEtzzNxSWpYRVd6qzfx+6SGoFmac=; b=V0O3XEIlPh8vMI2UirDo36yvqx
	+E5yr2QDtQaTm7NZTvdtg8PROVkWx68IwiapfPjNXiZY4xw+ilQURlKCJ+i07rViTRXybzIrFnUuj
	pfh+AFuLHqWihZif5dvbLfYt/2Pyn5fG6EqK17g2mHYztpEkncaD8093L4rMka2JmBd4p/UVw/vsM
	JDJBipJC2jpE8wf3Ghsmnm5MC1nuC4fFr/5S8XKqdpzseBIzoJSjcMQQnqmH7NTBE3447VW7tH7DC
	pWfG6hOTceH8uUbs2XwJ4xne9zjX248sfc1wlfB+TUZtjtGyerjAawKft8ZlU73WlpjoZ7KGsb10j
	JHEMOiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOVZ0-0000000G3VH-2oQT;
	Thu, 27 Nov 2025 06:33:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOVYx-0000000G3Uk-31Md
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 06:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764225186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g6f4WuqT6k2ip8WDEtzzNxSWpYRVd6qzfx+6SGoFmac=;
	b=gAaGmAeBuyjAe06+vBMHxy+ay9snq3Rgh3qUXHGuEo612loLVRnxL+Ta2yVAq6Xd+pIVM8
	ys2CyiVkenkm12pr3hQm/EdvkE+KnWuZpMJMq/mV4buaQ2kvtEHnzNZSYXSjkHhuzS0v++
	sZPu6OFgTJ/rnQt5hGSmc7Sz4Oqo83k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-Yqm-WnlAPAa2PQsVxepf8A-1; Thu, 27 Nov 2025 01:33:04 -0500
X-MC-Unique: Yqm-WnlAPAa2PQsVxepf8A-1
X-Mimecast-MFC-AGG-ID: Yqm-WnlAPAa2PQsVxepf8A_1764225183
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-429c95fdba8so446984f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 22:33:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764225183; x=1764829983;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6f4WuqT6k2ip8WDEtzzNxSWpYRVd6qzfx+6SGoFmac=;
        b=ftzkgWZYnZ0zguOBGwbsR344zo1jVtk3PZ8nnZHanhfgMWC21H0XACuD+AVAp5/Y0s
         Rj2vWtx3qgjZXumEyIR7yem8w9sa5jAyMNgElO218RaNjpAu9iHqdiasp/kGlqHuOFJR
         QtUkfd8kD4Gxa5XLLa7B4UkNuHjKRkzNXgMFSydV8Dc90EztoaqAbDQoQhn872/1hlYj
         Q4EtXsLO1YKh/2p31tX59Ieal2DhL+4bVxD0Nl9SsTmmSimb+I+6PLVGhC8l/26zVkv5
         vU4/QYT7AkVSjx+xVD+EUkJS52gFSFZ9Fw7b1Rv3o+ZUIlR/bjZH8cPXCbIP7Yw9Gj9X
         DtGA==
X-Forwarded-Encrypted: i=1; AJvYcCWevlrp93Hmhmqz5XCzp9KW2Mb6cIaP/RVoHGtAVxw44endyW7JVFWyMNATei1gdtdm/n6j97ncu/tZU7y3sY0V@lists.infradead.org
X-Gm-Message-State: AOJu0YyIZ4zBVIvGSbBt3OmCcXFpEVHMYqKWjxL96wYXsZ+Yv+CBJZbB
	kiqZx7P2JlNHKmqsl3a0ws4gStP60h+lDeZbHMBuBz8Y7HyQjdbp27zFzHWmoh1517CTpji3vDg
	TasZpTgjmYRkJfd1ivqMQaQM5gGhGhRznSfDeV+GUHHqfkzEJv13CDL+deJsyxk0zI1FeLpTOuN
	by
X-Gm-Gg: ASbGncs/LwPUBVHqbxW5uys5kB30m+iJDzmRq2guB6r84YbpvZOq4c5aQFo129Ov9+s
	70Eefrrv84sVwcOW4tdhTZeI5QBY1waSvQweachqSEBBnIP+eb3osjryJOS214caL0ZwdWQulKK
	QVGLpfo+opcmvqte1xRf9gFTpxrnXkbfrsLF6tqLkowF3ygcKiCL2Sfev9SanhNPw/lc2SnVKJs
	7ldCmV5XRhMulFboWJG5lIKy4dc4TNMH0mL1QPo1u0KtIV5y2/No8Ub3Y9sCsrmt3TNmBQKQqh3
	ze/UB2JOmlwZDJp4F3Ew4/NXj7+y5oTVBKXgzzVgdTNabu+SDZXHNl/EepjQRyrtshIpMVp+unN
	wXzfqVf3YXzIekq4GWr6LiUePTLjf+g==
X-Received: by 2002:a05:6000:230b:b0:42b:39ee:288e with SMTP id ffacd0b85a97d-42cc1cee3bfmr24580363f8f.13.1764225182900;
        Wed, 26 Nov 2025 22:33:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEd5BXqoxLKYCHyGS/rkQDHdLIq8Q7KE+7gqo2WvMRKx7r9mM8PLb9fJTwm2WKv+5fomL13Sw==
X-Received: by 2002:a05:6000:230b:b0:42b:39ee:288e with SMTP id ffacd0b85a97d-42cc1cee3bfmr24580318f8f.13.1764225182391;
        Wed, 26 Nov 2025 22:33:02 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1caae37esm1510686f8f.40.2025.11.26.22.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 22:33:01 -0800 (PST)
Date: Thu, 27 Nov 2025 01:32:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jon Kohler <jon@nutanix.com>
Cc: Jason Wang <jasowang@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	Netdev <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Sean Christopherson <seanjc@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH net-next] vhost: use "checked" versions of get_user() and
 put_user()
Message-ID: <20251127013146-mutt-send-email-mst@kernel.org>
References: <E1226897-C6D1-439C-AB3B-012F8C4A72DF@nutanix.com>
 <CACGkMEuPK4=Tf3x-k0ZHY1rqL=2rg60-qdON8UJmQZTqpUryTQ@mail.gmail.com>
 <A0AFD371-1FA3-48F7-A259-6503A6F052E5@nutanix.com>
 <CACGkMEvD16y2rt+cXupZ-aEcPZ=nvU7+xYSYBkUj7tH=ER3f-A@mail.gmail.com>
 <121ABD73-9400-4657-997C-6AEA578864C5@nutanix.com>
 <CACGkMEtk7veKToaJO9rwo7UeJkN+reaoG9_XcPG-dKAho1dV+A@mail.gmail.com>
 <61102cff-bb35-4fe4-af61-9fc31e3c65e0@app.fastmail.com>
 <02B0FDF1-41D4-4A7D-A57E-089D2B69CEF2@nutanix.com>
 <CACGkMEshKS84YBuqyEzYuuWJqUwGML4N+5Ev6owbiPHvogO=3Q@mail.gmail.com>
 <5EB2ED95-0BA3-4E71-8887-2FCAF002577C@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <5EB2ED95-0BA3-4E71-8887-2FCAF002577C@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vQgeC8EDJvEiQuGuiv2BVrPv4jeVQ1T2EuLT4mwKUHE_1764225183
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_223307_831412_50713EF4 
X-CRM114-Status: GOOD (  41.82  )
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

On Thu, Nov 27, 2025 at 03:11:57AM +0000, Jon Kohler wrote:
> 
> 
> > On Nov 26, 2025, at 8:08 PM, Jason Wang <jasowang@redhat.com> wrote:
> > 
> > On Thu, Nov 27, 2025 at 3:48 AM Jon Kohler <jon@nutanix.com> wrote:
> >> 
> >> 
> >>> On Nov 26, 2025, at 5:25 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> >>> 
> >>> On Wed, Nov 26, 2025, at 07:04, Jason Wang wrote:
> >>>> On Wed, Nov 26, 2025 at 3:45 AM Jon Kohler <jon@nutanix.com> wrote:
> >>>>>> On Nov 19, 2025, at 8:57 PM, Jason Wang <jasowang@redhat.com> wrote:
> >>>>>> On Tue, Nov 18, 2025 at 1:35 AM Jon Kohler <jon@nutanix.com> wrote:
> >>>>> Same deal goes for __put_user() vs put_user by way of commit
> >>>>> e3aa6243434f ("ARM: 8795/1: spectre-v1.1: use put_user() for __put_user()”)
> >>>>> 
> >>>>> Looking at arch/arm/mm/Kconfig, there are a variety of scenarios
> >>>>> where CONFIG_CPU_SPECTRE will be enabled automagically. Looking at
> >>>>> commit 252309adc81f ("ARM: Make CONFIG_CPU_V7 valid for 32bit ARMv8 implementations")
> >>>>> it says that "ARMv8 is a superset of ARMv7", so I’d guess that just
> >>>>> about everything ARM would include this by default?
> >>> 
> >>> I think the more relevant commit is for 64-bit Arm here, but this does
> >>> the same thing, see 84624087dd7e ("arm64: uaccess: Don't bother
> >>> eliding access_ok checks in __{get, put}_user").
> >> 
> >> Ah! Right, this is definitely the important bit, as it makes it
> >> crystal clear that these are exactly the same thing. The current
> >> code is:
> >> #define get_user        __get_user
> >> #define put_user        __put_user
> >> 
> >> So, this patch changing from __* to regular versions is a no-op
> >> on arm side of the house, yea?
> >> 
> >>> I would think that if we change the __get_user() to get_user()
> >>> in this driver, the same should be done for the
> >>> __copy_{from,to}_user(), which similarly skips the access_ok()
> >>> check but not the PAN/SMAP handling.
> >> 
> >> Perhaps, thats a good call out. I’d file that under one battle
> >> at a time. Let’s get get/put user dusted first, then go down
> >> that road?
> >> 
> >>> In general, the access_ok()/__get_user()/__copy_from_user()
> >>> pattern isn't really helpful any more, as Linus already
> >>> explained. I can't tell from the vhost driver code whether
> >>> we can just drop the access_ok() here and use the plain
> >>> get_user()/copy_from_user(), or if it makes sense to move
> >>> to the newer user_access_begin()/unsafe_get_user()/
> >>> unsafe_copy_from_user()/user_access_end() and try optimize
> >>> out a few PAN/SMAP flips in the process.
> > 
> > Right, according to my testing in the past, PAN/SMAP is a killer for
> > small packet performance (PPS).
> 
> For sure, every little bit helps along that path
> 
> > 
> >> 
> >> In general, I think there are a few spots where we might be
> >> able to optimize (vhost_get_vq_desc perhaps?) as that gets
> >> called quite a bit and IIRC there are at least two flips
> >> in there that perhaps we could elide to one? An investigation
> >> for another day I think.
> > 
> > Did you mean trying to read descriptors in a batch, that would be
> > better and with IN_ORDER it would be even faster as a single (at most
> > two) copy_from_user() might work (without the need to use
> > user_access_begin()/user_access_end().
> 
> Yep. I haven’t fully thought through it, just a drive-by idea
> from looking at code for the recent work I’ve been doing, just
> scratching my head thinking there *must* be something we can do
> better there.
> 
> Basically on the get rx/tx bufs path as well as the
> vhost_add_used_and_signal_n path, I think we could cluster together
> some of the get/put users and copy to/from’s. Would take some
> massaging, but I think there is something there.
> 
> >> 
> >> Anyhow, with this info - Jason - is there anything else you
> >> can think of that we want to double click on?
> > 
> > Nope.
> > 
> > Thanks
> 
> Ok thanks. Perhaps we can land this in next and let it soak in,
> though, knock on wood, I don’t think there will be fallout
> (famous last words!) ?
> 


To clairify, I think vhost tree is better to put this
in next than net-next, both because it's purely core vhost
and because unlike net-next vhost rebases so it is easy to
just drop the patch if there are issues.
I'll put it there.

-- 
MST


