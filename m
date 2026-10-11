Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0192CA9ECC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 21:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXE8pfEZXuSFtvC6/Tl1P1F3UmZY6SoQVpTiEIRx1zo=; b=1GW/xAI32wkCp90qmD3pAdjVzw
	kWYlN8qV5BnTnHZVT5QPTA704FEj6BYriZ7LNQLmyY2LJSORL6XJHZyvMx21/Er24Ybqn9H2LLCEC
	rl7Pcfw9MH2IMrqn+M8n7wiXFZDGz64qSnBL8fFoZYbOo+sL/39oLAa8NgADtaLSuNxajhTFcRa+f
	Kb6bu+/QcI8EnGBHMi1hmSCVJEyU/7H6dEOKtqjp3NWvO2T9O0/vWixPiJ2d3Mvp2PtBjzwZTnPCY
	R0SXYvUnGyJZvkvP4CzUXE3exPcVKdZOSR24oaXQwz2VtMEkUnOSUOyIjAj5RCpewThVky7rYybhl
	SmH7Y3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0eJ-00000009PV3-0fLq;
	Sun, 11 Oct 2026 21:00:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0eF-00000009PTl-3vgt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 21:00:01 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so11998305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 13:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791752397; x=1792357197; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXE8pfEZXuSFtvC6/Tl1P1F3UmZY6SoQVpTiEIRx1zo=;
        b=hB6gXKPg4HLsgZ8NY+DMafZ0yGBStu90cKEJSzBNvASb/kyO1nBUUidaG9LYFtA9QS
         dtlo/CK0v1/tl10uTbQMqP13ODRKOSc8vogbIzcr//e598M4dDesQtR1ehXkAFoFJu7M
         92Zyys3JWfxWZUHbvYsdrw8sHKStR++fgJ2Gm0hmuX6Ia1fFZRKtNkKoenWd7irsup3v
         fBGJzZ/OmyXgqAr0UsZ0V1Gf57/iA2vspFGyrP0yPJy1q0Tv+ElVqm4SGoFj/yL5GAxX
         tkaCdb895tNobKioXytDvhoA+MJFtp8kxcKHklm6cKKb/01LR2DRwck4yldOMnNbZpCj
         oPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791752397; x=1792357197;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXE8pfEZXuSFtvC6/Tl1P1F3UmZY6SoQVpTiEIRx1zo=;
        b=rZVLpCmsweXNtQ/JyPYnc7WhntI5UckrJUL6f46LQEruXFVeRce5CAuSPkiNtX0WWF
         IYxAQ2ojf4tAYQ7F6hyx4SddglotLNEjrOxI//Iql2htog5WCpQfe7dRTY0jT6l3zKKi
         gBRSWo1Q4gFWNEZZD5ozxeY88AX/OB/+QjhST4lihoAccxW6OZdG9VTdnhyaVnRLW27a
         NhbUHw0IOTik3eisw2zw1JnB7rBRIzysosVSTLHs3WAwLD6tDbHq75BKjzV/y54lAEbE
         mm1HpaY+nvA/mDejBDpEwgGv7I/vk08W1aX200pQL0ZluxQwgCQzu1IU6FKOtEFYVXts
         2e3g==
X-Forwarded-Encrypted: i=1; AKwUvBxH78M2emMpi9YrdN9a2cMIPRcsLLsf0TDJcvOJ1GEEQMMeA33R/msE0F17764H39c384RH7NVx4tP7umowWh75@lists.infradead.org
X-Gm-Message-State: AFq9FYK+owUQjRlKkUK8I2cFTA5xlr/AZtnpdZCGhSkI97ElcBo5LCXY
	kFxajRWu5nMuNuv2IRVYN6FkdVNHnM1fRPXmQ92yCFtSA+mgJZpwQuyQ
X-Gm-Gg: AYBFou1QwxLgZJr2obIUM5NnRFLivlWFqufMAPIBUpHper1bvF23STa1p4HBiDzsRVW
	Ci0Kvt3UBM6E3jUpyZPeF896bReWnncPYtO5Dnw1Yrl9A767a9q2MqV5Bg/Vi5bpaVcA+pNxlIb
	fOZoGaf+LaWi3RkbaPlbjUrC+gZ6IAx5KJckvBoDye56l4/ICRWqGq909a4eEkxg5SEIfRRKdhA
	CWEg56Hvc2jsdcx3psXrDCxQwj3tRSos5VOOv91su888OBxW2A61Wceh47/8KUo7uJo5dkp3GpK
	eRhI3LYXc4++Nab4kysWo+LWjbKOa1yqRIgCf1zZbHjDPmhTb4yblbmPlYscpf7XwWDpezwMoKL
	MPKsXZuyc1KEoBmoUw1qvQd9siDTrml30bSqvECeJYFfdZ2K53LWxscsoaES4//xvuHhIL9ZIcu
	zlLXXqNoboUWI8JeVrOhM0fRdKGWw5gaKjaF6EoAR2ecpNLm1t0z3G11yLbi+sAEKfkIHFq06VB
	BZjLb0QSY4hBRUo/AxYKSflYVV1bI82T8hKUuNcdzrjjksm9kbGhrODTg==
X-Received: by 2002:a05:600c:3f0f:b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-4a18e4cd231mr144688665e9.22.1791752397395;
        Sun, 11 Oct 2026 13:59:57 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19c8244edsm67465395e9.2.2026.10.11.13.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:59:56 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
In-Reply-To: <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
 <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
 <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
Date: Sun, 11 Oct 2026 23:59:39 +0300
Message-ID: <179175237937.1513478.8957286812154054574@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_135959_992311_519A635C 
X-CRM114-Status: GOOD (  12.70  )
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

Hi Martin,

On Sun, Oct 11, 2026 at 10:49 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Question to Neil: should the eth_mac node be moved from meson-gx.dtsi
> to meson-gxbb-odroidc2.dts?
> Odroid-C2 would be the only board using it and u-boot seems to derive
> MAC from SoC chip ID/serial number instead of reading it from eFuse
> (so I'm not sure about the status of MAC address in eFuse on most
> boards).

Some data points in case they help Neil decide:

- Mainline U-Boot does read the eFuse first on the GX reference board
  files: board/amlogic/p200 (used by odroid-c2_defconfig), p201, p212
  and q200 all call meson_sm_read_efuse(EFUSE_MAC_OFFSET = 52, 6 bytes)
  and only fall back to meson_generate_serial_ethaddr() when that does
  not give a valid address.

- On my ODROID-C2 the eFuse at 0x34 holds 00:1e:06:37:d9:37, i.e.
  Hardkernel's OUI, and that is what U-Boot passes on today.

I can't say how many other GX boards have the eFuse programmed, so I
have no strong opinion on where the node should live. Happy to respin
with the cell moved into the board file if that is preferred.

Thanks for the review,
Fil


