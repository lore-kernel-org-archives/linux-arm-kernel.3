Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCAAC88E5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYsEok5/6RpeOa0+UdPPhWNeU1Av3CpfKIsBFwLi6qQ=; b=TfkHi1d/LgFravAwBaHJosZefq
	bXG9BuekodaZDJyDRKKwUs7YRCjoDdw0WbrL1sv09OenEHDTp8ddED6Rf0bdSsrDl4V80D1PlT3KG
	fP3YTEFuqFBzokb8X5DfTPQ7moGQv5w967VKHeEwQRqDUgwbXBGjd05BlRshUoBawzcBxZXO9wPU6
	B9luXoBgzMh/a6Q96NPlyMjBykHwX9+onG57MlO73izKLrbGXrgXu5ObU9ovnfvBNH3vZXFZh1no0
	FRQIAtj0JdpxQ4L1pDzy+Pca/w5rh8lMwkX1IZ+eQwxk9YP1pebd2ysSjdUMT5o20t1nDdxY6GC4b
	i1SXVRrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Q0Q-0000000109A-15HI;
	Sat, 12 Sep 2026 15:51:06 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Q0M-0000000108T-3cwr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 15:51:04 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so1877175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 08:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789228260; x=1789833060; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WYsEok5/6RpeOa0+UdPPhWNeU1Av3CpfKIsBFwLi6qQ=;
        b=Ye8imBPF7KukpRyQUqshoKAZoBN/sTUc42/MPybMIV6km7fNrcvapPXRsBrk85l3KK
         2uFqnbm/zgxSXHPMElxUcVmIVf5FiAp7TrrerrG6AgEKJoGnLr1y+nj3inA11Tzr4TH7
         gC8Cmu7NkKhcn1SLg3nQ9dpaAoM46Z4z8mIEaohSic1qmU1XoXs9F/wrmyP5hZahPF4v
         xnZ4QNAYTyat8oIQ26tmHX5eMbhLEbdhkoM6moNsJgdOEiKHK8IGst5d5w+uEzZ2A26H
         SWBswE91cB10JszkWJr3Vgivj+CPUEtTUffWnOTc8sVgin38rS7nLsXSVx/MH3qacgE2
         SyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789228260; x=1789833060;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYsEok5/6RpeOa0+UdPPhWNeU1Av3CpfKIsBFwLi6qQ=;
        b=aAO4YTeLOYhm1josrA/J4dsoDPxZlLYHbNBd2ipIYyJKX2GcGU/oTkfaFqslp5E+IS
         HzoRE23BUpNUURW+4q79ykV1IOi1yeO5PCAGVqtMjZkl6EF6mc4sqYwdlS9pIUv5pYMJ
         0Q4MMlL89/+Zr9YIZ/fJKvmvDGBGUvtk1p6ikKHU38rntO5JkogkVrC06wS/3SbH7M/x
         S/TU/+l0URpVxkJN3A9sfdVwhhFi9gNEQ+Yfe+BpVkmFQpg94ex8QJunAlxi62l4j7Nv
         SaqQMSRnGsIYvCS0ZysHa0+CbJwoKoOWP8XFO0a2rIkd/Pd320GgZ7XdsMblrYgFfl2A
         3Ogg==
X-Forwarded-Encrypted: i=1; AKwUvBwpPUDj1eTzLwK+6+cNKD/cUr1X/PkWs26BLXwPf6zrf7BFss5iCUCoEfo0dxgP5ZeHMU6dgFnxImg8Ekg5grTP@lists.infradead.org
X-Gm-Message-State: AFuF++msUJFhHxuuA+5i2jBpj1OyW/M9iqKIKT8ThJadjIBgIPgb3Xe4
	bv3QCQv7Uisu4tGPy40efFmGMzyPCpI6eDkLn2f6F3y5PU6KDLN6mxZrUpDqFiozzr8=
