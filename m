Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394CCD29FB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 19:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhEbYRFwhB3VoDDrXcrTp2+vaWz+Fzhf2qdsF3+APrI=; b=D8cT4Tvh7EcBuz+fZ/0fMWxWNa
	EplO8iq4yHQV4PZ19g7sfZ6kpy5VzNT9nBny0LlLYRR0hbAsygVTZnb3jNwM9LeUmVlmY9B/Ff4ry
	1QA7MbQD6kZL9YSGYeMgJRNEUzZY+rvaeW+FF4t9J3aGg8yfAFrTnRdttYJuLcyVWpLqvcUVFBu0K
	9e3qzINOi99WKzo4nNbtjqE/GOJx5h5KUQmx3GNFofbuQmIddSFJ1zzTfGQhZw7bLLd+XaXq7+01O
	IAWo6FTgiHjVuUvT107aw39w+a0MTSXkrl4VX6elfv2KrRDpoULc0AeZZnrfnvxatPmQArviGoqhW
	Am7c9ZCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vREjH-00000008UF8-0Ji8;
	Thu, 04 Dec 2025 19:11:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vREj6-00000008UDy-37AK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 19:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C5DFA440C1;
	Thu,  4 Dec 2025 19:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4950C16AAE;
	Thu,  4 Dec 2025 19:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764875446;
	bh=I48PDz0RhPoBY/algdOFF+TPb6qdaIPNpJJyzHAE0IY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zc0Vmmy9o+QOcoEz5uFdnKe/9P6HU98xvoP7pOzN3Yz6cn3KL6FTl1RLrQ5TW6Il2
	 OUPvISnZw9ILRtJjau+6eeZWFIkSvYXMnBfDdkpQe4j8xyIe5+wexE4/JJy2jdTqpq
	 nFoPMFyKPzSHwERzzRfR/LAaiZA2KedhbX0MNs/RSld4+M7VmPB5eybIwtIE2D6b+X
	 LktsnNUwi9tmcUUB66nU/rPXvo3vTrIfegiXRXeVnCZhWms+JqSOD9V4F80g23JaDN
	 TL9XNbIJY/rxWJ9Vij3lj3BICl6nwbW3BL8BtHDHXLjVbr0LMTGTT93NFcof8B8FB2
	 P6WD5YVy6LYwA==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 James Clark <james.clark@linaro.org>, Ian Rogers <irogers@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
 Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org
In-Reply-To: <20251113-perf_arm_spe_update_midr_list-v2-1-d547768f5520@arm.com>
References: <20251113-perf_arm_spe_update_midr_list-v2-1-d547768f5520@arm.com>
Subject: Re: [PATCH v2] perf arm_spe: Add CPU variants supporting common
 data source packet
Message-Id: <176487544583.182574.10220163589833287696.b4-ty@kernel.org>
Date: Thu, 04 Dec 2025 11:10:45 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_111052_806097_5456EDB4 
X-CRM114-Status: UNSURE (   6.48  )
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

On Thu, 13 Nov 2025 10:57:39 +0000, Leo Yan wrote:
> Add the following CPU variants to the list for data source decoding:
> 
>   - Cortex-A715 [1]
>   - Cortex-A78C [2]
>   - Cortex-X1 [3]
>   - Cortex-X4 [4]
>   - Neoverse V3 [5]
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



