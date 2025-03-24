Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F24DC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 17:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ugip4fd8Pdklj4B/ZVd31QAyVX2ztU3G46zy5Bsha/Q=; b=2q74kMjUgnVjnb3HC3nSEBYvw5
	dpVvcmDgFuisWamOc6XHyJ2RM5PGB+C2UVHK7/9lBYbvK4B4sq3ROpxgKZEQqEnm+ktBWMEQtlAA0
	oL5UAFNJcI69fL9lGRSoLX/ukYl0bKFj5YE/esqNdLpeufLO1E1Pj4r+ig9nlXYUTuWnWJZV0gulk
	zBb9Sy4xSKUDHuphtIB9uECakKfBJaA3mxwRuovjAAcOdny3hO855ml7fpf9BTGXk/K6q7I9uaN3/
	UOQlKtHU4O1CijQH8+S0NjVs2kOsqWQHt7UZ82hObF71Un5Mi0n38S4IWXncHpbvJHkEXT6pauiv7
	a0QL9Xlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twm5C-00000003tm0-0pkH;
	Mon, 24 Mar 2025 17:59:30 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twm3S-00000003tDz-0OVO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 17:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1742838922; x=1743443722; i=markus.elfring@web.de;
	bh=Ugip4fd8Pdklj4B/ZVd31QAyVX2ztU3G46zy5Bsha/Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=R5DausesgqbnhBZ9rriIR+mzrPsczUdHyoPkP7gCpaLxbKtU0GaeSX4nK42hF+Iz
	 QFl66AscEF8xM6xdPzSd67aIUtkySqhUedJm1Wr6eoNksFtw32Ab4Levn4iZO4Uly
	 c/s6DkWtQwnHtr98OFGFm5uBnbRnfEPn4o/J5Il3qRkitiWAApeTA+1IMMhzdNG8H
	 0D0DduJ7SYcEjx6WywjIECE+B/lJEVe7G+RI8ie+sY/cTHvKCqA510Nmy385k2QPZ
	 qzBFlcDf4TcQSEN1ccMZyVcdwd7o7gqggwtqh+ShoOzX7X5DfehWqZq2l82dYrkFC
	 H6fGBEUThwwEnhFQ8Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N9cHJ-1t2Lap0xrp-018IAt; Mon, 24
 Mar 2025 18:55:22 +0100
Message-ID: <92772f63-52c9-4979-9b60-37c8320ca009@web.de>
Date: Mon, 24 Mar 2025 18:55:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] dma-engine: sun4i: Simplify error handling in probe()
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>,
 dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>
References: <20250324172026.370253-2-csokas.bence@prolan.hu>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250324172026.370253-2-csokas.bence@prolan.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SAbuJubhSHN4pH7HvyQuZsAhyfLQIhB/cY7Fku1PM7dBzzJ+znK
 KFJIy7rF7WIjRryO3MpAP0TzRJAeZLmlMou8bUAV83VJoJbg0+uOTk+MgAbaj3WwpvFH/Xu
 1ntkxxFmrGDxiek9nc4IzlE2vfQxeD8sOv0ZFEzA6AOJCD0Us5b4u8pTugFyU/PbLJ7xfMh
 cDxfSzpNuEeihAtctNcyw==
UI-OutboundReport: notjunk:1;M01:P0:Zndp+Xt2ZBc=;FT5IcWgiEDFexAVkd/U8C2waAjY
 NhEJydSVA4u8sdlQJ9/KtqhxElzLhdWlygPYw8a/dUe8nIOBZivJEwSLMpUR7yiNFq8rQGu+f
 L9eWKq/BItQMtDJA9vCzZPpgQap2eWhCPaaDybV9ctbrKntOKWkjgG56pu8V7oR9MpyU5Qnjx
 uQMS9m+9Y0N3e2FNhVmVlQw9UJiQkLydGQtBJ+vfUrBdx9AmmJFSvIfumv+HnrANvPIGtkV2U
 S71KzKgPxnAWJolLsJ87detQZoFkGl2FKIvcezcS4D8k8mVvUPL3fMV4B0NDryXnrJIRp3hrr
 jj6O9aE26iNOBy+VyTL3t4mFYyAtxqw69f6jLAXLWP4+lktAVv05W4S/Fl29ntdBNehfCD7Ii
 yyTbMkQw8tEyQghtf3f6rDom0OHJXFPnxkmISGgvwVWzzu7OBjKfzmbOsXKxZbyKkV6EbMK2T
 0LNKiPtwyRyL3KED0KX325rTswaQT1tMWs7y36nAOEPzdcUDvK94SfzDvja+UICKKguCo/Kl8
 JYQDMM0zaLJT13Js+pvyvUFbLUlHTzeQJTJJmZJAwCixYD2Gi3Op573en1TbmmDE0apkIC4uL
 9ag6yBxHRKnRoRNLVP6MBimbagbeJJHQISdqZHR4F4Op32kBrlZglxSTUmpI4q0JZDuEfCPCs
 xiLniaEz7magxGmf1GLYFvPH37iiy9nvUx33P5KWLlQI6W6IrpSPRLwNvEvdFGYd6aUldCQrW
 UH4r+jLM0ZbUTtESTFx+lua2x4feIfKy8E+AYovYXH3WCNZQs6Un8GXzpRevhR6H5GLNGyJSF
 ABLNBooS4EOaaE8xNJmnsNgJ8qcAh6KHwBUHhsCrKDj4fEloKzKNoDAOrULAEtyb8+NPqOKAW
 87g5sBduWTBH+/z/Sq3Tlu5SK0WTmhgLdFdP5woX5iEa6KuaGsH+JhmyABkoWYIt4pvZ5PJsu
 JcoZm32Z77NrVNJj0nXdl9stgqyBrAViASlUiivW+dffqkLpZs/oyc6N+9l6FrB0F80Qd2TPc
 nrzUARcymTL+dX++S5hBiewrSzJjbWOF8sCWz/sxhxW7823VrT9bjA7vq46rKScCdF8xLkeEy
 xZtaqnfs7Pzp7sAvijUWwNJfAy654Ee0K7DyEa28fXJztYnKvWlI/pTM5ZG1TmvFAuWCDHm6q
 f4CpqAdAuuw9TB3uW2M8iN0ise7i6qnFG8/VAo3LI4uZg41r0VNC18wirs58nH46HoPZw8yyR
 y4erIdlVSDlVvV2zHBxtT4QTellxRba9YLEL8SPXN2N4JKds8kuTNZ2NghR5ePD2uA94LJd2Q
 SzgaUmfJWX2GdDTykrjQ3y7yci/vhZVgfWPQIs9MMeNlycLkh6aqJJkvr+rdSVASk9xIPRU0Z
 hbYleqa1/YK1zKecOeECTpmiKPZ8F4baAMRVLtUAB8WUxxyLShlAgjNiFbFo8Y3Q/46/3v73g
 JFaAE+lOy0g0FOqUF5Clb/9sFBo5LADokelkYwS+t2SGOizY/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_105742_512927_EEB5D160 
X-CRM114-Status: UNSURE (   5.10  )
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

> Clean up error handling by using devm functions and dev_err_probe().
=E2=80=A6

Do any contributors care for a different patch granularity?
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.14#n81


Will it be clearer to mention also the function name =E2=80=9Csun4i_dma_pr=
obe=E2=80=9D
in the summary phrases?

Regards,
Markus

