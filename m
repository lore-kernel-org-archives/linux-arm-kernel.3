Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE62F46C4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 15:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5Zet8J4rK0+1tdnDTvli0Ek2YpzZgM64BeAXaz+iIs=; b=2clZ0v8V3g7ecKKztZvHKuQG9X
	SGCi13MMQzKIP7GWY/FAGnVC8pZgo7gSbsU0hAjKVXXOpKC12oZzb0OOVhVdhzKhdV58N7vZYj3GB
	dWhWrVVSXC+nlej5tt836ePO/pJG/iDrsAmJlBZc9NHVQRbpHx5T8DY62m4KPZjptcgNEhPPz1Uwl
	NvtK10Zne+5Q1u32ZztdfNuudqpDCvunF6CLwE8n1rYJS114esSoBmHTX1jaQhvdMqri4eRyhhUM4
	41/WQdTW3zqlCcFLgG74fWvVPgEkijIFiQT3ICxdKEwrXG4BqD46FSjnIoufbIiOheDaq2o2o28vP
	cNWb7QLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9m2E-00000005HRk-2s38;
	Mon, 06 Apr 2026 15:38:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9m2A-00000005HRO-3xNG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 15:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775489916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v5Zet8J4rK0+1tdnDTvli0Ek2YpzZgM64BeAXaz+iIs=;
	b=dnbUW/Gt3IHjVg6AYgPxBgVo5qlZFj+7s100QYzMybbowcMMj8QY4dpImSh4T3hO0n7uAG
	Ul7Yio6Aafh3RyBCwCxT8nbY/k+Mcbi9Zxz6efjPFz4nWxdyQRabkslotQ06uHroAvJiOT
	bgcD9EXj7oBX/riIrVMuh8WzHlrbPpQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-tsdN7AEQPQe2iqkQCidxHQ-1; Mon, 06 Apr 2026 11:38:34 -0400
X-MC-Unique: tsdN7AEQPQe2iqkQCidxHQ-1
X-Mimecast-MFC-AGG-ID: tsdN7AEQPQe2iqkQCidxHQ_1775489914
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfc8e7f987so1033981485a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 08:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775489914; x=1776094714;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5Zet8J4rK0+1tdnDTvli0Ek2YpzZgM64BeAXaz+iIs=;
        b=Fz1bK4vjEEdslh8W+JaMwbPdun+QeNl7IiaQNfDJM33fSjiicM9dL0gEqcQMAt7o52
         9mI5RNFSmRO8mviuQgFYStqdMnE26FO8QLLJD9DusHrtcAIeUUprwJ4GxTvlqJbewPTB
         oEBkm21365e3TtNcpZv1qrVERJgClCfVLNtIOjWxOI18tgqVPI3DGbDvkoMBujGyPUjA
         eVxvDNaP4IvD4Fk3mlK4MRycfdug4ruy+bJOfUjCbnusW7oMDXwQSlsSjDv2rzIn6bjJ
         mRauUDsjxei2VH/t3Jjj2RxB60dUEkA7qEkwxpRz2xInAmWC/WRFZ6DmRgqgAMrNUSZz
         yjCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXysN9BMZ1/6HCggQhvm2W6tPmnH8VB/xduV0BDr3RHF/hiJc9Aid7zQkQNrjqTpS+23AC8s4T9JeBSrxF39Tia@lists.infradead.org
X-Gm-Message-State: AOJu0YyxrbBazMKwQeDMMvO6ll5CL9oGRB0ju7jybtxdSIR27lujBsIf
	KsXjc9GKHFJpA6ujMdl7bW795YAKGcUVxmRgh4PTYuH030BV8e472aSeCPIKO3s/PSvRvpc9uVG
	KNjklC08CXMT0cTHVKAfSmeYblWoGJA4ufFSIvO+5sYB04xOrHjoZ3DYFqp8tU4WG2R3O0yWjcm
	+1
