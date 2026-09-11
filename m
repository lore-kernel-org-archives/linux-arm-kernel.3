Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8824BC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 02:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsrQP+FKX7ACjXnioTe1PG7XirWH9x4PyAmk/UhDN6s=; b=c+QPYGKh1i8/AEZws9zAUnIxNo
	rYK9AAGBEhoPyQAkwZFZVUJ4QzU2mxl8m/EBGLeLTx4nJC+fTfbQeFpT6veKYWdrg6GNsl3CdGEsU
	PB/+RiOge13D86UHe6Rrd/uM4KwuAkGg9e56t9sZwfdvNTtgnNYOvyyF0TpJMfxoPUyI0xqq/Pw2u
	097Dbn7F5jOk6J0VJJYkVwnnWKjv+f7JMJb0lAym/GpF77uaHvaGONf3U1QhqW6FsvJdPFI6i+aEU
	omZMmIR+q0eVTKHMCsnz5h/oGiVcCmJrX1f08Ga4OA4KZcn90SG1sgqaGwDtjTr+0dbewSOBuXLpf
	eDJ+coFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qxk-0000000FhvZ-0XkH;
	Fri, 11 Sep 2026 02:26:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qxj-0000000FhvE-1sVU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 02:25:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 294F56020A;
	Fri, 11 Sep 2026 02:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91661F0089A;
	Fri, 11 Sep 2026 02:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093556;
	bh=gsrQP+FKX7ACjXnioTe1PG7XirWH9x4PyAmk/UhDN6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UGNiU1Myu3dLWOe3jlEypuiaVcN/rK8Gel2dEmf+zsSRFkaf/23qZz9othH7DtSZB
	 lJRqFrkyB3FKEqnG4y1zLAAlhLBSqXFMrml+81epQaaNzKdMwNZshbGGzCVRqN4k8K
	 4WTyC91TWsTj6+LMJ828U3YiOyBUirQaUSB8NTa+B5xcjUzK73MOKbtPvrYvXBCfcU
	 IW5gMM5LmU7lWhScRk+3fNXFL8cHOoAmb7TIaydOXPy1dMpQDZJjR+iQY5m6G77iZZ
	 PrgukZphQ1zkcrbuVAjf1b80Y/3WosaT2KYlPvhkMlnvix7BJ4nSsh+iwBsjjSvL7F
	 u7xBlVY0CM8LA==
From: Bjorn Andersson <andersson@kernel.org>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: QCOM interfaces should depend on ARCH_QCOM
Date: Thu, 10 Sep 2026 21:25:34 -0500
Message-ID: <178909353836.920241.11751783764687425864.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <888efe8e63b6a18fae4acd5a90a1e0e69dcdf2ca.1786012495.git.geert+renesas@glider.be>
References: <888efe8e63b6a18fae4acd5a90a1e0e69dcdf2ca.1786012495.git.geert+renesas@glider.be>
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


On Thu, 06 Aug 2026 12:35:15 +0200, Geert Uytterhoeven wrote:
> The various Qualcomm firmware interfaces are only present on Qualcomm
> systems.  Hence add dependencies on ARCH_QCOM, to prevent asking the
> user about them when configuring a kernel without Qualcomm SoC support.
> Make QCOM_PAS invisible instead, as it is already selected by its users
> when needed.
> 
> 
> [...]

Applied, thanks!

[1/1] firmware: QCOM interfaces should depend on ARCH_QCOM
      commit: 8fecd3194de338bdc0c57597be61fdcf33e1832d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

