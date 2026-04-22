Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8B0FA1FDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 18:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Subject:CC:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3v4gati8jz+0eLCt+fkaA6QE0HrpYumOYS61o02yFpA=; b=F02Zndj1H+75f2BX42G+ljzSet
	Qb/UUDGBUnsq20T2ky9xjTI6FWnjrZHNKIuzSBYXJoLPqKoLtrmL/k9P2vh1yoBw8rLB4gpy+UnJ0
	LCvm14TgrdgYRhnRhZuliExiftoPCmIU8eMQJVRY+ja0pFd5TWKyfweljnR6z78OWTEHDSCDo+P8Y
	WfSa48Q+JuBhXCMNHbhqL8o1cmJaxHcceCsbzK/AjN5ntZlt3+PhJsQoxYuALGYni24VZGocyOLp2
	Rkgv9elZbJMoWu2uFntq84uMNTSvCjV0PNcSC3GM5Eqga0Xollvd9jVyXolJuPej96NFTt9J8pUXN
	egZSZRGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbzB-0000000Abb8-1RDs;
	Wed, 22 Apr 2026 18:07:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbz5-0000000Aba6-0XNd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 18:07:39 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4891cd41959so38813265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 11:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776881252; x=1777486052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3v4gati8jz+0eLCt+fkaA6QE0HrpYumOYS61o02yFpA=;
        b=Wnl5G6Rgp+LdpatTOyKOqi0ckl/w1o0KD0P093Vt+wpQklR16dAMGt7RDcdaxUyoNm
         dHJCQz5DUTY5rEsP18odcOY3V/U8WTQ1M0IDsWaxz1j6HPUba0lnX6yIbUPLOSLhmSr/
         jyl7J6M91BOQLkexeh7Z0Ku8Ad2MfiBe5gfxhPMQEqi/MAPjLqfNGfEJuNS+V0dSgAZI
         XSJ6R0/+edm9vdhmJyu9YQDKSGu8ta1/pEDuBMzgHC1njKbtKgmo7GxovbWWHymrCANL
         N/h1DEuu/g8QRkNsW7VHTcwUT/tgC8jbBZBwGECbuGur1PJQNTakkMkk+7OnXcxsRh/x
         QhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776881252; x=1777486052;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3v4gati8jz+0eLCt+fkaA6QE0HrpYumOYS61o02yFpA=;
        b=JATvSFOTZGxgpzITo/p/hIKTzUOEwPYPtIlJEkMv55tf7+hyUpkpsJD1fIEmymayly
         6JRfECn++apLkfsGswwVyxPh+GjYFLpVnCGay4/yguPUICv+eK3pW4xkf2PCle5dvlVe
         yyABg2GQtysNcLsgEAUA3aimW44vfTNYuONZ5EyKuET5PaHOyHRK3mdgkjmBpcu/0hE+
         OFAkM506xjEIOKP9JTiD7rMiAZs0llErx4ZCgnHVQbj/BXZR1qomSPtPS3O+Z8ZaylCI
         y8/fppQPJgTGPZyh9uRjE9xEG6+Rh6F4JdsRBB2HGohSTNnMvlEozcA0EJpfEpowZm8B
         GWHg==
X-Forwarded-Encrypted: i=1; AFNElJ8gdN+PrWaUbZT+bqNr2TXnZJbY8tLMtSjtdvrhjGpwExZ5RTo9vxfSlavNgDzH59gdDRneVBYRcHTrJq0eNEw/@lists.infradead.org
X-Gm-Message-State: AOJu0YzjHk+1lSx7LLAu4C1N/ZmTI/S6+BIPaB8vXPOpLSX5NHtja5xj
	uBk3EgYPoz7K8BE50e2r0iTF62x0b/i7ckrjm+CqYKkEXkxS2ILI4qxF
X-Gm-Gg: AeBDietLL0HhGHAW3r/F+wLKPsbeiegjXp1SjZGoC0gFgikvD2lVrVyuOnuEAe+zUbz
	cBd5J8nESNq+XcvaF8BaQw9r7+6GdnaqdDnuF/bMqXtkg9nU3DmDk4DOnE0Tf58MPVH1/ZR4S1W
	YV5fythcPoyUIaxSfnNG+ydocDcBg4qKPxICT8CEbYAxCwdcC9y8bzS/ia4s16GQSQgai0nVGin
	IsOEN75EVfHzTOpO+0pn6WBnPZpFMiDKpMBvd1xddDk6E5JzzSMNQ2koNjPsfUaVh9ut+3qLmR0
	Dew5Y/vTE4V8WLpCrUEYgJUaakDR0Orbug/aZ1KJZfJPnfoo8w6ipQM7gNcuk7tdyxANOHr/Dou
	uXRDlUVZTXDmotztxjCF2ZisglVNWElCCpX6NiPjZ02fWNg+y17qNSY1mxKtg6C/cCjgDWDrhA2
	NVd/DRfTTVg37VNoAsCwqiwa47RnZx3JqUekaK
X-Received: by 2002:a05:600c:859a:b0:48a:53ea:13df with SMTP id 5b1f17b1804b1-48a53ea1500mr120994365e9.2.1776881252234;
        Wed, 22 Apr 2026 11:07:32 -0700 (PDT)
Received: from ehlo.thunderbird.net ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1393f5sm432764375e9.9.2026.04.22.11.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 11:07:31 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:07:32 +0100
From: Josh Law <joshlaw48@gmail.com>
To: ardb+git@google.com
CC: ardb@kernel.org, arnd@arndb.de, ebiggers@kernel.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-raid@vger.kernel.org, linux@armlinux.org.uk
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/8=5D_xor/arm=3A_Replace_vectoriz?=
 =?US-ASCII?Q?ed_implementation_with_arm64=27s_intrinsics?=
In-Reply-To: <20260422171655.3437334-12-ardb+git@google.com>
Message-ID: <3341B2B2-9B57-4273-AD5B-EDDE00CC4119@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_110735_177755_4F0200F6 
X-CRM114-Status: UNSURE (   8.49  )
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

Hi ard.

I like this patch.

So, I'd be crazy not to say what I love here.

+		/* p1 ^= p2 */
+		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
+		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
+		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
+		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
+
+		/* p1 ^= p3 */
+		v0 = veorq_u64(v0, vld1q_u64(dp3 +  0));
+		v1 = veorq_u64(v1, vld1q_u64(dp3 +  2));
+		v2 = veorq_u64(v2, vld1q_u64(dp3 +  4));
+		v3 = veorq_u64(v3, vld1q_u64(dp3 +  6));
+
+		/* store */
+		vst1q_u64(dp1 +  0, v0);
+		vst1q_u64(dp1 +  2, v1);
+		vst1q_u64(dp1 +  4, v2);
+		vst1q_u64(dp1 +  6, v3);
+
+		dp1 += 8;
+		dp2 += 8;
+		dp3 += 8;
+	} while (--lines > 0);
+}

I really like how clean this is, I'm personally nodding my head here

Taking the "bad" guesswork of the compiler here is also amazing, it also
guarantees we won't get stupid regressions in the future.

Also, that performance boost is even better ;) 

I'm not the biggest expert of this subdirectory, but I understand it well.

So well,

Reviewed-by: Josh Law <joshlaw48@gmail.com>


Thanks! (I will review your lib patches) :)

