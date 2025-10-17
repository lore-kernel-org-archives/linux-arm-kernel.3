Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D8ECCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hEYjK4XGVjCrvoOJeg0ZEh8+ica9r/qK/NZKGu0EA4=; b=WbrU2KDuzUcbXmWf0mYoJJMBRH
	9ZFa8uypQLyy6yJlcTX6V+tZc6DOL85lzyyQLKaAXgjRlCvsT5myQjxl8p7SokjQSUQjdRphE2q+v
	Oq7P4uA4DmMVLvRUuDcDggKKr6WEq8PfG4G/HTxmA0MBciZc3KcLvDLS1I0ytnAriDaHakeoGFkuv
	fcioQhEjU2ZFtapFQGgvLCS1mbGNyrc0SW/0Cd0y/IGRKytrLqsMdf/MoZOiH08g86qDzYn6H+xzz
	4/+pxG2vk1PfrdMfqsD3HkgZ6w3uuU1icwhZ8WV9vKv0ru9Uvl0iBe0PVovfknxyo+nest0Cx6PA7
	2FGEWkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hoi-00000007Xy6-37oV;
	Fri, 17 Oct 2025 10:36:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hoh-00000007XxH-2aXK;
	Fri, 17 Oct 2025 10:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0hEYjK4XGVjCrvoOJeg0ZEh8+ica9r/qK/NZKGu0EA4=; b=fWi1v8hNQkssTp7wPTCPBDiNCW
	tjfosPU8LE2dZl3bBZZN83/L6douPhSRNHcYuF//L/0kQ6A3xLfHaa9fw9YSKULC9TDbDeBzFd5QT
	o5Y82LuzrMqrLzagAtt7nAxLS5vsJ06A9OcTR+2If2BEi6ybOAste9RRdfttxtW/w32Vs6JeNYEA9
	OfmnYJcY3uH2+LkO4EeXq9GrtctUlvK8lELPMnbD2ITa7k/xEDDTaGg4sB1quZswTO2o5KohK6S8z
	XGmg8eH28de1pujpSKSj+enhHUebEceGs0B++WfyKTTQuwVClbwH0B4LxCPim6iwiepl0M2k279wY
	LdnPU2uA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hoR-00000007TnX-3lDP;
	Fri, 17 Oct 2025 10:36:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E92A630023C; Fri, 17 Oct 2025 12:35:54 +0200 (CEST)
Date: Fri, 17 Oct 2025 12:35:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [patch V3 12/12] select: Convert to scoped masked user access
Message-ID: <20251017103554.GY4067720@noisy.programming.kicks-ass.net>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.570048808@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017093030.570048808@linutronix.de>
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

On Fri, Oct 17, 2025 at 12:09:18PM +0200, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Replace the open coded implementation with the scoped masked user access
> guard.
> 
> No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Jan Kara <jack@suse.cz>
> Cc: linux-fsdevel@vger.kernel.org
> ---
> V3: Adopt to scope changes
> ---
>  fs/select.c |   12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> ---
> --- a/fs/select.c
> +++ b/fs/select.c
> @@ -776,17 +776,13 @@ static inline int get_sigset_argpack(str
>  {
>  	// the path is hot enough for overhead of copy_from_user() to matter
>  	if (from) {
> -		if (can_do_masked_user_access())
> -			from = masked_user_access_begin(from);
> -		else if (!user_read_access_begin(from, sizeof(*from)))
> -			return -EFAULT;
> -		unsafe_get_user(to->p, &from->p, Efault);
> -		unsafe_get_user(to->size, &from->size, Efault);
> -		user_read_access_end();
> +		scoped_masked_user_rw_access(from, Efault) {

Should this not be: scoped_masked_user_read_access() ?

> +			unsafe_get_user(to->p, &from->p, Efault);
> +			unsafe_get_user(to->size, &from->size, Efault);
> +		}
>  	}
>  	return 0;
>  Efault:
> -	user_read_access_end();
>  	return -EFAULT;
>  }
>  
> 

