Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6801FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 13:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JylD0eUAei9HWh+O1vGMAbkkUnXs7zMRuNaLki22TM=; b=Hk0edk2Gj/oVP1KSGtn0S2PSP+
	PIfFwWuG9upT0geYwpz87mJvAkUrSHnG7u30MnAGxrZtHsqfU6m2gsuzibjim6iUN83eMhRrS6z7P
	Uy8uir6SqS5L4AitFSJUcQnN8ukVP8ZIlMfrQYwTgsDsC0s2WGL2ZckUULnXzIny1JjPEnuI9TFPN
	aLBLX7iuK8LOypu7+XwLUMikEGJRgtdyGuD20HVw4QT/7nVa4YjQhjMNFnsparOb3NvTathLANriU
	QbkabwkkzK4MDgIXA0rr2Gb2chPMCIeaDdthhz2qHb41GYEZxuPn7I/KgPMMJNNf/UaAZsrApSinS
	a7RB8mgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiKc-00000001WOT-13hp;
	Tue, 28 Apr 2026 13:18:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiKa-00000001WNe-1J8I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 13:18:29 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ad617d5b80so69191065ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 06:18:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777382307; cv=none;
        d=google.com; s=arc-20240605;
        b=A4MwMs9Ljn3PNNANDz/Dj1SdAt9hXeB6Dat2S62cSfB79FL9/rsP/4+c2jA/6h7ak9
         gDXsHRCEmSSpwSqo4fqtVhGEaC9+4zpz1mHX3IInxGVH306jDZ/3Ev/f+Xcajt6wcgGJ
         DL9/LrUvlsDFEOF9KbyTlrZQSjGn/MJeKJ6k97SQ4PT9nOcIO5J2mZXrB15yvo24lEv3
         Psn04kQpoUNlkSX6mvMV4Uj7baFLd/In92p5pKag2NIMK+m1GTQvbSJ/PMreWCOhNcyD
         vUaibDf5RUPsz4bB/fO1MV7cDAuk+ZAYH4N6LkttjGXXHENNXTt5/7STcwWdJI5DqzJr
         r4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0JylD0eUAei9HWh+O1vGMAbkkUnXs7zMRuNaLki22TM=;
        fh=eB2KXQMgvFThtG+FDuT4ef2Sm/r7QkeuALEE630zHpY=;
        b=CkabZZS3/wKuOCVw5AeITWDgEsmoLoitSL9u/EVVFm+W4JWsmxu7x3QXuj50pxcb4c
         Ofk/ppNeOai2nRXgLsfXJQQuqoix4Qg15xFURTJhHC2kKQiyyhRxogdp2UrCdZAn1qRP
         D9Ydp9KrlhtqEu5W3CISeYQcyppFnL80I0OQ+L7M23kA41L1Rqm6swgfy2Xg4trfyBeV
         nVjAQBSUN5RxL2DKvqdeIIAI/JHC/FUhXU4QyvMrlYzrsg+6ZXDS0zTBG2EGGR+3Etu5
         zCazq/wW19geXqS2lc5ASZB9Ye7D9xEQHgML8kH5+XIapksCjSjNWiBSQvqpXCqdFNcm
         DpIQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777382307; x=1777987107; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0JylD0eUAei9HWh+O1vGMAbkkUnXs7zMRuNaLki22TM=;
        b=YZxjFDZEAnGbloS4hAVl9/xPykW8PXntMl5RdmYevf/HwximGlJHgOLf932EOWu+Il
         4twTTqZr0W7ASxKdby+vAQqsZDWfxDQG9OlW8GPBJUP6qNNf1t4EdNb9jeca4SgmS4UC
         LaSl/XzKmjsuioWt7INSxawqsK6Gb81jPlfaAb9fcZvNJVCqn3j0iMfU3xK7kE4FfegN
         IcNHTtXXT5XJ1k4GK7eA17w/aSaGO0bCwsFHGY+V3LTsZk7QxV72SUjAi8yEu144waQw
         cNyFpyX7Ri3xO07hR7mPfs+NkgPi/MLaa5IdfT6s9HiBHF8cRUTBMbz/EuwRTAVw9+Y5
         IpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382307; x=1777987107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JylD0eUAei9HWh+O1vGMAbkkUnXs7zMRuNaLki22TM=;
        b=UkokBu6tx8uGqsRaea7NJXE2qCNLa0j2gbRNJUNVj84hxGPazaOMQoJGZU58Lx9we7
         lttSbvJmZxl/L7bL+mxr7QgvPB07ZjEKRf9M2lIikTYDPNYAnfGxgaIo10PPk6qso+Es
         ffnfIGqcLKQh8U2Mov/BDkgqyQMpvVM6GeKueNv7/8L9aMtsAVOqwMzIdbYfr3CbgExz
         8stGoStzZmXO6p6yGws8nlynotReIGTIad5bPmVTFSDTP+21Nf9SsD6m+YW9g5PwQa4+
         Oz8m61FpoBw0Kc0v552cfplmRiTv1Qk6CQCBov5PcY8o4dx7IJi9bOoHfDrDYMp12BQf
         kZBA==
