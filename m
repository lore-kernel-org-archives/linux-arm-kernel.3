Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBF3C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zuSQQlpTAcogubeGK9Q+eqQpXU90+aksiuAKusVb3Y=; b=kql6San8cst6alt+EGKFX5zcSG
	YV+IswP2fxkOwlrumXcYWsHWAa78/WKQFSmx826+/PvrCXFP8ABoeJjhzlDXMzyXQ+rD5ZXyFOCj/
	bUSq1XYvlDI4SFCh+WxWczYpX/3+NjDZ2TwpBSH5yLhkFa3OWmxoDbuJraWrTveh2Rt1HfVQgXLel
	R0Wt8a/TenEFKDImYMWX26Re+yM0fklmCUYCNGEKrCzd5TndoLH+3WsBUcdCNdf/0StOphorY0tRW
	LYSLN9zvrQFgdTZKNXK1dzRlLTT0fKGQXByQMfDT+RnCtj3RmSQZ/+rNECJHrL0nv61VNl1RatlWR
	XjBQAN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n4r-0000000F7lf-2ime;
	Wed, 02 Sep 2026 15:40:41 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n4o-0000000F7ku-3oUe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:40:40 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6a63667b78aso2132068a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 08:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1788363637; x=1788968437; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0zuSQQlpTAcogubeGK9Q+eqQpXU90+aksiuAKusVb3Y=;
        b=e1kEFHKIqUVLD5Ezu3HU5yZg3S+g8bP+Yr4vowkyWsgYIUU23i8Zp6AI46mi94byl9
         6QOPvsvgJ1+/1E0PfLvylB5Q/bjEPqS2lYXiOFZZcIQCmy0ybq9SWlH/MIE0a5tJIw+U
         NWdj2lIBDPXDkc02MBYPeNxSA+NRQa0jP6pjd2/RqIQ5zF/G+gy3ag81aoMlsKJnH7r6
         zBtKO2V3YE9GX9eYCJS0UzwfDDtxAVc0bwSImzdIan6apsjMI8bgekcEEK3x+Wc7fk1H
         jkcUzbedy80mw9dNc/YUGhQ4Siid0uMH9wBLZEFdOWitqW2VMTm4zwd/KggBZRzakq1V
         jQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363637; x=1788968437;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0zuSQQlpTAcogubeGK9Q+eqQpXU90+aksiuAKusVb3Y=;
        b=AIrV7n6w7n/I2NzS0cPDPUQ/KE01EG2jVDpzeCIU4lP0zZnVDFIUlVbI57p9ZrJq/G
         scPChQHRqtH+vKUfICOHqK8wrnbD7u+zqoHzH2MP36bdu9UB4Bh5N7XFVWWyOPpyj3Rf
         JkeCgli6gEdG4nDcB1wzawGsPkjAsjyZJZtoIl/dzthkf9LPrY1YW8y9TacrLVOXlA9k
         BuVhxEgWIA0QDg58wxxYn6gsgN2CHa7ZRoOrIfUsCMH1XvoDXi3cesBLKjD6sZR4L+iE
         4imiL3PjwYsXN6I8HGIq/P68OBj8ssHqr4b+Vy+1dIt6ZwEVHJXrWFTIeUEOQd+Ml7a0
         dBNA==
X-Gm-Message-State: AFuF++kITKprb9FbjYoD1Tdjabbo1BBmjmh8BdAcIZ8Kzr2NYYa/ewxo
	KlzN1In5Kqbt/dPJ/kfMIqTWMCANf3/Gqhr1iyeeSV1wH3QOIsncyV4dy4Oy++u8KIM=
X-Gm-Gg: AYBFou12pGZZzgw73QmB/f5s24DSFzecEB7xpfySpz5V4Z9H8l7nUKmBm8NVIMga5aY
	urZeBr6Je36fFZhddEuvsn6alkj7IFnLK1OQkVrCAX+8PKlJlDTbdh7kGtgJmarEhNiiEbgHsHf
	y4id1Pfr1PREx5ebKUsE+T6WgemxHAVu2QesZqhn8WlZM438D0Neliewmmmr0DcLL6CuNcVHldK
	bA9SFqnVX9OwnlY7MHwTK3MlqJrXYF9QUwaLKUSuoF/rj9K3TrP+luScIPQpMyJgtOwuSJ6b2QG
	G2JBASTnuihWh9rsb9Y6+3m8uh3FycID4onzbHRnMVqDzmOWPxKZNy/lBVyLaPToxuE5gXqvbPg
	VebTvObl4HQZKIU82QylHlhvW+aCBakKqyl7dk7J5yoFottf71cz+j3INjtUvgxdw97gatTJP+r
	cqsZH8hJ1Nl0IxQyPnVK6JtL3fD9PhOQc2HZUZNtGCiRb0Xa5usA1n0gZ8ZeFKaLc7Tosg53DTx
	vNF
X-Received: by 2002:a05:6402:218a:b0:6a6:1719:3f42 with SMTP id 4fb4d7f45d1cf-6a68257c26dmr4666942a12.6.1788363636908;
        Wed, 02 Sep 2026 08:40:36 -0700 (PDT)
Received: from dev-ag ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f932de4sm1280187a12.18.2026.09.02.08.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:40:35 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: qinjian@cqplus1.com
Cc: linux-arm-kernel@lists.infradead.org,  robh@kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  linux@armlinux.org.uk,
  devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] arm: sunplus: add SP7021 LTPP3G2 board support --
 withdrawn
In-Reply-To: <20260902104545.67794-1-ag@ffroot.co.za> (Andrew Gaylard's
	message of "Wed, 2 Sep 2026 12:45:43 +0200")
References: <20260902104545.67794-1-ag@ffroot.co.za>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Wed, 02 Sep 2026 17:40:31 +0200
Message-ID: <sa6a4pzwtjk.fsf@dev-ag>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_084039_084118_C3FF8918 
X-CRM114-Status: UNSURE (   9.07  )
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

Andrew Gaylard <ag@ffroot.co.za> writes:

> This series adds device tree support for the Tibbo LTPP3G2 board, which
> is based on the Sunplus SP7021 SoC (quad-core ARM Cortex-A7).

sashiko-bot found several issues with this series.
Please don't review it, I'll fix them and re-send.

