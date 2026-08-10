Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1735BC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 21:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qy1gE2gFEXUChO7E1GpI7tnTvfBOQiRyPrmqiAECFfg=; b=ODEGcXUhMu3bSNyhoJrH2AL7p1
	HnQLKJqHPPftu+Ur7YlRRkrZlFY5bldAkzUNNkyZJO+1eRCtOtrpbkBmeVlI4ID9q1zKVL5xyfgid
	OPfNUfuv/Cnqgg9vgKbR/pd6gTtV5TF5h9srOqJfVSbjd0HLeBMd2A6rpQKx/6pLh8JweXGabiL/g
	BBr3GbZK6eyR3FL5IffrQ2Ltv/7pp4GCEJ1abKOyXIl67IentptANcFF8bDZrWNmXuZfYDw2wIc9p
	+v2tXtEbnHgN78ajK3+j1Ua7/czu8HzSbyeMOv7sUpwf0rNvo2A39krCMuNUW7Gxso130JMaZleNg
	KcGLRBJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtY0u-0000000CwEC-2Z4X;
	Mon, 10 Aug 2026 21:58:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtY0r-0000000CwDb-2Q6T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 21:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786399108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qy1gE2gFEXUChO7E1GpI7tnTvfBOQiRyPrmqiAECFfg=;
	b=YXUQwg0bs5QLmvMo5zdCYW6Nu02R15XUrzUxH8sHAr/OpMdd2Len0r9DUIF0lP3jBqLA/g
	puz5s80WQxEd/v+YqTA7uS3ugOR14sy9vWJ7ktn1/PqtSOAySZm5VbsDSPktzYvV/jjOlG
	nSGzbHClc3/5OYhGMUiaou9IXyXfFOk=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-zwM-p6RgNkClPwhkKvCpMw-1; Mon, 10 Aug 2026 17:58:23 -0400
X-MC-Unique: zwM-p6RgNkClPwhkKvCpMw-1
X-Mimecast-MFC-AGG-ID: zwM-p6RgNkClPwhkKvCpMw_1786399103
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66898a9bc85so4197638d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786399103; x=1787003903;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qy1gE2gFEXUChO7E1GpI7tnTvfBOQiRyPrmqiAECFfg=;
        b=Ryj8RzNgd5QAE0jqmt6BNQuRck1BviiSk3a6q99k/cDYsDEC9VN7w/3GgXPlERWAXg
         aX6ai+aF0W+s5axCu4qhEoQ19IxaYjIttaBVsvj7twSwBqypyGbVicrztJitCPZ3fC3z
         3cihv2epXy+w9oXxNP5SLncV71IbeJ8xIPOTnUmlqNF9vzWx3ffYymDsG7i3zCJDRVqe
         E8TmXMTeQfLLpKJpt5Wx38BYglZEl7vztm4939flY9l8Q96jqASOtuy9iqcTymsyHK9K
         XIHzx5Bq4MsNY6tAa4yJSECKwlRZ4ZaWVVmKo56o2i+TZfmxMmvBCBHuOY0fZFNz0arL
         zfbA==
X-Forwarded-Encrypted: i=1; AHgh+RrNUywkeTOMJP5AxWzUhu9hF8hlWQJr6tA3cZJaDj1AlYF0oOtOd+nr3lJpYPVi8cWt6V0wBM+jZjT6Ce4NGORl@lists.infradead.org
X-Gm-Message-State: AOJu0YymfFgZVFHbz95YiRHRiPPIsEdNfk609h4JLeeJTeogWEzigaRu
	MV1zIBNTTOVnZi1qZ0uyaATsZKekAeiWPh7S6zGCevqDbGeLRLXX1yivR+MC91R91PxXJewhMOo
	Wn6QsKPmHU4MHcHJ7kB8m1ZYNmMTsyD5CNObJ30bsGnLP0yKpmVzRO7F0Ds3u8lL9KABaclwOfR
	fH
X-Gm-Gg: AR+sD12OG2uNP8BBrePMXridRzUHSY/fh+tGLpE6FwbxmUwRK869QVoFxzY5ynXUmdw
	7koGoZgMoQpbC+5vND+lunkwgyLNFD7rU1fQPCE8YI9tuVsuNO9ksKCAyC4dBQpGnJIdvcgLclU
	fFDCeU3QV35vSmrrXn60+z+BSFL5ivW4e10/TFxdV/JY1jUG4pVoWV6P7tC2zyJzpi0bSAxe5FX
	9MgO/xzq489bjT+8Qv+rmRY1rY5iK/277I42CuH56nif3emtTXBu7jDu9YEQZMUCFZkKNx2NllM
	RQVD4doSrUoo88g3ECSj2bqblW1zDkhXixsyc0cNyWoVC6A4/tBKXUL1WJcJVUOZd3EhELaYTmk
	4G88DbyLrN0j9YYvzo5yNAiNK9SguFtEV8ic=
X-Received: by 2002:a53:a48e:0:b0:669:113d:7183 with SMTP id 956f58d0204a3-66ac3016a1amr14341638d50.40.1786399102954;
        Mon, 10 Aug 2026 14:58:22 -0700 (PDT)
X-Received: by 2002:a53:a48e:0:b0:669:113d:7183 with SMTP id 956f58d0204a3-66ac3016a1amr14341602d50.40.1786399102538;
        Mon, 10 Aug 2026 14:58:22 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acae8584bsm7562472d50.10.2026.08.10.14.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:58:21 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:58:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v10 08/12] clk: zte: Introduce a driver for zx297520v3
 top clocks
Message-ID: <anpJe3-voStp-5Pw@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-8-63846490712c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260810-zx29clk-v10-8-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A8mjixTTkj-3497prKettrTERsWsYnUQYZ56K1KXSns_1786399103
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_145829_680588_0F7AB76B 
X-CRM114-Status: GOOD (  13.72  )
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

On Mon, Aug 10, 2026 at 12:28:27AM +0300, Stefan Dösinger wrote:
> This register space controls core devices: PLLs, the AHB bus, a lot of
> timers, the USB controller, the Cortex M0 processor that boots the board
> and a few other devices. For some reason the LTE coprocessor is also
> partially controlled by it. The main application processor and DDR
> memory are not found here though.
> 
> The register to reboot the board is found here, as well as a register to
> control whether watchdog expiries cause a board reset.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


