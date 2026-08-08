Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0564CC5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 00:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pcb26i57LeuHt5V4Rj0cM3d7zYiF7kFZXLg6nSj+tc=; b=nlgTDbM26Afth1Ws73EqafuZpb
	nK2ocBlUS3vwqguPKXl9IUSFPaGDBusZ1QXD0DW7vzNYs3itl5k7o6uwTAKtNM7zreK/UQk5X34DD
	lf0XjrtoAqGKx4efPhgmyapVF4/F1z+rzKwALurOoDZxTAVQs6gjvg6zJPPH45cO7fda3ZvnnNCuV
	6uwF6sv+95zyc8VqhcBo/5BBeWUlhH68oVaNJYM4DlenPfUt3ZFk5KvnSbhLYxpAxBljlBecOZCpQ
	CqTPTpsOm82QTmzXHdHG8dYFTrynmh/tbtojAb5JmpO3LehS2eIp6d+PwAZ9xAijzyURAWA84OTGM
	0sh/SdNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsVCx-00000008w4l-1q1A;
	Sat, 08 Aug 2026 00:46:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsVCv-00000008w4I-2C7C;
	Sat, 08 Aug 2026 00:46:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0114340B95;
	Sat,  8 Aug 2026 00:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C361F000E9;
	Sat,  8 Aug 2026 00:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786149996;
	bh=4pcb26i57LeuHt5V4Rj0cM3d7zYiF7kFZXLg6nSj+tc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=YngxjQG174bqolPSd5VVVJKFuUnSq7lbjttW3PnYUotyy41tHwIwYHfkuI4GfwBJP
	 kpAaJYx87lgDgvDEF4VNSzCkBVv7LuHDGMeR/4txCMDM6d+PZZbO5eWWgkQYqHlxg8
	 cyPY8aZO3PPh810eLM3NGgHGkYEj8poI7SKqe3gkOvDHRYti/x6c7vu54XPxLLtPxo
	 fZSZg0WWEROxF6hz1i72hYT13yjumpZt2JTJwT8EMT7RcABsQyDXSVKwxAuAq64AmY
	 XKjbQ8F5qd3NqfiHFBnc7PxXMc1ib3+5pXxJm+RWHsE2AOksarItgWOk0InUT6HB/8
	 5WkS8QDRLGTuw==
Date: Fri, 7 Aug 2026 18:46:35 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Xixin Liu <liuxixin@kylinos.cn>
cc: linux-riscv@lists.infradead.org, atish.patra@linux.dev, 
    anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, pjw@kernel.org, 
    palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] perf: RISC-V: use BIT_ULL for u64 overflow
 masks
In-Reply-To: <prpmask01bitul.1786092600.git.liuxixin@kylinos.cn>
Message-ID: <45bd4156-0209-6aee-e957-24797b4ef115@kernel.org>
References: <cover.1786092600.git.liuxixin@kylinos.cn> <prpmask01bitul.1786092600.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Hi,

On Fri, 7 Aug 2026, Xixin Liu wrote:

> Overflow status and restart masks are u64, but bits were built with
> BIT(). On RV32 that is an unsigned long shift, so indices >= 32 truncate
> or wrap and corrupt the mask.
> 
> Use BIT_ULL() for those u64 bitops.
> 
> Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>

Thanks for the patch, but, same comments as on

  https://lore.kernel.org/linux-riscv/9109b689-1145-c714-ebe0-ec368f242a78@kernel.org/T/#m6fa97e46bde0d100fa0ec2854d47a57bd271c0b3


- Paul

