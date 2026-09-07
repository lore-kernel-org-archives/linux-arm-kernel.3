Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74748C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 05:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5qbbR1yQ4iI2orK8p1mAk+KPmFDgRJcpOZbeD4+1ts=; b=MmTwBBhKrMFFQJW28bzsuypzSE
	DSiob3LEXpX9xiXIDc1djH6Mfd5mvxZrb0BDUOuVbFRinQhu2JS/DJpgZimuphcBX7Dy96duAvP5O
	ECJXEt5SegI1jGnXu1I2NrQkeGX1BcXNhZYoPKM4cf6z0HQa42TBUuT5AtIgirzgnwHtQwWLEGrMz
	efNSlYa9xNCoc5mfa1wnKsaaIBZb/xUz35DDkRtfymoI95rsfUC0/Ep/Z1aeyFwAKnHnRfIjC4VKL
	VaG2C7U7ayMSt67uP85ttdfEGaXFLD6/P8ktWr6AGDTzdfdKiO2SslkawnvjQRJ+WEU7ZWL1qc89i
	kZYMhxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SAj-00000005xYd-0o1J;
	Mon, 07 Sep 2026 05:45:37 +0000
Received: from mail-oa2-x0a.google.com ([2607:f8b0:4864:30::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SAg-00000005xWF-2QxA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 05:45:35 +0000
Received: by mail-oa2-x0a.google.com with SMTP id 586e51a60fabf-46adea418f3so1086752fac.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 22:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788759933; x=1789364733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5qbbR1yQ4iI2orK8p1mAk+KPmFDgRJcpOZbeD4+1ts=;
        b=sa2Van/4is9Qu1EWH5dsEescgN0LleRAYxaFluy0qzm9fgGWXFtatPNMtASUvjj5hc
         rb7v3oY3jMyM+Otheqn5Rysj3sEk6cg+77WKpWN6R2n3n1k8MVyX1l/5jQy2h0wvINdY
         vWJmUBzf08B3n1pJ5jEscGCdCFBblyTJfJhqy4f1SvpBU4EtEdw0Ns4+zrjTt76DvClg
         NZlKXrCa8evH7woyDEQZX7+2SusrwvqZuCVU+kxdUhmwbia735vo3jgrI3VrZOBVTH+h
         YF78XuiXAby1CE0NMUitb8ivxXmqFH2CpMvNK9GOwqeTfUK56PzPwGuoWZcreXYt0RhX
         mOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759933; x=1789364733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o5qbbR1yQ4iI2orK8p1mAk+KPmFDgRJcpOZbeD4+1ts=;
        b=b0sbgP7WPmwXOhz31baU1mp1qB0TmMt1L3XmjTJh70ZWqq5+42bhRAJ0ec/M7uh4e7
         g6jHxUL1kRthu+8tkLZzwUwyi04xjA4PfLLm9r1MLDdYu+F9X3FKOpttEmtDgkt8TmQK
         YJRsptlUUTJsMbZ4xgbVYAf9CE2+VStIq2RxNpDOmVFBCPke6QV7uFEajTGAcd7V78Qw
         tuL+x5iRhWc5Nx8QlRhDEc37+O9BXsZgmOVN5kUdkgQwrCw+IvdhIjtGfIl0pnUaFHWs
         EUq609BsgebcaEm9kMPgTLCPe8yqk7/G0Sjf1RfhkSUwiHKkDsLiZJz8aWVSgnIBpWA6
         9eIg==
X-Forwarded-Encrypted: i=1; AKwUvByNRQ1GbazYcQ7ujHjRrM+o+vK/R9hsA6++PcpoFpaBjEQox1I6zrp8OtpVKzWm/8Aw/3rJuhZW8OdpdOYZWWnZ@lists.infradead.org
X-Gm-Message-State: AFuF++l33FGanzKkhd2wu2NVNMEAOvWF+QdwjNAOIDhlbwfkUPBq0Rl4
	/YcKCGu7PTSv5pCMhYGmALjlVLejIZutCcrscb3lzmjSLNUKXwlDFtqD9yyfodckh4skNA==
X-Gm-Gg: AYBFou0bmWjihEdTcEp4HufwRL9NKRgF3jWtiDM9tippfK+VARb147mRUjomXIM53ip
	3DNUmlienUEPQsD1mtuyNKCHTZO4jjaoCJ0UCm7oC/FYDpKFyi1ekhs3cmFZer9MVevUj2LQBmd
	sN/C3h2tEn25ZxZiUpgnvEYXnCpsebiQ3JpxWeY0MLPzZ9/XYhrCmnC/XZ0aLfhQ7cQ/7PaVPek
	1o+UM0oLoaZ/5OD/cPGtX38is7emGc0svpUF2rIMT9lEWw0NtmWSHO/TMghC9VpAfsNXBLos8l0
	ryIfVd7BkJujBZXPqjZPvHDYBH9HoSJWke89/jGUVCPuQvq7wCUSHVN9jm0J3NykGqOXPTVC9mc
	ZgeBm70CJrBZouiJDxRhb/U92zmqCW5bKpLc3E2dk4ckwXegbifnSssaY02ULIVubfuAASAonj7
	iaw9X3DrGxs2cWlHXHeRIvIwdltIoQKBxymcHbiVNsSKDC84obHedd65KMbotGxA==
X-Received: by 2002:a05:6870:96a3:b0:440:67b1:b59b with SMTP id 586e51a60fabf-4754d5745e0mr13037030fac.0.1788759932942;
        Sun, 06 Sep 2026 22:45:32 -0700 (PDT)
Received: from ryan-dell ([2600:100b:b039:79f4:f7f:ccf7:cd6f:384])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47989a71ebbsm204482fac.17.2026.09.06.22.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:45:31 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Nickolay Goppen <setotau@mainlining.org>
Subject: Re: [PATCH 0/2] drm/panel: add Novatek NT51021 1200x1920 DSI panel driver
Date: Mon,  7 Sep 2026 00:45:06 -0500
Message-ID: <20260907054509.118237-1-ryanbrue.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905-rbrue-drm-panel-add-novatek-nt51021-v1-0-939f59e89fc9@gmail.com>
References: <20260905-rbrue-drm-panel-add-novatek-nt51021-v1-0-939f59e89fc9@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_224534_677780_46C77648 
X-CRM114-Status: GOOD (  12.24  )
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

Please disregard this series.

Nickolay Goppen posted an NT51021 driver a week before my patch, and I
didn't catch it.

https://lore.kernel.org/all/20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org/

I checked that there were no patches on the mailing list prior to
working on it, and then forgot to check prior to sending mine. What are
the odds, for an 8+ year old panel? :D

His covers more panels, but my panel seems to be slightly different
from his, based on the vendor kernel I referenced for my bringup. I
tested his driver on my hardware and it works; I'm going to make a
reply on that thread, and I will set up the Amazon Fire HD 10 panel as
a variant on top of his series instead.

Sorry for the noise, I'm new to this and I hope to learn quickly.

Ryan

