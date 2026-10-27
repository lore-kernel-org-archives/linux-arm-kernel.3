Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FB2606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XQTSGsaA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eaw/6xZS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gzqWKjNAt9lqP6pzm2jk44aYuqndLp4yTwvo+4KqEyE=; b=XQTSGsaAvjoNNzuMCqV6I3FSgh
	6Je83EgTNls66qMi1n9ut+8iORco2VVrtBL0pkeQI+W3n0OHxoH4pjDsRY2RKFN2c+6VnNMpKO8cK
	pE+s513Ugps9nsBwfuIO5S+wMMHh3Wvfa3dPZs6bO+TqihM7NSYdTjth3z9rCSqMe6yMxb+v7Hbze
	DWB+SJQy2SqeNli9wXiDoyrrfeq4KEyjtb7YR1VaYw1hrlKPleBF66EJCD/OMxsfLPpQkiOiLXDqx
	i7QjOdiDwWSOOnFhHQ4wWUC1J7jc/ckLxuFK4E+yypvPHNBHAgnzVy80EH5RRniLb5qe4H1r5lnQp
	va01KnPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjsT-00000005KeM-36wT;
	Tue, 27 Oct 2026 16:18:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjsM-00000005KZJ-20dD;
	Tue, 27 Oct 2026 16:18:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9998A602C2;
	Tue, 27 Oct 2026 16:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FA41F01825;
	Tue, 27 Oct 2026 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793117893;
	bh=gzqWKjNAt9lqP6pzm2jk44aYuqndLp4yTwvo+4KqEyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eaw/6xZSvd/iUmSOi8x3BJdGmmK2e2Au+98Gmi/jqPb/fsxjYFyg2asyyhJnch6aW
	 wiiYi0eITIbZDq54HaW38SGswS0qGyltyrmNEvvLUgZrcg3MfWR9qehG4imuCVOpGL
	 JLBJMFg4bFYLFuqGqIHPNPdaHWv4b1hxzIOgmIltqxGKohsv70X69oBDXW+gIkAM9P
	 6ksq060/PG/zOz5Emn8kneLWdVFzz4b9Fry3mL204ZqJhnBuP6P3beekO0yFayQ3hq
	 GdLB0wZ1l9tZcPdFY3Dx++WAI2wf8fFk1D10texSvMGm5UdAm082/dyBMfy0jfVO2w
	 miwbGbIVbN6NA==
Date: Tue, 27 Oct 2026 16:18:04 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: gaohan@iscas.ac.cn, Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 01/18] firmware: arm_scmi: Allow SCMI transports on
 RISC-V
Message-ID: <20261027-quaint-demonic-poodle-6c1e10@sudeepholla>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-1-74d58ce85bd8@iscas.ac.cn>
 <3d38c4a5-1a12-4af1-ac2e-413a457ce4c5@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d38c4a5-1a12-4af1-ac2e-413a457ce4c5@amd.com>
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 04:51:36PM +0100, Michal Simek wrote:
> 
> 
> On 10/27/26 16:36, Han Gao via B4 Relay wrote:
> > From: Han Gao <gaohan@iscas.ac.cn>
> > 
> > Mailbox and shared-memory SCMI transports do not require ARM execution.
> > Allow RISC-V platforms to use the existing SCMI core and protocol drivers;
> > architecture-specific transports retain their own dependencies.
> > 
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >   drivers/firmware/arm_scmi/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
> > index 783c24a20e29..1cfe2b572d18 100644
> > --- a/drivers/firmware/arm_scmi/Kconfig
> > +++ b/drivers/firmware/arm_scmi/Kconfig
> > @@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
> >   config ARM_SCMI_PROTOCOL
> >   	tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
> > -	depends on ARM || ARM64 || COMPILE_TEST
> > +	depends on ARM || ARM64 || RISCV || COMPILE_TEST
> 
> 
> I would prefer to remove ARM || ARM64 dependencies completely that you don't
> need to add RISCV there.
> 

Agreed. Before merging, we should trigger exploratory builds across multiple
architectures. This will help us catch any hardware-specific dependencies,
such as arch-exclusive IO accessors, that I might be overlooking right now.

-- 
Regards,
Sudeep

