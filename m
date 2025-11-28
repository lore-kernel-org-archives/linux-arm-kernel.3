Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D480D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 00:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YdZPHc9UU1cTih+a9P92g90bZFsf3CbSrAZ21e8g1I=; b=Nw7cyZ2G5A/Ht3U464RNlKpFcI
	7ItSkf4lmmyU/8ViFeeq+51ttIk+maqkwo7oKwQZl/66h8UnQgsaJnJrIw17dgnZ32o9ndYYj1qth
	WOQWQ72oHDPnnYLCv3pZA2ZPf2cEiHRWyDweeX9c0P76UoFh9XD7Rk92iXvAfoFZufH0clGaISf9v
	MNHMfuYGFKHMMC3iJWlBGuT9toHPO99lpCeGnSu/XKe9Eacj2X/X/xMQoSHeOI6Ce/DfahQOf801H
	mTLI1FFsbgd3WuXam0perrI1h5mlzKNZdk2USgDJPWtc1DrZGj3Di388MRlnv0oTUasXEDl/o4pS7
	/TrMwcQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOmB8-0000000HKoR-2yoX;
	Fri, 28 Nov 2025 00:17:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOmB4-0000000HKo3-3dAA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 00:17:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764289053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7YdZPHc9UU1cTih+a9P92g90bZFsf3CbSrAZ21e8g1I=;
	b=ELDjxwOAFnLh7QgcjX42fK/ewRYfhW+o0MNRFKcNLHZ4JbAFscMEO793JcusxUSc0qgY9/
	62Rj1FWnaCASggMsdDC7JHdFrpZtKNP/pECCavL2X7L/+QM0Y/fbAF0YnkZ2rej7Obr16x
	Fd763BCO/Mv4o0BI8WsUUKn+a2w0YEM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-eQairQOcPdOBxcV4pnA9cw-1; Thu,
 27 Nov 2025 19:17:29 -0500
X-MC-Unique: eQairQOcPdOBxcV4pnA9cw-1
X-Mimecast-MFC-AGG-ID: eQairQOcPdOBxcV4pnA9cw_1764289048
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 902C31956050;
	Fri, 28 Nov 2025 00:17:27 +0000 (UTC)
Received: from localhost (unknown [10.72.112.7])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AABB3180047F;
	Fri, 28 Nov 2025 00:17:25 +0000 (UTC)
Date: Fri, 28 Nov 2025 08:17:21 +0800
From: Baoquan He <bhe@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>, pjw@kernel.org,
	leitao@debian.org
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, catalin.marinas@arm.com,
	will@kernel.org, leitao@debian.org, coxu@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: kernel: initialize missing kexec_buf->random field
Message-ID: <aSjqEQDv7V79V3Na@MiWiFi-R3L-srv>
References: <20251127182644.1577592-1-yeoreum.yun@arm.com>
 <20251127113706.d89a84f277dab3ad273dde75@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127113706.d89a84f277dab3ad273dde75@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_161735_344207_5D3557DC 
X-CRM114-Status: GOOD (  14.15  )
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

On 11/27/25 at 11:37am, Andrew Morton wrote:
> On Thu, 27 Nov 2025 18:26:44 +0000 Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> 
> > Commit bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
> > introduced the kexec_buf->random field to enable random placement of
> > kexec_buf.
> > 
> > However, this field was never properly initialized for kexec images
> > that do not need to be placed randomly, leading to the following UBSAN
> > warning:
> > 
> > [  +0.364528] ------------[ cut here ]------------
> > [  +0.000019] UBSAN: invalid-load in ./include/linux/kexec.h:210:12
> > [  +0.000131] load of value 2 is not a valid value for type 'bool' (aka '_Bool')
> > [  +0.000003] CPU: 4 UID: 0 PID: 927 Comm: kexec Not tainted 6.18.0-rc7+ #3 PREEMPT(full)
> > [  +0.000002] Hardware name: QEMU QEMU Virtual Machine, BIOS 0.0.0 02/06/2015
> > [  +0.000000] Call trace:
> > [  +0.000001]  show_stack+0x24/0x40 (C)
> > [  +0.000006]  __dump_stack+0x28/0x48
> > [  +0.000002]  dump_stack_lvl+0x7c/0xb0
> > [  +0.000002]  dump_stack+0x18/0x34
> > [  +0.000001]  ubsan_epilogue+0x10/0x50
> > [  +0.000002]  __ubsan_handle_load_invalid_value+0xc8/0xd0
> > [  +0.000003]  locate_mem_hole_callback+0x28c/0x2a0
> > [  +0.000003]  kexec_locate_mem_hole+0xf4/0x2f0
> > [  +0.000001]  kexec_add_buffer+0xa8/0x178
> > [  +0.000002]  image_load+0xf0/0x258
> > [  +0.000001]  __arm64_sys_kexec_file_load+0x510/0x718
> > [  +0.000002]  invoke_syscall+0x68/0xe8
> > [  +0.000001]  el0_svc_common+0xb0/0xf8
> > [  +0.000002]  do_el0_svc+0x28/0x48
> > [  +0.000001]  el0_svc+0x40/0xe8
> > [  +0.000002]  el0t_64_sync_handler+0x84/0x140
> > [  +0.000002]  el0t_64_sync+0x1bc/0x1c0
> > 
> > To address this, initialise kexec_buf->random field properly.
> > 
> > Fixes: bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
> 
> Thanks, I'll add a cc:stable to this.

This has been fixed in below series from Breno Leitao.

[PATCH 0/3] kexec: Fix invalid field access
https://lore.kernel.org/all/20250827-kbuf_all-v1-0-1df9882bb01a@debian.org/T/#u

And Paul Walmsley said he has merged the series to riscv/linux.git.
While I can only see the patch for risc-v. The other two are missing.

95c54cd9c769 riscv: kexec: Initialize kexec_buf struct


