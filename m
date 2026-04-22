Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6C8FA1FE1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 18:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Subject:CC:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=k5olhXnIscd8Fz0fGU3E0klOq/HsiOUVkCzhktPLD2M=; b=MnFuLZapx/09/m3hINXRaUsF8f
	YkX61bOeG4nvK3I1i9cfjlRpVQtovYFWoziHO76oHmdQBFfN/5RHkUG/k698UVr/RZIbfc7zzck7A
	W472JUzl8DfwfZuqm7VgOB0H20/N20QLh5FZhwiUJtx8ZqdfRiT7G2PMQuDn2XDU3B1mYFoN8v39/
	bT4kZPN3VCIwufjeCg2tRZ1aaXdBJaN0lN86aN3NgyGeqaiX0Dupq6fz/CuvHTsHMVJ/TScKXljHh
	Q5Ik+hU63Oq3fgX5sqlrG/NfvI3luliDtDt+LrpBgVCSYHcix83DfYN/35rG0z7QrJ0xGXTcFYkW4
	/XxBpSFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFc8I-0000000AcSo-04VC;
	Wed, 22 Apr 2026 18:17:06 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFc8C-0000000AcSD-1NV4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 18:17:04 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-7a469383e0bso45504177b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 11:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776881819; x=1777486619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k5olhXnIscd8Fz0fGU3E0klOq/HsiOUVkCzhktPLD2M=;
        b=ID7PL/aBnjTJ2Uyl+9YNgFnt7Tka1HCPBn2NLOL0mMY6L3dbD3QCKMdPL4wvsbCo/Z
         jRMTR/lVc0SyQW1hE/z74UCESCzOsRVPdlIKBy78nuXljCPFd5h4zlWifsZh0RfJ9mR0
         gvDSmGuWtfer3VR2ZWTMfTlepkwIvvMu2PunQwhSxpBNoR/LBjEaF6oDgLjVfB4wYhze
         towfDocaZOaqJFRcbj4KBiRByr2LiNPvMBiR9O2ZDqbIMhOxX9S3Ei0En8oc7iBPbitt
         12LTm4S2zRBPLs83Wn7q2aCQVkKynp2U3YLTQgVQ49GpuOdB7PzhNa950Ex0mun8UCKK
         vRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776881819; x=1777486619;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5olhXnIscd8Fz0fGU3E0klOq/HsiOUVkCzhktPLD2M=;
        b=sLYSU8ejpnG/YN4jsoDrTLVNeI/n19mB+RdChLGBhui3v08x51QCRr+WTZAfgh2UYP
         lUf/ngZ/+SHreXDTSZEanYr0cR4HMH939nc4JA9dIRjp7vP5c18PMZWemB/9WPbMLVGC
         ZpAbY4rqJ0rrVXPQrgQidoM3CDITPL9wf2FUXzAcROnrVcZib0UUZKnje9D0aazKI3LT
         cOHSaxMd92XJvhYRIBTf5bCDU1AmLAAG02zx+VHkKTiCtoW1cu83nntoii091ZeIzbw+
         2TaAZFqwHkbEg3mFj9eTFiech+D8oU62YJhIN1Xb7AtuFi2jsqiC9OENUh0kfEsYnX9a
         XsJA==
X-Forwarded-Encrypted: i=1; AFNElJ8pEJVMGRN3D/7A2Tf1HQCHOc86Kmm4EmMP4+XV4KkqnP9qQIV8csWElZKXEXFJo/8sx6R1wpCEUvxtnp6OAqmC@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg3xQYmWVNoPohn6/vLJQP30ILrOYTkSfy6hf6BkKApjlEdQDN
	jH1DpE55Ys46TKaUyxCnG3uU9icA4NSGXqCWTwH9toeV9CeacA5GVt2EK4crA9mv6Go=
X-Gm-Gg: AeBDietkXrwWHTMcX1giGFvuu0X/O2ZtDRuAgvdN8O3FOnNtTBXgJM1GvdUaoIb7Acy
	elWdbNOyQMworniPGEU1vaM3mWBR0oB/ppg1otQBHqhAgE1EHB2xH/2ozS+zgc3PY9rTr5Ltowp
	DtCKsNUwv17438U/4LlMPux4iAXV5Ihr7tMia6jGetwDVrFGnMAPjebdV8IHafUhTzbISwF3frJ
	0NGD1dRdEu+gOwFB6WhXSOoJvBNuwjCKZpvQDMKk9nOQnTiXpb17LwmwXzH2+9aibCWBXB8FbdR
	m0UUO/JkJpFBqUue54LGugvPJAl/Qg4S2FgM+gfWjKQI2bj/CJGYFjaES4M2Mlp3MKZrGqx7139
	unswyuEmb4XMfPWnuHsZvAV/KjYyN5/16TwbCd6p2ARGapr3ZOJ17bx7L9HEv0KwxvNKzIxuIYv
	pn5w5Ykri3b353QGMxLgiAftQO7ozmZMsJvWNA
X-Received: by 2002:a05:690c:348a:b0:7ba:f414:cd28 with SMTP id 00721157ae682-7baf414d250mr133922307b3.42.1776881818926;
        Wed, 22 Apr 2026 11:16:58 -0700 (PDT)
Received: from ehlo.thunderbird.net ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee8be8e4sm74318757b3.14.2026.04.22.11.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 11:16:58 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:16:57 +0100
From: Josh Law <joshlaw48@gmail.com>
To: ardb+git@google.com
CC: ardb@kernel.org, arnd@arndb.de, ebiggers@kernel.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-raid@vger.kernel.org, linux@armlinux.org.uk
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_5/8=5D_lib/crc=3A_arm=3A_Enable_arm64?=
 =?US-ASCII?Q?=27s_NEON_intrinsics_implementation_of_crc64?=
In-Reply-To: <20260422171655.3437334-15-ardb+git@google.com>
Message-ID: <547D9EB2-4A67-49A9-8C8D-3ADD22123B1A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_111700_396495_C7526B19 
X-CRM114-Status: UNSURE (   6.27  )
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

Hi Ard,

Wow, 20x improvement is nuts.

I like how you handle this change *safely*

Like.

+static inline u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
+{
+	if (len >= 128 && static_branch_likely(&have_pmull) &&
+	    likely(may_use_simd())) {
+		do {
+			size_t chunk = min_t(size_t, len & ~15, SZ_4K);
+
+			scoped_ksimd()
+				crc = crc64_nvme_neon(crc, p, chunk);
+
+			p += chunk;
+			len -= chunk;
+		} while (len >= 128);
+	}

chunking the SIMD work at SZ_4K to avoid hogging the CPU and allowing
softirqs/preemption to process is a great detail. 

It’s easy to just wing it and throw
the entire buffer at the FPU, but respecting the kernel's latency
requirements is better!


Reviewed-by: Josh Law <joshlaw48@gmail.com>

Thanks!

