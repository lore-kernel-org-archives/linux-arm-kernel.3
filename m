Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBF8F31E3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umW1IQdOAOPjgPj9z57AnteG7vvMbaLS+TiyzZ/vV5U=; b=y/9FSk33rjw3njBkMCnzIKGFSk
	YgIyhejwHkVEEm1E/N3A31oPssxz2O4N0LYU3var4+Tkbp6ruzwqNJ/ldhGIhnzMZzJbAq4C7mFoh
	kLW0mPtvFeyUs/XfHTVBzFaftg42IldG0j6SchsRrwD66zNoU4cf2dKVQ0BIJQsWGPNiHg8C7btF8
	3GCHR2A+B6Z7OCVQ8NxiTCdcN8Dgd1mgcTfWywjZg98K5eYzFbd3eovI3vmXGYHlEvKFdFyF8w7Ar
	+0aiGcMEHf3fd57vLqr07SR1hRBiuqKtmWSN8MkV942segmGlOJAUE9/kZpXzg8D6FSmvE5x50rZ6
	mLn4LpgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArST-0000000AoQT-0Qxd;
	Thu, 09 Apr 2026 15:38:17 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArSR-0000000AoPy-01lM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 15:38:16 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so1456006a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 08:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1775749092; x=1776353892; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=umW1IQdOAOPjgPj9z57AnteG7vvMbaLS+TiyzZ/vV5U=;
        b=WqE+E/Ltefk1TRYCAolszxRIfnZ8cf5npQd+gE5PCZyLuihLLZsrvOpD3IGd5Hs8ys
         oNcxMhqgRHczy87jWgl869d+v6ZjnyzYCN7TgoZqDsXxN9GHjEOdMZkHh12UDufymbxI
         Mz/GlbSZdXFAPBN804TZdcZWHNC4dPm4wmNI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775749092; x=1776353892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umW1IQdOAOPjgPj9z57AnteG7vvMbaLS+TiyzZ/vV5U=;
        b=illIgqqrX2HrxLrGtkM68DJ4vjecZsjw0aEdniF8MIAI0pkosHc1/31jgnbRvwJBYJ
         H/9iqhba5QlC4oTO8Ti6GxBI5enqRcgiFmhHo+OzZDanFOgZ+KcatAHrJovFZb5GeeTW
         Uz3IR0tNb2we1RdmGkzqN3nidMbf9HYc12ipdgLFDMc1u/qezGv+MRnJwoIurNsTNtVP
         kishDaMmzuPnk0TLO9ec3rNHPzjHT4sAZTcJEMAw3tmhE01ChmkDrkBCiNZQT0iXrQG9
         odcnfF7bhlP/QdwUkl6jH3YHxu3hUb44W4qH5FL38Xmv4JqggT8ugiUNkTDArv0fPiBI
         5DLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3HI8FR5H7iDWY808js6uW4CLcNDIp00LNYOI49nCK1UV03jIIkCkvtXZTTPX4sAoU1FYKV5uE3iMtSVlLk9M7@lists.infradead.org
X-Gm-Message-State: AOJu0YyiJQzwgXltK+yA/VWkjNOxI49y0501W5wrvDYYIi8JLu8Xv6Yj
	K90Hd7z0IEdbDrxuSzIHrzuQzJnn4QG25Cdj8HMrh2M88M+HNohRi6VDDDgdo6O9MrbRtmQgtc8
	q0vK0+WY=
X-Gm-Gg: AeBDieuyYDLYRkkpWJKRI9QSXG2IxwBEAnM73RzQSHzPKNYrs5b8lw3uk3BUxFClZ4Y
	ouChzzSSzbenobOjzd14LLc87HauKErVpsGfEfcvOE/qDOxDDSKX/hZJjpwnZLYUqBAIRXIcwRF
	8d2+laJVYINcnipq7Z8bijQJg5gyB2JP3rnhAmRbtyOlsI9dv+TCwmveU+T8N6hzZfgEkBflKe0
	NUeP1JHwLESgVWDbJAGmFdW2gA1qfwaMSaS2vWgHdtw1IeM3Qi3m0T6d19yjEnRPe7M6OY8p1if
	YXY4eNg9xF0zm05AzM6sCNEf0WjWtos4U/Vwkm+24oyDalSP810KvisZDVltCrl4AMvYT2CBGML
	u80g1RXQ1Y0Lc+/khFqKDC1OLDmVcDZDFenBEeD4Q5YX9kUQwXe+W9O+VpIXKcr3o0aACDbJvtp
	msq33UJAcRIY23SoutFYSNwSpxNSce4aLzdjLkcJFXw6hTcRbNNBshAeThJO5C5nJMzicYhbCd
X-Received: by 2002:a17:907:a088:b0:b9c:f70f:7211 with SMTP id a640c23a62f3a-b9cf70f72bemr741220766b.44.1775749092313;
        Thu, 09 Apr 2026 08:38:12 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c52b3sm3265766b.30.2026.04.09.08.38.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 08:38:11 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66e6d9610d8so1596022a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 08:38:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMMeuFskvSrZNSc4lbSARbkXE5Y98XpHmF0pWaTbp58SVc8sg9vHtDLFynOPgiEEIzHWOpSa4+lOt9cGrwIA35@lists.infradead.org
X-Received: by 2002:a17:907:6d0c:b0:b9c:94a3:317d with SMTP id
 a640c23a62f3a-b9c94a3345fmr1104212166b.37.1775749090683; Thu, 09 Apr 2026
 08:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <adZTGOjjJrVJOcT8@shell.armlinux.org.uk> <adZfTi3R6jtsjXx-@shell.armlinux.org.uk>
 <adZ9grUg71f518Fg@shell.armlinux.org.uk> <adZ_ZmjcE8S22vR1@shell.armlinux.org.uk>
 <3a1d0520-3402-47b2-9d7b-4e14a3cd07a4@arm.com> <adayAMR_dEA6W5vW@shell.armlinux.org.uk>
 <adeaiSAnkaggqPsA@willie-the-truck>
In-Reply-To: <adeaiSAnkaggqPsA@willie-the-truck>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 Apr 2026 08:37:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=whO3F1u+nme4cnYMy5baYmb7CH=wE63dcNaPLWD0vKaew@mail.gmail.com>
X-Gm-Features: AQROBzBMqgTUhWghYpRNIZDpsOWA443UoVRzdGjObC6SoT9V2ssj-2Muj4chrOs
Message-ID: <CAHk-=whO3F1u+nme4cnYMy5baYmb7CH=wE63dcNaPLWD0vKaew@mail.gmail.com>
Subject: Re: BUG: net-next (7.0-rc6 based and later) fails to boot on Jetson
 Xavier NX
To: Will Deacon <will@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Robin Murphy <robin.murphy@arm.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-ext4@vger.kernel.org, dmaengine@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_083815_194579_3E9F5D7B 
X-CRM114-Status: GOOD (  12.00  )
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

On Thu, 9 Apr 2026 at 05:24, Will Deacon <will@kernel.org> wrote:
>
> On Wed, Apr 08, 2026 at 08:52:32PM +0100, Russell King (Oracle) wrote:
> > What's the status on the iommu fix? Is it merged into mainline yet?
> > If it isn't already, that means net-next remains unbootable going
> > into the merge window without manually carrying the fix locally.
>
> I'll pick it up for 7.0 in the iommu tree.

... and now it's in my tree.

               Linus

