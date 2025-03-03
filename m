Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C85BC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgzkQxaW5CHf86x7AWE8k6IimMEmNVMADmlp1s0496M=; b=aT4zbUuVVv25j/9MM4WMxKoNoE
	TyRnXxHvf3UTCGz4dd50IuB1tFCcfbUmAo6djAMi96nKA4mG4Y+nyZB/VKsJO2VsX1Ce28wc6/b1u
	zYH6zWQcckdSbBJ0HHz2Khe6WAro1QfccUDixDJ8K8ROGPCsxvMw4FA69lVZgpRQQJLJ4ir4RK18U
	Z21daL7+PdJaT/yeF4JNVTV68VOs87Mv3MoNSx3MmYn9pG7uEJSPG6kt3s9e9Iwm5pmR50p3HIMGz
	NZ9Lh1hmdB4ZLqNf+JAOGoQ3oxiLKu0aH8m5IN88naXIxBxYg740QNWIrk2HsqtM98E9fEJmv0lzl
	q8gNk3Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6lj-000000016Qh-3UCa;
	Mon, 03 Mar 2025 14:27:43 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6T9-000000011vN-0bNb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 14:08:32 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-abbd96bef64so715877766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 06:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741010909; x=1741615709; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lgzkQxaW5CHf86x7AWE8k6IimMEmNVMADmlp1s0496M=;
        b=e9I732Rg0LkTI6pGo3NipjNYzcSQT4yAxPKnxhT+LgyotAHnrIGT9EUIvwr49KvOio
         yj6Ifxgmi7XFUjXIEDj/9aQGX9wO1ArVnbpHv5UF4WCaWU5IFlKJR9a/FxTnLRB1VppT
         UM9WGOCXj2YaY62apF2vKPDuAW1EVNxUL7ww7gSPjax+mronX6o269W3dmbKUHcXQi6Z
         9OvAV0y6NSP1Lhyg5chtDc4Ya4naNzOthYPiUrCcupHYVKpLzmtufcivngIhOvHjUrXA
         1vdIOU8qr5bSezoZDi+x9Q23FI+7KuWMDc3EXzz4HVuPCVA4sMnK7onJqGuKqxYWIBVQ
         PpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741010909; x=1741615709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgzkQxaW5CHf86x7AWE8k6IimMEmNVMADmlp1s0496M=;
        b=XpHTxapshfR2l+WAXZoMZXQt5Ve3W5nfqa6jeHW0Y4J8fRSRGsZLJKA0CyTzTTcgRy
         vM6NKa3AJZrpn+ZCi0s/sgqseA1Vmhl2OaHd87c4Yzwye20Etk8sWR8tR1zB4X1uPNLz
         9g7RDSQYRQYORuAp/BVP+Z22gG13RB0L9bYFbkWqgMxyOye9n1cennF4uwZZGo6cnj5F
         8N3iJ57trnVOqBPIAMb9hDB5NqbIPyYtRWK7jaTGzWoeBm47LOXtC2LxelMSf0YEDo1i
         VTW2whocBs8fOaRzCcjt7i0eEDlXh2WdFLYk+7XyQhhZvveIYHwyuL4h14fib0dxJvP2
         Hfxg==
X-Forwarded-Encrypted: i=1; AJvYcCU6EbWKZkk1pN6NJBgDaoF7R1yA9vUKdPIMuU4RLxeoljn+kjFHapRP9xOyS6qOqVi1Yaga4JucppxOroT+U38p@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5V9UL3ui5/7omeinHbIOg3LJ36RguPBOS8CnvRnSz/ZPElJDT
	BsbjRjtbknkKqyiCW9UwIydXHxqeCp20eGUDngQqcm6nQGhFLDFiws3dqrxg5XU=
X-Gm-Gg: ASbGncvQ/w82cAABcqDnqEa135l29c2mHwkCC3cuNqt0JPGelC6Rriga4ZcceWa22U1
	XP770zgqLGfj89VQnnuXAGVXffMTXTRbR4QWLdaIUED15pjYCashszLdW1HrIYZv8dMhOCNZD+s
	pC5es36D13kTTwKR+u0eBHIyzpVLb+uPPCTaIdm8Ew58gvYkpsLgySDO+leDwXGWHvaLssMwNtn
	hE6ufwPu2D2V1qrThpXM4G4/Cb8G7bIuL4nQg0O606OFxU0Jec323BHwECOxk2Nx4p/K6wveU8f
	7he/BylsKav29P6FXZiHdA1R/y/SWm4FqIZhNAq7itW2Y+KEMw==
X-Google-Smtp-Source: AGHT+IHJ5i4TB4355RRCPxNtJcPV4cOTfWRTwaLU4Fbde0vdGgTcEizoadd+Cioo6PFzj9W+C1LyBQ==
X-Received: by 2002:a17:906:1199:b0:abf:287d:ccdb with SMTP id a640c23a62f3a-abf287dce9emr1376223066b.27.1741010909214;
        Mon, 03 Mar 2025 06:08:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac1db69942bsm112475066b.76.2025.03.03.06.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 06:08:28 -0800 (PST)
Date: Mon, 3 Mar 2025 17:08:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Malladi, Meghana" <m-malladi@ti.com>
Cc: rogerq@kernel.org, danishanwar@ti.com, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
	andrew+netdev@lunn.ch, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, u.kleine-koenig@baylibre.com,
	matthias.schiffer@ew.tq-group.com, schnelle@linux.ibm.com,
	diogo.ivo@siemens.com, glaroque@baylibre.com, macro@orcam.me.uk,
	john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
	ast@kernel.org, srk@ti.com, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH net-next v3 3/3] net: ti: icssg-prueth:
 Add XDP support
Message-ID: <61117a07-35b5-48c0-93d9-f97db8e15503@stanley.mountain>
References: <20250224110102.1528552-1-m-malladi@ti.com>
 <20250224110102.1528552-4-m-malladi@ti.com>
 <d362a527-88cf-4cd5-a22f-7eeb938d4469@stanley.mountain>
 <21f21dfb-264b-4e01-9cb3-8d0133b5b31b@ti.com>
 <2c0c1a4f-95d4-40c9-9ede-6f92b173f05d@stanley.mountain>
 <40ce8ed3-b36c-4d5f-b75a-7e0409beb713@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40ce8ed3-b36c-4d5f-b75a-7e0409beb713@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_060831_194646_858E8BB9 
X-CRM114-Status: GOOD (  11.46  )
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

What I mean is just compile the .o file with and without the unlikely().

$ md5sum drivers/net/ethernet/ti/icssg/icssg_common.o*
2de875935222b9ecd8483e61848c4fc9  drivers/net/ethernet/ti/icssg/icssg_common.o.annotation
2de875935222b9ecd8483e61848c4fc9  drivers/net/ethernet/ti/icssg/icssg_common.o.no_anotation

Generally the rule is that you should leave likely/unlikely() annotations
out unless it's going to make a difference on a benchmark.  I'm not going
to jump down people's throat about this, and if you want to leave it,
it's fine.  But it just struct me as weird so that's why I commented on
it.

regards,
dan carpenter

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 34d16e00c2ec..3db5bae44e61 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -672,7 +672,7 @@ static int emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp,
 	case XDP_TX:
 		/* Send packet to TX ring for immediate transmission */
 		xdpf = xdp_convert_buff_to_frame(xdp);
-		if (unlikely(!xdpf))
+		if (!xdpf)
 			goto drop;
 
 		q_idx = smp_processor_id() % emac->tx_ch_num;

