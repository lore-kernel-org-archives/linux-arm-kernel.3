Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDB0D1CA0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 00:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1FvEPKmzDZhgNscUuKYx1Hb2MBLb0WiOawZ6L4tBAA=; b=1RMJd9cqTY98koA/S57s+KXbbD
	FxeZxIuGL5onpr94pH8kwt3vi7mrmrQiMV/aegxgNcjRx4GJ6pxMKbaJlFrmqPJAu5IqzBvB+thBW
	k4MkW3NUwUZAcp4l6XsMPBr9EXJcLXqoo2rYpGMVLHc63m+/d4k5I9YjObG2Bgy/WJhnEoXKnrulF
	uTv8ovx/jjmCLx7lLaD5WhEkpiqgSnyPvsNVQ3wTJ/2DR0XEmTnimGnLuOfN+gD9oTM7KM0dDAG6D
	h1tt5IHVfDHh1gFKSLi0IyX+vXOa+US96eMCRvookevTelDphbFRWlRi8R7LwoRiYDLuToV3ZFjRS
	RO1B2HEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t87Ok-0000000FTXG-1ZwR;
	Tue, 05 Nov 2024 00:26:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t87N3-0000000FTN9-23qU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 00:24:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4DC57A41AEF;
	Tue,  5 Nov 2024 00:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436AEC4CECE;
	Tue,  5 Nov 2024 00:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730766272;
	bh=N8R3fDb+9GoIdsgF7CbDktor2ZvxI5MJHHQBCkOSUKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h18njW74apSBbpuu3iVuuWcC1ZiFx0DjnJ+pzstG1XBqh+B7rcZsaopjIjq31JtFn
	 vsAtNmmztKxPwOVJr1iu3+I3kxA4jFy1iTEZjlp9ghbY+uKyDpDsdcdUVUdCTR7AQW
	 fRHuKGhlFechFWqMyuyoJ5Y6gLR11hCoWQiHWzJZp6FN/T1yo8fSEZODEfzMsA0ZeU
	 gwifQ+9J0wV8+GqDH+DNQ5dFwBAmfeZzupjUVxejRuPWDR3wFaCwD36qEFnC74wSRE
	 O6u4vzsmS+xRpszSioj+qMc9w2HJAC/vPa0HT7yl434Hc0FfRbgeiwBZ5q/+ColXMg
	 sNFTAaRhZkfDw==
From: William Breathitt Gray <wbg@kernel.org>
To: fabrice.gasnier@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	Jonathan.Cameron@huawei.com,
	benjamin.gaignard@st.com,
	gregkh@linuxfoundation.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] counter: stm32-timer-cnt: Add check for clk_enable()
Date: Tue,  5 Nov 2024 09:24:20 +0900
Message-ID: <173076612183.810486.12896037496953296701.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104191825.40155-1-jiashengjiangcool@gmail.com>
References: <20241104191825.40155-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=364; i=wbg@kernel.org; h=from:subject:message-id; bh=nKhWV0LJIFJnrRorwflUOkORSfdeFM5elQRc/M3KIUc=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDOmaqbM2i1i967eSemS+2bPWLvMJp8JbmUXiklfit6n+/ rJyk25vRykLgxgXg6yYIkuv+dm7Dy6pavx4MX8bzBxWJpAhDFycAjCRB1cZ/lnHeuTNYdCU+B6m zPnZOTviK2vjz03ri+7u60jpMmKbt4aRoY3ve67efcZv0WKL/Xa0v543a9690K4rT6OnOq1qe35 qChMA
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_162433_612591_47B3E20C 
X-CRM114-Status: UNSURE (   7.35  )
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


On Mon, 04 Nov 2024 19:18:25 +0000, Jiasheng Jiang wrote:
> Add check for the return value of clk_enable() in order to catch the
> potential exception.
> 
> 

Applied, thanks!

[1/1] counter: stm32-timer-cnt: Add check for clk_enable()
      commit: 842c3755a6bfbfcafa4a1438078d2485a9eb1d87

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>

