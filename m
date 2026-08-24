Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41E4C61CE3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/goNprm3vb+vqF+2+ZaUSBOvzdh+ZGsOcB6bvYFMahs=; b=f8DHkq2mwPp+EyMgt8UQTHiW2J
	vBhKmT5gwFQIeKH/EDbSHZEYdtaEw8NViZf+1jzzI1hEAwGmylv00oO+BB8vsFCY3ZaISitbWZbDq
	WhoLGy7+TJVjPzqLmuAidydfxuAW6aEe97K+8V/++sXsn5iFbPTyJhzxYATGyiA2c8awWUjlnUPHl
	pLm2q6zom9UT9XEPkGW8BhkxfdygA+fJnxrEyKVTXrUNLnyjqKfDKHDAnW78vOSJM0QYI/jitKt12
	ejGBibXlWgKMrAeWhCzNhWXLoB6qcpJ5RsgDMcsAw069yUair4nF9Lhk/sJqyI9AB+O2vUUgjxfht
	XrHiuM5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWcK-0000000Gvhk-3784;
	Mon, 24 Aug 2026 15:29:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWcH-0000000Gvg0-0Qgp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787585380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/goNprm3vb+vqF+2+ZaUSBOvzdh+ZGsOcB6bvYFMahs=;
	b=dWHpnMI9KLnxCUbUwoz/Qb/oJXKZzWvjL60pzC6v2rIE0fLTeU087rD+KNHjZip6Yuz6/i
	r+tXrumCl7ZHRYiQUDx0eSyaa/R3OEC5tBnAM5Efl3G+bX+DOxnwWD/J5dT56nAZ0iw4by
	WXKvc1gLtQrQeWfAgqQjUEyHNr58+1s=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-BMIB-JyKPHyCJgocy8pGGA-1; Mon, 24 Aug 2026 11:29:38 -0400
X-MC-Unique: BMIB-JyKPHyCJgocy8pGGA-1
X-Mimecast-MFC-AGG-ID: BMIB-JyKPHyCJgocy8pGGA_1787585378
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52dd69b00cfso45438001cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585378; x=1788190178;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/goNprm3vb+vqF+2+ZaUSBOvzdh+ZGsOcB6bvYFMahs=;
        b=itz7rwblRvV6rIbSx1jS9611+3HF6aqqd1yvAaMTPSqv4fNew/3/3Ut3PG7ZlJa0Vh
         IAVXBO8PiKJ7xJlxxpagkAOzp6GroqLrryzp/90csAnt380yoELnljinMrXvDZKIfbm9
         G8Zl2yehO7RAMrO1FvUttBtgYqNIH24k78TAee4Xzo5cvzahjeHSk9Xq8lUMO295JAXP
         iyxrYHhY1D++QOkbDK9CccUQngJeBg/1pp1ZbfnXqEzhRkAYYxLN6kOrvUdhygYT8O+V
         cQmSB6Gp3KkegksV5Bw7XGUk7NWVT0EJsjT8pK9REl0Vj15t4TI6xskEb+enatdcMm4o
         rPQA==
X-Forwarded-Encrypted: i=1; AHgh+RqFHiyCDSdb9KVXnuZUQmRErZxgwoad/Lr2zvdJ2EZtTmDG3p2n2N9ODGt+llH8UEWUBXpdGoMknYLUjhKWopWQ@lists.infradead.org
X-Gm-Message-State: AFuF++kMj5f7CMv6H5o59O3syInfO7dxks1L1CihNMEcKCr8AS8ipYc/
	VYiUFYAWRS67Cz3b8GE//oFc6O0vn3Q6eY53zETHoUfkDJkS0EjZf+NGqKrRFdTo2qPMiFz3x9r
	gwAuHLdmoMRTbXT2XueXxArUHj8ohg4YsFgpiHPiD9NvwB/RD9rt7Xuu9PpgqfMrUgyU9Il+2fQ
	OJJmoyuFCNf/g=
