Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B77F327AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 06:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjEdSRdRrCcSGEI/RKfTENtlFwbcRq36fVLn7qT1dAQ=; b=ck39NrnyvP9RZ4qZOy371NfjHe
	jOYR1Cw7QbrguEcRL3aStcBXtZJfS3KqksIqt37Wv8L+9CmJxyE6vyMSLN8Xdk+GA++G74i2o172O
	dosidUhC+QBYne1j99WCYg/xfTtUucowtr18Ee5rOJZO130yr/yOhfwZvyuFpTTzET2twlHqEV0rz
	mTVEH/EsorZko7GOMVEYRbR4CVwcw7FGjHixSd4QzdaoHi9gTLqlOjRQgRMUaLR2enNcd5sQ1VxuX
	/u/gppHkh99hkadshJM9RasQdGjI/3HFyaK9lhCpDsaoxtW9KctlwUARFvT6T6sd3pHH+S6xqv0Fw
	FkFrRFAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4XO-00000008606-2ds3;
	Tue, 21 Apr 2026 06:24:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4XN-000000085zk-0Rwy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 06:24:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA2F460018;
	Tue, 21 Apr 2026 06:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0CBC2BCB0;
	Tue, 21 Apr 2026 06:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776752682;
	bh=H5LXpbWQGHxrc690vZi3I1NXcc8PBNmHG5EXIPileng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHRyEvCiJwOiM47m/JOUhPsVPiZhmNqd+ETjA9Qw5OPdUkdDHCmw92AqHPh6sVVF3
	 skFxtyEIAAxmVfdtDdH8DdiEscuhBCpLtoW+oCzZ+gNqC2psYokVRq9vjgP8DTxg3L
	 p4z9Wofbd2qbz+6HF5COqPIDFa/Hb9XL0F70A+iM=
Date: Tue, 21 Apr 2026 08:24:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Kay Sievers <kay.sievers@vrfy.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rahul Bukte <rahul.bukte@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] driver core: platform: set mod_name in driver
 registration
Message-ID: <2026042156-bloated-lushness-c28a@gregkh>
References: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
 <20260421-acpi_mod_name-v2-2-e73f9310dad3@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-acpi_mod_name-v2-2-e73f9310dad3@sony.com>
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

On Tue, Apr 21, 2026 at 03:02:35PM +0900, Shashank Balaji wrote:
> Pass KBUILD_MODNAME through the driver registration macro so that
> the driver core can create the module symlink in sysfs for built-in
> drivers, and fixup all callers.
> 
> The Rust platform adapter is updated to pass the module name through to the new
> parameter.
> 
> Tested on qemu with:
> - x86 defconfig + CONFIG_RUST
> - arm64 defconfig + CONFIG_RUST + CONFIG_CORESIGHT
> 
> Examples after this patch:
> 
>     /sys/bus/platform/drivers/...
>         coresight-itnoc/module		-> coresight_tnoc
>         coresight-static-tpdm/module	-> coresight_tpdm
>         coresight-catu-platform/module	-> coresight_catu
>         serial8250/module		-> 8250
>         acpi-ged/module			-> acpi
>         vmclock/module			-> ptp_vmclock
> 
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
> Depends on the previous patch, without which the kernel fails to boot on arm64
> defconfig.
> ---
>  Documentation/driver-api/driver-model/platform.rst |  3 ++-
>  drivers/base/platform.c                            | 21 ++++++++++++++-------
>  drivers/hwtracing/coresight/coresight-catu.c       |  3 ++-
>  drivers/hwtracing/coresight/coresight-core.c       |  5 +++--
>  drivers/hwtracing/coresight/coresight-cpu-debug.c  |  2 +-
>  drivers/hwtracing/coresight/coresight-funnel.c     |  2 +-
>  drivers/hwtracing/coresight/coresight-replicator.c |  2 +-
>  drivers/hwtracing/coresight/coresight-stm.c        |  3 ++-
>  drivers/hwtracing/coresight/coresight-tmc-core.c   |  3 ++-
>  drivers/hwtracing/coresight/coresight-tnoc.c       |  3 ++-
>  drivers/hwtracing/coresight/coresight-tpdm.c       |  2 +-
>  drivers/hwtracing/coresight/coresight-tpiu.c       |  3 ++-
>  include/linux/coresight.h                          |  3 ++-
>  include/linux/platform_device.h                    | 17 +++++++++--------
>  rust/kernel/platform.rs                            |  4 +++-
>  15 files changed, 47 insertions(+), 29 deletions(-)

That's a lot of different things all in one change, please break this up
into smaller bits, this is not going to work.

Especially as the coresight changes are incorrect, no individual module
should EVER have to list THIS_MODULE or KBUILD_MODNAME in a function, it
should happen automatically by the compiler using a helper #define, like
is done for other busses.

Please fix that up first, then you can worry about the other ones.

thanks,

greg k-h

