Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460F5C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Jh9YwKMSnQM3tAKjwVqWhn34D0cgvjhP0P8CvPoS7E=; b=r0/CxgMwpN34E0Unw6me/5aH4b
	UnkpVk8fPY/p6NpfIG3IzXDqVeLdhhHFrnIua994HmYFGkDLDpuRut7ZYjCmY3TmEYaYOw4BuccRR
	1YUB3jQlA+FIrKT9v+HRkFZO3wWvKpAdN68L6C6p++dGg+KdIIn1b9USnYIphJN0SqvDbmq9Yw4RE
	X6rObRAmyF3IqaVkwonv0Eb8BYc5pG26DBbeOkbZ3kGTFeZ8+6qzGpSIRi5TQDvqnfctWzaU9kI7J
	rwAY5/DrbPUV7zUqCIP4J+msH1WBa7oCJMjEbvfG9+bA7Rj6cBT8yD8ip2LS5PP3nz4yp/zbPDkYx
	s2r9ITfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2QCk-00000001X9f-3ZQ8;
	Fri, 04 Sep 2026 09:27:26 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2QCh-00000001X8g-0I1T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 09:27:24 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso713725a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 02:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788514042; x=1789118842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Jh9YwKMSnQM3tAKjwVqWhn34D0cgvjhP0P8CvPoS7E=;
        b=sIbqhIo9ZbYcS+JV9T57Mo3tCAe2z2n/9izE1W+ly/8aAWR5JE4qvEXLklg0qAceEP
         oeDefggdFcrmaEwHfHgFx31XpWgSzuZ+JNrJkV4K3ZNUgPAnp2AocjfjJLVJ9Cr74vFe
         +NOdVBlpXFfX4SK8b0iGSqPCOOEZpVbQ/OkTr1Ia5sEoTRz0mOQvlf7qsBGPckesFz5w
         Ck9k2vD2s+wZUNMtCZ6Ul8wbwn+GHkO0YUiIouV2WzofxRAcdGl5yy+pXm3drepio9xs
         nErtf4MkPWcjFpn7li+Q0TZz111FKPnZJ24Px/mul/yzq6lJUtSqG4z4HsLKHsA0e7U4
         l3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788514042; x=1789118842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Jh9YwKMSnQM3tAKjwVqWhn34D0cgvjhP0P8CvPoS7E=;
        b=sLzIrBQ2kiO/ipHlyBJDw4RMAjsU6eyM9toxdqAkj5TbS8aj2/xZ7hUmGAF3iP87sH
         46FzozCWOuB0p86rRq0VIZf+nCmJySRe4ncDhs6Xsp5LRzvo/WPkIZaIaOhFTu9IcTWk
         LYJnJz7CeT8liTKe4RgneYt7oR+cVK9s01Nl5lFd+Gh/MUa5/3HFFfUUF7EH5KWO+0wS
         XeN6CEh033iBkToi8HLEuhGi8Ga1heftporgMI09G+7CkVF5o1QCVqx5qB6R9mRxmvJS
         zioyZ+ZgktYi7/Gc0FLkrgKmOyiIzyYoWRxawQCZg374Mnu84MtQTqX9dqgqyPIrD5Ns
         KG2g==
X-Forwarded-Encrypted: i=1; AKwUvBwTIj112YqROD8nBbyWQcHleYTIyzQ2rEC2eBf5u0+BZYft4sU3TgxHRarJ3Gxq1cF8fPIz6YKbkz65mSoFqVZs@lists.infradead.org
X-Gm-Message-State: AFuF++mNFfLFz80WKAaLD7CJ2u76bmztxpJQy+qCBTZKEVechFRyjn9u
	ZUS74Cn7VEto9YnI9FxxxW33TDZbW3qGqJe1D83HepXHEL9G+4F/mr8=
X-Gm-Gg: AYBFou2icS9CKIbo5TI2ByX0NHI2xG1pLbAZn96mW3T9tYRXB6Yk3d0myNUsY34vFYp
	VPSPdPg5asPu0EN7IGqoUjvlszAUbii0WJQ1pyGDHOXRoiZUcges9OQGdqwVLAZiXl6NI1DIpFq
	K68JVMzB7F/SKdj1EcAdZ03Mn2xa7LgLKTUBCM67vxxq7k4enHsYCV0IifjZWfk44A7u3X3ESI2
	WMsF/JmbfeKn7ECx47h6y5pneHbmf9Rehvt/Y0hAc1ILd7c5OyTVz41G0SK3GVZp8TyMVvLEH91
	J074czYRf88oM+Bto/WIWgBa6SSt4rNlK74FbmeniARK+jY0DE2+qixFKMSUHqAynRsrkA1c/ut
	ruqbDwCnVydAPeAU/TBNGuuOEitZsEnYwzmJwWjGwusKEXbSsz7zGstOoLXa4l26/brQRYoMAhr
	WhMC5XYoRUsaOdQxZfJdpYwGzZzajc3JZN187mGlUCD364XuWHt2I/Jcvz0yNkdM134+wbf9piq
	sxTl0upPg8IBpc=
X-Received: by 2002:a17:90a:10c9:b0:39b:34ef:3b2b with SMTP id 98e67ed59e1d1-39b34ef401dmr941098a91.14.1788514041803;
        Fri, 04 Sep 2026 02:27:21 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:646c:494:158f:c4ff:121b:b906])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm3518116a91.10.2026.09.04.02.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:27:21 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: bot+bpf-ci@kernel.org,
	ast@kernel.org,
	andrii@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	memxor@gmail.com,
	puranjay@kernel.org,
	xukuohai@huaweicloud.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	shuah@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	xukuohai@huawei.com,
	martin.lau@kernel.org,
	mason@kernel.org
Subject: Re: [PATCH bpf 2/2] selftests/bpf: cover the exception callback using its own BPF stack
Date: Fri,  4 Sep 2026 18:27:12 +0900
Message-ID: <20260904092712.10691-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6aec8f5c91db3edfd8becf6f41bcb33fda2cbea1bb894888cbcdab4579b0f086@mail.kernel.org>
References: <20260904070210.4163193-3-donggeunyoo.kernel@gmail.com> <6aec8f5c91db3edfd8becf6f41bcb33fda2cbea1bb894888cbcdab4579b0f086@mail.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_022723_107744_6419BD54 
X-CRM114-Status: UNSURE (   9.75  )
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

On Fri, Sep 04, 2026 at 08:09:36AM +0000, bot+bpf-ci@kernel.org wrote:
> This isn't a bug, but would 'u64' fit the surrounding declarations in this
> file a little better than '__u64' for the three new locals/globals?

Right, the rest of exceptions.c uses u64. I'll switch the three new
declarations. Holding the respin for now in case more feedback comes in.

