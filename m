Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9754ACF258E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 06:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/E2wj8U1nC9oVcIMFJW/hIrDo2ArudwTBYEUCh9D85s=; b=uZuoKJDUJ3vjU+dmO5/uSdN4qB
	vHm8vMNtcKIw/NGzkrq2WroOEyD4QAOM6rH3FVpH7ISAkBtSaiOQkqZuNswkUVshdzBMQCR5DlwuI
	leHa+qcoUAr84UT8OemeQWDd0pbdD+hEuiwxUgmOFu+Iln3JB8skZaMVjhXSbpIJYQIq9Ad97Yer9
	TzEtWNjEKZkHzZKCrMuT3lwtyT0Ttej70mCgUnbrrWrfy3qXt+Cmn1ZoQDVeKyM8bsDEUlOnRG+P5
	OoHeRBsLH9FJKDt3KTkNCVT0r0BQQnY6APB49nCeg5LIRcfpcPeWono16SiIfIYqrwUXJWQ9CKDZ8
	R/0tz5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLc2I-00000002eSN-2Qsa;
	Wed, 19 Nov 2025 06:51:26 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLc2G-00000002eQx-0wP9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 06:51:25 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id A9E57240101
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:51:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1763535078; bh=/E2wj8U1nC9oVcIMFJW/hIrDo2ArudwTBYEUCh9D85s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=kb6jrvKfQwTik/7yr9pDUpatvP8wJePXBwuc0UZxx00M9T4h4LWCSYSXkqb828Wik
	 DMq3tWT3sGqWkQpOzgUESndK9UZ02u1dia0XUuWrsEAFwpvRXIs7owS09SuazkNTT/
	 xJwcJ94RgmADR/iofQ6M142tgQACVk49O+qeyLmsTPO/6D9AKTEXds/rnAYMjEbOMy
	 2kjDdFch91As7HSz1BiVutnMGOuWwFYMucbYbLiI6/i9QYVVyQ/B6U2zMCLwRjAx37
	 gvECSxnpvUs02cj2qwThaONxAfYvK8NxBbIlGmYj59rNQtrcaWtyUt8LTYiDuRk4O2
	 EeOvZCrljuhzw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4dBBw42Wlsz6tw1;
	Wed, 19 Nov 2025 07:51:16 +0100 (CET)
From: Martin Kepplinger <martink@posteo.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	airlied@gmail.com,
	gregkh@linuxfoundation.org
Cc: kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Martin Kepplinger <martink@posteo.de>
Subject: [RFC 0/4] how to link a panel to a touchscreen controller driver
Date: Wed, 19 Nov 2025 06:51:17 +0000
Message-ID: <20251119065109.910251-1-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_225124_427145_1EAED689 
X-CRM114-Status: GOOD (  12.92  )
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

hi,

When there's a panel/touchscreen combination that is sold as a combinded
module (with the reset line shared even), how would I connect the 2
drivers and make sure the touchscreen driver probes after the panel is ready?

I have the feeling there is https://docs.kernel.org/driver-api/device_link.html
for such cases. Can you show me examples of 2 "random" drivers connected
in this case?

In the past I also played with CONFIG_RESET_GPIO using the reset-controller
logic, but I *think* this is more for 2+ of the *same* devices connected.

Might there be yet a different way in devicetree I'm not aware of?

The below patches - for completeness - are only the workaround for what I'd
like to do, exposing the state of the panel so that the touchscreen can query
it.

thank you very much for any hints,

                               martin



Guido Günther (2):
  hack: drm: panel: mantix: Allow to query enabled state
  hack: Input: edt-ft5x06: hackery to probe after panel

Martin Kepplinger (2):
  hack: edt-ft5x06 / panel-mantix-mlaf057we51: declare
    mantix_panel_prepared() in drm_panel.h
  hack: arm64: dts: imx8mq-librem5: add purism,panel-librem5-workaround

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |  1 +
 .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 12 ++++++++++
 drivers/input/touchscreen/edt-ft5x06.c        | 22 +++++++++++++++++++
 include/drm/drm_panel.h                       |  2 ++
 4 files changed, 37 insertions(+)

-- 
2.47.3


