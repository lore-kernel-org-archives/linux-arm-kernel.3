Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2DFF4610D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8yk/BaeTksLn5Ogx8FpbgVk4TSQec7gWJcIZVnJOpI=; b=jVWL0scZVOsEYTKBHTQJyvZ2Ik
	7NeMv8Qh7IXup7Y3n3wJSBxfvcA9I2eeyOoPY+IMhm2B/mhs5quwLYVCync+c2QcVApb+xXw4cly3
	OJcucGT4TBEIkDXDv8v/GYdqVFo+aeKTtfZWkM2RAZk418zxzxAsiygDuw/5vkD+gxeO8FGfbTXQQ
	kYoanCir38rtcsaAKBC3KNoqvfFdQOiAkWBuFsYZe2LQI/wIDt5V1mF2m9UgH7+Yymm8ChF/dp8St
	qTFjV29I9bLrDt6FbNzNi3PNe/837QCGY4uZPduIWKX0PCni9Jv/4P4vx18Rws/tnZNsKi8OJMLTL
	sOGaO+Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fIQ-0000000GopN-3pFc;
	Mon, 23 Mar 2026 13:26:18 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fIP-0000000Good-0Mg0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:26:18 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-128bae6a35aso264139c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 06:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774272376; cv=none;
        d=google.com; s=arc-20240605;
        b=bhJFr8yryQhup2/ILVdlN6d9Yzj7frQRM5Nof/nzDYMZTBz0UPvzZ9QPQ25o+9G223
         2dC3LYreD0dVVk+ntrBeUmCB2x1Yqfll4Eefv8PfLfXDpThVxCxA+Tnx+3DeMWe6T0Ep
         NRkvtkGV9km4eqasSaGGWckubD8ZsYQtquAoh7nVX7x/onVHys/xO7bEOgcksE73j1Pq
         gD5aNH8cRkDxo8cWS7b6D0REC2uwThAWkwsFNDqbpluT4+SYcPFfqI5miAD1jt5VPgA1
         XMkSS/nAeIpv5qiN37xff5+HG5NYCkHVwpB/X4Y6rwlNvQUB/LspH1zqtq22jUrGlE86
         d/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b8yk/BaeTksLn5Ogx8FpbgVk4TSQec7gWJcIZVnJOpI=;
        fh=xk+havgHHgjCUTvJ9eY8L+1BWtS3/0Ah5eW0+wkbpWo=;
        b=QR1cKLFhDTF6Jd3Q6vW3xwc0UKPEFdJMfV/9dT995ciN//6H6UilippJkSajoKBgnB
         QdFWVZatJZC9ULrohUnGAGgL9zoA8+3CWJB6QcGhm8H7kHfLD01rX6XnbjaJge9NZdHS
         R3J9T2Z7LzhWQP40bhDAdB4s2Q0tn2WTANfkPCezAAhHRzqwmaHor9XYweuyLkefq/hN
         7ATAXzkPPjgjItFqLhf9xVfxXTttGQm4dOMcPzroCw9vmm5KNBanz8sYWhRrzO/2P3Zb
         MLRZKa6DD0gEB5PbuekyIds1SajXYTZErlGazv1ubXeTCaq4CXc8tIBqEBD2ErWXXZ8B
         bkXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774272376; x=1774877176; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8yk/BaeTksLn5Ogx8FpbgVk4TSQec7gWJcIZVnJOpI=;
        b=J9iWb/1oMl3pB0nskBq/pKJ5qezuYcWMARHx3S8Sx6kxN7iNiN+Eb6XX5chKk8DZyv
         5sBvvcKSshNlmnMJScWk2pqoCos5Oee7tEHeM5+eeTOQj6CCZ8ES/c++9lu4EKlKxRQh
         RDWkTf4grslA7vTdSo3UA91zlS31VXAwvo4H7fbEeXHcpbYsSJe7NiuhG/LBjrqT55x4
         V/yFFLEzJYuaMw6Dgz7lj5ks9VvNfydUw7wwRqWLAkKlUxutuwH1AonoG0VXVt/1DwRR
         xuGC7XLy0qgFS34740UlVOErbvsJ9NaRaz5tnjqvcGn5M+DQim5oN6vePeJaDp6DuJFc
         hChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272376; x=1774877176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b8yk/BaeTksLn5Ogx8FpbgVk4TSQec7gWJcIZVnJOpI=;
        b=A4SEOsBjZ901wg4h63XaGcOisqj1zId4/TfhSFfq4wNz37B9+cDFVv6AAWc9Dpj2Zy
         7MaLm+vKk9O7HFAEF3KIDehvJBHn0SFOa2kwmQQKozip3abM7VSyfj6dme4pLfT8im/K
         c6L3OLLA4+YLCwjXcTkvFEZ08fsqbyJ8hAXTnkoqZ5uPdeUJDb1LeCXJJgykXck2RrXt
         NX0WOzdULHVVCLPtWZ58lZH4S2zGhFEItKYNHCobKxj/BgQ8vdCelqNhRPQXBplYPOXI
         SevXP0g2OsnrLbLTlqvFPq+YGGGL4juqt50c1wbxnEXXiEBXuBx62mLYh9kg3tNpdUoX
         YSxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLTYXdXhxBEPEuEVIpj+SifvBsIpemm9t0I/PAYbK5wUcG80RNXsc/nBVQ8n8wpG1wOpGsE6xDb+mAzkjxOHoc@lists.infradead.org