X-Gm-Gg: AR+sD11g44UKI0WojORnBi8R27WhKaM7bQU3zhc7VGoKJZcpYNsj0CaGaxVxeBODWSr
	YQ4VRilini+QVrkWNe38IZwWzRTu7q5Dyr/6Ntc+TyCpNKxGp7EjyPLwyP0gDs6E1yeRhuQbuNS
	hMvNoTLpJWKpJjIuC/Xtm7qtGFDLbw6kuclVpX0QtMvQ7CYE07a4jflMdCwCdogv6CXfxXCQqHP
	D88Qo4NeCsNg7RcOQJcnYorhr1TUBKt0uZmXQfq+pVDNC9wNrJWW6cFzBejIrKUFbj4kP11iBpA
	IYfKDbemj8eYozKkQnfTq3b91R2yKyTAPJ245cyhwsUP/7NmRpgaO+daHprMvewURugQw9Y2m/1
	lgkzkRc7lIT/NbZuD6rx1C6aoIqfzk0XExb0=
X-Received: by 2002:a05:6214:212d:b0:8c4:edb4:a44a with SMTP id 6a1803df08f44-90c80f9357fmr293301076d6.23.1787585377975;
        Mon, 24 Aug 2026 08:29:37 -0700 (PDT)
X-Received: by 2002:a05:6214:212d:b0:8c4:edb4:a44a with SMTP id 6a1803df08f44-90c80f9357fmr293300306d6.23.1787585377513;
        Mon, 24 Aug 2026 08:29:37 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c936183d0sm65105676d6.22.2026.08.24.08.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:29:36 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:29:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Lucas Tanure <tanure@linux.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Jian Hu <jian.hu@amlogic.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
Message-ID: <aoxjX3HabY0brgXk@redhat.com>
References: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
MIME-Version: 1.0
In-Reply-To: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -rKAXJCUV_VwpMg2_J-iQlFSISgOM9ddGrY8v5le3e4_1787585378
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_082941_280857_B405F5DB 
X-CRM114-Status: GOOD (  17.71  )
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

Hi Lucas,

On Sun, Aug 23, 2026 at 04:40:42PM +0100, Lucas Tanure wrote:
> While testing mainline Linux on the Khadas VIM4 (Amlogic A311D2 / T7), I am
> hitting intermittent system instability, storage loss, and memory corruption
> during boot, unless I append clk_ignore_unused to the kernel command line.
> 
> Because the failure is intermittent, I am running 100-reboot test campaigns
> to bisect the remaining clocks and isolate which clocks are critical and
> cannot be safely disabled.
> 
> As testing takes significant time over serial console, I wanted to check if
> Amlogic or the maintainers could shed light on this:
> 
> Are there specific T7 clocks or hardware domains that must remain
> critical/protected even without an explicit in-kernel consumer?
> 
> Current clocks being disabled that don't kill the board on a test run:
> 
> [    0.380313] clk: Disabling unused clocks
> [    0.380413] clk: Disabled unused clock: rtc_dualdiv
> [    0.380718] clk: Disabled unused clock: rtc_duandiv_in
> [    0.381377] clk: Unprepared unused clock: a73_div16
> [    0.381972] clk: Unprepared unused clock: cpu_div16
> [    0.382605] clk: Unprepared unused clock: f50m
> [    0.383174] clk: Unprepared unused clock: fixed_pll_dco
> [    0.383786] clk: Unprepared unused clock: hdmi_pll_osc
> [    0.384416] clk: Unprepared unused clock: sys1_pll_osc
> [    0.385056] clk: Unprepared unused clock: earc_osc
> [    0.385652] clk: Unprepared unused clock: pcie_refclk_osc
> [    0.386323] clk: Unprepared unused clock: eth_pll_osc
> [    0.386961] clk: Unprepared unused clock: pcie_osc
> [    0.387548] clk: Unprepared unused clock: mclk_pll_osc
> [    0.388187] clk: Unprepared unused clock: usb_pll1_osc
> [    0.388826] clk: Unprepared unused clock: usb_pll0_osc
> [    0.389465] clk: Unprepared unused clock: tcon_pll_osc
> [    0.390105] clk: Unprepared unused clock: top_pll_osc
> [    0.390738] clk: Unprepared unused clock: aud_pll_osc
> [    0.391361] clk: Unprepared unused clock: ddr_pll_osc
> 
> I am not forcing any clock to be disabled; I am forcing all clocks to stay
> on and letting them be disabled if unused one by one.
> 
> Any guidance or hints on required platform clocks would be greatly
> appreciated.

I have an outstanding series that disables unused clocks via the
sync_state callback:

https://lore.kernel.org/linux-clk/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/

Be sure to not have clk_ignore_unused in your kernel command line.

I suggest comparing the list of which clocks are disabled with that
series against your list of clocks above.

Brian


