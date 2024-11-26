Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4ADD3B98B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 13:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAOgYh5j+SwhH6if2YDkf+cLk18YFHVIqBQI2gqekAg=; b=BXGDwllt4i57cB0UXBRIWjwMNa
	r4zOYFMUhJAsBq92I0FzXfLNk58/kZtVjJVZ/0E1lcqtk18vFb5dJcocRWT/5WcDEB+2vXVdBWnhO
	LC47eJ8413A5EMKozbzyMjAwJNHS22Zee0KIdE/yLpP0KDbuQ7JBqQd/JKwNmkuu2dcIJ6D3V3fKK
	Fai0B889wg2N+voBbvXuPDjmv3vHoWqgL0HqZfm6nt8/N/QETqm4g9sD7vvtvv9zN6BQUUr1rAgke
	LNilzLr2mmbbXfY49DwkwUYDZY0vD+lxKZs8NoU/1MAKDWOsU5tHlNFGX1zkz07KY6kSvOMv+66xL
	8D27vwQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvfm-0000000Ak89-2E78;
	Tue, 26 Nov 2024 13:32:10 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvek-0000000Ak28-2kj1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 13:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=BAOgYh5j+SwhH6if2YDkf+cLk18YFHVIqBQI2gqekAg=; b=jH9q2g
	fpav4/Xv0+OPZFBUl80Ui6EaVsSTNnRONJnzH8v2l98vyBaMIz8KF8gGtlXxGatJEWN/Aqt65O4PF
	kDVlk4qu6t2uggymvlx6V9TM1JQ62SDkaN8dcWEVd2c/tDzC1GKShrpCRzE52rj4W1lUvL/XlTNqz
	7t+dlP4I/2lv+CweUmGrhdNxYn+yWNBrKnMxWjEncChobYMmYh9TeWZ2u/86geXxbrP57peTGDZih
	V1R3V5SqHRwvcZ25izIkFIfmCrNrGKe++E0PhMtJdNHPG927Qt/TRbs5axJ5xCiycV2fE+nq1I+N2
	J2lN9BwRaCost6IjzKjr0pHUQ9Sw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1tFveZ-0007CU-RO; Tue, 26 Nov 2024 14:30:55 +0100
Received: from [185.17.218.86] (helo=Seans-MacBook-Pro.local)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sean@geanix.com>)
	id 1tFveY-0003aF-26;
	Tue, 26 Nov 2024 14:30:54 +0100
Date: Tue, 26 Nov 2024 14:30:53 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
Message-ID: <tzcjzgp7xalhhezcv5hfa7cjscxg44phqcw2ap54lesly4gk6o@6dtco2d3jahj>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27469/Tue Nov 26 10:58:20 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_053106_696700_9CBC9C73 
X-CRM114-Status: GOOD (  11.34  )
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

Hi Maxime,

On Tue, Nov 26, 2024 at 08:36:01AM +0100, Sean Nyekjaer wrote:
> Hi Maxime,
> 

[...]

> > 
> > We probably need some kunit tests here too.
> 
> Good idea, will be my first :)
> 

Would something like this work?

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 294773342e71..26e4ff02df85 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -1364,6 +1364,7 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	struct drm_connector_state *conn_state;
 	struct drm_display_info *info;
 	struct drm_display_mode *preferred;
+	enum drm_mode_status mode_status;
 	unsigned long long rate;
 	struct drm_connector *conn;
 	struct drm_device *drm;
@@ -1408,6 +1409,9 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
+	mode_status = drm_mode_check_pixel_clock(preferred, rate);
+	KUNIT_ASSERT_EQ(test, mode_status, MODE_OK);
+
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);

/Sean

