Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAF4C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijSP3IdW2jFgrVaxB1dX+pJFn9bKvd47Sxdf7jq7TwM=; b=zoJJEXr+mQ6rjUGa/HIrQ0Uyxn
	TixMQUq1varWZJadvomQNml0b7nP4P0dMEnOP5b/jvqPfpUs+S0lpUwz01VhJKhpFHHXf0OsgHBrY
	IBDxo5P/STuI3pC/aFMxC0JgtkdMgHMophlyhPeXulXK//lzrohE4iw3Z0g5h5YyMCF6UiG1d8obV
	cZ1F8/fGWlSqiwr7eKTKRriQdswKdy47qy12CSsnGs5wqzfsyMJJ0Z1cIlNEfNZc7onM1aOOn6Ol9
	ct+2V6Y3g3zR6T8RC+FMDf96f34v2wkVtl7cagly+m7xz0kEXscijL8P9Y7F6xi0ma7Rmf9Fbtixm
	tSRYepFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Qmr-0000000DQSb-2qco;
	Thu, 17 Apr 2025 15:04:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QDe-0000000DJMZ-3ykQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Apr 2025 14:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ijSP3IdW2jFgrVaxB1dX+pJFn9bKvd47Sxdf7jq7TwM=; b=GRmP2Jvs9k2YCM7cpBW2hpG1Nn
	8+3OsriEotFHXy0oNB1+wdeiH0oLAJFApjUPiHsDgLh4pP4+fHCAggv2sjFICHvzKiwo5sISG0Len
	tyDLQhpWceJlF+U1yi7T2RNbYRXXwvdv8IbsxM9cHSq2J2LW5IzpiO430LWjz3wo4RpQzO+d6Cf9p
	ezwGWbvTcleK88YtUHF1khRJv+TDqYhpwjYtYaZcB9yHicx8+gu+6afJ6+bbRW0uEybiIvsNhZ6j1
	oiawIkEar6IeNXlb7S2PGEXiIrrGV/jHz/VSnQaZRHbLMKD/BXceAvecwptjUJuCI/ojeWnzW7Xg7
	hjpVkuow==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5QDb-0000000AJEO-225S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:27:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 124C3A4B41C;
	Thu, 17 Apr 2025 14:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F17C4CEEA;
	Thu, 17 Apr 2025 14:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744900072;
	bh=OPly8D2XQu2bxfiyA5S6Ib+YauTHnSi9SxZQPh7ctz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rzrWfm7XoLjvVMKrTdk+TFsnQRA9SBfxaDwgJicMXGC2Xamdh3oUMB8EekTeP+Def
	 bcAKZidsE0o3QbxoxDd65oR2vAFnubxqdTkaDE/wonU2wz6jgwepX2ErJd1SaHtFKr
	 v6qQ2ueHfRXy0zJXSgbdbsmgyNpQ++Cnn4eGVedKZc7Av6B5OnGi/hCJSOvASeihcq
	 Ht8K6YqRCpbhPgDZ19cV4fsRPqCw/f6FQRxxX2Sov91ldWY0NLb35UJikxLkibkBLi
	 O2JxRYokwXR2is2t98A+nEacDNP2NrmuaIvzLihAM5yAyIfEb1+GjWq6c62HF/in4B
	 gfpBREDoFUw8w==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] perf: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 15:27:27 +0100
Message-Id: <174489653742.2697847.1079663986499485577.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250417074650.81561-1-krzysztof.kozlowski@linaro.org>
References: <20250417074650.81561-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_152755_737593_3654C8ED 
X-CRM114-Status: UNSURE (   6.98  )
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

On Thu, 17 Apr 2025 09:46:50 +0200, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of all
> drivers, but only allow to choose to compile them.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf: Do not enable by default during compile testing
      https://git.kernel.org/will/c/70cbcb2850ec

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

