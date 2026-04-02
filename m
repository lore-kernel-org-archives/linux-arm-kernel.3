Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F7F1112274
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 02:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYGP2hISTZIOwm7KcS+DDptEEs44HrRNLaMy7aCvf7A=; b=DMFgf8w20YneXOrVxfVBnhWkDt
	UnTjGwevAerYS+btYbhUsszOgkkvo+2nwL4mdlf7vxhrOU4qXfa0k7QEhNXcNSZBcbcTNPwN1x/ps
	FNWNeQEjHiceHMIQm/LysTKzLez3b96AIfKVRkSLFjWTPtbQisdhFC9Z2jB1/4W8SgkdXhekJi31J
	h1B/ww51POarf6ziE6yyv8x70zn6DgYrgh9n6z4LC6wwUDZtPBFOZfOXdxIxdnFeU5t/aFj80ttkl
	ccVAM47dhkUPunMlMHPOo14oZoHRqb1yEH0Ig8evV/+6/x+9Nwdq/nSHkER6/96aLjkj4vGcT/xjh
	taWJvEjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87et-0000000Gaxz-035B;
	Thu, 02 Apr 2026 02:19:47 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87ep-0000000Gaxb-1T4w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 02:19:45 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so335921f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 19:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775096380; x=1775701180; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYGP2hISTZIOwm7KcS+DDptEEs44HrRNLaMy7aCvf7A=;
        b=NmoU4q+ejw4FN8mCnDW5O5nzlp9PiR/iEXiPJa48o1OunBHMiI7IdB9/18SceFYw/7
         RVSSYb93vpJAIqEz2E5tc0BpPqXTAyhTqatUZpgZryc6p1d3N24oaHr6J1CCzKfLXasl
         Fw+xbhgZuqHxlRb3LLjUJgh/B4Se0GHTv4gou3mtrBbt+uKJkgC433RQq07YH7v2yiqi
         IhTMNjUWifuTSZmIx2GVMEpEJEfxryKkIrR1XRrTqBAhJANwDfvHxtqzQbM+4A5FuAmM
         wtRvjBskA+qm6opfkQUc8CHiArMJTcpa4KoPj91l8j41JsFZaPs6gXvJzJE511K4Zbel
         rRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096380; x=1775701180;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYGP2hISTZIOwm7KcS+DDptEEs44HrRNLaMy7aCvf7A=;
        b=esHOQX1qkC6d93XeNaoEwmk+AUTFEKCUTPKg63R5WjjrPvxNdse9KCQdfbC12qIBjh
         dhJArmA4nSqZWrUCkzr7jnEE/QSIj8U63LvpxwFKZeOwxKSsqBdsYH0wP9dUpI2MCeyz
         V8H5EDLBVM3MBY1x9aXzkCVw7JLH/lklE47yJtsz6LFTLp1TWD5v8FPz5g+4/ijBlnv5
         WySGsuAh/GfmiKwrKRw/bAef3vGGKh0L/ZfZ8XHeht5Q9btEvJ+lvK2PoBvB7jE7YufI
         URIo8Rc9N3F9WZaI5mDfCnj4C0RrQB5mdaqFKWGxdHbmhg9X/ss71W36RDQT0XH7gd3/
         61Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXEZ/kChwU8hnpFDVIaBwt0DJAQ1HcB3fkQBj6NBG8feJe4RJIg2p+H0KUqjVnTmPdPB0s9b2uC7m8CJ0P4jntR@lists.infradead.org
X-Gm-Message-State: AOJu0YyaDDiTG79Vs8vlNj1BdNOhI2tp4e4tBhQkzVaiLobLgvTd4k3m
	t0GCvZzhJSexSIFGEFuSPt4JZM/PjJs5noSRsFghgac8dOinFQVEs3+++TbFyAD/LfBzDNHR963
	rT8kjIYk=
X-Gm-Gg: ATEYQzxFmb5VzfbVRwY1TpltrrQcSKVGnFWCxr85oxWA2Kg6e801qkoPf6+8yk8+IE+
	cl9Xh+7vQIKG0DcyZVovbqIOjEJzXbDl22hYhvMo/z25FXG80qX0RN9HCtLH7fFehAugpR3IudA
	tA3UEJSutoC6vTDwkdRkYgqh4qnNd6WFHneQ4EyfVy+psIaz/bGHPlP5yKh/yyfyXOXhvVy6qSh
	uO5WLeni0x+9pyGS+IevHz3OvniTCmpyMCF3s5Cp51CIy7xTwOcw1gQxbXEvY4rsqmMSUMPRPn9
	Lo2ltGPP/PSj39RDdc8PI3lF2oPywXfa2vygT6DY4P7RvG4k+uPDFHhxjz0dKTtGtA9qTOlgUpN
	AJvQBrk+ewEx7LbDqo1fv5cqUXTVrXjvoGpROk+c5pXsCT0wrCobrPbI30JJzDiMJKv+A415lvT
	3VRoKFLp+Qv4DTN08DExtF34f4h5y7+nPfo9sV26tdNkIUEI0ITTmRygCGIMnK0CJizQJFa2GHM
	n8VBjjoy5D+OQ==
X-Received: by 2002:a05:6000:2303:b0:439:beb9:5a96 with SMTP id ffacd0b85a97d-43d150e8ba7mr11084985f8f.31.1775096380493;
        Wed, 01 Apr 2026 19:19:40 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm3815604f8f.12.2026.04.01.19.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 19:19:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 03:19:37 +0100
Message-Id: <DHIB5E66SP7A.110YA5R1OOQHS@linaro.org>
Cc: "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi"
 <cw00.choi@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sam
 Protsenko" <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/5] Exynos850 APM-to-AP mailbox support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
 <20260321-beautiful-garnet-magpie-de4fbd@quoll>
In-Reply-To: <20260321-beautiful-garnet-magpie-de4fbd@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_191943_473572_08AFC205 
X-CRM114-Status: GOOD (  14.53  )
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

On Sat Mar 21, 2026 at 10:44 AM GMT, Krzysztof Kozlowski wrote:
> On Fri, Mar 20, 2026 at 09:15:12PM +0000, Alexey Klimov wrote:
>> Hi all,
>>=20
>> This patch series introduces support for the APM-to-AP mailbox on the=20
>> Exynos850 SoC. This mailbox is required for communicating with the APM=
=20
>> co-processor using ACPM.
>>=20
>> The Exynos850 mailbox operates similarly to the existing gs101=20
>> implementation, but the register offsets and IRQ mask bits differ.=20
>> This series abstracts these differences into platform-specific data=20
>> structures matched via the device tree.
>>=20
>> Also, it requires APM-to-AP mailbox clock in CMU_APM block.
>>=20
>> In theory this can be split into two series with correct dependecies:
>> device tree node requires clock changes to be merged. The suggestion
>> is to let this go through Samsung SoC tree with corresponding acks
>> if it is okay.
>
> I don't understand why this cannot be split into two seris
> *practically*. What is exactly the dependency between mailbox and DTS,
> that it had to be combined here?

Do you suggest to send 3 single patches with proper dependencies
description? DT bindings change first, then mailbox change that specificall=
y
depends on dt-bindings change and then dts update (which will depend on bot=
h)?

I thought that mbox driver change depends implicitly on bindings update?

Best regards,
Alexey

