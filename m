Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE638CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7rcTAWmSs4EiZ5IagojymObpWqOsu5m5rrwg8mIm9g=; b=i/Hu0bouDcNyp3lrrXNJL0TMqb
	02WJ5r2BjGzku6/XuCNA0WsenkrAS300hO9jLmTFoAEjxg7qtnaYOqn0EsccOwF/F9lwsCsv/WMlQ
	txrW7oszclaphWiTT98YBeMk2NdJW8E5mFyYEWk+g+r/Hhhf6paBR5HcVAOFKO+Na2jlD3X18i+Hd
	YDDKFc9WjQ6kD/4fJf16exkTQ/KFkzuJBul9qp0LkQzpo0bdB8nSn5oA193ahsEZLGE7FEY0f57Ma
	EI1f7C6KXwngYzfH0f5vmoYtpw79v8rESNohk4+kAb9MfNYsG0IuHj9fvVt9/AB4oh3xxv8IR4+a9
	+ADWIpTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVyH-0000000C8r2-0iXN;
	Tue, 13 Oct 2026 06:26:45 +0000
Received: from out-245.mta1.migadu.com ([2001:41d0:203:375::f5] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVyD-0000000C8qD-0VZy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:26:43 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ijzhhCvBzPeAT3SqmYXHx89D90VBI7qukSZjs8T278I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791872799; v=1; x=1792477599;
 b=l9JLJsk8HrbjY6KQs0qmp/P1BFlcan7JH4AXZbRNpuyYG1AtauNlj14dOICMMk/Pn7SCSGzZ
 QJpgBZG/Caf5Sc9OayyDOWPzCfVCdOvhjtABCrFRzELsbuCJ4IFeXlDfW6OpJ2H8b26UV5+pVMa
 xEsKmKXMqnABy1jD49u26PsY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id afbacc7007ea9f8d;
	Tue, 13 Oct 2026 06:26:38 +0000
X-Mizu-Trace-ID: afbacc7007ea9f8d
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261012202532.f059fd5ab947510a21d34cd1@linux-foundation.org>
Date: Tue, 13 Oct 2026 14:26:15 +0800
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 Muchun Song <songmuchun@bytedance.com>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Dave Hansen <dave.hansen@intel.com>,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org,
 linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1F709D85-8F18-4237-BA0B-BE8442DD221C@linux.dev>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
 <asy-b7_C3SjnmSaS@gmail.com> <145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
 <20261012193114.77147e0a43affa8ee1ae896c@linux-foundation.org>
 <200A83B9-233C-44C7-B4AF-0900BA1E09DF@linux.dev>
 <20261012202532.f059fd5ab947510a21d34cd1@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_232641_637623_133FB83D 
X-CRM114-Status: GOOD (  13.82  )
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



> On Oct 13, 2026, at 11:25, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Tue, 13 Oct 2026 10:50:21 +0800 Muchun Song <muchun.song@linux.dev> =
wrote:
>=20
>>>> The correct trailer is:
>>>>=20
>>>> Cc: <stable@vger.kernel.org> # 6.16-6.18: bf9e4e30f353: x86/mm: use =
pagetable_free()
>>>>=20
>>>> Andrew, would you be able to update the trailer in the patch when =
you
>>>> pick it up? If there are further review comments that require code
>>>> changes, I'll fix this trailer as part of the v3 respin. Thanks a =
lot!
>>>=20
>>> I don't know if/how the -stable maintainers handle a comment like =
that.
>>> I expect it's more reliable to do this via Fixes:.  Possible?
>>>=20
>>=20
>> Thanks. I used this format because it is explicitly documented by the
>> stable kernel rules.
>>=20
>> The shell-style comment is the format documented in
>> Documentation/process/stable-kernel-rules.rst for specifying =
additional
>> patch prerequisites:
>>=20
>>  Cc: <stable@vger.kernel.org> # 3.3.x: <commit>: <subject>
>>  Cc: <stable@vger.kernel.org> # 3.3.x
>>=20
>> See:
>>=20
>>  https://docs.kernel.org/process/stable-kernel-rules.html#option-1
>=20
> Oh.  Consider me educated.  Edited.
>=20
>> A Fixes tag alone cannot express this dependency. It does not specify
>> an additional commit that must be cherry-picked first. The documented
>> Cc comment provides both the prerequisite and the required =
cherry-pick
>> order.
>>=20
>> Would this be sufficient for the stable team to pick up the =
prerequisite?
>=20
> Hopefully.  I suggest you double-check when you get the emails as =
these
> are applied to the various stable trees.

OK. I'll keep an eye on it.

Thanks.


