Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A32CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 17:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=be/KypQX5Q9fujajARM6Q7r9w26ilWIZmzbrtGfAKys=; b=JQGmVRndm/RFL5Nk9vQP4jcsxo
	DTc8T90Qdy4vRAPHyfpcNGq7fOXUXt4wLfo+5gZFqj5XR+9zkQoSlu3cFWzL4EGIltVXgADd3wbHB
	fgRaEIkNqgQkCxy3v3d/b3PH/3EC/tp3yXeB3sugxHkZ+u9NF+pns4Fskf4DnOT/8WgTythFDZxOV
	J0U7j5wGTV4B1zUEvau9v88hIi/AozJ2wqsgAtfRefXh4KdgAjOy5DmpikB2aUo9Bt0SdUAeiV4yj
	VEEYs+q28F44ywZ2CC4s9QHJwz3t9UQ1mNgm3tSVepxqhYhA3Vhg1zHFhTJwCVpHFVcDFCztuSuQ7
	oKDA5sRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAjz-0000000EceN-25l3;
	Mon, 15 Jun 2026 17:04:51 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAjw-0000000EccV-1LFM;
	Mon, 15 Jun 2026 17:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=be/KypQX5Q9fujajARM6Q7r9w26ilWIZmzbrtGfAKys=; b=SLabnQnxi8RKG6kB4YLIrRrIte
	+jYEaBgX5DOoDOdPOU6k6ypOK6lDxxOMXQzKEUszFj5yTLPDASBaagrmnsOk8tUGdmzHw2XGk68HM
	2J1tv7+pE0CjbBOIjeYCz0TsyHOIrqFb8Mb1LadfEs+3t0bUVsavfv//KIZ2S3hmTXIBIqEbnE3qn
	zsd3Hxu29/Ylu8C3lRKI+WwMxWxUWcLIz0u0fTGyYSKAR/XPPXo0Rkv03xUIJElu5cOtap9hCSZj1
	74eb7LaTsGudBKuTsb4/IH254uFPRDECMTh8XzLqKRh9ykQzpGUZV9OECxDmxcCHO22vobRU+rK1T
	RNRNGWLQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wZAjg-00000000Vxn-0xg6;
	Mon, 15 Jun 2026 17:04:32 +0000
Date: Mon, 15 Jun 2026 18:04:32 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Davidlohr Bueso <dave@stgolabs.net>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-efi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/19] init: discoverable root partitions, a.k.a. an
 omittable "root=" cmdline option
Message-ID: <20260615170432.GW2636677@ZenIV>
References: <20260615-discoverable-root_partitions-v1-0-39c78fac42e2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260615-discoverable-root_partitions-v1-0-39c78fac42e2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_100448_361505_AF6F34A6 
X-CRM114-Status: GOOD (  12.51  )
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

On Mon, Jun 15, 2026 at 06:08:56PM +0200, Vincent Mailhol wrote:

> Tested with GRUB, which implements the LoaderDevicePartUUID EFI variable
> in its bli module [3]. With this, I was able to boot a kernel with a
> completely empty cmdline and no initrd.
> 
> [1] The Discoverable Partitions Specification (DPS)
> Link: https://uapi-group.org/specifications/specs/discoverable_partitions_specification/
> 
> [2] systemd-gpt-auto-generator
> Link: https://www.freedesktop.org/software/systemd/man/latest/systemd-gpt-auto-generator.html
> 
> [3] GRUB -- §16.2 bli
> Link: https://www.gnu.org/software/grub/manual/grub/html_node/bli_005fmodule.html

So what does that thing, tied to EFI as it is, have to do with architectures where
	* firmware is rather unlike EFI
	* firmware wouldn't know what to do with GPT
	* GRUB is *not* ported to, let alone used
such as, say it, the very first one mentioned at your [1]?

Or is that conditional upon "if anyone wants to design replacement firmware
for those, and if they agree to follow our wishlist"?

