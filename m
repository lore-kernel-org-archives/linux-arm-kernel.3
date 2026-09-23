Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1A9C98307
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbzAJg9KFAd0XK3d8yi6dKFFaejwIzukaaxckgS1/bE=; b=X8gD1WGg4+NWXEddJxymu2pHQP
	f6PaACDfqNOrmm7ezyv5dzASbsC7CgvukQl9FyGjEBL0OzrIEEHxM2b/ViV9ejt/NSob+xxd2je3j
	hHgff1f2P2rn8kyrS0lhErW3+qXqJa78ioTtq00YtVBHV4PQWy7cb9UcylcFXAH0Gdh/ugcJR2m3e
	59aPudE3DJT00zCSG5OdZvHeMiI/2JoDd1ocV0KhAUwSWlbn395cPZP6Njp2y11x0fdpSdIsdUMTu
	zQddNJCB4rzgKZcisnRQPBOyc1KnGdgoDd4siP8yl+K3AhSkDvLWVRKnrHBYYKlPKIj5uFfUBtmVi
	bdKYK/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ipw-00000007dpL-0MPI;
	Wed, 23 Sep 2026 09:00:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ips-00000007dnO-46VD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 09:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FbzAJg9KFAd0XK3d8yi6dKFFaejwIzukaaxckgS1/bE=; b=iyL9kY7tLMLW2u6nFRTlq3OX1Y
	N+QzWbQrECLgERDSTh417ZuhjM2unhfe24nPwfpYinFdxajgaginG7En0DT689IGpSMWNww0ONhI3
	iruk0nNN+QipNDOO1X3cgMnywRJ1hzdcy0Cxs3NFjAyRLU9GSAKYktlfUHV3H8Pq7xol/EclIgdrU
	mMAytx1TcoIbrYRMFNhQmJtT1XeuyRe2WmnaY0PQcpTGTqGuTeBfH7BvOZnjVkPV11p+j9Z/FARz5
	vfDb9xj47Y/lIvQDbDM2QoZX9g1KznK9iBlhaAIPOWJpAKGo7PvoWfBNWWFeDOL7Xck4NCu13hoJp
	wnnOxshw==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Ipi-0000000EYRS-2Siu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:00:15 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49d1331ce1bso283835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 02:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790154005; x=1790758805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FbzAJg9KFAd0XK3d8yi6dKFFaejwIzukaaxckgS1/bE=;
        b=iRmB+tzAyB94AQUfD+nnHRv5vysnF38dNL8ToTM9pmk68ZeE1wsfR2I4hbbKv6eH8W
         mRNC9KwbgvIzVNwf3zE9XP6zK01ymFD76T8VHymDy4f83cwNvvI1+CytEquuK2miS2+P
         pl/XIdCkwSIgjNXYq85nvhRw4NRfth7MSWW5Rn40cuAvpIEfJ6bxHQLtjAuzf4H204kF
         6TjaDLFLLNY6ZEy83rVXvw1Zy6jW7mr3qFze16Ntf6pnkVxYFUwPomN0a8tQSXlLPDnl
         VJx1oiAhQ44xYadJ/Ue/Rf4M6Y725lK0eDoNPiFb7942kLSupEJOgZSeFzmclRoZ922n
         CLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154005; x=1790758805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FbzAJg9KFAd0XK3d8yi6dKFFaejwIzukaaxckgS1/bE=;
        b=G484ZGV6QWg+cNeSsp/HvdwL/5gHQtbZpkT89cLaJ2TVxhukSStZVC2Oj2k8fidZOh
         uMwIWd2nKvru1anfusr6s7h1Zc/SSKsD9wd2XLSFFwGFNdJ9smMWItwS+2kxE4KCH/Hx
         /kc0w0YGL6f8nXh/SoOm3zGwKlENfrjkxFAWzxO7BFwpE7kCSnFyNMZaUB5igBHsqSTc
         7zGFzDUqIhIOR0eMc9VSIZRXN2DT/4RzRySsjOEV/Cvb6J9jRoFPYhQ4LpxHCqqejvF4
         PsqbY2RaNxHy8k07MgM3qh/IWntmruC9DsTzoKkB3YycThxQ7UReW9jlrPFT77+3EMiQ
         IR6Q==
