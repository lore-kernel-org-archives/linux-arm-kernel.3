Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD361D49C93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udwMQAgZ6jv4V+oOZ3ErBExViZeyAPr7A/wDSO/ChFU=; b=jvD+Fz3Tn70d/mgm+aFsr/7m4g
	Ev5uhpN58cL5S+Eir/TFepweswIguDJYlwgQUY4Waqi8Xev26o5cF3A4VWvpT5C5MNtz+rolFCXj2
	ONFxNd3LGT+Yb4Gy5zAmdST/A0uoYpD8PV9Wiv7cxNSntDAaMAMYqvp6t1OY/ktXcS7iUzWT0naoh
	kBDzYCZZa2/s3cYPXhYSdduvovPU5g222nt/zspdLZPe/oSX3ta3XKq8iroMivVifinUSSMCAQVDh
	I9C7buzvCeJ//XfUYwkE7Sd0DZ0YORheDfZcpJCN73WFwrtiYd3D4OChVWMcbzRN3RJJ/SSmtN59G
	K0Syfypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllIV-00000001I15-0FRx;
	Fri, 30 Jan 2026 10:00:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllIS-00000001I0U-0jbp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 10:00:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F4A140888;
	Fri, 30 Jan 2026 10:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54057C4CEF7;
	Fri, 30 Jan 2026 10:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769767211;
	bh=n560YUW918HfytFqlbMcXwZThFp5BeKFVRQ7nLTXFfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cna2S/7l9k/UfECX1DGp6+UN9yxW/9XqF9nNMp5BEaseIxRGacLYszWqKMJivll23
	 oKlWWpD5xFwkWHTKbxXT19sHSaEHuUjZOpCWRtC3S1kRAG1+6Xo7pUaLdtgQt/j6/m
	 WnBGjGah9affdj1AuPpZ+sVJxGrQKm68DNFk/XaY24sXXk/+iq3AggRKpKECMUP8Cy
	 /grOBaAMuSwEVhXBxuK3Jf/7DJINQXf59zVXPvPrRvTNObZt/QCKn3INyUTkMRLUk7
	 yWgH+Ha9BS3knDJpVKGX6meTbYjhmSA9OoQlaMT0npM7TIgsKvCLUisbdiSCoP4Oij
	 68x2xp68OPHfQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vllIO-000000071Qk-3Cqw;
	Fri, 30 Jan 2026 10:00:08 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Cc: oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	wanghaibin.wang@huawei.com
Subject: Re: [PATCH] KVM: arm64: nv: Add trap config for DBGWCR<15>_EL1
Date: Fri, 30 Jan 2026 10:00:05 +0000
Message-ID: <176976718623.2311376.10358603736006188355.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260130094435.39942-1-zenghui.yu@linux.dev>
References: <20260130094435.39942-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, zenghui.yu@linux.dev, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, wanghaibin.wang@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_020012_260027_1CCBA9E0 
X-CRM114-Status: UNSURE (   7.82  )
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

On Fri, 30 Jan 2026 17:44:35 +0800, Zenghui Yu wrote:
> Seems that it was missed when MDCR_EL2 was first added to the trap
> forwarding infrastructure. Add it back.
> 
> 

Applied to next, thanks!

[1/1] KVM: arm64: nv: Add trap config for DBGWCR<15>_EL1
      commit: 9d46e83a72392a644604458448a72d7c45977f0f

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



