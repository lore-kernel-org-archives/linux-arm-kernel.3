Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BC5FF60ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3TSuB1FbI7lqYJC1uY7y+dtfsWxR+6ey/FSJ/giDGM=; b=sJZV+kKJb0rSnUf5jgUMrfajJH
	Nl1JxazjcfPLV+3b6miBmifEoJE323eWb934rTySFt4H7svEdvgm5+sztpLxck3pxt5tJ+9djCOyN
	3U14BjP9hgufk3C0wfJn17Hxg/voC7PZLq5ZYcEY6aeS65CNacs92J5xK4m6GotEB6V5uE/ltSaCc
	tDLSdT00zf+k8Ma9omEG6H6gdU8pFpneM3cZoUSv4DhSwo5CJE/S3qW29e9Z8+EyPuvupWBIRgOKN
	djH65PJc6u0TZQ/AiWMwhGzeUPnIhDMgaZP4yFn0SyWEuoBXXm3Fzf/a1l2wk2eJYcOeiLOjCDDC9
	1AzzKUkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UaQ-0000000CbwA-3ed3;
	Tue, 31 Mar 2026 08:36:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UaK-0000000Cbs9-3hzP
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 31 Mar 2026 08:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=L3TSuB1FbI7lqYJC1uY7y+dtfsWxR+6ey/FSJ/giDGM=; b=gihvkqEMf1uLvsaq2S1cBrbtqT
	kvLZ+eyKa+757xi8wbo9pEo3TjufzSf1b7uwjL0GuImNEcqp9ikRlTzLg4njeWa5UIng6EbVlFtY6
	xlVs6WhAQ8mS3lc3J5ydxHda8997qq7gELWShPhBjyoQ7KLTuX6D/Velb3XfaDQjYi9vxZeOwDY6/
	ses802/VAZY0O0nCW35OFNKlieHxXPl/XWK+ThvpF4G6KUU9CObzUxk3NFstTQ1FRpKEgqjGPttH0
	KheUv/5nQYixgvrDGH2Z46zYT0ypKV003c/TYwzjAeokRoIpIA739C9O6t/fgjfbrHj9lSICnfkHP
	A31bAE0g==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ua7-0000000FQTF-1GQB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:36:18 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b9b1ffbb9f5so649960066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 01:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774946172; cv=none;
        d=google.com; s=arc-20240605;
        b=ey4K7fF7D8sFONG4S2xyfgehGE6GXOP3cOPhyHfvHPUCmEvcna2Box6jfJya3n0QmV
         NR+EjTAKbFqt2OdTL17FqSqQ+H/Yv0hW5IjLavHwHfVy/KL0gWqT7z6Pvwsf26WDyjuJ
         aiWPBLBuQRGKubHc4SiIvxyg6UmYCbF+cKHHs8+15C0pBLtla69RxXQSICvl31FCHq/q
         s7mTEpEAe7BahSqBj9RTEfXvOkr+XcUmG2I7NuU1SG1iO5UuuTGeDmRf9hUC9tJOKiYg
         kcw5Q0obN7Xa7yfONaaXWXJbqxsVBsr3PaWVIgE4lSmy/rPYvWarPU4T8rQx1lGRbaXI
         S/jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L3TSuB1FbI7lqYJC1uY7y+dtfsWxR+6ey/FSJ/giDGM=;
        fh=5duArV+d9FwaH1LOaiIYqBcD7TilqshejSDtfTyK82s=;
        b=c3clgK4qwIzFnbXy+bQ1QT8YteBwiwXOCCPqVRRTzBsQrgbaJrjAJ9scY19jkUtqBm
         1ZMG+bx46PPNRWiVdTHkrc4q0wS8iZ9UmdCz2THEW65Sl8jlEJgw6duIAqg+06NLh+xQ
         GQ13dAirkR9ozTEToDVMZxHo0NqgB4s27aY3PkxfzJkqn5IKE1o5eo7LTsbutDLoX9+e
         23ynwRAO1iFu+uRYKvp1gQpLDmpy+3uPtuFhmcCkYf6qYlZrcfkhbzefni4DlHbXcFTN
         LYhYT9vyFb+UU72yL/uPoyP2v4/0eaQa12IDeUowSy7ItED2cWwq6x8PendmeLOYkyPB
         3EBA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774946172; x=1775550972; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L3TSuB1FbI7lqYJC1uY7y+dtfsWxR+6ey/FSJ/giDGM=;
        b=K7rIfC/jyOR6qvEEH0xtGp3DPaf5osEmIC53ryprOGXdJwn91oXizrqv4A50rzy0Vj
         VM7S8Z34qngrJWUC7R93HanaAhM2rYrLqe6ZC3JUjH/vF0caFqP8nmvI2m/qZQdXEfsJ
         vUJdfZC0/wTCQsoqbeGE1P+NcY+QJJIBNLuv4V/wUF+7d4i0cyA+OcSOXSbcst8H6FFl
         u/rTALmvDury4fhywAo0ItmQcP+7RJZEtlyoWg2sb+fAruFj57WMKpR4LAeQ1IbVSpol
         8tBvlYdGAgNsQmkXftlJ+KbNTXYUdbZJi5l1302bHuhVssP20vC4fcSkafwecHqmXd1d
         mJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774946172; x=1775550972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3TSuB1FbI7lqYJC1uY7y+dtfsWxR+6ey/FSJ/giDGM=;
        b=DC/HQ96nd+Ke6kx8NVv5kfPGJAgNpgOKIeMgtxtiGoPdyleDl70467+w7ZzkltyzJ4
         6uruKSiEtyy8LXNvUezz8baRWCFBVwUgLPTjspzRXrxDCfyabYu0JJyOU0l2mwz4GSuw
         33lJEmRS60/hk8gGUxXgMyyWdWk2HGcB+rlUNwRL7B23ecu0P8x2ptCTEolnO7aqARh9
         0S65JZM8rZY6cilczoGRRDKwzxT6cvitS29Zy/BJnL7XI/lzEdQaFLDsWelmbf/208pc
         aLlXhyIR4cV92vme7UGqhrSsdAQ8Jsrgv5ZSlFOn92OpirpnCoeR0Kd31kT2MDquCYZq
         D9Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXshnQNubzozd+6o6PTCh91jcst/cn5ipSAqLsDQjS14BQssqA0YFFFRAeVpFjksFeLjgnixTAGfeSx4VK2fxX/@lists.infradead.org
