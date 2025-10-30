Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29684CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smYwHmNh+57aWsOvyq4jjr8shuV36p0KhLpGubvmvxY=; b=nTysjAVkSvICqXVsCBngcb+AuT
	HoNmsxv4Vtn+GhbSyhfiUg6wDEWOrpigRCL3FUCRZ9Hhak5L5xU5FWKOaH9ZyWmJSmOBGbILSHI+j
	qauMBZYt78Im+y/8xlv5YbGdkwu3CBSU446P0LmDL0oorZoyfM7c5gDi6L6CE3XYlFhrIKkuPTPSK
	8T1Ly+Y+a48luC/NFJgrGzRQsMX2idxNd1ZyKH2D0462PPpaWMI8VLU6/mL+EiIl5prRifzwHnN1Y
	GHo5rVM0ed6MRQ5TpVCpJLn75Xg5+vdcOmJBPUM3C0I1sS3SbIoB/u6DHtjASxxvt6THeGABmcckG
	bziEC5dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESOW-00000004BCS-3nUX;
	Thu, 30 Oct 2025 13:08:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESOV-00000004BBz-0Ti6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:08:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9PJXK3509310
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 13:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smYwHmNh+57aWsOvyq4jjr8shuV36p0KhLpGubvmvxY=; b=bhNYdDblWuBJxjD2
	mL3qoZCyJ+T442aZtMFZeKLyjL1brsyd+kgrVcdTuCxi6kTz/mVm3sfgOWja9qsx
	bhXzmS/GuwcopzoczHF6ETNUOu5sYE0HSZNCYqdg6JLjTRUZIjvqREnmi2UgcanI
	QxWvkkKmvUe6MfTKYPNxKl0XYWPxxp2bxxJ0rrr9BBmg0ZB97cacltYlyhxYp4rD
	1pOkYutpydNYGIApCeJYOA0O9pd9eR33D+i3YbHN4coAmwp6wnR0gMPn3OfUjMv6
	1LkNxfeIMqj3XbLynfMP33wzuoVdUtrW224QpUZNJbCllU2eV5+gKXYuwaWiYGm3
	H4PsWg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45cdgksv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 13:08:46 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5dba35b9404so12922137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 06:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761829725; x=1762434525; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=smYwHmNh+57aWsOvyq4jjr8shuV36p0KhLpGubvmvxY=;
        b=UXpVMoA0BtCVIs0mvtLqknkG8duWsT0z91fD5Afet1goCqFLEdljSWfBUt9/PDoexn
         NoJ7fGAVrnfujSmXgGEtKivx/omizqzCLJ5SiVcZ8PpUB62JfZ+4e6Mvftl5+Aev4juU
         tNH4uv648LKOn+/Nz8mvRFiAwM5UQsS/OzokxFy128jVldH6S5kgIb74IAQm1Arb4Tbl
         eEusor+54p1LLg6zjVhulkSow1K/GL3H+UoaHVn/Svi0XduqmPr0HRInlLuLqy/Uq4zj
         h+j4h6G509Wjq9dsy8bjTfLhBLlbqcje3H646qi5/tROtbLz/13NB/I7G0CmHrQqaLBg
         rZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761829725; x=1762434525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smYwHmNh+57aWsOvyq4jjr8shuV36p0KhLpGubvmvxY=;
        b=FXpavLWuDO1y4YJqsTyr4PZkLeO0GQu9GFCDhkHud8ti7bRmTOE5QzGJr1gcRCeBYK
         urh2MjsyHj8zWQVjcQK3GYeS6yvnYn7/Dc7XV1OVAv5CMnEUFywdEu2gxH4Nwif1tnfw
         J+YxS3mgV28nbNxeoauJgK6LBN148J9z8nyNwMgykqCFWKkdVFURZMCkn2SrS8FMqfvq
         6mgrkeBANqO/ZreyxBn8EGTg9yykV20OmLFfdG1TsFKJ8GAbaTSpNdUlub9m/9eXy7si
         SOVBkddpCCKLrym6XLzcAwWN1u+O1E4xispoT0CJEFubAqTziq9F5mfCO/NxxmhhLpic
         IFZw==
X-Forwarded-Encrypted: i=1; AJvYcCX4AIpguCd1QC7n4gMBXQdqUHa6OG9Oer7E8+n1zAD+sv8MN56dRumWmuNwCUUlsC/V6RRPlZyZL8X3QjqamWiX@lists.infradead.org
X-Gm-Message-State: AOJu0YzzMz/WwUKTsZdUx+oEVx5M79XP0RtWaMYspIssikGH+ohsFVKL
	XLxZI2rIjB7d2RT23UFMksmo4vMlFbSYgiq4VoPdkvDP1CUCXmWwzTwTy/lhb12W60nfbj53q6b
	/coSfHpYeFel97VWhi9JMFU4PZpVpVM5mT0PVpDNx/+Zl6UzqPjyFCpDB/2Wv4M4SNRDoxHwceO
	cghA==
