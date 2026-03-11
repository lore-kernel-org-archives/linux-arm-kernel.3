Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3C0103E2E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 21:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iG1sK9K8o9dl9Vde3v0efNWoYZtYHoBdU4iIKqn1yc8=; b=2YZVJQ791QW3qwEjVtVJsamUKG
	dW/gkAnwqAwxAnhz7pxeLfWHX74UwRjdx+FFq0MdSNCPnlfHvtf0bGDERQZ6I+LwqAxHz+2JkkqE8
	MaJMxJoCaJCEN+sOt5W2qFE2hvKp29kYaVgzffxfTuCJTLi5RXhB9hTM2PulPDD52PFrxAwmQ96cN
	nxaeNaibY/TfeA6gT4p4PimdIY+7M7SYT4GD4w9nOcJSIXM8LSE6yJ+y54fOd+FHx5GBVHYQpLdXO
	7at0YTnZuHelHexVZykH3/XU4DPaSrcadqXgu0CQ8cRaMPK8GPTaktBonCP/Q8SFC+C0SVi9aVx7y
	eUt11gjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0RRd-0000000CZWQ-1S1t;
	Wed, 11 Mar 2026 21:50:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0RRY-0000000CZTq-0q2h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 21:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773265814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iG1sK9K8o9dl9Vde3v0efNWoYZtYHoBdU4iIKqn1yc8=;
	b=Ft83guEsoXZ43bJO5UGbdUkydmGt9QIQyhdpHASbte0qal5xycJGcNqqy/0ZjEG3rDUm0W
	32OTzr7zfP/I+DR/LxbU+tt6JuQuVPhSWSd/5uHLS6xRSmvibK7fYNrEa/OH8782Mb/Ftj
	e3V4V6cLjuolVKVtbinHeEFYSbtj1Sk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-5yAsLEAPNT2e20MEQN-nog-1; Wed, 11 Mar 2026 17:50:12 -0400
X-MC-Unique: 5yAsLEAPNT2e20MEQN-nog-1
X-Mimecast-MFC-AGG-ID: 5yAsLEAPNT2e20MEQN-nog_1773265812
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd98d96382so52575285a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 14:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773265812; x=1773870612;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iG1sK9K8o9dl9Vde3v0efNWoYZtYHoBdU4iIKqn1yc8=;
        b=dRZxQxXk/cIg/q6CfGvStg+z+qj86+vpLOkkAtctLslsAq7LuDvNfVNejeH2Rzsa3w
         mzESzm5d8/skvwBn4DCbA0znBfcBnAYkDSPzOq27f7QC815Ww7pO1XOTBvxxhojFqNY0
         nziIyBfLikTvlwyat4VdNC18RtmD+yUha8ZQrbhEgp46nLe0PaN8YY3KtoSSWXxtnPBg
         ucXXNCJI0uWYq42ayTDkDlvmh+FS0lUvlH3ozXlR2e3d0kX12A4IZfPGJD38MsNN1WHX
         wCK1qb8Bs1ZsP4gGGzF3437jlbwQWkvp8pRTSXfUxKTMfBb9+3dzZtuRqbVvf6VY4Zec
         csXg==
X-Forwarded-Encrypted: i=1; AJvYcCXypDuj3/YBWcrSpYU6Qo2PzkGbvagQzYgR3ufmkhdqbGGpzfpl1VLqtlgdgWqi6wV85Xs9C7XYRuAYak4LuN1e@lists.infradead.org
X-Gm-Message-State: AOJu0YwkkQXuHysYFSnrecMzfvkve0dequjdo8N4L94H3a8AGXxgR+xg
	SGYmv/7zQXnkXIKLhM0/ScXrqf+/H/WwQRoTDEJxRpFoBxqLIOtbwpjLfc6hsKjN/2mwc9Fyn8r
	QQx1I5lHV8Gvynysj3g2D7cH26wSH+D3Q11atbhpVlwdMkGv6dD1D3RvflznheuUjN61LoJrhi7
	MI
X-Gm-Gg: ATEYQzzwYy6x1Zos/jSFqXr4Xw7q/IQAKPuvOsc9FAyvV/NBz5RpU4NFEe6YvYNqL3n
	Ivexw+4/hR+sR9iPOxsCSy3r3WCvmqgPomMHUSt8esAV7AYUWhIEOM8WSW8XpLbMYVqvf/BIGts
	6zpCYn/ubN62RxsOUX0HAFv4S7aMReXjYnDdwrAnpr27Ufs2bj4XdA8j2Ymb0f5+yZd96mW6aQ6
	RyVBXMLRtk2btnw8plKKhWrFG98V6yILndqbyYS9T90TNXFC8Jp2Ffv0+H3VQ1tI211S4tHZLDm
	k0WqtbTlInLoyOcwupk3t8acOk2l9yMdzHdpA9XhvpJdn1NXuP1XA8FMx62WAt5LErKX9YMt9SP
	8X6XMoG1G7i+/+sJ5vUw=