X-Forwarded-Encrypted: i=1; AKwUvBz1bYaKlh/psH6OURee0Uwjg95E1K22potTKB7FXwB7E/0g4L6CDjq04bn2UVwax0trJ87lyOEGBQGWrW7b5aZc@lists.infradead.org
X-Gm-Message-State: AFuF++ktF+CErhC01p5Z3PGNcVI4lAQ3YshWRICNN8Q5Ly2VFZIOYPja
	9NWSp5RRgnCNqYXcT4toJA0EBGzzrAIVN7dRQoCoJdIFWzA1o/+XCXM8
X-Gm-Gg: AYBFou0zwPD0U71nMn2aqn+lrjNJ+IWD7jeNL34lmfXtnKf8hJEHeB8hwH9Hn6A5n+z
	otPssElITC4fBGpK1NJj97dBsmS1zGMkxuiiRNesXsSqvdbJYU8sNH1uu+uYbppAKbPeICEBkEN
	v5wx5ZNo5fAwfiMAVxzkTj2Fk119CXrEgpv39fbJ4Vi2fBl8yOj3vBLHCH7ynrG4aPAZnsGbWEy
	DrHnMcHoATCznvmeJcVVKDHqrMKRQ09VXGiVU0SdNYB7FYA3XGbiUT8zBSZHK1cojQcttN/EoXp
	5SrrkklGQJPiP47LcnAYbR9TEwYq8EuWVHNu/dsqvGEouZ7FaB/12KEmsoZiHUFY9l5m5t8EGEV
	4EgRFLSOeuB67wnspaQQ89k7zThQEhy4DkLohKo2WYPsR9eFzYrQ3Y06Q7e2Ebc1ebGHRORqeuM
	f8ae/MeOE7pxVrnPxcOlCMQc5SJuWuhbMEEWrEkFDa1MvCxWpnRH5UgfhGEfCDX+H81q2Fvee+p
	1VSKp+r+vFp4LZ2luZux+R9tIiFFVc4X4k9JL2P6c0KQmPQ7wYKcxgz6mFZ8k3c
X-Received: by 2002:a05:600c:4f86:b0:49e:6683:d227 with SMTP id 5b1f17b1804b1-49fdec5dc40mr23139865e9.0.1790154004654;
        Wed, 23 Sep 2026 02:00:04 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8F4500D949869966507951.dsl.pool.telekom.hu. [2001:4c4e:1b8f:4500:d949:8699:6650:7951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde197466sm56190915e9.7.2026.09.23.02.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:00:04 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH 5/5] usb: dwc3: rockchip: fix USB-C reconnect in gadget mode
Date: Wed, 23 Sep 2026 10:59:41 +0200
Message-ID: <20260923085941.16418-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <arMyLlcFKgtlwW_T@vbox>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com> <20260915-b4-rockchip-dwc3-rockchip-glue-v1-5-763bb546824e@collabora.com> <arMyLlcFKgtlwW_T@vbox>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_100013_314914_DA720777 
X-CRM114-Status: UNSURE (   9.89  )
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

On Wed, Sep 23, 2026 at 01:58:19AM +0000, Thinh Nguyen wrote:
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Hi Sebastian,

a heads-up before v2, now that this patch has an Ack: the build issue
I reported in [1] is still open. With dwc3 host-only and USB_GADGET
either disabled, or a module while the glue is built in, the build
fails with usb_udc_vbus_handler undefined. The dwc->gadget test in
dwc3_rockchip_vbus_handler() is a runtime one, so the call is always
compiled in, and include/linux/usb/gadget.h has no stub for it.

No new build was run; the result is the one from [1]. An LLM assistant
helped draft this mail.

[1] https://lore.kernel.org/all/20260918091032.15593-1-royalnet026@gmail.com/

Igor

