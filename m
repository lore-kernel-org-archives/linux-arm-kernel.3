Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8624D35173
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 15:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AufkUEahOgBfy397S/uJsQKFUxpcd3i2DL06g/yFGEg=; b=gno9LEza0n07LnF0nnJw/6ocrm
	grdmfbNSZajj6dVRl2XjHsHlgk3BPq2ON6RP1Rm5cEvR1MN9rEvN6WRpd8T/lmE+23RFcZSXEaTud
	WuwLI9EqIZ4SrW0TFYLnkqcCSrA9n/xwSDuMHy4crvzHN9acgFiHTA7T45Ucg5NXYPo/AqnaNggkV
	EKy48+SYkRdVv3zedk+sxVzXpcE5r+s0qGKG+3tkGe5D2dq8Oq0Gx7xKzo9p2hJ5ESeptGBmya5oZ
	Lj8aA+jH5L8iw/OmjzIAjcujg5y862ua1dSRYYOc1oBRTt7/drOj1mrM3K1neOnox4UXkHBMk4qH5
	F2lOKVxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7xer-0000000FeTz-0ov3;
	Wed, 01 Apr 2026 15:39:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7xen-0000000FeSz-3iQv;
	Wed, 01 Apr 2026 15:39:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 14B4940C25;
	Wed,  1 Apr 2026 15:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46536C4CEF7;
	Wed,  1 Apr 2026 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775057940;
	bh=fJdFksYvhu2QBW2xM51tNuc3BCiB5YiBhlwDrUJiUZk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qr3SSI6oBvZ+JpJTYcUXaAZU4g6rvIYySeCjiEK8in3tDiXKQOwN9w9IL7MV0KfHr
	 VDj7jDg2y+ZEbMEPm58bDK0HBWdunouxBWnX/uEhokekEjMfPAfx/mgiAYSs361378
	 vesh0G4OfMCBIJSWzUZP190/CSoWuGdO/ZLsZovBbn5oGwM56T7tGXH1I2+YiQEGv9
	 7RALUg9V6caWS7Z1FWU8E+XllK8kNKPYaZaRLpq42UvvjNXEvxqdhZQhqVHotZNlvd
	 qCKhuASrauwkg82oTq6DRtUHC0wtKP145B0lkKILpqf6FQdYOVSEf0A2873+txIRkd
	 olz30NccPaUEw==
Message-ID: <1f88e7ff-eb91-4601-a549-cddcb06b87e7@kernel.org>
Date: Wed, 1 Apr 2026 17:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/33] rust: remove `RUSTC_HAS_COERCE_POINTEE` and
 simplify code
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>,
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-6-ojeda@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260401114540.30108-6-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_083901_955067_C0F6119E 
X-CRM114-Status: UNSURE (   5.02  )
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

On 4/1/26 1:45 PM, Miguel Ojeda wrote:
>  rust/kernel/alloc/kbox.rs | 29 ++---------------------------

Acked-by: Danilo Krummrich <dakr@kernel.org>

