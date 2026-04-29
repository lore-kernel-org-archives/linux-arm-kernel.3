Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9E5FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXnoxYgeAx6JJOsqxpFfEVRyZIubqYkb+sPjdLUWs6g=; b=a5C+k1PX9qG8ReSg9G1yDZTWRf
	RtHamzt+KDIYPvslzjI/gA3rd5BDJDZ7CKpIUTyeLrOGhbIHx05F3onsP6+F6oQNUEukv/TSXQfC9
	y3fea7Q897aoheIB/iUiviLby56mjygGqZSCH4xSRFiiwEEiCD2pCp7QEE4zctiNOrXHQ57J/OSVv
	ONC3u/ynwf3lbGejnweWjLzPmpMbAyCOFxtWP6aG2LwbAaLyqSX/a8vOJqqRtGl9K2WTlkHufBApK
	HzJ3Ab2BKhcTxeGmdFXEZsle1hPzpjS79CEI8VGeHa2asQ9lw7QNxAqIlRLVFnVZ6skWaLxVur9Vv
	YTnC1IMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI539-00000003gAz-3yUI;
	Wed, 29 Apr 2026 13:33:59 +0000
Received: from frasgout12.his.huawei.com ([14.137.139.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI534-00000003gAW-16R7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:33:58 +0000
Received: from mail.maildlp.com (unknown [172.18.224.235])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTPS id 4g5J7D2LdmzwPDx
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 21:29:28 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id 131E94056A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 21:33:44 +0800 (CST)
Received: from [10.204.63.22] (unknown [10.204.63.22])
	by APP1 (Coremail) with SMTP id LxC2BwD3qKKpCPJpsYU_AA--.18035S2;
	Wed, 29 Apr 2026 14:33:43 +0100 (CET)
Message-ID: <e325b7a8041b7122e8415de9193f4fe1be04bb02.camel@huaweicloud.com>
Subject: Re: [RFC PATCH v2 1/4] security: ima: call ima_init() again at
 late_initcall_sync for defered TPM
From: Roberto Sassu <roberto.sassu@huaweicloud.com>
To: Paul Moore <paul@paul-moore.com>, Mimi Zohar <zohar@linux.ibm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, roberto.sassu@huawei.com, Jonathan
 McDowell <noodles@earth.li>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-integrity@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  kvmarm@lists.linux.dev,
 jmorris@namei.org, serge@hallyn.com,  dmitry.kasatkin@gmail.com,
 eric.snowberg@oracle.com, jarkko@kernel.org,  jgg@ziepe.ca,
 sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org, 
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
 catalin.marinas@arm.com, will@kernel.org, noodles@meta.com, 
 sebastianene@google.com
Date: Wed, 29 Apr 2026 15:33:27 +0200
In-Reply-To: <CAHC9VhS_WgwhW_NDO91LoTeSzdieGqbwqnwPq8KpavH1_Lwi7g@mail.gmail.com>
References: <aeoAlVEwzRUPrlVe@e129823.arm.com>
	 <aeoRxWPyOHGJd+Jh@e129823.arm.com> <aeoWO2Cwo04YYu2l@earth.li>
	 <bd908e28298d968740d03c97bc7e441de188b7b4.camel@linux.ibm.com>
	 <aeokwrC86WI7uT+K@e129823.arm.com> <aeomlp3I0eVE5mce@earth.li>
	 <aeotq8nPVu4wvEx5@e129823.arm.com>
	 <e4e242ae5533d5762a3647186a178764881bf9ff.camel@linux.ibm.com>
	 <aephL3MzYoqFGaT5@e129823.arm.com>
	 <CAHC9VhRQWHEWQ5NzOPiu8jtYv6UsRm8WVS4fd74AbkOcAd4y_g@mail.gmail.com>
	 <aesGU8a3mbVzvteH@e129823.arm.com>
	 <CAHC9VhSaT_quKYnpFjAfqvL07JNbWMgM6c4pB9F46NHawX3DCA@mail.gmail.com>
	 <014cf39aa8d6a0bcfa1a95c069675977ac67b843.camel@linux.ibm.com>
	 <CAHC9VhTW3=RJ8L91RWXYYA9tFjfSXGN-DMEEwdiD6big9H57Ew@mail.gmail.com>
	 <1f78fc75b2e95239973612a4b6c4cc782960b7ac.camel@linux.ibm.com>
	 <CAHC9VhS4JmPmCJrYTdbjxb3TO-uK6cB3Zij-ef=wswGce2BGzg@mail.gmail.com>
	 <1e51c2fd090e5ceb07b1d09e50650c70fd3ccdb1.camel@linux.ibm.com>
	 <CAHC9VhS_WgwhW_NDO91LoTeSzdieGqbwqnwPq8KpavH1_Lwi7g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CM-TRANSID: LxC2BwD3qKKpCPJpsYU_AA--.18035S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4DZF17Ww1xtFyxJry3CFg_yoW8WrWkpF
	W2q34FkaykJFWrAwn7Jw4xXw10qr93Wry7Jrn0gFyUAws09r1qgrs3K3yYkFy8urs3WayY
	qFWqq398u3ZxZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAQASBGnx6jgC6QABs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_063354_599071_09F4321D 
X-CRM114-Status: GOOD (  21.89  )
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

On Mon, 2026-04-27 at 21:31 -0400, Paul Moore wrote:
> On Fri, Apr 24, 2026 at 6:49=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com> =
wrote:
> > On Fri, 2026-04-24 at 18:10 -0400, Paul Moore wrote:
> > > (I'm assuming you meant initcall and not syscall above, but if you're
> > > talking about something else, please let me know.)
> > >=20
> > > Saying that you aren't comfortable moving IMA initialization to
> > > late-sync is inconsistent with allowing IMA initialization to be
> > > deferred to late-sync.  Either it is okay to initialize IMA in
> > > late-sync or it isn't.  You must pick one.
> >=20
> > Yes, we're discussing late_initcall and late_initcall_sync.
> >=20
> > I prefer to look at it as being pragmatic. I'd rather err on the side o=
f caution
> > and not move the syscall to late_initcall_sync, than move it.
>=20
> If you were truly erring on the side of caution you wouldn't allow
> late-sync initialization without knowing if it was safe or not.
> Determine whether IMA initialization is safe at late-sync.  If it is
> safe, move the init to late-sync; if not, keep it at late and figure
> out another mechanism to sync with the TPM availability.  If needed,
> you could probably use the LSM notifier to enable the TPM driver to
> signal when it is up and running.

Yes, I agree with you, or transition or not.

However, all of this looks very fragile and easy to be broken. If we
want to be on the safe side, we can use any notification mechanism that
is suitable, but at the same time from IMA side we need to deny any
file access that would require a measurement until the TPM comes up.

If you accept this, I don't have any problem to move to late_sync.

Roberto


