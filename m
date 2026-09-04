Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D55C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 07:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2JcMzX/PCeTf7UGtxAjVYfuJkqAdewy/yttwf8L/2oc=; b=BfJEwwLFdL6sp4UTEwaFLKQxeF
	Hst7rLkw9LvyuGUyaJGp7oixLz6VJ6NLkYGBQHIdvos+KmOQPAR7VnF7DZlBn9fgQloRWiYdjoiWU
	CYd6qYegdx6ysDAQAl375LAlSMqRlBUj8A2+7hWDEMh8XUMQoP0/YJo0JfR/Tsvi974/8GXGk6RQO
	4JzZAXZ2RcOrfjPC6WDVJtMMhJXWRDe3Q//vReCeVx3t3I5EXpFfAvX/Moe+tu213zEW5+1ElTKVG
	X1OLCQV7VVkR4l3p1wMgNZaGLZ4rBWFy4B8aycgf/tXMuWO19lEuIyyLEkSE0Np7gevxESnheAZiE
	OhwwLWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2NwO-00000001DYv-415m;
	Fri, 04 Sep 2026 07:02:24 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2NwM-00000001DY9-0HFq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 07:02:23 +0000
Received: by mail-pj2-x03.google.com with SMTP id d9443c01a7336-2d6fff25530so2009295ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 00:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788505340; x=1789110140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2JcMzX/PCeTf7UGtxAjVYfuJkqAdewy/yttwf8L/2oc=;
        b=ZSsaRlOXg8ReGkR3a2lWtgnsy4L807kodvPYNn4vYe6YBOpuHK2jEVWDtnT6aLR+GS
         FEwTd/hvs+5oaAx8KcJhTwvagQagxGaHOAqRXay0VXYIK+EFcSO1ddjvUm7N3YIzNkOd
         Pjq9veEQYWendf1cPgxSesLrfsIYD8LWBAmO40/VnyhHXPE39xAY7XkFEXm9QLnJ/FWf
         Uj3W0G/MeIIF7ixsJn0QpA5hDcByu01J/+Gd48jdlsGKWWf55a9MHBb8Qy8jjyQ2q8PA
         mwaL3tOfHQ1OoAfmTHZLJin9TmWkCA/P2fU50GN8ckFtvZigXyBsQyn9X2XkvzZGPv9o
         CgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788505340; x=1789110140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2JcMzX/PCeTf7UGtxAjVYfuJkqAdewy/yttwf8L/2oc=;
        b=ftt3qviX4LUdZmNEe1AON5pZwsv+fBCTqA1tnTwpEWYMoQmKCaOokRp15Xgl5IY3gd
         KP/sW9QrwJpmEavEl914HWqOj6qB9Kg9b1AcA+z9ntAjMhdEH13gs2kVTUYrSLFGNrZA
         JC3rJmN4H5U8NV2yNSEM0WuUB3TxeSpWtWR9NPEgrU30OATr3aRjDpDZLPSgyGr9nxyC
         6RDS3+TrBYUBZaXw+fLcqan+2vpdB18+SznTvhJns6ln7WedoJGllUx1W8Ouz4TwuYhu
         SnzS+LzkSvKA9v86hYS+/aqTZ314bDRnrTySbf8Izm1E7yICsw4w5Y3wcyRdrc8mhwRp
         NEkQ==
X-Forwarded-Encrypted: i=1; AKwUvBycV7+NyYxvMVu/xDjauSkHs0tiCtWSYgh0DFrjJW4I27e/SwbLtwiNT2NdRNW+H01S3BtzIXn4LH2ySf6eLx+T@lists.infradead.org
X-Gm-Message-State: AFuF++njNhtLpsvUyHw2usOHWvEWYOm2Tg50OIJ/GjB36GpsGXv+5MWY
	LTZg4R1BHv06G4GrS25yc+FeKRng+OlEjQKY20YeohX7zm7ks6aodn8=
X-Gm-Gg: AYBFou3G3Jqzxjb8zTSwCwUhA0THeGpJjqexNt4eI78w10J7c0uzqRBIcyc2uxzydpW
	z93PT2scyRuQz3hjuzVrihGbrFsykWZJcPp2M1cxnGCldQ5g2f0RiIgbe6u8WlwpIhJlfkA6lB8
	XLyFbkdw87+TdiE0DKYBbrQq4hnC8ee2efem3rUDXI8v0mUFH3czIbTnbkJW1iptPzNyAqmUPA/
	Xn5W0EKhiCPxgDxBT+3Iv3sh1a/E5XufHsAp5XJ7BPHXDcT/BbYqKDFALITNWCiyyK/1lkKp0sF
	f5u5azLLNwaRI/nEz666J7J5RSRbsoUqM01bTxOSTr5lxnlIKRVjDjyA5crT8N6zcibyJ+H9ElZ
	mNIxfBSXVSKfA4ikvYUVjlhY8omk7uEA2uuK/eINcEhNzsQ+8lvrwnFi4vaR+Wnf6hs6OBqUcax
	07RYIzYangJLDoSF+uL7GaY2dvDSks7T8Mq5+Ik4rYRy63M10pAQddL6rj0fnJschRZGjygz6+g
	120Bl32Fh96nYgZrJT6DH2h
X-Received: by 2002:a05:6a20:6a1d:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3da39d2e51amr5960262637.11.1788505340274;
        Fri, 04 Sep 2026 00:02:20 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615273e3a0sm755511b3a.23.2026.09.04.00.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:02:19 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Song Liu <song@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Yonghong Song <yonghong.song@linux.dev>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xu Kuohai <xukuohai@huawei.com>,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [PATCH bpf 0/2] bpf, arm64: fix the exception callback's frame pointer
Date: Fri,  4 Sep 2026 16:02:08 +0900
Message-ID: <20260904070210.4163193-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_000222_108355_9A215D97 
X-CRM114-Status: GOOD (  11.76  )
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

The arm64 JIT does not set BPF_REG_FP in the prologue of an exception
callback, so the callback runs with whatever x25 held when bpf_throw()
was called. A callback that materializes the register, for instance to
pass the address of a local variable to a helper, then works on the
frame of the subprogram that threw.

Patch 1 sets ctx->fp_used on that path, the same fix commit b114fcee766d
("bpf, arm64: Fix fp initialization for exception boundary") made for
the exception boundary. Patch 2 adds a selftest that reaches the case.

Tested on aarch64 under QEMU with vmtest.sh. Without patch 1 the new
test panics the kernel, because the address handed to the helper lands
on the helper's own saved return address:

  pc : 0x1234
  lr : 0x1234
  Call trace:
   0x1234 (P)
   bpf_test_run+0x188/0x3e0
   bpf_prog_test_run_skb+0x47c/0x998
   __sys_bpf+0xbdc/0xdd8
  Kernel panic - not syncing: Oops: Fatal exception in interrupt

With patch 1 applied the whole group passes:

  #116/11  exceptions/exception_throw_subprog_stack_cb:OK
  #116     exceptions:OK
  Summary: 1/118 PASSED, 0 SKIPPED, 0/0 FAILED

Not tested on other architectures.

Donggeun Yoo (2):
  bpf, arm64: set up the frame pointer for the exception callback
  selftests/bpf: cover the exception callback using its own BPF stack

 arch/arm64/net/bpf_jit_comp.c                 |  2 ++
 .../selftests/bpf/prog_tests/exceptions.c     |  1 +
 .../testing/selftests/bpf/progs/exceptions.c  | 29 +++++++++++++++++++
 3 files changed, 32 insertions(+)

-- 
2.53.0


