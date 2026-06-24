Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F270CDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2TLBBiPkk4ZVf9j7DhrwDHbQrDRv8rhbPrYITQ3CF0=; b=ZMKhVOZNEcNDu2rXDGIHAyLfdn
	3W1tFderTZzhN+YcVOq6ittPfpul5bhcCKehjttp0fFOJvigdUA+XkqmjqknQBP5BNLtKY5FAxcUf
	yqZsiInC7FiH88vuQk9kwOaGg/ZSsmQ7J++0QYGp6foUe5RqBcqCkoPXDMuixXBiCyDq1At3b4fc+
	JzZmAEFpFO1niDraeiShxHNthDIuxmd5EhajHcWh+VV5yjfdg/dqEqAyHGMbT4Jjmj4NSqgg9fzQb
	VRfOzka8rCm0UnQ0kxQqm97qGTt7ooUpnNu7OKBZCG+/d3OM0exYIVuQ+ZFgfPMhwugtuZyzHSYIq
	+csqlTPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO7A-00000007s1u-1I83;
	Wed, 24 Jun 2026 13:58:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO74-00000007rx6-19DO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:58:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49230a567a9so4869565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782309476; x=1782914276; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g2TLBBiPkk4ZVf9j7DhrwDHbQrDRv8rhbPrYITQ3CF0=;
        b=jumlCeeBLW0viQkDHCwcKqHYWxImFFVVsZBT79nsVc3TNVHChicL5KZyp7+K1gT/P6
         6PiapQN37ht15ghLgRIpvbXObjPt3lbxR95+MxijM6ig+Aimmpp/LSCZAu4gRpeLkR/i
         4sgLi03G5B7aRyPLqZDreMteIcMhZeMYJuI+xf27Tu/mZlGEUcOu6fJs/Fc4CbsaVWLm
         vSXaSeI3DfpEVIsKrif+D4IlL1DTKa36gAiVtJVwbRGvYmkxc5Lm9Fse3SQOwwpMggI9
         XNpcEU454/mHoHVAgfyVYMi2MaB4gd2knjHteeF+FzPwxzNhb9QjY+tS3LQkXXq3m2AL
         fF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309476; x=1782914276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2TLBBiPkk4ZVf9j7DhrwDHbQrDRv8rhbPrYITQ3CF0=;
        b=Y5eJyWdMNg/bq/943RG82+EK06WmTX9Kd/NgnOexYT9YeXKRpk4+bsFyUgB0KMsEnA
         yYkK6mftsNSAESKSn7qdp6iLfVSt1z9poW82a/ErhDrBzA59ocAWkN6vuGvJ9e0m+Rtv
         ta5iV6daV4jvOVtFGT+/S70xm9iFk32wwOO707ToOcGZNcRxSbm10JlGHrLNWWxSkS1J
         Yw/u1DsIxHuuuyRkTEzt0kAqO6MglAJmTxQLJf88Wm4DLXsR7NV21oMCGc42G1//8rYH
         6qdVP1DIanA1hDBHmDBdjrcq9wJ2zDGi9b05IiPQuHacKuROiRDx6d6Rzp9kkRmXMNte
         WH1A==
X-Forwarded-Encrypted: i=1; AFNElJ90ZOyJ75rR1pKOaZ5km/Z27Y6WfhW69kMTiFyqceqbrr+Q3SMV/25WLLBlDA8SCegF9vZrmMPxO/Fouv9rlX+G@lists.infradead.org
X-Gm-Message-State: AOJu0YwmWSEolOPz6mt8KptL7u4Lwc+P++vsDqB3gtZ+/9T/zH1CWuf0
	bOGOt9op3bIv3YczB8qf2P1Q+YtF9HtH747fCGURDmhGv1DSuo9O94nCapQYWcmiag==
X-Gm-Gg: AfdE7cksP432uNuMp4zM1DaMav/XDquIVC8HeGy+HNKolo+4JrH73z09prbyJgAtdv7
	mZs3Iec4EQT5dynBL83laia3DTwqEQKbmDKoKmkY9ieqo3WIcoBK65qnLxSW41ssaX1GNuFjmqN
	AmMpmcE81Y/Bh06kwer7nf48gVWqwH11SGZkd/FxB/Ep31Nw/SF724d6qrsw8mzEOwJ2HOQsOBZ
	+0pV/GG2/1U0nDHQsip7R458boIcJ+Wp9k4CJqWXUxZJppt+y5RGLBTumVuC8J8r56BFMTmydGX
	OcYjj/jJIUkNbqYjN3abtP+h0k4vfboA+aN+CKsQYBYp3oPtmQehSfjfg1Px8Rz1aCh7qDgWvhp
	AJJ9VzV82XYZrCY1ym0Ubeag53mxd2wqxGZ0FO0MhVczKKkz7MJofI3SL14sOUkLxVOraGud4YK
	XYiLafJYVvuC9V8RIWB8x+UNleeg71S+OCvdrruBS/jHmkj5M=
