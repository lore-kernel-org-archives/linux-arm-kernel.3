Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076FCC79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hi6xppA6IiF1VNFScxIPOX30v2qDntTfWCoxxMRGpNU=; b=c7gKMf6lrB7P8hO2/3vzQubb+C
	9SFs7BTdRenTi/Yu/L9PxVgTD8Q+hYwJ5Rd6krZ/+pmdiRYrGv/frVx4xgWC8Q9SvRlQbnw/xHscl
	aPEwlZDIl3DG7og+EYbCB19eiwv4kWacS6WonuLkIITqav5gSAJPyc67wBsADgAxryZs5FjRGm12b
	+yZev5htUF1nziAkDa2nZfTbuqigcruRoLi3Ka1V/rkHQ0Gi3eWIJa6IDeF3fE7YEvQt7TwLcDRbL
	gy4oH4TdlQCXIwcIesLM4Y06e5CjrXuVKhKDmNVdYywhj33He8NbJtJLS7Fe/b/y0uYiOr79sIWq1
	mCBAlkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckHD-0000000BOCT-19fu;
	Mon, 05 Jan 2026 13:05:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckHA-0000000BOBV-1IbW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:05:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605BdQtB3520974
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 13:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hi6xppA6IiF1VNFScxIPOX30v2qDntTfWCoxxMRGpNU=; b=XVcSIxQ630saEHyY
	0+qROzW3IL6wweWH0uTYosnIxlp9wfXX+ETURG4i2seE8sc8nShqbUzNWsjXLdYE
	sjC8/sbIzpYBYRdPJrnTP/mYF/0Lw47XS1hdXqdyreICqTaehkgmMOVeQhI2Dyfp
	qaWwLoBSWTUVzx/bLYuCgXQiijZk0h3J7ETcdkWjQJroqZaWbv6jqUSBHEGR8dRQ
	UYcWhwCrRrpwZBkMDUkJpKTDTQMSmK205q5BYmXzROsvUQX8qoKqKOEbUCovjAKw
	1pL9Vlezcr5FGJ3ooJ5Mjf265siq3YiD0sDGJaDQeB9Iux/UYUTWUz4JKubN6ixQ
	Z5tGWw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg6uu9avj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 13:05:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb6a94873so282271841cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 05:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767618334; x=1768223134; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hi6xppA6IiF1VNFScxIPOX30v2qDntTfWCoxxMRGpNU=;
        b=EAusuzOnm+4/DVs0oQSaU1bXkByDiJHRH6Rz48Udyd3xJsVmj8pSODecJWHgpOHV7K
         iK75a3jQDN2xscvQvq9MHkS8r3lO5gQjcZgEgMx6mFvZUxWD9dqdsNWQ0+5JCQCw2R02
         uY1xhCQLapSumVIP+k80+cltaZcnOZPcVMRh/c3GibsHbAdxfONql/YsOAx4jI3PJA5w
         UTjU0W50SUrtc2C16UwPEp4jAXOsTrBLl7m7UKFCWbV5tYMgvhiPgyiCT0o01OaxAMuQ
         LXQ8JQF0Y1LdyZzLrQJbm/b5RqH8OUVcptupSOx0/QB0aB3XDnsOnQ3dG12IGuvI/CXP
         hZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767618334; x=1768223134;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hi6xppA6IiF1VNFScxIPOX30v2qDntTfWCoxxMRGpNU=;
        b=GjOHcH6z2Tw6Z15T5VwCBQJZlAPTzaquBhv/qLG2/H8Lb/LF6FTwuZ4+4P5up8VB7q
         biEpZxfjPkGMcaAzRTGBXn4ybXSEEh6KDOC+obKMpYmE8mPi2HTi566tWN80lfOTCJd9
         VvLC92+Z6G+G00SGrd78KLz/klIkamgczA2WkUSqjOJ9nP1hkbRZk2EnbVJY7bm8enbi
         RT5tnYTvi2mqxB+Jxe258JqS5m7WbopRn8sJTol+8BUNQlTHB1a2gfA5fWjeIMzspel3
         HPcKXN5TRPgdOMDvub993YauRP/oru3mk9tQTF3+oU9ovMaz0rEjFUgw+f9HA1L5Z2+D
         ob9g==
X-Forwarded-Encrypted: i=1; AJvYcCUX/ae3sPhjSA0oUDOaq6L/dqlkCifphBh3D9JWlIKD/0tqzf4c94PSuQC9IhRmZPDeuDwwv4859sgnXHKw/rGu@lists.infradead.org
X-Gm-Message-State: AOJu0YwMTsrUdy1Dj1Pde2JivTA3ZDcDWSdvWQ6mXLGQPAHyJo5cnQA1
	PCq8qniTCT/wFlRWQxvhBku1JaHDh0AhrTeIhXOLPpVJZPJIYaW2wtRTcahqW42AHEvyoNEaAZc
	ApNWRGIHXSk0D8KhHw151+EWimavgPA2MxkdsRsBoAkp94Uh2lBwBJikg0f5MFmRyhU2ghdD9fb
	UeaQ==