X-Gm-Message-State: AOJu0YwVTc5r2WGCbGOX5gbMNow6RyziFgioWmDUypl8JZRb5HwLQzZO
	gpaM0chp+VuNmv2zE3WpkLru/tNfOCtkpQ8gUu4Wb8RWTp9UCy3vSKIq1qNz9LaxVP3E2iimUUS
	uiyuW37aW1ehvG/x8Tu3tfACZMGwgrdI=
X-Gm-Gg: ATEYQzybf1hIhlc7bqSa6rIt7gxS8C21aQRWaLkBleIV4mjjyErbee0YUoFmJqQlrBC
	tbmIfaVivpb5rGS7J8frpSKmMfLxU/wb3nrVFLLaoMYzT3btP9f8R48cMcXSPnZ6PCG9rLYkWnu
	AtfPBClUmaz9O4XOqysID0zN8QQos2280PxmFAK6XXd7PRtDBcXz89GXeR9aVGA105lBrNxrHsJ
	denv8FpQvTx8CmSP9OByVjmzeR+M7THj7lXymloHBlHki9rrCU8RA/JwfehPtGetCZBMFHizLZr
	pc9M/xkO7XRAEj7GUZ34OsYe4n7dNH5IhVNcwwnwjg1mi4OdusaNAgcnGcNjPNlHKtYR0QRn09l
	PkieYkoZMOjno77EtdyxsSQBSLFBfhulOhw==
X-Received: by 2002:a05:7300:3215:b0:2c1:27c:758c with SMTP id
 5a478bee46e88-2c109938d44mr2298180eec.8.1774272376046; Mon, 23 Mar 2026
 06:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk>
In-Reply-To: <acEP7tl8pqFA3tK8@shell.armlinux.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 14:26:02 +0100
X-Gm-Features: AQROBzD3BkPQaIE4qxn0GaZ9qpo8tZ7H6ULFyxikznbiRv24VDJjkNXoA95umyo
Message-ID: <CANiq72=dh=jTORtmHfv3Z56qJoK4K-0Bpzew7CTYn1qO+sR9_w@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, lossin@kernel.org, 
	mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, nsc@kernel.org, 
	peterz@infradead.org, richard@nod.at, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, urezki@gmail.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_062617_131332_1CDD5C29 
X-CRM114-Status: GOOD (  12.55  )
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

On Mon, Mar 23, 2026 at 11:03=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Why is Rust generating code for userspace thread accessors for kernel
> space, where userspace threads are meaningless. This is totally wrong.
> The kernel must not reference __aeabi_read_tp().
>
> Note: I know nothing about Rust, but I know enough to say the above is
> pointing to a fundamental issue in Rust for 32-bit ARM.

If it happens outside this patch series (i.e. the new opt-in mode),
then yeah, something is broken.

That is why I proposed to gate this new mode to the
architectures/configs where it is known to be OK (and where
maintainers may be OK with it etc.).

Cheers,
Miguel

