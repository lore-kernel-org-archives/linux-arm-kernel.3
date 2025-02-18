Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07757C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRXLAb46lhWAQwHsLKbY8tI70RtJ9P9Fv7iK0VSxaUE=; b=OpKWIN+sV1MoU5hAfupIU9agEA
	lYFDAdFp+/7xRBrC8BCUyZIqaP8L8mYYvGOeHrQOFVEO6tT5e2d6GLUpzyehuLOQ6f9wiZLIwTi6o
	n8oAsJtzpJTCyjScVtPGisB0OGN7fy6NsYnGB+/yAyT4hXpoeEqZfXYQN/VFmUbScyCXIObnBRYG/
	gsGD5QfktUIoZczHOR2a59PdQFsKw/8uJNuY6O9s/9f7MmdAnmHogodshRSCyP2YbSpBoreUzdnd6
	lLXTdd0oXzW7VDU6Q+bDCGvqhCISNJP8FSfort9yuewL/WovZ/YS87qg5LAivAfoTn2zkGGQesAGF
	/FQ4NnEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkK6u-00000007ZQl-1bYq;
	Tue, 18 Feb 2025 09:41:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJun-00000007WCA-2G72;
	Tue, 18 Feb 2025 09:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739870955;
	bh=yQlBwEetNAXy1+J71TlsSNNeiqeKL1aRYliDQ7TohCs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fjG+SX4uSZwOGJWlQQAcOjH8oiGU8nmGlgm4SJDaKTO5Pnq1BVy+s/7nTtpBMJGDR
	 QvlZ98DxAUx5hfByzWyyIJmqa4pYrTN8YBJLdJjvO0wMqm2Gflq5qDqfb7yYp3TPbI
	 qnj5uUBGrqyfeaAY4cMuJkQzYeCnm1eUJ8KEwrNmvbtzBdYS0JBuWGqKkqAiZ6CDGp
	 o87Nsu91rkqvdNbJYt1wqdAxmuNDJKy9z9FYCZCjvuCLXNORsOjHUTQIt5ZYDQcZWB
	 3EpWnb66rGla+/BgFwTGvrjFs0aajrqIrpNfWYtakAuiM0FSEz5C/rupklAsbFx5Ra
	 VYFmVdC9/+hDA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A7F017E0391;
	Tue, 18 Feb 2025 10:29:15 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Fei Shao <fshao@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20241219113411.3999355-1-fshao@chromium.org>
References: <20241219113411.3999355-1-fshao@chromium.org>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: Restructure SoC attribute
 information
Message-Id: <173987095528.24486.1591525974990532719.b4-ty@collabora.com>
Date: Tue, 18 Feb 2025 10:29:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_012917_750287_85F5EB2E 
X-CRM114-Status: UNSURE (   5.55  )
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

On Thu, 19 Dec 2024 19:33:50 +0800, Fei Shao wrote:
> So far, the MediaTek socinfo driver populates the SoC information as
> follows:
>   - family:  "MediaTek"
>   - machine: "<marketing_name> (<soc_name>)"
>       e.g.,  "Kompanio 1380 (MT8195)"
>   - soc_id:  <null>
> 
> [...]

Applied to v6.14-next/soc, thanks!

[1/1] soc: mediatek: mtk-socinfo: Restructure SoC attribute information
      commit: da77c2d3d06c6fa36ed26a5a48490b80e4f94753

Cheers,
Angelo



