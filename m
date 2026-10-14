Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C868BC3DA7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 16:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+0bbYBp5vS6Wzy92SxhIlT3F+PvYBDU5sICwVgEKDw=; b=oLCCnR+0Ht0wm4O5G+lL1/RrXC
	4pzPpFnMGRkC234JNkEaYd07KMZyzdvpK5FKTNGPP8bCNdJDCv68Hzj3GSHOfK7S2it8Ouvc8jCgt
	rwdIxIXiXpl8KV5yjMleBnchw8gPFrc0/wOaKP9Nnzv4pUcsQ267/jKqdzzn9Y+RkbC5iTE3j7IWk
	/fEqcm1A3DvKWYoquui6R4YHCxFHk5xPqTXCNmFsf8SVicBF5msf4tbF+C+0L3yYT+LIx8hijofUU
	dZ/KrU8kPy897zGA4rmpzuPDYvCZ668UKOVMmEltSx8VS5ca8Rhn7u6M3vlBaM7Nsb9Sg+otEfG6+
	iv+3j/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1sl-0000000Fyiu-2o4V;
	Wed, 14 Oct 2026 16:31:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1sj-0000000Fyi6-3JPx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 16:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791995468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+0bbYBp5vS6Wzy92SxhIlT3F+PvYBDU5sICwVgEKDw=;
	b=OtEdRiEM/q3OoCkRiLtmYcXFc/3q4v/Cv0KwuqdgpIu0gJFdOmofg41YqQYHJ56AY+vDHu
	kPbulanFmQ+4AE4/UAMi8djtmRPTG/0N2Bjy7y3mrC4vJsnGP7p02YMlIKOQtivKB6lpQ8
	tfCtyCTaaQFweVntt9bpnmXHu3WfnX0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-Fe3u1gKCOKi3N_FoI0dS3g-1; Wed, 14 Oct 2026 16:31:07 +0000
X-MC-Unique: Fe3u1gKCOKi3N_FoI0dS3g-1
X-Mimecast-MFC-AGG-ID: Fe3u1gKCOKi3N_FoI0dS3g_1791995466
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-486f9d150c3so2698980f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 09:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995466; x=1792600266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+0bbYBp5vS6Wzy92SxhIlT3F+PvYBDU5sICwVgEKDw=;
        b=mu+q6Gb9YSMchgydGwCSU9gZQZKfoGyR+2G0vGWIB91C6fRDBnotMENW2jW8AdS8FJ
         Pu/C0jr2ycux0p6c2SI41Kg9eRpZJOjlvPKWbJHTZTVf8ud01XHNy7pqTnLq8T0RNXTp
         xav2KhqZDuKVU0igKWO4H7MKczbmB0PD/eNXC06OH1ORVLmIjJnRB81E7pn6PWrupGeb
         Q5rkT3uQIw3X4BgYXe1EGxJ5dzEzXMV9oV1AZYaEAk4DdNARaGhYWZYxchWgdbGvIa5q
         sIxEieoRj4TblmC0wFwPcxQOMFBFpXcK25Got5Zr9eu//svx8ZgtA4lRyAYrNkP5Gcgp
         9MIg==
X-Forwarded-Encrypted: i=1; AKwUvBxJimiB2fkoa+YDT2sva0aZTnku5RXTkKDXUeHqvIk8ombnZZ+vn0QxnabaT8NU8AlrbOfZRKTk/TeVNxTFndgP@lists.infradead.org
X-Gm-Message-State: AFq9FYKVYkt7u+6Ny/3x0gg1Cq2MiPRouggAMClNIJ5ETXsaQf0sVMvc
	zCbCspk8U5zBeIDcfL7sUxt2emw/ontZ126dOqzqMNmz9aosY+35gb+OItwdQyOMkcC/quTraeG
	/FJFDW40emfKb7sAp1d8FftVpXlED8JRghr4s+hw2sTdYAwHn1ZgZyvIzFFprKD2XrjatiRijkt
	ei5LEp1fNsegij4wEQ5qOaOpChTqnF0kSvy2EWyOeztEyKDOvwNiE=
X-Gm-Gg: AYBFou0+cVPwhNVtcjTlt5KQc4Evbji6hBCEJDg1mZ6yqHQcZ8q1ZcwRWFg86Wuy8TD
	QRdrNvVGzqCA+Z9ZtM86wJ22evQPUKofq/kntaINNYYA7oWgSnuWReMzzDt701ueKHJxzsockKr
	wwQ6xV17a30Xz0zqgAq6vS+aH2HGtFoICokm9HKBYJfV846oXfTSCnxap4Q/s7Y/BnjYnTEsNzs
	sH8tHxoQs1AgUJWWcuEV/Ij27bIpHzZ/TnwHbjBBnohcxdCjMulawP8x/T6og==
