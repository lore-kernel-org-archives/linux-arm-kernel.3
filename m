Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F22C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Le0s8/2F+FAJIzsNiZCH8PIfDcVh8VyqlX3j1Mgzv7g=; b=sRGvJsndjzNICp+cev1Lv8GieE
	yONbWD8Y9zFISw57SpB9Qn7Owrgv3reSND1xdzp7Jmch3xly1MlTpKH8UkGvHrTMaPgVoTcrHjYRT
	k3J+mGbdTq97f9eGVYmIq8/Yya7NHBJbiGkbm9VgqawCnzAEJ+6gyFjmbSG8Ze0RtVg1ocrwWrVZX
	BBDXiVQnNcioUUh/WZgb2gjncbPUSuGB1de7KJiIY7Jt/9DqnyJ2c/hxyocCk5TWsBzTuqlrvyOaa
	3shprGB80bmmNDxxkXoHhqLa/f6TF8YxWqheiU5/0R8r4r/YhwuDS5Wcmc1r92IdywUjsqnRaacNn
	oXgBi/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vub-000000099eI-26pi;
	Tue, 08 Sep 2026 13:30:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vua-000000099eA-09Rx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Le0s8/2F+FAJIzsNiZCH8PIfDcVh8VyqlX3j1Mgzv7g=; b=pm9RGcRhjEBwutZDD3FZb+0QXU
	UP+75+swhOooa57g9J7LkdcEbqdaP1lU7iz1O/Cb43gITzaSI0HfFOZCA3gpUuqVAt5RTTJ7OTB+J
	uFviflrX9BlfXA3TS/f6D8CjweUBQAov/iypq0oG7Xzo3MG82GtnlWXLzFccP3IRtuECAeyIopu7e
	GwiQuPwhoijr18J88pSe1YKh8bMP8qV+I6bFmLC+A3vZxH35vr5CLiLBhpHj7EzFKhkm7zk0NkuoK
	bnYlA/5pTo07o45zjkkrr+TIz3UjUbFJvixqPoX7ZW60IIseV/TLNst+Btip2yN8FbKYy8jUef8Vd
	L9lCKDDg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3vuW-0000000HTG9-3vHr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:30:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FA301476;
	Tue,  8 Sep 2026 06:30:46 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6943D3F7B4;
	Tue,  8 Sep 2026 06:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788874250; bh=FxlANSqLJch9ogY8r6MxlelWgMUH7qzZHSmD70GaCso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lyG7t7rEGrKJcY9HdIQobQqmfLmq4ib8+qD0XWx8DKRxyZ01Xa2tPfvU9Uzq/BAzP
	 YWcpzlkshGxMwBTwJnLPiunzu/UxKSecYAUBK12IFiR4CP6d5ZFvX4dW750axagK2Q
	 1GvLjM0g1GSPKJfjLquP5rBvTnqo9oDXxh2G7CK8=
Date: Tue, 8 Sep 2026 14:30:40 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix the KVM_ARM_PREFERRED_TARGET
 documentation
Message-ID: <ea5gctsvi2j77avgo7r4esll33zwlscddlmu5obakmyxguvdpe@qaykd5afjamb>
References: <20260831162815.269851-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831162815.269851-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_143053_342298_9BA6FE6B 
X-CRM114-Status: GOOD (  21.56  )
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

On Mon, Aug 31, 2026 at 05:28:15PM +0100, Fuad Tabba wrote:
> KVM_ARM_PREFERRED_TARGET has never set a feature bit: the original arm64
> implementation zeroed the bitmap, and kvm_vcpu_preferred_target(), which
> only ever zeroed it, was removed by commit 5346f7e13e5e ("KVM: arm64:
> Always return generic v8 as the preferred target"). The ENODEV error had
> gone earlier still, with commit 08e873cb70f3 ("KVM: arm64: Change the
> return type of kvm_vcpu_preferred_target()"). Document what it returns,
> that userspace selects vCPU features itself, and drop the error.
> 
> No functional change intended.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Wei-Lin Chang <weilin.chang@arm.com>

> ---
>  Documentation/virt/kvm/api.rst | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index e0430cc750c9e..193f3b0ec77d1 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -3600,20 +3600,14 @@ Possible features:
>  :Parameters: struct kvm_vcpu_init (out)
>  :Returns: 0 on success; -1 on error
>  
> -Errors:
> -
> -  ======     ==========================================
> -  ENODEV     no preferred target available for the host
> -  ======     ==========================================
> -
>  This queries KVM for preferred CPU target type which can be emulated
>  by KVM on underlying host.
>  
> -The ioctl returns struct kvm_vcpu_init instance containing information
> -about preferred CPU target type and recommended features for it.  The
> -kvm_vcpu_init->features bitmap returned will have feature bits set if
> -the preferred target recommends setting these features, but this is
> -not mandatory.
> +The ioctl returns a struct kvm_vcpu_init instance containing the
> +preferred CPU target type. The kvm_vcpu_init->features bitmap is
> +returned empty: userspace selects the vCPU features itself, and their
> +availability is reported by the capabilities listed under
> +KVM_ARM_VCPU_INIT.
>  
>  The information returned by this ioctl can be used to prepare an instance
>  of struct kvm_vcpu_init for KVM_ARM_VCPU_INIT ioctl which will result in
> 
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> -- 
> 2.39.5
> 

