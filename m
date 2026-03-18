Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D540FFED9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 00:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3klIIEcX92zdVI267329I5bjpI/sVO4ClpefsxUOMo=; b=LheoJdzgkgeXpg8GKlN6Ep2M88
	1fZbVwe25vKvCMBRZOMYkbIvLJeutTACOqURNIY+pd6hs4YmEUdJ09VNgZlajxSpTw/nNNHCffVYv
	TpCgTLk/RdTbYtqMAd0X4iU4PRku/pRZ0R6sg84avZnXdMRPbtmrwyBWgYK3nbNT4mUgtpMRDc35M
	GX3F5dMy0yvmnxkV8+r+M3bnyvcQKX5BTE3py2BmauN+THXAhhswgQLSx6fHQLuN0tcNo/VQC4KUM
	SpQlXhK5m57a5jnC7x6/dAVwmQBkTND2KscRJuY58GwCkJ7lwrtaXbC+N8p6gxOA5y/sMIDiAoT2N
	uV9cXmPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2f1C-00000007WGQ-1WYR;
	Wed, 18 Mar 2026 00:44:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2f1A-00000007WFp-3RrR
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 00:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Z3klIIEcX92zdVI267329I5bjpI/sVO4ClpefsxUOMo=; b=nVBJ7cPk83jqeVEvV7y4u67NH1
	oT+XbkMI3ZHELYDuACgdb9I8ASDVhqBjaDb+TnJ8LwH5QLYoIG2Wj1/FY3SSdJ1UDopGlFIUwiUu2
	KtAGo8E14OnfkDQhBoiqd4N3ReCrjfbzEXbSllCRo2Hau0ALmdGQpmpediHALt/R7lsGBMWQB4U7b
	IRCjq0gflnmYEaU8eUq1TwtVr1cmaMwtLQN6WGpl7KXW5wZknjueTbHuxRBzh1voVIHj7v/GG77c5
	7QIO2eGktRseJAh/op+L0uPBwJDXcBEwGFtLYdg9m1Nftou9X+l3m5AxBHfMJPr1G1IqrIJBWIiCi
	xB97uPjw==;
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2f17-0000000ADM2-0MGm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 00:44:10 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso7610798eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 17:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1773794646; x=1774399446; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z3klIIEcX92zdVI267329I5bjpI/sVO4ClpefsxUOMo=;
        b=N1vYlWvcoC2gacgy7ie/E3hFqS+CJ4Elr6aXYdY9mcSmEdaH50WgTHBluJ+YCWQUiE
         NkxYe9pZriiesJaOgLwJWiQpwaUfrx9Ui55hU5bCyZ/vW0KtGP0/nAaJTBml1Gp04Xvn
         AVvWfSOp7wnoJMB1HbWEE0BAafuZu3SHXGrFHNHqZmBkitqu7xVJIT5IRoYCquQdxuUf
         lEaIs35mEUJx69uC3PfUGUqgMgAptng9PNJMNn3pWt3BtN4KbPkm8hkM+vP3fzNQDdMb
         aidhsIS0o+lEe3eNxPQGCotCOkViRdB0JTI1FzYLlU7z2ZfPrRz4U6+gkLyl6zjBGU/f
         Eb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773794646; x=1774399446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3klIIEcX92zdVI267329I5bjpI/sVO4ClpefsxUOMo=;
        b=kZKW17xLl7IKiwNK/DbDUT7gIbqfdAwjoO4P6Sd4Y+ypKOHgIrs2PB8GFDQfLqdm46
         aapcP9hEoIoY9pSRmqBq/XoASvQY89+pevPP5dOVmKtnGHECiL/aVHzLF+nq9Gxy1ZL6
         SOzzvZX4/zGo3WWnIBMtBvUy02Uy3/1EHtIm+zf5nORgwgJWjdMS0G6+37wCLc0ZGxgW
         9t4iaiOj/H3BPoafaD/tVDJZ4MnTd33DO7HXqL3QVaSyAyQcK8xRTBFkupPxvWZT7+WS
         yyIKl9MlZuo0XXI9XrZwHmKHL2GttiNKNpT+L1/EI6N/FK7bnibYl6uKP3U/hXWSYaWx
         cRGA==
