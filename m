Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CA5CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 19:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=liiFe93kfLrBacbbNxwJ9Yv1B3wH4KJGG8Fcmqlv9bE=; b=gQhu7DuctTjGIMA2CJmC2u/a8e
	hcg1lwVI6NERT6TMbDM0Wv8kfRB1jGae7lwMXsFHq/XyLkwxs0YHjIQ0noLO9/miNHC90EWJKhgj8
	FjZO5vH7sw2GHZAZe3U+0/BFZ4zdc+67uxzMfKieyrXYmdBrEwEVa2ZjZu26wDf3K83i72rThxB5p
	B3gqWBln2SSj3cvjY3rGfkE1JpEiWzJdI9mdpMUc2q0Pc85lqydrhmO+osWOaOnUQ9Cw97bbfkUe0
	5EpLuSj9ka8QVseVtWclYYon4+3W7ALihFN04PKkG04vcyEzFsmd5dbTbeiw41ugQBVNPl9YZLSG4
	KqZUwjoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhUJ-0000000H7tS-0Slq;
	Thu, 27 Nov 2025 19:17:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhUI-0000000H7su-0L1z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 19:17:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39BAE60213;
	Thu, 27 Nov 2025 19:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE02C4CEF8;
	Thu, 27 Nov 2025 19:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764271024;
	bh=CTaIZx3TPTCQU7Qtrk2ZVlkt8DjltysBLZiTjEs9JMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kyGMlqmRtQRpAhsOwTQrcFlvE9aVtX0vRUPOxb0rotwnUnQmlHHZIrz3jdrSGssaB
	 kRbmCfTuwRO/TNRjg3IrSM2Pw12jpwt7HVCso7ZQVDiXbB/3TDBKyb/lPWMbyvr75k
	 CQCekPexBl0eSQfinzb7UPDsL3QZOrqMGVMjaLb9DSY4be1RhRSppR+DMgeqwBey3P
	 VOLYIAhEnBVSdLvHfOar2r1NE33tP9LurfK82ItVHBCebqK3+tRpXuK5HbufNl1Rzw
	 UXbyz5O6iUO/nHaa3J693nNGfySyzjl8kvXsZU5+hekeR/H1N1FBx1v9RFXUiKQXT1
	 2z4WCndmrs92Q==
Date: Thu, 27 Nov 2025 11:17:04 -0800
From: Kees Cook <kees@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
Message-ID: <202511271111.A9BC57E2C@keescook>
References: <aSRtaVjfNc11EtKg@willie-the-truck>
 <B696956E-579E-412E-B774-AAADCFA4B31C@kernel.org>
 <ecc11ec7-ba00-41f1-8a2a-8f3a83c9ffd9@arm.com>
 <202511241250.EB2ADED@keescook>
 <d9b18b84-22ab-4bc8-b55f-804e0607cec6@arm.com>
 <CAMj1kXG4ELUdxGMp0+tNiV+7ygfHbe-u_pGPMTVj6UNdzQ+sDQ@mail.gmail.com>
 <202511262358.1B99951@keescook>
 <a5afc696-b288-433c-8fda-12b9126c02f1@arm.com>
 <CAMj1kXEJSmYXPNiHO4woBE8rVFOxkfuKOJ9JGacVC76GqkqY+w@mail.gmail.com>
 <cc9cd056-3786-42db-8e40-bb0425dfe142@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc9cd056-3786-42db-8e40-bb0425dfe142@arm.com>
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

On Thu, Nov 27, 2025 at 02:09:04PM +0000, Ryan Roberts wrote:
>     no: rip out kstack offset randomization

Uh, no. There are system builders that have no problem with the current
performance. The _feature_ must stay because it has users. Whether it is
default-enabled, etc, sure, I have no problem with making changes there.
Whatever we can do to make it better, I obviously welcome, but we can't
remove it.

-- 
Kees Cook

