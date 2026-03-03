Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5607EC1459
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 14:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laF7zermc4sdeHf1JkHzj4Z+paPpjGHceYcZO9orxLg=; b=ncklid8sngDl7XIlsUCGyWZs8T
	thJrZ0ktWxUl8zLAvqFCfVjAkMdgR6X3eydVIn2ddlxR7H/FGry0rcvBPRRzaintHk4x6wxH8ArYH
	NaeleRi5EbAFazbV59zeHaXYEprJ73G4Okl5+AvgCqEM90NHY08FtnfgAb4SFPMq6hJGa42wCnfO+
	RZZrPFhKOgoABkoKSCZVkOXT97NnADaOt1zaY/eBHXWibN0sN00e5KCh36OQixMUU2fQZPkDwzGbm
	eXA/FC/MEyDWJnTqa2s/46W8gCxtvxA0HtdWgvUo1lOBCAfxEKCK9FXU/3xyuWgiLKpYZwU2OFhws
	vfZPhk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQrF-0000000FKwp-3rWF;
	Tue, 03 Mar 2026 14:36:21 +0000
Received: from mx-relay25-hz2.antispameurope.com ([94.100.136.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQrC-0000000FKw7-0ncG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 14:36:21 +0000
ARC-Authentication-Results: i=1; mx-gate25-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=laF7zermc4sdeHf1JkHzj4Z+paPpjGHceYcZO9orxLg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772548562;
 b=kmrq8JejRODtIPkieCQ+gzDoaGgeBU7tT7yz+v8th5kRqxctctZ+HBseusws9srUPqm1ryTb
 FPoPulsIbHz8YzhXWpFhYPNLLBOvYm15nNG44vJ+X6GFsldcPu9ppgj7HE1l/gBhLXHxdrSDiLC
 tZjJupme+6k+M9st4sHGCz3ITNyr6IHqNiIzSLhk+eeR0RAUP3/C7eYbMnDWNQyuIbw/nGLp43W
 JLANgqBpUWrLDmCJNlwKxZZ871IwmK/Oy1sjImJGACciHJMREAzv/R3lR9qBc75+EDUOXPaz0Qe
 DIcdg1sW9R4OhMHKtW2NYS4B17QXkNhdyd+BD9t4A38pQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772548562;
 b=dMaAc8PKn3+HkCWkk3eRZXheEGevrrrwxSNYscAvmE8n9BM4Ehl1ynNuW62Tg6WdP4yjsz5+
 quJ+S4EYZT4zYSLqDKcu0w7LLK2Hs121RYnOw7sdmdGbuJGxGFjCrTOk/mWGK4Eic0KEYzW2a8X
 vyFFmDU68S8Or/gtJUje3QQ+SQI9AIteHIi99myvDBJc5qOUl72+/SPWwNG6+61Pw0FSJBAFZ/F
 VeqdRRBnyewPXlpP/xE9ULWFE0QXrxEMSeuE74s0ZsMHdW+UgMtlsLsVx8uS06ygQ4omoXEWUqU
 zfMxa979UluaSKeiSqWyYvvzj8meG+oSNe3uR7Cmjt3nA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay25-hz2.antispameurope.com;
 Tue, 03 Mar 2026 15:36:02 +0100
Received: from [10.123.75.134] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C66D6CC0E07;
	Tue,  3 Mar 2026 15:35:53 +0100 (CET)
Message-ID: <212cb095-43d4-472d-b09f-4ab97e0a33fb@ew.tq-group.com>
Date: Tue, 3 Mar 2026 15:35:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: tqmlx2160a: correct spelling of TQ-Systems
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260218132426.32293-1-Max.Merchel@ew.tq-group.com>
Content-Language: en-US
From: Max Merchel <max.merchel@ew.tq-group.com>
In-Reply-To: <20260218132426.32293-1-Max.Merchel@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay25-hz2.antispameurope.com with 4fQJJB2M2dzvgBK
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 4b8766b24472e039a6ad55c712e16e46
X-cloud-security: scantime:1.792
DKIM-Signature: a=rsa-sha256;
 bh=laF7zermc4sdeHf1JkHzj4Z+paPpjGHceYcZO9orxLg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772548561; v=1;
 b=WgAAZg9eK7FUK3U5FN5+d7wLJhaKktNWWDWzQj2KD40p1dLnnatCxbfTAUoQjMpprNhvwv7Q
 6p4Y+6RdN++pUgWSEjIRfxYU+ev50vPvs87TdCZpC6D7N9PHDvt9mqm96mQi64lBT+e9ndNh3V/
 IOyanAsYmeWIIhBPMOwcEbtudP30/SEcy33/n8tBi4TPbn4Oaqg5o3gv9U91aTSDP96Z1HmK/rL
 y+LXfYlgRNMt0q+0YeZWNpVNY5sl9C5DaqM0yN4T0Q+z9wzm1RyfUL3CcXHJisWsrfm66/iKjRV
 PaLP4Ht0CzcO/p0jxxhGJmdIbtXJcBaMTR7vNmiBcbN7w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_063618_385663_BF1E9A2A 
X-CRM114-Status: GOOD (  16.11  )
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


Am 18.02.26 um 14:24 schrieb Max Merchel:
> TQ-Systems is written with a hyphen. Correct the spelling.
> While at it, remove "GmbH", as the legal form of the company omitted
> in the model name of other TQ-Systems hardware as well.
> 
> Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
> ---
>   .../boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts     | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
> index f6a4f8d54301..48b23f474fbf 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
> @@ -14,7 +14,7 @@
>   #include "fsl-lx2160a-tqmlx2160a.dtsi"
>   
>   / {
> -	model = "TQ Systems GmbH MBLX2160A Starterkit";
> +	model = "TQ-Systems MBLX2160A Starterkit";
>   	compatible = "tq,lx2160a-tqmlx2160a-mblx2160a", "tq,lx2160a-tqmlx2160a",
>   		     "fsl,lx2160a";
>   

Any feedback to this?

-- 
Best regards,
Max

TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/


