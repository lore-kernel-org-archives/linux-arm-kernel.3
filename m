Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D88CC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 14:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xq++Qn1xDsOmBUH579ICrWONnVsNFNIKJyDQ1d6clA4=; b=ttU6/HGZJYoEfBj0nFIb/5a9kE
	4XvcgXHQWobtwCLnfUC18FMf9VEYXUHk7Wpaym9XRND8yHPjczFhJhdcIh1vrX6v9Lbnv0YJLoD8Y
	8sMSvX7Nzz1IOO2MoBHrrZTdo59pVuxxIYulBi4QjGheyTGxx0LFpAzzm9AnQqBMwtWiYmr4oEVr1
	4hVz4oTcRrp7YacihW55ppQ3VHz985cetoP+FztgxVksYCdHGwJ4vM1eN+9koUGtklhlpZ0hnzDRQ
	9YAMr+UqcZ/vOgAVKy8TdjkJHSXsm4Wzl1JwxFRSBJVwxdrPTvZ8PN7nWjHAvF+CeG0FwvwZgSh8L
	ufH+obIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWrR-00000000sYD-1f03;
	Thu, 13 Aug 2026 14:56:49 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWrP-00000000sXm-0qUk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 14:56:48 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38e08baf860so904379a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 07:56:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786633006; cv=none;
        d=google.com; s=arc-20260327;
        b=MDc6Uc4MLS1WTuCqGQOSg3RH5oKAIBh/rwn5mq8GLrVuQgtLlAs23jBakb+jZxIzVx
         sjx4rzYc1RmWZrbB4E+Tp+raLqFaxVG8CLVvVxnMoPUZVX+SPXBB/uXnH+vUhwUow59D
         e4znYluqc1HYjzQ1lPV4UbGh4wF9WCM61v2IqAauE4SS4mDUcUvLQb33KH/o0Mnm1DiI
         hmAKSrtc2YU22dVtRe7i0oCP5HHdBQ1p8aMiQDZhy27Zks3aFIEgS9LetQKYgFzBU/f0
         rYIRNyWWhg7Ukawkiptzd2Mxxbi9urF9EARgBmDhqAonDMOh2q65kfgysiC6LooFweP7
         f/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Xq++Qn1xDsOmBUH579ICrWONnVsNFNIKJyDQ1d6clA4=;
        fh=R/eIHSoiRQlbLCSryIbf0veT8CGEVpwZNSpesZ+47oI=;
        b=Siy7Z9AoleHOutEB+VH+OJvDvtAfKbUAB70eNdCENmfPY32EeXD8Lj5id5Ab9ecA9g
         szgjWjCtahfYperML+Dmlbi2Hr881iwAHx92kuIiU1PLCHuB/6aH+yli59hnBBMWRZTU
         4o/UJuC8YbFlnmVKELg5qJkep6xSiIEWs/qhg2V4NKit/ymrMgA0QL+m2m8v1k8x2op2
         9NWA+ItNmYMHRW5ksYeYVAjALT7ImmTUXYUYNVDz8x/Jnp6Z8RH7oAwCSErLhR4diYHr
         lVXv1/N065J0xMYpwP9mFLerTk/JgJXJYZUnI88zQnqbzZvNliUFjQ7RLj8u2kD08+kB
         JR1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1786633006; x=1787237806; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xq++Qn1xDsOmBUH579ICrWONnVsNFNIKJyDQ1d6clA4=;
        b=ZfjfMVMqYFrZv5a8VaHqUQ2ywcWwbwdYHJ99XnX1AyC3uWpsEtegC5/GcyaO92MKB1
         3E9x3/5VeAhp1Y9zsb0GJaJvnrT9GRwTU3jXP7OCKhhBnHYNyLa271e9nzxNkvZR7Dx0
         iJSEJAsBAQc90z8e1NAWjizUgpCYNNzs2cuMta33S0nTIujy1m+Lki6QnHHNNycyEPHK
         yELVcaCrJz5GYBG6wEulHJrtXnYjGkF7UxWLBte5Sl8n8kgwCJPa980fqTSv0FkoxDw5
         jw/XT5qlxCrPgOrUcYDVpqwcg/M28NyW/4C0fc1BPCcdxEP01R0dGPZ2GeMfwBSvlk8J
         /ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786633006; x=1787237806;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xq++Qn1xDsOmBUH579ICrWONnVsNFNIKJyDQ1d6clA4=;
        b=lMbrpj9xH3U8tIiMNGZZd/Yc+mwDVvJbm1UfQ7W2QT5OINjL92lCnvndBwOixjclXQ
         oJosTkPcp7OnIq9MKr/MuW0hAa2WJmmjxwbq5VFyXhDYe2wEzcv0Lizh/TAj8QJw/IYh
         nWSY6yU4/kX4vkUnK4C/wwuR8IMAvP2pVy8sZhZMDYV4jo/PDFU/HvKNbh7VB22bmaDn
         mGJoyLyMpTW3qzOMla2oV6uhZ/aP0BW2/csD7LKVIYryYOSlNJu2WtD048aQfPUa470a
         pqxlRYmA0m7LOwY10SLTnlX867KfqBaKvsg2BGR1zTc3fWdZmKYPEL1OOzghXLtAeDbG
         rtLw==
