Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31BEC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 11:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4BHIBQDpVCDnxW3z5qFHjIyyfVS94sVV08f576JMEY=; b=ZZ6wNRnbPa1xEYLygyof418aV0
	gmSBmFyLIO9/YhsKJd64Qu3dyktWKrJSyMU655WQh3qGPmKoHGQNAF73nu6wIjPO9i+3ZqxizD5ti
	fSag8cRaUBaFLjvMt1w7P0Rq2fIA9lJkGCz3tGIyWBrN1PKbinksdMobxjh7yo0tfhqeuv55WoPhe
	4KUX09+EAeMQmgo0vbiUYkh7yuNME7WsQ8SRxbAg9/7A4ua4agAFhC4rWDIeofEHZsKWf6EQAhmdJ
	dkRWcGkbuXdmjLG9FAikjE0m4yBpZ7iHJYmTJGUTp8R4GA0D9+a0IkvO7QRC8v/D4OLGyWNZYueNK
	TpRCer4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzr8-00000000XPJ-2yRC;
	Thu, 08 May 2025 11:56:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzpB-00000000X9C-18jd;
	Thu, 08 May 2025 11:54:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDE1E5C6289;
	Thu,  8 May 2025 11:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59FAC4CEE7;
	Thu,  8 May 2025 11:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746705239;
	bh=ATEwHpgNA6jqamANm5hBaVYVO/dqwcBSYhIXw4FvfOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u3RM5ALrqSnfQa5HbX8moNUhsGOjpcfcy5lA4yc+FmPmsGqzLmElL/eAXgP9r3k4z
	 Rubst2i6+x9slEhbAguGyXaZli1sn8YNW9zPw/tkLfr0VxTPxXrs0xw5aVF4MuYEU5
	 8G+QnU8r6onc00RyOW9QjHHiFEixVWTv1v6mq7xZ5ebwt1wKaKrtGNQLCvNYAc46GM
	 1zq5g44NCqS0dgYhh/RiFgTRvIusk2uUIu0bQQ+x+2s76kyWmK5lP8frGn1KXt+kCA
	 MB97EmoRnKLis9eJd4gykwNx9AIuZNcMEBnm/HnLDZW+7EHGFsCIMgd1F6A2NNxKLD
	 ZBirUqSL+XuXg==
Date: Thu, 8 May 2025 13:53:53 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, heiko@sntech.de,
	manivannan.sadhasivam@linaro.org, yue.wang@amlogic.com,
	neil.armstrong@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 3/3] PCI: aardvark: Remove redundant MPS configuration
Message-ID: <aBybUYYhrmlOeLAj@ryzen>
References: <20250506173439.292460-1-18255117159@163.com>
 <20250506173439.292460-4-18255117159@163.com>
 <20250506174110.63ayeqc4scmwjj6e@pali>
 <8a6adc24-5f40-4f22-9842-b211e1ef5008@163.com>
 <ff6abbf6-e464-4929-96e6-16e43c62db06@163.com>
 <20250507163620.53v5djmhj3ywrge2@pali>
 <b364eed2-047d-4c74-9f30-45291305bc4b@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b364eed2-047d-4c74-9f30-45291305bc4b@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_045401_361728_602F42E2 
X-CRM114-Status: GOOD (  17.10  )
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

Hello Hans,

On Thu, May 08, 2025 at 12:47:12AM +0800, Hans Zhang wrote:
> On 2025/5/8 00:36, Pali Rohár wrote:
> > 
> > Sorry, but I stopped doing any testing of the aardvark driver with the
> > mainline kernel after PCI maintainers stopped taking fixes for the
> > driver and stopped responding.
> > 
> > I'm not going to debug same issues again, which I have analyzed,
> > prepared fixes, sent patches and see no progress there.
> > 
> > Seems that there is a status quo, and I'm not going to change it.
> 
> Dear Niklas,
> 
> Do you have any opinion on Pali's reply? Should patch 3/3 be discarded?

While I do have an opinion, I'm not going to share it on a public mailing
list :)

With regards to your patch 3/3, I think that your patch looks fine, but if
the driver maintainer does not want the cleanup for >reasons*, that is totally
fine with me. However, I'm not a PCI maintainer, so my opinion does not really
matter. It's the PCI maintainers that decide.


Kind regards,
Niklas

