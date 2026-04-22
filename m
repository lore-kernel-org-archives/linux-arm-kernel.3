Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB71EF55811
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 11:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IG4kCkFVGuUvyfa6r1XBiFFXLt+Nuwnabk6byE9VGM=; b=JEOyh3JlTrf+KqgGl5RBPEpQyB
	a3WvVucPmAEY7I3pGGTgfDn1Pz++FcfsLF8PSPM13ktLo+zeV2Y4vn1fjfZtyG/A4CcQ6XfQUyvs1
	irhXvDE7wTr36MbPkzf+M72S8xc3m0xQE9Z3iygUWqJSDa939SlktimZWDsYVNhOMGLbff/Hobwlk
	QrfZ2e32gJF/potOnFVdstSldT2FYV1LWA2fIhl8rHgkXxCTdbL5evI0nyINlPZDHIIATYJMYn5jC
	hdsdDU/bI768IcdyjiikEoGYzMZu3yD3IJK0ac7mfDqkDqCYRp2JUAY5Tekv4RcFBQhXZFclgJ+rU
	hc8nGXMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFVk4-00000009ziu-14Vb;
	Wed, 22 Apr 2026 11:27:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFVk1-00000009ziZ-2DVc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 11:27:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBD6743A4A;
	Wed, 22 Apr 2026 11:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F691C19425;
	Wed, 22 Apr 2026 11:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776857256;
	bh=I3A5vzKKmr/BUI6ycsaCFjVHGYLX/XgpV0LIBxr//m8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YfLDCdPfbKxE9Xc7LpMa2DM5pnZjmOevyPXZFaZE0gSZTKcZeYWXJXrdiDo8T9uJ6
	 Ab7ip7yS9aOhyVUAZMxhCMdqkjM18P8PA9zl3FSei8FD5Gc5TMPib7dy46S7SbXU0N
	 aM2gizjEpmMUr5XS49klkkfNwWulksbEsHVHpbsU=
Date: Wed, 22 Apr 2026 13:27:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rahul Bukte <rahul.bukte@sony.com>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>
Subject: Re: [PATCH v3 4/4] docs: driver-api: add mod_name argument to
 __platform_register_drivers()
Message-ID: <2026042214-awaken-slouchy-4903@gregkh>
References: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
 <20260422-acpi_mod_name-v3-4-a184eff9ff6f@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-acpi_mod_name-v3-4-a184eff9ff6f@sony.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_042737_905389_E537FF7E 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

On Wed, Apr 22, 2026 at 06:49:06PM +0900, Shashank Balaji wrote:
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
>  Documentation/driver-api/driver-model/platform.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

For obvious reasons we can't take patches without any changelog text at
all (and neither should you want us to...)

thanks,

greg k-h

