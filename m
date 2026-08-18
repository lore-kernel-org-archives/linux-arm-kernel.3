Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24ECBC5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 03:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fmj8lP1yFjzbA+ervTx82nLhcjYdqK4FiTBNDHNyFKc=; b=ZbA8s0f6pLjDLf5/4vzbVWPwvV
	brqczdYEAeJ4MDcdBeBBsyrBuvX1Mzl6+XjH8/w0sHpmu/oZw9Toa3N+oPW9YwqPwxfJztqNHHLqX
	MFJAGud+Hx+qjBbcKcQsJgk1X1yTB9Ismius95QH1ZodmP7q0WXwj4Pr60eMIJeF7IztfGcu6YVdb
	vXllXMDVBQ8V/MUsJq3SRH6c9chZRvMnOG4ilaGYaKr7Q33cCDeF4xjqyaNpCtuVTlEZgFRziq/Jp
	S6GbAQb1yhyPU81+kZedywtvKfcbpwMTIDVqASuneFbonf7aw/VWmiTPcZGyaNNzmvoLSXAvT4+Ga
	MI2CeVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwANu-00000007Aex-31Pa;
	Tue, 18 Aug 2026 03:21:06 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwANr-00000007Ad4-3nrj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 03:21:05 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-9063b380982so43245896d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 20:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787023262; x=1787628062; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fmj8lP1yFjzbA+ervTx82nLhcjYdqK4FiTBNDHNyFKc=;
        b=JUD6EUxQ0kM21TROcgBfdOmCHb93vWRApbSrkGJhvLJHgmiIeBZhAQH2fDe52DXAOk
         fsq5W8jn2h4WrgWVg8kp2CP4ODqi5tLaMFORMuZaJKw4PEmISJaP/XNOh4lf9bUiTwEb
         Lq6VJ41kfZtzUvJrhdt94JPUSn5fnA2NZC+nERarM+luAM1PB9SRCHUkwB43CZSstZ9N
         0S3UH3iHAhwLqrKUljy/pbCfm/AeY6WQuDOWKhjMm+jAJ9yCLEVWwgeXdO3LonnWdd3y
         TTXeAI5XHTw+uTG+3UL3Be1P8QLf0zfHzi11+UXUwbv4McnLSd6gRkWVS8ZBouhuJW1C
         EVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023262; x=1787628062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fmj8lP1yFjzbA+ervTx82nLhcjYdqK4FiTBNDHNyFKc=;
        b=XB0oAZxGLDcF7HucRaPGE9iEatKj5NesLE865vf8aVzJLJrjpfiWSsUAf5dorbK0rM
         dH3IBm474uBSiEA80Wh2XTtVMXKF3IzQOGo7bn1rVAPSOwYwjIJCzngyilNHOQtMhm+X
         sRBWX/3cj2pJLjXFUHyasdIP+Vvfe0h1qow34aO4/gTv1YUBet/L/Rj6o80CozsSR4eq
         8l784arsZIbzZ35b8EFgmkZBu9hYzsTALCm89mZwTSOAx+vA6YeJn2DFlD6TubsuDXwF
         5qkdQzkPnqd+wxFMkRxXa920o16R7v3WYQb41o5zLLViWqleOQ5ux3xoNlBSo6F+Fv1d
         qcWA==
X-Forwarded-Encrypted: i=1; AHgh+RrVscGXhba74YD1fw8Va+lxD1bp7bddCQreJYD6zJ+7BKeeI86QGozaoh6O2unSlP/FmdofbcLGH7IQUu0r4SCJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzXRiqEvA6nkTe0NHTk4tdTwBy99CWojXy8YoddbJda/S63hNxN
	EYAnyiJJwI821AYE+/cNBbsvkNCT1CR/UvDur+UbRuIDESwDxRNoeDQWpy4kMwNXWg==
