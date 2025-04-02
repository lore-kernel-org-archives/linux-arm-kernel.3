Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C8BC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 16:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuzG4R3fGEOVCAcfPoOTUO+6ntcv0bfx+Pvn/LkzyGI=; b=Jdn7URoXgNlM8j3qltj7NCnr7Q
	NEtaGdtDiXMG0ZkZY7nVbrD8ckiK2Q3C5iQfwR4n95cYvd9SGDpreyV/5Xpy8y9d0a310L1vv3pEf
	xLQ4GAFXWt38oO4BAbXuMITT8MuMQ7r93+MgUq4s5PlO57tCl2uFfhJIFS7xgsEsSphPASr7WB5c1
	SQvfIk9QsgHqiHFnm/kYx+8kdepUZTZ81oOyyZkuSRHOL6i2uGqqSXYICQc9hnnY2JNGRIVrqzKiO
	RklwVrXtXM3vhxj3t9PVDoYE6ZAmAfpibsruO4BujHJWjBnr6FBKWUcTi3qPgenw0e1Gov8itYi65
	Tbu23PnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01FU-00000006gDn-0mwL;
	Wed, 02 Apr 2025 16:47:32 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01D2-00000006fvA-0s9z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 16:45:01 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-72a0de193b2so63094a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 09:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743612299; x=1744217099; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VuzG4R3fGEOVCAcfPoOTUO+6ntcv0bfx+Pvn/LkzyGI=;
        b=yo6d+vSYSAaHtrUnHWc6tzDIyY/Jg4nG1gZZfMxqtz9LM082QRWOjBWOcCJX/TUs+T
         WppemlxEvvRWgQYUVnJQuIF6Vz86kay2NRLzG+FKdUak7xw8QBzEmo1NEH8YT9BMzlfv
         38XLo1qYMAis/SldY8H3gyxdAqYK+UrzAM75io6nNXmAzJHfn2enVPfjnKgv6J5wR5cy
         KDitjfkvNgEovElF40VMzK3zHHslXjy93Vzz5YEGj3s5tRdLBD5FrleEvMuux/Vime6j
         Ewijr7YNmeXEvuU5ywcXm0ZeDj2exe7zrid0klhhewAA0j003ET7QGZJzvLEHnrlTTgJ
         DDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743612299; x=1744217099;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VuzG4R3fGEOVCAcfPoOTUO+6ntcv0bfx+Pvn/LkzyGI=;
        b=Cusmf9n/M0Qw61bpMDr2BL7JTd3/HnRqcqXWQzoACqksD8RUlYozjGLGaCecebgYEo
         7T1HAeb0zN8lOPAEcxcibXXXHq2E6y1Py2p89LDgtGqhGwKsP1UVNzxCmt4azhqSM4+E
         oRUFgnKYSm+4pRnghmPWuFl6ETOgzAVywAr5/bha/fUgIh+yDNnUHIEPWJ/L1XVh/6+N
         d+g8goUDws554S604rRhu/PohsoLy1J8m+mK9Z1pgotX+EJ34ap9U8QBVuW4nBW5RuQi
         oHve+jy/Ge0WRNCTRYY2lHO02qrH/EbdPUwXsWZfqYIZq40TZHqPk10OefbrMIToBXQS
         aAJg==
X-Forwarded-Encrypted: i=1; AJvYcCWPOTLHLyg5CGjUSqm1B8+yFstwgcjjmzin6zao/PAIsuvJBajjbnjeS/bJlXxE728su3o66kFJ0Yf/56GEkiiP@lists.infradead.org
X-Gm-Message-State: AOJu0YxxSBAFEZJBn8IchfJmYNl6WYDOQN/tRs3yKZWNOUOOjoqKyfWV
	VlwITkHFxb7jOfiRS7IyzaGR70HcxqfR1SNwQyv/cFUzGzuTGNH+1jd4fsv0+Y0NZO0061a1mmQ
	5NXS60LIH5TXXDTiVyg==
X-Google-Smtp-Source: AGHT+IEtfiQ81dhFjIlo1nhzzYpS6z7yTo9b5I2hiuFriTAYh9htxtNtSS00ENc+Qm/R9+CszjB93qxoNQJ5CKjh
X-Received: from oacpy11.prod.google.com ([2002:a05:6871:e40b:b0:2bc:6c19:c219])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:2902:b0:72b:9f90:56c5 with SMTP id 46e09a7af769-72c6382cde9mr10771860a34.17.1743612298587;
 Wed, 02 Apr 2025 09:44:58 -0700 (PDT)
Date: Wed,  2 Apr 2025 09:44:53 -0700
In-Reply-To: <mafs0tt7eqt6f.fsf@amazon.de>
Mime-Version: 1.0
References: <mafs0tt7eqt6f.fsf@amazon.de>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402164453.2470750-1-changyuanl@google.com>
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory preservation
From: Changyuan Lyu <changyuanl@google.com>
To: ptyadav@amazon.de
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, changyuanl@google.com, corbet@lwn.net, 
	dave.hansen@linux.intel.com, devicetree@vger.kernel.org, dwmw2@infradead.org, 
	ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, jgg@nvidia.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, robh+dt@kernel.org, 
	robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_094500_252286_1B9F946B 
X-CRM114-Status: GOOD (  28.99  )
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

Hi Pratyush, Thanks for suggestions!

On Thu, Mar 27, 2025 at 17:28:40 +0000, Pratyush Yadav <ptyadav@amazon.de> wrote:
> On Thu, Mar 27 2025, Jason Gunthorpe wrote:
>
> > On Thu, Mar 27, 2025 at 10:03:17AM +0000, Pratyush Yadav wrote:
> >
> >> Of course, with the current linked list structure, this cannot work. But
> >> I don't see why we need to have it. I think having a page-table like
> >> structure would be better -- only instead of having PTEs at the lowest
> >> levels, you have the bitmap.
> >
> > Yes, but there is a trade off here of what I could write in 30 mins
> > and what is maximally possible :) The xarray is providing a page table
> > implementation in a library form.
> >
> > I think this whole thing can be optimized, especially the
> > memblock_reserve side, but the idea here is to get started and once we
> > have some data on what the actual preservation workload is then
> > someone can optimize this.
> >
> > Otherwise we are going to be spending months just polishing this one
> > patch without any actual data on where the performance issues and hot
> > spots actually are.
>
> The memblock_reserve side we can optimize later, I agree. But the memory
> preservation format is ABI and I think that is worth spending a little
> more time on. And I don't think it should be that much more complex than
> the current format.
>
> I want to hack around with it, so I'll give it a try over the next few
> days and see what I can come up with.

I agree with Jason that "nothing is ABI at this
point" and it will take some time for KHO to stabilize.

On the other hand if you have already came up with something working and
simple, we can include it in the next version.

(Sorry for the late reply, I was traveling.)

Best,
Changyuan

