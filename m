Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094C2C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rrd89OsQ/qKLyQdREPNPgMGcGQacoElL1Au38Xxqk8=; b=QqhyE1t3t/aayc7SyIbe4pd0LR
	IqWbH1fLPhjMQQH+RjUMDkVDplY1Dk44LKRLxvXkI9z3IrjNLGYD/1vKhR/q3EGJLSc13KgVuU503
	ji/GFS+UjcMS6Zz/f60D/riUr1csYxImq8xZ/8tOhOq1uwlx0YY4pjNPkZlhtZdR7tEE6NZZQGitJ
	eDNE2G+2ftRM8KL6AD74YShVBQhdchLOwvh9xx4ncVakqev9hD8xn5Nw9hEv2uox4kgh9MI36y8iB
	stZGE4TkeuowwueIrjzPGxtpJKK+4hFfKV4f1aJz8yHCNjjDKORrbbqq2BlAsUPoD0MunojQ8sPU2
	8b1yw8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IV1-00000007YlO-2dVm;
	Wed, 23 Sep 2026 08:38:43 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IUz-00000007Ykk-3oeA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:38:42 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6a642d690caso976298a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790152719; x=1790757519; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rrd89OsQ/qKLyQdREPNPgMGcGQacoElL1Au38Xxqk8=;
        b=U57MkoYTo9jnf7wj2OZnQybzI7QfdEh9I/0I6vU9cT+s2jspbItkc35jWfh2H9RL+n
         MxJKTunYoHkejurRD0WA/OUA5LcuNV/8pUT+ReoGKH4M3cHm+4Tb8a8Bra6BwGN766gu
         Mfs2GFpxluvfmVR+l1iN02SUfW8obPAyUbWLQuAqS0la/qk8oL7GbtuW8WyiFLvEGdrx
         gBGkVeA063zbuJQvXV8dkjYI13Zj/4WSyOh820mm6TnJppep92WTxvG6JTGWJXWxgYbu
         oSTZ7MSjsm6buSkPsSuvt7LMgtvsNloNHvhNZ+hRtQW9u6w0cFptWVS2wFNPx2Nems4G
         9gqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152719; x=1790757519;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rrd89OsQ/qKLyQdREPNPgMGcGQacoElL1Au38Xxqk8=;
        b=cxLJgKF4cGZB3t8XLaKImox6yjb4P+04qxu2V2nBaszCjdkJy5Jliolsxx8XzfaJ2G
         TR0B9BOG5AL9w6tmOSZerKBqnhUqqv4o+WbZ2SQkuyhWnXMxlEYiGYKfKaBhkr8tSNuU
         +M3/CZUqpn3e4LdpTWWbgai7jrHZQd29k26XYFvZXfBrs0ogu100NKcCBCgbwdHV9ciY
         BWmK+L4Vs8DZGJf/6R+QSA7No6ZXu6Aq61AFesnCXf7FXgwr60Zt3WDAYOIihewzMBJK
         a62U1hGkf6Dqsp1wvu2f9inu97oAybXKIHugzOo9JOwYEo8ASfA1pm13RvOogwtvqag0
         gbHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcdCfexZ/+UtsPxJyKAYhrQkWelXTPadU/UAGrRT93CKNDsMHjaeM7cRMbJf0zAEYdOvvNn1zyw1acsEDZ4dwL@lists.infradead.org
X-Gm-Message-State: AFuF++mVTbHJjWFkNiji5BH9SP0bw6cow6jAmiMnjFWFaVqlWsiX1mmE
	u9p2zr5u4tvV4u9W2zeVJBc8/SY9fVbPS/nlMZuIy4dWdX/Q9FRpMZuipl4WfsYyUVbxsjvHoTn
	Z1XHVk+/j8tlwjfFsqnqtyJZ/cA==
X-Received: from edxs16.prod.google.com ([2002:a05:6402:1650:b0:6aa:12fd:fc3b])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:23c7:b0:6aa:9fd4:987a with SMTP id 4fb4d7f45d1cf-6aab3b985dcmr1498844a12.20.1790152719283;
 Wed, 23 Sep 2026 01:38:39 -0700 (PDT)
Date: Wed, 23 Sep 2026 08:38:37 +0000
In-Reply-To: <20260922-chubby-cicada-of-exercise-bbb429@sudeepholla>
Mime-Version: 1.0
References: <20260922-chubby-cicada-of-exercise-bbb429@sudeepholla>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260923083837.4133676-1-snehalreddy@google.com>
Subject: Re: [PATCH 1/2] firmware: arm_ffa: Add FFA_FN64_MEM_RECLAIM2 function ID
From: Snehal Koukuntla <snehalreddy@google.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Snehal Koukuntla <snehalreddy@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_013841_955377_D6205E53 
X-CRM114-Status: GOOD (  13.09  )
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

Hi Sudeep,

On Tue, Sep 22, 2026 at 01:15:52PM +0100, Sudeep Holla wrote:
> On Mon, Sep 21, 2026 at 04:47:47PM +0000, Snehal Koukuntla wrote:
> > FF-A v1.3 ALP5 (DEN0140 rev J) introduces the optional FFA_MEM_RECLAIM2
> > (0xC4000091) ABI, which enables an Owner to reclaim exclusive access to
> > a subset of pages of a memory region without requiring the Relayer to
> > maintain intermediate transaction state.
> > 
> > Add the FFA_FN64_MEM_RECLAIM2 function ID definition to arm_ffa.h.
> > 
> 
> Since the spec is still at ALPHA, I suggest to add RFC in the subject
> if you post newer version so that it is *NOT* considered for merging
> until spec reaches *BETA*.

Makes sense, I will mark v2 with [RFC PATCH v2] in the subject.

Thanks,
Snehal

