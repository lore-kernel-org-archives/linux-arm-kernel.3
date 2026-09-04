Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B94C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQohy1k6O8N4/FlPUm0T2gOe7iYaF+RMdNWyiCLqF0I=; b=CyLV2pnYxdC08HWsQz7RywwE1H
	qhWKjujxycwVZMxil8JOt1D5P6qvw5N5kLQTWbidGNYcm4o+pbjzzW6y7Zy7fhBW37aLloAR14kI/
	e9msXLxEvDxEB6eBVETkubaZrpkfq2SuuogrzkwLWxjYHz1CByx55V0Ul8TIArz1Ntox44dVSzcFH
	jPYwEmua5GDFsQ0W2Bz0iSbSeZDGrL8OXW9Axn8rzFSz4rq+2yxN8IntE/tJfLkhRWF8ec7Xwsml3
	3IjPpi6aN0vh/Itiq1dUT5MDeAfsLU9vJiWEWoqcnOU+HG75Cb5xn+cBMwiZ8UnkQY8oDY2tk+rkQ
	aNSwNB8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Syi-000000021Vd-1VMz;
	Fri, 04 Sep 2026 12:25:08 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Syg-000000021UD-3ID0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 12:25:07 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso546489a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 05:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524706; x=1789129506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQohy1k6O8N4/FlPUm0T2gOe7iYaF+RMdNWyiCLqF0I=;
        b=jtzwvXgHekacR9kM6hNlh3miaLYouMS3w7KB0poNay5oBn5yKCg7/7cBmRTTiIO5J8
         Tbc3dj7xXPv7ke9w2oINA7o7z9w6nl0QZi6AJHOLSSTOra0eGc826uojBTw6u9s7xJOI
         XKLsz2Eq5fjAR7hbV5vCjeZ9+XjxNsadF4WxKdcsOAzYN+6q+Gmy1/i1hYHtkI2d9rMs
         S4eGI7HejusiyZhJERvso1bmNKa581KHjic6pY5vbUjEssLaKRRFZE4ETlilb2bDzxs4
         OGHN+PZlO92k9qddcrOmPblZzXMxiMXkAaisHj7JZmuWeydf3E2HVG6taG5z2hdWiAfP
         Zuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524706; x=1789129506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TQohy1k6O8N4/FlPUm0T2gOe7iYaF+RMdNWyiCLqF0I=;
        b=KRNiZPblTyrM9ciRCG9aIG1pjWzHVQu/qK2m2+BEILh1xJUWlb+5DzQ9iQRwiVtniN
         Eu2deXXd9CmTaJogLlc6Z0JPjT2rJDIRuAaxthP6vnjdOniH2MpQaRgzCcZkoRyIMRKF
         YE4U6kkOlZNHugZ2aSTui1CUIpEpAJekjp8pSJ6k9SMjANQ7Ys/EbyvnP/Bsc1+6m7gu
         LuPCHkvIFY6b4YVINC/7iXALvPB/hd8k22sMO07HLu2SRxRLFcZxu0F/vxj3Cj6NwfYU
         t39P2QhDKYP7oJaen8nmiEgfni0l++eZkCS7OLSMGcBtfgD+pC3vKu3qCEYQpQHzbZdc
         23Zw==
X-Forwarded-Encrypted: i=1; AKwUvByd/hn5HSrNpS8LyIKGgv57y4UPJ8hzBmI9FiG4bH8tFa9LToy75NSPHtbfjZmYi52Qjw91+P1Cs+1KFHM9+6It@lists.infradead.org
X-Gm-Message-State: AFuF++mmWusC0YQHYUUFQw88ASQKOPf8f7zhFhrpLSH+hKSagxJDhGcj
	1+R/yEggWHgTeQ48c2VgeMlhbZa4bWEgEBTZyJMpdgP0fd2hJ/dQHLVg
X-Gm-Gg: AYBFou3ORozWBtmKARlmgsK6oj1BYuHhLm39VP8Z6Ndw1RcAUhSyUFMVcbPdtT80Z2+
	+ceeW14AueMsZQcS8fXrLnu1mD6GGa1TL0xYouNc+R3rWWaz4tc6cbsBOTWoM0Piag9ysE1k4TY
	UNYxR5M22ZrRYPsQkpNV//lCp9+1mPvnPpXHcwGzErfIABS+ETCfEpzjSQF/9BtqIOfqqA20fj1
	egs9W45o9XXZJ7FqUM1RdV9Uz9d+4WvgNc/Lk+QWzDGWjoah4DTO0bnZX9JWI/f8jFSxaBuE78A
	TkZH/q0rWUBe4mSzURgDlI66lyI+hrMNABpweBBVcL4Fk6E9235Fu6D+FKzoQDIClRMRKTYiaq2
	q2ObwUCWJT2hrD+fCmt7mbpMZSFNObxGYgwQkLiYmkATdQqxUpfHC8pKUkJuU1Yntj6eAqRsjiF
	eMFeUdYN5iMk2jDBvn5l8tZ+KdJXDPJM7Ytm68QoWpeb9fdUOo5UFgLzLVZsTe22crQleVcZUrk
	eMEQclFwkG1nQk=
X-Received: by 2002:a05:6820:60b:b0:6b7:8396:f3c2 with SMTP id 006d021491bc7-6b78396f7ecmr1517046eaf.36.1788524705780;
        Fri, 04 Sep 2026 05:25:05 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f787esm5880860eec.23.2026.09.04.05.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:25:04 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH 3/3] arm64: kvm: fix repeated word 'is' in comment
Date: Fri,  4 Sep 2026 17:54:42 +0530
Message-ID: <20260904122445.31163-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904122445.31163-1-hemanth.selam@gmail.com>
References: <20260904122445.31163-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_052506_830964_1D97A89F 
X-CRM114-Status: GOOD (  13.64  )
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

Drop the second 'is', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm64/kvm/pauth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pauth.c b/arch/arm64/kvm/pauth.c
index d5eb3ae876be..22ff4b78d0e9 100644
--- a/arch/arm64/kvm/pauth.c
+++ b/arch/arm64/kvm/pauth.c
@@ -5,7 +5,7 @@
  *
  * Primitive PAuth emulation for ERETAA/ERETAB.
  *
- * This code assumes that is is run from EL2, and that it is part of
+ * This code assumes that is run from EL2, and that it is part of
  * the emulation of ERETAx for a guest hypervisor. That's a lot of
  * baked-in assumptions and shortcuts.
  *
-- 
2.48.1


