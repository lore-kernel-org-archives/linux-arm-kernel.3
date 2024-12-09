Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57537E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 16:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9DQLHNhK4WYfe5bmpdCJZ1khkqhQzlDWWskabs7wmw=; b=ijpeJDgkBvdcVVEaTgUuoQ3UNE
	/+fx7hWdnGl2HirhaouYBWa436/hVk7VCKXXqfZBsgHl7dinHaZTk4on6Uh0XBs3rsq/miIr1Rk2/
	4WvroJScUHmb9suTBw3jzVrvsC17p8uyZmF3SiweFjLYKs2LepPy9Uj5YfpNlIlvaz62uVdfs+F2R
	F7S8z9MMiikIMsWkCS3LRE5Cg8lh240TWUZN45h32Ch3xbg7KbaOiSFejE/+gActF6XmLAb/Zw+ug
	8/GJfYGtyVmHj7qdrFg0T08BGijJPxrEsSoSsac2J2Hs6U8EoPr46k9ahC38WSWsCEP05a1bzhif7
	VuFBj8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgAw-00000008T9W-2uPn;
	Mon, 09 Dec 2024 15:59:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKg9t-00000008Svs-2YMt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 15:58:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4D5BDA41780;
	Mon,  9 Dec 2024 15:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4C6C4CED1;
	Mon,  9 Dec 2024 15:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733759932;
	bh=OO/cbnYzf7FBnThMr5HyGBtVFD9nIjTXZEtzGzeppGE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Fg+oFQeO2kxp5YwnqKCYMkxppM0DGUp3qVxQ5sA5nAhg3znZy/eC4jlBglaQcF/pD
	 1ek0X+lGA/sb+0yV86GarHhJ0//nhWl6/GeurMFilAnXgVNik5+axaVubjfJjqrBrn
	 86+D1UrJksk/A/x7WQkpy+hnh6fB3EM8+OelfkaB9ESisxtWQuZNPPWc8FbMqDy4kl
	 8JkRD4kzTEhYQqrCcC5V/LWtyFXz9lTa1eRABmGQQ0yimefBwGiWp9fLGT93pJHCyk
	 U2M6D7V794lB7TwBTexFvKiGyb5NKZYztjvbcbzPQRSGcT2/O8refdTkfvvj9cWQks
	 R1eAulDtuAE/Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: wifi: wlcore: testmode: Constify strutc nla_policy
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <78810e3ebb74ddbd3a4538f182bf1143b89baba7.1731332414.git.christophe.jaillet@wanadoo.fr>
References: <78810e3ebb74ddbd3a4538f182bf1143b89baba7.1731332414.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-wireless@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <173375992872.157598.4366313738760552668.kvalo@kernel.org>
Date: Mon,  9 Dec 2024 15:58:50 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_075853_711641_EE198EB4 
X-CRM114-Status: UNSURE (   8.03  )
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

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> 'struct nla_policy' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    5062	    528	      0	   5590	   15d6	drivers/net/wireless/ti/wlcore/testmode.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    5178	    404	      0	   5582	   15ce	drivers/net/wireless/ti/wlcore/testmode.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Patch applied to wireless-next.git, thanks.

01e767d6f783 wifi: wlcore: testmode: Constify strutc nla_policy

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/78810e3ebb74ddbd3a4538f182bf1143b89baba7.1731332414.git.christophe.jaillet@wanadoo.fr/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


