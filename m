Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC656CCF2DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdQ/3IzDpxWKftV/qYr7+DV/cqjN/ThlNSDqwOiouKk=; b=tjP4fvakx49I4/Yp4ziVskSur9
	sXJuy3iwuuKyURi0YUkpsxq5B016sw08oPoYUK3IDp77dRdkKydBO2G0zZUTc5l+rGII02GReXxfU
	nTa8zOeaTideldzMWd4BgONwHFvLguXTUUhDoB0tCf98uyq1YwVZT/Ufb+1n1yOLYjtuB9fjEJTK1
	3rtWTSmWz/7ropKYAWa6XAZG5HTVpjAtg2PRc+m7/Ppf8vMv9LQZexRtFBS3OoIDrIUjD2poMyJXW
	R8kPdHLoWv8tm0QZ6mzMnwom22x39kzpbWQ66ESZ3FcctMAzcXVSdp5c3VaNJcjz6aEalhuw9Lx1Z
	sSPbCwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkQp-000000079ly-0bkH;
	Mon, 19 Oct 2026 10:17:27 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkQm-000000079l0-1ssZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 10:17:26 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=KdQ/3IzDpxWKftV/qYr7+DV/cqjN/ThlNSDqwOiouKk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792405041; v=1; x=1793009841;
 b=h6FOlTZHiRf4X4F+QhS3lie/5sJPWRb6/YngxL+UrunF3BzSgasNSUMfvpvVebWKV/40X2ks
 Zr40dOR3kPjESkv3kgDJ7SueGvvzymV2seUKRlsUp5SvqM0f7Az3c9ssVBQWvkOxjqVHxP4O+At
 cCzrVWfqy2CqKUTTPRklcL2w=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a9d6399592e6dabb;
	Mon, 19 Oct 2026 10:17:21 +0000
X-Mizu-Trace-ID: a9d6399592e6dabb
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8818e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 03:17:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw/qssRnIolYFHZre3AoCwQX2zZVNwbT/gu1d7AMyCHq252FWVtZRg4w/1e6WIyf3wwxnjH84s7aLEkFxgcEqnD@lists.infradead.org
X-Gm-Message-State: AFq9FYI4L3rQynht1cMO0Jk/580GJ8E8LzndBxyyG0tRJGu7ShWq2VyB
	1Jr56h+zqB9/1P5j5V2wnvmofR5jljMxYcz55Q/HTU5mzDmSg6cA7hz4S8XnEw2Q1nZiMZexwwB
	blfOKvC9pDlSVz1er4F0JCQ9Bsvd90BUWx5rej805
X-Received: by 2002:a05:6512:138a:b0:5bc:fbf6:2352 with SMTP id
 2adb3069b0e04-5be50d346f3mr193361e87.9.1792405036691; Mon, 19 Oct 2026
 03:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20261019094258.1582756-1-vdonnefort@google.com>
In-Reply-To: <20261019094258.1582756-1-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 19 Oct 2026 11:16:40 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwMTV2-1qmHUbbnUQk54ig0kVaEAPZ8L4rz3Gg4ADH5yg@mail.gmail.com>
X-Gm-Features: AclHuK_G42tgIMfzYh22d9IE2leJ-o_hibjpBEstZjEbaxYU5LOvkaF0YazawcQ
Message-ID: <CA+EHjTwMTV2-1qmHUbbnUQk54ig0kVaEAPZ8L4rz3Gg4ADH5yg@mail.gmail.com>
Subject: Re: [PATCH v1] KVM: arm64: Move pkvm_selftests() after all CPUs have
 initialized EL2
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_031724_776539_55624307 
X-CRM114-Status: GOOD (  11.17  )
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

On Mon, 19 Oct 2026 at 10:43, 'Vincent Donnefort' via kernel-team
<kernel-team@android.com> wrote:
>
> init_subsystems() installs the hyp vector on all CPUs. By running
> pkvm_selftests() in init_hyp_mode(), there's a risk for a migration to a
> CPU where the hyp stub is still in place which would fail to run one of
> the HVCs necessary for the selftest.
>
> While init_subsystems() is the earliest we can call pkvm_selftests(),
> move it to finalize_pkvm() to avoid having to export the selftest
> function out of pkvm.c.
>
> Fixes: bd93068340e9 ("KVM: arm64: Add selftests for the pKVM heap allocator")
> Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

