Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2669FC5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n84akRWrYp771T5DP5M0T4nRXTa96uuJHFpXgEzxzNU=; b=Sj7mDTxiqrNwK6IMYnnfMckEix
	zo+Qv18ukvZnqvJ9v5gyT5stxaClWltcUM4DjJ6ia3YkQAl5fCFfnTySgF07BvU/0ijRpU2stkBYO
	no26Ab5XKH1TW0jOuBuZ4LImm7RBmbG/4QVMjraJfLEaAvCudjgCAXhAXjeAKDn5eOcSgLCjpQAjF
	BxERApZJo/0/5DqasVQt3weJzSeqN8zlwPOwQnhRcheI79sQnvkuIpLGuR8BW032ZG4bARiiXfhM1
	8bAcVYyJad5c2DNQziEVkvDyPF8Zy/MpN5wYpSBTSzw+pcRDFX/F4vqYaq9d3hEDYFwhp3Wr+wQ+H
	Zf390Ayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbFz-00000009H1n-3AnF;
	Wed, 19 Aug 2026 08:02:43 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbFx-00000009H17-3ynR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 08:02:43 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47fecbb7000so340702f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 01:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787126560; x=1787731360; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n84akRWrYp771T5DP5M0T4nRXTa96uuJHFpXgEzxzNU=;
        b=gzzHQ8tI/M1lDZ6G6tklSHGb/0jkRVElSpWzxIfVznwUpeT1HfIM7Q8jNKkwrQHN7G
         pJ5tsXDc8/UrqSk5DUs9d+HGRZt1nJepGOXqemMbFCHJMnc+UTbCF1YEzmt83w2DcDbx
         NGJWZVgEoGYrpyVsH2lFTDeIwDwHTQ0WkWA6UMJeoY7IlDz7ON8SrhSmVjg7DeJtR3bm
         9gk9vnn9gsWxYoqMjUH1EPfuaVlCZAOExfj8dYxpkTOz+ICmTCq37xox8ipXR8YlFC/+
         m8NgeZKrfetrXKkFpT46yYlz0P6lKgITdy0Wc/wq1s0XZY0GvJ4foZTDxh8Ri8ALHQdE
         JSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787126560; x=1787731360;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n84akRWrYp771T5DP5M0T4nRXTa96uuJHFpXgEzxzNU=;
        b=q2pbnRk/C4GGBiybxVri3XCvr6QH0k9wCvS/XbYWCgXPGSxPIEKO5GYRigZn1TR0FS
         M9+Edgc2lwqk7o3NRU9kycyvSY8VUHKLXENNju/wbpCVHRa4a1to4q7AeBBD2H+w5xbF
         u70e6zNQO5P6aB24ybsw/jtsGyVvi5WMR3j9RMa2n444OpCj6vO0vRYDau36qXLD0Rjz
         ADk2HTz4jvXbzgPeFimwku1Z/Oyrka0mJWOvm3jMrWFnz13aLBy7mugmssL3QIiiVBmJ
         xHVORJA8NbuN/7z1/2q4Zz6V8SfnIhKf705yfpb7Xl0ppPGyjSuW9c8TUjgkvXLcx+sj
         7MOg==
X-Forwarded-Encrypted: i=1; AHgh+Rqztod0WfiB338/vB8T2Kowfk0lFramq5nM6DmEqM1hdhhV18RyZFPlL4MGmBPtm+/pyRW7YWBe27mQo8MtEkJn@lists.infradead.org
X-Gm-Message-State: AOJu0YzAsxnrHZaLQEyVent16KreMejBMZ9ICAL6S3SLoRy/dbwrmsDS
	oRbj8mZXwQ1wNnqK4o62ARIYWXDVsQfPe8FSw6vF4hvGgIqPago6fNwM
X-Gm-Gg: AR+sD11h5YLWhd1eGGhOsWgU9mZc9hA+0LyUOIG+8V7f0dnewk4E83eTJL/COH8XXSn
	div52QwzUDwXS3dyfKiLOKMkfTrc4kIANhnTTEdlHOxTa2nHWfrHJX7ynegkUYEpjpWsiwgiQcj
	4uqq2eSsr8cHF63ofzRJ9HYrR8jwz4Vi/5NpY6tkzv87PnddoltybC99ZRk8wl9hfsqp7LlbNA9
	bsEuPP6S2Lj0Ah76+GveGQw/JLX1dQVphBo8Ja++/tgpvPXe8F2I5kwLgVBAdliTqqOAIJzjJgE
	Tdw9xtPDZe5uZ7QBLd1Sefjul179m3WXwu4IPEtC39B2mpJaTcwwh94C27yWg9O/DGkaXkmSm/T
	rW3v2Xqw09qBhd2ltBD3z/QBxGhK/mzURuMr35DY2XZUYQ//EdOdFIn7XJe0sCOlUliPxsjLsly
	w7mzyBX6OiIfZZu/s368We8y5lD18Vza7/h2CaZqdHvyCbgG7b+3TmvunyvbL3YoZf6MYI0dr4Z
	bOGatkMS45J2HaDTeGxXfTBFxOVZvy35r2OjLrlCgdNXFBt5srglsivnDtOMmAjPHIRulJm0U6Z
	UA7OHi7ytZ8EUdPQfTd51awkyiIm72VfbYfD+MJ0qV5DbBKO13TNk/GCzAhiG0hX+sgMhOdki7l
	a1iUi09Ls1PI9yBea3ni/cIxE/F4wqaw9mlSVS+WUCFnZIUI0p6g5tv3VgdJ/8rraoYB13Q==
X-Received: by 2002:a05:600c:468d:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-499aa17d5a2mr43992645e9.8.1787126559565;
        Wed, 19 Aug 2026 01:02:39 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9aa3204sm31743085e9.0.2026.08.19.01.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:02:39 -0700 (PDT)
Date: Wed, 19 Aug 2026 10:02:34 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Vladislav Leonov <vlad@zlab.su>
Cc: andy@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dlechner@baylibre.com, heiko@sntech.de, jic23@kernel.org, jonas@kwiboo.se,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, nuno.sa@analog.com, robh@kernel.org,
 sjg@chromium.org
Subject: Re: [PATCH] dt-bindings: iio: adc: rockchip-saradc: Fix RV1106
 compatible
Message-ID: <20260819100234.0000355f@gmail.com>
In-Reply-To: <20260819075921.14356-1-vlad@zlab.su>
References: <20260819085255.00001e60@gmail.com>
	<20260819075921.14356-1-vlad@zlab.su>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_010242_049912_87BE4A66 
X-CRM114-Status: GOOD (  11.20  )
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

On Wed, 19 Aug 2026 10:59:21 +0300
Vladislav Leonov <vlad@zlab.su> wrote:

> Hi Joshua,
> 
> Sorry, I forgot the Suggested-by tag. Should I send a v2, or can the tag be added when applying the patch?
> 
> Regards,
> Vladislav

I think that Jonathan can just add it while applying. No need to
send a v2 unless explicitly asked.

-- 
Kind regards,
Joshua Crofts

