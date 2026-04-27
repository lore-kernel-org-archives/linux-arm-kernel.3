Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72963FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3f+ipyipbG9ve74SWingHtpF8ckpjt3qTGqxppXfFzY=; b=ULAv8VUdxpw+bqaDoM/hNwWmyY
	N+GSeTsJQ9Dm5UvsHjdP93qdJtEUJaVO3ukK5NxUWZPPkSE01/7G/Yzn432u11Bq6k9iL/VxZL+Zm
	PBIlv0aErya5bsBSbCOaHUc+V6Bh6Q6PZOnf8IrWLFxdyPtu4G0vqUyF0MJuFzsmTdlhXJ5PwzJ/j
	ZLjRZE1iM+1J6cfDtD0AF8Vbt8QgWX8Nr5wCsXoNPKc2+ULiXSp4qR3y1RRp+S5yOrl/au0Qf7/Vc
	1Tiywl7kbyqV8WImS4zerdr4Sr1LwLdoriIoHofu4+fuSNwBGmHm55VodR1popBCqdTaWhLd6UshZ
	gbJgstsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIJV-0000000Gayz-1IHc;
	Mon, 27 Apr 2026 09:31:37 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIJS-0000000Gay3-3i33
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:31:36 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 39F831FB1B;
	Mon, 27 Apr 2026 11:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1777282292;
	bh=3f+ipyipbG9ve74SWingHtpF8ckpjt3qTGqxppXfFzY=; h=From:To:Subject;
	b=Oui0MOT0x94+2dM3R5uOpRffJ9Wx9j6ylSA9QAkTg92XTx+dn56JG7xkyoASs/fa6
	 jeurKD+LfLijfHlA9mg6wH5OqqjaEOvDVucHz17xzhALz3mdyDx+/MsPHaZVp+YVxJ
	 VIU34BPvnoFHTPl+YThEFIUGqU6HzI1TbxO1HNl3JHKluUYtK9yGDDeiUXDnyOF/Yz
	 U9rQ8naikD2oQ8qGchfq7QlTttc7kMhUh/sUuzk97naTvYQq6FTtCPfwqgnIJIqwXO
	 eWElkycEwmM5cl9ZVK2doQf8R3IWlYTNVaMEWuAXQbf20IyJv35NG87Vt7cb+pgGT3
	 aaV344jJwI6MA==
Date: Mon, 27 Apr 2026 11:31:27 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>, peng.fan@oss.nxp.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2 6/9] soc: imx8m: don't access of_root directly
Message-ID: <20260427093127.GA50667@francesco-nb>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260223-soc-of-root-v2-6-b45da45903c8@oss.qualcomm.com>
 <6593091.DvuYhMxLoT@steina-w>
 <20260427064704.GA17710@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427064704.GA17710@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_023135_078097_F0981057 
X-CRM114-Status: GOOD (  22.24  )
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

+Peng

Hello all,

On Mon, Apr 27, 2026 at 08:47:04AM +0200, Francesco Dolcini wrote:
> On Tue, Mar 24, 2026 at 11:24:09AM +0100, Alexander Stein wrote:
> > Hi,
> > 
> > Am Montag, 23. Februar 2026, 14:37:21 CET schrieb Bartosz Golaszewski:
> > > Don't access of_root directly as it reduces the build test coverage for
> > > this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> > > to retrieve the relevant information.
> > > 
> > > Suggested-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > 
> > today I noticed the following warning running next-20260323:
> > > caam 30900000.crypto: No clock data provided for i.MX SoC
> > 
> > This happens when there is no matching against the soc_id.
> > 
> > Checking the source it turns out this patch is the cause that the SoC info
> > does not provide soc_id anymore.
> > next-20260323:
> > > $ grep . /sys/devices/soc0/*
> > > /sys/devices/soc0/family:Freescale i.MX
> > > /sys/devices/soc0/machine:TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MP-RAS314
> > > grep: /sys/devices/soc0/power: Is a directory
> > > /sys/devices/soc0/revision:unknown
> > > /sys/devices/soc0/serial_number:0000000000000000
> > > grep: /sys/devices/soc0/subsystem: Is a directory
> > 
> > reverting this patch (2524b293a59e586afd06358d0b191ab57208a920):
> > > $ grep . /sys/devices/soc0/*
> > > /sys/devices/soc0/family:Freescale i.MX
> > > /sys/devices/soc0/machine:TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MP-RAS314
> > > grep: /sys/devices/soc0/power: Is a directory
> > > /sys/devices/soc0/revision:1.1
> > > /sys/devices/soc0/serial_number:469677A693A4B8CE131D180033E44903
> > > /sys/devices/soc0/soc_id:i.MX8MP
> > > grep: /sys/devices/soc0/subsystem: Is a directory
> > 
> > soc_id is restored. Now that I write these lines I noticed that
> > serial_number also contained empty value which is restored with the revert.
> 
> Any update on this? I would say this is a regression in 7.1-rc1.
> 
> I noticed the same issue, and CAAM is not working.
> 
> [    0.000000] Linux version 7.1.0-rc1-0.0.0-devel (oe-user@oe-host) (aarch64-tdx-linux-gcc (GCC) 15.2.0, GNU ld (GNU Binutils) 2.46) #1 SMP PREEMPT Sun Apr 26 21:19:00 UTC 2026
> ...
> [   10.611139] caam 30900000.crypto: No clock data provided for i.MX SoC
> [   10.611211] caam 30900000.crypto: probe with driver caam failed with error -22

I guess this is the fix

https://lore.kernel.org/all/20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com/


