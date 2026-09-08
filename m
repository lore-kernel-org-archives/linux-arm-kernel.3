Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC102C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjnURsU06dXJhEmQk8UgpVeNwhEKlwAdFOshlqNlRoY=; b=1Ub7CAIzDn8KCs0lLjlEsV2oG/
	nDsQRo3Mt9OQvuDbD9oc3fqdVlJWzCip//XLCJSU8mtnbkWfk/+DkeQL2VhQFKkqUsfsIgidZc68K
	mAVgWY0kkiOQfQ6THK8m2nrPBHyZmcQTRo5DqkXFFIfCTY8cyft3jHYKBWMJCvHd9JnPsnHSwHQvN
	pUHR2I6dpDjmMDt1lUgQ1FuIxY48DbAT1n7GEdQNDALuh204tm03uTCbGIsBCGHo3D1jtNeSu6aI1
	YW5r1m7QNiYuJUFm4EGkb6t2Wx5hgUx4yDe4ur2MOhJc16AjVNIW1ttwKAlK/19aNmNUByCq9F/3I
	7UmeBW5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oho-000000086EZ-3IVg;
	Tue, 08 Sep 2026 05:49:17 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ohm-000000086E4-1N4Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:49:15 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso2241718a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846553; x=1789451353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjnURsU06dXJhEmQk8UgpVeNwhEKlwAdFOshlqNlRoY=;
        b=iE0w+Xm5HA1x77vR5giuSwOdjvDRPy6zJDajCbcKnBS+OzJYFUvBbo4psdUKapuUSd
         w5M0lhVy5uAPmYDjrVGPkry2cjYCCPYNA8k+qiSC7y0EB1z1tyJmViaSGDJm/H7mygto
         fyYGHklD5PeWIR2F7h8YsKE9+S3pWw9Sv3Q90jEaOu9To4RcmNecPOn4DJEA6keuQbJb
         KoHtvi4DnVri2xtxjDQ/3uLWtj5EA582iDPzTyxEShoeRVTsCw6Edo0k+lUV8IRD0TxB
         sSiclNDCwdzW/dqUT3hVVBi+uthU7nQ3COE0ZoiXwEZelZxzFbTZQryjg0IOrUam8CBM
         EVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846553; x=1789451353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CjnURsU06dXJhEmQk8UgpVeNwhEKlwAdFOshlqNlRoY=;
        b=Vc2f65c4dS4ylAZe2FRmf14rWC/CKFB02dG55cb1uOoeOu1QlR9NCYy2fJyf8+cDIi
         /TRsvgubTAOnTwmUSUyzc+NU+6aSxqFHq0zDS3soxLBPwOzTzC0OHX1uGc+EV1yO7wvH
         umaKFx3UKlan5YnRGsom1NaLnn0i2LCVxmY44ycQOA6AuS5g1hMZUBJTZFeS687pL497
         AXr6hO5kA+SoQt9izJY9m/m+oQ19ali/TmGEttStPAX5rdWHG7TsF6bkMD2K/+eWGZzf
         UojYmOZCMgGSsddMSo/xTMzUlnUMjxdg+C2kMPN7i/3uRt7NT6FCWkQ6UU6RokTjpSDR
         jP/A==
X-Forwarded-Encrypted: i=1; AKwUvBy2Ds0xVDiVezOAyoS3Nk5QfAB1UYPRT0Reg6fcC+lBgmqnSHHAE5sp6U1P6Gc43HC5BQJyiLtO+NDVPCnGNpdP@lists.infradead.org
X-Gm-Message-State: AFuF++nFxzKiH1x6aUVEf8+pbThYd2Kr7pquBxFoexrF0tgnOr14aGsw
	hOuBiplLwKGRz85uoboxhv0BIKVggb8cQ8MID0vghLYKPB/xWPJHzGwQ
X-Gm-Gg: AYBFou2mvFNQkb/vPfAUkSbZrIvGRaVbvwZcHgMaLD62UdvFCBLXN3O/KvYKRX1XqNL
	ceDvDhMhvRNY9+9W/VlHXPqY8ZLc0sdWGX/GSLTxpACR+iI9vXqhRGIdIMGSg/sdDya0nxnuic+
	p6cKRc1bF4tbrpn54FExOQTARNHA/xn+/WbX8N5GjaY6kvxzIAjn41mCZWaForkuCS05/1D0CP3
	NNsAlKsc+twQLjkhWVxSY6mDgGqgdazRHk3V0V4+HllSb9kNAgdisj4EdI/Fv6lQLEVCCuvaNw8
	QeyDQSGOJxv2FUgCYPuPBn5W+fdHODxE7O8uBdVjMKyh+RRsdCa+QJO+4JykWxfTaVlZtg9pO1S
	QcVNoYAhslfrA0k3eZTGVY7gHmgA6kX0Ar6Hg4SyAOa2/utYpQF+EcOWN0x7Ms1GlamqKo/AWP1
	YHkcAreXagmpwWtJCmoLkmGo+wp6nMYevAHTjSi/2oxHk+QHNy0JI+hM4Djmw2cOiD7z93wyQMZ
	ZHRRH1ymGlgGg==
X-Received: by 2002:a05:6a21:38c:b0:3d3:ae1f:d7f8 with SMTP id adf61e73a8af0-3da3a0cc91cmr42894753637.24.1788846553447;
        Mon, 07 Sep 2026 22:49:13 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-334fbd5e6f6sm25690109eec.23.2026.09.07.22.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:49:13 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH bpf-next v4 1/7] ARM: net: fix typo "arithmatic" in comment
Date: Tue,  8 Sep 2026 11:18:47 +0530
Message-ID: <20260908054853.13820-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908054853.13820-1-hemanth.selam@gmail.com>
References: <20260908054853.13820-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_224914_364293_0F412092 
X-CRM114-Status: GOOD (  12.38  )
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

Correct "arithmatic" to "Arithmetic", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm/net/bpf_jit_32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
index 9ede81afbc50..b1c21c014c9c 100644
--- a/arch/arm/net/bpf_jit_32.c
+++ b/arch/arm/net/bpf_jit_32.c
@@ -1346,7 +1346,7 @@ static inline void emit_ldsx_r(const s8 dst[], const s8 src,
 	arm_bpf_put_reg64(dst, rd, ctx);
 }
 
-/* Arithmatic Operation */
+/* Arithmetic Operation */
 static inline void emit_ar_r(const u8 rd, const u8 rt, const u8 rm,
 			     const u8 rn, struct jit_ctx *ctx, u8 op,
 			     bool is_jmp64) {
-- 
2.48.1


