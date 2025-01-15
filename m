Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA99C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vECBGBrtSiXwmZmow9g+w++aMVZcE3pjeKiqZi31PRQ=; b=rGIFsJYlEKcOKYorg7OID9jRpZ
	wX3IFDaso8GtTkEwJkkCEhvbI8z0PGgZWucgP/cWHtEB2uTHeYTGpIxzJMCyB/jlOMuVg3hfrJpuM
	4bdOVw+aqJgBBYC1nQ0SaNKD56sRhScPoB6KhsmDTGVuVI3MLUvOh4qYXCsJaP8fxCNyAk9eHZzAS
	fYnDVVsz7ROT/4Q2asgDatb2wXQNIged5a9dzT+Aji8qIGa2j8/y+5f44X19Vq4+efl3IC/1yhNKc
	xwDFAtwfcfXjM+fHp3RixGD7+5WD0VrvVn9lpTiawPcWaTTWEyIiXJjVFV7p0CqQIMjgbcIDfa8ux
	znjV2TgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0oS-0000000BXcm-0LDj;
	Wed, 15 Jan 2025 10:39:52 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0k7-0000000BWcl-20qk;
	Wed, 15 Jan 2025 10:35:25 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7679340E0269;
	Wed, 15 Jan 2025 10:35:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id orokJiHTn_GF; Wed, 15 Jan 2025 10:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1736937315; bh=vECBGBrtSiXwmZmow9g+w++aMVZcE3pjeKiqZi31PRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z4g2mKad2fZrWCjActVoq2ERvnYQFqD/BaixngsGolITK4xuPzu12M7ErZi8XJ/Uu
	 +/aj8TH4RtcgYB237YCfCtm2oEdgCgEQO/Kl+AKfQBa3OES1VpsvDHEwCYcP3f/HyG
	 KmE1xrbBl8Fak2jZbYAHTsG/ddh8V4bM1NExXaOdQXFUiaiZBmye78B60Yv4MXg1OJ
	 Nv/LlbZic7RwEUzKyGSBp2+6Wv0/PPE57ksv05mZ+ooIiJPDGtqr94103jSDdt/riO
	 VUoTZI86StQnuAq5tGnhkjgFrNGw8aObJGxNCfR61BrArI27uB7CD4K+cU2c2WgFCA
	 ENG2GdrX4cKYC86YIA5pFjDchoDmiuqSbLyI27qdcTPJpLppEySPONaDDX6k979oXB
	 nX07XFKETMdZQFe3Td5eejPuNAzD+y1MGbH99O4kbZTHhgjmNNYRoz+iHUOK4nNB2J
	 KXh71yx8BOM/0LpxwetonPkvEK/VjHAkh2wsDSsQFjAWskLa7U5K3GXw8MQvxPJXqQ
	 FPtVsmDmr0yb3CECWFFsHYLH92tWUIqwKwgnIchvH1sCpZOMbb2e920L5Z0ShPwvd6
	 +5zdyaO0VkU/e5AFTwKsxgscW4mWh65aPHSJB+kvS5kUHKd49aMyT2HBp2uyC0ZrDq
	 /poj4GRNbAEsBfsNrHYQ6BQU=
Received: from zn.tnic (p200300EA971F93A7329C23FfFeA6a903.dip0.t-ipconnect.de [IPv6:2003:ea:971f:93a7:329c:23ff:fea6:a903])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 104C440E0277;
	Wed, 15 Jan 2025 10:34:45 +0000 (UTC)
Date: Wed, 15 Jan 2025 11:34:38 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eric Chan <ericchancf@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Kai Huang <kai.huang@intel.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Russell King <linux@armlinux.org.uk>,
	Samuel Holland <samuel.holland@sifive.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, stable@vger.kernel.org,
	Ashish Kalra <ashish.kalra@amd.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCHv3 2/2] x86/mm: Make memremap(MEMREMAP_WB) map memory as
 encrypted by default
Message-ID: <20250115103438.GAZ4ePPs5pxvLLOmIO@fat_crate.local>
References: <ff8daeb1-4839-b070-dd94-a7692ac94008@amd.com>
 <mvosqsybplnqfh6wadw5ue7u3plqnfo5ojusvaq6htzzhtfce2@bbgogdund3ho>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <mvosqsybplnqfh6wadw5ue7u3plqnfo5ojusvaq6htzzhtfce2@bbgogdund3ho>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_023523_664615_B5687B52 
X-CRM114-Status: UNSURE (   8.98  )
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

On Wed, Jan 15, 2025 at 12:23:54PM +0200, Kirill A. Shutemov wrote:
> I am okay with the change above. Borislav, is it acceptable direction for
> you?

Yes, Tom and I have been talking offlist about making the *map code figure out
itself what type of encryption setting it should use, based on the platform.
It'll need a proper analysis, though, what all the possible usages are to see
whether that scheme would be adequeate.

Something to experiment with after the merge window.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

