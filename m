Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8CFC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Qn+qkiOqk6rQSu+vZ4GZqQnRtU6Nq4c/nNZ52sjGmw=; b=nNpuziT4wKaFVOFpDGHYLS/NMb
	33Kh57VG5a2BaQOEhYPBpEXoP0FOA+curiA5ZwEHGZM6TSbpEkPkVOG2EJFOs+h7cqjb52UEj5Ep0
	26yxcYxwzQcaT3BuQx13IBFFC6NSwfBXBxlDRctEioVjckw6Y6NMMiAvQv31APGv8oDHJNMZ2F/+l
	Yo7d7e8ajvqZxevOmc27Df0uXypYeesmgedQnrvJm9GS0yGI0tgAjgChgcbslAOxe5oBE91eRqsuK
	gelh+ank485hj6XJ5nUiRpaLf/nBGEDI+dMambVwHu/ZlnyobNmpajmHIoXUiMiQyKQlFdo84as4R
	BhggtH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1j6-00000001PQc-3zMX;
	Tue, 25 Feb 2025 20:40:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1Dx-00000001J1D-2hxD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Feb 2025 20:08:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8Qn+qkiOqk6rQSu+vZ4GZqQnRtU6Nq4c/nNZ52sjGmw=; b=WdjTNmJGDXwsUwJswoOHe8DQji
	8tQGvPX7Hw6Q4NMgnK3j3PXlsQzyaYZb25FOfBR6jekEGAgZm8dJDRGTwnc87JiSve9AeyuCJq4VH
	q3GateF/QPM+09h9OGOzEFPHzQg5zjBZQCUXAi1+5aEX3EvUSuXw2BiM9HbIWI75/TXZilTpAPVtw
	Kag0icYHo60FSFB6OxFV7QJgr9DgHbYonPwQkqSgL+ueqcoJa1D/8vhVa8ZUM4zO5rNZ9Sc8axEEY
	bqQ/cGTNoSyY4vGUxuNIHqxFD7lPBN03vPKrW81WEDyOjtgGPKZGCqWuMWaNG/S7u5CvdcjKaOlbu
	U6ObcMYQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1Du-00000003Ori-0xiv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:08:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DC7C5C3F87;
	Tue, 25 Feb 2025 20:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CD0C4CEDD;
	Tue, 25 Feb 2025 20:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740514086;
	bh=JHvTrakxRhdhuk+kBY06tb9Lr0ActVSa7Q4+RPH0pK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fKzlaEeoJRWop5oAYb/YCS8M3HQGqwjJwMv93yKTF+5ZGXcyYNs0jDb3SNTw2tE5J
	 Y2ZVchmubya8cGdPdunn3Ce8SurKCWGHt/gqiUrr+4TYEEVqF8CWl8HQvLBMawu7yx
	 rpOagGnIsYYfUx8KIPZbgV8XwUOGMqFV3Y0UB3dWZRxljWZ4wXQXHoVluPPmSaNA4C
	 UvHnD0OexH1v/9kWeA+M6xRzcJMA8tZfAN3JDiMNFq/syCAaM8RS7tEmJA5uvpMlw5
	 84wLguasfXtfSnVYJZwDwQ0MjBqzp5XPCyuLAIbZHkTFbJTfYI+Dae4eBG+y+YKwa5
	 YFGCilE1PYtIA==
Date: Tue, 25 Feb 2025 14:08:04 -0600
From: Rob Herring <robh@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, Frank Li <Frank.li@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: display/lvds-codec: add
 ti,sn65lvds822
Message-ID: <20250225200804.GA2947190-robh@kernel.org>
References: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
 <20250106-skov-dt-updates-v2-5-4504d3f00ecb@pengutronix.de>
 <37d2a7bb-1c8c-4c33-a277-dc1a7448433b@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37d2a7bb-1c8c-4c33-a277-dc1a7448433b@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_200810_523627_A3A0AFC4 
X-CRM114-Status: GOOD (  11.01  )
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

On Wed, Feb 19, 2025 at 02:26:52PM +0100, Ahmad Fatoum wrote:
> Dear DRM bridge maintainers,
> 
> On 06.01.25 17:06, Ahmad Fatoum wrote:
> > Add compatible strings for TI SN65LVDS822, a FlatLink LVDS receiver.
> > 
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> 
> Shawn has asked that the DT or display maintainers take this one patch
> through their tree. He has already applied the remainder of the series.
> 
> Can you take a look? DT maintainers already acked it.

I've applied it.

Rob