X-Gm-Gg: AeBDiesgoDeaWV9xZTmqWrUNLAFDsYH3oMbk/oLdT+bJsB3+xnaGJJYgG9wlwJ1/9HB
	m5UJjwccHqanXLVRnHv7sL2FtnbFygVP2H+hSFBSlC6SXGOQNbeYFkxdQyjiC9Z3zLjEKeP/8KU
	DULeU/KyOg/TYQQicoe0KEaHtVofRJeCiSQoqB/6GH4L6BUNBo5+AwrENkByceCt+a5JA3ZpSl2
	hvsaNGb+AolIjnv/gd53BGZ9Md7vHoNBXB0gkgNxi8qxGrqUWKF+A0g29mYDSmNpfL3liqeS3A0
	FK3i7E+oGkey4+picnU8p+lUyJCd233WXTTq8smwvrPhCEVhC6VwbK+gnyvXPS1zfIeyd0Qm9sp
	DnccEog7LBV/4ec/BQEK9/MKq2ArPEdip1rVkpuLbgJEbSavnJNNOPKd+
X-Received: by 2002:a05:620a:4490:b0:8cf:d510:3b5f with SMTP id af79cd13be357-8d41c8a82a0mr1883134885a.31.1775489913889;
        Mon, 06 Apr 2026 08:38:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4490:b0:8cf:d510:3b5f with SMTP id af79cd13be357-8d41c8a82a0mr1883128785a.31.1775489913310;
        Mon, 06 Apr 2026 08:38:33 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a5393a07sm1099166585a.4.2026.04.06.08.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 08:38:32 -0700 (PDT)
Date: Mon, 6 Apr 2026 11:38:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 0/2] clk: scmi: =?utf-8?Q?D?=
 =?utf-8?Q?T_support_for_SCMI_clock_rate_rounding_modes_=28per=E2=80=91clo?=
 =?utf-8?Q?ck?= policy)
Message-ID: <adPTdg4RJpkjc4Cg@redhat.com>
References: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WITy9ACwGscrDDie6vbOrG9jh9pfsSdF2uqPYxnIa3w_1775489914
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_083839_201184_6DA91B26 
X-CRM114-Status: GOOD (  20.64  )
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

On Fri, Mar 06, 2026 at 02:20:11PM +0800, Peng Fan (OSS) wrote:
> The ARM SCMI specification (DEN0056E) defines rounding‑mode flags for the
> CLOCK_RATE_SET command, allowing a client to request that the firmware
> round a requested clock rate down, up, or autonomously choose the
> closest achievable rate.
> This series introduces DT support in the SCMI clock provider to carry a
> per‑clock rounding policy from the device tree into the SCMI protocol.
> 
> Patch 1 adds dt‑bindings constants for rounding modes:
> ROUND_DOWN, ROUND_UP, ROUND_AUTO.
> 
> Patch 2 extends the SCMI clock provider to optionally support
> "#clock-cells = <2>", where the second cell encodes the rounding mode.
> The first consumer that references a given clock latches the per‑clock
> policy. Subsequent consumers of the same clock must specify the same
> mode; otherwise, the request is rejected to avoid non‑deterministic
> behavior. The selected mode is passed through to the SCMI Clock protocol
> and mapped to the corresponding CLOCK_SET_* flag.
> 
> Patch 2 includes changes to drivers/clk/clk-scmi.c and drivers/firmware
> arm_scmi/clock.c, it is hard to separate the changes without breaking,
> so I put the changes in one patch.
> 
> This design adopts a per‑clock policy model, not per‑consumer. The rounding
> mode is applied by the provider per clock (index).
> All consumers of the same clock must agree on the rounding mode.
> Conflicting per‑consumer requests for the same clock are invalid and
> are rejected during phandle translation.
> 
> This avoids silent clobbering and preserves deterministic behavior.
> 
> Existing device trees using #clock-cells = <1> continue to work and
> default to ROUND_DOWN, exactly as before.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

My high level feedback about this:

1) Since you are making changes to the DT schema for the clock-cells,
   does the SCMI DT schema document also need to be updated to allow
   clock-cells to be 1 or 2?

2) For the ROUND_XXX constants, I would prefix them with something
   since the existing ROUND names are fairly generic sounding. Maybe
   CLK_SCMI_?

Brian


