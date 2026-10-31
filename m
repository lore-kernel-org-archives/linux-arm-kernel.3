Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4333F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xUWb/eQ5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvRvl7W4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WfqDrmC+ehUZ60Gx9Aa5w4mrh+zG4BxXWhM7P84e/E4=; b=xUWb/eQ5MQcd/J
	XkC/f4K4mxEp0ErgdMSfPhv+onsszSktuQDJk7d9K1x8iMVNqBY47mIwc8oBIAg0amo5d36ygxvK5
	tnnzX5s3ukluGYxDeISSq7MNP/2u9CA3UJ+13PYUZFJlbWxlnGumicNK3CKkPUvBCRpksRq5BoFKY
	ZDXhWErW/UmebUd76keOHPFms7XomIyi3rV4RMbzpxy8hU2R+u8CC+uurdtAC0IvOf9BvyTXTyrsv
	dHz5YyVmG30BrBcWY+bkfhWdu8FnduX78cgzrI+P8Q7bLrlT8y5jIa5XoczwmeMmrUnjbNxPBN9HM
	KZq9dLroq1Vm/q+wRC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN828-0000000DIXk-2lBk;
	Sat, 31 Oct 2026 12:18:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN827-0000000DIXY-427Z;
	Sat, 31 Oct 2026 12:18:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 17636600AA;
	Sat, 31 Oct 2026 12:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73181F000C1;
	Sat, 31 Oct 2026 12:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793449082;
	bh=WfqDrmC+ehUZ60Gx9Aa5w4mrh+zG4BxXWhM7P84e/E4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=GvRvl7W4RGrqljpx94XdbaZMsVvL1Kt/Z5Jd/55eORWHsalS5nFdOLhZslVPHATyj
	 Epqi1/8K2P+7A0aNrdghr3K0m5IKSQhcClb9RXYBmakKy8MPKStyQWmBH87IH10nf8
	 eEw5QOOfHjMHbUF24xNoaBSgLAY0d9lzM00aOqEfsR4dJw5IFzIdMcMJ2mOkycUdrA
	 57Hm22yeq29PdAbHNTDoD+NKhP9WJBm1s0CUo4SHgyKLXCy7meoL3v2MaMZsIH8cIT
	 EYpEeAzPOzbogU1W1PvT1ADFAEq5SGwV5qRz4Wbl1AwHr8iQXW9XRQxGfi16qKyFEI
	 qTuDlCJgPT3nw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH 1/1] phy: mediatek: phy-mtk-hdmi: Use regmap to
 manipulate hdmi registers
From: Manivannan Sadhasivam <mani@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011082042.348422-2-l.scorcia@gmail.com>
References: <20261011082042.348422-1-l.scorcia@gmail.com>
 <20261011082042.348422-2-l.scorcia@gmail.com>
Date: Sat, 31 Oct 2026 17:47:39 +0530
Message-Id: <179344905948.5901.6799097646166176701.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=806; i=mani@kernel.org;
 h=from:subject:message-id; bh=JmZC2SA93RT2nPUoPyZmky/enQbqCKoYwEii8HOdWaU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5dxxUWs3ovbRHBJTHeGitgowF1no/6nrpoiQQ
 oBBFLTs8GKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauXccQAKCRBVnxHm/pHO
 9VQoB/4v8G/Tb9ty7lQVKYjEB7a7AKK/iMtr9bXlp4uhf0FbVMlBFpK+AqT+8hXG2Ve55+mvO3n
 w+/xPG4afcQ8jvJbvZIV58WBAhvz2bqcD4euJOA086kJzuGuMclGxwj14c/2NJg54MHpXd0nTIS
 l48kwjeeEjv+CNZaShfLX5LZPLTM3lfngz8mbECL90TIpRCEvErerhFamQUNdE7VQPHBnYaEpar
 6+VVkA3oVnQLdsJVXAA1Ch/4qPAfotKX/QJtctVHRWkhTOMED4AhCgo/5CKzs0Dq+itjhre2eaJ
 PHzkdZJn6fMqAOgKbr47Mf9YZ61mvvmSV7rFZCjdz2M6BhZy
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-11 10:20 +0200, Luca Leonardo Scorcia wrote:
> Use the regmap primitives to manipulate HDMI registers instead of custom
> helpers from phy-mtk-io.h. No functional changes.
> 
> This avoids the following issue with mt8167:
> 
> hdmi-phy: error -EBUSY: can't request region for resource
> [mem 0x10018300-0x1001831f]
> 
> due to the fact that HDMI PHY registers are actually mapped inside the
> apmixedsys memory space.
> 
> The same situation is present on mt8173 too but this SoC does not exhibit
> the issue as its apmixedsys driver uses of_iomap instead of
> devm_platform_ioremap_resource to map its memory space, just like regmap
> does.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Why RFC?

Anyhow, please fix the build errors reported.

- Mani



