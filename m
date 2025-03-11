Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAC1C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 22:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzlZ81oT6+sQzn9N0KGmTJxHqREyYR/y5owRLSBU7IM=; b=NGzENeltobLZ5yxxvH1TiB0ddX
	hlAQtDc5g/TemxohtJ5pGOUDG5pK3RsyTIAT83KioTWU6TNHaYCatHDEN5hqNSl21U5wZ6UPJzDlq
	HbGJav9ph9Iru5tgLke5UEBkjEuSjqlsIscK7mC4ny25OBTWfvU6I4sLqOFGIl3cGz5PZa6Geyu9X
	07wKFWge72iBUSj0hg7Fl9dLQTVtLh/Ddic8cpfwuiG3LriY8t3HXvBtpK4SZ0jBa/AL+RR1otDPJ
	uktuhoi5lcG4xzZrUAiIHoTrl9BGSxKrLLptoTJBtTW/6c6Dm2miyYaFAVPUl+ZyayT4NW9QIfqwe
	nHuXzqmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8V5-000000078dV-2lJF;
	Tue, 11 Mar 2025 22:55:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8T7-000000078O7-1o9L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 22:53:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A0526A46AE3;
	Tue, 11 Mar 2025 22:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3CCC4CEE9;
	Tue, 11 Mar 2025 22:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741733580;
	bh=KEX5faxsQsWkg721kkVxKxCrx0PVeG7B3p7zEqzbq3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ejFSraxYqzOg9hmkx8gLlKzXz6jGLZ1YUSeP5ZVQX6fCbug+BDTzAUIdtIg3ayxPv
	 FJT8PfdUEfkSJZRLJ8qI6HC6JCjd2dB/MrNo3fSVhvWJA5HScaMJIZVmFgVI1P1EVe
	 JGhBlRrHu1DvXSSO8TUfNpv0VSxpFjUhi89G9ukQRmX2u9+zRk7C3cyrEPFWl8v347
	 4YksuuG7U/IQnXn8a0x/jWvlKyWpmJ7mHbe9ZdzvZ5cQjn/ZaduQnWbCJylATeUluf
	 QIXqNj8QGh7QEjTq88CAbhvbmP7XK3lMpzk0ArUfT35v/yZKjFRB/1CKpxNfwgYMMw
	 qKFzG5QL61icQ==
Date: Tue, 11 Mar 2025 23:52:49 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Vitalii Mordan <mordan@ispras.ru>
Cc: Michal Simek <michal.simek@amd.com>, 
	Harini Katakam <harinik@xilinx.com>, Wolfram Sang <wsa@kernel.org>, 
	Soren Brinkmann <soren.brinkmann@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>, 
	Alexey Khoroshilov <khoroshilov@ispras.ru>, Vadim Mutilin <mutilin@ispras.ru>, lvc-project@linuxtesting.org
Subject: Re: [PATCH] i2c: cadence: fix call balance of id->clk handling
 routines
Message-ID: <rbn5jxvmcl76n3grg3fzc3z5vqgmieixmrq3rkhbpdremlbeze@quqxmsszknfe>
References: <20250303140805.644143-1-mordan@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303140805.644143-1-mordan@ispras.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_155301_535293_DCC4D95D 
X-CRM114-Status: GOOD (  12.58  )
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

Hi Vitalii,

On Mon, Mar 03, 2025 at 05:08:05PM +0300, Vitalii Mordan wrote:
> If the clock id->clk was not enabled in cdns_i2c_probe(), it should not be
> disabled in any execution path. If the clock was not enabled, the probe
> function should return an error code.
> 
> Use the devm_clk_get_enabled() helper function to ensure proper call
> balance for id->clk.
> 
> Found by Linux Verification Center (linuxtesting.org) with Klever.
> 
> Fixes: df8eb5691c48 ("i2c: Add driver for Cadence I2C controller")
> Signed-off-by: Vitalii Mordan <mordan@ispras.ru>

Thanks for this patch, but it was already sent previously by
Michal and Manikanta.

Thanks,
Andi

