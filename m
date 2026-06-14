Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C71CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLah7fYtiuLTEFemTA3gEAagpPzLuYOeSVTlCpqkCOc=; b=DEKWZDm9IzT+sL+ECk/lrqoMzd
	6pGghlWUppzvt9IpS7S6Y2l9zfGFMAxt0kQyPXlf8emAGbVu2plExJjpaKIuZBkK/tITpgzIgh8YY
	ky2f6Zp2JRbv65kGz3NGK3FEa567gO4GphVrWqUKA2eckz3ojPxCCG9g8LyS1mkUGRh967nGD7W0b
	ytYKeB9pGjLcol0w8RxH6AkIfDZoS7JP+QSvX61c7QbTtMgs1eW1G3sRf1TpHRMRJbZqJfE8zMUJL
	y58ukfh/KkiQZgQwr7A3AjYFUTm+n9a2qtPyfO84PKeInm/6cm9FpY415fq7N3Pab6dUiegiINGVr
	bkj+GJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYl6i-0000000D3Hc-1fOd;
	Sun, 14 Jun 2026 13:42:36 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYl6f-0000000D3HF-3FRf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 13:42:34 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-5177d1ff061so518601cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 06:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781444552; cv=none;
        d=google.com; s=arc-20240605;
        b=bQSrF6WwBfICao3B/wJeM1iDVW9S7lfyCqJnnzWSrj79BXB4Z58mXt+D13rRUA5blV
         SuwnCYl2L5hRPCBxNPs85mkuT5vT2ISePFWHGVXkG7zrv5CiN/cQc5kPdaxlpf0qnFht
         ++my6GuT5pbiwqGctnRkYTB0tS1Tcv3eavyHpKLGiowGpF0Lwus/wdOkubJh6QI5Nm/3
         jhUSeug8aTgUURknksHvliLWZ3Pzy8nTKwzBAkYatZLQZxKk/yHlYyPzUHKyXCRNOBeb
         bTClVIsMJx/+UK2WrcuZS1crJa9v+DSObvuqWUYA7DxrGwGijIB8Y+QFOG9qDXxdzmXK
         fccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JLah7fYtiuLTEFemTA3gEAagpPzLuYOeSVTlCpqkCOc=;
        fh=KJ0Uwa5/2s5rGqTuZHKyQ1YWk0jaSyoLXxDJdsTtU4s=;
        b=bgYvRVJJ7darmeCG16UEk3AuvZt1T/fyrHT2N+cGbBOBaasx1qQZCGrwZoorPvc3lz
         27pvT/XcospDn3AmRd9Txj5d789F6ptXyek8IkyHe5CbxW2l6GXjFxMzQ1jmRO/9MrqX
         gXwEY0WekAPtDFzbAn6No9fKIpdE98DTm21Ug3+qojBOSlybYbKLa0MQAz0yANOz1iYo
         ogzmhAu/+Y/NW6XdOHVvx1zuYfTyCu5vvKqc+WfUhAR5TxUv8NG0Z2panvQub2Qflhj6
         ejA5EC8vyxLicu4rUP4ocfWVtolYb/bt2tP2l0n9MGyB2vVNttr+fTgt82BrgrykhZct
         CDYA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781444552; x=1782049352; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JLah7fYtiuLTEFemTA3gEAagpPzLuYOeSVTlCpqkCOc=;
        b=EuE9J+3/iPR/kXW0R71Ma3Ti/r9/BdKY8C4c9M9/kfxFF4cTuLXGBlKkEJ6Jptttq4
         YhVNUJgqVFC8N+U3LZjMsxV4WGMe+R96uOPe+Aoochy9VNZTClt/ffG1j7oSaKboQysH
         rSSl8vAWJvz/sgr7XAVcbWELqmjNvrPZesxOSEaZZtCu+HS68SH6USbsffYxcv/dptDN
         tXEfxvfedh6/p2/T5t8xmCUTnHcf6fYVL5zDPEJ2lHxtwRO4SppxhJLG55W3RK0GsREI
         yPsycnD/FmfndwLFC0cnXxkH8lZM1Xp0vxltQVdmja0xWlzDiJ/BcM6MG5XElt40z8jA
         TcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781444552; x=1782049352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLah7fYtiuLTEFemTA3gEAagpPzLuYOeSVTlCpqkCOc=;
        b=R9ukQ+ds2O3gyMm4kfKosF17aj3Jd4XeP/D/WrV34GXRl4BYh2oMRd4O0vX67HkAnj
         8SDkxgyjPsL9SBA10tG40EzGctAl2v94CjJ+iWzcGwgdSc8lHzBGoPbCFFz/XWlBQr9t
         fw6SCpL2vKxNVHirzO0P2Rd/MpsqaH5PSJP4nPWQZji07bJbHfnVNvwdHJPjQmPlyHvg
         3kES/aeHYJ2EdGEMRQW6xD4Lr8sWg6f3TdByAjHEnTXqv+JM7uF9RCQfT/gCsaoainST
         kpdoUWyRYDAgNlT8UY+Y8FN28iCJgxIKjJNK6ti7qs0G8Vgs+h7xeH71PZce/Acl1y5j
         YY0A==
