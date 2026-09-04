Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B8BC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjnURsU06dXJhEmQk8UgpVeNwhEKlwAdFOshlqNlRoY=; b=Wv7JwgHPO1/sISmHW9u+HgxAHH
	KAeshWfauNknzhYkZtID1EbA0CiFlxk63WBtAFvC/2cjjCQhwTwq0jpRKYWEucCU6S6ss2nyYTEVP
	G0hvj1BAbGb+58uXenxsDCRx9Sm8u/6RMStHF4O8BraImkoVKBFkKi/A8CYdQp3g7dK48dsyyJ66u
	KKyHQHaQPIeIupvBEyzCLgv1dA2Zc9yLC5auz0ivYRbbgi/waBsM41vo3lNWUzaAe7LI3L/SOnT0G
	97WKc5v1dWJ0k1WmWM7w47VPiCupjEUIqAotSPaE3wpSOZtMJRjoeoUYWT2QTo9L1OktWMOHVwjBA
	XvYIUEkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RcL-00000001l26-0wBT;
	Fri, 04 Sep 2026 10:57:57 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RcI-00000001l1Q-2pGc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:57:55 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cc147d86bebso906346a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 03:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519474; x=1789124274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjnURsU06dXJhEmQk8UgpVeNwhEKlwAdFOshlqNlRoY=;
        b=bQ6F7xUM41kGhz80oxvf9KR4Iwn9LzFLPZS3PuKxlCywon5muipyul6szrHl9RUgcU
         wLePb+pABkajnmFhacB47Wj0OkeqD91s19Lh1YSYoTGoB9hu3yTzPINxshyhCpdolUKa
         3cvNp+8ba0EQURR33KuKXFliS5h2jBQF5/COiViSfc2pTJxO5uXORy7fTrPkgfBp22y5
         4UFCTImMxN3v8noTxNY4TNsHzDbNd8aBg4Krl5aNP6tcMUqVgvF91WNU6yyCjTEGHT55
         HlLWh2gl7tnwXvqSn7uUkY/ttDjp8EvEIXprdVJPMeOVmiFdvjo4Jhu/cvNnYrE3+ixq
         JNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519474; x=1789124274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CjnURsU06dXJhEmQk8UgpVeNwhEKlwAdFOshlqNlRoY=;
        b=gqaFHdcgPqZdYCXx80gH/Yz2nktaw6+jBtm77njYr8U1YTzO7ft+/+u9PZojtVTguY
         n88j+W/do8txGBXzOqo7zdmPzHbDMYVXIy4tkCW3yfstZb8ZOLB+ME/UGE24HC9IKDrw
         voktcogOE4Ox4UyawjawNhOvWBd1lTYzifNaMl3AJ/fnRr5BxYTmA1/lCv5jhNT/AYkX
         vwb9ByBZkddMkQIeLwf0ReReYSVNtsrDZ9v/2hGZkB02NCjmh0Q1/Dh+GY9FKntpxJZL
         /cgkjMZSSDrXhyoLvKm8WgNmZM4/PwCnYz5l7cFRtBlgOHh43vYB8qqColWyAYgfJaWo
         QGxA==
X-Forwarded-Encrypted: i=1; AKwUvBxHn7FixJ86YcK9CfwysSwy1lfgpH5rQxWbVquuH6kv9fSX3EfeHbWS4k346E24UARzRpbdpAxZ0akcVdCz3gVQ@lists.infradead.org
X-Gm-Message-State: AFuF++nQj/bSKzQEuJOGb3R+he5ApIol/90uLanDfo/9OOcfD1MVHH3R
	HipKK9B+R5k2Rxh8aNq+NJUopxHUjlc1UJyFOWv7kaSQ5enzs0jNjaVD
X-Gm-Gg: AYBFou3t1FGDIXY6v2yq4xOQpPNaPHGeILQmYRVlwkCGbddScBU367Z6hBULfxDMzd+
	sl9zfTHkM6ypNTq3UIdXEQPt9On/Rlwuhxs54LbR6GXzKDHfFb+XfAdsSVfn60vkwhHP8VYePN1
	NvB4YuFa7zcV8xvm4uXQJeA8oqpBVwIRHnUw6WNJDE7LqW5xVIzHU2t09VD77oLJCs4kP0/bUBR
	vcLMEuSglaZh0PEs6os6shguvrXGiEDfM/b9jEYHjbqvxsW+PoHJGqasJhbFcRTmpKLem0mO48R
	ct4LHkTKujbO2SL6G4PZmHtwKrgYee6pyuaZF+KlP78e5vO5Xi8QvV6S2b1YTqwTR78oL6UBAoU
	7pi2U9sxzSd8BYOsMSSeQD5pq7uFdjkyflGfN1XHONsLQ6FrYGgwJOfLS5KJ2BLVS6suxJQqyzW
	WMbKbYXNo4/n/mniboDsudsWTMoscBP1fB1SsNZWH0/u+/qQgPPXG9w66oiWlhhJRkyawvalB14
	DeFy13tIxCUo/8=
X-Received: by 2002:a17:90b:4b90:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-39b07f2f31fmr13507017a91.6.1788519473607;
        Fri, 04 Sep 2026 03:57:53 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm5523091eec.18.2026.09.04.03.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:57:53 -0700 (PDT)
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
	Puranjay Mohan <puranjay@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/7] ARM: net: fix typo "arithmatic" in comment
Date: Fri,  4 Sep 2026 16:27:31 +0530
Message-ID: <20260904105743.39799-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105743.39799-1-hemanth.selam@gmail.com>
References: <20260904105743.39799-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_035754_714158_7CF878D3 
X-CRM114-Status: GOOD (  12.01  )
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