X-Forwarded-Encrypted: i=1; AJvYcCVxMvKu4/IY36EgGTYkI4oeknF4Ht8IQ3ZyFWqlFE+lSCQjZOFud2oD0pri50cBoaTIyqG1i9C79Ftlnx2lw1P7@lists.infradead.org
X-Gm-Message-State: AOJu0YysXwVEJshwKRP1gf2ENcBDDyMPAEkUV3yhPmHkzr2ESwJFASis
	i9tcK9H9pPpjepr3NB0LYt302gnEmMACMph6sO2MwFV1xcr56XBGQ/QfmU41BQmRgg==
X-Gm-Gg: ATEYQzwhZuJbUMTl2EACVthKtfd1eIwK7wfHrs3QPMB76ooGQM+Enxlbl7WtB14S0E2
	CEEMQsHrHk+oc3hoJmkUseN4rCy7Lj2UNBRz5yoJ6ngsMCyZwiw0s5YBTSFFEN7h9Aviv40sner
	JGhUQhEfRiam8AvppTk1aHgUvwbwcU+szP5eDquwp5YUbJEfuQ/5yqv3SjixLzHz/L0bqz7ayWH
	mDkYVoe6usWU/SFA3HmDcq6VMSCzZC/Vbvi8fTXZFIxxLpJogY4//7NCRTJIJTQZgcrg04y6goP
	inrK/dDH4qITjTb0GZq2G+sy0uFrKc5GDTHpeBDOu9e0yfkpOWVOTBpPCluhra5SeDajJbYz7ko
	mVEMPCThm7U0S32bQney+5IhK7QtZVwaYCM4h1xQY4+K3ER7ZC9oPJMPxgUhTkFWHim1KxZ/LSl
	mGn0bE5vyUwKdrT/Ijyn1QC5O2gqkz1/TOAc5nNSqsLCcg7MZXU4DOeRs2Bl/TlBLwLVh2KiXUH
	lZMaUpoiLxj+Alqrw==
X-Received: by 2002:a05:7300:ad2d:b0:2ba:6723:503d with SMTP id 5a478bee46e88-2c0e5193913mr637584eec.20.1773794646317;
        Tue, 17 Mar 2026 17:44:06 -0700 (PDT)
Received: from ?IPV6:2804:7f0:6980:fbfc:7d22:811:8e46:acbe? ([2804:7f0:6980:fbfc:7d22:811:8e46:acbe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55ee672sm1972724eec.28.2026.03.17.17.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 17:44:05 -0700 (PDT)
Message-ID: <c8f0883b-6000-4439-a716-4436100ffc25@pardini.net>
Date: Tue, 17 Mar 2026 21:44:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] clk: rockchip: rk3588: add I2S MCLK output gate
 clocks
To: Daniele Briguglio <hello@superkali.me>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
References: <20260316-rk3588-mclk-gate-grf-v1-0-66fb9a246718@superkali.me>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20260316-rk3588-mclk-gate-grf-v1-0-66fb9a246718@superkali.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_004409_386837_6281BC78 
X-CRM114-Status: GOOD (  12.80  )
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

On 16/03/2026 10:06, Daniele Briguglio wrote:
> On RK3588, the four I2S master clock (MCLK) outputs to external IO
> pins are gated by bits in SYS_GRF SOC_CON6 (offset 0x0318). These
> are set-to-disable gates with hiword mask semantics.
> 
> The TRM documents the reset value of these bits as 0 (gate open),
> but in practice the Rockchip firmware (BL31) may set them during
> early boot, preventing the MCLK signal from reaching external audio
> codecs. The kernel should manage these gates explicitly so that
> audio functionality does not depend on bootloader register state.

Hi Daniele,

This series fixes ES8388 audio on a board (Mekotronics R58X-Pro) which 
I've not "yet" sent to the list due to lack of time but also because 
analog audio was not working.

Without these patches, the i2s0_8ch_mclkout_to_io gate remains closed
(enable_count=0 in the clk_summary), and the codec receives no master
clock. DAPM reports all widgets as powered on and playback streams run
without errors, but the hardware produces no sound — a rather
frustrating failure mode to debug.

With the series applied and the board DTS updated to reference
I2S0_8CH_MCLKOUT_TO_IO from the codec node:

     es8388: audio-codec@10 {
         compatible = "everest,es8388", "everest,es8328";
         reg = <0x10>;
         clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
         assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
         assigned-clock-rates = <12288000>;
         ...
     };

audio playback then works correctly, tested on headphone output; thus:

Tested-by: Ricardo Pardini <ricardo@pardini.net>

Thanks a lot!

--
Regards,
Ricardo