X-Forwarded-Encrypted: i=1; AHgh+RoNyIeirK/6u4TqcsrY9k3vzvsmZJUj37nVEESX+bnc2R6euPEI1P/E7eHWSjDepbWGmVu+75Xrk1ajk/YWTcgw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1mnnXcwdYutgkyac9KQKr1pYAQpvREtmSPEnEoeYfidUHe2Jj
	XPXKRs6xLA5ppVKHcG+coleaSgfTTsT1FUAiZVZLb0TH5I/kSvZkbzfhCDMd6apYDBA6/kSR8Qu
	4yMEYratgZXCILB+iVHJfbjXes6tjFhOgSLw16vBkqA==
X-Gm-Gg: AR+sD10LIjGLJGw0XPdmtIiYpLXo/zGfo/T1alnvRwWvbJzBao7ioQcRwwneq1g4ywz
	eVxGIY42nje8WIZCrBk5zk+1jMV/D1C3Bb0EyXUKNCbHjT3PyaHSYXmOUIW95vWE+Q/zXfLYhXW
	IlgP5YpqL78Tc36o+AEQHqpDrbVArkoOb0a2xdbiiz95v2soyjfGvtt00FbYZSqc6sp67ipIBfS
	zggR8s6GVq3LU2CFFXT+PB1QNWYWabxRBaCI/v4iE+7lDBHKSejxlSrf5z+ZrtxCEVXp/VleTQ/
	RXvvGygzl1Rl9bKyyoexg4ibuTHvqRDIVxVolyW8uTP8
X-Received: by 2002:a17:90b:3805:b0:381:5bd6:eb19 with SMTP id
 98e67ed59e1d1-3931e2d5ad3mr6739275a91.18.1786633005755; Thu, 13 Aug 2026
 07:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260724-scdc-link-health-v9-0-bdda406d016d@collabora.com> <20260724-scdc-link-health-v9-2-bdda406d016d@collabora.com>
In-Reply-To: <20260724-scdc-link-health-v9-2-bdda406d016d@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 13 Aug 2026 15:56:34 +0100
X-Gm-Features: AUfX_mw_wf8mbHFBpVPiqBoHbpDY5XZSRNwpWrmFgEGAvC8xQ68IRVU4r6Y0j2I
Message-ID: <CAPj87rM3BxAf3+4UZF-qD+45bFup9FV81Xhrn98m7sewZihhGQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] drm/scdc-helper: Add scdc_status debugfs entry
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_075647_370635_B856EB73 
X-CRM114-Status: GOOD (  10.52  )
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

On Fri, 24 Jul 2026 at 15:23, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> SCDC provides status information on the current display link. At the
> very least, it may be useful to expose this info through debugfs.
>
> Add a debugfs entry for it under the connector, which displays a few
> more details parsed out of the SCDC registers. A new
> drm_scdc_debugfs_init function can be called by the connector
> implementation to initialise the debugfs file.

Reviewed-by: Daniel Stone <daniels@collabora.com>

