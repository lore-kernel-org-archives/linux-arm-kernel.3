Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E6DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 22:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8EVmgn2Z4wK0oIRWCTYDXGo1chuiloeDCezR7/IMto=; b=vhpfRHby5p+G8j1K5pebXvnjuZ
	+yuv97DxJD8qCBKn102gn+ppFU8xlyep7QUf3r9SqSPdgFJLA8/uoqDqNlQlhWKe4SJX2kGOlGsvf
	Mv4bi63R1Tps7F71Y4dAY7eNgFjQ3jY9N/lIuiLnki7fbQ0A2MajUtvZh0OQpVW/RX1fS3iXVA3gx
	GrMgpEr1pFMVASxr30L5Z3jccoJlIiTU3/Z8X1htYjx6sHyLPJ4sL/yKE3Ch22YI/2z+gqET7rC6X
	YZJVfMd0eFx3OuYJ3rXrNczDvz0n+4ctzpOCkzz3HN0w8orqylM2JYvwOWo7uuE+RO5qLvtkH6OjW
	EFXCvcsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Heb-00000005c8t-3oJA;
	Tue, 08 Apr 2025 22:42:50 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2GSY-00000005RW0-0C6X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 21:26:19 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744147574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j8EVmgn2Z4wK0oIRWCTYDXGo1chuiloeDCezR7/IMto=;
	b=Lc6glUYriu6t8DRbnJjBKzUmx47WCtf0msz0Fz7bdoxmmIVYbPoTN4KBuaa1jE/Xc1OSul
	+kE1ZXcH6Na28NdBGLO3zaEXkK8P7X5JspchKKo9DPdz8n6Fdpyad+J6p0PJ0uQpvTJAj+
	O6xP+8Zuh2VioswhiSmeBk4qbuzCRJ3TIKigInxTPKO2g030yS0QVvN6UUpg8VhnGFSugs
	jkkEtL3K45MKFK3b61d5Wxya7YvDiNuY3R5dcggCzTmikBGjSLgYmtfsghia6ivAjqgHQ0
	RginvRMRKRJ0orS2X41Jg9RzbtAa+GR6obNYQIadRs7eFAJL3tHR4gkEKewJbg==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, Janne Grunau <j@jannau.net>, 
 Sven Peter <sven@svenpeter.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Sergio Lopez Pascual <slp@sinrega.org>, 
 Ryan Houdek <sonicadvance1@gmail.com>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Asahi Lina <lina@asahilina.net>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Neal Gompa <neal@gompa.dev>
In-Reply-To: <20250408-agx-uapi-v7-1-ad122d4f7324@rosenzweig.io>
References: <20250408-agx-uapi-v7-1-ad122d4f7324@rosenzweig.io>
Subject: Re: [PATCH v7] drm: Add UAPI for the Asahi driver
Message-Id: <174414756927.683934.14858043560945639869.b4-ty@rosenzweig.io>
Date: Tue, 08 Apr 2025 17:26:09 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_142618_369221_DD2B4922 
X-CRM114-Status: UNSURE (   9.33  )
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


On Tue, 08 Apr 2025 16:54:14 -0400, Alyssa Rosenzweig wrote:
> This adds the UAPI for the Asahi driver targeting the GPU in the Apple
> M1 and M2 series systems on chip. The UAPI design is based on other
> modern Vulkan-capable drivers, including Xe and Panthor. Memory
> management is based on explicit VM management. Synchronization is
> exclusively explicit sync.
> 
> This UAPI is validated against our open source Mesa stack, which is
> fully conformant to the OpenGL 4.6, OpenGL ES 3.2, OpenCL 3.0, and
> Vulkan 1.4 standards. The Vulkan driver supports sparse, exercising the
> VM_BIND mechanism.
> 
> [...]

Applied, thanks!

[1/1] drm: Add UAPI for the Asahi driver
      commit: 12a2bf6765c2a61eb7f20870452bb915eb28fdcc

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>


