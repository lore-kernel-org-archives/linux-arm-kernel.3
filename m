Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E90BCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 20:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miAXv/M3OTVgDrxRv7GspwWoKZbMvZJA6CqEs7XOh30=; b=2t9p7Mj2R+aTtXdV6crKe2Aws7
	sq9xptHY4zHzz976m335+cmovEjBvc1iDxELzs1yl0lZqou5wtXTUYp5iuJkeDHG3CL7DqZBI5Wj7
	Wl0er8Bq3FmY2W6PWTn5Wir8oKIgYyzTyAEOIycrT2/XCZw4fHfAPdiUe6Qv3AMw096f3oNWHPJ+/
	jg28HzmwnrPjXdW9d4B8s5bleWzpg4cDHmVRVd0r9F/TzgUrXzETUuoGz8xXPCOx0eUW5QhIgdTeH
	/8sAz0bzu0WKFaJGmIzsWvvmyk1ekR332W54osHzZWt3QuLMlCv24Lm5qFHEDKKvhE+bqE4fKjvx9
	IwFKG/LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVtb-0000000DlQX-04ol;
	Tue, 02 Jun 2026 20:39:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVtY-0000000DlPG-0V5J;
	Tue, 02 Jun 2026 20:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=miAXv/M3OTVgDrxRv7GspwWoKZbMvZJA6CqEs7XOh30=; b=TrKRJvMTUcJM9jB5egkB0YTr/4
	yX7xOqChPwEtDZSbhWb3BW5V3czq0lDB/vwnH2DngXYjOmo0wv9TxBcXwFE2hlqJU7WrAgV3HQ1nu
	PM54SUO+DI1L528llzdd+CN7qXvblhUHwyjuhajvw/f3IRALqrHknSqI1OJOhh6sly7PKqKxC/cU/
	rose43RJzh+VkbJ/PakPLDo6n++yeP4UUtzexs3cFQBTjonVat9ZnSZcJ6bschbwVLoWdRc7d1OGD
	/Gk1DW7qZhCUXPXrl83zAFx5bRoNb6bPI1giZBaTfJvRwVl2lYIisC6WejgwTlMuldOoAuFNre8GG
	zBilAPsw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] drm/rockchip: dw_hdmi: Misc cleanup and propagate bus format
Date: Tue,  2 Jun 2026 22:39:07 +0200
Message-ID: <178043273743.699871.14907494731416478776.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518193748.2482823-1-jonas@kwiboo.se>
References: <20260518193748.2482823-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_133928_160030_B3D5F20B 
X-CRM114-Status: GOOD (  10.41  )
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


On Mon, 18 May 2026 19:37:34 +0000, Jonas Karlman wrote:
> This series include misc cleanup of the dwhdmi-rockchip driver and
> prepares for future support of YCbCr output and Deep Color modes.
> 
> Patch 1-7 cleanup and changes to use drmres helpers for the encoder.
> Patch 8 prepare for use of a display-connector bridge for RK3568/RK3566.
> Patch 9-10 prepares for future support of YCbCr and Deep Color modes.
> Patch 11 changes to use resume_early pm ops for system suspend.
> 
> [...]

Applied, thanks!

[01/11] drm/rockchip: dw_hdmi: Use of_device_get_match_data() to get match data
        commit: 1965bd5479655362f316035e16a49f4598526b37
[02/11] drm/rockchip: dw_hdmi: Use local dev variable consistently in bind()
        commit: 9cefcd0e83a38d9ede0bea988b4f7b2f01511e28
[03/11] drm/rockchip: dw_hdmi: Use drmres helpers for encoder resources
        commit: 3de723684be5c13517dea3dba287d06e12678c86
[04/11] drm/rockchip: dw_hdmi: Inline resource lookup into bind()
        commit: c19830fba394f3566cf763864dec44cfd357325f
[05/11] drm/rockchip: dw_hdmi: Hold a reference to the dw-hdmi bridge
        commit: f80fa5817952a24f45659b1377aa5da31941eab5
[06/11] drm/rockchip: dw_hdmi: Remove empty encoder helper funcs
        commit: f98f2ef3ad28ea09cbb1d3706dc59e84668f3fdb
[07/11] drm/rockchip: dw_hdmi: Clean up whitespace
        commit: 2ca256b5fe2325d0f1134789b507a621775b385e
[08/11] drm/rockchip: dw_hdmi: Set output_port for RK3568/RK3566
        commit: 1481cc03cc63fc0f6990956264cbb16c8f65f28e
[09/11] drm/rockchip: dw_hdmi: Configure HDMI PHY in atomic_mode_set()
        commit: e54d6ed9a0a967ada1e7222d7485e0cbb0e1f563
[10/11] drm/rockchip: dw_hdmi: Propagate bus format to display driver
        commit: dc70272cc184b945cf526a23999fc8645e76bbed
[11/11] drm/rockchip: dw_hdmi: Use resume_early pm ops for system suspend
        commit: af3a9eadc11896f6677bcb7102bfb7c84be48d2d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