X-Forwarded-Encrypted: i=1; AFNElJ/LanvmAHNT8SD5hFyTWRPQdLl5/5tP0WpXjAJoViwPg4AWSQu4FqOQOca5JwHctPYko2FaLaU4snWRjmBNjC7L@lists.infradead.org
X-Gm-Message-State: AOJu0YxpOEFnpNC7FX/pDrZRyiuxCd1b+nUCo7A3rOZZsNhBNn6Ps5P9
	9fl8TewtJODqYqCxyRZztz1TcDRVJ78uXnIVQWnOrCebPZX/QqbeIm3sMHFHZQQFLHngLHyNoEu
	ymZ1YoyBb6pZ3fO+z/MyNLi+8cYhpabmLvYa5Rzwz
X-Gm-Gg: Acq92OHMHdVBMN+Lgb9PWycBhnHm3oMub4/IznWgBRYJdtjsxmhPFfzeSmba6dcMuFz
	rlKQkTDd8EIpH8hnP+Jwr1PGZlC4YA1pAWmCkQbA9yIoHIXIGPDHAo4aUoAAWbS+AAMSWZfK8JB
	6/Vik5hMpX3iZduf91SfrWllPR6hVGCFhEMlZzDYW0yyBc6tnhdm27D6vER+RwE7sC0cgOKfRuj
	eurDlV191OITB4X3BtfMirBPKAqz5SATBjbiiOcecioKGrD5PdpIjb6V1y5Kc9oeu2x2Y5RIl7B
	VvqaDkNY
X-Received: by 2002:a05:622a:6090:b0:517:5ac7:332e with SMTP id
 d75a77b69052e-519549b32a9mr10811971cf.6.1781444552000; Sun, 14 Jun 2026
 06:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260612142245.1015744-1-vdonnefort@google.com> <20260612142245.1015744-3-vdonnefort@google.com>
In-Reply-To: <20260612142245.1015744-3-vdonnefort@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 14 Jun 2026 14:41:55 +0100
X-Gm-Features: AVVi8Ce55XY55qGAc1MY-9DTVQT1ODXvHLyZg22-O5uoTZdWRAfvKU2_oGA58AA
Message-ID: <CA+EHjTxSRYnR8wAaaCd=b3KBeTp6reLuKxQKg9XQVdwU+7+1gQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, rostedt@goodmis.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kernel-team@android.com, qerret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_064233_838399_23CA6AF4 
X-CRM114-Status: GOOD (  13.35  )
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

Hi Vincent,

On Fri, 12 Jun 2026 at 15:22, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> kvm_define_hypevents.h is used to define the kernel-side structures for
> hypervisor events. It doesn't need to be used anywhere else than in
> hyp_trace.c.
>
> Move it to arch/arm64/kvm/

nit: rename and move

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> diff --git a/arch/arm64/include/asm/kvm_define_hypevents.h b/arch/arm64/kvm/define_hypevents.h
> similarity index 100%
> rename from arch/arm64/include/asm/kvm_define_hypevents.h
> rename to arch/arm64/kvm/define_hypevents.h
> diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> index c4b3ee552131..821bc93ecdd1 100644
> --- a/arch/arm64/kvm/hyp_trace.c
> +++ b/arch/arm64/kvm/hyp_trace.c
> @@ -391,7 +391,7 @@ static struct trace_remote_callbacks trace_remote_callbacks = {
>
>  static const char *__hyp_enter_exit_reason_str(u8 reason);
>
> -#include <asm/kvm_define_hypevents.h>
> +#include "define_hypevents.h"
>
>  static const char *__hyp_enter_exit_reason_str(u8 reason)
>  {
> --
> 2.54.0.1136.gdb2ca164c4-goog
>

