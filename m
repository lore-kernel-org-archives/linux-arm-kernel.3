Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490CACCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 22:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7H7lYdFJTnnoV20Ubm9IRBI3LFxcikpffIQknO7q020=; b=Plr3zcmtg5SI4ZNMoBh3wO7QiY
	IETWWYXVs9hYaGq+/79GzX5hS63bGgzUxYzFql/kcWmt0TUfrUcVOkmZ8RK5Wb89bxItYkFvkWbcC
	JiBaCio1HMNRbGvHIlIWvLqaT78F+9PhfUGB0NfG0XhKo41weiEwHFnH0tWi/NBgVRFENkbfJOPGI
	3vZg4boZSR65LNcNpT01QDOljrZieChewmiJH7lBWmnC5QEu9IBttqtyF2aZH5Qx7p5GiT0Uzr0p3
	zpyx4w/uCXdfE/kgbiXoiGyqsW/djiSAJ506dQhXA5SdqDFp5Ly3jhlUXVTL37neQzXM9fKkDgJav
	G9FhkCRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBLCE-00000000riI-20Wv;
	Tue, 21 Oct 2025 22:51:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBLCC-00000000rhv-2Feh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 22:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C66762749;
	Tue, 21 Oct 2025 22:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E158C4CEF1;
	Tue, 21 Oct 2025 22:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761087057;
	bh=Qk7LUUgm4OTA/65R/5eca+jZCmwBOCQ0+YdsSmes8Bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FSoV19XbKe7C8UMx+JY6Pj4jaUyBAFBp8/DerOBulBD4fm1gFoy8DcahXxFQGlet6
	 IRYS11vIuBmB5CsRBqSD949YQbNPklP8BPk2h8A1mQYwdQv/5xOO2UhLS55hDAt+BG
	 UcXdrfcMGgBPK7mFHXDzfH9ELSQgik8/zAObLXNmGIHlXwsqXiHmhMG8Ds4RzLCG/S
	 spO/FKr47vGoEBYQdEMY7FyHCIiA2RsnZQytqDSlwApWUJRi+vxqKIoEBj0MaO2/tf
	 Pofsp1AJAktzC4ySVsD5oTyEdlrGN9ScgTtsK/wEXZhiKXCeabbBk4/F4cqvYu+cNr
	 3IYQ+6YtXo6XA==
Date: Wed, 22 Oct 2025 00:50:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Alain Volmat <alain.volmat@foss.st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Pierre-Yves Mordret <pierre-yves.mordret@foss.st.com>, 
	Wolfram Sang <wsa@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Anand Moon <linux.amoon@gmail.com>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] i2c: stm32: Omit two variable reassignments in
 stm32_i2c_dma_request()
Message-ID: <s2whbqys4xwn2ant7ftgixwkguqmvtwbguajdtz7bks7avgk7c@efhaves6wzg2>
References: <f7e0c023-d2d1-40ba-badb-74a7e9c23684@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7e0c023-d2d1-40ba-badb-74a7e9c23684@web.de>
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

Hi Markus,

> An error code was assigned to a variable and checked accordingly.
> This value was passed to a dev_err_probe() call in an if branch.
> This function is documented in the way that the same value is returned.
> Thus delete two redundant variable reassignments.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

merged to i2c/i2c-host.

Thanks,
Andi

