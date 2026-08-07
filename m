Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28237C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXX/Bi8Y2FZ+7Zdt7AeANTyk7dP+AYybMHHS1M7s9UI=; b=tNaVwlvODXpFBN8eXYYxosLKaZ
	EGdPzq0XrIe02q58qdYbGp8SnnawMXn9Hhs1KWcRCA5B0FZd6G+5PxBZMNQtmvBWn+9sENXtVNuYh
	xu8tHTLvuAIjkYwRuMjfKvRsui0pfWp4017tKXOdXZQOO3Rs2BGAz8nDgksqTE1hu1PRZQjho3Q1Y
	vM0cIizR+aduFYZAzLqZSeAkHWBne6hARil5RYnwz9QX8P7hT3CO77daJickAzHlnnLLdL3W2x8aT
	cUmkYyfabpTlrOI1f+gDG6GLHiO2Raic7JtTwFBIe5xGnkbBGJRG0kKfz1oNL3y2M4sZKq6Br02NM
	Xd0zH3uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKHc-000000084Hx-3RZ2;
	Fri, 07 Aug 2026 13:06:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKHb-000000084Hg-3lUq;
	Fri, 07 Aug 2026 13:06:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A31C34345F;
	Fri,  7 Aug 2026 13:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9EA1F00A3D;
	Fri,  7 Aug 2026 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786108003;
	bh=CXX/Bi8Y2FZ+7Zdt7AeANTyk7dP+AYybMHHS1M7s9UI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jB5AKa1RZSweMdUxxv8J2cI0Ho2q0FBsVIRIEYWCk+E5dtyVi32TlQYUJIS3EWbmB
	 w1zIEGR53974J0EaffMzxeAFInGoWGzdaHJt/FZn5/i8kB24IHB/faGq4tGAF+CyXa
	 uigl9xliuwzWaqDHPNIlN6E982qwb59vPEShKBGnWWINQkdmDLyP0oULKdBsSmdNvk
	 Lj0qXQINua0YX4YWD1KR0G7lV5sggdy8QA6Ako4rB7zubH3lXJRzggONFi2i1U41H6
	 Pj7PGA3WwcMPano9kIUUQfbpCxCKtQLFUyVVqL35R7KDAOJMgO+ZxW2sKenxcvLR+g
	 tgGcrJt39PQXg==
Date: Fri, 7 Aug 2026 15:06:34 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Thomas =?utf-8?Q?Niederpr=C3=BCm?= <dubito@online.de>, Simon Wright <simon@symple.nz>, 
	Diederik de Haas <diederik@cknow-tech.com>, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v5 06/10] phy: rockchip: samsung-hdptx: Drop TMDS rate
 setup workaround
Message-ID: <igbrec5wab2rzoq54pzsh22hdxb6tfg6tpqenyu2zuorsjxcbz@rwwrayoovxxm>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
 <20260723-hdptx-clk-fixes-v5-6-8e786067865f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723-hdptx-clk-fixes-v5-6-8e786067865f@collabora.com>
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

On Thu, Jul 23, 2026 at 10:41:49PM +0300, Cristian Ciocaltea wrote:
> Since commit ba9c2fe18c17 ("drm/rockchip: dw_hdmi_qp: Switch to
> phy_configure()") the TMDS rate setup doesn't rely anymore on the
> unconventional usage of the bus width, instead it is managed exclusively
> through the HDMI PHY configuration API.
> 
> Drop the now obsolete workaround to retrieve the TMDS character rate via
> phy_get_bus_width() during power_on().
> 
> Tested-by: Thomas Niederprüm <dubito@online.de>
> Tested-by: Simon Wright <simon@symple.nz>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS
> Reviewed-by: Andy Yan <andy.yan@rock-chips.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

