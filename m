Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3DCCD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:
	To:From:Content-Transfer-Encoding:MIME-Version:Content-Type:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xYonZQ3TjP2OHTnx72eBR0nQTkpG0xtLicGzccWsuBU=; b=kBZ4f8O+rVUHtNs6/kIIIpbizb
	wBxzMoNs79oCkVX0xtGuXwVi1Ic/Fl/9Win9rC9SFcg9K3qVCc4rnPnwKAfur2B/gNheN5MgsADPG
	buajUdjs5xAUmxdJ+hpdr4zPne5tQsnjE/cQsI9PaWcB/3MJN4mCYNsj7V95J710SoYTT/8m042KK
	fOh4j6Y53GhLvoKYD+IOmkS+sMDLIe2bmMX2DUirtT6ehhFcTLvwSaN9Azv6+TXDiaZR7DurOvWbv
	k7wWYLv6Or2ifn0ZDG1pW650KcFVYxgAeXAWeNFy0vl0BQlMTt1VFHSGlnny3ZgesYs+qRPBXNxZK
	SzLGy39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLd87-00000008aL1-1Gmg;
	Sat, 09 May 2026 08:33:47 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLd83-00000008aJb-3RAg;
	Sat, 09 May 2026 08:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Content-Type:MIME-Version:From:To:Subject:
	Message-ID:Date; bh=xYonZQ3TjP2OHTnx72eBR0nQTkpG0xtLicGzccWsuBU=;
	b=QkraBVrPum9joka+8K4Cuwo/J0XGRfSu18WJgZ9yucgIZXuFjeGx6M1b4abJR8
	11tBtTubqj646VH6okrECndzmrw2l933Kn0VxDIGF9EuROigKJSs8CRdgV0zqyI9
	4rAkUzm98eeToDR57UrZqHFKmMUDjsf7vsa7NCRX7VOnE=
Received: from [127.0.1.1] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3fxdW8f5psT91AQ--.64046S2;
	Sat, 09 May 2026 16:33:26 +0800 (CST)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Jiaqi <shijiaqi_develop@163.com>
To: dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] drm/rockchip: Fix error handling and resource leaks in Rockchip DRM drivers
Message-ID: <177831560568.322716.7926332149561323511@163.com>
Date: Sat, 09 May 2026 16:33:25 +0800
X-CM-TRANSID: _____wD3fxdW8f5psT91AQ--.64046S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr47uFyrtFW7JF48XF4ruFg_yoW8Zry3pF
	W3W3sY9FWUGryF9Fs2yF4xAr109wsrZa42gF97Kr1fZFy5CrW7A34S9w1UuF1UCF93Ja1j
	qrnxJr4Fvw4YvFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjHqxUUUUU=
X-Originating-IP: [42.63.126.112]
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbC7xisAGn+8VhhEgAA3W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_013344_243118_47D4A622 
X-CRM114-Status: UNSURE (   8.04  )
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

This is v3 of the patch series.

Changes in v3:
  - Fixed Content-Transfer-Encoding from base64 to 7bit (was
    incorrectly using Python MIMEText with charset=utf-8)
  - Fixed Message-ID domain to use sender email domain
  - Fixed patch subject format: [PATCH N/6 v2] to [PATCH v3 N/6]

Changes in v2:
  - Patch 3/6: Removed incorrect devm_free_irq() call in error path.
    The IRQ registered via devm_request_irq() is managed by devres
    and must NOT be manually freed.
  - Patch 5/6: Fixed trailing format issue that caused checkpatch ERROR.

This patch series fixes 6 bugs in the Rockchip DRM driver subsystem,
identified through static code analysis and confirmed by technical review.

Summary of fixes:

  Patch 1/6 (Critical): Fix of_node reference leak in
    rockchip_drm_encoder_set_crtc_endpoint_id(). Both success and error
    paths leaked references acquired via of_graph helpers.

  Patch 2/6 (Critical): Fix dangling crtc->state in vop2_crtc_reset().
    kzalloc() failure left crtc->state as a use-after-free pointer.

  Patch 3/6 (High): Fix vop2_create_crtcs() error path cleanup in
    vop2_bind(). Failures returned directly without calling
    vop2_destroy_crtcs(), leaking of_node references. (v2: fixed
    double-free by removing manual devm_free_irq())

  Patch 4/6 (High): Fix vmap address caching in
    rockchip_gem_prime_vmap(). New vmap() results were not saved to
    rk_obj->kvaddr, causing repeated mappings and potential leaks.

  Patch 5/6 (High): Fix leaked vblank event in
    vop_crtc_atomic_disable(). Pending vop->event was warned but never
    sent, causing userspace hangs and vblank reference leaks. (v2:
    fixed checkpatch format error)

  Patch 6/6 (Medium): Check return value of cdn_dp_grf_write() in
    cdn_dp_enable_phy() error path. Ignored return value could leave
    GRF registers in an inconsistent state.

All patches have been verified against checkpatch.pl --strict.

Signed-off-by: Jiaqi <shijiaqi_develop@163.com>


