Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566C7FEE4C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 14:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3oEcZ87YdJD9H6EtCXI+3siTA5Vf1f0vkHE6sVlLYk=; b=2gb6y7jmW+PgpBUD3u+DaZqTYj
	YYoI9PrhMkg81npaqqbj5ThcWLnAV1Sati6YsAfxbJgY1TKqN2rW+oMWCFT306/rFpHaWIHRREtE4
	33/h5qBhjKWlNmdznz/eisZ/q+qo66JFwS87/M0PcQhEs7U7rG7d6GQMcYwbNuQOGAdBx4ZDHZ1aE
	fyeE2AwPDf4k3GQHxi1+cZOEp9AxfAYkYYO8psZanXdrwSXfLppacl2epMLlZ9GhrcZv0mGHh1Z3S
	qP7VhBvDxyjyJZ4lWPdeb22P1dn9tIWj3jGxBTes0QXCeBF/FkzDehDsbemfKlgwZnT/OnQ2W4qs7
	LMV0rkUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLYS-00000009wGE-3FdN;
	Sat, 28 Feb 2026 14:44:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLYE-00000009wD1-1AeM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 14:44:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9D7143A2A;
	Sat, 28 Feb 2026 14:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682B2C2BC87;
	Sat, 28 Feb 2026 14:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772289853;
	bh=8uBL+lM1E6r1mevBWfyFVMB3IGUpvr/djhVuaXmKqhc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I6Vkf1du4xFWzgVNJFeMdki+NgnDQO3zCAagEE+lfQSxyCfK2iMEWPQmN5s1g9y/O
	 9Ak2srQ+Cn4n+YSfya//t3dBNG7mbBRwavZDRTGYXeFZ9ZoAgnVyyo32qSvkGZ8mc+
	 R7RhnVjJkHOGyRwH6kykbtkWSAjabGfbuoH5Sj3miqthZvr/SaeYIH49nod7gQmkAw
	 xgMeCDTnHqErF4Kb4bsibeEMFmSc7gAzYcUYVh+E9ddB8yd5dRiQUqS7rS9sbBXZBA
	 04gooO4UPBFz5Cm2QhtniFC8K3xwUkxi5vkSXdPF9ySEqDIr9y/oNceIl83dnLxGbA
	 qyreKpnpOPtBQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, sunyeal.hong@samsung.com, shin.son@samsung.com, 
 Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20260202103555.2089376-4-raghav.s@samsung.com>
References: <20260202103555.2089376-1-raghav.s@samsung.com>
 <CGME20260202102001epcas5p4ebe15ce1cec50c6ca024464ffdbe9d79@epcas5p4.samsung.com>
 <20260202103555.2089376-4-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH 3/3] arm64: dts: exynosautov920: add CMU_G3D
 clock DT nodes
Message-Id: <177228985014.54920.4826846692131993586.b4-ty@kernel.org>
Date: Sat, 28 Feb 2026 15:44:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_064414_350426_97A2AF1E 
X-CRM114-Status: UNSURE (   4.98  )
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


On Mon, 02 Feb 2026 16:05:55 +0530, Raghav Sharma wrote:
> Add required dt node for cmu_g3d block, which provides
> clocks for G3D IP
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynosautov920: add CMU_G3D clock DT nodes
      https://git.kernel.org/krzk/linux/c/a94b4c84ae9294e4f2e398c61d94bedd56162785

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