X-Received: by 2002:a05:600c:548e:b0:490:bd66:db49 with SMTP id 5b1f17b1804b1-4926084b8admr46495585e9.12.1782309475577;
        Wed, 24 Jun 2026 06:57:55 -0700 (PDT)
Received: from google.com (97.113.76.34.bc.googleusercontent.com. [34.76.113.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c226a6f13sm6686339f8f.26.2026.06.24.06.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:57:54 -0700 (PDT)
Date: Wed, 24 Jun 2026 13:57:51 +0000
From: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Brendan Jackman <brendan.jackman@linux.dev>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Brendan Jackman <jackmanb@google.com>, owner-linux-mm@kvack.org
Subject: Re: [RFC PATCH 3/6] arm64: mm: fix restoring linear map permissions
 on execmem cache clean
Message-ID: <ajviX8umJQiZ5S7z@google.com>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-4-abarnas@google.com>
 <DJ69RCVRBO0Y.3JCYSW50IC4RC@linux.dev>
 <aiuyoy8Kmr9yU4GM@kernel.org>
 <ajK6w3YTFpVaUl3v@google.com>
 <ajLqGZ7sfKsQaSf4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajLqGZ7sfKsQaSf4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_065758_329505_A7A2FACA 
X-CRM114-Status: GOOD (  27.64  )
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

On Wed, Jun 17, 2026 at 09:40:25PM +0300, Mike Rapoport wrote:
>Hi Adrian,
>
>On Wed, Jun 17, 2026 at 03:18:27PM +0000, Adrian Barnaś wrote:
>> On Fri, Jun 12, 2026 at 10:17:55AM +0300, Mike Rapoport wrote:
>> > >
>> > > Hm, maybe desirable for execmem but that doesn't really mean the x86
>> > > behaviour is correct. Maybe it makes more sense to change the x86
>> > > to align with the arm64 behaviour here?
>> > >
>> > > BTW we should probably document this API a little bit, I never thought
>> > > abut what "valid" actually means until now. I had thought of it as "I
>> > > can access this memory" but that's an unclear concept and now I realise
>> > > "valid" is a technical concept in Arm that's confusing. And it's extra
>> > > confusing if the kernel API uses "valid" to mean a _different_ thing.
>> >
>> > I've got confused too and that's how set_direct_map_valid() got into x86
>> > with a different semantics than on arm64.
>> >
>> > What execmem really needs is set_direct_map_default() variant that gets
>> > nr_pages.
>> >
>> > AFAIR, set_direct_map_default() has a single 'page' parameter because it
>> > was added to reset permissions for the direct map alias for vmalloc()'ed
>> > pages before there was VMALLOC_HUGE and each page had to be reset
>> > independently anyway.
>> >
>> > Maybe it's time to add nr_pages to set_direct_map_valid().
>>
>> I was also quite confused by this initially. I spent some time debugging
>> until I realized why unloading all the modules was causing the kernel to
>> crash.
>>
>> The reason I took this approach was that I wanted to send out a working
>> prototype for arm64 that wouldn't interfere with the existing, working
>> implementation on x86.
>>
>> Following your suggestion, I can put together a preparatory patch series to
>> refactor the set_direct_map_* APIs to accept a nr_pages parameter. This
>
>There was a patch Nikita sent a while ago that does something similar:
>
>https://lore.kernel.org/all/20260410151746.61150-2-kalyazin@amazon.com
>
>I believe you can start from there.
>

I will pick the 01 patch from there to my series.

>> refactoring would also allow us to drop the redundant set_area_direct_map
>
>We can't drop set_area_direct_map() because vmalloc pages might be not
>physically contiguous.
>

Agree.

>> helper. I could then rebase the rox_cache series on top of that.
>>
>> Does this sound like a good path forward?
>>
>> Thanks,
>> Adrian
>
>-- 
>Sincerely yours,
>Mike.

Thanks,
Adrian

