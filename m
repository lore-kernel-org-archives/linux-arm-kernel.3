Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C404C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ygqN/5aySUJAjDby6ggcqL/WOD8GS0n0R4kFPbVzOoI=; b=UhfPsBRyAr1MkBptsU6Nzcr8tu
	EXgcBa7aSdmLSbA04vI/TvWNVfbURsJaCSX5VHcg3ouYZ6Wu+KhigGTA9rW1fTaYcHNJBcyL//GpI
	t09yW5TVZ2Hntj6mOLHzpsT/tj174VIWZQh1OjdsV/g803UgjnV8AbFD1aZwKTsKJ5/qBG70lqJKF
	hrdA2dcRy2JABFu9YtOdzzqA8zBorjKsfimXMCXPvVbQlL2tRCnOgPQPH1FJI7ZypQJ6gkmPC+tui
	5cCpjDQ51NvDqtDYPnvP4XIrh/lK7JSe+FLWTw2Pp5haRJzLCxm1CFPg71pTj6b3EvUrMp+4o0NPA
	f0o78qqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22nC-0000000Gmvl-420e;
	Thu, 03 Sep 2026 08:27:30 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22n9-0000000Gmv0-24f7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 08:27:29 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so2439760a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 01:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788424046; x=1789028846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ygqN/5aySUJAjDby6ggcqL/WOD8GS0n0R4kFPbVzOoI=;
        b=hjzgpnEu6QfvAV/R7E/Lfc/CNNDM5A2zeX2KUfkFAuDWQ8kRGEdsqCeukYyEk5R05g
         vPSGnE+QKIzgJwwHXdFAD6Dj94Vx9KdnZxzwzS2W8NZnj5UtdL1FOrKXABKyqar0yJl5
         U7P+ZDmTJ800X0REyn+vQXhLRHb/O+B0i1+lPP7W1nCoLRyEbeILHVnCiTW+i/7tsOAo
         LabmzSk4xmueW6X7j41g+FUihSt42Ec3yP6RM/VDkoMHcoi4r2JzF4zKaVqG0OklG8Bu
         D47FF4BnAJkfTbXO9uujAlq4S3xUwDpCR0VNtQspe+s+pxiq2ZpFxJUY5gKdVH8Vp/uB
         dpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424046; x=1789028846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygqN/5aySUJAjDby6ggcqL/WOD8GS0n0R4kFPbVzOoI=;
        b=ZVDg4XQZDPIi935Y3fxtzQty2TYO0wAxDur+jWnNNMSxuSFItirEVLfgj9RFylRbOb
         wJUFPHEJwzCDBE7M/eoL8CzkhFc4HJ43XFNWMlfS8hPuxWT54Cxs3eCydTMEPjp9S1n8
         vi3IEPcALgnmc3Re52yHYJWuvR3mWDkiOfzORI+215w0ZfzbZCxqbGlWL4RFs8rvkZh8
         tfEKx5HXBsWRMFEJPj453sqxNJLH5wXYT2HGlQmvWbYA3CrbkMEqtJeJPTlsftwFTQtu
         WzVxwMVnnnyH4DrPM3modbWUVtT2+Viq/Lz3dEkuB1SjTSV1yhXYOWZ+WDW0VVxdV3XC
         wGDg==
X-Forwarded-Encrypted: i=1; AKwUvBx0zxM5H/mAefLp5xqNKc28CWIZx6KIYglRMl6AbSAaOXDNj4kbTau3BpEVxwdObh3V2aB91KV+bRZWyHbJd4HE@lists.infradead.org
X-Gm-Message-State: AFuF++mnPUb6DUGrxf8isc6Pc2oKLKA2y0EjNDzyx/81fzIbMZPy7RGo
	2QfsxKDAFiARGzFSOxg8TQtJacfFZRs1ppAX7wvaq8TtOoLo7eCLTJAo
X-Gm-Gg: AYBFou1wihrEO1tXiNcAhWdebonjcQwdt6722GhBVawuKuIcV7kQ02217ysN/vNM268
	yhktknOuasI/UNOmu3mx6XHzSbnvgw/1DT9ORhfimH/dveZ0iU96xvAfIaaeOxGccPEH8Pqw+7v
	zeT4SOHCYcW04QG0vIL5o07N6QHQYvB3T13LYwqTB6SEnYRnMA2VL7+QPVehhhB7mtZe7t5aMJV
	JqUK0zPKzLNjFrP6/68/o2N5FWjWbnA58aWyRPzasutDBasth2inbDpYweX6gmcj+UOUP7fp7Zv
	1lKuYurSWDJsVyNJu6hFnZNRI7j9XZZ11qLZq0rUYJrIf7bC/+YJ4e4twOcVMfc7GsQ2Wbsm4Ak
	y5nfCIrN8ZRRC4nGbYT7T0XTFnGpk580OwsWOdjMrP36ZT3iiuSOudcmpzsEwpB8Jo5tcA/4trt
	DC0via3H1jcAG4e5Bd38ihfTrMHLhfitv+NSRqaTnnfNi0hRziVBlCYOLPpLAj63vuFNU7CaFV2
	w==
X-Received: by 2002:a17:90b:3d81:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-39aedff2b42mr15677641a91.10.1788424045724;
        Thu, 03 Sep 2026 01:27:25 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1431f86504fsm2135193c88.4.2026.09.03.01.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:27:25 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: drop unused i2s0 from rk3399-firefly
Date: Thu,  3 Sep 2026 16:27:12 +0800
Message-ID: <20260903082713.192-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_012727_549645_5087BCDB 
X-CRM114-Status: GOOD (  11.64  )
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

rk3399-firefly.dts enables i2s0, but no sound card on this board
references it: the on-board rt5640 codec is wired to i2s1 and the
S/PDIF transmitter has its own controller. i2s0 is left over and
serves no purpose here.

Leaving it enabled is not free. The pl330 instance that serves the
audio block only has six channels:

  dma-pl330 ff6d0000.dma-controller: DBUFF-32x8bytes Num_Chans-6 \
    Num_Peri-12 Num_Events-12

i2s0 claims two of them for its unused tx/rx pair, so only four are
left for i2s1 (2), i2s2 (2) and spdif (1). i2s2 loses out and cannot
get a channel for capture:

  rockchip-i2s ff8a0000.i2s: Missing dma channel for stream: 1
  rockchip-i2s ff8a0000.i2s: ASoC error (-22): at \
    snd_soc_pcm_component_new() on ff8a0000.i2s

which makes any card bound to i2s2 fail to probe. This is what
currently prevents HDMI audio from working on this board.

i2s0 is disabled in rk3399-base.dtsi, so simply drop the override.
With it gone, i2s1, i2s2 and spdif all get the channels they ask for.

Tested on a Firefly-RK3399 board.

Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..fa1b8b8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -618,12 +618,6 @@ accelerometer@68 {
 	};
 };
 
-&i2s0 {
-	rockchip,playback-channels = <8>;
-	rockchip,capture-channels = <8>;
-	status = "okay";
-};
-
 &i2s1 {
 	rockchip,playback-channels = <2>;
 	rockchip,capture-channels = <2>;
-- 
2.55.0.windows.3


