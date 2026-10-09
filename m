Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CF8CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 09:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vws84NjI9YU3PfHgWhqUoHAjWKtOzUf6T7B9xfFXSa0=; b=pUtO0hSB6qnirKMjWjOIzPD35D
	BOwnI2SbYQq0g4wqDCBh4VlMYgn1AbxCcunIq2G4dnK8oci/9e7OkBCSKuNYFJz4nL3WyAhCGDLOH
	qfDhdJt9Lq/u8s5lNrB8fEWsthnoU9DbVqaz9d39RkTXmpOsM3yo+Led2wKk6XVYTr3PEJMP7MJZX
	c1DfE0TisyDA8O/ZShitFVo1GFPVcepejP+UgTLdNMloySLdhvfdSk38lbVKGXD3Rm8Vd7UGHERtZ
	dvThWkeNZrEM1QHqlxaYwjv9OtRgmcVG+pUm3Jly1UgwY/l8/F7YdPhJJgMk4/X9X3k7TiZdWXtlJ
	e10poVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6nK-00000005uAJ-2Ajn;
	Fri, 09 Oct 2026 09:21:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6nI-00000005uAC-2bAA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 09:21:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 088BD43A55;
	Fri,  9 Oct 2026 09:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26D11F000FF;
	Fri,  9 Oct 2026 09:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791537695;
	bh=Vws84NjI9YU3PfHgWhqUoHAjWKtOzUf6T7B9xfFXSa0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VmjjlH79aGdW/QsxmVmMophRu8dXXy5qUwV/UWL4IhZDy0sFybByXQaexVjvCWhz3
	 4TkutIudGao6zk1wu6+qYg1d//QbKhzX4CgVqDDKR/S1K/uvNH46g8w8ucNnYqCW9A
	 wH71p7Wj4uzA7ZRbbjwUUs82FhkEdjwti3kmJ120JfhwGqYHN6zK6GkZKo+45q5XrU
	 3m35tmeTrof3Xg0VeNj3ebnvG0GEGU+4c/6nXToGK463X6e3nLuYvieNTtkt+zkO0b
	 OwHfHIXX8pwzT33pYLTF9nkAWykVLsTGtg4EloI+u0rFgakcQZ9Blfx90AB+aR/KcB
	 c4YBf0Wu/bZcg==
Message-ID: <c8e47d1d-1487-4f51-a858-cb66b5f8c808@kernel.org>
Date: Fri, 9 Oct 2026 11:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: cpm1: tsa: Fix clock leak in
 tsa_of_parse_tdms()
To: broonie@kernel.org, Wentao Liang <vulab@iscas.ac.cn>
Cc: herve.codina@bootlin.com, leoyang.li@nxp.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, qiang.zhao@nxp.com, stable@vger.kernel.org
References: <20260917152719.2160395-1-vulab@iscas.ac.cn>
 <178972077003.546774.17878987805855996127.b4-ty@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <178972077003.546774.17878987805855996127.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 18/09/2026 à 10:39, Christophe Leroy (CS GROUP) a écrit :
> 
> On Thu, 17 Sep 2026 15:27:19 +0000, Wentao Liang wrote:
>> The error cleanup loop puts l1rsync_clk and l1rclk_clk a second time
>> and never puts l1tsync_clk or l1tclk_clk, because the branches that
>> guard the transmit clocks use the receive clock field names.
>>
>> Use the matching field in each branch so every clock acquired by
>> tsa_of_parse_tdms() is released exactly once.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] soc: fsl: cpm1: tsa: Fix clock leak in tsa_of_parse_tdms()
>        commit: 7b3b0598c00e67f2df85d0b4cd99eaa3be6c9bfd
> 
> Best regards,

For your information, I folded in this patch a similar fix to 
tsa_remove() function.

Christophe

