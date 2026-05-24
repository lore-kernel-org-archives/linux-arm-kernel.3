Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FABCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 22:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPb55gSnDR8xwX9KH2gBT4f2QQLkB8HYg5P/YhSOLLM=; b=xhog/H1Kfcg61SforPGudkXbLW
	KmeKN7rQPg9MHW2EjCSYXyEoHuAfFW1h8WXWrY41a6lpGbDdshPUJ8zzowOoTiVyd2oTUDoFvp/al
	U96WVJ6yKiR754yFVPZJsi4TU9+apvcLRFSkNCmZC5V2/UE5XAIF9gGb7sqRb5XRevzRrbNWi/o4g
	a25I74LZHgQ1sYOZJLfwxTmVTe1fDLh4vxpvYlIchGkNt+6QigcvY1lqw+TixmOvMm1zM2aPt9vi6
	Wb7tEQ7K/cGbOawU+xzjktFdwOqjhgfkMUkE0JLcqSd5LvbNOhxnjxzig+r6keicyPE3AvzvdDxEH
	uh3BBOEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRHSt-0000000FmYx-1pwZ;
	Sun, 24 May 2026 22:38:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRHSr-0000000FmYa-0DhA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 22:38:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 42105418C0;
	Sun, 24 May 2026 22:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC191F000E9;
	Sun, 24 May 2026 22:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779662312;
	bh=QPb55gSnDR8xwX9KH2gBT4f2QQLkB8HYg5P/YhSOLLM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=DhqcqBuTLBEMuc4Li00AWqaGX7FG08Ds+3muLlOdLamOoabFkUWkwGhYOGUj3kUy8
	 XZyT57d0yUL+hDGmqLPbUdrbORBiJd2b3RuiBdHF3xQKCoLdSzehZ9Skx9QCrmMNmT
	 BIcQunsXWUjUeSfaOFpLawv0w3PeM3xZYV7WEd9wknfOvJX12+1abUSP0SVdggjumG
	 aPFZAiPWmV5M6Rgf/OravI6XH7LwWw2As3Za7fQp9DqV34/7K8mTl0HSIA68dT/1Xr
	 M8LsAjLWuV4I1nsBj7zn7BILvLH0kfJQWOpSTbykShhCpahkBGsIFq13LrcNqbN7k/
	 gzsvYH+XEM3vw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wens@kernel.org>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: Re: [PATCH] bus: sunxi-rsb: Always check register address validity
Date: Mon, 25 May 2026 06:38:23 +0800
Message-ID: <177966228131.169428.14889058847784781615.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
References: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_153833_120377_193F58F9 
X-CRM114-Status: UNSURE (   6.90  )
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

On Sun, 01 Mar 2026 17:49:39 +0300, Andrey Skvortsov wrote:
> The register address was already validated for read operations in
> regmap_sunxi_rsb_reg_read before being truncated to a u8. Write operations
> have the same set of possible addresses, and the address is being truncated
> from u32 to u8 here as well, so the same check is needed.
> 
> 

Remerged for 7.2 instead.

Applied to sunxi/drivers-for-7.2 in sunxi, thanks!

[1/1] bus: sunxi-rsb: Always check register address validity
      https://git.kernel.org/sunxi/linux/c/61192938a587

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

