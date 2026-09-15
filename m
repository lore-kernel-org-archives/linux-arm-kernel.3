Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F288C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=; b=CHGKzTDhNfqvdimVlisdF1POhc
	F4MO79z9OVwNOWVwsYfLUZ05J3HxI8h9gzk+C2Fhu8D0Inwwgjr+IFJ12wJQOyuAXTdr/B9sSuibE
	yz9JUHv7IeCfUG3pjwR1XkDb7wCa+u26GA8/rcdbj8Btek1oxli13q0uMQQUA7OTPtxMg6shRO+Db
	hxRyqO7xIU+9XXY8iGovDIljh8eO4b54Zvz5cN1JsK/LEHD8LFrUxAL4B/9reR2kD0jA0/OSJ8YkH
	VYsTBLbgcsMWbaABr40cDFLMuVPrgQp/thYrGUXEqceXY5ZEhxajn4oHxRwPnP4ESbTqv+YFyPx83
	ug5UJmjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XKI-00000007eif-0SNb;
	Tue, 15 Sep 2026 17:52:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XKH-00000007ehl-1D4o
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 17:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=; b=II1ZAWppOE+auBYxlIuMLW1rFC
	aoCpsM+BcHGgtXaVEqtJwsUEljXAwRAJYn0tAaSOtwYpAG7mHy62V3CPEughDeZgHtwx2CgHsgFr/
	qCC5f6WKgWqyXG1+Xk7sLVYa+vWrZPaO5gae2vLt3MyES30qqUa2c6KTyv8Y3QCngjET+mTEXEjlY
	2nFS0LYR1NyTA2yg4ZsPMu6NBH9tvt0Rn8S8qdhhAISaF1qR0L3Cp1A7W8QiN4+DNIbkQwyJHobUW
	uQFpwXr4xLtUK/vxufWgRUNxIYbD0dr8FiIzhgxehJe3aazG4TQL7LPbb24+XZwP63gHy+6upSC9V
	OIMIqgbw==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6XKD-000000076jk-0Vyk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:52:11 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2db425c9050so12165ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 10:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494727; cv=none;
        d=google.com; s=arc-20260327;
        b=j3x35vHfTk+xd4krWlNzq4eVhqqNXgysO58lchYYz+9U+J1v/VThzdiWLR2I6W8KRG
         GPI8bSm+1j59NwsD5idUs2Ak/mcpLu93upLY5tN0r7fapxjLiRdJE0XnNTMTijYwm5o0
         m/pYoJqg6J9T0dAOwKiFvGVMdfyRnAwS+dpp30yCXIPjm9ISUDW3gjg2hv887sLFBgcF
         7Zv+oHABAQp3ax2JaMWb0rXD7J/t8D2Mdrp8ZFMJJCHJJCn1FOsx60SdrgZjsIRlA4JM
         aC3Rioh5/4hwxI0/1IaNHZ77732qZ+Vj/GrNhWmm5hLxgyrzSAUjOTYuY+aqN7N5Zh0o
         Zc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        fh=PIXs9QkNj2/7D7lVDlQ9VCTMr3AK9MqmbXPZNm44Zto=;
        b=s2DLl9CpjfdUdShaHyiJtNXU6YIAe+pS8xsxG8arj9xynBk85Ij7LXtkiVTVzZXXW4
         IUX+k/nbOr5s9xNbsObWOlF21XSQYG2uTP+L1JP8N2uabG5m7gRtJlR1VO61bO0E6TFA
         jR+7BfV51A1xm1lKa0EUglzi/U6DbZn60b0DlIC3e5605Mori8HeJjbk/VKcPs67ujPA
         Xc3YeOSRJOmjmD4+vrkBrbFl3VD1WaGly07rLguO7/VtFu1FjhMZuG7p+ZKZF1yNV77p
         /KhkkHbwlP71UKxac1L/JdFzfkExoQSAZ+o+DokfFGvhuSFonSsYAWq4cRyBw3VXZdj2
         mXuw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494727; x=1790099527; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=v+jO3VJgsnUifpclVFgNdjMcyvUQpnfqHupbIlBGRjnhWtWE97SE9rvGpSIP4pxkSe
         x+TvQSB6BHu7aEaHVF9i+Tkjn617UD9utZMuaCUc0LThFbRvTGBMXVgV2g0cwI0Knhbo
         hW3mOw6slYadATKIlham/UojDKkSqdscHxokQinPCKNPvQf6Bk92Oi1tMmd41AMbVFZM
         xuiw9lXEdvF382NtEcq3V0oehVbN+DF7OVLQeEIAL+ezLrt1HfUv+BOtS2uEKRtM0bXX
         f7OiH78VHG9JEHFH3s+FQmSvt5YdwToBiThIfGmvfkVqDbnj8R5JV7vxFzC2V52td+se
         gxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494727; x=1790099527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=E23XoyCJa/y+R8QTmSZR+tm5URoGCJtapft8TV+KoyEZhNbKFbFLDwVDwrKxDtWX+i
         r8tPsbgSHGnnrmq56bcazc8WtLfH9IYrkqMlJxqPuSsSVfGhvVy8/vKMyrzmOKHZONxh
         3FC+slWlSywDWkof6B9tn/n4qymEwaEzXSL3oPB4lYAdwULCWLMrF+BOsrwwgWAHX3+z
         GRTEBFHciTOajApeH8kip606V0XHhanFTJDYBt8qnDQ2CYcSs3UaNvzLNKIkRBAJ9aMy
         b+iikHbOHNckFiDhnTNVS/ZZTlr5o0Bxa7VABgUsf1Z4WX3s5JvPvUgTTxWioccFPO7n
         4IfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwv0z1JHUA6Bx6JGeP6bJYAr2xAGvEdDai47Yu4n6KZacfXwEzR9ABEDCTKb0hXCb7IXqPph2JsaYjRLXHAPMWy@lists.infradead.org
