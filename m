Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE90ACCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32h5K3ewwycqfrD/0JMWOprkDGOg3ozbJGj35ETznY0=; b=lvUEkT5AWf90+jIL6zyonbm+99
	kF2mT7nOg3+z3Rz+bfoWvXfC8/vOidBpKyc9w2PDPso3amEu25d1LqANyu3DtKrUy2EtmeHKM7aOE
	RngrFjKmFBUKOVr9JdXaARCFGbnaKQMus9s+IjOdagoqriGemHWygGlP83kNkHzbDE89y6TeRjjSS
	3xKxPzCCHXlyNTyYO7HpWcCH46uf42HMB03sYKoD2k74UzpzRaW3p6H8NBiUY9dF5tuceaPYVTtSw
	qarzPIxYefj3VC1myxnCiXywEIFeJoccA8HOAJJvy9hoLrRbQ6OZNVJSBoJlC8bT8jFiNRcC+u/QQ
	iH8midcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPTh-00000003vcQ-27LJ;
	Thu, 30 Oct 2025 10:01:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPTe-00000003vbz-3hXU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:01:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U50RS62624094
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 10:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32h5K3ewwycqfrD/0JMWOprkDGOg3ozbJGj35ETznY0=; b=RCRCoZgA56ns6yDd
	+yKBRhyBmEiRgH/A3pfEKSzWFhIR04h7Iz2FBrAGKfLc8PNTcxkcTOvIzbApPQnO
	zDTib+W4cS1qTj+QOlhY2vSJ3etZp+sTAEwLusnkHsPrzHDq4O1Z/pYMi79ythDq
	HtT/tGGuL+gK8LCKQW8g0luvCNoG+3ZxzKX1JCixIYksRw0511e+nmCkoUINzVe0
	fj/cqmy6hR+2cS7ZV1/an2juZI/oX1duW9iPspKJtHEbpHz18dmNN87yFf3SzUw2
	784rl2kTyWAGr9bq6ouvOMZgCqbnb8Kt/QF1esQkIyl0JK3hzK5uh+va+rxWJjwA
	qDOypA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a41fxgvbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 10:01:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eced2a52ceso2537331cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761818512; x=1762423312; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=32h5K3ewwycqfrD/0JMWOprkDGOg3ozbJGj35ETznY0=;
        b=ZYM8+Dxsi7oGEUZ6QjaQGJuEJC7/bLjfpXt+1BXU/yquJKJBOY259YnxepGRBkiw9l
         wcVRiR6Klrk7gn+2n+obHjNV20YHgVSXjd1Yn8dZdsdREtkKCJFFL9CwDlXoZBdMSuOl
         FLQShkDfqgJyctRDRiq2nhDPHJxzL7dpBCpTjbNMPHd9LeowzseL8uxpUcRyZspwXeUs
         DU22zUa7eqoxfOw1ieyN0WUeJOPWoy2ckjn/I6Wu6bVtMAMaKmZzuAPjE7AoM2WvGaXc
         eB+GSFMoXuEKb+u0Kv1xqY3+9XVbUZqsMBDPtPorYQZc6r/qlIYCwdqs4XDM7eRG76TC
         Sg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761818512; x=1762423312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32h5K3ewwycqfrD/0JMWOprkDGOg3ozbJGj35ETznY0=;
        b=BGHh7Ldjn3U85QWWMthgb2YM1VxYNmwHCGPYuw0hy1yBXDA34sgt37eMrc984XwinD
         ijpTmx50uq8dzLfYn2W9hsZtxgU6N4DqaiZp/vGagoP4lxFQCIHZxhbrL7myaDAApwC0
         /po9+WLe5AP8d5sd7tLR//a8ebcBXQ0WjwLPtsTA8hFy8CmWlSBhya6CC075S7I3ZmlH
         zLYwGOOkbz6C5QTkODcpfaMGIRQA4LYF9k944cJYnVSPquLPE2o0Qd7l86MwscQ+OJVI
         WFFpac4g90ko383FDCVY2L35k6FljpoKAKqlmRhx8Ah1lHZ5ksE4JRIifVHbn8xzkQcv
         DwcA==
X-Forwarded-Encrypted: i=1; AJvYcCU4odI2F/hd9sMHAqXGOFaf7sypMCABacet1PzHENtiTn3CBFye3nhscjAZAt+XnX6T5bV/L8/ybVJOgdDTuyvg@lists.infradead.org
X-Gm-Message-State: AOJu0YyEzVouHEw+lix6yEI9API5W10/FGNTa5GSjzjWqCV+ZJPQJNs4
	WOr7rduDID1pj0GSVx0vzU25MAOaUNWSX1BJyo5Iy2SYKUHImxJob5zbiokF0oXJnL8q43rb8ZV
	mrrURoNx8De/2A8aJtGWTORnbG6gu4wodWf0j9ZcD9ahJbG4zSd7k89HrNH/biob0fEmMPke214
	KeuA==
X-Gm-Gg: ASbGncsnAUedf9I+cW0rXDqph5kekrl+JA6G5raJc3H7RrfBUs6yauPwpx1/EOna8Vu
	1+GrWBjVQg55BY3JH0zmpIDwUEcddHWRAOnep74n30oUdxIRkQxE0pAgylAkrau9Wx6Eiu16wgg
	kRIB9ObI1BLRc7nkkoWALwkRE5wU5zuXy3RZXOSnD9njuRyCVvtJZ7qLLhe9ci5iHyLusaci/JX
	ymUUQKOB+Est5nKbsuBsVMuE3bM/5emDIYfXvGLSKO2mY9K5V7Czhck3I0yRfksYF+k4bsb6rY9
	HJjs11M3QTyxdbTDzbc0rLlVbmkAOd/gh7h6UnSkFtsc3OBIkeUgQFRK3eJtkQp59/UCRBQ9EPv
	J8pfEfBsH1LxIQM8cUyiXV74J8zwfZVSlZv+OPq/vhSBHU9A0u3yEh8GB