X-Forwarded-Encrypted: i=1; AFNElJ/DTvKz1ixFKnpeyVip3O+9WUi7MC6NkE40gR1cBeSZXcRUqde7aYEsteAgSJM+1fKSEOzodNl/4bO6mgtHWpJp@lists.infradead.org
X-Gm-Message-State: AOJu0YxC1aLMUz42kFlFkHpxGAQTa9KANQBZSlSQjxzzodHQnvCCWT/6
	1wzLYGmLMdpSI7cfUoXunx2bGdcERqNZ0t1weWnJZCPvIvjYNaLWvgg4t2d1k/D3JTXr/B+FdcL
	5olQrJqZdrDhtO3U4aTDrKCzpe8oUKXI=
X-Gm-Gg: AeBDietBCWwNK0tb2TDEbaetoEqoMXgGtnKVoSpW1y3yX+tUauFrT7fRDtj7hZpBINU
	9woUn8YwFsAZoez6mZXSHED6Gt2n7X2xam3tdp06X70TT46izyKM2s4gLQr/MVQhJj+cUgRR+e3
	AxJINKwpVCdPRbf75lTc3ihQEutyx1XJ2V9XAR/NPcmepgc+rAHk+SuYa840Qftw5sQICbNcPnP
	etXpOXSZWR7kIYCPIFH/YcAwWP3lPgpAbJJmXf3gjLDRzc6uSXscbuNAGb7diP9zgNtUAH4ISrc
	0jcHr5fLoizSBE8MVdH7APuODcBRxmcLs4urwowb2nnkOQ64ojyUDJURmRirQg==
X-Received: by 2002:a17:903:2c8:b0:2b4:5b82:a8e3 with SMTP id
 d9443c01a7336-2b97c460ff4mr29301325ad.24.1777382306648; Tue, 28 Apr 2026
 06:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-7-4300744a1c47@bootlin.com>
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-7-4300744a1c47@bootlin.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Tue, 28 Apr 2026 22:18:14 +0900
X-Gm-Features: AVHnY4KhpSU0AnRDYEBltd_yLgO1x75YnlNnv3pVSwzFIbBw0RqhN0C4ay4P_HY
Message-ID: <CAKbEznt-PUvg48tegibw+0xYCCvK+1jwESnuHx9+MG0p3MD5gA@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] drm/bridge: lt9611: switch to of_drm_get_bridge_by_endpoint()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_061828_351547_9493634D 
X-CRM114-Status: GOOD (  11.53  )
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

>
> @@ -1058,7 +1057,11 @@ static int lt9611_parse_dt(struct device *dev,
>
>         lt9611->ac_mode = of_property_read_bool(dev->of_node, "lt,ac-mode");
>
> -       return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611->next_bridge);
> +       lt9611->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 2, -1);
> +       if (IS_ERR(lt9611->bridge.next_bridge))
> +               return PTR_ERR(lt9611->bridge.next_bridge);
> +
> +       return 0;
>  }

Hello Luca,
Could you take a look at this alternative?
------
struct drm_bridge *next_bridge =
    of_drm_get_bridge_by_endpoint(dev->of_node, 2, -1);

if (IS_ERR(next_bridge))
    return PTR_ERR(next_bridge);

lt9611->bridge.next_bridge = next_bridge;
return 0;
------

 I think it reads a bit cleaner and avoids holding the ERR_PTR in the struct.

-- 
Thanks,
Gyeyoung

