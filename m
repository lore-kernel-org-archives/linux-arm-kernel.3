Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BADCF31AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 11:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vineHjOObaIMcL8ueO30qXeEV4SGACkfHNBKabrPU9Q=; b=SA9972P9j4tYwKry7vwYB2qAwd
	PcloqofgZIMtVO0qHHCniQ8v5vsbJW+T3gVqp2NNWI5PgsRBwDxWe6kvoXcCMbyeZdi8n/Ch6t+sy
	PXnm7CEWZ96mjv5jNAlEfSfoDuWVOkF32jgvPP5t509l3JgIFODtymhqDOTEL1OoYPc74NDdqkVCN
	9jFW42L7dcoOM8LClR6//3NQan5T4IMqwYbTcbjlz8Yf1XuU7t/CP6PIMJJcBcUabEryp/B6bNTsQ
	u4LXXWE49rXpCDS/e0PzvQBjFQvhCy+QFMpoi+wb716c2OfyHZx9ytQYZYvddgXIfB70eWDUrSB9+
	E2oN3hlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgYY-000000033QD-0sOB;
	Wed, 19 Nov 2025 11:41:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgYX-000000033Pd-1UvL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 11:41:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C075F60167;
	Wed, 19 Nov 2025 11:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0C8C2BCC7;
	Wed, 19 Nov 2025 11:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763552460;
	bh=iaVK1qlAbnEZWWMS3zhV7Y2UWW4qjvNMuSBwsQzHeSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NDPjxgPM8nHuK7/zeErqermawLozos3cqKBL8jTZjntFLwgse6NRDzyf8YT30rLrv
	 ADSJvzdBJruqg0xRR9QBpnDR1Zq3yvfYJ+sImCMncw8XuyXKvJMoxVQP3uLufBZL5I
	 flY+6cCcWWTcLysdg9SZlWE8/pPFYr/GoXZwA7K0dor1/klz698ecUlSKTusNvX7RQ
	 4z557Y+GcE99IOxRmY8jTMxB5AM/MySI/RDWZJatKCwq8IgsuPy5h51CSbUfsIp5Ma
	 XpVsF6grZvlvR6csmfDCWNSug0E/nOB8Tkwl64481gMfpgIwdQ+k00T0b8HbYfc9r7
	 +u66OFCo6mE3Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com, 
 sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 cw00.choi@samsung.com, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, smn1196@coasia.com, linux-arm-kernel@axis.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com, 
 bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com, 
 lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com
In-Reply-To: <20251029130731.51305-5-ravi.patel@samsung.com>
References: <20251029130731.51305-1-ravi.patel@samsung.com>
 <CGME20251029130912epcas5p2f6596fefe3fe5513958b8209e78fa2c6@epcas5p2.samsung.com>
 <20251029130731.51305-5-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 4/4] dt-bindings: samsung: exynos-pmu: Add
 compatible for ARTPEC-9 SoC
Message-Id: <176355245287.116968.16322635190742464226.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 12:40:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Wed, 29 Oct 2025 18:37:31 +0530, Ravi Patel wrote:
> Add Axis ARTPEC-9 pmu compatible to the bindings documentation.
> It reuses the older samsung,exynos7-pmu design.
> 
> 

Applied, thanks!

[4/4] dt-bindings: samsung: exynos-pmu: Add compatible for ARTPEC-9 SoC
      https://git.kernel.org/krzk/linux/c/dfb59d7319915926a5606ffbccdb924b09f08cdb

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


