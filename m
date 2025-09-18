Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E46DCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 13:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arm2FVaxIKWuIaKnTZrIgyT2B8qcACP+dOzi1yRrb5I=; b=3KohzXjVzuYXTA223Eh2u+nsHJ
	7LraVo5waUekwWayg3pm9YGB6qZgQnh3e4jKyABkCK0p7pIMcRl5H1VtVBZRBAW8tuepzbhgDWxV8
	skwmyDDPK6pK5dm1VKaexkI9aEgKKJsoMmb9jSw9Zro/Y+2IxEFrffUHrm5B071rGCk3HzWjJRqK3
	IQ9TjHH332ROgvpmImRFzxaj84C2xHxNY+LhrwTIyz4x+JzC8nUZPYIOKZn8yJMsCOUjdDJx11fQi
	xfa9c9RZFK6eOUYomtgdxU0qD+7whXQFzZvtcx6ge65kKKEyQuAzdBTLtNlo6I3QxxCscR64c6MnN
	n6WNm9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEYy-0000000HWV9-3qPm;
	Thu, 18 Sep 2025 13:20:40 +0000
Received: from smtpout.efficios.com ([2607:5300:400:ed00::31e5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEYv-0000000HWT4-3fQu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 13:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1758201631;
	bh=arm2FVaxIKWuIaKnTZrIgyT2B8qcACP+dOzi1yRrb5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u85Qb97rmznRYAKNnQQR25jMOvG+6E2E1PmsYqUkA8cjOWO51Oiwr9fbClX+WDHjt
	 HkzbkM6VU9oezBS990j7Rxxk6F7vmdIwnmjn66XTixwH97bxO+ijzS/gqxY2/FpFyP
	 TjTolrzuYImoACGa6VedOHroHoU3AM37r6aDZnYj7s8Y3LbWY0Ux4Wh4pVndmHzIOV
	 NDKcrPObGrD94xAWLJOmZlBvDrJ04is7Wqm9vN4yq+evJyVF9qy4fRqYem6UQ77MVq
	 pTH39+Eh4LzXqnF6IXsvrZb95NwQdHdPTaRJRDjqIGoBNGdNcF8CB2US5jVI7WsVMb
	 n+MRHAlbFv0bw==
Received: from localhost.localdomain (unknown [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4cSGTq6LKSzGqy;
	Thu, 18 Sep 2025 09:20:31 -0400 (EDT)
Date: Thu, 18 Sep 2025 09:20:30 -0400
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	x86@kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V2 3/6] uaccess: Provide scoped masked user access regions
Message-ID: <aMwHHkaSECBDjuir@localhost.localdomain>
References: <20250916163004.674341701@linutronix.de>
 <20250916163252.164475057@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916163252.164475057@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_062037_996638_37AF1D60 
X-CRM114-Status: GOOD (  17.91  )
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

On 16-Sep-2025 06:33:13 PM, Thomas Gleixner wrote:
> User space access regions are tedious and require similar code patterns all
> over the place:
> 
>      	if (!user_read_access_begin(from, sizeof(*from)))
> 		return -EFAULT;
> 	unsafe_get_user(val, from, Efault);
> 	user_read_access_end();
> 	return 0;
> Efault:
> 	user_read_access_end();
> 	return -EFAULT;
> 
> This got worse with the recend addition of masked user access, which
> optimizes the speculation prevention:
> 
> 	if (can_do_masked_user_access())
> 		from = masked_user_read_access_begin((from));
> 	else if (!user_read_access_begin(from, sizeof(*from)))
> 		return -EFAULT;
> 	unsafe_get_user(val, from, Efault);
> 	user_read_access_end();
> 	return 0;
> Efault:
> 	user_read_access_end();
> 	return -EFAULT;
> 
> There have been issues with using the wrong user_*_access_end() variant in
> the error path and other typical Copy&Pasta problems, e.g. using the wrong
> fault label in the user accessor which ends up using the wrong accesss end
> variant. 
> 
> These patterns beg for scopes with automatic cleanup. The resulting outcome
> is:
>     	scoped_masked_user_read_access(from, return -EFAULT,
> 		scoped_get_user(val, from); );
> 	return 0;

I find a few aspects of the proposed API odd:

- Explicitly implementing the error label within a macro parameter,
- Having the scoped code within another macro parameter.

I would rather expect something like this to mimick our expectations
in C:

int func(void __user *ptr, size_t len, char *val1, char *val2)
{
        int ret;

        scoped_masked_user_read_access(ptr, len, ret) {
                scoped_get_user(val1, ptr[0]);
                scoped_get_user(val2, ptr[0]);
        }
        return ret;
}

Where:

- ptr is the pointer at the beginning of the range where the userspace
  access will be done.
- len is the length of the range.
- ret is a variable used as output (set to -EFAULT on error, 0 on
  success). If the user needs to do something cleverer than
  get a -EFAULT on error, they can open-code it rather than use
  the scoped helper.
- The scope is presented similarly to a "for ()" loop scope.

Now I have no clue whether preprocessor limitations prevent achieving
this somehow, or if it would end up generating poor assembler.

Thoughts ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

