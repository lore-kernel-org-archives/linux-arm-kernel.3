Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C36CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Niw++E/3HBnaCkx4o+VI5DBHvskXLqB6ZBKTyJpxMkM=; b=1JsdjxvZah+dnlwTi46P5oU8S/
	RJTTuJeNsA8uJQpg1kbV5Wg510/sectbo82gmB5q7fXV67r52WOHURZQXBeK9g8vr5aYDgEnLHqc7
	CFb2YJrRZ+yJ+vqU01joCs7mRvTIZD1zZJIkvQa5TIfht4Uv2hlgVNdkPUtoUDz24GfKS/YbchvsA
	8xcxE8MNBrnY5D4kChlWhiC4Zu5pi7Hc7UDubE9yB2tu5iKiIhn8FNZxHudwrmKUz3ye/n89IOxz0
	xRph0yEKLuuTJtEbeYbsCgQNNLw6f7hv3SKn0QD7UGIZJD5cwZCF/zjZdx4KVHoIxrXAevjzzXTok
	wOYm96Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSE4P-00000004AB4-2t1R;
	Wed, 27 May 2026 13:13:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSE4M-00000004AAW-23j9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:13:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 015A844602;
	Wed, 27 May 2026 13:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79391F000E9;
	Wed, 27 May 2026 13:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887589;
	bh=Niw++E/3HBnaCkx4o+VI5DBHvskXLqB6ZBKTyJpxMkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KNHyq9kTC8JAbquYl7oHKMIvHVW4edX68G1uinaEO/07PW05DZJujqWyMY5a/xNom
	 e7APg4VDv2Oj1v62z19f+YT/V6B+nFji/fQ4pvIHZvmZqy+2nhyrdD9Rz4fsF+qpwC
	 i/MgrU+gzfDzaHScBAle62TavDqwepSYsucfNLGILYZ6OYllcktjc1I/oMVYzcafzO
	 arzs3uXLzXRh17Xk95yu3GGgsv/Zldj/pcOZIlG+PFcjnaZsRW1TsitQKVU+EbUjaU
	 qY2hm53TDVyJf4v6XHDHYbA1eL8lwhT/pXN07JDFpqoA7w+GMhNnQkZTX+PvUur0BL
	 VgAiXViBZlKXA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wSE4J-00000006gdv-4AQ9;
	Wed, 27 May 2026 13:13:08 +0000
From: Marc Zyngier <maz@kernel.org>
To: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	Oliver Upton <oupton@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kernel-team@android.com
Subject: Re: [PATCH v2 0/3] Fixes for hyp_trace.c
Date: Wed, 27 May 2026 14:13:05 +0100
Message-ID: <177988756841.1513623.7911406206293058821.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521124613.911067-1-vdonnefort@google.com>
References: <20260521124613.911067-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, oupton@kernel.org, vdonnefort@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_061311_300279_074FF9B9 
X-CRM114-Status: GOOD (  10.31  )
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

On Thu, 21 May 2026 13:46:10 +0100, Vincent Donnefort wrote:
> While reviewing my v1, Sashiko found a couple of issues with the error path and
> more annoyingly a memory leak which I originally missed as the allocated
> decriptor isn't tracked by kmemleak.
> 
> Changes since v2:
> 
>   - Fix rollback in hyp_trace_buffer_share_hyp()
>   - Fix memory leak in hyp_trace_unload()
> 
> [...]

Applied to fixes, thanks!

[1/3] KVM: arm64: Fix meta-page unsharing in pKVM hyp tracing
      commit: 0f7abb6eaa3c3965f925e231c18409dac4f5a0c1
[2/3] KVM: arm64: Fix rollback in hyp_trace_buffer_share_hyp()
      commit: a23780ea9db3f3cadbb52ff6151384bff89d95d2
[3/3] KVM: arm64: Fix memory leak in hyp_trace_unload()
      commit: adae9996c04fea3b1791099b6d79e1df76d50849

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



