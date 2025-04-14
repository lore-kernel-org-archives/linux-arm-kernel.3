Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0D1C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 19:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2//YI37gCwEJnWo7XbAl9+oojJRWv9moUx4jBN5YgjE=; b=xTN8udcaAhRY6NXMpxuIlFxvpk
	JgrcsP5tDEsv/+we/Q1KELt/9F9gbvmewRfX/Qn6FL/H2EcMLEv4rL4ioUn2Ge8dPpCpZo24Makor
	r7oWHw1c/8dv3wDBVaB9ysdehaAbHQ6sh/4fgghc5VuQ/XRXxn4/R8V/JV+y4CJ7Dq4tdjyZEy7yE
	d55/pCBi+pBlY+fXJue7Xn6rVMLtYlZF1Tl0BtyJnxVynRnmWIpVATnDyVD+NClS4ny8ey4U1rssf
	gU9VKY+KEWKnRL0TToubTAm1+mVd/NzJgazIDBZuESktWkwKftnS3cC5wHDJ8cX8fx6r17N21wzG6
	15pSbCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PnE-00000003O3m-3x4o;
	Mon, 14 Apr 2025 19:48:32 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PlM-00000003Nuc-0APZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 19:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2//YI37gCwEJnWo7XbAl9+oojJRWv9moUx4jBN5YgjE=; b=OKFNLW+vkmj6v9qjccZiLLFMgf
	ahhqabsAexbgPEievMAp9Hu/1LCpC1eJCrvYcapZJvKAVKbq47kpKcGUPtoeVAd0f+B2O60t6M0FK
	vRCeXSSLjN27fF0SWa0Fr7QXxvTRBQ/eWQZ+r8/2cTozGUM6uf5h8zSAov6dB70FFoQQgd0pJMkDp
	VLUkjb7I+OtCnnVoceHzb4ap14cVVacy0ymoS79Q6Ja0QLZTX8lr2N20OZGPo9zACJKER8PgVHpRl
	wg9Y4HvnR8OkeUdXKL8yRGr8fCD41PwCH+zWee/P6SRhyGDDUdpCxo/p55rkGgBTKYvQX62WyxCVC
	Lnoe67Vg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56924)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u4PlE-00072D-1b;
	Mon, 14 Apr 2025 20:46:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u4PlB-00081U-0U;
	Mon, 14 Apr 2025 20:46:25 +0100
Date: Mon, 14 Apr 2025 20:46:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
Message-ID: <Z_1mEHnzYjhz0Ldz@shell.armlinux.org.uk>
References: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
 <38867e79-c0e3-4bcd-bdf9-3fb5b571d51e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38867e79-c0e3-4bcd-bdf9-3fb5b571d51e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_124636_076988_45BFAC46 
X-CRM114-Status: GOOD (  21.91  )
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

On Mon, Apr 14, 2025 at 09:21:42PM +0200, Christian Schrefl wrote:
> Hi Miguel,
> 
> On 14.04.25 8:14 PM, Miguel Ojeda wrote:
> > Hi Jocelyn, Christian,
> > 
> > I started build-testing arm 32-bit within my other usual routine
> > tests, and I hit:
> > 
> >     ld.lld: error: undefined symbol: __aeabi_uldivmod
> >     >>> referenced by drm_panic_qr.rs:417 (drivers/gpu/drm/drm_panic_qr.rs:417)
> >     >>> drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator
> > as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
> > 
> > which comes from both these `u64` by `u64`:
> > 
> >     let out = (self.carry / pow) as u16;
> >     self.carry = self.carry % pow;
> > 
> > Christian: I guess we can offer a set of `div64` functions using the C
> > ones, at least for the time being, and eventually wire the actual
> > operator with some support from upstream Rust. Or do you have
> > something else in mind? (i.e. I think you have been discussing
> > intrinsics lately)
> 
> I think using the C implementations is fine. Not sure how much the
> FFI is going to matter for performance, but it should be rare enough
> that is shouldn't matter (and hopefully we will get cross lang LTO 
> or something similar at some point).
> 
> We could also just implement the intrinsic(s) ourselves, but then 
> the u64 divisions would be implicit which is probably undesired.
> We could also rename the intrinsics so they are only usable from 
> specific crates. 
> 
> I think we need the opinion of the some arm people here.
> 
> CC Russell King and Linus Walleij.

The kernel has had the general position that u64 by u64 division is
silly and isn't supported. Several 32-bit architectures including
32-bit ARM don't support it.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