X-Gm-Gg: AR+sD12mYjedbK/LDF4NTPnCyQ3vjL8sCwOQvuqgyYV2MMGdJivTFrAnNEdatBDvHwa
	DKSz4dq/fbKK0iF0rWETqL5RfBHLJBLzm7ovUOUDeJTBF+49eS7QNLesgDEBUow6bBuWf36qM3j
	0qb96guWambMNvB3RudFMlxJ5Eo8gap6sqL7zQY7n4N66exVMy+7OHUP6VluZ7T861KlergoGuZ
	iNopnp3z5gedEGSdCYftRaT25I7T2BCb2Rwc61mBr0GrKmFT75+Myrl0HyHCLBjB54T/RSUtvTT
	mCL1E5l8xsvFthhOiqEh/9uOUAcrms/JJCS9bCYF5Jar1Xo8yhARBDhtJLzUwgh+dSY+jEubNLu
	N0emF+FtF2oRPPvHCVtg0P3zROIuJiyKVNwQKHzOlR2EckwAQvQ5OaYExme5HwaV6Gx3vvywMaR
	ih7SGC4LwkzqmqEpXvLz+FXPpqmhT1ipxmptImk6D+QxQ/lrxO940/aXOt4sC5FA==
X-Received: by 2002:a05:6214:2d46:b0:8ff:650d:2b99 with SMTP id 6a1803df08f44-90a91a2bedcmr366357696d6.0.1787023261794;
        Mon, 17 Aug 2026 20:21:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c4583a412sm22883076d6.12.2026.08.17.20.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:21:00 -0700 (PDT)
Date: Mon, 17 Aug 2026 23:20:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: george.0xfff@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC 1/2] USB: core: add helper to queue device
 re-enumeration
Message-ID: <a22d5d46-084c-4891-9a32-0c9f8adc60c4@rowland.harvard.edu>
References: <20260818-mt7925-rfc-v1-0-284d856ac572@gmail.com>
 <20260818-mt7925-rfc-v1-1-284d856ac572@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-mt7925-rfc-v1-1-284d856ac572@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_202103_978094_E5BDF477 
X-CRM114-Status: GOOD (  26.60  )
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

On Tue, Aug 18, 2026 at 04:55:20AM +0200, George Maraveyas via B4 Relay wrote:
> From: George Maraveyas <george.0xfff@gmail.com>
> 
> USB drivers can use usb_queue_reset_device() when they need USB core to
> reset an already enumerated device asynchronously.
> 
> There is currently no driver-facing helper corresponding to
> usb_queue_reset_device() which allows an interface driver to ask USB core
> to remove the current usb_device and enumerate the physical device on the
> port again.
> 
> The difference between the two is that a device reset continues using the
> existing usb_device and its current enumeration state while
> re-enumeration removes the existing usb_device and returns the port to
> the hub code, which then discovers the device again through the normal
> USB enumeration path.

A device reset continues to use the existing usb_device only when a new 
partial enumeration yields the same descriptors as before.  If the 
descriptors have changed significantly then it goes through a logical 
disconnect and re-enumeration, just like the function you want to add.

For this reason it's not clear why you can't just use 
usb_queue_reset_device() here.  From the device's point of view, the two 
approaches do pretty much the same thing.

Alan Stern

> Add usb_queue_reenumerate_device() to provide this facility.
> 
> The helper queues a logical disconnect on the parent hub port.
> hub_port_logical_disconnect() disables the port, records a logical
> connect-change event and queues the hub work.  The hub work later
> disconnects the existing usb_device and, if the physical device remains
> connected, attempts to enumerate it again through the normal hub path.
> 
> Any retries or port recovery required during the subsequent enumeration
> remain the responsibility of the existing hub code.
> 
> usb_remove_device() cannot provide the same behaviour because it also
> marks the port in removed_bits.  The hub connection path does not
> enumerate a device on a port while that bit remains set.
> 
> The helper takes the device lock required by usb_hub_to_struct_hub() and
> holds a runtime-PM reference on the parent hub interface while the
> logical disconnect is queued.
> 
> The helper does not decide when re-enumeration is needed.  That decision
> remains with the calling driver.
> 
> The following MT7925 Bluetooth patch is the first user of the helper.  It
> requests re-enumeration after the controller has already enumerated
> successfully but later fails during Bluetooth setup and cannot be
> recovered by its existing reset path.
> 
> Signed-off-by: George Maraveyas <george.0xfff@gmail.com>

