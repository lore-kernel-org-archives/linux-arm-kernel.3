Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D970FC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 14:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YOd5bZyODtN9cGxOXCDLK+zhRfQThyoLAp0qXa6H4c=; b=aGpkIoXe8Q9NtmZNmlhYAJFVhT
	Asf5gb/+RCGdzKdL3MwPm/5ZtWcbk79/IzL7d07AEgomLgfV86PPqMWxGxm3N7nILfHTrKo6Y6HBc
	OX3XDgQiLbRiLTn9aQOAeRjOZBiT3IMr1HUkDBxnFMtC1M9OUSfoIqlm9MM1oZzZ0Ub+P+CQHEOsn
	u3HbRxt1zi0dl7y908kSpsoMPKj3K9SRhH7lRhGAcvGMufq8ylAigJG3zX7c71ypv522UPnSCNnc4
	r9VkKsHIXV2RlWOjL2tYB8hT4dEa1HeJhc4+nR3Ggq3NdJzZkTNqRW3biFURi0ZICJrMV6ghdaNGs
	lcOIzf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kef-0000000BIHD-2rKX;
	Thu, 24 Sep 2026 14:42:33 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ked-0000000BIGB-2XKW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 14:42:32 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-8659af7454eso34424647b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 07:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790260949; cv=none;
        d=google.com; s=arc-20260327;
        b=E13IUex9dzsceCVv5/xBx29rGaKD4lkTbNtdaBqo6wkfnx5XMRwVxpJo+m8QpdXCzO
         TvQUNfW8culZIA8ZQSkyaXJdaEZ5pmP9QOy1rcXSSZGN2OMEx6j2YAi5kizFo48QgEV0
         m8LQT9I+2aogbHR1hC+cB4XUICD96uWBOwdIRpVQ0ucRZD8QVqPvoGnXK1covIk2DHBj
         bVBi6bHAd7N78H6WPoO4p8ZdUnTPnuQgFrm2SxhOiUq4e89IiGXdsfP5jdXi6Mg3+P2n
         tgSv/aHhqkuh8KKn2fbzYTSRuKRmFqhcoYlFkt5hAp6qz/5fDWO/F6nFcZWeN/eVbfZI
         LjyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9YOd5bZyODtN9cGxOXCDLK+zhRfQThyoLAp0qXa6H4c=;
        fh=xm1cR9FwehjdiEUYvaTtmdnDzhchz1sySZskf/ijv3E=;
        b=focwcgRbViXnfx1y9IFli6acOFvEo+NmMG6jZyjEBXsj/Woc52a3yGzczrCrgCQql5
         8GDoS9dOFifos8jLQBQYeRcixctKU8I2a2rcvDgvttunvVbLmPM7MCnbSBaCrLsM2USy
         kTXP5vZlbZJM8sF1rN5yvknflDqm1yP4fKh5bsoXHFTBppuMUMQUi3UH8vD53tExaeuN
         68ko7H+M8loQrStXJofI8xxlJu1PgbDr8ifP03KKr3Klc6sWL+rWeMjpyJ6xu6cSB0F/
         P1IPMnsEUyqXWqOzeUfNdXhhVnm9gp7N6cNO/LeCEgOpSEMbgb2qrWvsEGP2gtuE0ooW
         T38Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790260949; x=1790865749; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9YOd5bZyODtN9cGxOXCDLK+zhRfQThyoLAp0qXa6H4c=;
        b=Jgt/YDpVMUWO3I1QykMA/eCabq4mBv4hKx+SJnl88bQjfdtgf1WvJM20Y7D+jO6zaL
         +4IvIEZoS3+JaSRI5t2U6Zx6h6xWjIf3xTR/99HqZVv5kDpsst0ynqwcrxISAeh8sP+5
         vl2creSFeN2F7kaKJAbr/bbf5TReNQzH4bygCoucT7U7nn8t+h2zLRtW7LTuEPoYDAht
         rNU5EKe9SiiEWHsyTIu9WGl50BuZKP0R8I3oItbYdW4ky2g6aZNNytsLcR05JNS07MVC
         iGqmGrkfJF8tJcdtPcA8xHHWiEXgc5IFrIA7akFeVwVTNKtCJpwT/tSdy+z03paQgzpM
         f4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790260949; x=1790865749;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9YOd5bZyODtN9cGxOXCDLK+zhRfQThyoLAp0qXa6H4c=;
        b=Ywj/+2HufEe+4CYZ2u2BnUhUxj2gbTbC+0C/3Va39GMiEX5OWdlwIenwe+1LuYPReE
         Kq2jfvcJhs2JCfTC81/ou6DwPwbxNWUwjg42rfWtGUrPe/GMzhhAZS1mcsVB/UXBvD8x
         Em0jp36cQX3KyDzv9DUnIoxb1j8S+AQH14Q8GeoEmdvfhTIL6/gcdmiaZUV+vxK6tG0G
         TMNe1/U+fmJxNRbyQCo9+Yxs8MLgQgrk1zRBOyryujJvSGDom0SI8aMwzBpoCshC5MZk
         bsZuas4Ceo0P5VwiuQfcaiapLfCg1+r5XYX8UJvnE3m5NtbnGpHZw6Ro7NhxaPORtw+I
         wYEA==
