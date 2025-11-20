Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65148CF64AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmvv4U22KcCKpsAjuusmY8TxLc3LF2rVDF+VedfD13g=; b=x4Bb3SCJCmsI0kt8oMBN29R488
	86r4Fu/BQX9JZQfrpT5gw0t0TxfRvLo9smuYHoqU4Y0ZVmLfhih0ALcSr+hlrrSlUIgCRBdk0CzJj
	OG8vokxHQIs4ofnD2Ea/g385JUKVRnTJloISjK18w5kDqfEo8k+FEf6mT0EszJJlOwadgInIzCRs/
	CwuIVaeM56TXFb9CHgFhYOok7qY1JXRTK1icvsDuuNF0n1oJjwz1z4NOhCEpd4PbBFPEehM7oQmM4
	KE5rmk+VcfSIRjYmHqjGH4Gx0AYwnglO7ZVa7emK2OrgzXqak7VoqmjP+/Dqo1euhgFrrBOEdMuh0
	D19gH6KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1B7-00000006RgT-3R7w;
	Thu, 20 Nov 2025 09:42:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1B4-00000006RfN-2sEL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 09:42:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4pm1I3844013
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 09:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmvv4U22KcCKpsAjuusmY8TxLc3LF2rVDF+VedfD13g=; b=euxlg/KQV7qwq9ao
	hSnEp1QgwUXITPyg4MV40UIz1442kR/jN10jYxQlIAbG/8ewSI5izgQqwdPFYTMw
	dwPyU//tMYJRXcf26OWNpgh/lbTOZ52VrdUQWgPxpARTjQp5FLuKhVvIqFPKGOxb
	S0nXUH97NgT4uVKHd/vSe09zXJ6ffH2u1nfSpfKB11aWmDj1NIqFSc+GPmgW/HW2
	pbkcPucEF8+ojJPa8gwfugB01iEPEQxYh3WJi6m9EdfTfjKFA3ceFsEeoywFxCZK
	cnUiRpPOjRO0cJa4TnxXSpmtwAzINhzRWBquXcgryKfENqOmcRwNxKjEbSgrkpB1
	E4watA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahdpr3j31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 09:42:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0440a771so992971cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 01:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763631728; x=1764236528; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qmvv4U22KcCKpsAjuusmY8TxLc3LF2rVDF+VedfD13g=;
        b=GJvOY64IVZj+azmCgWy9R/hu8ZiZ13Chc2b07XnoE/k7EE6MCHTVm6VrWi/hAAbHSU
         pFhUUeFfhHOW/88K4mGEgrZ+v1oAW6kZw1VoIJ0RkNhIgXeSFgcBdBtLTrM619C46koS
         5HM2M8sIB7wbxPhJfp9mHUW3bragN7IkHTbUs7JkKGc6ZK+kql9IVsf3lpHVSu+/MRXu
         Of+kSkMPqQMzOZ3dTRYc1azuaaXKlR+V5+fxbxj7kEXNPKoI59OgJXcjKUAMlsYOTSdJ
         ejpUPx/QbWFZsxVdf1jnyTnyx7+dLOHYQItpLj0dhk+C1hE5XSFGRntZF0RBWsiNoBg7
         tTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763631728; x=1764236528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmvv4U22KcCKpsAjuusmY8TxLc3LF2rVDF+VedfD13g=;
        b=qMiJu+GJ4eyj7y79e+PrpT29WtQmrecW5NVCCzG6Di3FCdo4E8glnxv+pd7fNYem01
         hfNth3nE1rGhxDdFD5bCBe/z6lzmKbAVvyCMZHx46tI7ddr7XlpNmEF13zz21J2KHD6U
         rWqwb9XaOwiKT5fVtVnTK0gLFLOINPAZ6Vfpuh2RDMVr1edkguCGc4XzsyVuUDUqUP5J
         PT8LzhtG3N2CUjmc4xY05zmYpQrPVz/si8Qx3+HROmTAoFHI2pDdKt+W1C7hBdExKNFB
         8FwM/SOMQoTnuYsZiLQHqdhpJgqljZzcYaaitSbKRVkBgutNLQPhntwWAi6k5KlVyRTq
         b80w==
X-Forwarded-Encrypted: i=1; AJvYcCXpOSTkBR49za4bSdq97xPOS84VNKh5J/lsdUMwytAQpcxKejpfn7WlTbPzeNRWb+wp6KxW8r4VvCO19CgvHL4N@lists.infradead.org
X-Gm-Message-State: AOJu0YwJZWPjXeSCuVyV34jycK3jQxoykizQT8lxYQFhCa79vvhbu/Wj
	632PF8vs1Hs58yFErPCnPLRIv6SKl+VxxopTD2D/ZN2LVIFVKOOYc1jA/ObsKhAum0yGH1d6s+g
	7jZs4puV5mhq0nRapTVGZpsWL1M0ZEyDEkNC4b0bk1NpcA3rZiPo2TTlVcnp8TnjcxOygSO5O2I
	QWgQ==
