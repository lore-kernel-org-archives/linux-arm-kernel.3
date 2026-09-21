Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D460FC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyNDJX3fIEdqZwMfzP/6YwVAKyII5CaZgMpV7trI7WI=; b=bThdf5x36u82/F59uM3JbopZfk
	1kSc7PhXwb+KdPLPRbAJh8zwMZ7bRzJvEFSW4r1zI/8z1d6FiwI2mDbpO7vV+RcWrvAVMaC0WvS80
	UIJYjjinrNXnv6Qj9PvjguYyZLhg96aC/b3+Hb1B+tLFnqR5K6ZqXKSamP7MFbM+N1GgvicmxiuEg
	deXkiFmQrYPOki/Lq3bOO346ZWNKEneRk97D/WR1xynAI5a03V/d8RVCLuy4A+1dTKIciOx+xCfUa
	hJXN2wqhuuRUQK9J7yB255dUausgW7HfcqMoZ1tffXGyxCZppvOSaUOlzuIlQ7PXQEERsBtGulG8m
	OEwMCAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8egD-00000002LJw-2TLj;
	Mon, 21 Sep 2026 14:07:37 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eg8-00000002LI5-2XVf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:07:33 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-8623e5d4279so5457666b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 07:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999649; x=1790604449; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyNDJX3fIEdqZwMfzP/6YwVAKyII5CaZgMpV7trI7WI=;
        b=nYzxTPHOGMXjYMCcGArf17LaaFvTAmbeeY02vLp7idND0xFVZFUspZkl1TNU9amWIM
         m5BjJxE8tosY3iWB0zPEc6IEIH9W0PLRUIrH9usT2c2vyL8OQYui5urVjTH5/g8c6sc9
         0TSDpQ+fof6jya48EWIzG71g3E20Y0NQaOiHXYEsmRFTrN+GiSP6cnfKrnXH7MfxT/CH
         WvRwqdt3uz7At9VyBV6pPNQDXw+z/oCwtLpvjmI3VeYd7wxuPEs/LHGkpF3+Bofxc6Bz
         5YbwG36lNtzCh47+XmsIO3ZynVUb6V1CFd3J3ZrpYBGIlxjfZ4N+wqbqc9880XjeB5aG
         0LEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999649; x=1790604449;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyNDJX3fIEdqZwMfzP/6YwVAKyII5CaZgMpV7trI7WI=;
        b=iXHBtNGwq/+ilk9XN20XtzC3eJfHniJmBKcTbazJqJt9nLpsC3wbDhJpsWjhX0mlKV
         8cRvyUlNqCbwscC6xKGfs/BJmozDvaGreQl/Qj9VzJgVKowWEFHv/Ib3Eq6q2MJtxS3K
         jhNloDr+CkOQY9rfqAdhrwrDZTE4S6guy+xEiIxSeB09/5UJ2Avf3psQ6k1GzhSvLckw
         GV5cq3dXBOjTNXEX7V6IgeJ2ea0Zk4jjmSfVlQ7kjzpegPRL8bH0AMJ9KcoiFpAOUZBZ
         c1a8ZNrjf+dhku4i9LjnprfgCac/X7GSWO1h5D+ockUSOg/JR2X8LBxgxxClKBcRxgdw
         XpAA==
X-Forwarded-Encrypted: i=1; AKwUvBzd6TYw1u/PoWAd1OPfzBcDw2ug8GDB6Y/p0HM33wgqz4jiGXCbSEGCvFqpOmmHVMT78yLYDbttOhe1QXb38KEf@lists.infradead.org
X-Gm-Message-State: AFuF++kbQLMqz0xrcbnN0KIFNPb12tCfpIGldJoh8JCLlUo7VS0UGbsA
	DIiAaMfmzQs1aZeqDMB6roSNXLJUM3NBuNUA3HXO5zXQUkgiTFjJ/UXOWctDDHIpSH+A2GCT+Lf
	0j8TGsA==
X-Received: from pfw9.prod.google.com ([2002:a05:6a00:a269:b0:87b:6530:9518])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1c8b:b0:878:34d7:6977
 with SMTP id d2e1a72fcca58-87834d76c96mr7399999b3a.37.1789999648656; Mon, 21
 Sep 2026 07:07:28 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:34 -0700
In-Reply-To: <20260803170825.925561-4-hisamshar@gmail.com>
Mime-Version: 1.0
References: <20260803170825.925561-4-hisamshar@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999928264.755166.909574492736686331.b4-ty@google.com>
Subject: Re: [PATCH v2] KVM: selftests: Replace ulong with unsigned long
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, 
	Hisam Mehboob <hisamshar@gmail.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	shuah@kernel.org, aqibaf@amazon.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_070732_684489_A7DBC527 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
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

On Mon, 03 Aug 2026 22:08:28 +0500, Hisam Mehboob wrote:
> KVM selftests use the non-standard ulong alias in several files. glibc
> exposes the alias transitively through its headers, whereas musl does not,
> causing musl builds to fail with ulong undeclared.
> 
> Use unsigned long directly instead of depending on a libc-specific typedef.
> This also avoids adding a duplicate typedef to a shared tools header.
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: Replace ulong with unsigned long
      https://github.com/kvm-x86/linux/commit/5be2d20f9818

--
https://github.com/kvm-x86/linux/tree/next

