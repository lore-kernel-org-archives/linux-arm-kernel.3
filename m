Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B603C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjjAX3rqnF81F9KFbKrVETL1eRupjOWWDek76je0mrQ=; b=2P2wSbzL2m4NCgKE2H5lFpBvg4
	/WfQ6FodY+SCAuCjJUhbLzWEZ0r/kf1936ptwEKgVIgmOrdMyR9CefCjqvdjeqhjhXHvlmen31pHW
	fz1QPPIUNK/WdPkpnKIkxpki2tg0m+PJiaHPExvOOqhWKD8NVeLZkHtQwWeZD+Mf6dFd1oTRe+0dj
	VI2jCrPDBBAGTXJcSlZX/zEt/mZXaventC4JyetWjnDu98L1YawDaTUzKHzLNQ2Kr52hBYSl7JOio
	VTjzjhOe7o+P3rcUcOKiOLnvrrbGv0fgm/i5TJsIOqghDaoO3AfyKe5GCEF8KSBcYDg8q/Vw5rnpa
	HRDr6hnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKMe-00000008579-1Q9J;
	Fri, 07 Aug 2026 13:11:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKMd-0000000856o-1G0f;
	Fri, 07 Aug 2026 13:11:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE3F46013A;
	Fri,  7 Aug 2026 13:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702151F000E9;
	Fri,  7 Aug 2026 13:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786108314;
	bh=OjjAX3rqnF81F9KFbKrVETL1eRupjOWWDek76je0mrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b2L+ENyYiCghP3WfYYQdZ8hZB5x6HULGfChhcY2ovo+6JJ3trYADSEYvClO202Ozd
	 ycQa4j97IN0SUaAHdIHg7Xzu86Dgx/qGw3HTT3cKEjKWtcRvBD+sqakvAwQa+kIX9o
	 InwPxuR+fu9hqqRuPVpp/lrdvgEgABxD3SKceftLnvr04BZ9X6g3u3+bwi2xBFRAK6
	 598ayQiBF3PbfEQZJe4gM9NSOt29M54KoUTAYfK/z1+D405ZL2jgW645HRw9n/hvO0
	 Srj0n963uNE5JUvdaTfo6ey95zpKW38plezklQl5X8fXF7Ux0HnnqpMm+FC09BTfh/
	 kb5G+zWxpIEwQ==
Date: Fri, 7 Aug 2026 15:11:45 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Thomas =?utf-8?Q?Niederpr=C3=BCm?= <dubito@online.de>, Simon Wright <simon@symple.nz>, 
	Diederik de Haas <diederik@cknow-tech.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 09/10] phy: rockchip: samsung-hdptx: Simplify GRF
 access with FIELD_PREP_WM16()
Message-ID: <yaed2hz7guhtcxf4dpedj36slsmbigsp2funn4jhmum55lh46l@qvicusqkd543>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
 <20260723-hdptx-clk-fixes-v5-9-8e786067865f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723-hdptx-clk-fixes-v5-9-8e786067865f@collabora.com>
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

On Thu, Jul 23, 2026 at 10:41:52PM +0300, Cristian Ciocaltea wrote:
> The 16 most significant bits of the general-purpose register (GRF) are
> used as a write-enable mask for the remaining 16 bits.
> 
> Make use of the recently introduced FIELD_PREP_WM16() macro to avoid
> open-coding the bit shift operations and improve code readability.
> 
> Tested-by: Thomas Niederprüm <dubito@online.de>
> Tested-by: Simon Wright <simon@symple.nz>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

