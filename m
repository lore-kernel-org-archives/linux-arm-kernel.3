Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3440D216B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 16:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1NBivu5UEBkQBIeFnHZjPjnHfogcWbiZIn2200JwTs=; b=GsFXZ1itoW68nDgSmxPhXOhjF9
	0h13UNhrZpSjwdKV5pJeXcn+rtEdZ3MJP+3Lr/3VrYgQp4GJ0trjM61fpgAHgA2bhxfRvpLwDb2VM
	H5at+kRP8b4qfT6P6adtlI+dwqqgVlPMVPbrLTA1BnyZRMvcVVoXIDAjnsEpwgIzYQtd6ApXDYqRv
	dVIjiNImcYWAm1wT0czh/QQMCnoSidG2eGnLKcHk+5V8giMbAUKm7ywtYVNvbgq5DNK5/9OwtA365
	OFQnMzKhgxzUKbcYTyKtYu8ZConiHv0FXU1+FMbT2X3GNHMOOoYGzPphry1OpQMnUp16NolR64E89
	/SiapGQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCGh-00000008IGF-2ZQv;
	Thu, 04 Dec 2025 16:33:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCGf-00000008IFW-0JA9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 16:33:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42b53b336e6so77986f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 08:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764865999; x=1765470799; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c1NBivu5UEBkQBIeFnHZjPjnHfogcWbiZIn2200JwTs=;
        b=lwVTM2bIVnqnP8aDKKVDi8uAxsh0npNNJxUND8tnx/vkyCrqhgWb9TkjhhqlTqVJw+
         zDtaA5R8Dbv2ITXUm4WVpAjjLBp62jksyUPzteWxBtsXXXMyRZNhWxtrVT9TAWGVz9ZU
         Bqm0mbe1wivkucnUo7IBcZvxT1oDPmO48spbkgKQ+H4DBkc4jKB7X8Tw96ku+b5fkAnT
         0nrKFv9Ftqf426ZN9Tu+Ozfoo3wGuoQy3mxJm3Ds6bbQG6jrpXnJw7KBPrS5yJM1NII9
         F1w1QwwRUonbTVJQMH2KSNvmUkjBx1PJURvxTMnbrWRPaCydON8fTCMOCv/CGz/qPdGu
         6xCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764865999; x=1765470799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1NBivu5UEBkQBIeFnHZjPjnHfogcWbiZIn2200JwTs=;
        b=h7Qg/5dwR3iEVNnnNXNNO5a1cYwIZV7+8/fDPGwBPmGSooVfj4/k5RsQJxCsNAuFBa
         BdmntpjRU156DSrmCbcFlIZvb1D+pwO/ezw1l8xNb1b4P8x7hPgRCRzyGrhNfRDdMJ2F
         qUarPs3EHzvQsWxCQq2dXvoxZxMJeeGwwiWMLDmwqU4Xx1lORb8iM7VzBPpJDxv3WUoA
         I+Cfm8D6I5ikBbiX7ILO0egO9xfx8e4S3y+SPIk3QQU404PL4+6AkajH0XzIWGZG6UyD
         Hx4oUToyZritWTKMbre0kvcv+UG3j3/9HEtpyGv1X7K3rdz5yJMg6DHxkZFmcIAwDq+k
         Bg/g==
X-Forwarded-Encrypted: i=1; AJvYcCV4JsSkkWCBViyD5m33XYF0U4gpJDCYBSXsENDEbgsfD+YRNsWTRsymm6iHX9l3W033OYfrthEoquJMogrC+PZY@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh5F9undGczMu2PSwymYgHx6InABSvbr3WrOw8KIhbDCIluju7
	m6MKx1eptT77GQaI3ttWdPXeEk/9zff7UysPMo4wCu8JFnpQCBTsA0nd
X-Gm-Gg: ASbGncvjPOXa1z8PaepaxMeaqAugmF50LLIFYHYyP/6s62Jsuamr659KExsGMiAWxbX
	qFY4lQ9B9pzrNwQ5wt2pFhp0pXmi3lv0+marJTYgYPejtrUloAiWydRV0XPLp/ISGumJ2alf5hX
	hw2+uFeZxycjW8rdgGUiI7aCTUjCPLIP72fhDz0b/coAAI7rZHynQFmukQSJuJU+YKC/O5xlnl8
	KBO/Z3JyWWMDNndxbSUacZlcgY//K9nYCGmPzdmtb/TTCCGDBILVn5aVzRZVRy8S2jUxJ9rwQFP
	F1kdUzYGFneeFMdABCjt7rAJ66qMixN9krljvHbJiC0B/s1axim+lND4RS1329VLGDQFIjZsEPr
	ES6HIkz7YkmQ+OU+ZWnmpq0vQ9m0QSJVoZyWVbAYrgmz71Mt0V2ZcMpNIAMXqsM90fHpHtRp/wp
	r0iyk=
X-Google-Smtp-Source: AGHT+IGi6I2IgodSmUy9udv2+I0uezI+6X0NoB7sgQPDd5BV4p/ONZs+5KGeEu5OGTX5yIqBwOwJzw==
X-Received: by 2002:a05:6000:18a3:b0:429:c711:22b5 with SMTP id ffacd0b85a97d-42f73177864mr3997507f8f.1.1764865998607;
        Thu, 04 Dec 2025 08:33:18 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:dbb2:245d:2cf5:21d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f8bsm4099038f8f.43.2025.12.04.08.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:33:17 -0800 (PST)
Date: Thu, 4 Dec 2025 18:33:15 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>,
	Frank Wunderlich <frankwu@gmx.de>, Chen Minqiang <ptpt52@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <20251204163315.rlc36k72cwfdyye6@skbuf>
References: <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
 <20251130080731.ty2dlxaypxvodxiw@skbuf>
 <3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch>
 <0d85e1e6-ea75-4f20-aef1-90d446b4bfa1@kernel.org>
 <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
 <aS7Zj3AFsSp2CTNv@makrotopia.org>
 <20251204131626.upw77jncqfwxydww@skbuf>
 <7aacc2c2-50d0-4a08-9800-dc4a572dffcb@lunn.ch>
 <20251204153721.ubmxifrev4cre6ab@skbuf>
 <6344bdfd-c22c-45a1-854d-59091dfeda97@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6344bdfd-c22c-45a1-854d-59091dfeda97@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_083321_135990_9E2A41EE 
X-CRM114-Status: GOOD (  14.09  )
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

On Thu, Dec 04, 2025 at 04:52:53PM +0100, Krzysztof Kozlowski wrote:
> Yeah. BTW, you can also refer to one of my commits -
> 738455858a2d21b769f673892546cf8300c9fd78 - but also note that similar
> work later combined with much more useful change of gpio->gpiod API was
> rejected by Mark Brown on basis:
> 
> "No, the DT is supposed to be an ABI.  The point in having a domain
> specific language with a compiler is to allow device trees to be
> distributed independently of the kernel."
> 
> https://lore.kernel.org/all/9942c3a9-51d1-4161-8871-f6ec696cb4db@sirena.org.uk/
> 
> What's interesting, exactly the same commit for the same file, done by
> different person (Peng), introducing the same issues without addressing
> them, was then merged by Mark:
> https://patch.msgid.link/20250324-wcd-gpiod-v2-2-773f67ce3b56@nxp.com
> (commit c2d359b4acfbe847d3edcc25d3dc4e594daf9010)
> 
> so you know... it's all relative. :)

Yeah, IDK. May we all stand by our own past statements.

