Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23EBC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 08:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PgcpZ/esO8INWaHTNIYzHKUcxhITaDwP+ZHht7YxcM=; b=TfGN+1sL6uLodzRM1dRE5usRnS
	7FUvXBq7rmGbWa6/5ic9gUXd1eZZjmetWXadKOgUPjN5i+MVeCURXVhHwx+gDLq94tkenRJk3KQd6
	ISBqm4570OaahIqPLYtkzlx+t63yB6aWjj2mzdZvjwAi9fTov+gE1y272mLzWh3t1fP3za5bah2He
	khFOm/VCe+7iSa1JKEjZM/kUnpxHPBEqRsET+6OhbIjqwhHyIXpLFnTpi4351HKgD5ATrKXSExUrH
	1WuFcvHLiNvkzdLNIGazdiUyON93NaIZ64im8D8JAdrM+As/zMIufxckxqOl3FF1kdYeDmVnHvRoY
	352xzHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txiRy-0000000AR6R-08D4;
	Thu, 27 Mar 2025 08:18:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txiOZ-0000000AQPH-1wRu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 08:15:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5322F5C681C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 08:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116A3C4CEDD
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 08:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743063322;
	bh=9PgcpZ/esO8INWaHTNIYzHKUcxhITaDwP+ZHht7YxcM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kN80WkkYt4/TjO/Zu1shRNEzCG0QNS7grNgvpXUv+HxUXqD6UK97w9H6EWT2DCgTG
	 cs9XKSW20hQGZydiUIsxe844jcUKkAPBfvKnVt+HAjlzUgsdvaLF8/KiYeypC9dBjJ
	 hrs3VWO4pejTqeZweR1qBlzT3qG7B14b38rFngUwdmvFTLhNjfY+179AA2vsZ2CRXw
	 L036VSY0TMHyWUs0A96rpXhdMrW3GzGdSKk7Hjkm2sa2Rrj+zwZi+1Guyy9RpsyShX
	 jXuHnNm/w6wFLZTr+yxOwKs6C+Y7m4okQwsb2TVTIiKccIeZBuS5iktMf6dRR5YTPA
	 u3M9LRVCdhqRw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30613802a59so8091971fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 01:15:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWyfaArQzu9/yIvGaJJ3Ozu5zUsuW9n+rllZXuquccXQYCpt76uyschxMxrpODSGC5JKKa+AKpWyQL3KdbyI7D@lists.infradead.org
X-Gm-Message-State: AOJu0Ywogr9RB3RoeFY8OmQVAMUQg2X0HAIjMX01gMMmm6M9ONP8niXL
	HPMG/EsgfXmP0I/WeXfah3ithjDUaptuveSMl/O4OSG2HvnvvyCJZ1DpI5Qh8lSjG27hYTBhcXQ
	vJaF0YE+3qT32KqzF3yoEPaRs3Qo=
X-Google-Smtp-Source: AGHT+IGkw8DaYd4Eu5NEbusC5ONevkWWyvGlPYa9uF267c64a1SDfB9oFxUUIQo+/5FzHdRWEcPrx38Io9KtoibvkTU=
X-Received: by 2002:a05:651c:388:b0:30b:f15f:1c02 with SMTP id
 38308e7fff4ca-30dc5decb2fmr9982021fa.18.1743063320450; Thu, 27 Mar 2025
 01:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250326200918.125743-1-ebiggers@kernel.org>
In-Reply-To: <20250326200918.125743-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 27 Mar 2025 09:15:09 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHCJQ4-KAPpWFA-rqjogbebUP8Y=NKrdEB1ZmSbKG3bdg@mail.gmail.com>
X-Gm-Features: AQ5f1JrIWn7OOFzH7s-batV_zW2_biAisG1z_ayEXTgeejni4X1t4_knp6dOK9A
Message-ID: <CAMj1kXHCJQ4-KAPpWFA-rqjogbebUP8Y=NKrdEB1ZmSbKG3bdg@mail.gmail.com>
Subject: Re: [PATCH] arm64/crc-t10dif: fix use of out-of-scope array in crc_t10dif_arch()
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org, David Binderman <dcb314@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_011523_544653_3146B44B 
X-CRM114-Status: GOOD (  10.49  )
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

On Wed, 26 Mar 2025 at 21:09, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Fix a silly bug where an array was used outside of its scope.
>

Yeah - mea culpa.

And the fact that we exit with a tail call means buf[] may be
deallocated by the time crc_t10dif_generic() refers to it - I'm
surprised this didn't already break in testing, but I suppose no tail
call is issued for other reasons.

