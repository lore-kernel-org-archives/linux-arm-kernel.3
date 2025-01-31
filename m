Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13B6C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiBjie/3ciEURIkZ+iLsXyNmqPRpB2PMG1wBn3Ax9Sg=; b=eA2L1YFDnRXvwzpPkLegxcHiwN
	kde2t7QDU3q/MCQs6GRMCnSPQ4xQzUR/cnwBrXY0D4yFtoi5iyOkMkd4DhIRYlommd5Yh8X6joDo4
	/iDQQX3Yv6Wiw6x3VzOg5tDjsL5zcakiY/zbvndB+zjoOVpgYjoIrIrOJqR/743HG4AwoOnaNM8Ms
	WCcnicxLuslfeb+bAkAhEaFg5+O4UcTIyapQc7WTpCsmsEQNj/t4SKqOx4RQ2iofkYRwKXc/ERHY7
	M/P2XibEdVLVZZFcDwU8TrzxWZal+ERhwEHBSmvtNzh6UozS5qExuDK4mVsE5SJ+jS3wNHowsqhAQ
	VdOo0m/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtZ0-0000000AvUI-3VJD;
	Fri, 31 Jan 2025 16:08:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtWN-0000000Av24-2Jn5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 16:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oiBjie/3ciEURIkZ+iLsXyNmqPRpB2PMG1wBn3Ax9Sg=; b=1MYRElUgqBxjWkVDqUZZxZcr+8
	ONv5FvkVLHES1aKsbjZX2Pd8KJ1igu+ZChE//zmIzI6E/JJkxufl/3qydIO3GW+s2+WuTOOYnInRi
	gkcKLlHtiYE/pzVQaPZwXFtqUrpiJ7jKe7FEyyQZS7tr4nWqoZecl617/SEkPEaJIOQM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tdtVv-009jXz-O6; Fri, 31 Jan 2025 17:05:03 +0100
Date: Fri, 31 Jan 2025 17:05:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Geert Stappers <stappers@stappers.nl>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Sven Van Asbroeck <thesven73@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
Message-ID: <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch>
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com>
 <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_080531_590800_B8287D1C 
X-CRM114-Status: GOOD (  10.89  )
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

> To fix this Rust would have to provide a way to build the core
> library without float support. I don't know if there is a plan
> already to allow this.

Floating point is banned within the kernel, except for in very narrow
conditions, because the floating point registers are lazy saved on
context switch. If the kernel uses the floating point registers, you
can break user space in bad ways.

I expect this has been discussed, since it is well known kernel
restriction. Maybe go see what happened to that discussion within RfL?

	Andrew

