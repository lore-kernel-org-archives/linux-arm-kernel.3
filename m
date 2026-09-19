Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB16C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WVdtse4utFqdGo5H8fnCG1N9VsS3ll8DP5z6tgaWzw=; b=0rAUJdAPJ/nYIlsTZOc0yKoUO8
	O7XGuPxOMdzzrQC+G9nxWconOxZl4Os4h2V5roRnY4O5eZMbfpu30aegF8UeD+VG3mcaOYDTJ9AZ7
	6H3vYzbuzOmOWn6pYsdul+DiqBQv0sv7A2ZRxjzVBk+draRtydRAI1AII6gH4dFaqb8mgAP8kM+ph
	alxR3rZnj8zNScxoQElogsVgpGTzgUMZ6UJGatT/IQfwcBVoH+AnSzsgT7WhqiEW0usO28RRJopv5
	dUi5YbjffS8MX0dFJ3TLjPMyNh68zUydW8+u1pml4MdnsZ4r4u8dLbI3U5l1Yby1ihLxMvM68V9tH
	/UVDBl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7vtW-0000000GMVR-3jHX;
	Sat, 19 Sep 2026 14:18:22 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7vtV-0000000GMV6-0Cqb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 14:18:22 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e721b5503so16139975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 07:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827499; x=1790432299; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WVdtse4utFqdGo5H8fnCG1N9VsS3ll8DP5z6tgaWzw=;
        b=mDYBJBn0uJDdCXGthJC5KsbCZUv7MtnwPjtEnPg1cOclWFyDRloghWWhCe977uyadW
         7B8Rj8sYp2GZsjjtsJYI1pD9TEFeZZgXAaiy+rgyqxTs7/6CLjZQDALwpnjLH89WFHdw
         HnCQ/G1JUcpU2LJIwvMs7AvjXO3/bChIfktiJ/fIPnGOtHj95tf1ocBdLHzbr7P2u/Bs
         2MWNi+yZG/32ezhVMuCwECU+JB2+gtkideJxnU6iurMAXo8Sm0xgpQlRrnKIK83vB115
         IWCEjOhe8f0BJKmv0HsbwxO6J/aQ2XJTSZMRTsfJkU1hCjtOzUoFG1aXxFmWrmic4c+p
         Mfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827499; x=1790432299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WVdtse4utFqdGo5H8fnCG1N9VsS3ll8DP5z6tgaWzw=;
        b=SUGGQMNi3Ntow/x509XcoaAbT0noKxDk6h+7JlAKhwuWBr3LT3oIm5ZDiEp4feaH5e
         m3mDKkEc52E2ORRAx5uVQE99yOFj6Wk6SLEXQMBHY6LKqqDo9uU7KLF93xU8ZSNCpqUz
         PZE3pq+JYQp0toYj3ACGVl8gCGp5T9031ljo/JmNh+soVe2l/0qiyBp3qJ67J8xSrH6Y
         tt69L04EB4inmSdAllWP3R7iplRr+Od3NrFwtdE9dr+F1KDd9s86HVltCXIkMoH2fMot
         Wk/eZJ48jdl5XlN6JIczq76WfDI6UPMqIT9+zddhLSn76VQySYT1RneV83BCQ+QkziKU
         ei/g==
X-Forwarded-Encrypted: i=1; AKwUvBxvbJb0u/CxVq/G6YEx7o/1HJ/DDdrtqoGhe6WFSWNH0dP5MntRysOO7P3z3z6kT9cBCqfgyITcHwJvzp6a6pwJ@lists.infradead.org
X-Gm-Message-State: AFuF++n5IwVFVejesSFAFXZN5QE+TJLDwku7ZamDVDEbcx53gyQahgDQ
	+DtBFakkt2f1B050MSYQco1dnN49aMWjfJQpD8+Jqd8smmTnzSEeWTl9wrq3o0/ihqo=
X-Gm-Gg: AYBFou3UykiPRRgTdvQlrH7cRTdleywX2VaCBBmciEpF9XTZCExSR5fYU/Le3NBDEA4
	bUpcOCBswaXZK/1k7OQEVV0ikydMoHs9Ev5Z+PMa/mXvR/UY7QfBGt4/Rl669tg5vOYuSSSSmk/
	diUEvXzVARP2SsCbX7MjRZI9Tx+QSQ6noCY6ZJZZhs+cGaASjYlfC5gqOHxbQL6cFJYjPb2S6UI
	56PsmO5Q3rKtyXFueCqVKkhkwO94OFo05p0NWCRBZd0r148pf8fPzexBcTMFBjo7KmZmJ3+vOUh
	9wqjrHR78igA2TGxRlFlmobeaYGuJtAZFXY78XaEOpyd1APgcVKwoXefk29UivyTQ9+QkAqgpwB
	EDs8Me1Rr2kkAOsr6+90evTPDGqLW0n/19nTmk1zySjR4AIz3hTLy4homhVRQwFfFBanKliq2+e
	+whfy21wOTI12swANaafjF2Hc2iirpalg1KCqKiUOv5CT3r7msWmIQtuZJz/nd8MODEkLkhj297
	8obVeIprvqVqmw2urjZdIT4g5rOv234dkoTki6biSfRwl/rz97EJrJf
X-Received: by 2002:a05:600c:c493:b0:49e:74b6:740f with SMTP id 5b1f17b1804b1-49fc573603amr76055195e9.17.1789827499187;
        Sat, 19 Sep 2026 07:18:19 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd090f0csm106407185e9.15.2026.09.19.07.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:18:18 -0700 (PDT)
Message-ID: <5d09e717-a478-4c9d-b5b1-9f309edc064d@tuxon.dev>
Date: Sat, 19 Sep 2026 17:18:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: microchip: ev23x71a: enable eMMC
To: Robert Marko <robert.marko@sartura.hr>, ulfh@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, adrian.hunter@intel.com,
 aubin.constans@microchip.com, ehristev@kernel.org,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-7-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260907132617.1198548-7-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_071821_100052_A886172A 
X-CRM114-Status: UNSURE (   6.87  )
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



On 9/7/26 16:25, Robert Marko wrote:
> Enable the non-removable eMMC connected to SDMMC0. Configure its 8-bit bus
> for 1.8 V DDR operation.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