X-Received: by 2002:a05:620a:44d1:b0:8cd:a071:9aae with SMTP id af79cd13be357-8cda1a8a3b2mr581380985a.78.1773265812366;
        Wed, 11 Mar 2026 14:50:12 -0700 (PDT)
X-Received: by 2002:a05:620a:44d1:b0:8cd:a071:9aae with SMTP id af79cd13be357-8cda1a8a3b2mr581376885a.78.1773265811916;
        Wed, 11 Mar 2026 14:50:11 -0700 (PDT)
Received: from redhat.com ([2600:382:7708:94f:6bbc:89e9:5b48:3a11])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1eab31dsm211687585a.0.2026.03.11.14.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 14:50:11 -0700 (PDT)
Date: Wed, 11 Mar 2026 17:50:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v8 4/6] clk: Add KUnit tests for assigned-clock-sscs
Message-ID: <abHjkMXPK0fXcdrO@redhat.com>
References: <20260302-clk-ssc-v7-1-v8-0-2356443a7e4c@nxp.com>
 <20260302-clk-ssc-v7-1-v8-4-2356443a7e4c@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20260302-clk-ssc-v7-1-v8-4-2356443a7e4c@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ccmHPdkL2rFJzM_SmccASuhites3OAGSCW5qEX3JbGw_1773265812
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_145016_306961_76DEC955 
X-CRM114-Status: GOOD (  13.57  )
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

Hi Peng,

On Mon, Mar 02, 2026 at 11:01:18PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Spread spectrum configuration is part of clock frequency settings,
> and its behavior can be validated similarly to assigned clock rates.
> 
> Extend the existing KUnit tests for assigned-clock-rates to cover
> assigned-clock-sscs by reusing the test framework. Add new test
> device trees:
>   - kunit_clk_assigned_sscs_null.dtso
>   - kunit_clk_assigned_sscs_null_consumer.dtso
>   - kunit_clk_assigned_sscs_without.dtso
>   - kunit_clk_assigned_sscs_without_consumer.dtso
>   - kunit_clk_assigned_sscs_zero.dtso
>   - kunit_clk_assigned_sscs_zero_consumer.dtso
> 
> These tests cover various invalid configurations of assigned-clock-sscs,
> ensuring robustness and consistent error handling, similar to the coverage
> provided for assigned-clock-rates.
> 
> Co-developed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Reviewed-by: Sebin Francis <sebin.francis@ti.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

I'm collecting up patches for Stephen for a git pull. I wanted to
include this series, however I see that the clk kunit tests fail.

[17:34:44] ================= clk_assigned_sscs_skips  =================
[17:34:44] [FAILED] provider missing assigned-clocks
[17:34:44] # clk_assigned_sscs_skips: ASSERTION FAILED at drivers/clk/clk_test.c:3218
[17:34:44] Expected 0 == of_clk_set_defaults(consumer, false), but
[17:34:44]     of_clk_set_defaults(consumer, false) == -2 (0xfffffffffffffffe)
[17:34:44] [FAILED] consumer missing assigned-clocks
[17:34:44] [PASSED] provider assigned-clock-sscs of zero
[17:34:44] [PASSED] consumer assigned-clock-sscs of zero
[17:34:44] # clk_assigned_sscs_skips: ASSERTION FAILED at drivers/clk/clk_test.c:3194
[17:34:44] Expected 0 == of_clk_add_hw_provider_kunit(test, np, of_clk_hw_simple_get, &ctx->clk0.hw), but
[17:34:44]     of_clk_add_hw_provider_kunit(test, np, of_clk_hw_simple_get, &ctx->clk0.hw) == -2 (0xfffffffffffffffe)
[17:34:44] [FAILED] provider assigned-clocks null phandle
[17:34:44] # clk_assigned_sscs_skips: ASSERTION FAILED at drivers/clk/clk_test.c:3218
[17:34:44] Expected 0 == of_clk_set_defaults(consumer, false), but
[17:34:44]     of_clk_set_defaults(consumer, false) == -2 (0xfffffffffffffffe)
[17:34:44] [FAILED] provider assigned-clocks null phandle
[17:34:44] # clk_assigned_sscs_skips: ASSERTION FAILED at drivers/clk/clk_test.c:3194
[17:34:44] Expected 0 == of_clk_add_hw_provider_kunit(test, np, of_clk_hw_simple_get, &ctx->clk0.hw), but
[17:34:44]     of_clk_add_hw_provider_kunit(test, np, of_clk_hw_simple_get, &ctx->clk0.hw) == -2 (0xfffffffffffffffe)
[17:34:44] # clk_assigned_sscs_skips: pass:2 fail:4 skip:0 total:6
[17:34:44] ============= [FAILED] clk_assigned_sscs_skips =============
[17:34:44]     # module: clk_test
[17:34:44] # clk_assigned_rates: pass:3 fail:1 skip:0 total:4
[17:34:44] # Totals: pass:16 fail:4 skip:0 total:20
[17:34:44] =============== [FAILED] clk_assigned_rates ================

Can you look into this? I didn't look in detail, but should the tests be
updated to expect -ENOENT in some cases, such as 'consumer missing
assigned-clocks'?

Brian


