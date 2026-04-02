Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D18111224B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 01:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUiSeqS9PkkLaNVQ/zvAdXBaf2XPU2fS5cvEfFpiuvg=; b=VKce3MUpIvwtgjxPyu9MtMqJtO
	1rNfvQ4Llm0d3jd1/kXALxSlxVjLfVKggYfSI0lJC1F/5LTLf1FooTLyBvDWELdi7wW6rdX+Eeg5L
	l7Kp9WBV8eIHf5bWyNf3NFCCMgaAC79R+LRe2GSv4IEytkkDbG1BvFuySK1Dr1oAPfXxy4M3nLnP2
	HZE7vr491JH4poX8Gy03MHqfoTpU6C+T7J/089Me/fgeCwMyMSjKd/+gWX74KPXXQyk34PRiZG0lo
	KfRnWQz2XY1zs7WNwNgXEMeqnBnYhMbUuCGT+nrYN/cHTNX+lO8cvxcgUoFmClEJ2hcDQ/wTBAU6b
	NtT2XoTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87Cb-0000000GZYD-1LNv;
	Thu, 02 Apr 2026 01:50:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87CU-0000000GZWt-0hav
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 01:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775094625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uUiSeqS9PkkLaNVQ/zvAdXBaf2XPU2fS5cvEfFpiuvg=;
	b=SmDFjP0rVsSDuPF+F3/9huaZWU13Y5ISrQL2Y+sZ3TLIfCAoJtxrGkCce3a/Io6vMChf0q
	j/QXwUhZwxHFuHUNEwdzG4+hG8tFz0ZClHy9r4Nwe6/M0fKfZ8r3umzVz7rOnf6+2/vBgq
	cqVJClS7oJDFd6YoQ/5c4VgP4Dli4j8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-WIn-uh3CNdWBwzOyBscS7g-1; Wed, 01 Apr 2026 21:50:21 -0400
X-MC-Unique: WIn-uh3CNdWBwzOyBscS7g-1
X-Mimecast-MFC-AGG-ID: WIn-uh3CNdWBwzOyBscS7g_1775094621
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24305cb3cso3105215ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 18:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775094620; x=1775699420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUiSeqS9PkkLaNVQ/zvAdXBaf2XPU2fS5cvEfFpiuvg=;
        b=ALxN0fh+LOfoi8JL0Hx6HtaZTABcDo+3XmSaMGQMbpn9qKwVisp7otTy1QKwmZsk1c
         y+C1m0Ejb3Sl1cKBIGmhZH7btHcPdkBxtDYlo8aOwSy6w49M+S1qrMhf80W+2GWptrYv
         zY3cFT11xWmQE8FdM+ee1E+w6FvNC72iufZDLPHq8EKHGeaYyLTec3bjABjghifajgd2
         uJMeYa2yYeFoCuV4eyEHVTV1MHogTAl6xL2dLT8jTB7z50B/+iU3tcDM8i3TVW7DpyYN
         R0XpX5FIxGZuBIVdOxAo+ubnUai9NxXo6mAgIYm1UVIdjlBCH+2QDsGSt3KYkqAQyjyl
         V3Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVWehTYiUo+yOUJx3oJtpCZhVxilA/f6e+y/sOtUX5XAFi4iBjYrqtd40QtOBcaNBJOLhA1twEBUX2huvMOuXbH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4QRFGRr48s5deRLYyn5rF8Swt1UyBS/Ax7PZ9x2cq/h2Q3NrP
	KJ85ist+PWqLsLAip5Ht20NGsEPxJQhvdlud7gmw+23Ei19YG6l4kcIhQPjtr9XHPTgUjWe+GFS
	wvyBhusKqth9W7oX7Z3o5RTEe6CNFJq+jCDiSiuivQ5aR1gCn6tB6+upWldaqMnqVzOM956sLie
	9HtVv1Sz7r0cS7Ew==
X-Gm-Gg: ATEYQzyVQVKNO44yDMgitDmXDPgAPwiatxu75RZk6dWpg1FB1QadZqQnoFOuxCs19X8
	7BcdnfA+AaLU/AN6rBVjgZVv404CELiL+yzrNfftm9XiYdnEl4rsgz1o0XC4tIZHlVi3fHktHyM
	mCdqasK9I7qF9dcvW8IewMbop2lAMc8Gg94sJw8Nkx8duNaGuVerLNPO5By+4WghOzBHnue0pPp
	adzoGwJiiOPAnEkQn8ywu0wkZrMZWwCD1N0urOVg5bwhtMQYTsjxcQWASI3AYOMvlz28KR0zRvh
	2q7IxSgJU45kHQmIOZobLoZqoMEFQJq4CLm41usCfYpTH98kZRMblAx6oVIBzlZFx3OdKiH+Bcv
	Xh5PGPMcSVg==
X-Received: by 2002:a17:903:2282:b0:2b2:49a7:a5bc with SMTP id d9443c01a7336-2b269caa786mr54155385ad.39.1775094620324;
        Wed, 01 Apr 2026 18:50:20 -0700 (PDT)
X-Received: by 2002:a17:903:2282:b0:2b2:49a7:a5bc with SMTP id d9443c01a7336-2b269caa786mr54155025ad.39.1775094619683;
        Wed, 01 Apr 2026 18:50:19 -0700 (PDT)
Received: from localhost ([49.65.225.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd9fsm9680585ad.75.2026.04.01.18.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 18:50:19 -0700 (PDT)
Date: Thu, 2 Apr 2026 09:46:37 +0800
From: Coiby Xu <coxu@redhat.com>
To: Baoquan He <bhe@redhat.com>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, 
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/3] crash_dump/dm-crypt: Don't print in arch-specific
 code
Message-ID: <ac3J_pWwyUNOy034@Rk>
References: <20260225060347.718905-1-coxu@redhat.com>
 <20260225060347.718905-2-coxu@redhat.com>
 <actzxO1p6OlmK2gp@fedora>
MIME-Version: 1.0
In-Reply-To: <actzxO1p6OlmK2gp@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B4xWL8Cqn-8-wEx0uzlX81XOvsuEA-O3wUdyYxzWSAE_1775094621
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_185026_273692_44B5FAC6 
X-CRM114-Status: GOOD (  14.21  )
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

On Tue, Mar 31, 2026 at 03:12:04PM +0800, Baoquan He wrote:
>On 02/25/26 at 02:03pm, Coiby Xu wrote:
>> When the vmcore dumping target is not a LUKS-encrypted target, it's
>> expected that there is no dm-crypt key thus no need to return -ENOENT.
>> Also print more logs in crash_load_dm_crypt_keys. The benefit is
>> arch-specific code can be more succinct.
>>
>> Suggested-by: Will Deacon <will@kernel.org>
>> Signed-off-by: Coiby Xu <coxu@redhat.com>
>> ---
>>  arch/x86/kernel/kexec-bzimage64.c | 6 +-----
>>  kernel/crash_dump_dm_crypt.c      | 7 +++++--
>>  2 files changed, 6 insertions(+), 7 deletions(-)
>
>Acked-by: Baoquan He <bhe@redhat.com>

Thank Baoquan for ack'ing the kexec/kdump part of this patch set!

-- 
Best regards,
Coiby


