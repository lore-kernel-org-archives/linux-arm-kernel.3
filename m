Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87DDC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 03:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQr0DiWVq2k9u9lN2oSJQIhf4wEsdgB50QBXU///R7I=; b=FOicQiztIIla8B
	1tzXQwhCJR4+Fubyt/OUGbwpITOsH8QHVUv1Ugb4XYP+St+L7FPqFet65/7RBtxibVyp8hwpRf793
	te3PMnWFAqDUPdhuE3ZY2U9Q5mq9JH1Yhc90EkDPM4XVdkTqrDs89crSdeGJU6MMs30dKke6OxLbC
	3NwhSXBQ2bawR3fzvhnaYuyQKmyrS1paZdcoFCR9xloi05bpDGIEMp/vn2KyAQn7AeE6FGV5lA+W+
	d3nYXqnkVwnR/Gx2tm7Jra1Q4j3AYWri1bkjj7TNsRkaVhpLavk07uRTw8n0uFZw/3mZg5y/9YvmG
	TdLRTQH6PR9LsOPVdNTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfWOg-00000002FDK-1wWO;
	Wed, 05 Feb 2025 03:48:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfWM0-00000002EpO-38je;
	Wed, 05 Feb 2025 03:45:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CF139A42536;
	Wed,  5 Feb 2025 03:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B66C4CEE7;
	Wed,  5 Feb 2025 03:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738727131;
	bh=qT3uB6BFnXnuoNmO5ZICAMNYpk2rYRyb7Df6Uuc3yM4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=pMbVHHZKs7P25UVROkPy0e8TaaRQkao/kjQBlVYOjxMxdnZKVKpnfPw73WfAYObhK
	 TmYJoKrLJgF4y0gm/qS/tYKJk8rVr9TdlqWWlmLRjN16I9XT+om1a4rP2N5agr/iEf
	 rPJrwrhrlNpiGX98R6ZwiVySLAZpgqhX7XnuR2SBzKGth6LJZzfYtzMffblRL34nAe
	 kBQgrJgOg77v74XUFvNp3smUos2M++mJKHZ9utXGhAFqbCqrg7VCXse4GR1gFKiZmw
	 Cya2bwsqJ6gegFg4MU1615gvJtSSw+d/oyAQ1SHOzdM3SfNr4IPMWNBn7zm7+h9MSl
	 NGtinAJqKkzcw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-305d840926fso50426431fa.2;
        Tue, 04 Feb 2025 19:45:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUt6LRlOtMH4yrOo7JUiE5CSTnGZFoTIT7200bz4No1tsLfH4HfWrYGkejuyq/Jqd4oxeJA64kjILAVnSaF0NhI@lists.infradead.org, AJvYcCW0d5aZrcn8Qwuax0S9B+mkwi+bO2LEZqdGUKKmkIsYMXCGKC7BGI6f+N4ROZRJboHIUAZxSNkv50akz1+pEZA=@lists.infradead.org
X-Gm-Message-State: AOJu0YynHidJKTIXcX2crYLbcj1d2Q7xvOXev09KGrQR3dv3JCL3z2SD
	zVhQ2Ki9YK/9YpO1qWSHllapanf8J+fFNm7+YnNWhj3DeLOagS4wy1/AoR3X/cZlkwpuLgm1pu3
	2sAOpZjpy3CDuPQQlsLhnXG4A7s8=
X-Google-Smtp-Source: AGHT+IF/j4mjEmNMJlaOseMTc31MNVXclZ/WljET6VoPTchVI9nwi6yNBFx9ce6hMcBEMWkiJTzpYrsil92u3LJXWWw=
X-Received: by 2002:a2e:bc8c:0:b0:300:33b1:f0bf with SMTP id
 38308e7fff4ca-307cf23bdb9mr4600901fa.0.1738727129916; Tue, 04 Feb 2025
 19:45:29 -0800 (PST)
MIME-Version: 1.0
References: <20250204161359.3335241-1-wens@kernel.org> <20250204134331.270d5c4e@kernel.org>
In-Reply-To: <20250204134331.270d5c4e@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 5 Feb 2025 11:45:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v641vvtVKv8QbiEfHnMWngcKYTJZAgfH5k+G_nOvZcbC9g@mail.gmail.com>
X-Gm-Features: AWEUYZlfZKNFERbjqveUEQnkoJAkV94srAWQ5Bo9GwhmHD8TgbxWwy-L79DYJGg
Message-ID: <CAGb2v641vvtVKv8QbiEfHnMWngcKYTJZAgfH5k+G_nOvZcbC9g@mail.gmail.com>
Subject: Re: [PATCH netdev] net: stmmac: dwmac-rk: Provide FIFO sizes for
 DWMAC 1000
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Heiko Stuebner <heiko@sntech.de>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Steven Price <steven.price@arm.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_194532_855290_81A84BDB 
X-CRM114-Status: GOOD (  10.41  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Feb 5, 2025 at 5:43=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed,  5 Feb 2025 00:13:59 +0800 Chen-Yu Tsai wrote:
> > Since a fix for stmmac in general has already been sent [1] and a rever=
t
> > was also proposed [2], I'll refrain from sending mine.
>
> No, no, please do. You need to _submit_ the revert like a normal patch.
> With all the usual details in the commit message.

Mine isn't a revert, but simply downgrading the error to a warning.
So... yet another workaround approach.

