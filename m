Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAF1606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cs5zfRXR;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=LDsSSODm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mtF3vQajQOPyJhZ8pZIyA9etEeF4yqJcmtRFAJQzuNs=; b=Cs5zfRXRQ24ptBLrNXpSMSQBNZ
	ETqf6CH4bufv/MZTK35FBw0Z4MNyb0Mtg1gJMqYmyK6T/ConFHV1mPJLEENTV2dVNqYfVmn5K1f6T
	sASaCnVsJxR3sMaZUA9Jr+nht5AGML1wanx7OQKyuJ0fwNfYvUhepO9knbOqyv0FEb26kxOPXyivD
	VOD4nPIfBZCQv66k6Qw0W0/qB/XQdAPfG2YoFY68tvQGxsrx3hiEKCB85zQC54CS2codSaLqBXN9U
	UNkSEgPrTTzV0CRrmOJaqJXF8XVmrbiwPGvtoUh+xMdAUG3mMSBfbj5WWBffi9Tdk4WaVt7v/8Oxw
	mDAQLyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzQm-0000000Evm7-431O;
	Thu, 22 Oct 2026 20:30:33 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzQk-0000000Evli-2JXB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:30:31 +0000
Received: by linux.microsoft.com (Postfix, from userid 1216)
	id 2CB2320B7166; Thu, 22 Oct 2026 13:30:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2CB2320B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1792701020;
	bh=mtF3vQajQOPyJhZ8pZIyA9etEeF4yqJcmtRFAJQzuNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LDsSSODm88dt4lyk/zBK7CKfoYnpC2lgIEiuBHBs/rtG60wZIcR8b8fvHqkRJ18mT
	 wvLDi2J83KFr0VuZ5xlQYfmTtrReRTLGjFv5zDjKO9gfBBbErkwW345VaYfwFDvl58
	 YJBSgYSZ8ba21XA2qMvHe8lfusIbQIWJHkaogxpM=
Date: Thu, 22 Oct 2026 16:30:20 -0400
From: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64/efi: only disable the EFI runtime service that
 faulted
Message-ID: <atpyXJFY1dN/W2nv@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20261021230503.2075618-1-hamzamahfooz@linux.microsoft.com>
 <13d53e6d-9fc0-4926-b8e6-3ee75ea82660@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13d53e6d-9fc0-4926-b8e6-3ee75ea82660@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_133030_682630_3E8B71CF 
X-CRM114-Status: GOOD (  19.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 08:05:17AM +0200, Ard Biesheuvel wrote:
> Hello Hamza,
> 
> On Thu, 22 Oct 2026, at 01:05, Hamza Mahfooz wrote:
> > When the firmware faults while executing an EFI runtime service, arm64
> > recovers from the exception, returns EFI_ABORTED to the caller and
> > disables all EFI runtime services for the remainder of the boot.
> >
> > That is a rather big hammer.
> 
> It does not just return EFI_ABORTED to the caller. It basically does a
> longjmp() out of the faulting context straight back to the caller in
> the kernel, skipping all execution that would have occurred on the
> way back out if the fault had not occurred.
> 
> Assuming that the runtime services are still in a sane state after this
> is not justified, so I don't think making this change is a good idea.
> 
> Do the systems in question expose the RTC via the standardized ACPI
> methods as well? I'd be fine with some logic that avoids rtc-efi

Ya the machines export ACPI000E devices and acpi-tad is able to
register them (as /dev/rtc0). I'll send out a series that I've tested
that implements that idea soon.

> entirely if the RTC can be driven by a native ACPI driver: that
> seems a worthwhile improvement in its own right, given that EFI
> runtime services are evil and should be avoided where possible.

