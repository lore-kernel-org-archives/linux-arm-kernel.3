Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F1FCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzSMvUpKqgbgo/t58MEvbeMbyzi8P8siIy2+jxOiWQU=; b=BirJqnp/rF1KryXG4+4v8Jaeai
	aWDijLkkRJUVgIDg+idy7ppzTodUORv97vjO/dXrFx9URIxFf6V/Z5Z2q6fxivh4V5e1mumQW+ayR
	SYzjlGghnFTXkgvn4I3mpBTq6j0Dgj5ja3FAl2jlNnbZYWysI0u85ASVuvCOGzSU7w2S++BiJzA+X
	tWifiHEs2OcOZlPCUeAD0rn7tDDu5K0QVvFASCOK3Cd1CxZfpEXMmykZV2N539pkpVyFhXMYonwYM
	yH/zSZgK3pqukDo47qQCiVq6RZkvgfqW3y/B+oPvkH30G8hwtGKHPvdmACo9RU3OZMdOOtKeltxNN
	W+UIy4Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtpN-000000036rj-1Htn;
	Thu, 07 May 2026 08:11:25 +0000
Received: from frasgout13.his.huawei.com ([14.137.139.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtpJ-000000036po-2ERI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 08:11:23 +0000
Received: from mail.maildlp.com (unknown [172.18.224.196])
	by frasgout13.his.huawei.com (SkyGuard) with ESMTPS id 4gB4Zv0NBpzpTwg
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 May 2026 16:06:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id A8F2A4056D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 May 2026 16:11:10 +0800 (CST)
Received: from [10.204.63.22] (unknown [10.204.63.22])
	by APP1 (Coremail) with SMTP id LxC2BwDXiKIPSfxptCa3AA--.10670S2;
	Thu, 07 May 2026 09:11:10 +0100 (CET)
Message-ID: <8c99263d8e63100e0b5e6c8cf739f7f6e7e79f6b.camel@huaweicloud.com>
Subject: Re: [PATCH] ima: debugging late_initcall_sync measurements
From: Roberto Sassu <roberto.sassu@huaweicloud.com>
To: Mimi Zohar <zohar@linux.ibm.com>, Paul Moore <paul@paul-moore.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan McDowell <noodles@earth.li>,
  linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, jmorris@namei.org, serge@hallyn.com, 
 roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com,
 eric.snowberg@oracle.com,  jarkko@kernel.org, jgg@ziepe.ca,
 sudeep.holla@kernel.org, maz@kernel.org,  oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com,  yuzenghui@huawei.com,
 catalin.marinas@arm.com, will@kernel.org, noodles@meta.com, 
 sebastianene@google.com
Date: Thu, 07 May 2026 10:10:52 +0200
In-Reply-To: <461ec995935e2b42a8414f6f87063ff2557bbfb4.camel@linux.ibm.com>
References: <cover.1777036497.git.noodles@meta.com>
	 <7734099f5e7fda5480bca016a9e6707983325fbd.camel@linux.ibm.com>
	 <afMlgstqahnZg68h@e129823.arm.com>
	 <9f188536f09a2db30877d6bfbb84aeaf2565cccf.camel@linux.ibm.com>
	 <CAHC9VhRsnmPp2KmQAns5uq5qXX5EF2xQQzyfTgrPi4O9AXyPpg@mail.gmail.com>
	 <ba4bf28314b679474a6a8da6298e548e54b3754c.camel@linux.ibm.com>
	 <CAHC9VhRE2kRr1fdDf6xgQgpSrtvqtP8Vy9LVGJhDZFUbzLKGmQ@mail.gmail.com>
	 <ff28c6dcb60c357c752724927addaa8c4fd3bf2c.camel@linux.ibm.com>
	 <CAHC9VhQY2TMkTvQq9P8oZteQWQSr7qq2utOuH+pdVx+8jWLBCw@mail.gmail.com>
	 <a9412fe10e70ce95dd70556ace19368bec5c188c.camel@linux.ibm.com>
	 <CAHC9VhRUgNA=Sj=jhD=zOt8R80Q+FQj+H0nYSy-FAujTL3EKPA@mail.gmail.com>
	 <5debff82dc758d9c91223e4f1f5b9e39a3fcd4f5.camel@linux.ibm.com>
	 <19dfb0e2730.2843.85c95baa4474aabc7814e68940a78392@paul-moore.com>
	 <461ec995935e2b42a8414f6f87063ff2557bbfb4.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CM-TRANSID: LxC2BwDXiKIPSfxptCa3AA--.10670S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF18Kw4kArWDAr17tFy8AFb_yoW5tFWfpa
	y7W3WIkrWktFW8Aws2qw18WryIy3s3GayUXr15Kry5ArnYkr9Y9FsxtrWFka97C3ykt3WY
	qF1jqay2kw1DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIF
	4iUUUUU
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAgAGBGn7JLIKAwAAsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_011121_850984_3CB80C05 
X-CRM114-Status: GOOD (  30.98  )
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

On Wed, 2026-05-06 at 22:25 -0400, Mimi Zohar wrote:
> On Tue, 2026-05-05 at 22:11 -0400, Paul Moore wrote:
> > On May 5, 2026 9:57:23 PM Mimi Zohar <zohar@linux.ibm.com> wrote:
> > > On Tue, 2026-05-05 at 18:55 -0400, Paul Moore wrote:
> > > > On Tue, May 5, 2026 at 5:05=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.=
com> wrote:
> > > > > On Mon, 2026-05-04 at 16:51 -0400, Paul Moore wrote:
> > > > > > On Mon, May 4, 2026 at 8:03=E2=80=AFAM Mimi Zohar <zohar@linux.=
ibm.com> wrote:
> > > > > > > On Sun, 2026-05-03 at 12:46 -0400, Paul Moore wrote:
> > > > > > > > Regardless, assuming you always want IMA to leverage a TPMs=
 when they
> > > > > > > > exist, your reply suggests that using an initcall based IMA=
 init
> > > > > > > > scheme, even a late-sync initcall, may not be sufficient be=
cause
> > > > > > > > deferred TPM initialization could happen later, yes?
> > > > > > >=20
> > > > > > > Well yeah.  The TPM could be configured as a module, but that=
 scenario is=20
> > > > > > > not of
> > > > > > > interest.  That's way too late.  The case being addressed in =
this patch set is
> > > > > > > when the TPM driver tries to initialize at device_initcall, r=
eturns
> > > > > > > EPROBE_DEFER, and is retried at deferred_probe_initcall (late=
_initcall).  Since
> > > > > > > ordering within an initcall is not supported, this patch atte=
mpts to initialize
> > > > > > > IMA at late_initcall and similarly retries, in this case, at=
=20
> > > > > > > late_initcall_sync.
> > > > > >=20
> > > > > > Okay, so from a TPM initialization perspective you are satisfie=
d with
> > > > > > a late-sync IMA initialization, yes?
> > > > >=20
> > > > > No. On some architectures moving IMA initialization from the late=
_initcall to
> > > > > late_initcall_sync does not miss any measurement records. However=
, as=20
> > > > > previously
> > > > > mentioned, Linux running in a PowerVM LPAR the move would drop ~3=
0 measurement
> > > > > records[1].  So no, only if the TPM is not initialized by late_in=
itcall, should
> > > > > IMA retry at late_initcall_sync.
> > > >=20
> > > > What do you do in the PowerVM LPAR when the TPM is not avaiable at
> > > > late initcall and you have to defer IMA initialization until
> > > > late-sync?
> > >=20
> > > Your question is hypothetical ...
> >=20
> > <heavy eye roll>
> >=20
> > > ... as the TPM isn't deferred, so IMA doesn't go into
> > > TPM-bypass mode.  Testing on a PowerVM LPAR demonstrated that it skip=
s ~30
> > > measurement list records.  So moving the initcall to late_initcall_sy=
nc would
> > > cause a regression.
> >=20
> > Let me rephrase to make the question clear - how do you plan to handle =
a=20
> > system where you lose measurements by waiting until late-sync, but the =
TPM=20
> > is not available at the late initcall.
>=20
> There have been suggestions to queue the IMA measurements, but that goes =
against
> the "measure before use" principle. The solution is not to defer IMA
> initialization for all systems, but to differentiate the boot_aggregate r=
ecord
> (boot_aggregate vs. boot_aggregate_late) based on when the TPM becomes av=
ailable
> relative to IMA's initcall.  IMA's job is simply to collect and provide t=
he
> measurement list.  Based on the attestation service policy, the attestati=
on
> service will decide whether a measurement list containing boot_aggregate_=
late is
> acceptable.

Agreed on no violation of the measure and load principle.

But also the two boot_aggregate solution does not work. If there are
measurements before boot_aggregate_late, they can corrupt the system
without noticing, and the corrupted system would emit the
boot_aggregate measurement (non-late) to pass verification.

Roberto


