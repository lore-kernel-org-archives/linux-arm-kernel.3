Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4ABCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWN7gkxjFiGZ3cV0OWHAWJ+8N9Pyp+YRIV9vOKGoCOQ=; b=LFKWvtJx20bn2h7eC3K+9AIhDA
	UUrJkmtSD4D3SIuR9l0/58YVnsxg1g02bmUGIDllb2i+m3wCutqi0iXZ0/V4FaonWdyB+vt7b0Ll0
	pyHwceooxfpXu7vmdGE3uWECD2dGmjpyAkIAfjgTjfSBBx+pa+Hq5FgWYe5CjfaIoPDUW85TJsLRo
	xPzFdpp16f2DgDdbxE+GCrFj/yskcNZTSleOQ/BOgEI2QE1B6BdNfbmMhFNNUFBF/at26Pwujiod8
	w22i6iNoEDrHRG9AHmNVSTfgba6M6jse2eQ48a/rX4+jLNPJi4Mp35YpEABa4lw5X6N2Jkml21R3A
	1l8KFHbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoR9-00000007onK-1hIB;
	Fri, 15 May 2026 09:02:27 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoR4-00000007oiM-1ZhK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:02:23 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c8027e876fcso3771650a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835741; x=1779440541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWN7gkxjFiGZ3cV0OWHAWJ+8N9Pyp+YRIV9vOKGoCOQ=;
        b=Cpb88G5kGlVEE08QRbHDGlilnO3bKWCC07UNwEgd5FAd8zPphfuFBQeQHIDbI3OpnD
         js/FjzMZWr7b7dXHzw3WOnVPTt0OM7/eVUHfkh6CSn3ALPco7L+5I9EPvV+j4DGX6Sw+
         ItG9Nchjh69u6vbDX0kj2tN2fLjeDyIgQ6e2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835741; x=1779440541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CWN7gkxjFiGZ3cV0OWHAWJ+8N9Pyp+YRIV9vOKGoCOQ=;
        b=APYi3DXryqjQGTL4ZQB130BZ8tA8kd4w7PiDWDLghBeM4kjUU4x34YSzRJK5bD2lze
         keisPM8nVtHwOtG9nh2ihx+yoYaWRXpRgRqhlrCetyr+jgtQY0NWClKYoA7XrOHwuCEl
         iJzhxwW/P50bYSHby59nhIjAuAOn2nJ9Qu+8QUXTYrrnvYT/WU5jjSEZGNVop5Ir4zW9
         ukZhB7DO37OWE0bil8IjL9w/D9GL0NggTurzagNyuPiY8WP7Ni9nQpUIjrVp9VWv8CCO
         92KM/C71Fpm5toyBB+FtTKnw7/j18UgkoXjAcx6FigFbJq74Jqx70CHQHm3HiuS6RHSL
         GFpA==
X-Forwarded-Encrypted: i=1; AFNElJ+aPICZn6cEd8Z5kVYBW9OEcpyTXcnpSXMFy8tIJMUJ7j4k2U9Ek3jPwXIlXlS5/TGLvnOmXt0u5r3dqhTEfbqo@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzaaqr6Rp8lWBdeAGdz9Uo8yDnrox3pSDJegyg6s0SELKpXk55
	9Q4OicNW5HMGnzNj61Ex4x6T5cveg2nEavfmlG8qUh90yz+YSO3bzESO4rT61qMG0Q==
X-Gm-Gg: Acq92OEJUlJMjPPTVdHn22KcfJSU1uWez8c1HUtg7TyaiSj1x5uVrWLNjuBqwQEo9bp
	PRemq9eAacqNU+nYVXNjGWsopyuF5mlamSgA8291l/sAA+t4PRq0fY3xZzfFBhNG3D+qnVznwiW
	le0fW+1JvnE9RTMZXS0lxMa5da5vc/X4gtbv8LlMZydy2u2ENpOMbeDGxx/TUJSCplzXJIE9qY9
	wjKCKHhFNxayVY81Ac42X8RRvFDt2gnvCu4/rnegulwOZHaubivy/KC2Dz0Os58ekYx8HOMiIMR
	plULi4h1lpKleRVX0VydlfLAyx37c3GubyTV3HlSZE0W/uCmeWE+lm2LA7LfgVbGoGFjTacsf9Y
	lVpbXXbB0JjF186bS6NKCycbGlOk/lAtI87vfzRl4g8Skry45eDr2FEG4RCIZx3LV2HMstKVLPJ
	hCF5kqp5hfovV/NbYuertW6dZthZf8rAp0gqEQ8SKyXj7XHg+xXESE4xCY2uWosWpnk5QULBq6w
	+jIhxq4IRjlTHt9fHU=
X-Received: by 2002:a17:90b:5203:b0:35f:b288:8e4c with SMTP id 98e67ed59e1d1-36951a6722fmr2708708a91.15.1778835741437;
        Fri, 15 May 2026 02:02:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:21 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 04/12] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri, 15 May 2026 17:01:40 +0800
Message-ID: <20260515090149.3169406-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020222_410740_F61E1844 
X-CRM114-Status: GOOD (  15.13  )
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

The addition of power sequencing descriptor handling in the USB hub code
requires dealing with deferred probing from pwrseq_get(). The power
sequencing provider may not yet be available when the USB hub probes.

Return the actual error code from hub_configure() when it fails, so that
the driver core can notice the deferred probe request.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/usb/core/hub.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 24960ba9caa9..90ea597d42ae 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1998,14 +1998,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret >= 0) {
 		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
 
 		return 0;
 	}
 
 	hub_disconnect(intf);
-	return -ENODEV;
+	return ret;
 }
 
 static int
-- 
2.54.0.563.g4f69b47b94-goog


