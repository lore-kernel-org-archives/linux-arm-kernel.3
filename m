Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B008C36014
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 13:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AymxfdBPdivTlBBSjvnlepuzTGycHmeguhnsChkicb0=; b=DCQTpp2aTXZQgcoOIUCRg+sFdN
	xAYGaNRYbKfmji/X87kGE7cdtk3JlcqMdVNtJ3wRLEx5AMFvy4NPXagEKg0VtRzNBnzmzQZuaz/zD
	g7dMH09vihXF5uoISLm7vGqU5j1mSMtZ/U2ophHyQ3jCIDT65GLXyU3SApfUHY1so27k6ST7JTqbo
	NAJhvcJHwEw7uG9tdtBGZ6/g74uAwVkJ9dXbS2fuzB5PZwRoPWUTp5/ITyulDBmQBbr9qsYSI34F9
	1KexRBehfMsDSnO6JGA/Ivsg6Q4TwMYJUfcsdTSik3WaHZDNGDiBmzULuTzcSqBGC/NUFaEQm0z9+
	vQvSXsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hY8-0000000Buc7-2m02;
	Fri, 04 Apr 2025 13:57:36 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hDb-0000000Bql6-2ckm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 13:36:25 +0000
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso3741459a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 06:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743773781; x=1744378581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AymxfdBPdivTlBBSjvnlepuzTGycHmeguhnsChkicb0=;
        b=CXEpnLqDCIWPBWg6hmuiihgBR2tn0woLXBfphlM03JFkr/9iXBxuI/MbuQDc3mHmfK
         FWLJauFZ+fDhzxqc2Uw4TdFNGkxOwhO4yOJUmn8xVzfTDAKayvflaEPb0Ll+E+hx7eie
         bFI18V6RyAEKgCSZ0+VHIWWkp3/sdAn0g1br0yvt8PhY99tbjdfugfObaE96qIirls8d
         wujpohV/pWhrDMA7z1F+D55bX4WFt31r2QEeiiNlRKvGr9n8K0+Wx8XX+nSxb3OEDWA7
         GysStiYvGto+sm8m8QIXJLXcMHajY6lgSdvqVdvj29p0SD7zs6xtMIj8sJ9CdnRVn/Zh
         lSSA==
X-Forwarded-Encrypted: i=1; AJvYcCVFjv172IJCjwhqXgkp63NtpmkudClaqAksmxdAIYgOpx33DAInDxFcVtGI4xBx5YErYYWRmZKA6e3a24zGktKp@lists.infradead.org
X-Gm-Message-State: AOJu0YyezVd/o4BygLEnZC+tT2ya/lMmcx6rx/YLn9pwhHi6uiO25wLD
	KR99gS2Cwt+8YQ0kgUdzoiCHa1FFDa5qUILSlYkKne/TAWldceOn
X-Gm-Gg: ASbGncupvXCzeNPWfFaKtCUgGcQd7DJLG+Z2v+qOfgranuc0gvEdluR2Mcc6CUTTdBT
	jDS7dToTWc5a+Z0CMjRVQEXp7h4nnK47Js83D8ZvVK6xVE952ee/vb1rRyXd/qQQHGH9tcmFID6
	4eAVJXhllLXGv7Gw6EEq2xCRKo3XEKUvtlNOLIoewoNQV/vlIRKmndFPsuM8pNf5EeMRv+9g5Vl
	tzgj6lA3eTHBPbL3hBvmM5H72vq3GI9tCUsbRzXHtU7a58Ras8M28bS4EKv7gSfCiHPTCx8Zima
	IDoVIgLHGu3KT40OQH7cH23l3WX9VmwDs+6REDW4aDqAIgw=
X-Google-Smtp-Source: AGHT+IEe1DcXvjfKi97dlkXleUL4qZHR/l5/Fg9N/S5IGWNfRlWsNbeszuME1HhRdGxUwtCnLnDDew==
X-Received: by 2002:a05:6402:2108:b0:5e5:e78a:c4d7 with SMTP id 4fb4d7f45d1cf-5f0b3b9a0e9mr2469636a12.12.1743773781185;
        Fri, 04 Apr 2025 06:36:21 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f08780sm2398706a12.39.2025.04.04.06.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 06:36:20 -0700 (PDT)
Date: Fri, 4 Apr 2025 06:36:18 -0700
From: Breno Leitao <leitao@debian.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, arnd@arndb.de, kernel-team@meta.com,
	vincenzo.frascino@arm.com, anders.roxell@linaro.org,
	ndecarli@meta.com, rmikey@meta.com
Subject: Re: [PATCH RFC] arm64: vdso: Use __arch_counter_get_cntvct()
Message-ID: <Z+/gUiv5gCuc7JfK@gmail.com>
References: <20250402-arm-vdso-v1-1-2e7a12d75107@debian.org>
 <87a58yz0cm.wl-maz@kernel.org>
 <878qoiyzic.wl-maz@kernel.org>
 <Z+57uXX3u0zeTGeP@gmail.com>
 <871pu9yvlb.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871pu9yvlb.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_063623_661578_F2B1F3A1 
X-CRM114-Status: GOOD (  17.24  )
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

Hello Marc,

On Thu, Apr 03, 2025 at 06:59:44PM +0100, Marc Zyngier wrote:
> On Thu, 03 Apr 2025 13:14:49 +0100,
> Breno Leitao <leitao@debian.org> wrote:
> > 
> > Since you created *all* this noise regarding instruction ordering, can
> > I pick your brain in the same topic? :-P
> > 
> > If my machine has Speculation Barrier (sb)[1] support, is it a good
> > replacement for `isb` ? Do you happen to know?
> 
> Probably not. SB prevent speculation past it, while ISB is here to
> enforce ordering. We're pretty happy to let the CPU speculate the
> counter, as long as it does it the order we have defined.

I understand `isb` kills any speculation very badly today, given it
flushes the pipeline completely. That might be reason that replacing
`isb` by `sb` makes the operation 20%.

iThis is what the `isb` manual[1] says:

 > An ISB flushes the pipeline and ensures that the effects of any
 > completed context-changing operation before the ISB are visible to
 > any instruction after the ISB

[1] https://developer.arm.com/documentation/100941/0101/Barriers

> On some implementation, this can be have a similar effect (drain the
> fetch queue, restart). But the intent clearly isn't the same, and some
> implementations may do things differently.

Let me back-up to `isb` purpose in such case (before reading CNTVCT_EL0).

From my understand, it severs two propositions:

1) Make sure that the code after the `mrs CNTVCT_EL0` is not executed
   out-of-order before the read
 
2) Code that comes before the the CNTVCT_EL0 read retires before the
   read.

If I understand what `sb` does, it only protects against 1) but not 2).
Is this the right way to understand it?

Thanks for you time,
--breno

