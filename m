Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717D1C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1N1AnyMnsM3RPCrD9BtF496M7LSPX+hpmo/Y3tqyskA=; b=DumHdsS2sDe+eW+sxi6pyTONDl
	GsmJHySuIfD8vMnk7j5sjAjMc0o3ZC6nmmBZ2wRvV43MPEzq6gF6m/mcoSJLpNSTqj6k7i7OyHq+9
	qmRc2IjqmEfPguunLaSXn71sCEPgmp/kwVslT2FZqJZb8g71SYKwyoQ93gnT3ZtgXCE7W7tvIf4MZ
	Rqjlyz5LXIJVF184PX803e+AiwExLcKZhwrjGxVq+3N9C4/WPl2XxVQc3A27PKY7KF9TWgFqgSNWo
	upIMwTKvdXZKzoG7SI+NHJ9f79lgB7yjjNLOJAfmn7QOLkDV0n5mdC7OuIvjQRuVBtzNgt6uaCNPS
	BqJPYJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gLz-00000002jGN-3Gov;
	Mon, 21 Sep 2026 15:54:51 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gLc-00000002igE-2eJJ;
	Mon, 21 Sep 2026 15:54:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790006029; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bucFePsIG3sHaaq/2CBWDuM6TEQB5ZUvSiVK4L87uB8k+NTxy+ifG1BiI8b4jqBlbXCNYrQDmCA/4OGZvHfYxCui3ll5076Kw9Pybc26IofFFJAlIpftObLG2oOywgrWVuvUAZaPUKTEjZhkc9qVXqXJRdtyOTZhjyQ7I+cg+9I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790006029; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1N1AnyMnsM3RPCrD9BtF496M7LSPX+hpmo/Y3tqyskA=; 
	b=iu3kjXMKrd5USM8jXxUw4CupgHeqjWdNt+Y9RDnUzADslvyhTk3jhiWYx3CZdpkEtPp1OD0R3Krt0Ixe8pasvpUlq+Y41zSNN62JwhWldKEe0CWNv0hJy1WutJTuN9LhFTsrXVJVPUUozy1zm0TUsIWuZq2TxVHcOIEmraV+eEY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790006029;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=1N1AnyMnsM3RPCrD9BtF496M7LSPX+hpmo/Y3tqyskA=;
	b=Jgz6DvBOy9K+i2RfOAOPfYf7p6Y5KWJ1d4xUkaPCAHzfCYATKkhhFEz2coekjKsq
	pp87lncyTbEAsYCTjfRS7KVQQb1SMPsHoxZYEo3Qrl+ZltRJCRpZdwvnFwMSU2V39dY
	qzCVkuN7ulHwQJzmRYiR6hkfDv0aM0zLuFYZw5ts=
Received: by smtp.zohomail.com with SMTPS id 1790006028396815.1028205617608;
	Mon, 21 Sep 2026 08:53:48 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 21 Sep 2026 17:51:45 +0200
Subject: [PATCH RFC 19/25] drm/connector: hdmi: Add QMS to VTEM EMP
 generation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vrr-limiter-uapi-v1-19-2fcd7d011646@collabora.com>
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
In-Reply-To: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
 Leo Li <sunpeng.li@amd.com>, Daniel Stone <daniels@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Derek Foreman <derek.foreman@collabora.com>, 
 wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_085428_963831_1EBB4565 
X-CRM114-Status: UNSURE (   9.88  )
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

If userspace indicates that QMS is desired, set the QMS related fields
in the VTEM EMP struct based on the connector state.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 7dbd678cf061..7237070fc9ee 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -897,7 +897,15 @@ static int hdmi_generate_emp_infoframe_vtem(const struct drm_connector *connecto
 		return 0;
 	}
 
-	vtem->game_vrr_en = true;
+	if (conn_state->hdmi.qms_enabled) {
+		vtem->game_vrr_en = false;
+		vtem->qms_en = true;
+		vtem->next_tfr = conn_state->hdmi.qms_tfr_byte;
+	} else {
+		vtem->game_vrr_en = true;
+		vtem->qms_en = false;
+		vtem->next_tfr = 0;
+	}
 
 	vtem->m_const = !vrr->dynamic;
 

-- 
2.55.0


