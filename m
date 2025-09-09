Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259D0CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3MUxe5idS+BGR3j6o3LYiON4iTePZTn2nSk7Al8lT8=; b=EkFSyUO6kibWK2L0AI8YUnvCIe
	s+kopZcsdsGdVKdM6oXcOxx1bDKlc69YkdzpUc7t3lRtng1QU66J3QLSydcUl1Zr44SMbIAfajpT7
	5n5KWIe5+6sWVhq5UXGNeOlcmPyqJp461+2braDFQ0J0XJbZpmwQFzrp2g5OPKsi8qF8zokQInd7b
	M87rc3muYjyv4EyJk0dDqyhQXDMaotx3eCwiqLnmAjrPIwgwKpSXABrI9rkex1ji25IWfLrmZtNzl
	jHMV7ST+BrxkC0UB+5zloCQCYTyM0TOl5DxfIWrjZ31C0/L+CL5yUh5Q7KbAihEusUI0Qk9sQaHUU
	Mgxx0bwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26k-000000095NA-2hHC;
	Tue, 09 Sep 2025 17:26:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1QW-00000008bMr-2yYO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 16:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t3MUxe5idS+BGR3j6o3LYiON4iTePZTn2nSk7Al8lT8=; b=YgYNBPAit6pSpY4AzVfD9vpBpU
	s92Bxla6bWttfraRXANf3k71iL1tIWyuc/jbB2aLiNhfEJHG+TNhcsoXrWG+R9XxdZRFx03dX8RfN
	SDI05J9wHk4maJ6Tag0qbZR3JJKmSQArYDa78cjZD2thfSMxGZIScvJcij6hRiMIfk2h/LCC3ItL9
	SpC8AgKwR+jZ+TRt0AT2byf4Clr5aYk1yefhcX2/nq7+CJE1pRMjgzs/oBN9z/n1u4yhEQZJo8Gx3
	Z4Dkv4Uzi+4XbdJTySuktO87bv0QMK6zrKh2TcG6hvpgXmX7hNkCmPHxTjC1QKT8KtEKGMrkolVS9
	+JfeS1HA==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0zR-00000005QM8-1bgj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:14:43 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3e249a4d605so4675127f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 09:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757434480; x=1758039280; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t3MUxe5idS+BGR3j6o3LYiON4iTePZTn2nSk7Al8lT8=;
        b=QnFCdijK33lxMV3CAtgiboJGT6rtxPD8Hw+0w1KKGUMERqWb8JQs0h+nCJwfVqROBd
         saOP6hSrFwKGL+f4ClZvHzTUsrNqRrnHSOPjeOKgDGAI4TZSsYGcuUtheh6PdLF42sNe
         f/xzH+gS0s2e+gWzGvuTx0IkxseKu51ceZebi/c+tPm/RO+Dlk96aeBMMQw6XvXfKz9r
         M4uTMPduvRb8uSinwHVbKy+mBtmJl74xGpMktH+31eqZ4qVfORCchn/DZ5D6c90yPNRs
         tDlGGSNhJDFQT8SR7XbmOSbmrZokTJOOvvwYNzXxvvtZu2zIOFb8I1j9igaoonqz1cGe
         HcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757434480; x=1758039280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3MUxe5idS+BGR3j6o3LYiON4iTePZTn2nSk7Al8lT8=;
        b=dIPTFTIJkD+uNUbP+G0b72n/FCiH8anunTeZ+bVicmFRuntaiZsQB6JW69oEPduLzZ
         heAVbZ4kb2I8Yap2mjtNvxTPoNuUQBL8QuPhm9ZszwNr34bFoE1VaxZaUhNgqc/yCCus
         9nmsxM69aH6j69obtpbQv1RasnBsWyTyBFiXat91Zu51SbKztYHpQrMB+Fo2ciGVA7ya
         xTeJ87ek3LvnA5uWI2XbJmg5QZ7IUUtpPBJHPWIgqBoh6inHdMmYZBB8fhDJhfg3zbQY
         jKuC1efT5slsSVLJd1TJ7K4zSB61aHFcoq81pj+YTe3pvnvsSExgO0yQbb1b7vrYedCx
         AwMg==
