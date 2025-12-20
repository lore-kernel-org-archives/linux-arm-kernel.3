Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85CCE668A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 02:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0L9KqJ7t9DnZ0F2dpBp9hpJA1zJXWof1geQx3lupPvs=; b=5E2e4wjnfHJGieS50NHwEQogW5
	p/9WdHvzqe74+zgVA5xiUjoYimSbbT/iXGlfjb/JxvQKwXhAgVKiqmEaoEACbHXvKAueB/ODepTEi
	5orf5OAys5d1hD+hcAPZmPVY0YE1RcNZYw/ovPcgjarDEcFXAdaa7lC+u26RmEc8BiWGD5e39Fsr9
	s/su/Z88/pszbEfxPlIQ2ybQiMJtlDdFwSn5t78ajrMdssmnGXjkWv0tTCcYt8MUudM3K2VcsOgV0
	j49fspJVly1z3K2M1IvQniMkJUI3lK/4y+136pkr3uFj/3saMWrLcK8JNKBLoNVzCaKw6WX9maLbV
	pIhjpk7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWmKU-0000000BCHt-05pS;
	Sat, 20 Dec 2025 02:04:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWmKN-0000000BCFY-3gBK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 02:04:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32EDE437A5;
	Sat, 20 Dec 2025 02:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A71C4CEF1;
	Sat, 20 Dec 2025 02:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766196255;
	bh=+f45ASUs6uxPlPjAzNUfH9w2mweBPgnrH0B9YPOsNA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=siwcFFo40CbtP7/pe33SbwB9Rh1v7UxEaK7iWddHdWGtAJzG33vOzuQyn04Ubj2bl
	 B9jRHpvdoNThYCVg8mNhCnMDDYAxkk1ivptcejhTWgnCJOJAOFSmC3kB9+nwSS8vVt
	 iYhp0KyNd5OvPjxpSri7hr0LorzXkCIl3nV/u9Kfzl9F7LuhQYNpfxDAPna1Nlorq0
	 n8610pblQb1rhPqO1jSnutZF845oPJT4FiN0Js7sIJRLocRmmnBMLUoCziB2+IY++q
	 JMU1Q6b05gCuZA7/wuFy8/53hJG3ittQrdqy3nlVmFUYRMj04DpJZ2vQpnXkXbjJCy
	 x39R/iVelfYmw==
Date: Fri, 19 Dec 2025 20:04:12 -0600
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names
 property
Message-ID: <20251220020412.GA361483-robh@kernel.org>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
 <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
 <3357591.tdWV9SEqCh@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3357591.tdWV9SEqCh@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_180420_114351_4E82ED97 
X-CRM114-Status: GOOD (  12.00  )
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

On Fri, Dec 19, 2025 at 09:09:23AM +0100, Alexander Stein wrote:
> Am Donnerstag, 18. Dezember 2025, 16:26:10 CET schrieb Geert Uytterhoeven:
> > Hi Alexander,
> > 
> > On Thu, 18 Dec 2025 at 16:21, Alexander Stein
> > <alexander.stein@ew.tq-group.com> wrote:
> > > Add "clock-output-names" which is a standard property for clock
> > > providers.
> > 
> > Why? Isn't that property sort of deprecated?
> 
> It is? Oh, I wasn't aware of that. Maybe the property should be
> marked deprecated in dt schema then.

I knew it was pointless, but not deprecated... I guess not much 
difference.

Rob

