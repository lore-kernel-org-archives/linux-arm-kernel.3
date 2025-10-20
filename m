Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDAACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 16:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U281t6YsVgadzh80Xr8uQlzQ8nsQRfoBdqQApEXayt4=; b=nlrO9PHk+XOW/Zl9u0objMayEr
	t8vag9TuLaJffJZY56rzcQ3Nj7gtB5ACyFJWltRhePgYWXCKNB4PDqkU9bcezEtdDCSAsO5H6Y7ZY
	jsm4pavihhJ5D7uE8pKWfpPkjyxcFVumE1RYUOz3yBDoPryaxYd8NVxVniVQNLrfuo/pz4p+CStLK
	kEWq8Rn2QT2LvbLbvSsDRNoU0htZPw9mTkhreU91zstD/5cIE/GtkeITxle7hdNSLnuRnuDBO8hgx
	5XqsAsr/nuIxA0EcHjUGyOLKyKTHBYpPxhzHine4935ggoMZoxEzVjT5lXYdc+NVvpxmoHVhY7JmU
	YmO+SXPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAspw-0000000EKZX-0fro;
	Mon, 20 Oct 2025 16:34:20 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAspt-0000000EKYI-2g8H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 16:34:18 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33c6140336eso6864392a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 09:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760978056; x=1761582856; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U281t6YsVgadzh80Xr8uQlzQ8nsQRfoBdqQApEXayt4=;
        b=nQuCaX5FOvkbOGq7ZXn3MUrPKwLzI6QmQcP6VkufqcbI+FfEDQbgy/WVmIHz15wSKf
         PIcfV+OPfL/8lZAZyhtb/vCeS97VDSYZBmXsrxCjrpZeiGyQMKAYd2M7bwJj/u+m4fbv
         bjw/0OxQUiWFBHne2oaA3JILc9ayDmhc8q1UCxTIWxF9ohNUU6OJAXqmOC3xz+efh7a1
         FiJgNjIKEmcvL2z8cqeqGjVBHbVQUiRKzu88viRWiz6gBzR8iqD0MgZGaIjyyJz00kzh
         /owJcvzhwJOl4eN2ZqCS1bsrlfAOytmiNcAwgyMx+6OzfnI/YUiP3MaZiTt2W5VxvSsh
         RmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760978056; x=1761582856;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U281t6YsVgadzh80Xr8uQlzQ8nsQRfoBdqQApEXayt4=;
        b=LsZLHWckH0EwpIXYLBaL/Vsm/xApbij2AoTUbOgGGFxfQXMfKn2gQb+NcxiORwipuz
         b7L0y5hesanph3oo6k9LGhkVckohjNlZs/dI0SvhD+Id/ei9Ok5UCqgHCAS4xTlghQse
         LeJ154xqsHkAWP2HRui/HkV//nRVHlAF0ujDqdueGsykIzHRKvN9JEkQjWlSx9NRxgwa
         l+510EB90kING6iFvZ560qXoqZiqdNJIqj9naJUdIJ5Ff+8RQQcOmVoFLwFOThooPZJD
         tadRbtO8DxfIE88zhVaOHUOLMxAYgrMo99TVqYI7/6d8z39sFNLOlmUopV1mc3479ouZ
         Ggpg==
X-Gm-Message-State: AOJu0Yw4p0w944VXZQXKMSJfeTacpISlf2ka6eoVBZZgzNu0XN2acIHq
	yVRSWfk0eUwqMp7/km/AlJr3RLUHLNYvLpeC9D9jmZ7hRl32q0izHHcaaSVOS7yWRhS0wXOs3oi
	1n1ADjw==
X-Google-Smtp-Source: AGHT+IH/2gIQckIGBvPLTgMI5nZTn9xen9JOJcaPgjLLw4FsDPxt8568zPXkGc37Szl9ifCv4T+uIb3eOmI=
X-Received: from pjoa3.prod.google.com ([2002:a17:90a:8c03:b0:32e:a549:83e3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a49:b0:330:82b1:ef76
 with SMTP id 98e67ed59e1d1-33bcf914d79mr18775090a91.28.1760978056031; Mon, 20
 Oct 2025 09:34:16 -0700 (PDT)
Date: Mon, 20 Oct 2025 09:33:05 -0700
In-Reply-To: <20251016172853.52451-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.869.ge66316f041-goog
Message-ID: <176097602114.439246.7705198528866990456.b4-ty@google.com>
Subject: Re: [PATCH v13 00/12] KVM: guest_memfd: Add NUMA mempolicy support
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Miguel Ojeda <ojeda@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_093417_679993_7A218442 
X-CRM114-Status: GOOD (  11.28  )
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

On Thu, 16 Oct 2025 10:28:41 -0700, Sean Christopherson wrote:
> Miguel, you got pulled in due to a one-line change to add a new iterator
> macros in .clang-format.
> 
> Shivank's series to add support for NUMA-aware memory placement in
> guest_memfd.  Based on kvm-x86/next.
> 
> Note, Ackerley pointed out that we should probably have testing for the
> cpuset_do_page_mem_spread() behavior.  I 100% agree, but I'm also a-ok
> merging without those tests.
> 
> [...]

Applied to kvm-x86 gmem, sans the .clang-format change.  Thanks!

[01/12] KVM: guest_memfd: Rename "struct kvm_gmem" to "struct gmem_file"
        https://github.com/kvm-x86/linux/commit/497b1dfbcacf
[02/12] KVM: guest_memfd: Add macro to iterate over gmem_files for a mapping/inode
        https://github.com/kvm-x86/linux/commit/392dd9d9488a
[03/12] KVM: guest_memfd: Use guest mem inodes instead of anonymous inodes
        https://github.com/kvm-x86/linux/commit/a63ca4236e67
[04/12] KVM: guest_memfd: Add slab-allocated inode cache
        https://github.com/kvm-x86/linux/commit/f609e89ae893
[05/12] KVM: guest_memfd: Enforce NUMA mempolicy using shared policy
        https://github.com/kvm-x86/linux/commit/ed1ffa810bd6
[06/12] KVM: selftests: Define wrappers for common syscalls to assert success
        https://github.com/kvm-x86/linux/commit/3223560c93eb
[07/12] KVM: selftests: Report stacktraces SIGBUS, SIGSEGV, SIGILL, and SIGFPE by default
        https://github.com/kvm-x86/linux/commit/29dc539d74ab
[08/12] KVM: selftests: Add additional equivalents to libnuma APIs in KVM's numaif.h
        https://github.com/kvm-x86/linux/commit/2189d78269c5
[09/12] KVM: selftests: Use proper uAPI headers to pick up mempolicy.h definitions
        https://github.com/kvm-x86/linux/commit/fe7baebb99de
[10/12] KVM: selftests: Add helpers to probe for NUMA support, and multi-node systems
        https://github.com/kvm-x86/linux/commit/e698e89b3ed1
[11/12] KVM: selftests: Add guest_memfd tests for mmap and NUMA policy support
        https://github.com/kvm-x86/linux/commit/38ccc50ac037
[12/12] KVM: guest_memfd: Add gmem_inode.flags field instead of using i_private
        https://github.com/kvm-x86/linux/commit/e66438bb81c4

--
https://github.com/kvm-x86/linux/tree/next

