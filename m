Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05428CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfgvK0qoJ/yilK5+D1Thedz4qLh3Dst8vs6/FyRnv2g=; b=U8HKul49BxrOg0CaswE/vrjxQS
	loyufKtiVlSSMagwZD5Ldjdtu13qLjtdSDdvElTxpObsyPoFKoa2UVcsoGI06z3WBGHtdj746ad3m
	k4A5IUvjmM7ICvAnal1lO9X1Uww2fdDUny3+ZoR7CtOk/Tlsh6bMHIVWt4DuLG/elKhi5FmYv1gFQ
	cJtdkhdlVQd62WzUhaqzWnWL0t/fNL6yz6pmVIIb9yySIcr06cI7B3s7m6Yo/iACGGE5ZUi9mwDAA
	2YAEUyKhHMBbdqnX34UhGMoR0hFjQRD/BtTURDvFCzJpkFHJNtCdKxJ7FcvJIz0vfU2wcpVUpud5K
	L3r+UulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSb-00000002he1-0ZOw;
	Fri, 16 Oct 2026 10:46:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSV-00000002hao-1F0f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:46:44 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48de72fc832so1079606f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147601; x=1792752401; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GfgvK0qoJ/yilK5+D1Thedz4qLh3Dst8vs6/FyRnv2g=;
        b=XjoAv+JJZfn2Cer9ijEHnJnfVsYxTtLgvNQJU501qo3MCrooYhLMpBTcDvyGc+qk9b
         /l4IZ9ujVVR6MaQd6EjUrVJ5a/XyjeX421pJOcG7QWLlkruHfm1JZDAt065wb/AvosiV
         tLHQkxGVx46bsxlthDp6QV+7C7AfZXMe9LCllItlVu9P1WjHwl197cAAX9wU096eK0wE
         ID7/xOHNvO2r8nMP8BuqIefdeFb8sBUBF0/ugtf6F5V7QRLIUvbaWi16I+YLBr7yLM4O
         Yy/mc3rn8q3+2/HkmfKDdBNhZtMZ+6PZwQj91g4znc+ZMkJJB2V/Vo8/7FiXcXcrkk5g
         ph/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147601; x=1792752401;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GfgvK0qoJ/yilK5+D1Thedz4qLh3Dst8vs6/FyRnv2g=;
        b=bOxbWKWH5oHB9XyJLL/JOFrkEGjxRvqN5vcOGobg1RJXsX1kv+WpwMTwaaLWjm4Gaq
         8fq0HoqLFGpBabGcu+NeRSkyRwzHxQX6kBY2O8woFdazrH9aPBRn63fHVt05/ZzfjZna
         6NzFSJ+KSZqOlOWexktA6Hset7KlP05dUexA8rD16Anm+22Ogg4fG9PWvpxcPEClu0Ou
         khtBB/55eJSMEnu2MNhxgXsRi1avAQIdYperKVNPM2AJc0Pf9lJQL+KNGa/ddSqZkhXZ
         Wi2x8VWdpy3YPv0SuL3caCuW80SW0avkGTxUhdDj1aK4k1KKFMNgm2ayVFVtOXU/irT2
         2nyA==
X-Forwarded-Encrypted: i=1; AKwUvBwPnffQTi2uPlVoRWybFrGnPvnSS24btR9LmT90xTB1GJcgx2Y8zWkcJGYy8mGkncEdLH81gNxxNF5rQizTepBJ@lists.infradead.org
X-Gm-Message-State: AFq9FYIEtxkJm+5kqt+/3hMppGptOoViYeeYxxcv48OsgjGDnjCD16T9
	ggF+VpKRqdDGuUcbNrjaAPvdcMlGJxKaJOG7N7WCaP/7CF3lpP6UGMwl2Dn2Uxt7YR8=
X-Gm-Gg: AYBFou01chzwI6CkFF3gQdcPzUk1IrT7XjnJrS9MkB/JSdxGZtqBDQ7f5oJNBu6SPiH
	+wMEOUdvvb26b2luYlps6RKsw9ZRUDPnxETYzFbh/H69ECpjCJ3Hx2FTj+ixhoYqaie2nQIWsCj
	VZRMnODkE924fel3Go4mnZjT3Xfr+9Q6a+gzAP1jTXAFeq5S6R8J6sd8A5Ttz78hktb6Hj3Ka/p
	tE2ONKv1T1Jw8R7xLAwBguiF+4UfRDuSygKss68xGeknpQr7lINPelwjZYtTn1NqNJAu48MT4NP
	+2eDaYh/de7xcTP5LYto/9rmOE7KSOSsjkRZKJx8Xya3FLXxyXTKpLFWJxDgfbwYKw9ldORYSGK
	ooIpgdgygrT/jr3Iac0NaQcHHKsDV/7q7VXtCojV1mkl194MoKrHs2Vqsfnnth7EAO1u7kjJYTO
	vbyRI1l5clFYxOBVC1Xrvc5ps86/kvNKnjnxyiIiaCI83IfP1GtSbOYKssSUztM/3A8oKTyif/6
	wOSG7wfrmwqBSotrOkOJw==
X-Received: by 2002:a05:6000:46da:b0:48b:68:594a with SMTP id ffacd0b85a97d-48dbaadc11amr31443485f8f.12.1792147601426;
        Fri, 16 Oct 2026 03:46:41 -0700 (PDT)
Received: from [192.168.0.167] ([109.78.92.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5035bbsm4285475f8f.44.2026.10.16.03.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:46:40 -0700 (PDT)
Message-ID: <f9b60989-e58b-4ac1-81ca-f0d37d4143b4@linaro.org>
Date: Fri, 16 Oct 2026 11:46:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] phy: rockchip-samsung-dcphy: Move block-level
 setup to runtime resume
To: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-3-e63b49eabe2d@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261016-dcphy-rx-v1-v5-3-e63b49eabe2d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_034643_337408_55770A2B 
X-CRM114-Status: UNSURE (   8.74  )
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

On 16/10/2026 09:56, Jason Yang wrote:
> Program them from runtime resume instead, where whichever of the two
> comes up first brings the block up and a second one no longer resets it.
> This puts the BIAS writes ahead of the per-PHY reset assert, where the
> TRM's worked example has them after [1]. That is safe: neither M_RESETN
> nor S_RESETN covers the BIAS registers, and the values written are those
> registers' reset defaults.

Would you not be better off scheduling a work job when you know both 
blocks are out of suspend ?

That way you always have a known sequence out of reset ?

---
bod

