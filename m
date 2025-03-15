Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284EEC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 08:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tw+fc4NfEKao4mY+0HIir7WBWyUIdZnw/jJyuK9BH2E=; b=IMHnZAu2yCTkGWGI2oH/Az7q81
	UMfPwBQgAZC9JyzdkVEpKK2k4ycHn17nqlhkfOTsJd6xrJvEAHy7nPWFMsqxETy2yv9fJBxGn6pJf
	F0M03a0+B+lJ8kndc7SbEfe62bTRXuZutKo1s4iyafQ5C8C0YsThbELRubticDkj6PcELkzkHC15K
	dhGbYSgM5/c/sVr7RB/y2hp117S6IGQtLSaKUxX5X6D5n7GT0MTod//rcuDWqU71vDe8tM1G1DgVj
	TmorKyPZCl9CwN7siI3So+eI12aERFYd3QOMXLgpMQUMdwa43xjbiE4KQVa5ogl/navr4nusXYIAM
	p0pisouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttMuO-0000000G1vq-1CU7;
	Sat, 15 Mar 2025 08:30:16 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttMsi-0000000G1rL-0mdr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 08:28:33 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1538377f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 01:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742027310; x=1742632110; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tw+fc4NfEKao4mY+0HIir7WBWyUIdZnw/jJyuK9BH2E=;
        b=kYEsKD428B9TXzUoIILe1IwL+gGjOspdoaqAJLI4ailNy0Ltc5AsXnP+b447wIpWcG
         WcQGrJFYCQMlsGBexXo2FWjU45ZdqaCfoi79WOAHn1ESV29FFbbwOa0jreKh44LahRMZ
         ur3NGcvZwkfIXMLTKnOqjYfgIFh/yrF+BG6PVAD/7xzL38JHO9cZ5q/8i2pKk9zqf8Ea
         pzj4GfGk+hJmgQvB0TgWdfMj0gfsNJOE6+LJdk6g0w28tpgEI6ML+FuN/l7L1LojmLGZ
         0FbPhkQ+q7psUD/dkSpo6DmkawKgyMtIUkA4iehXNUE0kCkyzvY2h67EdFP9PcU6JFPt
         bN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742027310; x=1742632110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tw+fc4NfEKao4mY+0HIir7WBWyUIdZnw/jJyuK9BH2E=;
        b=Rv0H/An2ZDtxQ9gTS5xz4L8xzSiZ9+DmkEwY2clXSVff6uHpP+J6NLl/uCUJAxVbXv
         cACbF9JAL2j6ISbJAMGZzhu3kfTrPIouEX1VGOUiuteoqEq6nYuGjlJk2meHCgP0raiK
         +wPvbYukePCM6p9e+fYPx7ABHkiChttF1lVOJMjTUg3WTDjEUXP+DxyajHjKEFNoCcjX
         EKcBJk8s3IAgZbLifqc53kXX910SyTDb1m0ie0Q7PaUmw4YCMAFXixrjBdoykFktrjgr
         FUD/duYcIbQ7jCbzIZC4YzQ3QzsL9+9PqB18yiOTc6E9w7k2cHtYhMR30M9Nf+TZ2gjS
         2kOA==
X-Forwarded-Encrypted: i=1; AJvYcCUib9h1C9jVbuksT5aTKQiFQ3ea/DPjWt5m2daDHR2BeERQbszyxjtSdRrNZ2BO7MlNE9nk6gY+lhIsNhOqKl9L@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5QIadLoUPNdcFf9FpAB0pEIxa2FaeK9KvE8DZ/67YutNuIl2I
	XoR0ZFSVKZDB9DNGyyzwtZDY+ZFLN36FqFhyCuDsQi6bSjWBdVfiW60tfa04T64=
