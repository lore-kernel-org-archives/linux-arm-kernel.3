Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EE5C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zn8Ob/lYJrtvb6nSm3sGvGJOnXJvrAS/9UT9vBl2poM=; b=dm3Oq2K6X0Q/hMEAUZC+kWy57D
	2GjfukkOq7sVzwRO5qbYcT8n8R2xHEEhPLHj6bCnUuWeV1pQPJb0KkWsK+n7XhmFikQ3Si8Ig9Pqe
	ve7Em0goT9j1s18RZfclBIN+iY5K5xLcI6nzDUsoK4TkeKfvJTQaHHEhyZ7NoL23vgWHu3Wr/4oR8
	CsSNIE8WKG/IBVA/Kxo8pubUiKlaezHRJRX0nwSlkk4DD8jugIJ0OYjUaYgsjnARGNxv8gikxpHZP
	wWfedDoK19MyPg61ZrXfc+Mjo5jLXCHtVjgfaBVdCz+gM0nYtntqCqrZGEykjVSdTKP9DG3pi8ziM
	35d6rxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtNL-0000000HIkY-3vil;
	Mon, 03 Aug 2026 14:10:43 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtNH-0000000HIhY-35j3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:10:42 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6aca0f482e5so2223452eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785766238; x=1786371038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zn8Ob/lYJrtvb6nSm3sGvGJOnXJvrAS/9UT9vBl2poM=;
        b=PLaM+gN7FvbUkrnWIQkjPejKcgVS1XMn2B4KNH7oNVRdUCDMhaC/HWO2/uniJvZLBt
         Z+/6v5/KRF88uyhz/UEvmZYcneNikdkDGG7ANhylX+PFN7Fnx6teaE009R5z8/VsiC23
         qRccOSp6gvCIpNlowWQ+2ibHxjwtzQ9XbNwwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766238; x=1786371038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zn8Ob/lYJrtvb6nSm3sGvGJOnXJvrAS/9UT9vBl2poM=;
        b=nk9H6G7D+Jevlsa11plncEqzsmrASfxFFcsnwAzq4nO0yAWqDnK3gP2+aKE7/xR0Ic
         uYrLBfgNsl/yQkZfwVAu/h+YvaLzwSWEmQLPghfzi+VPszQMzNJKA/rWyIwDFrp12qON
         /7ssRnpQP0RoBM1WHKTYhwAiEKwksRbdj4AWEVYydSCALNZgEtHbEKOgyjTZqo21MzHg
         teakfrSRtj9DXb3EgLMjX85RtSckzXY497nVydkfoagMAwSj8hPnHcd5VYZarU1oYCqP
         y0syyRm1IODyfGgLke/2PoZa8XfSCOKusvoeXH73J7KnlwZ5IDvMFYQebLQkxSxW1unp
         X7XQ==
X-Forwarded-Encrypted: i=1; AHgh+RruKC6mAvX+ZcTbHEXURIggKAKEMfIKRHCeJz4n2zKEdmf7Mi7r91OKfJx0T6sTDJG8tXGfHk4fjg8+Oxwz5GwH@lists.infradead.org
X-Gm-Message-State: AOJu0YwXIuxCD5wPeiNrM64u6NI8Ra+nSQjjdKn6Uur1h76uDlhrvxuR
	09bRe7HuSrB46P981zwkRwHy7QljUOe1LDJO/rpBoS0sakKLIQvA83BU1T3X28pWXYU8mQ3jUsu
	by9A=
X-Gm-Gg: AR+sD134rO4Sdj70d6yGHhX65kcVLF5cjAr+e5oTlrTHZSKVtTUX/lT/XeEAWbOsA5d
	+wUgKfFdODIdel/+pA/xuGEktpAN8W9XOm/cBTeMn90YIBRMqP6nnF++s1/DTH/NCn9iWO13imt
	39ZdrcnbK0b3SdIWnQljZOZAD9oiTHy9CEn3D2fJKmbBWqtlYG/WKs7LyfX7Pd17ZJwNGo9Blsr
	8gVIhUNZ1jaPNVtUJHGK3With7SZvZKCDurEikK+QYBm7N+V7AIcpZR7e4dPYgt02SXuGSLUjco
	11s9YzNEBqXz7JNlMqk7hfQE8b11Ta7y9u6qVNgGbfsXGPpj2g3B1MnZn3uzUnAkAsV+5BFBzzI
	PyEK1BJN5G872oJjiGqpAOw2gW3MjOKf+8citakaTGtnJk7wOiBd9l2U5RQsV5qJp9+ZN9FdL4R
	fFTGV2Hg8CqacWBnBN4+Svq9c7rJTPtWwb63oqs5eyhPa6MqKtyoc6KgA=
X-Received: by 2002:a05:6820:4a08:b0:6a1:5b63:2ae2 with SMTP id 006d021491bc7-6ae4334a975mr12207278eaf.29.1785766238536;
        Mon, 03 Aug 2026 07:10:38 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae3a0c9162sm6526695eaf.11.2026.08.03.07.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:10:37 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Jonas Karlman <jonas@kwiboo.se>,
	Simon Glass <sjg@chromium.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: rockchip: Reset the pin count when recalculating SoC data
Date: Mon,  3 Aug 2026 08:10:23 -0600
Message-ID: <20260803081024.1.72f72067ea890a9eac79d63bf655738bec374dfd@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803141028.710706-1-sjg@chromium.org>
References: <20260803141028.710706-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071039_798759_F83AF0D8 
X-CRM114-Status: GOOD (  14.18  )
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

rockchip_pinctrl_get_soc_data() mutates the static per-SoC data. The
iomux and drive offsets are recalculated idempotently, since a rerun
anchors at the values calculated before, but the total pin count only
accumulates: each run adds every bank's pins again. When the probe is
deferred and runs a second time, nr_pins doubles and every bank's
pin_base shifts, so later pin lookups resolve to the wrong bank and
the wrong registers.

Reset the pin count at the start of the calculation, so that a rerun
produces the same values.

This is verified on a Luckfox Pico Mini B (RV1103, with the pending
RV1106 series applied) by forcing the probe to defer once: without
this patch the second probe calculates nr_pins=304 instead of 152 and
no GPIO bank comes up; with it the recalculation matches the first
run and all banks work.

Fixes: d3e5116119bd ("pinctrl: add pinctrl driver for Rockchip SoCs")
Link: https://sashiko.dev/#/patchset/20260729132736.3807082-1-sjg@chromium.org?part=4
Assisted-by: Claude:claude-opus-5
Signed-off-by: Simon Glass <sjg@chromium.org>

---

 drivers/pinctrl/pinctrl-rockchip.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 7e0fcd45fd26..8bfc7ab5de15 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -4296,6 +4296,16 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 	pmu_offs = ctrl->pmu_mux_offset;
 	drv_pmu_offs = ctrl->pmu_drv_offset;
 	drv_grf_offs = ctrl->grf_drv_offset;
+
+	/*
+	 * This function mutates the static per-SoC data. Most of it is
+	 * idempotent: recalculated iomux and drv offsets anchor at the
+	 * values calculated by a previous run. The pin count is not, so
+	 * reset it here; otherwise it accumulates when the probe runs
+	 * again after a probe deferral, shifting every bank's pin_base.
+	 */
+	ctrl->nr_pins = 0;
+
 	bank = ctrl->pin_banks;
 	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
 		int bank_pins = 0;
-- 
2.43.0


