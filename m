Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530E6CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 11:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPh6XORnQFutGuSPPAuNsD4rMMfBhVhq8Yzq5Cf9VjM=; b=vD0mSqLc0OrTAmLWBcspu0O0T1
	P2J/uPtWjbRCgDgw+DvDC80eIFqZK563+n4LRcTVNVbisP59ViEmGTbx0CG+bWnVhXI9nJy+tR6AF
	TOAFCfwKsq8LgO2SIq1JmYOCurXj60bbToUccYYWHsbpPndCvbb5dCtapyh6kN34whdwuUUrWy2Nv
	byWvShGiCrNcGMXGyCVxQ0rhnmF0UZbxKqz9qjsG3y9ERve3yEMLpoDPnEhTKm/6frAdUiVx/Yg7q
	4QCXfPkZ006vXkchI2mL2+jD2UFaDkg2qlYD5Vm/z2fsrGPZxwHM9jTvNrdXaBJ6luY5TMxz4IZWe
	9hRtAlAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciIP-0000000964M-3ssN;
	Thu, 25 Jun 2026 11:31:01 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciIM-0000000963i-2ahu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 11:30:59 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-37dee15b2f9so58842a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 04:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782387057; x=1782991857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rPh6XORnQFutGuSPPAuNsD4rMMfBhVhq8Yzq5Cf9VjM=;
        b=s+lo3LsoYVN86Xva+r8lWzfLazIrgRrut4xuR4zkKlkQ34H5Ig7rA5hwJwdHlDyKtU
         4E7Eu6PXYklqIABWE7yEAi43stvzIIeav1R6GrbHuqSjuI5VqsKRTYata944Zq9VJS9D
         p8BJ48aEtrhzcShSc52ny3/GX0eHewop0qBnDQkynhK3FS88uo4o1lzsm4BA9WEgrKXA
         buGyePCqjwRsd4FhjBxz6bgLdHXk7Mdsf8elyiKr39bnLx77sxfcIswuCu6X/Pvzoi6P
         YO54HGkIfG4vJGJH2szk2ekLHxTIhCPLekpy/w2dUtevJMwqWVQWfMIjjp2czh7qcpmN
         QJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387057; x=1782991857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rPh6XORnQFutGuSPPAuNsD4rMMfBhVhq8Yzq5Cf9VjM=;
        b=Zb8W2Vu+2L4JA1/iv+HCHaODNnekF9Y2uYT6MhHqHSdJ9FuHopk5wb1maWdUd5pO2Y
         YNHv/riU49TJAki6N7dksnrczzrs9h819FFnfN39GvsFFso44zatAIY7kq9LP60+GcR4
         NKfe+lF+POY26TE+bYbGX3/pRxBaXFOt090BqTrbIKP63INqSE5VmpoqKQ1ODMpCij4l
         kUfIaTgXj+AhgUzdYibgPIHKXckbjxkmJzs0hs5xtLFKMyfUKzVJoC/hcMt48ZPE0ofS
         6HMU8fS2fBqphs4BWzlbCHKDsud96h2Hi5B74AWp9kou0DnS4o0BXvzSRcW+xmKgqSEa
         JZRA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Fp5KPc9OAxGYyUYMyG7lM2YvsTYzy99n2rG/UZlFS7c2bFLSZtG5SFGJdl8PTbGiswk/miJMeIL5TWRjjMO+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk6cTt8X2LVLzj8lHU0HftFsFj3Iy4NgRP2Gl+dHecKUpXJUDk
	LF2pNSMrF7HsK0390gSId6efM9hlqH/HxgG4SrUo23c/se0b4rV8Ub9M
X-Gm-Gg: AfdE7cnVK9TjaC69+7ZxC3YbGUGY+bGKI/aw7zgY2bU24eOQqppgUHTZeYs5lpzG1IM
	lVUnlrNn3M1mMGk0SSTgighaiR7eu96gDxTmRIUitoTfZxE3Ea8INTRA7YQSMUKgmLM9oQ6hTvd
	5RFn3if8uF2DbkkuUkSUMA02YYbceaXnBHatEjwzyn6zIDkd0npivj52Di9kx3+yi8JlSRVDoT2
	4sgGk7NIsmXbYIThs+eV3D+Mgq5k7yeHWAkm15ajXXdxpTLvfJQkIElEGgkqogiUNLLloxthEFp
	f6vpZBILsRY9DS6I9dKd6NdTJA/e+Wu7NcO/K3v6yCmtqWFRDem3UXQAZ47kMP+00X9GnUJcZ8I
	YxKc6J820AUsNi1yQhaTS7wRAYdwFv/HaPbmb/UkC8alk89LCjGWiTWDX3THHE8r0KFPkfB2RTl
	f/4YlD1zpePiHJN/GFr8pBaQ==
X-Received: by 2002:a17:903:f83:b0:2bd:de3c:a026 with SMTP id d9443c01a7336-2c7fc88e7eemr11096765ad.4.1782387057367;
        Thu, 25 Jun 2026 04:30:57 -0700 (PDT)
Received: from localhost.localdomain ([189.1.242.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ae4c55sm19047555ad.19.2026.06.25.04.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:30:57 -0700 (PDT)
From: Yiqi Sun <sunyiqixm@gmail.com>
To: catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	rmk+kernel@armlinux.org.uk,
	ruanjinjie@huawei.com,
	will@kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: use live x0 for seccomp and audit after ptrace
Date: Thu, 25 Jun 2026 19:30:48 +0800
Message-Id: <20260625113048.301119-1-sunyiqixm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2f435bab0d61d0bf8fbaa54203525aae8e8f5371.1782384161.git.sunyiqixm@gmail.com>
References: <2f435bab0d61d0bf8fbaa54203525aae8e8f5371.1782384161.git.sunyiqixm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_043058_675642_635E3499 
X-CRM114-Status: UNSURE (   7.30  )
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

On Thu, Jun 25, 2026 at 07:11:39PM +0800, Yiqi Sun wrote:
> [PATCH v2] arm64: ptrace: use live x0 for seccomp and audit after ptrace

Sorry, this patch was sent twice by mistake.
Please ignore this duplicate copy.

