Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5ECCC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 21:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgfH+ldk2mEZbbatKJ3UFgLszYbnubnYiw4rmOFiwks=; b=DyvEwA6gRlZPHbgtlwDfbfsk7G
	1bVov1KyGmgpFt7BAp7bewRz3rmXAtr0VVZxd5haUYAlzZJspK+6L41ushHyDjzrsRrL8KcFwSPWg
	tICUEKuiZjV2Tk9o5oWO+y1HuD84/7IpfwvlJXV7I6UlCO5A90/np2Iaw5DdBpsFzfJ6fU0HVDtpX
	MjNQQdUjsejlBrzQyodAlgrflOlG/8fshc63bc7PSzN+PdcGbvwNusfdXB+PeUEapxMo70q/UAqF1
	hecl2O5FU4+oBNHnPYzvOLMIAZQlaLzjEnpj7Ojq7zNFeHiM90nn42aR5xGZ8rpXXYoVn9Dq6YRUn
	m+q5NK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRdvg-00000008RJZ-0nXU;
	Tue, 17 Jun 2025 21:33:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRdtT-00000008R05-3SX0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 21:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BDB24A7CE;
	Tue, 17 Jun 2025 21:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBF3C4CEEE;
	Tue, 17 Jun 2025 21:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750195859;
	bh=+AVJtkADX1ZsehTSMEkzz8csKFgS7fgQrxOyASGuj1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mThStFc6jCikXs2uo6W+NF5YvEORiZDeUdOBUgkPD/A/3O+gudg3d+XCDTm99JtC4
	 FeaGP7377as3P+D08h45he9kHwINuNuNzY7sk9jByZBkwd6LOqGdfcDwFBYL3szzPm
	 J9q0Xb+WbJXdRnHWuBvUfxi3nZCvMwh/XTRMgTl+SvsAgggqMvYINARU+17BFaozh/
	 h+z5r1/1InrCvfUrpG5iHnETApvHtPHCzqQ9G5x6TIzBVSK6H0R0jhafv5ByU8/XlX
	 UKNF92qNbFaJCfwjA0gwVzPROq9Am2dcZUof+UDxZnfePW0vLmJNZ0WtN4lPRHfjNX
	 iHXBhKK/ZbNHw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] remoteproc: Don't use %pK through printk
Date: Tue, 17 Jun 2025 16:30:52 -0500
Message-ID: <175019584837.714789.5721540056396177513.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611-restricted-pointers-remoteproc-v1-1-f059097ba663@linutronix.de>
References: <20250611-restricted-pointers-remoteproc-v1-1-f059097ba663@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_143059_878994_E4863411 
X-CRM114-Status: UNSURE (   9.23  )
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


On Wed, 11 Jun 2025 12:03:06 +0200, Thomas Weißschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: Don't use %pK through printk
      commit: b0dc512ab7ba177442cfec4a65b2681355d7cb64

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