X-Gm-Gg: ASbGncsFG5SiZaL1B6LHGacDQ74K9pSvyt2cjENm2TuMS3b2NuNSjTlu4fRIqpQDtE+
	iCySb/bxRSR8/wUS9axB0PzSeeXTwqGOegSFSW7TSjqmiiJQDyuBPtQYacDnlkqqddW5FNHRf6N
	40Oab0UNVimLTESm3U8jXD9f01YWP7rELypKxxOho4Mmut6OLPJBac4FHEbJaK4/qlqIhi3Dove
	Sv5gRJBPe6GSgULonPyWJ1sDpc+Kdvm9S1LNug+1jSvGX2yZnjjW1EHBcfDw5DjXsVE7JnBJE+T
	QhlX9i4kVucCJIeoVwm+gKSpfQiekCLY+srRi/0vXUywY9jh9Q==
X-Google-Smtp-Source: AGHT+IGX8juxSsDfPWAzkPTOQTO5JfOEsGRPCrxD8xk+/IexxE2+2DpIGUNKP8e2c67L4EBVVjSBsA==
X-Received: by 2002:a5d:64e7:0:b0:391:29c0:83f5 with SMTP id ffacd0b85a97d-39720d47357mr7086407f8f.44.1742027310059;
        Sat, 15 Mar 2025 01:28:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395c82c2690sm8074410f8f.25.2025.03.15.01.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 01:28:29 -0700 (PDT)
Date: Sat, 15 Mar 2025 11:28:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [bug report] arm64/mm: Clear PXX_TYPE_MASK and set PXD_TYPE_SECT
 in [pmd|pud]_mkhuge()
Message-ID: <f8cf7bf8-4162-4846-bdcb-4793e4aeb439@stanley.mountain>
References: <d7902504-1ed4-452f-9b08-148f6b8b69fd@stanley.mountain>
 <Z9RsxL98s23mvqJa@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9RsxL98s23mvqJa@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_012832_241723_0105FA46 
X-CRM114-Status: GOOD (  19.03  )
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

On Fri, Mar 14, 2025 at 05:52:04PM +0000, Catalin Marinas wrote:
> On Fri, Mar 14, 2025 at 01:54:01PM +0300, Dan Carpenter wrote:
> > Hello Anshuman Khandual,
> > 
> > Commit 1601df9e366e ("arm64/mm: Clear PXX_TYPE_MASK and set
> > PXD_TYPE_SECT in [pmd|pud]_mkhuge()") from Feb 21, 2025 (linux-next),
> > leads to the following (unpublished) Smatch static checker warning:
> > 
> > arch/arm64/include/asm/pgtable.h:587 pmd_mkhuge() warn: odd binop '0x1 & 0xfffffffffffffffe'
> > arch/arm64/include/asm/pgtable.h:626 pud_mkhuge() warn: odd binop '0x1 & 0xfffffffffffffffe'
> > 
> > arch/arm64/include/asm/pgtable.h
> >     579 static inline pmd_t pmd_mkhuge(pmd_t pmd)
> >     580 {
> >     581         /*
> >     582          * It's possible that the pmd is present-invalid on entry
> >     583          * and in that case it needs to remain present-invalid on
> >     584          * exit. So ensure the VALID bit does not get modified.
> >     585          */
> >     586         pmdval_t mask = PMD_TYPE_MASK & ~PTE_VALID;
> > --> 587         pmdval_t val = PMD_TYPE_SECT & ~PTE_VALID;
> > 
> > This is "1 & ~1".  I see the comment, but I'm too stupid to know even
> > after reading he comment whether it's intentional or not.  :P
> > 
> >     588 
> >     589         return __pmd((pmd_val(pmd) & ~mask) | val);
> >     590 }
> 
> Prior to the above commit, the code was:
> 
> #define pmd_mkhuge(pmd)			(__pmd(pmd_val(pmd) & ~PMD_TABLE_BIT))
> 
> So just clearing a bit. That's why the reworked code has val 0 in the
> current configuration. This may change with support for 128-bit PTEs
> though, different format.
> 
> The comment is about preserving the PTE_VALID bit in the original pmd
> value, so it's masked out of both mask and val.
> 
> It's good that smatch catches these though. Any way to mark a false
> positive?

In the kernel, all old warnings are false positives.  We're good at
fixing things.  People can look it up on lore and find this thread
if they have questions.

regards,
dan carpenter


