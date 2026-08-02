Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54334C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 05:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxhMRZaTW3jvA16d0Id8N7tbILuRU61GurYOALobZfM=; b=0vMHEcaFmcqLP1gLr99exe+ktW
	3ZyFeF5sZ28/5dW/VtQG1fnz53lgJ14Poxe66XG5+dWa9DsNHM/tjwJktgomjJHK7hgSsjmyCDm0Y
	ERK5s8xhY4LRkCdxKaHGB9H9iB1x2eJqhS6JpYi/4b8NfXWOgK0zE15W0rFKhAu0bLBJJxKmNo3x9
	LVkX+AqbPXzQMoKF0/X6GafEc3q1YGHsWezwHOy6PyBXbX56nLg+1WFCJFo1+jMbObCnBQixov/MS
	QTthGtY3xmAqyTzWH3VyhQ9G1bq/xq3idKGJIzED7eXAB4qxvihiRkCHwto8nKI8G1I1wTFHmMi+B
	M+0AuY/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqP1v-0000000FNfv-2wRH;
	Sun, 02 Aug 2026 05:46:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqP1u-0000000FNfp-0SCY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 05:46:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 081E4419D7;
	Sun,  2 Aug 2026 05:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B54E1F00ACA;
	Sun,  2 Aug 2026 05:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785649592;
	bh=WxhMRZaTW3jvA16d0Id8N7tbILuRU61GurYOALobZfM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UpIwgUlj62DgCKqLWODGmUVytwPztj+oUaaCsPQtgForKx8/hb4RHrDRW/C5dCvqO
	 b3gU8g6Vt458clRa/HZ7eJzdVgW9oE/A0QzkCT3YOPZBQS+V01dOpADopxEjqJA8o1
	 5V7bHP1Xe9sb1qsCg+36y9AFP7Ev+fzVPYDvjINRQQW9mDHL7qzljgIio9hIdayc93
	 OrinNFLjV5wGvr5S26wwEkh220ttgoTl8UQo4ONaAajbmqcLwc4HsMLbDvzG0ns59H
	 gWFSpeKNtKqZ1Gf2qfXFd64llX9DCnE6TjwQQ+8vnIMRG0hF80xYuKIsarcsZQa9Wj
	 dkul43QeqBKDA==
From: Namhyung Kim <namhyung@kernel.org>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
 mathieu.desnoyers@efficios.com, corbet@lwn.net, skhan@linuxfoundation.org, 
 bhelgaas@google.com, yangyccccc@gmail.com, jic23@kernel.org, 
 john.g.garry@oracle.com, will@kernel.org, james.clark@linaro.org, 
 mike.leach@arm.com, leo.yan@linux.dev, peterz@infradead.org, 
 mingo@redhat.com, acme@kernel.org, mark.rutland@arm.com, 
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
 adrian.hunter@intel.com, wangyushan12@huawei.com, 
 Sizhe Liu <liusizhe5@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linuxarm@huawei.com, prime.zeng@hisilicon.com, 
 wuyifan50@huawei.com
In-Reply-To: <20260730062709.534139-1-liusizhe5@huawei.com>
References: <20260730062709.534139-1-liusizhe5@huawei.com>
Subject: Re: [PATCH v2 0/3] perf hisi-ptt: Fix TLP header parsing and
 naming
Message-Id: <178564959213.665203.10969359308974116817.b4-ty@kernel.org>
Date: Sat, 01 Aug 2026 22:46:32 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
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

On Thu, 30 Jul 2026 14:27:06 +0800, Sizhe Liu wrote:
> This series fixes bugs and issues in the hisi_ptt packet decoder that were
> introduced by commit 5e91e57e6809 ("perf auxtrace arm64: Add support
> for parsing HiSilicon PCIe Trace packet").
> 
> Patch 1: Bugfix:
> The DW0 bit-field layout of the hisi_ptt_4dw union does not match
> the actual little-endian memory ordering, so the extracted
> Format/Type/T9/T8/TH/SO/Length/Time fields are wrong.
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



