Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86934E6F072
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=206fv6A1IVEoQafgBksKktgLETtYeFKOiuT5tmuiHPA=; b=5FXDdzA+s/w8KxMOf3DRLIlk4S
	4CLGVeyrlKFWNuFH2XpZ2s6zps5RyMS6FjTxh4FO78LVFpM7G/Ea1psN+qP9RPfin++cdapFph1cM
	f94geo66u5ne8gGVgFCfpYQP9W8rDPgiEUFE4EHQCXS+7A1nnGYvjm7IwQQHlbtMlO0LQsl9Ic+2X
	tJQZeul2CY99K8lbSbH99JtpTjwTPzyWzE+tqoDoGVtOK8ettxGTrjVRPS3J+DfkI+oEA6pBS+kL2
	LMgR5uQ/Uteo4xNroawT1rX87KkSV2nKMqK7l8Sbnx153mWxSI39S6Mn+yj/KvxCQLGlbVopjXYbW
	BnJO6Hbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vYC-00000007r7R-37r0;
	Fri, 01 Nov 2024 17:35:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vTl-00000007qYY-2BRx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 17:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E61415C51A8;
	Fri,  1 Nov 2024 17:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F422BC4CECD;
	Fri,  1 Nov 2024 17:30:30 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Use ksft_perror() to log MTE failures
Date: Fri,  1 Nov 2024 17:30:28 +0000
Message-Id: <173048220452.1105699.13506806837234605292.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241029-arm64-mte-test-logging-v1-1-a128e732e36e@kernel.org>
References: <20241029-arm64-mte-test-logging-v1-1-a128e732e36e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_103033_688685_A5C1841C 
X-CRM114-Status: UNSURE (   8.32  )
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

On Tue, 29 Oct 2024 12:34:21 +0000, Mark Brown wrote:
> The logging in the allocation helpers variously uses ksft_print_msg() with
> very intermittent logging of errno and perror() (which won't produce KTAP
> conformant output) when logging the result of API calls that set errno.
> Standardise on using the ksft_perror() helper in these cases so that more
> information is available should the tests fail.
> 
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: Use ksft_perror() to log MTE failures
      https://git.kernel.org/arm64/c/17a2409783f1

-- 
Catalin


