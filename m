Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC6ECCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 11:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pwk8DjJA8z0oysJkbtvk8bhihXS0Rs1EqYDINNJtUYQ=; b=tQWpkW9iVdIkwKN402BEKVg0r0
	TUC3OHmnQU58mDnuQcA3qOJz24KSwqA7BSk9+bLuHxLk+ZlVaIbDco+tMAEhvko6juY/4xOU2zIdk
	bXBl47bv5qDuNS+RIL6V52ImLMFRqOpLY3bI0uONVMvCjgncj/Wa/uCbR0tTA9SB2kLVBAWvjy5nW
	O9E9Zc/mXy5YFdg9tioa1uj9n0JgGTEkvN2RWCt9QVaRklkTf8G6tFUx7BB42nU0Cdekgyvr3qFP7
	aONReuSkjFghf97lKxd0abf53r3roAC6MthWQs36PiO9E+UACEdG8yoX8XRFrQbga1FT3v4PeX80C
	3094M3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBAD2-0000000GigQ-1jgo;
	Tue, 21 Oct 2025 11:07:20 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBACz-0000000Gig2-2ify
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 11:07:18 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 03BB61F83F;
	Tue, 21 Oct 2025 13:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1761044835;
	bh=Pwk8DjJA8z0oysJkbtvk8bhihXS0Rs1EqYDINNJtUYQ=; h=From:To:Subject;
	b=OtoMAP7nFhJluGnIc3sDNdXjGWYpJaez2TDKP0ZmPxYsijtx3eHfzWXyvZMYXox6T
	 nz5KMvxUbJlLumhO/ydCbevrpqttlVuWEZrGcy86glWsMeY2HPqEMwFGtda1VL1Ovw
	 VWHYcACHoezmtNDUaIDeCrVyRA+SvporIMJoAfcmJe6yaLdbDRXQJxD3uOvm+loVYb
	 npNGjPMXuvne9ZPSg7N2I4iWgzDC4XkYtyF6I7ZNfrlZV9VKN7ddFvU00HRo1vr/6C
	 y+THkqeb6aaYN6ExTXihWGWvyVzneq/aoOL6f1BBgsUvVgFt6KByfva+pJLk3fLmMA
	 TwuD1njbb8LSw==
Date: Tue, 21 Oct 2025 13:07:10 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Beleswar Prasad Padhi <b-padhi@ti.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Hiago De Franco <hiagofranco@gmail.com>, nm@ti.com, vigneshr@ti.com,
	kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, afd@ti.com, u-kumar1@ti.com, hnagalla@ti.com,
	jm@ti.com, d-gole@ti.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Robert Nelson <robertcnelson@gmail.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Logan Bristol <logan.bristol@utexas.edu>,
	Josua Mayer <josua@solid-run.com>, John Ma <jma@phytec.com>,
	Nathan Morrisson <nmorrisson@phytec.com>,
	Garrett Giordano <ggiordano@phytec.com>,
	Matt McKee <mmckee@phytec.com>, Wadim Egorov <w.egorov@phytec.de>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Diogo Ivo <diogo.ivo@siemens.com>,
	Li Hua Qian <huaqian.li@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Baocheng Su <baocheng.su@siemens.com>,
	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] Suspend to RAM does not work anymore with
 k3-am62-ti-ipc-firmware.dtsi
Message-ID: <20251021110710.GA40034@francesco-nb>
References: <sid7gtg5vay5qgicsl6smnzwg5mnneoa35cempt5ddwjvedaio@hzsgcx6oo74l>
 <e60dd8d6-2bd5-41f0-bf8a-b0a5822a7f88@ti.com>
 <20251021093420.GA28462@francesco-nb>
 <cf10f312-3ba1-4226-96da-d2c9a149c1c7@ti.com>
 <1a849a0b515c77faebe28456d6537d39d4ca32d0.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a849a0b515c77faebe28456d6537d39d4ca32d0.camel@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_040717_844149_1A71D0B1 
X-CRM114-Status: GOOD (  22.73  )
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

On Tue, Oct 21, 2025 at 12:06:32PM +0200, Matthias Schiffer wrote:
> On Tue, 2025-10-21 at 15:26 +0530, Beleswar Prasad Padhi wrote:
> > On 21/10/25 15:04, Francesco Dolcini wrote:
> > > On Tue, Oct 21, 2025 at 02:33:10PM +0530, Beleswar Prasad Padhi wrote:
> > > > On 20/10/25 19:47, Hiago De Franco wrote:
> > > > > DM R5 sends a message that is never consumed, since no firmware is
> > > > > running on the M4 (the core is offline).
> > > > 
> > > > May I know why you are not running any firmware on the M4
> > > > rproc? If the intention is just to run the DM R5 core on the SoC,
> > > > you can disable the IPC by NOT including the
> > > > "k3-am62-ti-ipc-firmware.dtsi". That was the motivation for the
> > > > refactoring.
> > > Verdin AM62 and AM62P are generic SoMs, that can be used for a multitude
> > > of different use cases. And not having anything running on the M4 is the
> > > default use case.
> > 
> > 
> > If not having anything on M4 is the default use case, it should
> > be marked as "status=disabled" in the DT.
> > 
> > > 
> > > I think having the node in the DT is the correct way forward, if you
> > > want to start the M4 firmware you need such a node, so this is enabling
> > > a valid and useful use case.
> > 
> > 
> > Having the node is fine, you can still choose to keep it
> > disabled by default.
> 
> I agree with Francenso that it would be nice to keep the node enabled by default
> - whether something is running on the M4 can be controlled via sysfs after all,
> and may change over the runtime of the OS.

In addition, from what I know, this is required even if you want to
to start the firmware of the M4 from U-Boot.

Francesco


