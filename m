Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED56606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 00:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K5gJs/gt;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=hV1UNJnX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LTWlkC3bqSlTG2YkDHxmrbiZeaSggK5ojxGD1nHsNsI=; b=K5gJs/gtpw6vdu
	fWJb3oUO91ybEZJSa0sQtY7dwupwnHXo7DH5/rX+FQ8eXjYdCEQMkVhhKHkcYrKI+AUgo+E2Xdl36
	pDwRXQHrmXlQG1x01Zb2m2xbR+c2UOJDtAmnB0ORIAEbvgZ2FJTZU1RRLFCjXVIxiCmOJmR9vPz6M
	KpgzI1hxF6/4eGBRU9VrHc0HD340StlbRTpVLhBdayp/sX1e1mGiI+0LZlZZ2gXOQqiiRmOXD8Mlg
	0r//TX/rrK8cqj0s5JV2p2ASyJUNHALR/A30YyKSlHIOVWh0yTXcc2BkxgDeBKiK/Dj5eJIJpPo+X
	+6dymE9fYr5S4VpGQaSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLVV3-00000003ZGn-27hX;
	Tue, 27 Oct 2026 00:57:13 +0000
Received: from mail-m822136198.xmail.ntesmail.com ([8.221.36.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLVUz-00000003ZFS-3sQy;
	Tue, 27 Oct 2026 00:57:12 +0000
Received: from [172.16.12.93] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 526eb68c8;
	Tue, 27 Oct 2026 08:57:04 +0800 (GMT+08:00)
Message-ID: <9f8114fc-c4bd-4f50-8c5a-a8afc94249b8@rock-chips.com>
Date: Tue, 27 Oct 2026 08:57:02 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] clk: rockchip: Add RK3572 clock and reset support
To: Cunhao Lu <1579567540@qq.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>
References: <20261026-add-board-ok3572-c-clk-v3-0-dbabfa39d692@qq.com>
 <20261026-add-board-ok3572-c-clk-v3-3-dbabfa39d692@qq.com>
 <0d5de6fd-3150-4898-a652-7f5b64dcaf07@rock-chips.com>
 <tencent_6876096D2306016F88487E0E4D78345B3208@qq.com>
From: =?UTF-8?B?5byg5pm0?= <zhangqing@rock-chips.com>
In-Reply-To: <tencent_6876096D2306016F88487E0E4D78345B3208@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17adc5aa409d2kunmf1cad9ec130d7c4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ0JJVkhLTU1JSB8dQ05LHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=hV1UNJnX6QxnjUOiSLVmQD2uma3cke/feZxFVH5S4idvDB+vzdGr/E9wgn464etOHYT4aZjOe+e90+ba5lq8wnXpsEnx+r0uShc0/GkpQM+Mdf57U1BSBg7TzTBAjAc4coCZPgYikVjqHNbeHLnvM30slTEgbXfdnZ7gyX4ZygI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=LTWlkC3bqSlTG2YkDHxmrbiZeaSggK5ojxGD1nHsNsI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_175710_946025_EA1024E9 
X-CRM114-Status: GOOD (  19.83  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


在 2026/10/26 22:56, Cunhao Lu 写道:
> Hi zhangqing,
>
>> This is in clk.h, please submit it separately.
> Thanks for the review. I will move COMPOSITE_MUXTBL to clk.h and add it
> in a separate preparatory patch.
>
>> This is incorrect here; there should be no negative values. Two's
>> complement is used here, so a conversion is needed. For example,
>> -12955 should be 52581.
>>
>> In clk-pll.c, cur.k & BIT(15) is used to determine the two's complement
>> conversion.
> I agree that the hardware expects a 16-bit two's complement encoding:
> -12955 is encoded as 0xcd65, which is 52581 when read as unsigned. The
> difference here is how that coefficient is represented in the rate
> table on the kernel version this series targets.
>
> I found the cur.k & BIT(15) branch in Rockchip's downstream develop-6.12
> tree. There, k is unsigned int, so the driver explicitly checks bit 15
> and subtracts the magnitude of a negative fractional coefficient.
>
> This series uses the upstream implementation. Both v2 and v3 are based
> on a804c5742bff, which already contains commit
> 581478883477 ("clk: rockchip: Fractional PLL coefficient on RK3588/RK3576
> is two's complement"). That commit changed the k member of
> struct rockchip_pll_rate_table to:
>
>          s16 k; /* fractional part, 16 bit two's complement */
>
> On this base, rockchip_rk3588_pll_recalc_rate() uses signed arithmetic:
>
>          s64 frac_rate64 = (s64)prate * cur.k;
>          postdiv = cur.p * 65536;
>          rate64 += div_s64(frac_rate64, postdiv);
>
> The signed type represents the negative coefficient directly, so this
> implementation does not need a separate cur.k & BIT(15) branch. For
> example, the mainline RK3576 rate table already contains:
>
>          RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
>          RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
>
> These are exactly the same entries as in this RK3572 patch, including
> p, m and s. Mainline RK3588 uses the same entries as well. Since RK3572
> uses this shared upstream PLL implementation, I will follow the
> mainline RK3576 convention for its rate table.
>
> Writing 52581 directly into an s16 initializer would require an
> out-of-range implicit conversion; a reduced compiler test reproduces
> Clang's constant-conversion diagnostic. An explicit cast such as
> (s16)52581 would produce the same signed coefficient, but would add a
> conversion that the existing mainline tables avoid. Using -12955
> directly makes the value used in the rate calculation clear and stays
> consistent with RK3576.
>
> The register encoding is preserved: the write path passes k through
> HIWORD_UPDATE() with a 0xffff mask, so -12955 still writes 0xcd65 into
> the coefficient field. The five initializer changes from v2 to v3 only
> make the signed values explicit; they do not change p, m, s or the
> 16-bit coefficient encodings. In particular, no further adjustment of
> m is needed for these representation changes.
>
> I will therefore retain the signed coefficients, following mainline
> RK3576.
OK
>
> Best regards,
> Cunhao