X-Forwarded-Encrypted: i=1; AKwUvBwPX2bp9hgvC1aHUiCvU2Me5bca9zWtxSfBWqD6IsZqxomrp7WsHZmtFNUnI8vpiRV/uOrNQpL7zEBiAdhe7w8b@lists.infradead.org
X-Gm-Message-State: AFuF++lyV4zUYwboBI8OkZ4QHAEXuyZGBq4YnImd1GUkTJxHkfIfnPNp
	B14k/RjSVk0PqZDe3cRBOtkaujWj+HNMnNKh6DneU1XJCY1zwPJa7ZoB4kbitK5wbwUgZmOmHmA
	m4EUu5n/2volKqP/o+SzQacbYOE4mlLM=
X-Gm-Gg: AYBFou364y1Y/9DEGRLo8EIbbWkKTMEZapBUQrYAVgZyvrEhcFqheigvnBI5aaLiqsu
	gFXclUIYZ0NeaumI2rTuK7IKzWSI1AhoCUQVykbB5/h7u3jtSi+k3CmxD5mnf9UtU+dNqxWasov
	7wvHOxSk5H3fBA0n6lWc22N9rQ2XJ0BaA94mqMM62gYSeWrO8DsxhB95NffRG93QgW3mLnL7XFN
	8kog/IPymuw3QuTKwIf/5H5tcO88Qwmf1qs0JUmooFSO4S6iim3QLgxIK6JzY0vB705lDr1LF6C
	+rd5F9JxXbIlWldl4c+h0DVpNXweqR/LeEeqGgrTYtINqi0/1ufdQ33GjA==
X-Received: by 2002:a05:690e:4386:b0:672:a52c:db1f with SMTP id
 956f58d0204a3-672ed48ebadmr1187815d50.103.1790260949554; Thu, 24 Sep 2026
 07:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260923112009.1062-1-anykey196@gmail.com> <20260923112009.1062-2-anykey196@gmail.com>
 <b01154aa-16be-4dbb-861f-d4a70da7ad83@arm.com>
In-Reply-To: <b01154aa-16be-4dbb-861f-d4a70da7ad83@arm.com>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Thu, 24 Sep 2026 19:42:17 +0500
X-Gm-Features: AclHuK_hCbEyvfcHbTXKt-ecvSOb-lEWKE5cl3FOBZCvjRjKdS35-bDLlzlza6k
Message-ID: <CANHPwAT=tDAnTY6hor0WssxiYFh27doZeD=j42WHxX=3fUcHyQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: h616: orangepi-zero2w: add
 SDIO WiFi/BT (AW859A)
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_074231_651515_97B7C8A3 
X-CRM114-Status: UNSURE (   6.23  )
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

I'd better rework my patch and letter, do more testing and then resend it.