X-Gm-Message-State: AFuF++lx9bAu8YesA9nBgFjUnuFN4kxNdTIyXOgNWyB7PJp9nYyed7AN
	dEgBc5AUPR4no1Dl6RmsJgnbR0W/b3SO8ZZRMuWS27uODIkPN7EpSH8hfcuujSq+yDTBhkbvo//
	s1qwVV+o9EUS1jqOwkjW1iBMcmDCRvRIe5pNmcDQp
X-Gm-Gg: AYBFou1LbEEu5LgyMXOAOR2iGlqlKFxTCQbIZxM/LdgR+BFUl6PoLVk2YomLJ+CJwlt
	kr8pGBl+1h5uckR/L5DME+CiIfYrAW2OJlYBForQFI5L2KHBnFmlIQsINHB9LKpXpICumPOXNhv
	90uZ1OoKqevw0pnFP/7U6I8ztlYJY+dmUNVYMsYlmnGllG08JwVu9NampccGRsTA9uLhZaRHtoK
	LEKQSrMXBW4HIkMyGEFDjQsYRFSqIkO7/jZoa0fp3Bm70XXuebPdgR3uJZGOn/rB7NHzpymBLi9
	ybCU0Hg3D23mVP0xHUS6qdlvwlEaDGZGVB18yGygYbOOJqEHBhlFfRjQR+WYkL0nhIqjagVlJd4
	HdiZX+51Z5EzLgSOdEj79PX3HX/7Z4letbcJPbm9z0HAQ4EXy3ZQ=
X-Received: by 2002:a17:902:f612:b0:2dd:5363:31ec with SMTP id
 d9443c01a7336-2dd89c0c38amr177395ad.14.1789494726332; Tue, 15 Sep 2026
 10:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 15 Sep 2026 19:51:27 +0200
X-Gm-Features: AcwNN1Vhgv53PI2-XyXtJBbVzCNkGiiWjtvOE2b-8zHim7-UybJ3H2xniPj1VUE
Message-ID: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_185209_297139_6B4A7C77 
X-CRM114-Status: GOOD (  16.24  )
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

On Tue, Sep 15, 2026 at 1:31=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

I'm not really a fan but I feel like if you want to do this, you
should be using task_work so you don't have to touch the entry/exit
paths directly? (And if task_work is too inefficient somehow, you
could tinker with the task_work implementation.)

> When the syscall returns success the exit path installs every staged
> file. When it returns an error it drops the descriptors and the files.

Is this mainly about stuff like "we installed a file descriptor and
then the following put_user() failed"? Because if so, I think a nicer
fix would be to have a policy of "if userspace provides unwritable
memory to a syscall, just keep going and pretend the access worked",
and maybe have a sysctl that kills the process when this happens to
emphasize that userspace should not be doing this.

