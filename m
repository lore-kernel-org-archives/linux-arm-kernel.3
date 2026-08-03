Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5905EC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmoRzRSGaYrgmLSXQHd8nxnywAiGDAxo7QcVjOS8Dtk=; b=bIxc41/hzB/HYBId5+ImEZmvZJ
	6+bY96GGLJ3NysJ6owL7TEyBLSphPkBG0eDM3EMOlfXj+KnAKx1+0mEJp5qWusNZwx6aUSJmoXhZu
	QhBzFvxpVtsKE61eqsAn+o8fM1T10KGSNftRn0P8S8/e6qqj4HhI1x/ERSb0/ImhPwi9vHKLSeYMa
	0BPM7dsZM0bYFwctVJbI5/eCfiGDTa2i1xW8jpwEbnKdKoJ4lJXQFyx4vJgKXmK5Jj+s4AEgAaSxV
	qtS8CuRBLEUE6bBNDTG213Akl26DPAS7v6VtiDysfgeTgZIkBV+J7LNRShF21bQxkFEnkHqjq6L6T
	+EqdBEtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtpw-0000000HPfC-0ATx;
	Mon, 03 Aug 2026 14:40:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtpt-0000000HPe4-28Vo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785768012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VmoRzRSGaYrgmLSXQHd8nxnywAiGDAxo7QcVjOS8Dtk=;
	b=Vd59kCVyh9AMk2fWhFJQPRZ6jnzTsVfI4pUeRdrPUxZbcl6VeSpKZIz+gOW6InDIcfL/5p
	laolMSpCF3+19kMI6Qaym32IraMqW2TcaKmQUPYR3PsvyDT5RAWGS3FvtVtubgFHdA+KVT
	+LSjid9lo38/JCnYWsLzI9ndt4XfsoM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-a4idiVy6NeCk3ofO-Wi55w-1; Mon, 03 Aug 2026 10:40:05 -0400
X-MC-Unique: a4idiVy6NeCk3ofO-Wi55w-1
X-Mimecast-MFC-AGG-ID: a4idiVy6NeCk3ofO-Wi55w_1785768005
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e735bcceaso53765837b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768005; x=1786372805;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmoRzRSGaYrgmLSXQHd8nxnywAiGDAxo7QcVjOS8Dtk=;
        b=kBsbAkjhYNPXy3W88aVqM3LnClDnTv7EES7KyuMi8tV31XYgvW3ktwtDfvU49LxCVV
         GK7/c8CheZHHUs+Z0Oicj2r0D2nG3/mayYLRznKG7l3rKTzPnQe7JXBU3Vlk3qRdVyo/
         MlrvtSydaj/6fv9rBblwUE5pIRBxBu9xqhdKBmh52XknPPZ9lTWVxDI18N/X/EJ2tXX+
         WNdVnsQ1NPSkLEEJH8OwemNAvMFRCKlqPMtU5RmYHTJckpb730GHuAy35mvlCsRdmiKq
         Ma76L2WRG3LMQ0OTrdtGTjGGJxMlU/hKFuNLASYJrWqBvm5VsMR3FdVD/v3+HoLGYjRX
         TyOw==
X-Forwarded-Encrypted: i=1; AHgh+Rr41qQGOGhWr0WrpnFcmIR3lJWXnJ/dhn6de4nMDzcmbNY+xbEacdIGkiZipCD3phNJDn5+yQqCg49CD6ltYaP5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw2GrIdC5KiDMzgd2tNHqOoVnXEcR11NKNDe0MVuvdu/ll4f3D
	tc2otUGqrnNHLJTH5ZReH0No89BGt3b25lE/O//yxWv16AOMFU2yb+ldV/3AwMH9UxdkSb1U/7x
	wYjUf/T76lfPfxEHvw71RWkddOxHgeZzkHgu6eeqLoa6euf8Cw7ifNQ7mRPbiQ/+fbIEgdJuR27
	wu
X-Gm-Gg: AR+sD12JJyUBLMllgJqRmODXvl4e77AkHv9Uz9If8Rvfp2eIn9dPkg/XJP5iqFK6QPk
	E0v9kvT/UGB/EHZXEE3bNlqHAUBOhsyCK6sJYt8XHDMsSskf7xP4QstXg+4Dx22vjbVsTS0fv78
	eSVEOmNIvoX0GJ1eEA4RhXoYwzXdLy3haUnC8H2yY0YMkNKWb++eiMOhFaD/FL6i5XZe2DbcApg
	vx5xYCHPDfE2YW918Wrg0bixd87/Eqbo8vdPmwe1ZzDpbZbb2/DZdy1+NiavuxaKzcdBzJjFEz/
	yz5grXv6Q7eDdf1UEUm1asGsE61yPD4aBWTIW5+aPYI9l210rYeVP/C/WqYTJjdwuEmo0O1ICaB
	1+WXLm0YI5TDra0boLt+6A5Pe2m2pkSOJbf4=
X-Received: by 2002:a05:690c:6b0b:b0:81e:5a57:b8ad with SMTP id 00721157ae682-81fd4b51df0mr122408167b3.21.1785768005008;
        Mon, 03 Aug 2026 07:40:05 -0700 (PDT)
X-Received: by 2002:a05:690c:6b0b:b0:81e:5a57:b8ad with SMTP id 00721157ae682-81fd4b51df0mr122407797b3.21.1785768004486;
        Mon, 03 Aug 2026 07:40:04 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d6fbbsm55781147b3.25.2026.08.03.07.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:40:03 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:40:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 12/25] clk: mediatek: pll: Add PLL stabilization delay
 definition
Message-ID: <anCoQeS2OoucB0mO@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-12-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-12-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _BSodV-pe13hkRzHJn8tOcl93cm6cGhvvOIPwTn0HlE_1785768005
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_074013_620648_1682A37F 
X-CRM114-Status: GOOD (  10.98  )
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

On Sat, Aug 01, 2026 at 01:20:58PM +0200, Louis-Alexis Eyraud wrote:
> Several functions uses a hardcoded value (20), to represent the
> needed delay to stabilize a PLL.
> Add a common define for this value.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


