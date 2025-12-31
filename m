Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7682EE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 01:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMI6ajuZVIMZiEQhaVHWRg1fswU4kVOnbMHiINfGSvM=; b=FiXIoa+Xxl/K4q5xhh2tykT5NZ
	scULSUzMbBhl8k3v3/t4mThu8RYD0s3waomAFqZh2QfRmGcszLgzz19anBz9TtmedAv97mXyFP5fx
	nIGZ3RZ5BHmeiBsJV8DyyrK06UGLCkQ1J5HBaiwnuUlPncYYx87jcUUu/VvW/Z/KQc+5VJ4eEirFd
	GEnUa0P3ogCQi2VvEO8xgz/LIVEXdV1IomEj9yEjEwwoispWeNjeEgsaFdu+eNC9M4ECMN1csisj2
	1ioEuj9hDlh64rmRS9MhF9Irh4GnOCi8seCD3GNyN93jbxnV+pgoKO+W2EtQTC/dqvM36Ra9C5h5K
	ooGQ3kxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1valSt-00000005YTi-3UcU;
	Wed, 31 Dec 2025 01:57:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1valSr-00000005YTK-3MUP;
	Wed, 31 Dec 2025 01:57:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 27D8C4053A;
	Wed, 31 Dec 2025 01:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71115C116C6;
	Wed, 31 Dec 2025 01:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767146246;
	bh=BEzGWJOVbkdOfvP+jxM8kRiE+88PF5GTUjfJy2MLec4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TDaAT+/rZ5rJby0gP47mwGNIqBGfNAGp8InD/a+DoxM+Qbsl3nyBw0CUZXyM+fL01
	 XvaXV0vJs9cnDRtgexhJe2okyTMGhTKI/PCVqW8c7NxiBmCffPqCieyHwGks9yqCbF
	 MmW5nsLh6+P8TToE0duTYa02+4C65NOJ6Jy75gbzaltzbg0ZT+rXOpcXUG/UDm2ZM7
	 66tSeknHYczlniNcFMFZUoH2XgbNWL1oyihdm636S819jYCPeI1uZ5zQcK7IlS9xzM
	 GtDgAuD5+SRTSwDal7uylPAW1Fuey0gF4SEOK6L5w6pQ24FguVvNlUMxA/MEjBOjjO
	 Dm47SXeT3l9Cw==
Date: Tue, 30 Dec 2025 17:57:12 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Matthew Schwartz <matthew.schwartz@linux.dev>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	Mario Limonciello <superm1@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>, quan.zhou@mediatek.com,
	Felix Fietkau <nbd@nbd.name>, lorenzo@kernel.org,
	ryder.lee@mediatek.com, linux-wireless@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-mediatek@lists.infradead.org, shuah <shuah@kernel.org>
Subject: Re: Linux 6.19-rc1 mediatek mt7921e broke badly
Message-ID: <20251231015712.GA2299@sol>
References: <d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org>
 <756e3f65-b2f2-4da3-985a-17754a7a872d@t-8ch.de>
 <CAHk-=wjO-7uR5HBi-MFnkxAxjhpgfbAQ+HCMKPiXFVwM+AJ7tA@mail.gmail.com>
 <6fc04df5-b753-4b2d-b978-0e59a7f48ff7@linux.dev>
 <c1304430-dd7d-437b-8744-70af9ca85c0d@linuxfoundation.org>
 <CAHk-=wh6WP0Wq=rbC2Md6vsFrV-+nvDjxgfx9NpMzUmVFNkJ9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh6WP0Wq=rbC2Md6vsFrV-+nvDjxgfx9NpMzUmVFNkJ9A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_175729_863234_702159EE 
X-CRM114-Status: GOOD (  16.78  )
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

On Tue, Dec 30, 2025 at 05:27:13PM -0800, Linus Torvalds wrote:
> On Tue, 30 Dec 2025 at 15:57, Shuah Khan <skhan@linuxfoundation.org> wrote:
> >
> > I would recommend reverting f804a5895eba instead of trying
> > fix it. Then find a better way to eliminate extra newline that
> > shows up in dmesg when firmware build date happens to have
> > a newline.
> 
> Yeah. Let's revert it.
> 
> And the way to fix the extra newline is trivial: just remove it from
> the "dev_info()" format string.
> 
> Our kernel printing logic will add a newline for the next line anyway
> if it is missing (unless somebody explicitly uses PR_CONT).
> 
> Can whoever saw the problem confirm that just a revert and a "remove
> \n from that dev_info()" fixes the output for them?

That works for me.  The revert by itself makes the FORTIFY_SOURCE crash
go away and reintroduces a blank line in the log.  Removing the \n from
the string passed to dev_info as well makes the blank line go away.

- Eric