X-Gm-Gg: ASbGncsI6Igq2xZWNiB190smS2BWfjfqq1puWiM2V1eXldkOp0qZecg/XrHqWHo7qnW
	fA6kiD1/jqe3ge806ZRvS4KUBpKGx53m5Eidgbl7yj9gXvMMR9ddaIU7A8ZMjhQt42ZH3Sfpmm/
	cBsgw8hjk9IQF4bdunbYIo2Km6GFcXCQAilMXWpURWzrz5lZB6vVywI0sJ+XMqERczj+m8FYp3F
	XSpIVyXoKCM5CdBkFHk8ZtjaIzb6SYMdfX0p1B0/HYxSeqgR+K10ub/YNNSkiPCd7EW6ny9P3Ma
	yhWhC9035WRHgTacIHQCLJpy8NVLTwv/1a+ZubihIqgpFt1tEca5yVnou+hYnXrZ38Wg9Am7z/P
	GmNMTl2qIXvyVt7Y0e9P9/a++OsyYDplGeirrOsAsYVry29r/raEKIO3+vMTJm/gW2dI=
X-Received: by 2002:ac8:5809:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ee4946ddb9mr23360451cf.4.1763631728238;
        Thu, 20 Nov 2025 01:42:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoV+9O4ZHEVJcW6VptazFPrTitDoxk6d6Ewz7I+wTr7KAcVQVGIDHM/4EdK+mcnY60jQIeJw==
X-Received: by 2002:ac8:5809:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ee4946ddb9mr23360231cf.4.1763631727776;
        Thu, 20 Nov 2025 01:42:07 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4f59sm162407366b.36.2025.11.20.01.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:42:07 -0800 (PST)
Message-ID: <b720570b-6576-41d7-a803-3d5524b685e4@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:42:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: stmmac: qcom-ethqos: add rgmii
 set/clear functions
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
 <E1vLgSU-0000000FMrL-0EZT@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1vLgSU-0000000FMrL-0EZT@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Uq5u9uwB c=1 sm=1 tr=0 ts=691ee271 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EA-HfeqjSxqo7_82F5IA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1OCBTYWx0ZWRfX/qq8Ryn0byeN
 peDDKWlbPHh0cIDxpZiYiM349Kebld5x/ZxqQog0im9WzlQICXBiBVXowWbm0dmEBSqBQi5mhrP
 OQcfSYWY90YoH81Xm+5MAdfZWbsbIeGHMwlSir6A/C2L8Xg/HETn+3RQDBRA3AsvpwXB/Yyz/mc
 1a7rDn1qYSS3MTGek9FmaJngIsJY9LJUiVEXLJCe7HuDrVYRsKKERinTnJQeBcgbbPsYjNB+dzE
 /YpP/cMVuRt9fvhSQU6sTkVWXyQHKkT4gsrjBZSWQ+k7YLAfiyqveEb9w25fUQQQAhqA/r9kUgq
 5AuBcXtW7SeT2P6Czf17VhDxOCyXcjQuhVbx9fkgtSUlihKklQJuOvP3walcbc/TZntAbb2pfRM
 lNO2k5ELwJnM9txyBPrV9kx29SRatA==
X-Proofpoint-ORIG-GUID: Ko33Fmr01eZ1NfZQpqzGTa0eVkKyx11L
X-Proofpoint-GUID: Ko33Fmr01eZ1NfZQpqzGTa0eVkKyx11L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_014210_756125_9B9B1060 
X-CRM114-Status: GOOD (  19.70  )
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

On 11/19/25 12:34 PM, Russell King (Oracle) wrote:
> The driver has a lot of bit manipulation of the RGMII registers. Add
> a pair of helpers to set bits and clear bits, converting the various
> calls to rgmii_updatel() as appropriate.
> 
> Most of the change was done via this sed script:
> 
> /rgmii_updatel/ {
> 	N
> 	/,$/N
> 	/mask, / ! {
> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)\2,\s+|rgmii_setmask(\1|
> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)0,\s+|rgmii_clrmask(\1|
> 		s|^\s+$||
> 	}
> }
> 
> and then formatting tweaked where necessary.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 187 +++++++++---------
>  1 file changed, 89 insertions(+), 98 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index ae3cf163005b..cdaf02471d3a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -137,6 +137,18 @@ static void rgmii_updatel(struct qcom_ethqos *ethqos, u32 mask, u32 val,
>  	rgmii_writel(ethqos, temp, offset);
>  }
>  
> +static void rgmii_setmask(struct qcom_ethqos *ethqos, u32 mask,
> +			  unsigned int offset)
> +{
> +	rgmii_updatel(ethqos, mask, mask, offset);
> +}

It's almost unbelieveable there's no set/clr/rmw generics for
readl and friends

[...]
>  	/* Set DLL_EN */
> -	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_EN,
> -		      SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
> +	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN,  SDCC_HC_REG_DLL_CONFIG);

double space

[...]

>  	/* Select RGMII, write 0 to interface select */
> -	rgmii_updatel(ethqos, RGMII_CONFIG_INTF_SEL,
> -		      0, RGMII_IO_MACRO_CONFIG);
> +	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL,  RGMII_IO_MACRO_CONFIG);

and here

Everything else looks in tact

Konrad

