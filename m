Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7C3E937EE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 19:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkCvOE+Re08tASG8JqNKn3T7DgKa1qoj+KXUNGulB4U=; b=B3rGSD9V1OgNfRbEEOFZIa3BsF
	DJaHciaPRu5N5VysIe5EVnAcVY7VZeJx9QN1L0Vr3gjQYhIOBw1pGXwFumRtR7jVLkPz5I+ASqNUO
	0w+rZZvxfOrXkEMxnvH0KnNg8Zm58jr0VYXxbzDMKh/2w/ZbaN2HbLnsT6GcCgLVxpcXt6Jh0dN18
	h8JNYUhLZAtjvYC3+UeDHg4ju3QDc7YRw4Jca5pwXLB2p2NXC7otyHR+ptaVu8wD23aazCKLcdufM
	VHOdlixMGW2Q+duBHhVGv/mZpcYW8C1wwy9QNqLQoe8pLWGMzLbJoiBSArsClvHzfo4Y8kY9aD3Lr
	D27j3Txg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC0Di-0000000EcRv-2mvx;
	Sun, 12 Apr 2026 19:11:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC0Dg-0000000EcRc-1nLX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 19:11:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB07041667;
	Sun, 12 Apr 2026 19:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E8EC19424;
	Sun, 12 Apr 2026 19:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776021100;
	bh=gGbgSScs/6yv2loBTaqcJB4wn8HJrACyqH6/wGBf4zs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TapbgaO3aoJbvTDU1En7fURsF9LQBe0h7ueajoMOXDRR2HUncnR91tr6nm8yzE5JY
	 +didJhAwaIXjYrFlnhbxTNKBAN96mMelVPIzO2ZEUTwi7Hv+/1yAcOv0YLcgDEQCbm
	 W+C1gaBgciMdhnmfDKgHKL5D00G7fqS8NBXxu0+3kkxqUdLfw0+eLDROne8UO8pSdF
	 7mKt3wgpKKR+GwvPO3hgbQP/JpOxNRJa3Cw3KG994Sfx/4gTf+ShHSptJDoz3qCkvd
	 hlkpKGShB/7Dgx0OWzAH6UvUw8dnfvi9iHlxDY0Sp7GklnM8m0Wm0moQ/nRWvnveyK
	 cuJLRrfIBRAQw==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mark Rutland <mark.rutland@arm.com>, 
 Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260410-perf_support_arm_spev1-3-v6-0-3c6f2dfe2cd3@arm.com>
References: <20260410-perf_support_arm_spev1-3-v6-0-3c6f2dfe2cd3@arm.com>
Subject: Re: [PATCH v6 0/4] perf arm_spe: Extend SIMD operations
Message-Id: <177602110030.3380326.16901438429651843791.b4-ty@kernel.org>
Date: Sun, 12 Apr 2026 12:11:40 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_121144_493027_CB8B4B82 
X-CRM114-Status: UNSURE (   6.92  )
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

On Fri, 10 Apr 2026 08:36:57 +0100, Leo Yan wrote:
> This series extends SIMD flag for Arm SPE and updated the document.
> 
> This version is rebased onto the latest perf-tools-next branch.
> 
> 
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