X-Gm-Gg: ASbGncuRQZfgR2eCB7FBad2BT8KYckTrup7kRlBbv5+7ZvHuPnjUMkAajUmYbQrxFYp
	ejqL6CsfKvtg/ZXiA0RkFXURiNwsfPhh1Onw+fayNddm9Tp9VTFvhPX2kLqdQ5onUPwSguwVs3Y
	0Emgh3OsriycNOt5QT+ecG4RZs3ZXwbc4IhyOBPhifz8uQ3/7ucGDra7mpTlAk3bJTDkhtxgo6h
	F1/KUEUx6Vu2N3EO0/PqN0WcFNQzwiD1sDo7ErCYM5aFsp604nUYQ/sybGXwqD8hreCSnHtXEKe
	iHMikJMNZWDiXSygfCVnaA4gEl9h+Y8w8lysFhkadvvsXj352tDmRsQGb1h44dvvT20+e9mTHfu
	ksaeK7nic6OZPzoIEYvE9wgDI1OctAxILVF8U+TTvnR792+w27yeTFuw3
X-Received: by 2002:a05:6102:9d0:b0:4e9:c913:2c9e with SMTP id ada2fe7eead31-5db905c1411mr1014178137.1.1761829725400;
        Thu, 30 Oct 2025 06:08:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG/lySLHsbpbMj0FnhN0zM4kCoK9rJ1GOXWXMrK4mIf1oCOtFJHCl0WzymOFvWrOCkEIsQmA==
X-Received: by 2002:a05:6102:9d0:b0:4e9:c913:2c9e with SMTP id ada2fe7eead31-5db905c1411mr1014159137.1.1761829724874;
        Thu, 30 Oct 2025 06:08:44 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef95e81sm14650483a12.21.2025.10.30.06.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 06:08:43 -0700 (PDT)
Message-ID: <bb2865b6-6c17-49e4-b18f-b9baad771830@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 14:08:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
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
 <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
 <aQNXTscqFcucETEW@shell.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aQNXTscqFcucETEW@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zmJTsXZJpdkzm94Sn4po8SIC0RdBZTOH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEwNyBTYWx0ZWRfX19fbWI+8dAsU
 FI96zK++ryB6Lxlpm0wAXKSwRgiKQJU7S0zRmiFSznVbaav0IzLtwS3OVjXxAhQey6kISFbGRUz
 BjEehbIfnQfCDn128KtgCyINlh9TI3FuRT1DdEMgqbhy5zhDevFNu/59I5ToGPTmOqjM4Scl75O
 MojDSZvpRLnBOMcT52smOH3sSX0ZMGga8vlcwRO+Zn+q1N0z4T7Q6Y6EpmAsiO70NDYfeJozaK4
 vRk91plWn7fEPQC2kP69nOm8m7CxQwy379BNSkfXOk+4V6V0kTZNuOPJX+hZ3G9vPdaqAkU+ZYx
 dBkfIkAy1S2+qI7kDHCSjhWIszBOuOutrPK8OsWHGRaRoDGc8Pbbh83FJUiVmCbp+9qKWatvHxp
 2zrerLjGfp/HASKD1yKQxhLe0HFdIA==
X-Proofpoint-ORIG-GUID: zmJTsXZJpdkzm94Sn4po8SIC0RdBZTOH
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=6903635e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=lI0Jfkxq0giiNmayhAwA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_060847_183505_335882D3 
X-CRM114-Status: GOOD (  17.09  )
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

On 10/30/25 1:17 PM, Russell King (Oracle) wrote:
> Konrad, Ayaan,
> 
> Can you shed any light on the manipulation of the RGMII_IO_MACRO_CONFIG
> and RGMII_IO_MACRO_CONFIG2 registers in ethqos_configure_sgmii()?
> 
> Specifically:
> - why would RGMII_CONFIG2_RGMII_CLK_SEL_CFG be set for 2.5G and 1G
>   speeds, but never be cleared for any other speed?

BIT(16) - "enable to transmit delayed clock in RGMII 100/10 ID Mode"

> - why is RGMII_CONFIG_SGMII_CLK_DVDR set to SGMII_10M_RX_CLK_DVDR
>   for 10M, but never set to any other value for other speeds?

[18:10] - In short, it configures a divider. The expected value is 0x13
for 10 Mbps / RMII mode

which seems to have been problematic given:

https://lore.kernel.org/all/20231212092208.22393-1-quic_snehshah@quicinc.com/

But it didn't say what hardware had this issue.. whether it concerns a
specific SoC or all of them..

A programming guide mentions the new 0x31 value for 10 Mbps in a
SoC-common paragraph so I suppose it's indeed better-er.. Perhaps issues
could arise if you switch back to a faster mode?
> To me, this code looks very suspicious.
> 
> If you have time, please test with a connection capable of 1000BASE-T,
> 100BASE-TX and 10BASE-T, modifying the advertisement to make it
> negotiate each of these, and checking that packet transfer is still
> possible.

No HW with an ethernet port at hand, sorry

Konrad