X-Gm-Message-State: AOJu0YwRX5kMFHjWJGlqmvGuQkTlXu1D+UPaSS/vF2vgtRC6l/4tgpIe
	/e0IXOXNdLS6Bt5qNhRA/aOoINZ5B0iBnInTgrOOi5/mAIAu4f+N2PAscLGqpSoA0N1jFbhySC3
	0Ar4Mn44RRiEydDL8aSKY6EInevRJh6k=
X-Gm-Gg: ATEYQzwtauri5SnITei4KAzcHg24xOaD9vJDhZS4eS26mTb8ie9OKlOKvuPlj6dWSRv
	uUVcoq8WdCK55EAkjPKDzjGoRePRm8o8HscBKFjZ0mCtqiudxOToL8rKy1yi+BLyhdhPdo2xAdf
	dRjPoFEgdXHqf/1bxO7p9/CBDKfjFt1/0tYh7wiZFGrClqelWljks46UG7xUIIx0rizwU3Q4/Nk
	sDvtgJneDFTF0UQjLxNQ/pWUzmXAFkicq5huJtVfaeUCuBF8GkItq7Bq2lvxxT2f1iud4gj+uYt
	beMVEA==
X-Received: by 2002:a17:907:da7:b0:b9b:fa57:d5b2 with SMTP id
 a640c23a62f3a-b9bfa57d98amr71812766b.42.1774946171488; Tue, 31 Mar 2026
 01:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260330083429.359819-1-l.scorcia@gmail.com> <20260330083429.359819-2-l.scorcia@gmail.com>
 <20260331-flawless-bronze-lorikeet-59a6ff@quoll>
In-Reply-To: <20260331-flawless-bronze-lorikeet-59a6ff@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 31 Mar 2026 10:36:00 +0200
X-Gm-Features: AQROBzCHGHvki3QPtgYv0FgcoeVoJGVuIm0WEFEat61ZeqaJ2itNlZb_JB2hAws
Message-ID: <CAORyz2+1bc9Z-opoNqyUU_WFzyXZKGQmR_Ur=4UonOC=AWtQ8w@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_093616_814438_F44924DA 
X-CRM114-Status: GOOD (  12.77  )
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

> > -    required:
> > -      - compatible
>
> Not really, this affects existing ABI and might make the child schema
> being applied. Basically regulators node can be anything now.
>
> This is definitely not a binding we want. The syntax for parent schema
> when listing only compatibles is requiring this compatible. You cannot
> have here whatever empty node.

Hi, it felt quite strange to me too, but that's what I thought you
meant with your previous suggestion [1].
To keep the required attribute I would be happy to reintroduce the
compatible here, in the regulator schema and the pmic dtsi.

Before I do that and resubmit, could you please help me understand
what you meant before?

Thank you!

[1] https://lists.infradead.org/pipermail/linux-mediatek/2026-March/105060.html
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

