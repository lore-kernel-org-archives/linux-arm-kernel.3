Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38967C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QL9QOEew/d6GNE0NYm94GLW/r5dmryOcr7eHZGft5EA=; b=jm69vxAFhDWNdMZcZUjJlicD6/
	Y1UqtzG2Zv/ELbKKq+/xD0s9jpWkIyrgAYc+jiwc6QG2q1hW3zarH1HEHLQVunT54doTQwjmqjxi8
	OownBvHWGtoxRGtPhlb/6mV8zfNHBd3YSaMTYrYI63BWf0VuYVGVlTJ3fhcL9gwV7JJ9aFr7NPHvh
	p9Inzf+EJ0UfFI9TDMgZanhSw2HiWe6G/LO4jzlXmeO/Z2Iim5uFpxehaev8b2B8uPYnuuUsAogJX
	VivPw81lzi1FGS7lc6gfjk+oEmABm0Iq7rmKKh3zsVJzowYT6iqVJ1uVeJT/FP2WzF4NPhKdWnZYb
	FS5/UB0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWZl-0000000GvKI-3q49;
	Mon, 24 Aug 2026 15:27:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWZi-0000000GvJY-3oZ2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787585222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QL9QOEew/d6GNE0NYm94GLW/r5dmryOcr7eHZGft5EA=;
	b=KHTLLGgBLn5gUeYIT8IF76l1POb9Zrc5cMLYOkL/yX2MKE2tsppX2nvzTokVoqPHviti6N
	5g9JOwRuCq33Jz1wEodbONAHgllj5a8bUhHK3CAkrWkKNqPLvuQ83puLWqLAo1ylZEM+QL
	dnwZ4+Lcs8Lv60qG233f1NI6wi4nRGA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-qnwTVz_SNGi7e1JSojO0LA-1; Mon, 24 Aug 2026 11:25:04 -0400
X-MC-Unique: qnwTVz_SNGi7e1JSojO0LA-1
X-Mimecast-MFC-AGG-ID: qnwTVz_SNGi7e1JSojO0LA_1787585103
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eac2620cb0so37963776d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585103; x=1788189903;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QL9QOEew/d6GNE0NYm94GLW/r5dmryOcr7eHZGft5EA=;
        b=eaSabasKes22VqfI9xHvlgNgOphldATsQnBO2zda6K/dAax3gfnkaB5nm1BrPaG+W7
         Mldb2R7l1TxAox+oqG+n2a+h+G7R5sKFmsdbjhRq0nZF1QI/VRJ0Nbeqy+LtHPbt33uv
         pQe5h0R7FuGgxIwmOj8gzJAOhCXdn5Lf4ZBd508DGs1PdhIN6uBf27ceVHMUaGYxZzfI
         7gatOk8dgjijsOJ7f+nhDPIUrQ/0PB1RRUaJVjM1h4+WpUgNd4dBGKKXMWznC5zODWyU
         tjabNVibAcZ0H+EoveLr7jmHjGtD4rCuHDboANENQHTMyLIz8uH9NctbzqcXzIPiBnX+
         d+Zw==
X-Forwarded-Encrypted: i=1; AHgh+RqEbFYmL0k1WQLxhzCxSt3HnfS3OtUd3rnSxoRUIr0xtOipZbdGHQgCmWee//XhDESbZZmE8RazlA0HZT8icVsI@lists.infradead.org
X-Gm-Message-State: AFuF++lQP3vF3LeS5mV7Z4F+dp/GCOYSRHyF1+PjSDK0s7Hj4p8HIbIu
	f6DyQPmDpMCxTdrfQj5f+10clEQZ6DNmKaBUYBZrEy2psbkgGOhV62xAL6tPd8wDUVWkEQrUDzE
	jZ6xOlJprqwlATAE3Cyi2Sc66NuGOmYvF1soAWhr0x3ThBO3vPF209244unrGOgHGNRYhnx0dGl
	u2
X-Gm-Gg: AR+sD12bhXSA4wy0+9vR3ZA1KhmvfDsPYgact1iiIf3TBzuCcUSMb19DLsNLQShM8Up
	NAjhE/iygYIFxLxjK7qjjpWnaPk+LchIxT4+XO0zRSBJ5Uttgzsnmz1LV875385CB1ouLNFV+H5
	32OEPT3drUJjczMWaTc9B6WkHCbnS31LBMubWy9Iw5ZwUy1wkByfcluudkQvjwQxXsNk3sJ8G4b
	MTEdOindbJZK+v+GorVMUqaeo1SHbvsEbdYkQDQI2BXGYOhB0uNgrUCiLSIAbonzAgTObhsPrOE
	6YJvYZsKKbHTO4C7ZZmLouYnw18U7iosDVtiwapyVEolhu3mX3uQLqZ0y4TlD8CrpgOScbyQS5S
	bBpvfhtaMg0M7f9iWgKvLufe+D9Qos16wtzA=
X-Received: by 2002:a05:6214:4113:b0:8df:98e0:4594 with SMTP id 6a1803df08f44-90c80c5c09fmr261767846d6.15.1787585103522;
        Mon, 24 Aug 2026 08:25:03 -0700 (PDT)
X-Received: by 2002:a05:6214:4113:b0:8df:98e0:4594 with SMTP id 6a1803df08f44-90c80c5c09fmr261767136d6.15.1787585103066;
        Mon, 24 Aug 2026 08:25:03 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a4d8bdsm64019176d6.38.2026.08.24.08.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:25:02 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:25:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Kees Cook <kees@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: at91: main: Drop unneeded cast in
 at91_clk_register_main_osc()
Message-ID: <aoxiTREro0NoIs22@redhat.com>
References: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YJfK_6uOnX22cmYBPQnqCJkKWPBpzAg1g3YoJAuf1cQ_1787585103
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_082703_022347_4BC6EEC5 
X-CRM114-Status: UNSURE (   9.56  )
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

On Fri, Aug 21, 2026 at 02:44:28PM +0200, Geert Uytterhoeven wrote:
> When assigning a non-const pointer to a const pointer, no cast is
> needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


