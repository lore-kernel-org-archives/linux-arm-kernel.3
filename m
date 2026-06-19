Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEADCDB466
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 08:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3WNaVa6u6+Nzfb3NV3ypwCQ74H2NIZsFLsn4sFU7yo=; b=B/yxSKRGykdwL0fIkZ8iMQthgS
	geB13mS0UHA6Dk+v0hUPcKUKDof4gFB4XAQCFBB22xbwpS4xhkAB+U6Hn1pM8OQZWEdc0/HLfr1kb
	bEO1alwU8dW4bCI4jJqpxC4osaq+97h/QgiGL8pSI1CrDZr4wfYN66fZM3FzsyIDCCsv3Q8Ll2LW/
	+EQs3i4c0iCUZPWXeLsovKFFOWifbJSf78a88PgyxjmzzUu+uqx9r1eCThikf/Y6MMi84t+hHQvGY
	XlixpnLIaA/j0Y46L+DK6dHQ5/c2PsZ9tc19oMTb0mBBl1FYGfb4jvJGeGgiyNeQneRqFqvcQtKP2
	HbiVY5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waUHf-0000000295K-1r26;
	Fri, 19 Jun 2026 08:09:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waUHd-0000000294e-08kb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 08:09:02 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-46066e640easo1112258f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 01:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781856539; x=1782461339; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I3WNaVa6u6+Nzfb3NV3ypwCQ74H2NIZsFLsn4sFU7yo=;
        b=jv6YVJc4dbr3ewR79vhPJ47FP4vTPNW6Kg31Q8I0p+o1DtiBYBFNR89dK/cZhNTvtB
         mHz0WjPV21CCXwIxtzNko96p9NdQPm1HOatIFbiOu4e7OB1/tXD0Vq+mc1AbCdaISTuK
         aqhQtOQ12T8LBesr1iEGwFv9utAqZCvkg7gRZEKiz6lrBjwNOJsWvg7r7mvNwQJiSKTD
         97hcW9XTYIXzOpm9xIaPRZxzll1VIApjLfWiKLaZyudDOjp7YZocwUpsqMB4eCGY3hsc
         +z6TxhPx6zXrHWJ094z7xjUae+0itz3JDyE74ievl4LdiJI4gXGT1rPGMoGkEIvj3fNU
         QTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781856539; x=1782461339;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I3WNaVa6u6+Nzfb3NV3ypwCQ74H2NIZsFLsn4sFU7yo=;
        b=CAvcTJs5ZMQZseCLc6r2psHBWsIx9lZYpk6Ou2us9oCYgw11ukXvIsLi2GUZXId0bo
         mykg9Q4OXOqUUkKaCT6zsq9rtLHyz4m4Y0zeNTkX5rVqA2WW5av3eu3uNsGqq7LnDyaC
         3Lyj5x0fKycPJtJ81EKYVU0HkRmhg6qvkhdPSyaIA/riGwaTi469g8xGjCNEef8oYKQ5
         dsJZR5brwx+v1x7WwSOtyRnHWq/kGPONRuPaTsiBa++vGy/6MevENYavJc4mboa7788N
         tGihp1/9730D/D5XdW1dsWqsPjc3JBcx1wJL9rmzmbMoe/XeFsJKN54Cc7fwjNHNhbvm
         iyFg==
X-Forwarded-Encrypted: i=1; AFNElJ9eOIfwQmM2/n0+/gy6DXr05IQoHEoYcmJLbhC3azLn7pyPAnl8LMxtLD40zHghHpAnnPd7lUXdDZJJMPqpoEGc@lists.infradead.org
X-Gm-Message-State: AOJu0YwJngHJDR7UyOgt5iYG5tdhCtsc4eeKGumJbyCk4aPlUFOffGbZ
	somWutOdL+oOq5sijRTVH3ffqgbojVI0szS3P8e+3Ei3bDMhUgsBzfI5Zg2M8Vzl8d4=
X-Gm-Gg: AfdE7clkxZqNf/GoKLzHDZBZGutUDln5D9C4Rx+TffWAP5T4iGeaMn/yz86X4QExVRG
	yIRj8zGMl8s3OMLPOW8O4K1saU5T9qlgMWy/L6DMYWHo92Z/KnoOfu+RbKsBcdvBZKzfzteZddf
	hMrfYYhFCjv9QfyJMQ9nZOOpoiLTpLVUS7yva8N05o4uCAS1Rcwuv6lltxAcx07CfV8GG6YJEBG
	eMgWxff3Xuc8xfEho6GyHnlp7TAM2J7OaMC0aIC+QCpuO7FjOR0OK/wVs1Eare+uunoribtrTaD
	pg7xgyB37n3328hq3jn51+FWuw69VuH5i5ytZwjU/IqfoqNwQjEhlQ7fH4h31U9PIJnvYzruatw
	O1zZPgZndW/AkaYbB3kQCtkzMYID1jTdPISL07l0Rx1/rmMFIahrqOfboBrWiGtOJiGOVYNtQr4
	n7ruczoUdsMmRxsHwS5F5QmQ==
X-Received: by 2002:a5d:5342:0:b0:461:946f:9bb4 with SMTP id ffacd0b85a97d-465097867ddmr3541283f8f.23.1781856538850;
        Fri, 19 Jun 2026 01:08:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:95ed:eac1:5731:4e21])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4650b67a33csm5299452f8f.17.2026.06.19.01.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:08:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: jian.hu@amlogic.com,  Neil Armstrong <neil.armstrong@linaro.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
In-Reply-To: <5af78bca-7c49-48b1-af8a-cfbe55ae26ba@gmail.com> (Julian Braha's
	message of "Fri, 19 Jun 2026 08:48:49 +0100")
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
	<20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
	<79b1a519-5723-4e0c-904c-b7fdf9564ee1@gmail.com>
	<1jbjd7c7ip.fsf@starbuckisacylon.baylibre.com>
	<5af78bca-7c49-48b1-af8a-cfbe55ae26ba@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 19 Jun 2026 10:08:56 +0200
Message-ID: <1jqzm3ar53.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_010901_068513_52F3FD74 
X-CRM114-Status: GOOD (  11.94  )
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

On ven. 19 juin 2026 at 08:48, Julian Braha <julianbraha@gmail.com> wrote:

> Hi Jerome,
>
> On 6/19/26 08:29, Jerome Brunet wrote:
>> No, regmap clock are directly used so this is necessary.
>> Relying on other module dependencies is not enough
>
> What do you mean it's "not enough"?
>
> Functionally, any user of COMMON_CLK_MESON_DUALDIV can also use
> COMMON_CLK_MESON_REGMAP.

This driver directly use regmap clocks. This is a direct dependency,
required for the build and stated as such. If the module needs it, it
depends on it, simply.

Relying on indirect dependencies is incorrect and fragile.
If those dependencies ever change, the build breaks for no obvious reason.

>
> Unless you mean for documentation purposes?
>
> - Julian Braha

-- 
Jerome

