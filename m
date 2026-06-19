Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5101DCD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6R+gu+o5IzsxtPriiBLelNCO8cHEeri4kwg6Cqk+r4=; b=jvebeAvGbw3Twmlua0HrEgfM4Z
	vvvFBdLkUC8zNOvOIi0bZ+7lFQdPmFHvOUS0RDyyr7FjVyl6BMgqbXLAMlTnGM2eNX3LXGK8EZeCP
	oBvAyCahg2bhNOABek+9ABWW2iL07/mk2uLTcWUWv2DslEcnm2GeaAaswhIJt2eCJyiJy2PV7d3uT
	346PiOO+48zyYcJaLioiNZyUITUghXmR4ZXWcMjPcjz0hpPEnT9grQIBlfsw1lWaRDPgh6ov+O6t+
	J4ItsmR+7POorQQ56VtUrpsQxX21lMj+T29Wd72X0CditIBcf7JwmCtLlZBp2RV+lbDsoGfmgk7Rb
	wH1MykaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTyE-000000027sl-3Rc7;
	Fri, 19 Jun 2026 07:48:58 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTyA-000000027rT-2jEq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:48:56 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1055311f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781855333; x=1782460133; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=I6R+gu+o5IzsxtPriiBLelNCO8cHEeri4kwg6Cqk+r4=;
        b=AlMs7twMMvlI7GxjP2q8UtGaqTycz26hSJB6Wg6LcUBM6lcF8BVWAHqBLlNTzslTvf
         3jtZXH95oZXjltxNwXPAGTg5X+w1ygQ6DR6/Jxlp1JABniSnEtPj5WmBwPC/pT7aZb4v
         CcEEMxvBT3Qqif+dy/qCBgXpPjCC4nNzUz3dLJU8WUGyzdzIrJy1/P2MwbyQaqXu0CR6
         bRj+cKf5nYA0nh24K4wnl0sc57ay3oPPIT+A6LxPCjlxecjgmOGB3D0dn4/IhtP6mWrn
         bu35Z8AlIJNFSM10oj0J76AOMpoEHLRxnIb4WrK0uU/SK0ibvpjWg2pMsl8sSFCbxc/4
         VT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781855333; x=1782460133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6R+gu+o5IzsxtPriiBLelNCO8cHEeri4kwg6Cqk+r4=;
        b=Qq6YzOeLPlQE/KdhVjf6kCF5Y8q66hpVT3rUiXg32nC9Zm71ff8hJQVMlfeUBuVf6Q
         PI5zNn5tG4cyiQdZUiBTw+7QqYdxz0jmXONviUCLaz+Ei925BI62EuE2NJygqVtPGPPM
         ZWw1YEScCnAE8Gsh1icLs7X46Aic5kd5scoicoRnqh8FuvsCxvnKSFLOqkJPF4r5tfJj
         fayI6gmqwkrGJVTFL2XI9MOf9T9PesUn0+K143SEHzKKdsRBAx4Iecsa/X9+VmCrWarl
         P4Jz+GTsE4DMMcqnb4ioogKdSHMZN46gsRuNzRFSP67gya8n2TK7Hc6xpSSnOJsColTC
         VUhA==
X-Forwarded-Encrypted: i=1; AFNElJ/ktM6p5Z2HZbHX6wF+QOuGW0MtFAuIzRLdznxuuX123lPKzmodZX1B3FIziPh45XbdqwxR8WPxwKA+62XvBsXd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4sol7eyjT+Rbr4294m+fZtHPtyX74Rfqj3s7lyvA/8XuSv0eI
	bf98TS/58I0p2zjIsekTre0n/Ci650QMPabR32txIuwUrdDXhMDXHFp/h5D9ITyvZkk=
X-Gm-Gg: AfdE7clAvABBdYLdee9hPaKAYm18MXaOnbdOKwzHfVQURmSI+HBFPmJTasoxd3RAp6H
	fS0lYm46M2ewEB0JSIi4vWHYqBWyBJeCsLArfJrsGrHHvJkKN7NTmwENTpN/YRXmNtVqJgXbaEU
	VN16cu/X3w2a5vT6YNuOJCDrIKNykSyglTTNbn+clhSpivAaNRLJJg/NcZIBlyx/3FqR45DD9dD
	S86wrV70qcipjHGHckDIx9Idh1kGN9Gj4GwTQ1fso6J3cyLsbWQDXct739v9RV1yiJ8/1q+GJ7X
	Jiqe7BR5KpBXD02TTfr8swmNSkolqUFswBLbqVYc5yKalVW9ps1FKe1sw5xP2I93tAYWy4od5kD
	k3T3D/QSy/bLny3JQYSQCAVhnUcuGrEXEiTzJRkQc0bKAI3iv+l2dXlEOfB8yP4tzvq+sZ1Ozq6
	bnIDTPvDHHjUhxhuBOgm1FcHpaWwsduHIiW6YhSU1r8NK6Ccm2AtGDojnwSpNk2QF63LpmKgWmf
	425zFgUMkjsjLhYZF/YF4w=
X-Received: by 2002:a5d:6684:0:b0:43c:fc5c:a9fe with SMTP id ffacd0b85a97d-46502bb15a1mr3018694f8f.20.1781855332519;
        Fri, 19 Jun 2026 00:48:52 -0700 (PDT)
Received: from ?IPV6:2001:8a0:e962:d100:f83d:6b5c:de84:5311? ([2001:8a0:e962:d100:f83d:6b5c:de84:5311])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc41d01sm5719051f8f.25.2026.06.19.00.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 00:48:52 -0700 (PDT)
Message-ID: <5af78bca-7c49-48b1-af8a-cfbe55ae26ba@gmail.com>
Date: Fri, 19 Jun 2026 08:48:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: jian.hu@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
 <20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
 <79b1a519-5723-4e0c-904c-b7fdf9564ee1@gmail.com>
 <1jbjd7c7ip.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <1jbjd7c7ip.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_004854_692686_E647DFFA 
X-CRM114-Status: UNSURE (   7.79  )
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

Hi Jerome,

On 6/19/26 08:29, Jerome Brunet wrote:
> No, regmap clock are directly used so this is necessary.
> Relying on other module dependencies is not enough

What do you mean it's "not enough"?

Functionally, any user of COMMON_CLK_MESON_DUALDIV can also use
COMMON_CLK_MESON_REGMAP.

Unless you mean for documentation purposes?

- Julian Braha

