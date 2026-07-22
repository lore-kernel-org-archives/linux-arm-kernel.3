Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DCFC44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HQRXDYmfcMi0mg0rXCEwcS43+FjhTVzFh1WHpcJ8v8=; b=k2sjcPv/RJtGVkWll7L8PL3ChI
	y45wwvDGbW1OlI/YpAyfOWityVHRTXry5rJnkKnPM7ScejLk4g44ERu6YCWw53EoZEBcwitHoIjQJ
	JR7UYk9BLhQpwfZeGLVKGNfHifmZS8+SEAH3moltt5yor2Ts1n1w7L+wzrC/5Pzm25wUI1TemI0WI
	o0n58dTTNuogE9d5J1SIHgU1RMP9604vIss73ZACZ/AF3R9gB5KytjXY6wkBBSPLiHy0BYWlTgH6L
	SWXTTyOC0gcJUhrEfNt+MQOCpZ0LQ5s/yt/CJOba++V5uO1DqjBrTORHLbIAz3vvm+/ULQ9iI3LdL
	U8wxEpFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSEy-0000000BEYi-0nQ1;
	Wed, 22 Jul 2026 08:23:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSEw-0000000BEXk-2gJq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:23:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 68D2241351;
	Wed, 22 Jul 2026 08:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0E51F000E9;
	Wed, 22 Jul 2026 08:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784708622;
	bh=2HQRXDYmfcMi0mg0rXCEwcS43+FjhTVzFh1WHpcJ8v8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MPWRaPFxhRjkVElc+W5o308lLNxP5Ys6kO5p9kB1VEmTysf8gS8Hn3bT+nQbcEo8A
	 sFQTMu6ojHLBdafrhZWH97OxKFJF0+LRFcYDiUqEYh0fudPyZ7dOCR881nxuiuT/cx
	 5xasg0pgOh/ikVXebVWbsnqTflE0u7HjA6fm8eRreBKcLKKU+qF/2JScNkBkKZblig
	 6oOZDhmEruw6RJXeHbQH+/iCBJyw8UDPbxfir0N9jGvazRR+Bs5QEmtNvKqkdOAQW9
	 IBipSd+u8ZWiAByNHZlwOCCNa+LyaxHkUoV0zgMZfFaQDV5AyZbBEaBgp/5ucX7qo/
	 OhXqNkqEZwbpw==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	zeev@amazon.com,
	blakgeof@amazon.com,
	avivb@amazon.com,
	ilkka@os.amperecomputing.com
Subject: Re: [PATCH v6 0/2] perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5
Date: Wed, 22 Jul 2026 09:23:23 +0100
Message-ID: <178466981527.100304.690835278646398901.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782824005.git.robin.murphy@arm.com>
References: <cover.1782824005.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 30 Jun 2026 14:01:16 +0100, Robin Murphy wrote:
> v5: lore.kernel.org/r/20260603150025.30980-1-avivb@amazon.com
> 
> Hi all,
> 
> I'm reposting Aviv's series partly for visibility, since the previous
> versions were buried in a thread, but also to respin patch #1 - Aviv had
> fixed up the bugs in my initial draft, but I also get reports against the
> original commit on my branch, so I ended up taking a second look, and
> deciding the improvement was worthwhile.
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/2] perf/arm-cmn: Move DTM index data out of hw_perf_event
      https://git.kernel.org/arm64/c/56603c28d916
[2/2] perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5
      https://git.kernel.org/arm64/c/9d0b1714e1af

If you get a chance, please can you take a look at Sashiko's comment on
the second patch? It said something similar on Aviv's v5:

  https://sashiko.dev/#/patchset/cover.1782824005.git.robin.murphy@arm.com

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