X-Forwarded-Encrypted: i=1; AJvYcCVEqC8FHW10mnic1V5M3q1a8wagBRDx5ntb/RvaC8FsM3fv+Z8HXs1M350GpsJl1TF598UnpZMU9iKJCMPWmkyi@lists.infradead.org
X-Gm-Message-State: AOJu0YwHJbDlK9HXj1cXFR+KPAWqF/nVm4WZ1JFmSMHz6J8oeD6Kn26n
	2hDN1PWd9NIm3yJgwwNXei5rDznKeyAEsQbqFf0AIal68Topy78xkFYHdcRkkQW7Tw==
X-Gm-Gg: ASbGncthOd00IxQhIXLJt8LoCc6aQl3sZQtcicDnnfQiA8eBsVIPG91dD1yG21fBmsm
	bZyRSusBGjAsmeQ9rdV9VwH7OTYyvUDw9WX8afKZE1F7kUyfsH7OFKjiAZhwN6rckrpwGCpR3dh
	MM6XD86glC3mf5erOHd64qQtxysg3vV2MCGZ5wbtI6Nsz856cwoNCVUeP/s6X6Js6MBdEOBcupq
	NiGNchtSJNcAtmtA5AX8AHvkGsp7sGoZVygR2w570YoMos8MW5lGO81Gd9rLsM8wZDbmbBPnDRx
	C/8aYZ2gdt2y2L3m2ls4EJuFbOJ8agVMUBYXSYt0hzMLN7J1gXMFCucvPgaiTYUtATOEGHAp9qC
	T9B3dWz4x5M4dryqALXTYFNiABQ3Yx0+RFsy1kkLlbcdeEvK9dR0K+AZL9IyzVKriewJYRdpzzL
	DsiAWB
X-Google-Smtp-Source: AGHT+IGptLchfw5sfmOjEPtY8r2qXSKc2v7A8C2EV7ihJJOKFikE7Xpor1boUUPU/n3AR1zmFBHKUQ==
X-Received: by 2002:a05:6000:248a:b0:3e4:f194:2887 with SMTP id ffacd0b85a97d-3e6462583c1mr8562991f8f.30.1757434479398;
        Tue, 09 Sep 2025 09:14:39 -0700 (PDT)
Received: from google.com (211.29.195.35.bc.googleusercontent.com. [35.195.29.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9a2esm3528836f8f.14.2025.09.09.09.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 09:14:38 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:14:35 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/24] tracing: Add reset to trace remotes
Message-ID: <aMBSa29ev0BNgr5R@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
 <20250821081412.1008261-5-vdonnefort@google.com>
 <20250908193757.079aae76@gandalf.local.home>
 <aMAZMaZJ1_Eny5Ku@google.com>
 <20250909094028.3265b751@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909094028.3265b751@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_171441_671943_9956598F 
X-CRM114-Status: GOOD (  22.04  )
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

On Tue, Sep 09, 2025 at 09:40:28AM -0400, Steven Rostedt wrote:
> On Tue, 9 Sep 2025 13:10:25 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > > I wonder if we should name the file "reset" to not be confusing to users
> > > when they cat the file and it doesn't produce any output.  
> > 
> > My idea was to keep the exact same interface as the rest of the tracing. I could
> > keep that /trace file for compatibility and add /reset?
> > 
> > "cat trace" could also just returns a text like *** not supported *** ?
> 
> If it's never going to be supported, I rather not add it. It not being
> there is a sure way of knowing it's not supported. Just adding it because
> the normal system has it is actually worse if it doesn't behave the same.

If later we extend the meta-page to support non-consuming read, /trace would
then become useful.

Another argument for non-consuming read would be to enable dump on panic.

But I understand your point, it might be wishful thinking at this point.

> 
> -- Steve

