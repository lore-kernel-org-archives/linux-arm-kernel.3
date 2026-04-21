Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448CEF8FA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 12:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ScVA2bwJOy8OvwjWYCQxCUEecGoc3oRzhgbFlolgLM=; b=pxod9ni7p88qct/CFU8lzoJvX3
	2eqH7Y7Ld7kNRj3fPB4/SVWhiJQU1RWYefQp8SN87HodXngOCBWQhFnQ8nCmyR7QqTP3ue0XbySbg
	/hEgkZjH8ZQ9okrMFxUISFEVSHh/R55TIz/npYxHW8DGILfWz1VmBDyLuC1LhfQIwN5uUgPAe90K+
	XEfcvIClNomY9tMIfN8DJxro0/ImsU+YGOO6dx/JAgyeZ8hWJs9MAsRxQGlf/OyuPLVXSMEokvQrx
	fd9KCOdJqcxMRvMyMNKrMoF2RPtn6qt/NNRSh4DG0snHUH2eY+irrh+RPbef0fniAWQXCbe5IdFMI
	aBZqex6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAb7-00000008cCN-1jLq;
	Tue, 21 Apr 2026 12:53:01 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAb4-00000008cC2-1T1p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 12:53:00 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-40f1ffba6a0so2744546fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 05:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1776775976; x=1777380776; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ScVA2bwJOy8OvwjWYCQxCUEecGoc3oRzhgbFlolgLM=;
        b=dRgGWSyNDUOYkGbGJG7pj8i4Hsc+NPo6skpTnvXHfKLt5HBaGPqonQ8dMXLPFZG8B4
         QwF46DppGSlOJ76dNufxhNFeCeoKY9LYUaoKdRKDjpEiC+ErswZTTOY9jhQT6QM3i5cv
         UVYvwLUQLTNF2EzHtUySgXVtZkokZH11NADiAQBejKOeZg4Oi8QUQcrmOapgAeqwtJnq
         Dnin0N98gUNviEHy/8bQ4dmzBoVCvv7hvWDwvmTyvm3hfytx/q1osRdaR92yo8ntkRPE
         PRolayVyxwTF8QCRu1/HLH4+EFnf+/T6U8DsaAsF8EGdNmQB1OHzSG30BYAquJrD6gCY
         kNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776775976; x=1777380776;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ScVA2bwJOy8OvwjWYCQxCUEecGoc3oRzhgbFlolgLM=;
        b=poBD6cvDB54hmETuUzdPb/y0fRF6J3+OU3I6yoYQH+m4YYbx+ARauZ/DgXrRTbccIS
         Tc50BWfxTMXOZqjlIsPWYcsKXBnSYW7jsqzwa1lufy0y1JgFvmoutzKTQc20Ud9Box7J
         5l1ztjDEFtbdQbgOzix+KAuHohLPo57ulFP8GI0r5FH8H2gNeTNobcfuM5s6Ux7obt3s
         Pv8hzQpf7Uau3Yg6S49mK7K0v7ZPy+AOtcoSxt/it1rZDHHNdEZDtCMy2dafjHERyvSR
         Vv3YtmwkIPryMncsaFlPieeYAYaD7048cCG42A1xirbnMpTqhVB3CWAbCb6+iwSfDXv8
         nDpQ==
X-Gm-Message-State: AOJu0Yx/HNyTVy9BOOXRLW+jYsdv8d4B5aqrjsNKv2qIiAKEIUe4ETvD
	7KxAOaHjU+YtuxoWJZjIw2FmDbBxEKLlxuWslgqMfO/qgsPS15IjC9xSDxVs+OHTdEsXl7HZMcC
	S3p4d/N0=
X-Gm-Gg: AeBDieu7Ww0ix+400HxVv1p/3wWsbgLPjJ6QjBao9ITKNLbYh4F8VYgDsonIodQDLPZ
	smqcwwG2S3SB0a7wgQa53FqVhP1yGpVM6PoTPKrve9mB0Db2xyt/FOW+ChDR0zIYUhAH4d6ppeG
	HiCxhcEZ43S+ywWPSCM8ro2VCl7ur2TAD+Y1SIQnzq3ceCHhVdYff7Xp1vb+70kXpBaNOvh5ORJ
	9WeWj6IIGgik6xYeFP7lwqdMv8UdS5RNMlRg6Fbi3Lg5vwkqNDbLf4qDR8293dUTExFC6pRQUG/
	+6439YBYZ5HTKfkK2KaPhCnmc3ZENc39bPWRTdhaGydbD/e0mfDsxxz9NCZLluHz3Ac4ouXduH9
	1TCopaGKXk44E2sEQESLXgudLbJhcg+LxlXCaH+zXy/gxxW/wfGY9ZOjjv04rfaMfirPl4DcXyR
	Ceyr1rqUn/t6c+CcmtEcXmUfwX+N6njggDZWuH8HAln2/5D7HzhZcJdhrjO68WI5LT+VLE6XmK6
	zR3ZJKoyCmGFlNirbt/4riR0mvkvHs=
X-Received: by 2002:a05:6870:b2d5:b0:41c:25b1:930f with SMTP id 586e51a60fabf-42aded0a4ffmr10918279fac.19.1776775976630;
        Tue, 21 Apr 2026 05:52:56 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b8fe2c52bsm11614475fac.0.2026.04.21.05.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 05:52:56 -0700 (PDT)
Message-ID: <52fb2e8f-3e1c-4cf5-a02a-0d68beedd18b@kernel.dk>
Date: Tue, 21 Apr 2026 06:52:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: kernel-hwcap.h change causing full kernel rebuilds
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_055258_650828_EAEBD7F0 
X-CRM114-Status: UNSURE (   8.43  )
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

Hi,

Maybe this has already been reported, but a quick search on lore did
not find anything. So here goes... After commit:

commit abed23c3c44f565dc812563ac015be70dd61e97b
Author: Mark Brown <broonie@kernel.org>
Date:   Mon Mar 2 22:53:16 2026 +0000

    arm64/hwcap: Generate the KERNEL_HWCAP_ definitions for the hwcaps

arch/arm64/include/generated/asm/kernel-hwcap.h is generated for
_every build_, which means that you can literally run make back to back
without _any_ source changes and you are rewarded with a full kernel
rebuild. Not sure how this ever got past any kind of testing, because
it's very noticeable.

For now I've reverted this change locally as any kind of testing now
kicks off a full build, when a single file rebuild is all that is
needed.

-- 
Jens Axboe