X-Received: by 2002:ac8:5f0e:0:b0:4ec:ed46:ab6d with SMTP id d75a77b69052e-4ed15c0e8f8mr55333741cf.9.1761818512206;
        Thu, 30 Oct 2025 03:01:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRkwzCLPCxSVHJgMpfb+sSifTWDoxG9G5XDKheZ5CxBk6Vcn9HesLaF6FBOsZzqqrVE4rY6g==
X-Received: by 2002:ac8:5f0e:0:b0:4ec:ed46:ab6d with SMTP id d75a77b69052e-4ed15c0e8f8mr55333381cf.9.1761818511580;
        Thu, 30 Oct 2025 03:01:51 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7058770e28sm164872366b.13.2025.10.30.03.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:01:51 -0700 (PDT)
Message-ID: <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 11:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OQlzn6VsiNsNkfV3rYgzoUAs4wtfDs58
X-Authority-Analysis: v=2.4 cv=UJrQ3Sfy c=1 sm=1 tr=0 ts=69033791 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YjBZYspd3xVaAZo-ivoA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: OQlzn6VsiNsNkfV3rYgzoUAs4wtfDs58
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4MSBTYWx0ZWRfX3FUBiCgEmNLA
 ADfU86dKMiJwq1n9v9R2s4gF/8gFdxq8JwBzD/QdLRpX9gwB9jPhP9xDJp9aIjbECbKVOqHJia1
 YAEeT6GL+MfXy57hju767RRdHj0Dx0+/zqJbSlWhaSnnVgAjA34HzoTZ+5K/FxGe4o3VxN9wfJ7
 g6qGy1g1+YmeWlzS8Q6P29QbvH8rZMhFiocqyPXcLYOk2yRBQ+aJvMJHLf9CsGNwc8lp4SeQd9V
 Ad/clgfhvWF883+oT6Yr15CbiASy3eRzwjnRT5xgwyajZIeMzkbo3BaeGONhQ7v4Ebw3vOL+VFo
 Y/EZhaVjj9KiobkVKU9AS5fxXQjA26xHax1gIhidPZnaABvd0mbTOf1z6+DG1u7AM0rFHPF2oQb
 dSUUR3pOT6JGt2rDUS2LJPGBgS9AMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_030155_046149_28A7322F 
X-CRM114-Status: GOOD (  16.51  )
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

On 10/29/25 11:18 AM, Russell King (Oracle) wrote:
> When operating in "SGMII" mode (Cisco SGMII or 2500BASE-X), qcom-ethqos
> modifies the MAC control register in its ethqos_configure_sgmii()
> function, which is only called from one path:
> 
> stmmac_mac_link_up()
> +- reads MAC_CTRL_REG
> +- masks out priv->hw->link.speed_mask
> +- sets bits according to speed (2500, 1000, 100, 10) from priv->hw.link.speed*
> +- ethqos_fix_mac_speed()
> |  +- qcom_ethqos_set_sgmii_loopback(false)
> |  +- ethqos_update_link_clk(speed)
> |  `- ethqos_configure(speed)
> |     `- ethqos_configure_sgmii(speed)
> |        +- reads MAC_CTRL_REG,
> |        +- configures PS/FES bits according to speed
> |        `- writes MAC_CTRL_REG as the last operation
> +- sets duplex bit(s)
> +- stmmac_mac_flow_ctrl()
> +- writes MAC_CTRL_REG if changed from original read
> ...
> 
> As can be seen, the modification of the control register that
> stmmac_mac_link_up() overwrites the changes that ethqos_fix_mac_speed()
> does to the register. This makes ethqos_configure_sgmii()'s
> modification questionable at best.
> 
> Analysing the values written, GMAC4 sets the speed bits as:
> speed_mask = GMAC_CONFIG_FES | GMAC_CONFIG_PS
> speed2500 = GMAC_CONFIG_FES                     B14=1 B15=0
> speed1000 = 0                                   B14=0 B15=0
> speed100 = GMAC_CONFIG_FES | GMAC_CONFIG_PS     B14=1 B15=1
> speed10 = GMAC_CONFIG_PS                        B14=0 B15=1
> 
> Whereas ethqos_configure_sgmii():
> 2500: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
> 1000: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
> 100: sets ETHQOS_MAC_CTRL_PORT_SEL |            B14=1 B15=1
>           ETHQOS_MAC_CTRL_SPEED_MODE
> 10: sets ETHQOS_MAC_CTRL_PORT_SEL               B14=0 B15=1
>     clears ETHQOS_MAC_CTRL_SPEED_MODE
> 
> Thus, they appear to be doing very similar, with the exception of the
> FES bit (bit 14) for 1G and 2.5G speeds.

Without any additional knowledge, the register description says:

2500: B14=1 B15=0
1000: B14=0 B15=0
 100: B14=1 B15=1
  10: B14=0 B15=1

(so the current state of this driver)

and it indeed seems to match the values set in dwmac4_setup()

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