X-Received: by 2002:a05:600c:34c4:b0:4a1:b027:99dc with SMTP id 5b1f17b1804b1-4a1b027a161mr98309005e9.18.1791995466264;
        Wed, 14 Oct 2026 09:31:06 -0700 (PDT)
X-Received: by 2002:a05:600c:34c4:b0:4a1:b027:99dc with SMTP id
 5b1f17b1804b1-4a1b027a161mr98308215e9.18.1791995465797; Wed, 14 Oct 2026
 09:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20261014162126.964330-1-maz@kernel.org>
In-Reply-To: <20261014162126.964330-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 14 Oct 2026 18:30:50 +0200
X-Gm-Features: AclHuK-uduyx1V7w8xPq5hTQncfjGaYTAtLpmbc_jG8-KYLjkOQH5FYBRTis6z4
Message-ID: <CABgObfYVHtFGopM=vCY2vt2N-CON=_5BN4YFiZknwvyrgP5mfw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 updates for Linux 7.4
To: Marc Zyngier <maz@kernel.org>
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Colton Lewis <coltonlewis@google.com>, Eric Auger <eauger@redhat.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Gautam Menghani <gautam@linux.ibm.com>, 
	Gavin Shan <gshan@redhat.com>, Gokul K <gokul02k@gmail.com>, 
	Hemanth Selam <hemanth.selam@gmail.com>, Hiroyuki Katsura <hk590@cam.ac.uk>, 
	Itaru Kitayama <itaru.kitayama@fujitsu.com>, Jack Thomson <jackabt@amazon.com>, 
	Jiaqi Yan <jiaqiyan@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Jonathan Davies <jonathan.davies@nutanix.com>, Karl Mehltretter <kmehltretter@gmail.com>, 
	Leonardo Bras <leo.bras@arm.com>, Like Xu <likexu@tencent.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Nina Schoetterl-Glausch <nsg@linux.ibm.com>, Oliver Upton <oupton@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Sebastian Ott <sebott@redhat.com>, Shen Yongchao <grayhat@foxmail.com>, 
	Shuai Xue <xueshuai@linux.alibaba.com>, Stefan Teodorescu <fane@google.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Steven Price <steven.price@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tharit Tangkijwanichakul <tharitt97@gmail.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Wang Han <wanghan@linux.alibaba.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Will Deacon <will@kernel.org>, Yuan Yao <yaoyuan@linux.alibaba.com>, 
	Zenghui Yu <zenghui.yu@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: US2wPyiLQUYcfeFI-yODkZ_ifNwUOkmgRwNYZCne7d0_1791995466
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_093109_926433_9DDCAA28 
X-CRM114-Status: GOOD (  22.43  )
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

On Wed, Oct 14, 2026 at 6:21=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Paolo,
>
> Here's the set of KVM/arm64 updates for 7.4. After a couple of
> releases mostly focused on mopping the AI wave, we're back to merging
> new code, and there is a lot of it. Given the size and the conflicts
> that this generates (see below), I've decided to send the pull request
> early.
>
> Details are as usual in the tag below, but there is a few things to
> call out:
>
> - a lot of pKVM updates, finally delivering on the isolation promises,
>   thanks to Fuad's work on upstreaming this stuff.
>
> - the first stab at sharing code with s390... More fun to come, but
>   that's a start
>
> - More GICv5 code. As always with the GIC, it is huge... But for once,
>   the code is much simpler than the previous iterations, and also
>   comes with a bunch of selftests from the beginning.
>
> As a consequence, the diffstat is a gold-plated pig.
>
> Things to note:
>
> - this drags the kvmarm-fixes-7.3-1 tag as a way to resolve bad
>   conflicts with some of the patches
>
> - there is some additional conflicts with 7.3-rc6, due to
>   kvmarm-fixes-7.3-2 landing a bit late. I have stashed a resolution
>   here [1], which you can either apply if you're basing the merge on
>   -rc6, or mention to Linus as you send your own PR. For everybody to
>   enjoy, I also add the resolution at the end of this email.

I've done the unspeakable and pulled kvmarm-fixes-7.3-2 into kvm/next
so that this PR will go on top; that conflict is too much to send to
Linus. Please check in kvm/queue that I copied your resolution
correctly. As soon as you confirm I'll move it to kvm/next.

Paolo


