Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543AAC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 16:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Q+QAeGuPebjDNrBW+WJYr1qcg5RToMBhujpVVpujQg=; b=VEacMMsQyaW2iPOAC+sg7PN6fW
	qyjPU8yp1bBaqEly78Ua8+xeaZTsDdrXndQgrQFdjwdYfZc4s4r5OScxMmsNlsIF8S79g1an1nuXY
	NlDOmViqrx++irrjdrJOHWJJOJ2MoIYlwyp7BURcqSuHabD48DSLDRu6URyo3VcEQUH1hBTRC4HyK
	En6lFPNfUW3E5yCVyrM6i51pUhJcfakprrgsERlmFHwr4KhvJkYgP79FlWKp6HRC9ZM4HljkFNLBK
	/Sxs0lYrasdARzklYEj8iWnqPIpTmuDviNjy13l6a1YVd3oCUQjMNpbvneVtmbzLTG3434+jNZ1UU
	b2efNf+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqGO-0000000BXcd-0NTm;
	Thu, 27 Mar 2025 16:39:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqDk-0000000BX4q-2UHY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 16:36:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DCBBDA427AD;
	Thu, 27 Mar 2025 16:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA33C4CEDD;
	Thu, 27 Mar 2025 16:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743093403;
	bh=j0mMLvorA5XFvhHSz10MFJydR5oBrtz6w9zAXJHNFsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I6lqXrChwblssdZ4Vt36W0FP54PtCwjSaiM/LNvRHeYLfZkhnAr1N7RKLNJXIpuJo
	 irlDhbvqiRw1bbFSdpkI11Fwt8EogyrXaSfOnOpHlC7AJ5sl9ORutFW8/NC1TgGKmE
	 83PNSpzeCP7eg0EdN+PzSdkZAdcvHRaOrLdSrv+EKJ/VzDX7QPeY6EvwQmg0cLd47i
	 wCppq4aJUs60bfhsLxG5GLP+RH3hBqZmRuJK0SzPozwN0du36aikVByEHgeiJrc3bQ
	 bkQodkBxmEDjo/pel/HFMlM9MZbZY2zM10RLFraJrnXeEb7qdOtVOmqdwQvKnGhH5O
	 pNWkDR4TYFfpA==
Date: Thu, 27 Mar 2025 09:36:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org, David Binderman <dcb314@hotmail.com>
Subject: Re: [PATCH] arm64/crc-t10dif: fix use of out-of-scope array in
 crc_t10dif_arch()
Message-ID: <20250327163641.GA1425@sol.localdomain>
References: <20250326200918.125743-1-ebiggers@kernel.org>
 <CAMj1kXHCJQ4-KAPpWFA-rqjogbebUP8Y=NKrdEB1ZmSbKG3bdg@mail.gmail.com>
 <CAMj1kXHzonmwoji49sCSJ__0ZwhfqBDVxBPJsgywbTTZ2Q=hBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHzonmwoji49sCSJ__0ZwhfqBDVxBPJsgywbTTZ2Q=hBw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_093644_693755_613A867B 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

On Thu, Mar 27, 2025 at 09:28:51AM +0100, Ard Biesheuvel wrote:
> On Thu, 27 Mar 2025 at 09:15, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Wed, 26 Mar 2025 at 21:09, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > From: Eric Biggers <ebiggers@google.com>
> > >
> > > Fix a silly bug where an array was used outside of its scope.
> > >
> >
> > Yeah - mea culpa.
> >
> 
> Ehmm - tua culpa, actually :-)

Yep, your original code was correct and I messed it up.

- Eric

