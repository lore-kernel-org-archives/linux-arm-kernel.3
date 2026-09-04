Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569D1C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEJJglxD5sS7wGiZOiPyzebmlox9AlxZce99gHgeTy4=; b=xNEHTpKh84mGpUB1ZEuiRBWXTd
	aFSBhonknjWrj3JkzhU1V4vAmCvGhhUckxBtZA+XTYDQQhWbKRKDWEJGTNAXc8A61i+mT/tKiAz4A
	QXZ+DKQPnFnGqL/2aIUtoBd9bLUcBIx6LW0gx3ga1RAYAJuhX9ZV+M2lk3YS5mXLUe7ncJ9WDnmfb
	AgtTehvDaL5dlZXrxQfmyiOcCemumjzkqxyko2QmHXGkLdqlM6jfKQ1pEaUOstyp1RXrY79j5aqIf
	pJ67XXf/yE9DiVYXgJDkqc58FmCdyXdOa/1zAIthBaD2uFE0tP+ZhTfN93dDtPR7sDcHZp0F6XoG2
	qGM6kusw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PYv-00000001Riq-2A0M;
	Fri, 04 Sep 2026 08:46:17 +0000
Received: from out-250.mta0.migadu.com ([2001:41d0:1004:224b::fa] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PYr-00000001Rgn-0pgJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:46:15 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=xcY8MvnvZmT7aDUdDZL53RiTKNAdYrLmhkuOTgsocis=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788511571; v=1; x=1789116371;
 b=T6NJ7uuQxsKv2LogIVSt2bDEF0GKumuHiCjOU5INR2vshR5+oZ0HvCbdX24NB8nXtjkwRKvN
 7N8xb8Q/vOM9SLkcJD33SzzrVdD1pcCW0Ba1tfxJhdlikXalk9brkPf8WD/ilKHgYruNcBcw6Cf
 4TGpu92IwNPdnbD60ghLMmuw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cc6014fc4f1e0f04;
	Fri, 04 Sep 2026 08:46:11 +0000
X-Mizu-Trace-ID: cc6014fc4f1e0f04
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so3870e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:46:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByBlLMP2IvBSB5k+9MMWp5ud0V0alAZyQTvsNdsQreIzU12WuH7M7spkw26cUoXlhwRz1nw7CvRQ3GNAeyp6ONC@lists.infradead.org
X-Gm-Message-State: AFuF++nCY6LLACwiJ1xuRITDTLvRlr6XvW7mIR4sKgO70yUEJ7NVQfer
	kcfhyS9wEsVpZfF7P+kSwBHNmG7z/zuBMYTXEW7fY1XT9nzuTSBXUc9954A3dZaCc/x+eBK+yON
	aSMYUBjVijh73osQRhCbykx1LenaW0k+89MJIksmi
X-Received: by 2002:ac2:51d0:0:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5b6170da3f8mr87362e87.8.1788511566149; Fri, 04 Sep 2026
 01:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com> <20260826-arm64-52bit-va-v1-2-14ec98211363@fujitsu.com>
In-Reply-To: <20260826-arm64-52bit-va-v1-2-14ec98211363@fujitsu.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 4 Sep 2026 09:45:30 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyJpPd8HjaWBw0V6pHF9UR0w2UFmaKDe7U3O+Sj8wiyPg@mail.gmail.com>
X-Gm-Features: AcwNN1X26g8SofCUgL1E6IJkWpSM-nYwAAIsoW_5phvpJbgrH22ZIA1dnT_JA6o
Message-ID: <CA+EHjTyJpPd8HjaWBw0V6pHF9UR0w2UFmaKDe7U3O+Sj8wiyPg@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: arm64: Add 52-bit VA guest modes
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Takayuki Okamoto <tokamoto@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014613_378691_ABC5283C 
X-CRM114-Status: GOOD (  13.29  )
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

Hi Itaru,

On Tue, 25 Aug 2026 at 22:18, Itaru Kitayama <itaru.kitayama@fujitsu.com> wrote:
...
> diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
> index 9108e14a9b5b..bcdf670c9eb8 100644
> --- a/tools/testing/selftests/kvm/lib/arm64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
> @@ -46,7 +46,7 @@ static u64 pud_index(struct kvm_vm *vm, gva_t gva)
>         u64 mask = (1UL << (vm->page_shift - 3)) - 1;
>
>         TEST_ASSERT(vm->mmu.pgtable_levels >= 4,
> -                   "Mode %d does not have at least 4 page table levels",
> +                   "Mode %d does not have >= 4 page table levels",

Patch 1 added this string one commit earlier. Could it go in with the
final wording there?

...

> @@ -298,10 +304,14 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
>
>         /* Setup mode specific traits. */
>         switch (vm->mode) {
> +       case VM_MODE_P52V52_4K:
> +               vm->mmu.pgtable_levels = 5;
> +               break;

This is now the deepest mode, so page_fault_test.c's sizing is stale:

   * VM_MODE_P48V48_4K is the mode with most PT pages; let's use
   * twice that just in case.
  pt_size = 26 * guest_page_size;

The margin still covers it. Could pt_size come from vm->mmu.pgtable_levels?

Cheers,
/fuad


>         case VM_MODE_P52V48_4K:
>                 vm->mmu.pgtable_levels = 4;
>                 break;
>         case VM_MODE_P52V48_64K:
> +       case VM_MODE_P52V52_64K:
>                 vm->mmu.pgtable_levels = 3;
>                 break;
>         case VM_MODE_P48V48_4K:
> @@ -322,6 +332,7 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
>         case VM_MODE_P48V48_16K:
>         case VM_MODE_P40V48_16K:
>         case VM_MODE_P36V48_16K:
> +       case VM_MODE_P52V52_16K:
>                 vm->mmu.pgtable_levels = 4;
>                 break;
>         case VM_MODE_P47V47_16K:
>
> --
> 2.43.0
>

