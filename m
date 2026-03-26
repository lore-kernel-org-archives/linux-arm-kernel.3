Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD6810AB807
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 19:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dpb9g4AmMThBft7vkg8e6vXf6FuktuEf/tpfSoteEvU=; b=vWC6UfIYmTth8BsKuT7KO9cquV
	mZ4hTwS/VWCAo1qgLw8pswdwCWejnYn/3erZUDDlDRmTV5rHkiUectUrtY6RSkfPhxP6oVP0V8rcc
	op2JWo7ms6GaJfMol4jmf8UD0n1r8i/DD0T4tRk44qATgDev54KYybrFyM8hjGrAylvizfPgTbpNh
	J7EVNw2O2eFl0+SRW8JiC8eGETljyBLM/0LmiO71MgjktVCfe757ZRCl0Coey2tpEDuF7IN0fF1q1
	IWg0gRhopNZe29t83Hnfb2li2tyTRLXc1P+rBEYjBfekGpRDX+3xx557sti1fPYKCMldlyGgMhtQc
	Go9tV8IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qa0-000000067v1-1j0t;
	Thu, 26 Mar 2026 19:41:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qZy-000000067tw-0v5w;
	Thu, 26 Mar 2026 19:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Dpb9g4AmMThBft7vkg8e6vXf6FuktuEf/tpfSoteEvU=; b=rT+EojIPKSXnKnUMTD+m1OTPSH
	A7I54JD6N8ZUJ6yk6wFwyNmv64ay6SzS5sYxnTBtXLbhN4nwxZybp2Ihq1MdT/ysS7UH7QMk3DDJI
	bsbVgBuavW9jusYW+Endx4CtvyE/gyRJ7c9RGLxqlHrYkNcFS20QWWoXOIv3HcD9hMxgZ1LmNFeEF
	ixWoEWh1ig/YSnfufxCqRIvYWG8YTGjlqfIRheOYMG48fIsUF33AUviOfWxOUIeBBfGxUbDXgm3GN
	xF5QZBVtvga3vddP3IHZkPvZMKaWl6KaPTXd/du74CUcWLBqASct75RH++pcJeMC8yesjgCZEkJdN
	dEgjoIig==;
From: Heiko Stuebner <heiko@sntech.de>
To: dsimic@manjaro.org,
	Chen Ni <nichen@iscas.ac.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	airlied@gmail.com,
	andy.yan@rock-chips.com,
	damon.ding@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	hjc@rock-chips.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/rockchip: analogix_dp: Add missing error check for platform_get_resource()
Date: Thu, 26 Mar 2026 20:41:02 +0100
Message-ID: <177455405025.1277100.9154937580491920768.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260209033123.1089370-1-nichen@iscas.ac.cn>
References: <20260209033123.1089370-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_124118_278072_EA61E24B 
X-CRM114-Status: UNSURE (   8.71  )
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


On Mon, 09 Feb 2026 11:31:23 +0800, Chen Ni wrote:
> Add missing error check for platform_get_resource() return value to
> prevent NULL pointer dereference when memory resource is not available.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: analogix_dp: Add missing error check for platform_get_resource()
      commit: 45895f4d4d5f222d07412f90664f88b059627859

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

