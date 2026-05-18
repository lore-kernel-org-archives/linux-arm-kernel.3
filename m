Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B01CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qg52IZakrDwa+7/YtZM2VQOBVW4gzCDrQLRgDaIE4Fk=; b=3AEUy++EawkBccVK0QTRoevYuB
	OiDCGNJCT3KczWfyKrjSTXJL5z1vIDhdxvnSGAteG49x2VcBJr+DVGYGonNQr98v2XjxqxxhjCpa4
	Agtp3UmLfKLd1TgGaOCbt/mrWza5tfHEY+DdFlYDJxs27SELcMGd4ZJMRPNA4ZKLU7BdTqDDccWXV
	XDdVutTKzXJN57tXCfkNLpVNlW3pcHhgp9FJxfhw97WsONzCtn9NaZgdyrW3G4dEzWIjV3fpFXP5w
	5mfJOybk87VZylp//nVgP02PCG4sYQVbVokcZNakUcjEksc2VP5yI/DQ8G54lX6N2fO4uJg5gI4T+
	vkToQxLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvH2-0000000FFas-0ti3;
	Mon, 18 May 2026 10:32:36 +0000
Received: from jpms-ob02-os7.noc.sony.co.jp ([211.125.139.72])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvGx-0000000FFZ2-32wS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1779100352; x=1810636352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qg52IZakrDwa+7/YtZM2VQOBVW4gzCDrQLRgDaIE4Fk=;
  b=tkMcCKfLCOPFfwCegoVuQvfSutKGk3R2h7TriPJ9p/C0Ce25d2p3768l
   w7c32iPAsv1FU2qKWpNfBmMQtTl/XssIBokK8hyMWvV64PSfwS6x5q0KF
   liHfWUQgRK79OhJQehM8ss8/W6EUcIiNg5hpxiKuwI131wSFvJl5R1bxI
   ns+Fbr22f162hEfBOLb0uqxUQNyh8/QAjNMfZDl8eXXmwxDl50D27qFEm
   q3gvOh8sprSfqRCpdgEKAYTtKYxQDNDXJVWm46FG/IzRDsmsysSbqQt6D
   nyrWNIO8sV5pssSd3dsND8j3JXulk8mr4RjrQ+yu6MInOCH60/kGevCIH
   w==;
X-CSE-ConnectionGUID: YXQRt+Q0TlyzhNQV8ujJkQ==
X-CSE-MsgGUID: lKj07yj0TSGeLnAKbp0QaA==
Received: from unknown (HELO jpmta-ob01-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::6])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:32:30 +0900
X-CSE-ConnectionGUID: LE5Xik2fR8SdQOdHHPC7kA==
X-CSE-MsgGUID: tneGe+ukRCC0giD8+owyPg==
X-IronPort-AV: E=Sophos;i="6.23,241,1770562800"; 
   d="scan'208";a="66945202"
Received: from unknown (HELO JPC00244420) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:32:29 +0900
Date: Mon, 18 May 2026 19:32:28 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rahul Bukte <rahul.bukte@sony.com>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, linux-modules@vger.kernel.org,
	linux-tegra@vger.kernel.org, Sumit Gupta <sumitg@nvidia.com>
Subject: Re: [PATCH v5 4/4] driver core: platform: set mod_name in driver
 registration
Message-ID: <agrqvIiNWrYtGvTk@JPC00244420>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
 <20260518-acpi_mod_name-v5-4-705ccc430885@sony.com>
 <2026051827-curler-disjoin-c83f@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051827-curler-disjoin-c83f@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_033232_034404_EBE675AB 
X-CRM114-Status: GOOD (  21.67  )
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

On Mon, May 18, 2026 at 12:27:13PM +0200, Greg Kroah-Hartman wrote:
> On Mon, May 18, 2026 at 07:20:00PM +0900, Shashank Balaji wrote:
> > Pass KBUILD_MODNAME through the driver registration macro so that
> > the driver core can create the module symlink in sysfs for built-in
> > drivers, and fixup all callers.
> > 
> > The Rust platform adapter is updated to pass the module name through to the new
> > parameter.
> > 
> > Tested on qemu with:
> > - x86 defconfig + CONFIG_RUST
> > - arm64 defconfig + CONFIG_RUST + CONFIG_CORESIGHT stuff
> > 
> > Examples after this patch:
> > 
> >     /sys/bus/platform/drivers/...
> >         coresight-itnoc/module		-> coresight_tnoc
> >         coresight-static-tpdm/module	-> coresight_tpdm
> >         coresight-catu-platform/module	-> coresight_catu
> >         serial8250/module		-> 8250
> >         acpi-ged/module			-> acpi
> >         vmclock/module			-> ptp_vmclock
> > 
> > Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> > Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> > Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> > ---
> > This patch depends on patches 1, 2, 3
> > ---
> >  Documentation/driver-api/driver-model/platform.rst |  3 ++-
> >  drivers/base/platform.c                            | 21 ++++++++++++++-------
> >  drivers/hwtracing/coresight/coresight-core.c       |  5 +++--
> >  include/linux/coresight.h                          |  5 +++--
> >  include/linux/platform_device.h                    | 17 +++++++++--------
> >  rust/kernel/platform.rs                            |  4 +++-
> >  6 files changed, 34 insertions(+), 21 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/driver-model/platform.rst b/Documentation/driver-api/driver-model/platform.rst
> > index cf5ff48d3115..9673470bded2 100644
> > --- a/Documentation/driver-api/driver-model/platform.rst
> > +++ b/Documentation/driver-api/driver-model/platform.rst
> > @@ -70,7 +70,8 @@ Kernel modules can be composed of several platform drivers. The platform core
> >  provides helpers to register and unregister an array of drivers::
> >  
> >  	int __platform_register_drivers(struct platform_driver * const *drivers,
> > -				      unsigned int count, struct module *owner);
> > +				      unsigned int count, struct module *owner,
> > +				      const char *mod_name);
> 
> Why can't you just use the owner->name value instead?  They are always
> the same here, right?

owner is NULL for built-in modules.

