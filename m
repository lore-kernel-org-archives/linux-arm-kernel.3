Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD20CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 04:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5kr1L00wvOVr25j3yOIqLleOM/mW0MLWBZeaiqgZ8Wk=; b=FI8DM5V8hwIEiLmX32nW69QGOK
	nqCyXx0Al1XFnQ/sJFB7xQ/W5dnEN9nuDDG+4+DwHXmZGmhG4h4I/DGN30UjwVogAIrcLlwtLqU2C
	Y9gz9bCoo8sOwngADZa0/OqcHiKqUNoLmyeQmWJEkjlHQWMIzXs/mLRWQfKRiDO+OcmexOv0Eis0K
	UGx+MzWg1u44+Mcww8pyfAA8H+8Tw9eQ0TjOVj4RxI/9ucdai5Lp46uTO7Bv2G/q32QcY7sG6A/p4
	aUdQd3k/hj6PVALDXbUOC3rPtX7122h69Ebu0JY9FQTmHEx08KbpRVyOrMzB/3Ye1IHvJrFn2UGlY
	/jfklxkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6M3Z-00000003BjM-3EMP;
	Wed, 08 Oct 2025 04:45:41 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6M3X-00000003Bid-2TIz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 04:45:40 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-78115430134so4313532b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 21:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759898738; x=1760503538; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5kr1L00wvOVr25j3yOIqLleOM/mW0MLWBZeaiqgZ8Wk=;
        b=nKk4hFdx83RK1fmuayd8ifMVQq6Pk9zvCpxemtQNA89JJrqmm78KtWr8LYuTXdn0/W
         9bddluxJLD1zx52yEUz5TGxO8l8EktCNTxC588E/UN9+DQCdq01YHk8K8uZ60/9Jzakc
         58kpVfs1ouRqu81cPN/CoSEu24ur8PiOhefmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759898738; x=1760503538;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5kr1L00wvOVr25j3yOIqLleOM/mW0MLWBZeaiqgZ8Wk=;
        b=FmmfHjploS0lfbIa4YPtiVPmVp/Y8LTHhU9WwSTYUbexsQcpkUF8FHK6pkFkmJ1cc5
         bR77Lz8PBzJhR+ZjLSFK7wAHrH7ytDa74K9WvHX/q02CXVrNNjkpnG8iSL9P+DlGRRaT
         G6eDmMV+QWpOYhgfVARJ5qEm/nDsGUjByaekBQH2BxP2cCggrbphmY3FhNB+nSfs2Szv
         GNhwcoAFhqyTHe8GXMROpqPGGG1kIU1n2PN4JdYOU9h+/SmE3PjzTWLq6ne6GWdPwPBE
         WEE3YUE6u4ZgAMREeq+yRM6uW7sCt9XI2QhWKcQ5COi6eNMw7VucT9k1tU+29D2iPROO
         E/2g==
X-Forwarded-Encrypted: i=1; AJvYcCXrMvj9T6UwwYgq0WpmeEOTfy45LhEVlOBmZ44musvrQWPTesqnEZUDLkpk2ZHgfbrUYKSTa/aqE0csvv2HdFHc@lists.infradead.org
X-Gm-Message-State: AOJu0YzMAqZfZNrKdmYL0+M/O7sK7kWfz59/O5VNs/MWlrh61/K6qUI5
	W1cXqYQtOyxEwpLVRlLioDRPnz2I3yZC1/BVBNR4N1mS4/mfEs1g+xxLrXXIcmrSEg==
X-Gm-Gg: ASbGncsIeODq1QR7fgot5mu58IugTl7UFPc3QzJUgduTZdBAghTfd5LX0kMAWKjpKpI
	qZNidX2E3uNFiStTJTIznqgghPSUk5/f4Vv5tD8rHPj299wuBqmSaujw5OqjBOF0fZABauTLeq9
	aGp8Lp8dvxQUjgaMsHQ89XqyWQy/vRxxka/U0tv9DqdVaRCJEkQ4sBg+IGPkW87c3AeYOrTKdDv
	GjQEbaCg3ilVliOwpwOUruEGG8HNy0J8m9eM9n1RebfoBn+TaDTLF6OHM0Tp4vM+LbM+eb0/lua
	gzi5nssvpuJxteyBhdsZDyzOIILvShrSBv81gq0pKj0t+wxNMGutNhEdEqwLzYsQLjYQP24A94J
	qs1JJ3dqLEZntyAMBV3tcSvgAoLFbd4pPNb6C9nFAl7+qKPq+pw==
X-Google-Smtp-Source: AGHT+IFLUr0j2WR9Nd0qMRsWsIHFOH6znggjE7lmgxCqD3Uq946in/DRyGXhdUAnZKPPI7qOtPJMtQ==
X-Received: by 2002:a05:6a00:2388:b0:772:3aa4:226e with SMTP id d2e1a72fcca58-79387242fa9mr2116159b3a.19.1759898738380;
        Tue, 07 Oct 2025 21:45:38 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:465a:c20b:6935:23d8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02053b77sm17347590b3a.43.2025.10.07.21.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 21:45:37 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:45:32 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Tomasz Figa <tfiga@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: kvm: arm64: stable commit "Fix kernel BUG() due to bad backport of
 FPSIMD/SVE/SME fix" deadlocks host kernel
Message-ID: <hjc7jwarhmwrvcswa7nax26vgvs2wl7256pf3ba3onoaj26s5x@qubtqvi3vy6u>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_214539_680801_AC693EF3 
X-CRM114-Status: UNSURE (   9.63  )
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

Commits 8f4dc4e54eed4 (6.1.y) and 23249dade24e6 (5.15.y) (maybe other
stable kernels as well) deadlock the host kernel (presumably a
recursive spinlock):

 queued_spin_lock_slowpath+0x274/0x358
 raw_spin_rq_lock_nested+0x2c/0x48
 _raw_spin_rq_lock_irqsave+0x30/0x4c
 run_rebalance_domains+0x808/0x2e18
 __do_softirq+0x104/0x550
 irq_exit+0x88/0xe0
 handle_domain_irq+0x7c/0xb0
 gic_handle_irq+0x1cc/0x420
 call_on_irq_stack+0x20/0x48
 do_interrupt_handler+0x3c/0x50
 el1_interrupt+0x30/0x58
 el1h_64_irq_handler+0x18/0x24
 el1h_64_irq+0x7c/0x80
 kvm_arch_vcpu_ioctl_run+0x24c/0x49c
 kvm_vcpu_ioctl+0xc4/0x614

We found out a similar report at [1], but it doesn't seem like a formal
patch was ever posted.  Will, can you please send a formal patch so that
stable kernels can run VMs again?

[1] https://lists.linaro.org/archives/list/linux-stable-mirror@lists.linaro.org/thread/3FQHC4GVN57SM2CNST3EMVEBUXMSFOGR/#AQB4LMHLGTUO73GVCVV5QLCEJT3MRTN4

