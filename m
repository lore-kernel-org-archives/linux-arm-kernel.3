Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AFBCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7ImHxWMUDEttxUm3epJN67Y8w3gScTDqqDuoQ7Ao8E=; b=ozyDt9EmLNgtxlkhX2pvn5jpOr
	7RzgiBEJy1sMjtFvLx3vUrUq+1pciYpTr2T/HpfcrP7nX6H7cWt40L7mgwq7lfEQMni8i8K+A11HE
	d4J7kyxpzYV7o3XHceuxrSs0Gtd9rsL5BXiFWwgvmsHnMJkfHCDhP3DBQHDzslFCQo5MSAiPYPT1G
	KzUuMZpF0iRTOEjUufiCwes8AEdoop0sCA6j+FzhGNVSLCVu/pXdJw9cJyXxDXEr5n641G80exACp
	TjSDVw1AOhdP69kZzmkyD0t0NcxGpGFDHrCLpMSSZItSiMyLcYIr7bcZfPAgVgpC++iWfqhwfwQjv
	H3Igq1mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJzs-00000001Yee-11Qo;
	Tue, 19 May 2026 12:56:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJzp-00000001YdT-393m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE3D24413A;
	Tue, 19 May 2026 12:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78B7C2BCB3;
	Tue, 19 May 2026 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779195388;
	bh=swiLRF5viUP9Bya8Dp7YZueJwlHQOjHir4JEE0vhuWA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=onCKr4FekH7xM2LVd2O8ZpVN+C9BcX2DiYfqmoUuV4SMKcB+Q1w11YKXTHrUZzkIV
	 G3VAnCJ+nvfKPMdQGwyaV2ryg4bSurZAHT87CiQKtHPANc7qEm9IkWYNBWJMSQ7j3u
	 lM5FVi+MS0LYxjAE7hInPG7JUzwqRJIfiMEY/hsBxjEQD92QaoaVT6NZGzPpWCKcHJ
	 xOknyTHnF6tvmlPfhwPC0y1g4U8VyK7hbACcjCriLoJQRIY5AnY5XCdJ+QT3hPRJpV
	 Bg8PNLF7W7YiSYMqEbb0TrBTd7lX2t6p03dei5jlv/GTOY4cnif6wb/VbHFtMhgJRc
	 7mTGJdsH1PoOQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPJzm-00000003xSA-1yzQ;
	Tue, 19 May 2026 12:56:26 +0000
Date: Tue, 19 May 2026 13:56:26 +0100
Message-ID: <86pl2rwoat.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kvm <kvm@vger.kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Jim Mattson <jmattson@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	kvmarm@lists.linux.dev,
	linux-kselftest <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH] Documentation: KVM: Document guest-visible compatibility expectations
In-Reply-To: <86qzn7wp3y.wl-maz@kernel.org>
References: <6856b269d2af706eae397e0cf9c1231f89d9a932.camel@infradead.org>
	<6afc4b95-3c15-4d71-877d-19b84e91ce05@redhat.com>
	<57bc082f4824d6114d3156744c25986effc29aca.camel@infradead.org>
	<baff82ca-6321-4b16-aa61-b2d6d60b6535@redhat.com>
	<86h5obya2r.wl-maz@kernel.org>
	<48b06e5655d56ff6eda30e563b34894fa0eb2f07.camel@infradead.org>
	<ba08dfe9-932b-40c3-9fdf-fc891d52e1d8@redhat.com>
	<d9d4471a7f5ec1e297b3ca07f42a59090aa91e15.camel@infradead.org>
	<CABgObfaM-JtNn2MuYXaiadQnLfAhTEaoHAcTG9=J6LkMcQCJ3A@mail.gmail.com>
	<3f9d731c3d26b0367600f1069e6425099bc34eac.camel@infradead.org>
	<agxFbniU_6eQ98t2@willie-the-truck>
	<cf429f2082e863571595f74d1d3dedc3e6a82964.camel@infradead.org>
	<CABgObfacAYexR25SMi1kSZMRnHx3EDGj8=E84V1DumER66ibnQ@mail.gmail.com>
	<86qzn7wp3y.wl-maz@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, dwmw2@infradead.org, will@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, seanjc@google.com, jmattson@google.com, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, rananta@google.com, eric.auger@redhat.com, kees@kernel.org, arnd@arndb.de, nathan@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_055629_832383_5023DA4D 
X-CRM114-Status: GOOD (  16.25  )
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

On Tue, 19 May 2026 13:38:57 +0100,
Marc Zyngier <maz@kernel.org> wrote:
> 
> As I said before, I'd be OK with something that would restore IIDR to
> REV1. But not something that actively breaks the GIC emulation by
> reintroducing a bug. That's, by construction, dead code that will only
> bitrot, because there is no SW that can make use of this nonsense.

I will also add that if we make it a policy to preserve buggy
behaviours that the guest cannot be relying on, then I question
whether we should be fixing anything at all.

For example, 6.19 fixed a totally buggy behaviour where a guest
couldn't not have more than (on most HW) 4 interrupts in flight at any
given time. This was obviously totally bogus, and this was fixed
unconditionally, as legitimate guests could experience gold-platted
lock-ups.

Should we revert to the previous behaviour? In the affirmative, I will
simply stop fixing things, and someone else can have fun retrofitting
buggy crap.

	M.

-- 
Without deviation from the norm, progress is not possible.