X-Gm-Gg: AY/fxX47wxCr17IJZdqeqoc37s5O6Ung4BMgUQIgHn6GGQgUocBv8gB/PaUCep8ZTqQ
	aw68S/rvRRB6ztKPP98YGiFQm03xOQO+9WkqDP4+2epyJlUSCPjOXL3JnTITipiT1euwl4HivVg
	P93hQU+VQwsTHbopO2fUynKK+PqZTook/oWGA/EJFjX/GCWIOMOJcrA2M4HNzgEZcy4hwjyvqn+
	PLZRpfjnMoIik8kttuaYPtpo+uflsYv6Lkuoy+8HXnYFDIlo+PG/S4bkqj2jGYdrqvaoIUU2kbr
	GHmsL7VinZwACT49KYq3Dz2NA+Vr1sPpMcHGOau3ZmfiEeHNvt5mmAscxlC9qUOA2FAqb27XXwU
	ryt3PVx+fsV/S8sfnNIKiyY6OWiydufSxrFX2zQ==
X-Received: by 2002:a05:622a:1248:b0:4ec:ef62:8c81 with SMTP id d75a77b69052e-4f4abd8c6bdmr618704261cf.47.1767618333752;
        Mon, 05 Jan 2026 05:05:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfJ35pQicqQxvlPnXhffYEueekmedaX9gRCfm9VbqtSrduD7dk8BlkO3qiI9eX3HsabS60XA==
X-Received: by 2002:a05:622a:1248:b0:4ec:ef62:8c81 with SMTP id d75a77b69052e-4f4abd8c6bdmr618703671cf.47.1767618333337;
        Mon, 05 Jan 2026 05:05:33 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6be7773dsm58741995e9.8.2026.01.05.05.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 05:05:32 -0800 (PST)
Message-ID: <3ca74ed7-fe54-4ddd-b0ab-5f9eb56e6a09@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 14:05:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ata: ahci-dwc: Simplify with scoped for each OF child
 loop
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
References: <20260102125040.65256-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105105252.00003b5a@huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260105105252.00003b5a@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNSBTYWx0ZWRfXznONg0i+Gofg
 K3k7VDZIQKE94GbGmuq5rvlbKyivYoMxhwmwq/bDnpVXIUszJatFZPpDIEpLJMAJBfauUwuKWLn
 mUZnB/wfX3bLXBe+ppFtaeXXxb/zqTJtFSrs6g6MFi4WVJwbzwdDhOzo+jYfOCMQhoR/RbruPl4
 lPoF1gRdpc6z8J50ZbzVuAvoDLwHKSYu5ChqufK3CdYVG3oyjbKgJ/2CcmfJqQ7Km6GLrFCsPNq
 qtVcFyPySEYhxAYET37xbgfwW7st1i3oql353eDfBBnb1eP5BWc/De5OZv0znMnvCwS03TmIENI
 dcwHG++y255MAXxMTww9qSUpIoKHKAVke5nLZZseO8MMlOPBuUagF3MAWvqQNagiYu0fFAiwMrn
 fTlfzXG9Yki0tU/ZZxmiO8fGsCF6mV2jC+I1AKEc9gr2tmwwmX9pzDEQSIg0frPKNhJ2L0yESth
 O1W9Dm/4wFfD1UJKS3Q==
X-Authority-Analysis: v=2.4 cv=eZ8wvrEH c=1 sm=1 tr=0 ts=695bb71e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=NwBXXhG94a3s30lnhPQA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: NuU_yGUjryab3SglX7v8HjnfWWoNiSyS
X-Proofpoint-ORIG-GUID: NuU_yGUjryab3SglX7v8HjnfWWoNiSyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_050536_482922_AEAE7B35 
X-CRM114-Status: GOOD (  17.02  )
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

On 05/01/2026 11:52, Jonathan Cameron wrote:
> On Fri,  2 Jan 2026 13:50:41 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 
>> Use scoped for-each loop when iterating over device nodes to make code a
>> bit simpler.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> A whilst you are here suggestion inline to make it a bit simpler.
> 
>> ---
>>  drivers/ata/ahci_dwc.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/ata/ahci_dwc.c b/drivers/ata/ahci_dwc.c
>> index aec6d793f51a..bfd24772ee67 100644
>> --- a/drivers/ata/ahci_dwc.c
>> +++ b/drivers/ata/ahci_dwc.c
>> @@ -260,7 +260,6 @@ static void ahci_dwc_init_timer(struct ahci_host_priv *hpriv)
>>  static int ahci_dwc_init_dmacr(struct ahci_host_priv *hpriv)
>>  {
>>  	struct ahci_dwc_host_priv *dpriv = hpriv->plat_data;
>> -	struct device_node *child;
>>  	void __iomem *port_mmio;
>>  	u32 port, dmacr, ts;
>>  
>> @@ -271,14 +270,12 @@ static int ahci_dwc_init_dmacr(struct ahci_host_priv *hpriv)
>>  	 * the HBA global reset so we can freely initialize it once until the
>>  	 * next system reset.
>>  	 */
>> -	for_each_child_of_node(dpriv->pdev->dev.of_node, child) {
>> +	for_each_child_of_node_scoped(dpriv->pdev->dev.of_node, child) {
>>  		if (!of_device_is_available(child))
> 
> for_each_available_child_of_node_scoped()?

Huh, indeed I did not notice it. Thanks!



Best regards,
Krzysztof