X-Gm-Gg: AYBFou2LssTD0nBBxGjkOfvfBg+nlEsusqwQVD3uhR205o+xwXQ9x9p81sPAn4ezlWD
	ohZMrweBeF/1XH9lP9kFsZHVKycj3pbl/Bplt+fHBC9paTFFhT11yGBl9cFKFVYSykQwvY9WEJM
	iXCVgW+Xtv5mRrlHbK2zCKchaaXifC+h16Q15ibn0bIeUjpUDIDMjsQwcaj5cusvsc1gIMgymSd
	dNZPnqnrNaWkM0ANCETyU5HOCdVSBE6Mz4nTj7xdZyyu049e0W5EOD+8e9R58Bp+Sb4zPMNVfOl
	iHoC2pphLwEarSCrhuOED05R6OhroCyO3bU93v5mShA1FQcziycKlwcsDlBxUA2GwBB/dWKwODi
	Zaoa1WyNZGxx0/89Dx7BBQZzoSHqQN4YXprXu+DW5dj8ACY9C4olSzTh/f/AL0K/avQXKSPrKut
	2OPeWN4nfGU6WvUBGtSilxkcVmBav5RSMaxZMGqChZQUNMRdTzwrA3ecgQUrzLPgZHo8lCKJH+J
	cWh0tZ6t22Rt5KqbI6C1/IXf5ge
X-Received: by 2002:a05:600c:8b8b:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-49e6cbfeee9mr26096875e9.20.1789228260689;
        Sat, 12 Sep 2026 08:51:00 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e636f7fa2sm154001915e9.15.2026.09.12.08.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:51:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: tanure@linux.com, Brian Masney <bmasney@redhat.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as
 critical
In-Reply-To: <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-5-tanure@linux.com> <aqSX-kUvYaixESxe@redhat.com>
 <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
Date: Sat, 12 Sep 2026 17:50:55 +0200
Message-ID: <1jcxui79k0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_085102_927032_EE0ECB79 
X-CRM114-Status: GOOD (  24.70  )
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

On sam. 12 sept. 2026 at 08:50, Lucas Tanure <tanure@linux.com> wrote:

> On Sat, Sep 12, 2026 at 1:08=E2=80=AFAM Brian Masney <bmasney@redhat.com>=
 wrote:
>>
>> Hi Lucas,
>>
>> On Sat, Sep 05, 2026 at 04:32:34PM +0100, Lucas Tanure wrote:
>> > sys_ampipe_nand clocks the pipeline stage inserted in the bus path
>> > between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
>> > identifiable consumers - the three MMC controllers - so marking it
>> > critical was the wrong tool: the clock should be referenced from the
>> > consumer nodes and claimed by the mmc driver instead.
>> >
>> > Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
>> > sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
>> > have no single identifiable consumer.
>> >
>> > Assisted-by: Claude:claude-fable-5
>> > Signed-off-by: Lucas Tanure <tanure@linux.com>
>> > ---
>> > This patch depends on the MMC controllers actually referencing the clo=
ck:
>> > the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
>> > clock must land before this patch, otherwise the boot hangs and memory
>> > corruption this clock caused are reintroduced.
>>
>> This series should be merged together in one tree? Which tree? I can
>> provide an Acked-by if it should go through the mmc tree.
>>
>> Brian
>>
> It's definitely best to keep the series together in one tree to avoid
> boot regressions,
> but I think the clk tree is the better fit since the core changes
> revolve around clock logic.
> Could you accept it ?

No. This applies on top of another change already queued in the amlogic
clock tree. It can't go through the MMC tree at the moment.

This clock is not critical in mainline right now, so
1) I could merge this and it and in practice there would be no
   regression. The problem you had would still be there until the MMC
   change lands

2) Or you can wait for the MMC stuff to land and re-submit this in
   the next cycle.

Your choice. IMO, (1) is fine.

>
> thanks
> lucas

--=20
Jerome

