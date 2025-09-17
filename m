Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20345CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 13:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Cc:To:Subject:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JljgZLIBtKNLv7THtca2zBO4BQugyQ069yskH3KW3rg=; b=Zv2R9kO8xRD6Akgqjpv7AgnMPU
	DCnviDquuXFI4Dj0PnYVASUwMK21ePTPlX0kiJ4/WiEadz9JxNUZpTeT3vrXpowG7SCu8Nv1ispY2
	tj8upUwy3qvytm8EolBA1FOD5180+OBygnSkg4c8dWWcW8xYTPoaBn2ldCEIpo/hSKA2QNQbE2f8I
	3ySPw2yca6bKqFAIJCPD7Ibwfo2gLx2klq7+A1kaPYCTHyTdkaJYyUDraLPHDO5eTyDAMhzI0z8No
	QygMlQn2cFRbLJ/drorj9wd6PTP+GAnUPdWyt33RNT6yHfbhkODOM1EZDlnFAfBYbxP/tCqIzQpCm
	Jb48+nAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrzL-0000000Bb17-2A4b;
	Wed, 17 Sep 2025 13:14:23 +0000
Received: from mail.cock.li ([37.120.193.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrzH-0000000BaxE-4BQt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 13:14:21 +0000
Date: Wed, 17 Sep 2025 16:14:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1758114851; bh=AVTfR3o+7jn50KNytEpn1CX8gwyVF+e5qSI4wA5XEDg=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
	b=iQtHddGwnWdt0gEkK0i1Dr7qeeOWC+cux1qV3l+uTQhh84TV8I4DajuBJGqo6dhNx
	 B+AEVbXBQGFFei8hZH53V2LrnAE/dd7VttjYYfgbxe4dRM0gz4+j/6xk7meklHx4+6
	 aNvTKW4F6CPrQ0ZlZMlUhA48j3kSnTWsuaVPW1F15C+IBpkF+D7VKZAss/EpwiuRyC
	 bO+QGBN0/kgI/wBSBytkHBm71x1RckPltXmF297on9E1LSyFOZDz2GA2jxl3rgdNcw
	 RaaxfdGZaN0HuzsFaJbiVXxnw8z5iVCIiQLgeNvALfyYCfbD/0dRmFmPkgz2J9q6wB
	 YxWw8o642y+dQ==
From: kemal <kmal@cock.li>
Subject: Re: [PATCH -next v6 10/10] arm64: entry: Convert to generic entry
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>
Message-Id: <G3IQ2T.YZ8RX05BU5F81@cock.li>
In-Reply-To: <886f1357-8d14-bb63-bf46-837bb6922ebd@huawei.com>
References: <20250916082611.2972008-11-ruanjinjie@huawei.com>
	<20250916144621.5606-1-kmal@cock.li>
	<886f1357-8d14-bb63-bf46-837bb6922ebd@huawei.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_061420_559949_BB990068 
X-CRM114-Status: UNSURE (   8.29  )
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



On =C7r=BA, Sep 17 2025 at 09:55:35 +08:00:00, Jinjie Ruan=20
<ruanjinjie@huawei.com> wrote:
> Thank you! I will try to implement arch_syscall_is_vdso_sigreturn() as
> this and test it. By the way, is this for supporting arm64 in wine?
No, I don't even know if arm64 windows binaries do direct
syscalls. This is meant for some other project.
>>=20
>>  2 - This trick shouldn't be done if the syscall will be catched by=20
>> SUD:
>>  if (scno =3D=3D NO_SYSCALL)
>>  	syscall_set_return_value(current, regs, -ENOSYS, 0);
>>  As the ABI could be anything.
>>=20
> This requires discussion with Catalin and Will, which may alter the
> original intent.
Sorry, I didnt read the code carefully, syscall_user_dispatch()
already calls syscall_rollback() which should restore x0 from
orig_x0.

You can test SUD using the selftest, but you need to add these
lines at the end of handle_sigsys() in sud_test.c:

#ifdef __aarch64__
	((ucontext_t *)ucontext)->uc_mcontext.regs[0] =3D (unsigned int)
			((ucontext_t *)ucontext)->uc_mcontext.regs[8];
#endif

and you should define TEST_BLOCKED_RETURN in sud_benchmark.c
to make sure arch_syscall_is_vdso_sigreturn works properly

-kemal

>>=20



